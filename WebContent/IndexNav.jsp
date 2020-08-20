<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.jsp"><span>LKH</span>coding</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
        <script>
        	var linka = document.location.href;
        	var nothome = false;
        	if(linka.indexOf("pricing.jsp") > 0){
        	nothome = true;
        	
        	}
        </script>
          <li class=<%= request.getRequestURL().indexOf("index.jsp") == -1 ? "" : "active" %>><a href="index.jsp">Home</a></li>

          <li class="drop-down"><a href="">UserList</a>
            <ul>
              <li><a href="pricing.jsp">All UserList</a></li>
              <li><a href="adduser.jsp">Add User</a></li>
              <li class="drop-down"><a href="#">Deep Drop Down</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
            </ul>
          </li>

         

        </ul>
      </nav><!-- .nav-menu -->

      <div class="header-social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>

    </div>