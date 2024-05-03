% Generate all possible rotation for the cubes.
rotated_cube(C,F1,F2,F3,F4,F5,F6,0,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,F2,F6,F4,F3,F1,0,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F3,F2,F1,F4,F6,F5,0,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,F2,F5,F4,F1,F3,0,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F2,F3,F4,F1,F5,F6,1,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,F3,F6,F1,F4,F2,1,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F4,F3,F2,F1,F6,F5,1,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,F3,F5,F1,F2,F4,1,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F3,F4,F1,F2,F5,F6,2,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,F4,F6,F2,F1,F3,2,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F1,F4,F3,F2,F6,F5,2,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,F4,F5,F2,F3,F1,2,3) :- cube(C,F1,F2,F3,F4,F5,F6).

rotated_cube(C,F4,F1,F2,F3,F5,F6,3,0) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F5,F1,F6,F3,F2,F4,3,1) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F2,F1,F4,F3,F6,F5,3,2) :- cube(C,F1,F2,F3,F4,F5,F6).
rotated_cube(C,F6,F1,F5,F3,F4,F2,3,3) :- cube(C,F1,F2,F3,F4,F5,F6).

% Place the cubes on the stack.


% Adjacent and visible edges from two different cubes must have matching numbers.
:- size(N), cube_position(C1,P,RX1,RY1), cube_position(C2,P+1,RX2,RY2), rotated_cube(C1,F1,F2,F3,F4,_,_,RX1,RY1), rotated_cube(C2,FB1,FB2,FB3,FB4,_,_,RX2,RY2),
face(F1,N1,_,_
% A cube must be used at most once once.
:- cube_position(C1,P1,_,_), cube_position(C1,P2,_,_), P1 != P2.
% A cube must be in only one rotation.
:- cube_position(C1,_,R1,R3), cube_position(C1,_,R2,R4), R1 != R2, R3 != R4.
