import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class Failure with _$Failure {
  const factory Failure.server({
    required StackTrace stacktrace,
    String? message,
  }) = ServerFailure;
}
