var map = new naver.maps.Map('map', {
  zoom: 11,
  mapTypes: new naver.maps.MapTypeRegistry({
    'normal': naver.maps.NaverStyleMapTypeOptions.getNormalMap(
      {
        overlayType: 'bg.ol.ts.bs'
      }
    )
  })
});