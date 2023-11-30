abstract class Failure {
  final String message;
  Failure(this.message);
}

class SomespecificError extends Failure {
  SomespecificError(String message) : super(message);
}
