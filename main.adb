--Jessica Byrd
--09/21/2019
--COSC 3319 Data Structures
--StarWars Lab01
with Ada.Calendar; use Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar.Time_Zones; use Ada.Calendar.Time_Zones;
with methods1cplus; use methods1cplus;


Procedure Main is
Begin
   Declare

   --Declaration & Initalization
      initialTime : Ada.Calendar.Time := Ada.Calendar.Clock;
      randInt : Integer;
      randNum : Integer;
      myShip, ship2 : methods1cplus.sVehicleMaintenanceRecord;
      timeAvailable : Ada.Calendar.Time;
      repairmenAvailable, priorityAvailable : Boolean := True;

      delayDuration : Duration := 10.0;

      priorityShip : String := promptUserForPriority;

   Begin
      for i in 1..3
      Loop
         randInt := methods1cplus.next_int;

         --Determine the type of ship randomly
         --Get type
         methods1cplus.determineShip(randInt, myShip.vehicleType, myShip.vehicleName,
                                     myShip.timeToRepair, myShip.startTime);

         methods1cplus.push(myShip);

      End Loop;

      WholeLoop: Loop
         --Set to next rand
         --Number of spaceships arriving
         randNum := methods1cplus.next_int + 1;

         for i in 1..randNum
         Loop
            randInt := methods1cplus.next_int;

            methods1cplus.determineShip(randInt, myShip.vehicleType, myShip.vehicleName,
                                        myShip.timeToRepair, myShip.startTime);

            --Pushing all arrivals onto the stack
            methods1cplus.push(myShip);
            --Checks the goal of 5 refusals
            if methods1cplus.returnRejected >= 5
            Then
               Exit WholeLoop;
            End If;
         End Loop;

         --Check to see if the priority space ship is available to pop
         methods1cplus.checkTie(priorityAvailable, priorityShip);

         --If no other spaceship is being worked on
         if repairmenAvailable = True
         Then
            if priorityShip = "Tie Fighter"
            Then
               ship2 := methods1cplus.checkRepairTime("Tie Fighter");
               --Do this set the clock plus the delayTIme
               timeAvailable := Ada.Calendar.Clock + ship2.timeToRepair;
               if not (ship2.vehicleType = "               ")
               Then
                  repairmenAvailable := False;
               end if;

               Delay(delayDuration);

            else
               ship2 := methods1cplus.checkRepairTime("Star Destroyer");
               --Do this set the clock plus the delayTIme
               timeAvailable := Ada.Calendar.Clock + ship2.timeToRepair;
               if not (ship2.vehicleType = "               ")
               then
                  repairmenAvailable := False;
               end if;
               Delay(delayDuration);
            End If;
         else
            delay(delayDuration);
            --If the spaceship being worked on is ready to pop
            if (timeAvailable <= Ada.Calendar.Clock)
            Then
               methods1cplus.pop(ship2);
               Delay(2.0);
               Put_Line("The repair facility has completed the clean up process.");
               Put_Line("This facility is now available for the next spaceship.");
               repairmenAvailable := True;
            End If;
         End If;


   End Loop WholeLoop;

End;
End Main;
