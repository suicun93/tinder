import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ImageConverter {
	// singleton constructor
	ImageConverter._privateConstructor();
	
	// singleton instance
	static final ImageConverter instance = ImageConverter._privateConstructor();
	
	Uint8List getImage(String base64Image) {
		Uint8List _bytesImage = base64Decode(base64Image);
		return _bytesImage;
	}
	
	Future<String> imageToBase64(String url) async {
		http.Response response = await http.get(Uri.parse(url));
		final bytes = response.bodyBytes;
		return base64Encode(bytes);
	}
}