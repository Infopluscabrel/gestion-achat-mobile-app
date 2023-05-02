class ApiResponse<T> {
  bool error;
  String errorMessage;
  T data;

  ApiResponse(
      {this.error = false, required this.errorMessage, required this.data});

  get success => null;
}
