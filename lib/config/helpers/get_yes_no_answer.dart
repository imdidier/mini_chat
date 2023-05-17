import 'package:dio/dio.dart';
import 'package:mini_chat/domain/entities/message.dart';
import 'package:mini_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
