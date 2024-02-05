import '../../../core/base_request.dart';

class GetDetailedProductRequest extends Request {
  final int? id;

  GetDetailedProductRequest({this.id});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }
}
