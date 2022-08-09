<?php

ob_start();
require_once "../components/bootstrap.php";
require_once "../components/db_connect.php";


require_once "./uplouduser.php";?>

<div class='card  border-0 text-light'>
    <div class='row g-0'>
        <nav class="navbar navbar-expand-lg bg-light">
            <form method="POST">

                <div class="container-fluid">
                    <h1 class="navbar-brand " style="font-family: 'Dancing Script', cursive;
font-family: 'Indie Flower', cursive;
font-family: 'Lobster', cursive;
font-family: 'Oleo Script Swash Caps', cursive;font-size:4vw;">Admin Dashboard</h1>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="btn text-dark" href=" index.php"> Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn text-dark" href=" cpanel_adm.php"> back</a>
                            </li>


            </form>




            </ul>
    </div>
</div>
</nav>

<?php

echo $table="

<form method='POST' enctype='multipart/form-data' style='background-color: rgba(0, 0, 0, 0.44);height:100%;'>

    <div class='col-md-5'>
    </div>
    <div class='col-md-8'>
        <div class='card-body'>
            <h1 class='card-title'>First Name:<input type='text' class='bg-dark text-light' name='f_name'>
            </h1>
            <hr>
            <h1 class='card-title'>Last Name:<input type='text' class='bg-dark text-light' name='l_name'>
            </h1>
            <hr>
            <h4 class='card-title'>Uploud_picture:<input type='file' class='bg-dark text-light' name='picture'>
            </h4>
            <hr>
            <h4 class='card-title'>Email:<input type='text' class='bg-dark text-light' name='email'></h4>
            <hr>
            <h4 class='card-title'>Password: <input type='text' class='bg-dark text-light' name='pass'>
            </h4>
            <hr>
           
            <h4 class='card-title'>Birthdate:<input type='text' class='bg-dark text-light' name='birthdate'>
            </h4>
            <hr>

            <h4 class='card-title'>User Ban: <input type='text' class='bg-dark text-light' name='user_ban'>
            </h4>
            <hr>
          
            <h4 class='card-title'>Status: <input type='text' class='bg-dark text-light' name='status'>
            </h4>
            <hr>
            
               
            <button type='submit' class='btn btn-warning mb-3'name='create'><h4>create</h4></button>
            <a href='cpanel_adm.php' class='btn btn-success mb-3'><h4>back</h4></a>
                
            </a>

        </div>
    </div>
    </div>
    </div>
</form>



";




if(isset($_POST['create'])){

$f_name=$_POST['f_name'];
$l_name=$_POST['l_name'];
$email=$_POST['email'];
$pass=$_POST['pass'];
$birthdate=$_POST['birthdate'];
$user_ban=$_POST['user_ban'];
$status=$_POST['status'];
$picture =htmlspecialchars( basename( $_FILES["picture"]["name"]));


$sql=" INSERT INTO `users`(`f_name`, `l_name`, `email`, `pass`, `birthdate`, `picture`, `user_ban`, `status`) VALUES ('$f_name','$l_name','$email','$pass','$birthdate','$picture','$user_ban','$picture')";
$result = mysqli_query($conn, $sql);


header("location:success_create.php");


}







?>

</body>

</html>