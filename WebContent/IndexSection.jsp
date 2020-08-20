<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/slide/slide-1.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>Welcome to <span>LKHcoding</span></h2>
              <p>LKHcoding에 오신것을 환영합니다. <%=session.getAttribute("user_id") %>님 로그인 성공</p>
              <div class="text-center"><a href="login/logout.jsp" class="btn-get-started">로그아웃</a></div>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-2.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>LKHcoding2</h2>
              <p>LKHcoding에 오신것을 환영합니다. <%=session.getAttribute("user_id") %>님 로그인 성공</p>
              <div class="text-center"><a href="login/logout.jsp" class="btn-get-started">로그아웃</a></div>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-3.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>LKHcoding3</h2>
              <p>LKHcoding에 오신것을 환영합니다. <%=session.getAttribute("user_id") %>님 로그인 성공</p>
              <div class="text-center"><a href="login/logout.jsp" class="btn-get-started">로그아웃</a></div>
            </div>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    </div>