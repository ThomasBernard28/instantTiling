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

% Place the cubes on the stack.


% Adjacent and visible edges from two different cubes must have matching numbers.
% Ecrire une contrainte de ce type pour chaque face ?
:- size(N), cube_position(C1,P,RX1,RY1,RW1), cube_position(C2,P+1,RX2,RY2,RW2), rotated_cube(C1,F1,R1,_,_,_,_,_,_,_,_,RX1,RY1,RW1), rotated_cube(C2,FB1,RB1,_,_,_,_,_,_,_,_,RX2,RY2,RW2),
rotated_face(F1,N1,_,_,_,R1),rotated_face(FB1,_,_,S1,_,RB1), N1 != S1.

% A cube must be used at most once once.
:- cube_position(C1,P1,_,_), cube_position(C1,P2,_,_), P1 != P2.
% A cube must be in only one rotation.
:- cube_position(C1,_,R1,R3), cube_position(C1,_,R2,R4), R1 != R2, R3 != R4.
