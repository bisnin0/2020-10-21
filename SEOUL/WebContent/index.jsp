<%@page import="java.util.List"%>
<%@page import="com.bitcamp.freeboard.FreeboardVO"%>
<%@page import="com.bitcamp.freeboard.FreeboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1"/> 
<link rel="stylesheet" href="etc/bootstrap.min.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="etc/bootstrap.min.js"></script>
<script src="etc/jquery.bxslider.js"></script>
<link rel="stylesheet" href="etc/jquery.bxslider.css" type="text/css"/>
<style>
	body, ul, li{
		margin:0;
		padding:0;
	}
	.container{
		width:800px;
		padding:0;
	}
	#frm{
		text-align:right;
	}
	form>a{
		height:24px;
		line-height:24px;
		font-size:24px;
	}	
	#logb{
		height:24px;
		line-height:24px;
	}
	#frm>a:link, #frm>a:visited, #frm>a:hover{
		text-decoration:none; 
		color:gray;
	}
	#seoulmenu a:link, #seoulmenu a:visited{
		text-decoration:none; 
		color:#FFF;
	}
	 #seoulmenu a:hover{
	 	color:#F00;
	 }
	#ri{
		text-align:right;
		font-size:24px;
	}
	#a1{
		height:100px;
		width:274px;
		margin:0 auto;
	}
	#a1>a{
		line-height:100px;
	}
	
	#seoulmenu{
		height:50px;
		border-bottom:2px solid gray;
	}
	#seoulmenu li{
		text-align:center;
		line-height:50px;
	}
	#seoulmenu>li{
		float:left;
		width:20%;
		height:50px;
	}
	#seoulmenu>li>ul{
		display:none;
		border:1px solid gray;
		z-index:1000;
		position:relative; 
		background-color:#fff;
		list-style-type:none;
		background-color:#456;
	}
	#mainDiv>ul{
		list-style-type:none;
		background-color:#456;
	}
	#bxslider img{
		width:800px;
		height:450px;
		margin:0 auto;
	}
	#aa{
		height:550px;
		margin:0 auto;
	}
	#lst>li{
		float:left;
		line-height:35px;
		height:35px;
		border-bottom:1px solid gray;
		width:10%;
	}
	#board{
		width:800px;
	}
	#board ul, #board li{
		list-style-type:none;
	}
	#board h1{
		text-align:center;
	}
	
	#lst>li:nth-of-type(6n+3){width:55%}
	#lst>li:nth-of-type(6n+1){width:5%}
	#lst>li:nth-of-type(6n+2){width:5%}
	#lst>li:nth-of-type(6n+4){width:15%}
	
	.wordCut{
		white-space:nowrap; 
		overflow:hidden;
		text-overflow:ellipsis; 
	}
	#paging{
		width: 280px;
		margin:0 auto;
		
	}
	#paging ul{
		height:40px;
		width:100%;
		overflow:auto;
		
	}
	#paging li{
		float:left;
		width:40px;
		height:40px;
		text-align:center;
		font-size:1em;
		
	}	
	.wordCut>a:link, .wordCut>a:visited, .wordcut>a:hover{
		color:#000;
		text-decoration:none;
	}

</style>
<script>
	$(function(){
		$("#seoulmenu>li").hover(function(){
			$(this).children("ul").css("display","block"); //this의 자손 ul .. a도 같이있으니까 ul쓴다
		},function(){
			$(this).children("ul").css("display","none");
		});

		$("#bxslider").bxSlider({
			mode : 'horizontal'
			,slideWidth:800
			,slideHeight:500
			,speed:1000
			,captions:true
			,auto:true
			,randomStart:true
			,infiniteLoop:false
			,hideControlOnEnd:true
		});
		
		$("#allCheck").on('change',function(){
			$("#board input").prop("checked", $("#allCheck").prop("checked")); //위에서 두줄로 한걸 한줄로
		});
		
	});
	
	
</script>

</head>
<body>

<div class="container">
	<%
		String logStatus = (String)session.getAttribute("logStatus");
		if(logStatus == null || logStatus.equals("")){
	%>
	<form method="post" action="<%=request.getContextPath()%>/SEOUL/loginOk.jsp" id="frm">
		<input type="text" name="userid" id="userid" maxlength="20" placeholder="아이디"/>
		<input type="password" name="userpwd" id="userpwd" maxlength="20" placeholder="비밀번호"/>
		<input id="logb" type="submit" value="로그인"/>
		<a href="#">회원가입</a>
		<a href="#">고객센터</a>
	</form>
	<% }else if(logStatus != null && logStatus.equals("Y")){ %>
		<div id="ri">
		<%=session.getAttribute("username") %><a href="<%=request.getContextPath()%>/SEOUL/logout.jsp">로그아웃</a>
		</div>
	<% } %>		
	
	<div id="a1">
	<a href="https://www.seoul.go.kr/main/index.jsp"><img src="img/seoul.png"/></a>			
	</div>		
				
	<div id="mainDiv">
	<ul id="seoulmenu">
		<li><a href="#">나의서울</a></li>
		<li><a href="#">전자우편</a></li>
		<li>
			<a href="#">서울소개</a>
			<ul>
				<li><a href="#">시청안내</a></li>
				<li><a href="#">서울의상점</a></li>
				<li><a href="#">서울의역사</a></li>
				<li><a href="#">서울정보</a></li>
			</ul>
		</li>
		<li>
			<a href="#">시민참여</a>
			<ul>
				<li><a href="#">서울시민과의대화</a></li>
				<li><a href="#">시민의견</a></li>
				<li><a href="#">공모전</a></li>
			</ul>
		</li>
		<li>
			<a href="#">청사안내</a>
			<ul>
				<li><a href="#">조직도</a></li>
				<li><a href="#">시의회</a></li>
				<li><a href="#">자치구</a></li>
			</ul>
		</li>		
	</ul>
	</div>		
	<div id="aa">
		<ul id="bxslider">
			<li><a href="#"><img src="img/banner1.jpg" title="Seoul Music Festival"/></a></li>
			<li><a href="#"><img src="img/banner2.jpg" title="SIBAC 2019"/></a></li>
			<li><a href="#"><img src="img/banner3.jpg" title="2019 서울전환도시 국제컨퍼런스"/></a></li>
			<li><a href="#"><img src="img/banner4.jpg" title="2019 다다다 발표대회"/></a></li>
			<li><a href="#"><img src="img/banner5.jpg" title="2019 서울인공지능챗본론"/></a></li>
			<li><a href="#"><img src="img/banner6.jpg" title="서울차 없는 날"/></a></li>
			<li><a href="#"><img src="img/banner7.jpg" title="Zero 제로페이 미국 캐나다 이벤트"/></a></li>
			<li><a href="#"><img src="img/banner8.jpg" title="GoGo페스티벌"/></a></li>
		</ul>
	</div>	
		
<%
	FreeboardDAO dao = new FreeboardDAO();
	int totalRecord = dao.getTotalRecord();
	int onePageRecord = 5; 
	int nowPage = 1;
	int totalPage = 0;
	int onePageNum = 5; 
	int startPage = 1; 
	String nowPageStr = request.getParameter("nowPage"); 
	if(nowPageStr != null){
		nowPage = Integer.parseInt(nowPageStr);
	}
	
	totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
	startPage = ((nowPage-1)/onePageNum*onePageNum)+1;
	List<FreeboardVO> list =dao.getAllRecord(nowPage, onePageRecord, totalPage, totalRecord);
	
%>


<div id="board">
	<h1>자유게시판</h1>
	<input type = "checkbox" id="allCheck" />&nbsp&nbsp전체 선택
	<ul id="lst">
		<li></li>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<%for(int i=0; i<list.size(); i++){
			FreeboardVO vo = list.get(i);
		%>
		<li><input type='checkbox' value='"+<%=i %>+"'/></li>
		<li><%=vo.getNo() %></li>
		<li class="wordCut"><a href="list.jsp?num=1"><%=vo.getSubject() %></a></li>
		<li><%=vo.getUserid() %></li>
		<li><%=vo.getWritedate() %></li>
		<li><%=vo.getHit() %></li>
		<%} %>
	</ul>
	<div id="paging">
		<ul>
		
			<li>
				<%if(nowPage==1){ %>
					<a href="#">Prev</a>
				<%}else{ %>
					<a href="/SEOUL/index.jsp?nowPage=<%=nowPage-1%>">Prev</a>
				<%} %>
			</li>
			

			<%for(int p=startPage; p<startPage+onePageNum; p++){
				if(p<=totalPage){ 
					if(p==nowPage){ 
			%>
				<li>
					<a href="/SEOUL/index.jsp?nowPage=<%=p%>" style="color:red"><%=p %></a>
				</li>
				
			<%  }else{ 	%>
			
				<li>
					<a href="/SEOUL/index.jsp?nowPage=<%=p%>"><%=p %></a>
				</li>
			<% 
					}
				}
			} %>
			
			<li> 
				<%if(nowPage<totalPage){ %>
					<a href="/SEOUL/index.jsp?nowPage=<%=nowPage+1%>">Next</a>	
				<%} %>
			</li>
		</ul>
	</div>
	
</div>		
		
		<%@ include file="SEOUL/footer.jspf" %>
</div>
</body>
</html>