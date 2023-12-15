// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

void main() {
  String fullName = promptUser("Enter your full name 📛: ", allowOnlyLetters: true);

  String gender;
  do {
    gender = promptUser("Enter your gender (M👨/F🙍): ");
  } while (gender.trim().isEmpty || (gender.toUpperCase() != 'M' && gender.toUpperCase() != 'F'));

  String title = getTitle(gender.toUpperCase(), allowOnlyLetters: true);

  if (fullName.isNotEmpty && title.isNotEmpty) {
    print("\nHappy New Year, $title $fullName! May this year bring you laughter, \nlove, and all you've been dreaming of. Happy 2024! 🎉🥳\n ");

    print('Please wait...');
    sleep(Duration(seconds: 4));
    
    String bankName;
    do {
      bankName = promptUser("Enter your bank name 🏦: ", allowOnlyLetters: true);
    } while (bankName.trim().isEmpty || !bankName.trim().contains(RegExp(r'^[a-zA-Z]+$')));

    int accountNumber = promptAccountNumber("Enter your account number: ");

    transferAmount(accountNumber, 10000, bankName);
    sleep(Duration(seconds: 4));
    print("₦10,000 has been transferred to your $bankName account. Enjoy the rest of today with your family!");
    sleep(Duration(seconds: 4));
    print('Happy new year🎉🥳');
    sleep(Duration(seconds: 2));
    print("{𝒮â𝗆𝗆𝗒 𝒞𝖮𝕯Ê'𝖲👨🏿🎯} Cares \n ");

  } else {
    print('Invalid input. Please provide a valid full name and gender (M/F) to get a new year wish.');
  }
}

String promptUser(String prompt, {bool allowOnlyLetters = false}) {
  String input;
  do {
    stdout.write(prompt);
    input = stdin.readLineSync()!;
    
    if (input == null || input.isEmpty || (allowOnlyLetters && !input.trim().contains(RegExp(r'^[a-zA-Z ]+$')))) {
      print(allowOnlyLetters
          ? 'Please enter a valid name with only letters.'
          : 'Please enter a valid non-empty string.');
    }
  } while (input == null || input.isEmpty || (allowOnlyLetters && !input.trim().contains(RegExp(r'^[a-zA-Z ]+$'))));
  
  return input;
}

String getTitle(String gender, {bool allowOnlyLetters = false}) {
  if (gender == 'M') {
    return 'Mr.';
  } else if (gender == 'F') {
    String titleChoice;
    do {
      titleChoice = promptUser("Enter your title (Miss🙍‍♀️/Mrs👰): ", allowOnlyLetters: true);
    } while (titleChoice.trim().isEmpty || (titleChoice.toUpperCase() != 'MISS' && titleChoice.toUpperCase() != 'MRS'));
    
    return titleChoice.toUpperCase() == 'MISS' ? 'Miss' : 'Mrs';
  } else {
    return '';
  }
}

int promptAccountNumber(String prompt) {
  int? accountNumber;
  do {
    stdout.write(prompt);
    String? accountInput = stdin.readLineSync();

    try {
      accountNumber = int.parse(accountInput!);
      if (accountInput.length != 10) {
        print("Invalid input: Account number must be 10 digits.");
        accountNumber = null;
      }
    } catch (e) {
      print("Please enter a valid account number.");
    }
  } while (accountNumber == null);

  return accountNumber;
}

void transferAmount(int accountNumber, int amount, String bankName) {
  print("Transferring ₦$amount to your $bankName...");
}
