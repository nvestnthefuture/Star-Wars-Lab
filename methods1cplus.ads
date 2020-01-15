--Jessica Byrd
--09/21/2019
--COSC 3319 Data Structures
--StarWars Lab01 

with Ada.Calendar.Formatting;
with Ada.Calendar.Time_Zones; use Ada.Calendar.Time_Zones;
with Ada.Integer_Text_IO;
with Ada.Calendar.Arithmetic; use Ada.Calendar.Arithmetic;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

Package methods1cplus is
   
   function promptUserForUpperBound return Integer;

   function promptUserForLowerBound return Integer;
   
   function promptUserForPriority return String;
   
   --Spaceship Vehicle Maintenance Record
   type sVehicleMaintenanceRecord is record
     vehicleType : String (1..15);
     vehicleName : String (1..8);
     timeToRepair: Duration; --Time minus the time is the duration
     startTime   : Ada.Calendar.Time;
     finishTime  : Ada.Calendar.Time;

   End record;
   
   subtype lastCharOfName is Character range 'A'..'Z';
     
   function next_float return Float;
   
   function next_int return Integer;
   
   Procedure determineShip(x : in Integer;
                            sVType : out String; sVName : out String;
                           tToRepair : out Duration; sTime : out Ada.Calendar.Time);
   
   Procedure push(myRecord : in sVehicleMaintenanceRecord);
   
   Procedure pop(aShip : in sVehicleMaintenanceRecord);
   
   function returnRejected return Integer;
   
   Procedure CheckTie(tieAvail : out Boolean; delPrior : in String);
   
   --For Star Destroyers repair time exponentially distributed 
   --With a mean of 10 seconds
   function next_exp return Float;
   
   function checkRepairTime(prio : in String) return sVehicleMaintenanceRecord;
     
End methods1cplus;

--End of Program
