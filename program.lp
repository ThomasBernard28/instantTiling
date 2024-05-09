% Generate all possible rotations for the faces.
rotated_face(F,N,E,S,W,0) :- face(F,N,E,S,W).
rotated_face(F,W,N,E,S,90) :- face(F,N,E,S,W).
rotated_face(F,S,W,N,E,180) :- face(F,N,E,S,W).
rotated_face(F,E,S,W,N,270) :- face(F,N,E,S,W).


% Generate all possible rotation for the cubes.
% rotated_cube(C,F1,R1,F2,R2,F3,R3,F4,R4,F5,F6,RX,RY,RW)
% C is the cube identifier, F1...FN the face identifier, R1..RN the rotation of the face,
% RX is the rotation of the cube on X (left turns) and RY is the rotation of the cube on Y (down turns).
% RW is the rotation "on the face" i.e. turning the cube clockwise (movement is clockwise).

rotated_cube(C,F1,0,F2,0,F3,0,F4,0,F5,F6,0,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F1,90,F5,0,F3,270,F6,0,F4,F2,0,0,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F1,180,F4,180,F3,180,F2,180,F6,F5,0,0,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F1,270,F6,180,F3,90,F5,180,F2,F4,0,0,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F2,0,F3,0,F4,0,F1,0,F5,F6,1,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F2,90,F5,90,F4,270,F6,270,F1,F3,1,0,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F2,180,F1,180,F4,180,F3,180,F6,F5,1,0,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F2,270,F6,90,F4,90,F5,270,F3,F1,1,0,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F3,0,F4,0,F1,0,F2,0,F5,F6,2,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F3,90,F5,180,F1,270,F6,180,F2,F4,2,0,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F3,180,F2,180,F1,180,F4,180,F6,F5,2,0,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F3,270,F6,0,F1,90,F5,0,F4,F2,2,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F4,0,F1,0,F2,0,F3,0,F5,F6,3,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F4,90,F5,270,F2,270,F6,90,F3,F1,3,0,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F4,180,F3,180,F2,180,F1,180,F6,F5,3,0,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F4,270,F6,270,F2,90,F5,90,F1,F3,3,0,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F5,270,F2,270,F6,90,F4,90,F3,F1,0,1,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,0,F3,270,F6,0,F1,90,F4,F2,0,1,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,90,F4,270,F6,270,F2,90,F1,F3,0,1,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,180,F1,270,F6,180,F3,90,F2,F4,0,1,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F6,270,F2,90,F5,90,F4,270,F1,F3,0,3,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,0,F1,90,F5,0,F3,270,F4,F2,0,3,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,90,F4,90,F5,270,F2,270,F3,F1,0,3,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,180,F3,90,F5,180,F1,270,F2,F4,0,3,3) :- cube(C,F1,F2,F3,F4,F5,F6).

%In order to place the cubes on the stack
1 { cube_position(C, Pos, RX, RZ, RW) : rotated_cube(C,_,_,_,_,_,_,_,_,_,_,RX,RZ,RW) } 1 :- size(N), Pos=1..N.

% Two faces are matching if the north edge of the bottom face is equal to the south edge of the top face.
matching(F1, F2, R1, R2):- rotated_face(F1, N1, E1, S1, W1, R1), rotated_face(F2, N2, E2, S2, W2,R2), N1 = S2.

% There shouldn't be a same cube in two different positions.
:- cube_position(C,Pos1,_,_,_), cube_position(C,Pos2,_,_,_), Pos1 != Pos2.
% The shouldn't be two different cubes in the same position.
:- cube_position(C1,Pos,_,_,_), cube_position(C2,Pos,_,_,_), C1 != C2.
% There shouldn't be a same cube in two different rotations.
:- cube_position(C,Pos,RX1,RZ1,RW1), cube_position(C,Pos,RX2,RZ2,RW2), RX1 != RX2, RZ1 != RZ2, RW1 != RW2.

% If a cube C2 is above a cube C1, then there shouldn't adjacent edges between the two cubes that aren't matching.
% Here we consider the 4 visibles faces of each cubes.

% Front face
:- cube_position(C1,P1,RX1,RY1,RW1), cube_position(C2,P2,RX2,RY2,RW2), P2=P1+1, rotated_cube(C1,F1,R1,_,_,_,_,_,_,_,_,RX1,RY1,RW1),
    rotated_cube(C2,FB1,RB1,_,_,_,_,_,_,_,_,RX2,RY2,RW2), not matching(F1,FB1,R1,RB1).
% Right face
:- cube_position(C1,P1,RX1,RY1,RW1), cube_position(C2,P2,RX2,RY2,RW2), P2=P1+1, rotated_cube(C1,_,_,F2,R2,_,_,_,_,_,_,RX1,RY1,RW1),
    rotated_cube(C2,_,_,FB2,RB2,_,_,_,_,_,_,RX2,RY2,RW2), not matching(F2,FB2,R2,RB2).
% Back face
:- cube_position(C1,P1,RX1,RY1,RW1), cube_position(C2,P2,RX2,RY2,RW2), P2=P1+1, rotated_cube(C1,F1,R1,_,_,F3,R3,_,_,_,_,RX1,RY1,RW1),
    rotated_cube(C2,_,_,_,_,FB3,RB3,_,_,_,_,RX2,RY2,RW2), not matching(F3,FB3,R3,RB3).
% Left face
:- cube_position(C1,P1,RX1,RY1,RW1), cube_position(C2,P2,RX2,RY2,RW2), P2=P1+1, rotated_cube(C1,_,_,_,_,_,_,F4,R4,_,_,RX1,RY1,RW1),
    rotated_cube(C2,_,_,_,_,_,_,FB4,RB4,_,_,RX2,RY2,RW2), not matching(F4,FB4,R4,RB4).

% Compute the total number of rotations for a cube
total_rotations(Cube, Total):- cube_position(Cube,_,RX,RZ,RW), Total = RX + RZ + RW.

solution_total_rotations(SumTotal) :- SumTotal = #sum { Total, Cube : total_rotations(Cube,Total) }.

% The objective is to minimize the total number of rotations for all cubes.
#minimize { SumTotal : solution_total_rotations(SumTotal) }.


#show cube_position/5.