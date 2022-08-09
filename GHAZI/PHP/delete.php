<?php
require_once "../components/bootstrap.php";
require_once "../components/db_connect.php";

$hide="";

$id = $_GET["id"];

if (isset($_POST["submit"])) {
    $sql = "DELETE FROM products WHERE id = $id";

    $result = mysqli_query($conn, $sql);

    if ($result) {
        $hide='none';
        echo '<div class="alert alert-success " role="alert" >
        <h1>This product has deleted success</h1>
      </div>';
      header("Refresh:2; url=cpanel_adm.php");    } else {
        echo "Error";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/fa383714fa.js" crossorigin="anonymous"></script>
    <style>
    i {
        font-size: 15em;
    }
    </style>

</head>

<body>
    <?php
    
    
   echo ' <div class="text-center alert alert-danger d-'.$hide.' ">
        <h1>Are you sure you want to delete this product</h1>


        <form method="POST">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <button type="submit" class="btn btn-danger" name="submit">
                <h1>delete</h1>
            </button>
            <a href="cpanel_adm.php" class="btn btn-success">
                <h1>Cancel</h1>
            </a><i class="fa-solid fa-exclamation"></i>
            <i class="fa-solid fa-exclamation"></i>
            <i class="fa-solid fa-exclamation"></i>

        </form>
        </div>';?>
</body>

</html>