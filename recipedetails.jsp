<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="pack.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>recipe-pancake</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="recipe-pancake.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 2.25.0, nicepage.com">
    
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    
    
  </head>
   <body id="home">

    <nav class="navbar navbar-expand-sm bg-danger navbar-dark fixed-top">
    <div class="container">
     <a class="navbar-brand" >ReSharePeace</a>
     <div class="navbar-collapse justify-content-end" id="navbarNav">
      <form class="form-inline my-2 my-lg-0" action="searchresults.html">
       <input class="form-control mr-sm-2" type="text" placeholder="Search">
        <button class="btn btn-primary my-2 my-sm-0" type="submit"> <i class="fa fa-search" aria-hidden="true"> </i> Search</button> 
        

        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> My Profile </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
           <a class="dropdown-item" href="feeds.html"> <i class="fa fa-home" aria-hidden="true"> </i> Home</a>
           <a class="dropdown-item" href="favourite.html"> <i class="fa fa-heart" aria-hidden="true"> </i> Favourites</a>
           <a class="dropdown-item" href="class.html"> <i class="fa fa-mortar-board" aria-hidden="true"> </i> Classes</a>
           <a class="dropdown-item" href="bookings.html"> <i class="fa fa-calendar" aria-hidden="true"> </i> Bookings</a>
           <a class="dropdown-item" href="profile.html"> <i class="fa fa-user-circle-o" aria-hidden="true"> </i> Profile</a>
           <a class="dropdown-item" href="login.html"> <i class="fa fa-power-off" aria-hidden="true"> </i> Logout</a>
          </div>
        </div>
      </form>
     </div>
    </div>   
    </nav>
        
        <p class="u-custom-font u-large-text u-text u-text-default u-text-variant u-text-1">ReSharePeace</p>
      </div></header>
    <section class="u-clearfix u-section-1" id="carousel_c5cf">
       <div class="tile">
              <%
                    List<recipe> searchResult = (List<recipe>) session.getAttribute("searchResult");
                      
                    if (searchResult == null || searchResult.size()<=0){
                %>
                <tr><td colspan="6">(No result is found)</td></tr>
                <%
                    }else
                    {
                        for (recipe p : searchResult){
                            String imageLocation = "http://localhost:9999/recipenew/images/" + p.getphotoname();
                            System.out.println(p);
                             String recipeidx = String.valueOf(p.getrecipeid()); 
                            System.out.println(session.getAttribute("recipeid"));
                            if (recipeidx.equals(session.getAttribute("recipeid"))) {
                               
                %>
                <div class="box" style="margin: 20px;">
                    <div class="u-clearfix u-sheet u-sheet-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-center-lg u-align-center-sm u-align-center-xl u-align-center-xs u-container-style">
                <div class="u-container-layout u-valign-middle-xl u-container-layout-1">
                  <h2 class="u-align-center-md u-text u-text-grey-60 u-text-1"><%=p.getrecipename()%><br>
                    <font style="font-size: 1.875rem;">By <a href="profile.html" class="u-btn u-button-style u-none u-text-palette-1-base u-btn-1">Jamie</a>
                    </font>
                  </h2>

                  <p class="u-align-center-md u-text u-text-grey-40 u-text-2"> 9 September 2020 <br> 
                    <i class="fa fa-star" aria-hidden="true"> </i> 
                    <i class="fa fa-star" aria-hidden="true"> </i> 
                    <i class="fa fa-star" aria-hidden="true"> </i> 
                    <i class="fa fa-star" aria-hidden="true"> </i> 
                    <i class="fa fa-star-o" aria-hidden="true"> </i> </p>
                  <p class="u-align-center-md u-text u-text-grey-40 u-text-2">A waffle is a dish made from leavened batter or dough that is cooked between two plates that are patterned to give a characteristic size, shape, and surface impression.<br>Waffles may be made fresh or simply heated after having been commercially cooked and frozen.
                  </p>
                </div>
              </div>
            </div>
          </div>
      </div>
     
    </section>

    <section class="u-section-2" id="carousel_c5cf">
        <div class="u-expanded-width u-layout-wrap u-layout-wrap-2">
          <div class="u-layout">
                 <article class="media">
                      <div class="media-middle">
                        <figure class="image is-576x576">
                          <img class="image is-576x576" src="<%=imageLocation%>" alt="Image">
                        </figure>
                      </div>
              </div>
          </div>
        </div>
        
    </section>

<section class="u-clearfix u-section-3" id="carousel_c5cf">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-center-sm u-align-center-xs u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-1">
                <div class="u-container-layout u-valign-top u-container-layout-1">
                  <h6 class="u-align-center-lg u-align-center-md u-align-center-xl u-text u-text-grey-60 u-text-1">Serving Size: 2 pax <br> Preparation Time: <%=p.getrecipetimetaken()%> min<i class="fa fa-hourglass-half" aria-hidden="true"> </i>
                  </h6>
                </div>
              </div>
              <div class="u-align-center-sm u-align-center-xs u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-2">
                <div class="u-container-layout u-valign-top u-container-layout-2">
                  <blockquote>
                    <h2 class="u-align-center-lg u-align-center-md u-align-center-xl u-text u-text-grey-60 u-text-2">Nutrition Facts: <i class="fa fa-info" aria-hidden="true"> </i>
                  </h2>
                  <h5 class="u-align-center-lg u-align-center-md u-align-center-xl u-text u-text-grey">
                    Total Fat: 10g <br>
                    Saturated fat: 2.1g <br>
                    Polyunsaturated fat: 4.4g <br>
                    Cholestrol: 59mg <br>
                    Sodium: 439 mg <br>
                    Potassium: 132 mg <br>
                    Total Carbohydrate: 28 g <br>
                    Protein: 6 g
                  </h5>
                  </blockquote>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="u-align-left u-clearfix u-section-4" id="carousel_d13c">

      <div class="u-clearfix u-sheet u-sheet-4">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col"> <h3 class="u-custom-font u-text u-text-default u-text-grey-50 u-text-1"> Ingredients </h3> 

                    <form class="form" action="measurement-conversion.html">
                      <button type="submit" class="btn-danger float-right"> Measurement <br> Conversion Calculator </button>  
                    </form>
                  </th> 
                </tr>
              </thead>

              <tbody>
              

                <tr>
                  <td> <%=p.getrecipeingredient()%>
                          </p>  </td>
                </tr>

                
                </tr>              
              </tbody>              
            </table>
          </div>
        </div>
      </div>
    </section>

    <section class="u-align-left u-clearfix u-section-5" id="carousel_d13c">
      <div class="u-clearfix u-sheet u-sheet-4">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col"> <h3 class="u-custom-font u-text u-text-default u-text-grey-50 u-text-1"> Directions </h3> </th> 
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td> <%=p.getrecipesteps()%>
                          </p>  </td>
                </tr>
              </tbody>              
            </table>
          </div>
        </div>
      </div>
    </section>


    <section class="u-align-center u-clearfix u-section-6" id="carousel_f8e8">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-font-montserrat u-text u-text-default u-text-grey-75 u-text-1">Related Searches</h2>
        <div id="carousel-8627" data-interval="5000" data-u-ride="carousel" class="u-carousel u-expanded-width-lg u-expanded-width-xl u-slider u-slider-1">
          <ol class="u-absolute-hcenter u-carousel-indicators u-carousel-indicators-1">
            <li data-u-target="#carousel-8627" class="u-active u-grey-30 u-shape-circle" data-u-slide-to="0" style="height: 10px; width: 10px;"></li>
            <li data-u-target="#carousel-8627" class="u-grey-30 u-shape-circle" data-u-slide-to="1" style="height: 10px; width: 10px;"></li>
          </ol>
          <div class="u-carousel-inner" role="listbox">
            <div class="active u-active u-align-center u-carousel-item u-container-style u-slide">
              <div class="u-container-layout u-valign-middle u-container-layout-1">
                <div class="u-expanded-width-lg u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-gallery u-layout-grid u-lightbox u-no-transition u-show-text-always u-gallery-1">
                  <div class="u-gallery-inner u-gallery-inner-1">
                    <div class="u-gallery-item" data-href="recipe-waffle.html">
                      <div class="u-back-slide" data-image-width="720" data-image-height="720">
                        <img class="u-back-image u-expanded" src="images/waffle.jpg" alt="Homemade Pancake">
                      </div>
                      <div class="u-over-slide u-shading u-valign-bottom u-over-slide-1">
                        <h3 class="u-gallery-heading">Homemade Pancake</h3>
                        <p class="u-gallery-text" style="margin-top: 0;"></p>
                      </div>
                    </div>
                    <div class="u-gallery-item" data-href="recipe-cheesecake.html">
                      <div class="u-back-slide" data-image-width="720" data-image-height="720">
                        <img class="u-back-image u-expanded" src="images/cheesecake.jpg" alt="Creamy Homemade Cheescake">
                      </div>
                      <div class="u-over-slide u-shading u-valign-bottom u-over-slide-2">
                        <h3 class="u-gallery-heading">Creamy Homemade Cheescake</h3>
                        <p class="u-gallery-text" style="margin-top: 0;"></p>
                      </div>
                    </div>
                    <div class="u-gallery-item" data-href="recipe-tiramisu.html">
                      <div class="u-back-slide" data-image-width="1200" data-image-height="1800">
                        <img class="u-back-image u-expanded" src="images/tiramisu.jpg" alt="Tiramisu">
                      </div>
                      <div class="u-over-slide u-shading u-valign-bottom u-over-slide-3">
                        <h3 class="u-gallery-heading">Tiramisu</h3>
                        <p class="u-gallery-text" style="margin-top: 0;"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="u-carousel-item u-container-style u-expanded-width-xl u-shape-rectangle u-slide">
              <div class="u-container-layout u-valign-top u-container-layout-2">
                <div class="u-expanded-width-lg u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-gallery u-layout-grid u-lightbox u-no-transition u-show-text-always u-gallery-2">
                  <div class="u-gallery-inner u-gallery-inner-2">
                    <div class="u-gallery-item" data-href="recipe-pancake.html">
                      <div class="u-back-slide" data-image-width="900" data-image-height="560">
                        <img class="u-back-image u-expanded" src="images/pancake.jpg" alt="Japanse Soufle Pancake">
                      </div>
                      <div class="u-align-right u-over-slide u-shading u-valign-bottom u-over-slide-4">
                        <h3 class="u-gallery-heading" style="margin-right: 0; margin-left: 0;">Japanse Soufle Pancake</h3>
                        <p class="u-align-center u-gallery-text" style="margin-right: 0; margin-left: 0;"></p>
                      </div>
                    </div>
                    <div class="u-gallery-item" data-href="recipe-muffin.html">
                      <div class="u-back-slide" data-image-width="850" data-image-height="850">
                        <img class="u-back-image u-expanded" src="images/muffin.jpg" alt="Blueberry Muffin">
                      </div>
                      <div class="u-align-right u-over-slide u-shading u-valign-bottom u-over-slide-5">
                        <h3 class="u-gallery-heading" style="margin-right: 0; margin-left: 0;">Blueberry Muffin</h3>
                        <p class="u-align-center u-gallery-text" style="margin-right: 0; margin-left: 0;"></p>
                      </div>
                    </div>
                    <div class="u-gallery-item">
                      <div class="u-back-slide" data-image-width="1600" data-image-height="2240">
                        
                      </div>
                      
                        
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a class="u-absolute-vcenter u-black u-carousel-control u-carousel-control-prev u-icon-circle u-spacing-10 u-text-body-alt-color u-carousel-control-1" href="#carousel-8627" role="button" data-u-slide="prev">
            <span aria-hidden="true">
              <svg viewBox="0 0 477.175 477.175"><path d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
                    c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"></path></svg>
            </span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="u-absolute-vcenter u-black u-carousel-control u-carousel-control-next u-icon-circle u-spacing-10 u-text-body-alt-color u-carousel-control-2" href="#carousel-8627" role="button" data-u-slide="next">
            <span aria-hidden="true">
              <svg viewBox="0 0 477.175 477.175"><path d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
                    c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z"></path></svg>
            </span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </section>

    <section id="carousel_6f7a" class="u-carousel u-slide u-block-2bc8-1" data-u-ride="carousel" data-interval="5000">
      <ol class="u-absolute-hcenter u-carousel-indicators u-block-2bc8-2">
        <li data-u-target="#carousel_6f7a" data-u-slide-to="0" class="u-active u-grey-30"></li>
        <li data-u-target="#carousel_6f7a" class="u-grey-30" data-u-slide-to="1"></li>
      </ol>
      <div class="u-carousel-inner" role="listbox">
        <div class="u-active u-align-center u-carousel-item u-clearfix u-section-7-1">
          <div class="u-clearfix u-sheet u-valign-middle-md u-valign-middle-sm u-valign-middle-xs u-sheet-1">
            <h2 class="u-text u-text-default u-text-grey-50 u-text-1">Reviews</h2>
            <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
              <div class="u-layout">
                <div class="u-layout-row">
                  <div class="u-container-style u-layout-cell u-left-cell u-size-16 u-layout-cell-1">
                    <div class="u-container-layout u-valign-top u-container-layout-1">
                      <img alt="" class="u-align-left u-image u-image-default u-image-1" src="images/Nicolepic.jpg" data-image-width="1044" data-image-height="1162">
                    </div>
                  </div>
                  <div class="u-align-center-sm u-align-center-xs u-align-left-lg u-align-left-md u-align-left-xl u-container-style u-layout-cell u-right-cell u-size-44 u-layout-cell-2">
                    <div class="u-container-layout u-container-layout-2">
                      <p class="u-large-text u-text u-text-variant u-text-2">Best ever!!! I was really impressed. I will add some maple syrup toward the end next time. in my recipe forever</p>
                      <h5 class="u-text u-text-3"><i>
                          <a href="678612635" class="u-btn u-button-style u-none u-text-palette-1-base u-btn-1">Nicole</a></i>
                      </h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="u-align-center u-carousel-item u-clearfix u-section-7-2">
          <div class="u-clearfix u-sheet u-sheet-1">
            <h2 class="u-text u-text-default u-text-grey-50 u-text-1">Reviews</h2>
            <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
              <div class="u-layout">
                <div class="u-layout-row">
                  <div class="u-container-style u-layout-cell u-left-cell u-size-16 u-layout-cell-1">
                    <div class="u-container-layout u-valign-top u-container-layout-1">
                      <img alt="" class="u-align-left u-image u-image-default u-image-1" src="images/profile.png" data-image-width="1920" data-image-height="1280">
                    </div>
                  </div>
                  <div class="u-align-center-sm u-align-center-xs u-align-left-lg u-align-left-md u-align-left-xl u-container-style u-layout-cell u-right-cell u-size-44 u-layout-cell-2">
                    <div class="u-container-layout u-container-layout-2">
                      <p class="u-large-text u-text u-text-variant u-text-2">My husband and I never had waffles. I made this recipe and it was awesome. I must say, it was better than eating at some famous restuarants. Thanks</p>
                      <h5 class="u-text u-text-3"><i>
                          <a href="678612635" class="u-btn u-button-style u-none u-text-palette-1-base u-btn-1">Kim<br>
                          </a></i>
                      </h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a class="u-carousel-control u-carousel-control-prev u-text-body-color u-block-2bc8-3" href="#carousel_6f7a" role="button" data-u-slide="prev">
        <span aria-hidden="true">
          <svg viewBox="0 0 477.175 477.175"><path d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
                    c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"></path></svg>
        </span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="u-carousel-control u-carousel-control-next u-text-body-color u-block-2bc8-4" href="#carousel_6f7a" role="button" data-u-slide="next">
        <span aria-hidden="true">
          <svg viewBox="0 0 477.175 477.175"><path d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
                    c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z"></path></svg>
        </span>
        <span class="sr-only">Next</span>
      </a>
    </section>
                      
                    
                  </div>
                <%
                            }
                    }
                    }
                 %>
      <div class="u-clearfix u-sheet u-sheet-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-center-lg u-align-center-sm u-align-center-xl u-align-center-xs u-container-style">
                <div class="u-container-layout u-valign-middle-xl u-container-layout-1">
                  <h2 class="u-align-center-md u-text u-text-grey-60 u-text-1">Japanese Souffle Pancakes<br>
                    <font style="font-size: 1.875rem;">By <a href="profile.html" class="u-btn u-button-style u-none u-text-palette-1-base u-btn-1">Jamie</a>
                    </font>
   
    
    
    <footer class="foot">
            <div class="container">
               <div class="row">
                   <div class="col text-center">
                       <p>
                        
                       </p>
                   </div>
               </div>
           </div>
       </footer>
       <!-- End of Footer -->

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

  </body>

</html>