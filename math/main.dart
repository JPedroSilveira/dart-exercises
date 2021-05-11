import 'dart:math';

void main() {
  String str = "oi euã 3 sou o goku 123";
  
  CharCount charCount = CharCount();
  charCount.addString(str);
  print('String: $str');
  charCount.printCount();
  print("\n");
  
  int sumEnd = 100;
  int sumResult = sumNumbersBetweenZeroAnd(sumEnd);
  print('Sum between 0 and $sumEnd: $sumResult');
  print("\n");
  
  int factorialValue = 20;
  int factorialResult = factorialOf(factorialValue);
  print('Factorial of $factorialValue is: $factorialResult');
  print("\n");
  
  int primeTestValue = 97;
  List<int> primes = primeNumbersBetweenZeroAnd(primeTestValue);
  print('Prime numbers between 0 and $primeTestValue: ${primes.join(',')}');
  print("\n");
  
  int fibonacciLength = 10;
  List<int> fibonacciSequence = fibonacciSequenceOfLength(fibonacciLength);
  print('The first $fibonacciLength numbers of fibonacci sequence are: ${fibonacciSequence.join(',')}');
}


/// Return a list with the first [length] numbers of fibonacci sequence
List<int> fibonacciSequenceOfLength(int length) {
  if (length <= 0) return [];
  if (length == 1) return [1];
  
  List<int> numbers = [1, 1];
  
  for (int i = 2; i < length; i++) {
    numbers.add(numbers[i-1] + numbers[i-2]);
  }
  
  return numbers;
}

/// Return a list of prime numbers between zero and [end]
///
/// Accepts only positive numbers.
List<int> primeNumbersBetweenZeroAnd(int max) {
  List<int> primes = [];
  for (int i = 3; i <= max; i++) {
    if (isPrime(i)) primes.add(i);
  }
  
  return primes;
}


/// Check if number is prime
///
/// Accepts only positive numbers.
bool isPrime(int value) {
  double maxDivisor = sqrt(value);
  for (int i = 2; i <= maxDivisor.toInt(); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  
  return true;
}

/// Calculate the factorial of [value]
///
/// Accepts only positive numbers.
int factorialOf(int value) {
  if (value < 0) return 0;
  
  int result = 1;
  for (int i = 2; i <= value; i++) {
    result *= i;
  }
  
  return result;
}


/// Return the sum of all numbers between zero and [end].
///
/// Accepts only positive numbers.
int sumNumbersBetweenZeroAnd(int end) {
  if (end < 0) return 0;
  double result = end * (end + 1)/2;
  return result.toInt();
}

const CONSONANTS = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'];

const VOWELS = ['a','e','i','o','u'];

/// Define struct to analize chars.
///
/// Count the number of chars, consonants, vowels, numbers and character repetition.
class CharCount {
  Map<String, int> _lettersCount = <String, int>{};
  int _consonants = 0;
  int _vowels = 0;
  int _numbers = 0;
  int _chars = 0;
  
  CharCount();
  
  /// Add a new string to count
  void addString(String str) {
      for (int i = 0; i < str.length; i++) {
        var char = str[i];
        addChar(char);
      }
  }
  
  /// Add a new char to count
  void addChar(String char) {
    if (char.isEmpty) {
      return;
    }
    
    if (char.length > 1) {
      addString(char);
      return;
    }
    
    bool isNumber = int.tryParse(char) != null;
    if (isNumber) {
      _numbers++;
    } else if (CONSONANTS.contains(char.toLowerCase())) {
      _consonants++;
      countChar(char);
    } else if (VOWELS.contains(char.toLowerCase())) {
      _vowels++;
      countChar(char);
    }
    
    _chars++;
  }
  
  /// Add char to repetition
  void countChar(String char) {
    int? letterCount = _lettersCount[char];
    if (letterCount != null) {
      _lettersCount[char] = letterCount + 1;
    } else {
      _lettersCount[char] = 1;
    }
  }
  
  /// Print result on console
  void printCount() {
    print('Consonants: $_consonants');
    print('Vowels: $_vowels');
    print('Numbers: $_numbers');
    print('Not Numbers: ${_chars - _numbers}');
    print('Char count:');
    _lettersCount.forEach((letter, count) => print(' - "$letter": $count'));
  }
}