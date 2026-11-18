// Student: Ishimwe Promesse
// Reg no: 26022
const String regNo = '26022';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// momoFee copied from D2
// by IP
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// 1. formatRwf
// by IP
String formatRwf(int amount) {
  String sign = amount < 0 ? '-' : '';
  String absStr = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = absStr.length - 1;
  while (i >= 0) {
    result = absStr[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  return ' RWF';
}

// 2. isValidPin
// by IP
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  bool allDigits = true;
  int i = 0;
  while (i < pin.length) {
    if (pin.codeUnitAt(i) < 48 || pin.codeUnitAt(i) > 57) {
      allDigits = false;
      break;
    }
    i++;
  }
  if (!allDigits) return false;

  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
      break;
    }
    j++;
  }
  if (allSame) return false;

  return true;
}

// 3. sendMoney
// by IP
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print('Sent  (fee ). New balance: ');
  return newBalance;
}

// 4. buyAirtime
// by IP
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000 || amount > balance) {
    print('Failed: invalid airtime amount or insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime . New balance: ');
  return newBalance;
}

void main() {
  print('Reg no:  | D =  | T = ');

  // 1. PIN tests
  print(isValidPin('12345')); // false
  print(isValidPin('77777')); // false
  print(isValidPin('4821' + d.toString())); // test with D
  print(isValidPin('48a21')); // false
  print(isValidPin('4821D')); // false

  // 2. Balance setup
  int balance = 20000 + t * 500;
  print('Starting balance: ');

  // 3. Transactions in order
  int count = 0;
  while (count < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    count++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ');

  // 5. Additional test calls
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000));   // Expected: -5,000 RWF
  print(isValidPin('00000'));// Expected: false
}
