<?php require_once "../components/bootstrap.php";
require_once "../components/navbar.php";
require_once "../components/db_connect.php";

?>



<style>
.view-image img {
    width: 100%;
    height: 10vh;
    object-fit: scale-down;
    object-position: center center;
}

.mapouter {
    position: relative;
    text-align: right;
    height: 500px;
    width: 100%;
}

#gmap_canvas {


    height: 90%;

}
</style>
<?php 
$id=$_GET['id'];
$sql = "SELECT * FROM lacasamia where id='$id'  " ;
$result = mysqli_query($conn,$sql);
$card=''; 
if(mysqli_num_rows($result)  > 0) {    
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);

echo $card='<div class="container">
    <div class="content py-3">
        <div class="card card-outline card-primary rounded-0 shadow">
            <div class="card-header">
                <h4 class="card-title">Estate Details: <b>'.$row["address"].'</b></h4>
            </div>
            <div class="card-body">
                <div class="row gx-4 gx-lg-5 align-items-top">
                    <div class="col-md-6">
                        <img class="card-img-top mb-5 mb-md-0 border border-dark" loading="lazy" id="display-img"
                            src="..\picture\\'.$row["image"].'" />
                        <div class="mt-2 row gx-2 gx-lg-3 row-cols-4 row-cols-md-3 row-cols-xl-4 justify-content-start">


                        </div>
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder border-bottom border-primary pb-1">'.$row["address"].'</h1>
                        <legend class="h4 text-muted">Describtion</legend>

                        <p class="mb-3"><small>'.$row["describtion"].'</small></p>
                        <fieldset>
                            <legend class="h4 text-muted">Details</legend>
                            <div class="row">
                                <div class="col-6">
                                    <span class="text-muted">Type: Estate </span>
                                </div>
                          
                                <div class="col-6">
                                    <span class="text-muted">Area: '.$row["area"].' &#13217
                                </div>
                                <div class="col-6">
                                    <span class="text-muted">Sale Price:
                                    </span>'.$row["price"].' $
                                </div>
                          
                                <div class="col-6">
                    <div class="col-md-6">
                                    <span class="text-muted ">Status: ' .$row["status"].'</span><hr>

                                  

                                </div>
                            </div>
                     
                            <legend class="h4 text-muted">Amenities</legend>
                            <p><i class="fa-solid fa-check" style="color:green;"></i>  shops and markets</p>
                            <p><i class="fa-solid fa-check" style="color:green;"></i>  Parks, beaches and public areas for recreation
                            </p>
                            <p><i class="fa-solid fa-check" style="color:green;"></i>  Roads with easy access to highways</p>

                            </div>


                        </fieldset>
                    </div>
                </div>



<div class="row mt-5">
    <div class="col-md-12">
        <h4 class="mb-4">Map Location</h4>
        <div class="mapouter">
            <div id="gmap_canvas">


            

                <

                <script>
                function initMap() {
                    const myLatLng = { lat: ' .$row["latitude"].', lng: ' .$row["longitude"].' };
                    const map = new google.maps.Map(document.getElementById("gmap_canvas"), {
                      zoom: 10,
                      center: myLatLng,
                    });
                  
                    new google.maps.Marker({
                      position: myLatLng,
                      map,
                      title: "Hello World!",
                    });
                  }
                  
                  window.initMap = initMap;
                </script>

                <script
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBtjaD-saUZQ47PbxigOg25cvuO6_SuX3M&callback=initMap"
                    async defer></script>





            </div>
        </div>
    </div>
</div>



</div>
</div>
</div>
</div>';}


 require_once "../components/footer.php";

?>