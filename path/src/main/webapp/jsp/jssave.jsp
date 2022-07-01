<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/test2.js"></script>
<title>왜안되니</title>
</head>


<body>
<form onsubmit="searchPlaces();">
    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
    <button type="submit">검색하기</button> 
</form>

<form name="frm" method="post">
 <input type="text" value="이태원 맛집" id="url" size="15">
<button type="submit" onclick="sendit()">검색하기</button> 
</form>



</body>
</html>