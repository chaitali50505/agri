<%@ page import="com.db.DBConnection" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--//skycons-icons-->
</head>
<body>	
<div class="page-container">	
   <div class="left-content">
	   <div class="mother-grid-inner">
            <!--header start here-->
				<div class="header-main">
					<div class="header-left">
							<div class="logo-name">
									 <a href="index.html"> <h1>AgriMarket</h1> 
									
								  </a> 								
							</div>
							<!--search-box-->
								<div class="search-box">
									<form>
										<input type="text" placeholder="Search..." required="">	
										<input type="submit" value="">					
									</form>
								</div><!--//end-search-box-->
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
												<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p><%=User.getName() %></p>
													<span>Farmer</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="userlogin.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">
    <div class="product-block">
    	<div class="pro-head">
    		<h2>Equipments</h2>
    	</div>
    	<div class="col-md-3"></div>
        <div class="col-md-6 product-grid ">
    		<div class="product-items">
    		
    			<%        
    
    		Connection con = DBConnection.connect();
          String query ="SELECT equipment.eimage, equipment.eid, equipment.ename, admin.aname,admin.amobileno, equipment.ecategary, equipment.ehourprice,equipment.edayprice, equipment.edeposite,admin.alocation,admin.acity ,equipment.eavailable,equipment.eabout FROM equipment JOIN admin ON equipment.aid = admin.aid where eid=?";
          int eid = Integer.parseInt(request.getParameter("id"));
          //int dis = Integer.parseInt(request.getParameter("dis"));
          PreparedStatement stmt = con.prepareStatement(query);
          stmt.setInt(1, eid);
          ResultSet rs = stmt.executeQuery();
          String status=null;
          %>
    	<%
    	if(rs.next()){ 
    	      byte[] imageData = rs.getBytes(1);

    	      String base64Image = Base64.getEncoder().encodeToString(imageData);
    	      
    	       status = rs.getString(12);
    	 %>
    	
	    		    <div class="project-eff">
						<div id="nivo-lightbox-demo"> <p> <a href="images/pro1.jpg"data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
							<img class="image-responsive" src="data:image/jpeg;base64, <%= base64Image %>" alt="" class="fixed-size-image" >
					</div>
	    		<div class="produ-cost">
                    <h3><%= rs.getString(3) %></h3>
					<h4>Owner : <%= rs.getString(4)%> </h4>
					<h4>Contact : <%= rs.getString(5)%></h4>
					<h4>Category : <%= rs.getString(6)%></h4>
					
					<% if(rs.getString(6) != null && rs.getString(6).equalsIgnoreCase("fertilizer")) { %>
					
						<h4>price : <%= rs.getFloat(8)%></h4>	
					
					<% } else { %>
					
	                    <h4>Hour price : <%= rs.getFloat(7)%></h4>
	                    <h4>Day price : <%= rs.getFloat(8)%></h4>
						<h4>Deposit : <%= rs.getFloat(9)%></h4>
						
					<% } %>
					
					
					
					<h4>Location : <%= rs.getString(10)%>, <%= rs.getString(11)%></h4>
					<%-- <h4>Distance: <%= dis %> km</h4> --%>
					<h4>Status : <%= rs.getString(12)%></h4>
					<h4>Discription :<%= rs.getString(13)%> </h4>
	    			
				<% } %>	
				
				<% 
					String available = "available";
					
					if(available.equals(status)) { 
				%>
							
							
							<% if(rs.getString(6) != null && rs.getString(6).equalsIgnoreCase("fertilizer")) { %>
					
								<form action="bill.jsp" >
								    <h4>Select Ordered Date</h4>
								
							
									<input type="hidden" name="id" value="<%= rs.getInt(2)%>">
									<input class="form-control" type="datetime-local" id="username" name="bdate" required="" >
									
									<h4>Select Expected date</h4>
				
									<input class="form-control" type="datetime-local" id="username" name="rdate" required="" >
									<div class="clearfix"> </div>
									 
		                    		<button type ="submit" class="btn btn-default">Order</button>
		                    	</form>	
							
							<% } else { %>
							
			                    <form action="bill.jsp" >
								    <h4>Select Booked Date</h4>
								
							
									<input type="hidden" name="id" value="<%= rs.getInt(2)%>">
									<input class="form-control" type="datetime-local" id="username" name="bdate" required="" >
									
									<h4>Select Release date</h4>
				
									<input class="form-control" type="datetime-local" id="username" name="rdate" required="" >
									<div class="clearfix"> </div>
									
									 
		                    		<button type ="submit" class="btn btn-default">Book</button>
		                    	</form>
								
							<% } %>
							
							
							
		                    
		                    
		                    <%} 
									else{
				                 
						          	query ="SELECT rdate from confermorder where eid = ?";
						       		String rdate = null;
						        	stmt = con.prepareStatement(query);
						          	stmt.setInt(1, eid);
						          	rs = stmt.executeQuery();
						              if(rs.next()) 
						              {
						            	  rdate = rs.getString(1);
						              }
            	  
            	  			%>
            	  			
		            	  <h4>Release On: <%=rdate %></h4>
		            	  <% } %>
	    		</div>
    		</div>
    	</div>
		<div class="col-md-3"></div>
      <div class="clearfix"> </div>
    </div>
</div>
<!--inner block end here-->
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
			<script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
				<script type="text/javascript">
				$(document).ready(function(){
				    $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
				});
				</script>

<!--copy rights start here-->
	
<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
<div class="sidebar-menu">
	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
		<!--<img id="logo" src="" alt="Logo"/>--> 
	</a> </div>		  
 <div class="menu">
	<ul id="menu" >
	   
	   <li><a href="userhome.jsp"><i class="fa fa-tachometer"></i><span>Equipments</span><span class="fa fa-angle-right" style="float: right"></span></a>
		  
	   </li>
	    <li><a href="userorder.jsp"><i class="fa fa-shopping-cart"></i><span>View order</span><span class="fa fa-angle-right" style="float: right"></span></a>	</li>
	</ul>
  </div>
</div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
