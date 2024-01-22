part of 'counter_cubit.dart';

class CounterSate extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterSate({this.counter = 0, this.transactionCount = 0});

  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterSate(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object?> get props => [counter, transactionCount];
}
