<?php

ob_start();
require_once "../components/bootstrap.php";
require_once "../components/db_connect.php";


require_once "./uploud.php";?>

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
            <h1 class='card-title'>Name:<input type='text' class='bg-dark text-light' name='name'>
            </h1>
            <hr>
            <h4 class='card-title'>Uploud_picture:<input type='file' class='bg-dark text-light' name='picture'>
            </h4>
            <hr>
            <h4 class='card-title'>Description:<input type='text' class='bg-dark text-light' name='description'></h4>
            <hr>
            <h4 class='card-title'>Price: <input type='text' class='bg-dark text-light' name='price'>
            </h4>
            <hr>
           
            <h4 class='card-title'>discount:<input type='text' class='bg-dark text-light' name='discount'>
            </h4>
            <hr>

            <h4 class='card-title'>Display: <input type='text' class='bg-dark text-light' name='display'>
            </h4>
            <hr>
          
            <h4 class='card-title'>fk_producer: <input type='text' class='bg-dark text-light' name='fk_producer'>
            </h4>
            <hr>
            <h4 class='card-title'>Stock: <input type='text' class='bg-dark text-light' name='stock'>
            </h4>
            <hr>
            <h4 class='card-title'>Categorie: <input type='text' class='bg-dark text-light' name='categorie'>
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

$name=$_POST['name'];
$price=$_POST['price'];
$description=$_POST['description'];
$discount=$_POST['discount'];
$display=$_POST['display'];
$stock=$_POST['stock'];
$categorie=$_POST['categorie'];
$fk_producer=$_POST['fk_producer'];
$picture =htmlspecialchars( basename( $_FILES["picture"]["name"]));


$sql=" INSERT INTO `products`(`name`, `price`, `describtion`, `discount`, `display`, `stock`, `fk_producer`,
`picture`,`categorie`) VALUES (' $name','$price','$description','$discount',' $display','$stock','$fk_producer','$picture','$categorie')";
$result = mysqli_query($conn, $sql);


header("location:success_create.php");


}







?>

</body>

</html>