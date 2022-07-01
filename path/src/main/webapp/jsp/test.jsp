<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>test</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mk81pxl37n"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1c2c6824adf9d857eb9ea8f41dde8ba"></script>
	<script src="../js/busstop.js"></script>
	<script src="../js/busname.js"></script>
	<link rel="stylesheet" href="../css/NewFile.css">
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div class="gokakao">
                <form onsubmit="return doSomething();" class="my-form">
	    			키워드 : <input type="text" value="진솔ins" name="name" size="15">
	   				<input type="submit" value="검색">
				</form>
            </div>
        </div>
        <hr class="hr1">
        <ul id="placesList">
        	<li>아래의 버튼을 누르면, 지도 타입이 바뀝니다.</li> 
        </ul>
        <div id="pagination">
        	<div class="pa5"><button onclick="setOverlayMapTypeId('traffic')" class="w-btn-outline w-btn-blue-outline">교통정보 보기</button></div>
        	<div class="pa5"><button onclick="setOverlayMapTypeId('roadview')" class="w-btn-outline w-btn-blue-outline">로드뷰 도로정보 보기</button></div>
        	<div class="pa5"><button onclick="setOverlayMapTypeId('bicycle')" class="w-btn-outline w-btn-blue-outline">자전거도로 정보 보기</button></div>
			<div class="pa5"><button onclick="setOverlayMapTypeId('true')" class="w-btn-outline w-btn-blue-outline">기본 지도 타입</button></div>
        </div>
        <hr class="hr2">
        <div>집까지 가는 방법</div>
        <div>
        	<div class="bus1">5623번 버스</div>
        	<div class="bus2">
	        	<details>
	        		<summary>(구로디지털단지역 승차 -- 석수역 하차)</summary>
	        		구로디지털단지역</br>
	        		문성초등학교</br>
	        		금천우체국</br>
	        		말미고개금천소방서</br>
	        		금천구청.금천경찰서</br>
	        		시흥사거리</br>
	        		박미삼거리.국립전통예술중고</br>
	        		시흥유통센터</br>
	        		석수역
	        	</details>
        	</div>
        	<div class="bus1">3001번 버스</div>
        	<div class="bus2">
	        	<details>
	        		<summary>(석수역 승차 -- 쌍용아파트 하차)</summary>
	        		석수역</br>
	        		신동아3차아파트</br>
	        		쌍용아파트
	        	</details>
        	</div>
        	<div class="bus1">515번 버스</div>
        	<div class="an">
	        	<details>
	        		<summary>(쌍용아파트 승차 -- 재흥시장 하차)</summary>
	        		쌍용아파트</br>
	        		신기.남부종합시장(진흥사거리)</br>
	        		로얄아파트</br>
	        		재흥시장
	        	</details>
        	</div>
        </div>
        <hr class="hr2">
        <div>가장 가까운 정류장으로 이동합니다.</div>
        <div class="gocloser">
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="go1()">디지털산업1단지</button></div>
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="go2()">JNK디지털타워</button></div>
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="go3()">한국산업기술시험원.디지털탑프라자</button></div>
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="go4()">구로디지털단지우체국</button></div>
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="go5()">한국산업단지공단.이마트구로점</button></div>
        </div>
        <hr class="hr2">
        <div>카카오맵으로 길을 찾을 수 있습니다.</div>
        <div class="gocloser">
        	<div class="pa5"><button class="w-btn-outline w-btn-blue-outline" onclick="window.open('https://map.kakao.com/link/to/18577297')">길찾기</button></div>
    	</div>
    </div>
</div>
<script id="data">
// 지도 첫 시작
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.5002697, 126.8725686), // 지도의 중심좌표
    level: 9 // 지도의 확대 레벨 
}; 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//처음에 현재위치로 중심좌표 변경
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
// GeoLocation을 이용해서 접속 위치를 얻어옵니다
navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도
    
    var locPosition = new kakao.maps.LatLng(lat, lon);
    map.setCenter(locPosition);         
  });
} else {
	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
	map.setCenter(locPosition);
	alert("현재위치 사용 불가!!");	
}


// 줌 6 이하 일때만 버스정류장 보이도록!
var markers=[];

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
	
	markers.push(marker);
}
// 처음에는 버스정류장 안보이게!
for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
};

var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
// 지도가 확대 또는 축소되면 이벤트 등록!
kakao.maps.event.addListener(map, 'zoom_changed', function() {          
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    console.log("현재 zoom level : " + level)
    
    if (level <= 6) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }
    else {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
    }
});

//선 그리기
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

//선 거리 계산하기
var distance = Math.round(polyline.getLength() + polyline2.getLength() + polyline3.getLength());
// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
var walkkTime = distance / 67 | 0;
var walkHour = '', walkMin = '';

// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="dotOverlay distanceInfo">';
	    content += '    <li class="li1">';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li class="li2">';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li class="li3">';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'
	
//커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(37.45311525, 126.6800162);  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
 position: position,
 content: content,
 xAnchor: 0,
 yAnchor: 0,
 zIndex: 3 
});

//커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map);


//지도에 추가된 지도타입정보를 가지고 있을 변수입니다
var currentTypeId;

// 버튼이 클릭되면 호출되는 함수입니다
function setOverlayMapTypeId(maptype) {
    var changeMaptype;
    
    // maptype에 따라 지도에 추가할 지도타입을 결정합니다
    if (maptype === 'traffic') {            
        
        // 교통정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
        
    } else if (maptype === 'roadview') {        
        
        // 로드뷰 도로정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.ROADVIEW;    

    } else if (maptype === 'bicycle') {
        
        // 자전거 도로 지도타입
        changeMaptype = kakao.maps.MapTypeId.BICYCLE;    

    } else if (maptype === 'true') {
        
        // 원래대로 지도타입
    	map.removeOverlayMapTypeId('traffic');
    	map.removeOverlayMapTypeId('roadview');    
    	map.removeOverlayMapTypeId('bicycle');    
    }
    
    // 이미 등록된 지도 타입이 있으면 제거합니다
    if (currentTypeId) {
        map.removeOverlayMapTypeId(currentTypeId);    
    }
    
    // maptype에 해당하는 지도타입을 지도에 추가합니다
    map.addOverlayMapTypeId(changeMaptype);
    
    // 지도에 추가된 타입정보를 갱신합니다
    currentTypeId = changeMaptype;        
}

//버튼 함수
function go1() {             
	var moveLatLon = new kakao.maps.LatLng(37.48408965, 126.895158);
	map.setCenter(moveLatLon);
	map.setLevel(1);
};

function go2() {             
	var moveLatLon = new kakao.maps.LatLng(37.48218333, 126.8973976);
	map.setCenter(moveLatLon);
	map.setLevel(1);
};
function go3() {             
	var moveLatLon = new kakao.maps.LatLng(37.48161251, 126.8973623);
	map.setCenter(moveLatLon);
	map.setLevel(1);
};
function go4() {             
	var moveLatLon = new kakao.maps.LatLng(37.48408103, 126.8966246);
	map.setCenter(moveLatLon);
	map.setLevel(1);
};
function go5() {             
	var moveLatLon = new kakao.maps.LatLng(37.48161251, 126.8973623);
	map.setCenter(moveLatLon);
	map.setLevel(1);
};

//검색 후 카카오맵에 바로 검색될 수 있도록
// 공백이나 잘못된 숫자 구현 못함
/* function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    console.log(keyword);
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB);
    console.log("콜백");    
} */

function doSomething() {
    var url = document.forms[0].elements['name'].value;
    window.location = "https://map.kakao.com/link/search/" + url 
    return false;
}

</script>
</body>
</html>