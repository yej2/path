<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?mk81pxl37n=pHuq8zg86s3Bmb3JMdVoLvZlJVixuOceg6KbohPi"></script>
<title>Insert title here</title>
</head>
<body>

 <div id="map" style="width:100%;height:1200px;"></div>

 <script>



 var mapOptions = {

    center: new naver.maps.LatLng(37.504875, 126.939053),

   zoom: 8

 };



 var map = new naver.maps.Map('map', mapOptions);

 </script>
</body>
</html>