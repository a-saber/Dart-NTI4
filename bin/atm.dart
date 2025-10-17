import 'dart:io';

void main() {
  int balance = 1000;
  print('''
Welcome to the Banking App!
your current balance is: \$$balance
please select your transaction:
1. Deposit
2. Withdraw
3. Check Balance
4. Exit
''');
  String? option = stdin.readLineSync();
// validate option
  if (option == null) {
    print('You must enter an option');
    return;
  } else {
    int optionAsInt = int.tryParse(option) ?? 0;
    switch (optionAsInt) {
      case 0:
      case 1:
        // Deposit
        int depositAmount = int.tryParse((stdin.readLineSync() ?? '0')) ?? 0;
        if (depositAmount <= 0) {
          print('You must enter a valid amount to deposit');
          return;
        } else {
          balance = balance + depositAmount;
        }
      case 2:
        // withdraw
        int withdrawAmount = int.tryParse((stdin.readLineSync() ?? '0')) ?? 0;
        if (withdrawAmount <= 0) {
          print('You must enter a valid amount to withdraw');
          return;
        } else if (withdrawAmount > balance) {
          print(
              'You do not have enough balance to withdraw that amount\nYour current balance is: \$$balance');
          return;
        } else {
          balance -= withdrawAmount;
        }
      case 3:
        // check balance
        print('Your current balance is: \$$balance');

      default:
        print('You have entered wrong option');
        return;
    }
  }
  print('Your current balance is: \$$balance');
}
