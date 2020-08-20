<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="ko-kr">

<head>
<%
	if (session.getAttribute("user_id") == null) {
%>
<script>
	window.location = '/chap14/login/loginForm.jsp';
</script>
<%
	}
%>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>UserList - Company Bootstrap Template</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Company - v2.1.0
  * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<jsp:include page="IndexNav.jsp"></jsp:include>
	</header>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>사용자 목록</h2>
					<ol>
						<li><a href="index.jsp">Home</a></li>
						<li>UserList</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Pricing Section ======= -->
		
		<section id="pricing" class="pricing">
			<!-- 테이블 영역 -->
			<div class="container" data-aos="fade-up" >
				<h2>UserList</h2>
				<p>사용자 전체 목록 입니다.</p>
				<table width="100%" border="1" class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th style="border-top: 1px solid blue;">아이디</th>
							<th style="border-top: 1px solid blue;">이름</th>
							<th style="border-top: 1px solid blue;">이메일</th>
						</tr>
					</thead>
					<%
						// 1. JDBC 드라이버 로딩
					Class.forName("com.mysql.jdbc.Driver");

					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;

					try {
						String jdbcDriver = "jdbc:mysql://localhost:3306/forjsp?" + "useUnicode=true&characterEncoding=utf8";
						String dbUser = "root";
						String dbPass = "rootroot";

						String query = "select * from member order by memberid";

						// 2. 데이터베이스 커넥션 생성
						conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

						// 3. Statement 생성
						stmt = conn.createStatement();

						// 4. 쿼리 실행
						rs = stmt.executeQuery(query);

						// 5. 쿼리 실행 결과 출력
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("MEMBERID")%></td>
						<td>
							<a href="updateuser.jsp?memberID=<%=rs.getString("memberid")%>"><%=rs.getString("name")%></a>
						</td>
						<td><%=rs.getString("EMAIL")%></td>
					</tr>
					<%
						}
					} catch (SQLException ex) {
					out.println(ex.getMessage());
					ex.printStackTrace();
					} finally {
					// 6. 사용한 Statement 종료
					if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
					if (stmt != null)
					try {
						stmt.close();
					} catch (SQLException ex) {
					}

					// 7. 커넥션 종료
					if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
					}
					%>
				</table>
			</div>
			<div class="container"  data-aos="fade-up">
				<form action="viewmembers.jsp" method="post">
					<div class="input-group">
						<input type="text" name="memberID" placeholder="검색할 ID를 입력하세요." width="300px">
						<div class="input-group-btn">
							<input type="submit" value="검색">
						</div>
					</div>

				</form>
			</div>



		</section>
		<!-- End Pricing Section -->



	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>Company</h3>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United States <br> <br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong> info@example.com<br>
						</p>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Join Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit" value="Subscribe">
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="container d-md-flex py-4">

			<div class="mr-md-auto text-center text-md-left">
				<div class="copyright">
					&copy; Copyright <strong><span>LKHcoding</span></strong>. All Rights Reserved
				</div>
				<div class="credits">
					<!-- All the links in the footer should remain intact. -->
					<!-- You can delete the links only if you purchased the pro version. -->
					<!-- Licensing information: https://bootstrapmade.com/license/ -->
					<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/company-free-html-bootstrap-template/ -->
					Designed by <a href="https://bootstrapmade.com/">LKHcoding</a>
				</div>
			</div>
			<div class="social-links text-center text-md-right pt-3 pt-md-0">
				<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>