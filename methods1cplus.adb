--Jessica Byrd
--09/21/2019
--COSC 3319 Data Structures
--StarWars Lab01 

Package body methods1cplus is
   
   x: Integer := 1553;
   
    function promptUserForUpperBound return integer is
      userInt1 : Integer;
      
   --Get Upper & LowerBound
   Begin
      Ada.Text_IO.Put_Line("Please enter the upper bound for this array: ");
     
      Ada.Integer_Text_IO.Get(userInt1);
   
   return userInt1;
 
   End promptUserForUpperBound;
   
   function promptUserForLowerBound return Integer is
      userInt2 : Integer;
     
   Begin
      Ada.Text_IO.Put_Line("Please enter the lower bound for this array: ");
     
      Ada.Integer_Text_IO.Get(userInt2);
     
      return userInt2;
     
   End promptUserForLowerBound;
   
   function promptUserForPriority return String is
      userInt2 : Integer;
      
   Begin
      Loop
         Ada.Text_IO.Put_Line("Press 1 for Tie Fighter's Prioritization. 2 for Star Destroyers:  ");
     
         Ada.Integer_Text_IO.Get(userInt2);
     
         if userInt2 = 1
         Then
            return "Tie Fighter";
              
         elsif userInt2 = 2
         Then
            return "Star Destroyer";
            
         End If;
      End Loop;
   End promptUserForPriority;
     
   --Declarations & Initalization

   lastCharOfTieFighters : methods1cplus.lastCharOfName := lastCharOfName'first;
   lastCharOfStarDestroyers : methods1cplus.lastCharOfName := lastCharOfName'first;
   
   upperBound : Integer := promptUserForUpperBound;
   lowerBound : Integer := promptUserForLowerBound;
   
   tTop : Integer := lowerBound - 1;
   sTop : Integer := upperBound + 1;
   
   constantineRepairFacility : array (lowerBound..upperBound) of sVehicleMaintenanceRecord;
   
   numTie : Integer := 0;
   numStar : Integer := 0;
   
   --Number of vehicles rejected
   rejectedVehicles : Integer := 0;  
 
   --Make an enum for enum characters page 8 in the lab 
   --Assume there are 3 vehicles waiting for service when the facility opens.
   
   --Place their vehicles maintenance records in the appropriate stack.
   --make a step function statistically determine the type of vehicle.
   --Out of every 4 arrivals uniformly distributed 3 should be Tie Fighters
   --requiring 3 units of time for repair &
   --1 Star Destroyer requiring 7 units of time for repair.
   
  function next_float return Float is  -- sequence of random numbers.
      n : Integer;                       
      -- Large odd numbers tend to produce the best results.
  Begin
    x := x*29+37;
    n := x;
    x := x mod 1001;  --  prevent overflow
    n := n mod 101;  -- number between 0 and 100
    return float(n mod 101)/100.0; --Type Casting
  End next_float;
 
   --Random Number Generator Number of arrivals uniformly distributed
   function next_int return Integer is
      randNum: Float;
      
   Begin
      randNum := next_float;  -- 0.0 <= randNumm <= 1.0.

      if randNum <= 0.25 Then
         return 0;
      elsif randNum <= 0.5 Then
         return 1;
      elsif
         randNum <= 0.75 Then
         return 2;
      else
         return 3;
      End If;

   End next_int;
   
   --Star Destroyers Repair time is exponentially distributed
   --With a mean of 10 seconds
     function next_exp return Float is
      j: Float;
  Begin
    j:= next_float;
    if (j = 0.00000) Then 
      return 0.0;
    elsif j <= 0.1 Then
         return (((j - 0.0) * 1.04 + 0.0)* 10.0);
         
    elsif j <= 0.2 Then
         return (((j - 0.1) * 1.18 + 0.104)* 10.0);
         
    elsif j <= 0.3 Then
         return (((j - 0.2) * 1.33 + 0.222)* 10.0);
         
    elsif j <= 0.4 Then
         return (((j - 0.3) * 1.54 + 0.355)* 10.0);
         
    elsif j <= 0.5 Then
         return (((j - 0.4) * 1.81 + 0.509)* 10.0);
         
    elsif j <= 0.6 Then
         return (((j - 0.5) * 2.25 + 0.690)* 10.0);
         
    elsif j <= 0.7 Then
         return (((j - 0.6) * 2.85 + 0.915)* 10.0);
         
    elsif j <= 0.75 Then
         return  (((j - 0.70) * 3.60 + 1.2)* 10.0);
         
    elsif j <= 0.8 Then
         return  (((j - 0.75) * 4.40 + 1.38)* 10.0);
         
    elsif j <= 0.84 Then
         return  (((j - 0.8) * 5.75 + 1.60)* 10.0);
         
    elsif j <= 0.88 Then
         return  (((j - 0.84) * 7.25 + 1.83)* 10.0);
         
    elsif j <= 0.9 Then
         return  (((j - 0.88) * 9.00 + 2.12)* 10.0);
         
    elsif j <= 0.92 Then
         return  (((j - 0.90) * 11.0 + 2.30)* 10.0);
         
    elsif j <= 0.94 Then
         return  (((j - 0.92) * 14.5 + 2.52)* 10.0);
         
    elsif j <= 0.95 Then
         return  (((j - 0.94) * 18.0 + 2.81)* 10.0);
         
    elsif j <= 0.96 Then
         return  (((j - 0.95) * 21.0 + 2.99)* 10.0);
         
    elsif j <= 0.97 Then
         return  (((j - 0.96) * 30.0 + 3.20)* 10.0);
         
    elsif j <= 0.98 Then
         return  (((j - 0.97) * 40.0 + 3.50)* 10.0);
         
    elsif j <= 0.99 Then
         return  (((j - 0.98) * 70.0 + 3.90)* 10.0);
         
    elsif j <= 0.995 Then
         return  (((j - 0.99) * 140.0 + 4.60)* 10.0);
         
    elsif j <= 0.998 Then
         return  (((j - 0.995) * 300.0 + 5.30)* 10.0);
         
    elsif j <= 0.999 Then
         return  (((j - 0.998) * 800.0 + 6.20)* 10.0);
         
    else
         return  (((j - 0.9997) * 1000.0 + 8.0)*10.0);
         
    End If;
  End next_exp;

   --Determine Spaceship Type
   Procedure determineShip(x : in Integer; sVType : out String; sVName : out String;
                            tToRepair : out Duration; sTime : out Ada.Calendar.Time) is
   Begin
     
      if x >= 2
         Then
         sVType := "Tie Fighter    ";
         sVName(1..3) := "Tie";
         sVName(4) := lastCharOfTieFighters;
         sVName(5..8) := "    ";      
         tToRepair := Duration(next_int + 2);
         sTime := Ada.Calendar.Clock;
         if not(lastCharofTieFighters = 'Z')
         Then
            lastCharOfTieFighters := methods1cplus.lastCharOfName'succ(lastCharOfTieFighters);
         else
            lastCharofTieFighters := 'A';
         End If;
         
      else
         sVType := "Star Destroyer ";
         sVName(1..4) := "Star";
         sVName(5) := lastCharOfStarDestroyers;
         sVName(6..8) := "   ";
         tToRepair := Duration(next_exp);
         sTime := Ada.Calendar.Clock;  
            if not (lastCharOfStarDestroyers = 'Z')
         Then
            lastCharOfStarDestroyers := methods1cplus.lastCharOfName'succ(lastCharOfStarDestroyers);
         else
            lastCharOfStarDestroyers := 'A';
         End If;
           
      End If;
   End determineShip;
   
   --Push Procedure whole record object
   Procedure push(myRecord : in sVehicleMaintenanceRecord) is
      
   Begin
      if myRecord.vehicleType = "Star Destroyer "
      Then
         if sTop > (tTop + 1) --If there is more space left in the array
         Then
            sTop := sTop - 1; --Then making space for Star Destroyers
            constantineRepairFacility(sTop) := myRecord; --Insert Record into space
         else
            new_line;
            --Rejected
            Put_Line("Your Space Vehicle has been rejected.  This facility is full." &  
                       "You have been rerouted to the Dagaba System for repair.");
            
            --Prints rejected vehicle
            Put_Line(myRecord.vehicleName & Ada.Calendar.Formatting.Image(Ada.Calendar.Clock, False, -5));
            
            rejectedVehicles := rejectedVehicles + 1;
            
            --when 5 are rejected Put_Line num serviced
            if rejectedVehicles >= 5
            Then
               Put_Line("Num Tie Serviced: " & Integer'Image(numTie));
               Put_Line("Num Star Serviced: " & Integer'Image(numStar));
            End If;
            
            new_line;
            
            End If;
      Else
         if tTop < (sTop - 1) --Now for Tie Fighters
         Then
            tTop := tTop + 1;
            constantineRepairFacility(tTop) := myRecord;
            
         else
            new_line;
            Put_Line("Your Space Vehicle has been rejected.  This facility is full." &  
                       "You have been rerouted to the Dagaba System for repair");
            Put_Line(myRecord.vehicleName & Ada.Calendar.Formatting.Image(Ada.Calendar.Clock, False, -5));
            
            rejectedVehicles := rejectedVehicles + 1;
            
            if rejectedVehicles >= 5
            Then
               Put_Line("Num Tie Serviced: " & Integer'Image(numTie));
               Put_Line("Num Star Serviced: " & Integer'Image(numStar));
            End If;
            
            new_line;
            
         End if;
      End if;
     
   End push;
   
   --CheckTie Procedure
   Procedure checkTie(tieAvail : out Boolean; delPrior : in String) is
     
   Begin
      --Deletion Priority 
      --3seconds Tie
      if delPrior = "Tie Fighter"
      Then
         if tTop /= (lowerBound - 1)
         Then
            tieAvail := True; --Available
         else
            tieAvail := False; --Not Available
         End If;
         
      else
         --Deletion Priority
         --7seconds Star Destroyer
         if delPrior = "Star Destroyer"
         Then
            if sTop /= (UpperBound + 1)
            Then
               tieAvail := True;--Available
            else
               tieAvail := False;--Not Available
            End If;
         End If;
      End If;
            
      End checkTie;
   
   --Pop Procedure
   Procedure pop(aShip : in sVehicleMaintenanceRecord) is
     
      Rec : sVehicleMaintenanceRecord;
      
      Begin
         --Determines whether a tie fighter is prioritized or a star destroyer
         --Return sVehicleMaintenanceRecord is
         --First determine if it is a StarD or a TieF that you are popping
         --Determine if there is an underflow
      If (aShip.vehicleType = "Tie Fighter    ")
        Then
               constantineRepairFacility(tTop).finishTime := Ada.Calendar.Clock + Duration(2.0);
               Put_Line("Ship " & constantineRepairFacility(tTop).vehicleName & " is complete");
               Put_Line("Elapsed time: " & Duration'image
                        (constantineRepairFacility(tTop).finishTime - constantineRepairFacility(tTop).startTime));
            
               tTop := tTop - 1;
               numTie := numTie + 1;
            
               Put_Line("Your Tie Fighter has been maintenanced and is being shipped to the SpaceWash for cleaning.");
               Put_Line("Proceed to the SpaceWash for vehicle pickup.");

            else
               if sTop < (upperBound + 1)
               Then
                  constantineRepairFacility(sTop).finishTime := Ada.Calendar.Clock + Duration(2.0);
                  Put_Line("Ship " & constantineRepairFacility(sTop).vehicleName & " is complete");
                  Put_Line("Elapsed time: " & Duration'image
                           (constantineRepairFacility(sTop).finishTime - constantineRepairFacility(sTop).startTime));
               
                  sTop := sTop + 1;
                  numStar := numStar + 1;
               
                  Put_Line("Your Star Destroyer has been maintenanced and is being shipped to the SpaceShip Wash.");
                  Put_Line("Proceed to the SpaceWash for vehicle pickup.");

               else
                  Put_Line("There are no more vehicles to service at this time.");
                  Put_Line("Feel free to take a 30 minute break & promptly report back to this bay.");

               End If;
            End If;
        
      End pop;
      
   --End;
   
   function returnRejected return Integer is
      
   Begin
      return rejectedVehicles;
   End;
   
   --Check to see what the repair time will be 
   --Make a function that returns a type Duration and takes in a type string
   --The string passed in will either be Tie Fighter or Star Destroyer
   --If it is TF then return the array at space tTop
   --Access field is timeToRepair
   --constanineRepairFac(tTop).tToRepair
   --Else you will return the tToRepair at sTop
   function checkRepairTime(prio : in String) return sVehicleMaintenanceRecord is
      blank : sVehicleMaintenanceRecord;
      begin
      If prio = "Tie Fighter"
      Then 
         if tTop >= lowerBound
         then
            return constantineRepairFacility(tTop);
         elsif sTop <= upperBound
         then
            return constantineRepairFacility(sTop);
         else
            blank := constantineRepairFacility(sTop);
            blank.vehicleType := "               ";
            return blank;
         end if;
         
      Else
         if sTop <= upperBound
         then
            return constantineRepairFacility(sTop);
         elsif tTop >= lowerBound
         then
            return constantineRepairFacility(tTop);
         else
            blank := constantineRepairFacility(sTop);
            blank.vehicleType := "               ";
                        return blank;

         end if;
      End If;
      End checkRepairTime;

   

   
End methods1cplus;

--End of Program
