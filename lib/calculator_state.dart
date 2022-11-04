class CalculatorState {
  final double number;

  const CalculatorState(this.number);

  CalculatorState operator +(double other) =>
      CalculatorState(number + other);
  CalculatorState operator -(double other) =>
      CalculatorState(number - other);
  CalculatorState operator *(double other) =>
      CalculatorState(number * other);
  CalculatorState operator /(double other) =>
      CalculatorState(number / other);

  @override
  String toString() => number.toString();
}
