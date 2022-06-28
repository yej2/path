<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>main</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mk81pxl37n"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1c2c6824adf9d857eb9ea8f41dde8ba"></script>
	<script src="../js/busstop.js"></script>
	<script src="../js/busname.js"></script>
</head>
<body>
<div id="map" style="width:100%;height:800px;"></div>
<script id="data">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.5002697, 126.8725686), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨 
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다




/* var positions = [
    {lat: 37.51130452596103,lng: 127.04542646710686, },
    {lat: 37.4772540117351,lng: 127.045480690923}
]; */

/* var po = ['살루쪼','일공공일안경콘택트 강남포이점']; */

//마커 이미지의 이미지 주소입니다
var imageSrc = "../resource/busicon.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(10, 10); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: new kakao.maps.LatLng(positions[i].posY, positions[i].posX), // 마커를 표시할 위치
    title : po[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}

//선 그릴 좌표들 5623번 버스
var linePath1 = [
    new kakao.maps.LatLng(37.48309943, 126.9015481),
    new kakao.maps.LatLng(37.474034, 126.89833),
    new kakao.maps.LatLng(37.470136, 126.898003),
    new kakao.maps.LatLng(37.46473, 126.897285),    
    new kakao.maps.LatLng(37.457727, 126.899097),   
    new kakao.maps.LatLng(37.45292097, 126.9010983),   
    new kakao.maps.LatLng(37.449067, 126.902663),   
    new kakao.maps.LatLng(37.440823, 126.903133),    
    new kakao.maps.LatLng(37.43464329, 126.9027292)
];

//선 그릴 좌표들 3001번 버스
var linePath2 = [
	new kakao.maps.LatLng(37.43464329, 126.9027292),	
    new kakao.maps.LatLng(37.44077927, 126.6784269),    
    new kakao.maps.LatLng(37.44510362, 126.6790962)
];

//선 그릴 좌표들 515번 버스
var linePath3 = [
	new kakao.maps.LatLng(37.44510362, 126.6790962),
    new kakao.maps.LatLng(37.44768231, 126.6796119),
    new kakao.maps.LatLng(37.44931846, 126.6798623),
    new kakao.maps.LatLng(37.45311525, 126.6800162)
];

var polyline = new kakao.maps.Polyline({
    path: linePath1, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#00A50B', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

var polyline2 = new kakao.maps.Polyline({
    path: linePath2, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#103EF3', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

var polyline3 = new kakao.maps.Polyline({
    path: linePath3, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#F31010', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);
polyline2.setMap(map);
polyline3.setMap(map);


</script>
</body>
</html>