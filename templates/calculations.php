<!DOCTYPE html>
<html>

<head>
   <meta charset=UTF-8" />

   <title>RESULT CALCULATION</title>

</head>

<body>
   <?php
   $mood = $_POST['mood'];  
   
   $pessimism = $_POST['pessimism'];
   
   $sof = $_POST['sof'];
   
   $sd = $_POST['sd'];
   
   $guilt = $_POST['guilt'];
  
   $pu = $_POST['pu'];
   
   $sl = $_POST['sl'];
   
   $sa = $_POST['sa'];
   
   $si = $_POST['si'];

   $crying = $_POST['crying'];
   
   $irrit = $_POST['irrit'];
   
   $sw = $_POST['sw'];
   
   $in = $_POST['in'];
  
   $bic = $_POST['bic'];
   
   $wd = $_POST['wd'];
  
   $ins = $_POST['ins'];
   
   $fat = $_POST['fat'];
   
   $loa = $_POST['loa'];
   
   $loss = $_POST['loss'];
   
   $sp = $_POST['sp'];
   
   $lol = $_POST['lol'];
   
   $totalCorrect = 0;
   
   if ($mood == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($mood == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($mood == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($mood == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($pessimism == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($pessimism == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($pessimism == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($pessimism == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sof == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sof == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sof == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sof == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sd == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sd == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sd == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sd == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($guilt == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($guilt == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($guilt == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($guilt == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($pu == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($pu == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($pu == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($pu == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sl == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sl == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sl == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sl == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sa == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sa == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sa == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sa == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($si == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($si == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($si == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($si == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($crying == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($crying == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($crying == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($crying == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($irrit == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($irrit == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($irrit == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($irrit == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sw == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sw == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sw == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sw == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($in == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($in == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($in == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($in == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($bic == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($bic == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($bic == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($bic == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($wd == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($wd == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($wd == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($wd == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($ins == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($ins == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($ins == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($ins == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($fat == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($fat == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($fat == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($fat == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($loa == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($loa == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($loa == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($loa == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($loss == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($loss == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($loss == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($loss == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($sp == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($sp == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($sp == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($sp == "D") { $totalCorrect = $totalCorrect+3 ; }
   
   if ($lol == "A") { $totalCorrect = $totalCorrect+0 ; }
   if ($lol == "B") { $totalCorrect = $totalCorrect+1 ; }
   if ($lol == "C") { $totalCorrect = $totalCorrect+2 ; }
   if ($lol == "D") { $totalCorrect = $totalCorrect+3 ; }
   
  echo $totalCorrect ;
   ?>


</body>

</html>