<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>test</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1c2c6824adf9d857eb9ea8f41dde8ba"></script>
</head>
<body>
<div id="map" style="width:100%;height:800px;"></div>
<script id="data">

/* var markerPosition = marker.getPosition(); 
map.setCenter(markerPosition); */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도를 표시하는 div 크기를 변경하는 함수입니다
function resizeMap() {
var mapContainer = document.getElementById('map');
mapContainer.style.width = '650px';
mapContainer.style.height = '650px'; 
}

function relayout() {    

// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
map.relayout();

//지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 


});

map.setCenter(latlng);






}



</script>
</body>
</html>