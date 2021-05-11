import 'package:rover/position.dart';

/// Define a machine message from a human message
class Message {
  String _shortMessage = '';
  String get shortMessage => _shortMessage;

  Message(String message) {
    generateShortMessage(message);
  }

  /// Get a human command list and translate for a short list 
  void generateShortMessage(String message) {
    var i = 0;
    while (i < message.length) {
      var char = message[i];
      var repetitions = _repetitions(message: message, position: i);
      _shortMessage+= '$repetitions$char';
      i += repetitions;
    }
  }

  /// Discover how many times a char at [position] repeats on a [message] consecutively
  int _repetitions({String message, int position}) {
    var count = 0;
    var char = message[position];
    while(position < message.length) {
      if (message[position] != char) break;
      position++;
      count++;
    }

    return count;
  }
}