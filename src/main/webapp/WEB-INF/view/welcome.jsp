<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
 <link rel="stylesheet" href="/resources/css/style.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="/resources/css/aos.css">

	<div class="home-content-wrapper">
	
		<div class="overlay-box">
			<div class="container">
				<div class="welcome-text">WELCOME TO Mobile <br/>Store Shop</div>	
	
			</div>
		</div>	
		
	</div>
	<%@ include file="header.jsp" %>
	<div class="site-section site-blocks-2">
      <div class="container">
        <sf:form action="/welcome" method="post" modelAttribute="form">
         <sf:input type="hidden" path="id" />
   <div class="row">
      <c:forEach items="${list}" var="cd" varStatus="cs">
      
          <div class="col-sm-4" >
            <a class="block-2-item" href="/prod/home/search?cId=${cd.id}">
              <figure class="image">
                <img src="/category/getImage/<c:out value='${cd.id}'/>" alt=""  height="200px" width="150px">
              </figure>
              <div class="text">
                <h3>${cd.name}</h3>
              </div>
            </a>
          </div>
          
        </c:forEach>
        </div>
         </sf:form>
        
      </div>
    </div>

