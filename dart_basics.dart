// Student: Ishimwe Promesse
// Reg no: 26022
const String regNo = '26022';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part B2: countVowels
// by IP
int countVowels(String text) {
  int count = 0;
  String lower = text.toLowerCase();
  for (int i = 0; i < lower.length; i++) {
    String char = lower[i];
    if (char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u') {
      count++;
    }
  }
  return count;
}

// Part B3: initials
// by IP
String initials(String fullName) {
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (var part in parts) {
    if (part.isNotEmpty) {
      result += '.';
    }
  }
  return result;
}

// Part C5: drawTriangle
// by IP
void drawTriangle(int height) {
  if (height <= 0) return;
  for (int i = 1; i <= height; i++) {
    String spaces = ' ' * (height - i);
    String char = (i % 2 != 0) ? '*' : '#';
    String symbols = char * i;
    print(spaces + symbols);
  }
}

// Part D2: MoMo receipt printer functions
// by IP
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  return '*****';
}

void main() {
  print('Reg no:  | D =  | T = ');
  
  // B2 Execution
  String myName = 'Ishimwe Promesse';
  print(' has  vowels');

  // B3 Execution
  print(initials('Ishimwe Promesse'));
  print(initials(' ana uwase '));
  print(initials('   '));

  // C5 Execution
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2 MoMo loop execution
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt  |  RWF | fee  RWF | to ');
    i++;
  }
  print('Total fees:  RWF');
}
