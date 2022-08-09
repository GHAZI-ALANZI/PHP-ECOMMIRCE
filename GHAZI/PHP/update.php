<?php
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
$id=$_GET['id'];
$sql = "SELECT * FROM `products` where id=$id ";
$result = mysqli_query($conn, $sql);
$table ='';
$row = mysqli_fetch_assoc($result);
  
echo $table="

<div class='card  border-0 text-light' >


    <div class='row g-0'>

    <form method='POST' enctype='multipart/form-data'style='background-color: rgba(0, 0, 0, 0.44);height:100%;'>
    <div class='col-md-5'>
<img src='../picture/{$row["picture"]}' class='img-fluid rounded-start'>
</div>
        <div class='col-md-5'>
        </div>
        <div class='col-md-8'>
            <div class='card-body'>
                <h1 class='card-title'>Name:<input type='text' class='bg-dark text-light' value='{$row["name"]}'
                name='name'>
                </h1>
                <hr> 
                 <h1 class='card-title'>Name:<input type='file' class='bg-dark text-light' value='{$row["picture"]}'
                name='picture'>
                </h1>
                <hr>
                <h4 class='card-title'>Price:<input type='text' class='bg-dark text-light' value='{$row["price"]}'

                        name='price'></h4>
                <hr>
                <h4 class='card-title'>Discount: <input type='text' class='bg-dark text-light' value='{$row["discount"]}'
                name='discount'> 
                </h4>
                <hr>
                <h4 class='card-title'>description: <input type='text' class='bg-dark text-light' value='{$row["describtion"]}'

                    name='des'> </h4>
                <hr>
                <h4 class='card-title'>Display:<input type='text' class='bg-dark text-light' value='{$row["display"]}'
                name='display'> 
                </h4>
                <hr>
                <hr>
                <h4 class='card-title'>fk_category: <input type='text' class='bg-dark text-light' value='{$row["categorie"]}'

                    name='fk_category'> </h4>

                <hr>
                <h4 class='card-title'>fk_producer: <input type='text' class='bg-dark text-light' value='{$row["fk_producer"]}' 
                name='fk_producer'>
                </h4>
                <hr>
             
                
                <button type='submit' class='btn btn-warning mb-3'name='update'><h4>update</h4></button>
<a href='cpanel_adm.php' class='btn btn-success mb-3'><h4>back</h4></a>
            </div>
        </div>
    </div>
</div>




</form>";



    
    if(isset($_POST['update'])){
        $name=$_POST['name'];
        $price=$_POST['price'];
        $description=$_POST['des'];
        $discount=$_POST['discount'];
        $display=$_POST['display'];
        $categorie=$_POST['categorie'];
        $fk_producer=$_POST['fk_producer'];
        $picture =htmlspecialchars( basename( $_FILES["picture"]["name"]));
      
        $sql=" UPDATE `products` SET `name`='$name',`price`='$price',`describtion`='$description',`discount`='$discount',`display`='$display',`categorie`='$categorie',`fk_producer`=' $fk_producer',`picture`='$picture'  WHERE id='$id' ";

        $result = mysqli_query($conn, $sql);
        

}




  


?>

</body>

</html>