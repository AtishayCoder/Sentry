import "package:http/http.dart" as http;

// Closed status

Future<String> getFrontDoorClosedStatus() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/statusFrontClosed'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

Future<String> getBackDoorClosedStatus() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/statusBackClosed'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

// Locked status

Future<String> getFrontDoorLockedStatus() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/statusFrontLocked'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

Future<String> getBackDoorLockedStatus() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/statusBackLocked'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

// Lock/unlock front door

Future<String> lockFrontDoor() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/lockFrontDoor'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

Future<String> unlockFrontDoor() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/unlockFrontDoor'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

// Lock/unlock back door

Future<String> lockBackDoor() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/lockBackDoor'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}

Future<String> unlockBackDoor() async {
  // TODO: Replace with ESP ip address
  final response = await http.get(Uri.parse('http://your_esp8266_ip/unlockBackDoor'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Status code: ${response.statusCode}\nMessage: ${response.body}");
    return "e";
  }
}