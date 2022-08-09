<?php

require_once "../components/bootstrap.php";
require_once "../components/db_connect.php";


require_once "./uploud.php";?>
<!-- *****************NAVBAR OF ADMINDASHBORD********************* -->

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
                                <button class="btn text-dark " type='submit' name='product'>Products</button>

                            </li>
                            <li class="nav-item">

                                <button class="btn text-dark " type='submit' name='user'>Users</button>

                            </li>
                            <li class="nav-item">


                                <a class="btn text-dark " href="createProduct.php">Create Product</a>

                            </li>
                            <li class="nav-item">

                                <a class="btn text-dark " href="createUser.php">Create User</a>

                            </li>


            </form>




            </ul>
    </div>
</div>
</nav>
<!-- *****************END OF NAVBAR OF ADMINDASHBORD********************* -->






<div class="container bg-dark">
    <div class="row">
        <div class="col-12">
            <table class="table table-dark">
                <thead>




                    <?php 
#*****************WHEN LOGIN INTO ADMINDASHBORD WE WILL SEE FIRST THE TABLE OF PRODUCTS*********************
if(!isset($_POST['user']) && !isset($_POST['product']) && !isset($_POST['CreatProduct'])|| isset($_POST['product']) ){echo'<tr>
<th scope="col">id</th>
<th scope="col">picture</th>
<th scope="col">name</th>
<th scope="col">price</th>
<th scope="col">describtion</th>
<th scope="col">discount</th>
<th scope="col">display</th>
<th scope="col">categorie</th>
<th scope="col">fk_producer</th>

</tr>
</thead>';

$sql = "SELECT * FROM products";
$result = mysqli_query($conn,$sql);
$card=''; 
if(mysqli_num_rows($result)  > 0) {    
   while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
echo $table='
      
        <tbody>
          <tr>
          <form method="POST">

            <th scope="row">'.$row["id"].'</th>
            <td  style="height:8vh;width:10vw;">
                <img src="../picture/'.$row["picture"].'"
                class="img-fluid img-thumbnail" >
            </td>
            <td>'.$row["name"].'</td>
            <td>'.$row["price"].'</td>
            <td>'.$row["discount"].'</td>
            <td>'.$row["display"].'</td>
            <td>'.$row["describtion"].'</td>
            <td>'.$row["categorie"].'</td>
            <td>'.$row["fk_producer"].'</td>
            <td><a class="btn btn-warning"  href="update.php?id='.$row["id"].' "> <h6>upated</h6></a>
            <td><a class="btn btn-info"  href="details.php?id='.$row["id"].' "> <h6>deails</h6></a>
            <td><a class="btn btn-danger"  href="delete.php?id='.$row["id"].' "> <h6>delete</h6></a>
            </td>
            </form>

          </tr>
          
        </tbody>
      



';


}

}}

#*****************WHEN CLICK ON USER WILL SEE TABLE OF USERS********************

if(isset($_POST['user'])){echo'<tr>
    <th scope="col">picture</th>
    <th scope="col">f_name</th>
    <th scope="col">l_name</th>
    <th scope="col">birthdate</th>
    <th scope="col">email</th>
    <th scope="col">pass</th>
    <th scope="col">user_ban</th>
    <th scope="col">status</th>
    
    </tr>
    </thead>';
    
    $sql = "SELECT * FROM users";
    $result = mysqli_query($conn,$sql);
    $card=''; 
    if(mysqli_num_rows($result)  > 0) {    
       while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    echo $table='
          
            <tbody>
              <tr>
              <form method="POST">
    
                <td  style="height:8vh;width:10vw;">
                    <img src="../userPicture/'.$row["picture"].'"
                    class="img-fluid img-thumbnail" >
                </td>
                <td>'.$row["f_name"].'</td>
                <td>'.$row["l_name"].'</td>
                <td>'.$row["birthdate"].'</td>
                <td>'.$row["email"].'</td>
                <td>'.$row["pass"].'</td>
                <td>'.$row["status"].'</td>
                <td><a class="btn btn-warning"  href="update.php?id='.$row["id"].' "> <h6>upated</h6></a>
                <td><a class="btn btn-info"  href="userdetails.php?id='.$row["id"].' "> <h6>deails</h6></a>
                <td><a class="btn btn-danger"  href="userdelete.php?id='.$row["id"].' "> <h6>delete</h6></a>
                </td>
                </form>
    
              </tr>
              
            </tbody>
          
    
    
    
    ';
    
    
    }
    
    }}


    




    



?>
            </table><br>
        </div>
    </div>










    </body>

    </html>

    </body>

    </html>