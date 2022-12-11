abstract class Failure {
  final String? message;
  const Failure({this.message});
}

class FetchFailure extends Failure {
  const FetchFailure({String? message}) : super(message: message);
}
