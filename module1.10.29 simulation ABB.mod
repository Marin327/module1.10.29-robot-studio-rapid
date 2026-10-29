MODULE Module1

    PERS wobjdata wobj_Table := [FALSE, TRUE, "", [[0, 0, 0], [1, 0, 0, 0]], [[0, 0, 0], [1, 0, 0, 0]]];
    PERS tooldata myGripper := [TRUE, [[0, 0, 100], [1, 0, 0, 0]], [1, [0, 0, 50], [1, 0, 0, 0], 0, 0, 0]];

    CONST robtarget Target_Home := [[300, 0, 400], [0, 0, 1, 0], [0, 0, 0, 0], [9E9, 9E9, 9E9, 9E9, 9E9, 9E9]];
    CONST robtarget Target_Pick_Approach := [[300, 150, 250], [0, 0, 1, 0], [0, 0, 0, 0], [9E9, 9E9, 9E9, 9E9, 9E9, 9E9]];
    CONST robtarget Target_Pick := [[300, 150, 150], [0, 0, 1, 0], [0, 0, 0, 0], [9E9, 9E9, 9E9, 9E9, 9E9, 9E9]];
    CONST robtarget Target_Place_Approach := [[300, -150, 250], [0, 0, 1, 0], [0, 0, 0, 0], [9E9, 9E9, 9E9, 9E9, 9E9, 9E9]];
    CONST robtarget Target_Place := [[300, -150, 150], [0, 0, 1, 0], [0, 0, 0, 0], [9E9, 9E9, 9E9, 9E9, 9E9, 9E9]];

    PROC main()
        WHILE TRUE DO
            MoveJ Target_Home, v100, z50, myGripper\WObj:=wobj_Table;
            
            MoveJ Target_Pick_Approach, v100, z10, myGripper\WObj:=wobj_Table;
            MoveL Target_Pick, v50, fine, myGripper\WObj:=wobj_Table;
            
            ! Attach Part_1, myGripper; 
            WaitTime 0.5; 
            
            MoveL Target_Pick_Approach, v50, z10, myGripper\WObj:=wobj_Table;
            
            MoveJ Target_Place_Approach, v100, z10, myGripper\WObj:=wobj_Table;
            MoveL Target_Place, v50, fine, myGripper\WObj:=wobj_Table;
            
            ! Detach Part_1; 
            WaitTime 0.5; 
            
            MoveL Target_Place_Approach, v50, z10, myGripper\WObj:=wobj_Table;
            
            MoveJ Target_Home, v100, z50, myGripper\WObj:=wobj_Table;
        ENDWHILE
    ENDPROC

ENDMODULE