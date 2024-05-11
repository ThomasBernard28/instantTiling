% ------------------- GENERATOR -------------------
% input : size of stack and numbers of cube to generate size(N), range for numbers range(N)
% Output : generated cube and face facts.
size(1).
range(4).
% Generate cube IDs from 1 to N
cube_id(1..N) :- size(N).

% Generate face IDs (6 faces per cube, giving us 6*N face IDs)
face_id(1..6*N) :- size(N).

% Generate numbers in the range from 1 to M
number(1..M) :- range(M).

% For each cube ID, generate six faces
face_in_cube(CubeId, FaceIndex) :-
    cube_id(CubeId),
    FaceIndex = 6 * (CubeId - 1) + I,
    I = 1..6.

% Assign exactly four numbers to each face within the specified range, allowing duplicates
{ face_number(FaceId, Num) : number(Num) } = M :- face_id(FaceId), range(M).

% Create face facts
{ face(FaceId, N1, N2, N3, N4) :
    face_number(FaceId, N1), face_number(FaceId, N2),
    face_number(FaceId, N3), face_number(FaceId, N4) } = 1 :- size(N), FaceId = 1..N*6.

% Generate cube facts, linking the six face IDs to each cube
{ cube(CubeId, F1, F2, F3, F4, F5, F6) : face_in_cube(CubeId, F1), face_in_cube(CubeId, F2), face_in_cube(CubeId, F3),
    face_in_cube(CubeId, F4), face_in_cube(CubeId, F5), face_in_cube(CubeId, F6), F1 != F2, F1 != F3, F1 != F4, 
    F1 != F5, F1 != F6, F2 != F3, F2 != F4, F2 != F5, F2 != F6, F3 != F4, F3 != F5, F3 != F6, F4 != F5, F4 != F6,
    F5 != F6 } = 1 :- size(N), CubeId=1..N. 

% Ensure each face is assigned to a unique cube
:- face_in_cube(CubeId1, F), face_in_cube(CubeId2, F), CubeId1 != CubeId2.
% ----------------------------------------------------
1 { cube_position(C, Pos) : cube(C,_,_,_,_,_,_) } 1 :- size(N), Pos=1..N.

matching(F1, F2):- face(F1, N1, E1, S1, W1), face(F2, N2, E2, S2, W2), N1 = S2.

% There shouldn't be a same cube in two different positions.
:- cube_position(C,Pos1), cube_position(C,Pos2), Pos1 != Pos2.
% The shouldn't be two different cubes in the same position.
:- cube_position(C1,Pos), cube_position(C2,Pos), C1 != C2.

% Front face
:- cube_position(C1,P1), cube_position(C2,P2), P2=P1+1, cube(C1,F1,_,_,_,_,_),
    cube(C2,FB1,_,_,_,_,_), not matching(F1,FB1).
% Right face
:- cube_position(C1,P1), cube_position(C2,P2), P2=P1+1, cube(C1,_,F2,_,_,_,_),
    cube(C2,_,FB2,_,_,_,_), not matching(F2,FB2).
% Back face
:- cube_position(C1,P1), cube_position(C2,P2), P2=P1+1, cube(C1,F1,_,F3,_,_,_),
    cube(C2,_,_,FB3,_,_,_), not matching(F3,FB3).
% Left face
:- cube_position(C1,P1), cube_position(C2,P2), P2=P1+1, cube(C1,_,_,_,F4,_,_),
    cube(C2,_,_,_,FB4,_,_), not matching(F4,FB4).


% Output
#show cube/7.
#show face/5.
