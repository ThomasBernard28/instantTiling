% ------------------- GENERATOR -------------------
% input : size of stack and numbers of cube to generate size(N), range for numbers range(N)
% Output : generated cube and face facts.

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

% Output
#show cube/7.
#show face/5.

% ---------------------------------------------------
