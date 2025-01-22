abstract class ResultData<T> {
  const ResultData();
}

class ResultDataComplete extends ResultData<void> {
  const ResultDataComplete();
}

class ResultDataSuccess<T> extends ResultData<T> {
  final T? data;
  const ResultDataSuccess({this.data});
}

class ResultDataLoading extends ResultData<void> {
  const ResultDataLoading();
}

class ResultDataFailed extends ResultData<void> {
  final String? message;
  final String? status;
  final List<String>? messages;

  const ResultDataFailed({this.message, this.status, this.messages});
}

class ResultDataException extends ResultData<void> {
  final Exception? exception;
  const ResultDataException({this.exception});
}
