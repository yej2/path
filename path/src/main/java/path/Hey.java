package path;
@ResponseBody

@RequestMapping(value = "/rtInfomartion", method = RequestMethod.GET, produces = "application/text; charset=utf8")

public String rtInfomartion(Locale locale, Model model) throws IOException{

	StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getLowBusPosByRtid"); 

	

	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=API키"); 

	urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode("100100118", "UTF-8")); 

	URL url = new URL(urlBuilder.toString());

	HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	conn.setRequestMethod("GET");

	conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");



	BufferedReader rd;

	if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {

		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	} else {

		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));

	}

	StringBuilder sb = new StringBuilder();

	String line;

	while ((line = rd.readLine()) != null) {

		sb.append(line);

	}

	rd.close();

	conn.disconnect();		

	return sb.toString();			

}
