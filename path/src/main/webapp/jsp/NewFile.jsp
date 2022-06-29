<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script>
function doSomething() {
    var url = document.forms[0].elements['name'].value;
    window.location = "https://map.kakao.com/link/search/" + url 
    return false;
}
</script>



</head>
<body>
<form onsubmit="return doSomething();" class="my-form">
    키워드 : <input type="text" value="진솔INS" name="name" size="15">
    <input type="submit" value="검색">
</form>
</body>
</html>