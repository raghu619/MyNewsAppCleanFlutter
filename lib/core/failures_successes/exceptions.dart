// we cannot extends the class which has a factory constructor
class FetchException implements Exception {
  final String? message;
  const FetchException({this.message});
}
