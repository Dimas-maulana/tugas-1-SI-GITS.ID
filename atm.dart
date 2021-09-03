// @dart=2.9
import 'dart:io';

main() {
  login();
}

class user {
  String nama;
  int pin;
  int saldo;

  user(this.nama, this.pin, this.saldo);

  String getNama(){
    return nama;
  }

  int getPin(){
    return pin;
  }

  int getSaldo(){
    return saldo;
  }
setSaldo(int saldo){
  this.saldo = saldo;
}
}

List<User> user = [
  User('Dimas', 12345, 100000);
  User('Maulana', 54321, 50000);
];

User user;

void login(){
  if (checkUser()){
    homePage();
  }else {
    main();
  }
}

bool checkUser(){
  bool Login = false;
  print('\n');
  print('Masuk');
  stdout.write('Masukkan PIN : ');

  var pin = int.parse(stdin.readLineSync());
  for (Users usr in user) {
    if (pin == usr.getPin()) {
      user = usr;
      Login = true;
    }
  }
  return Login;
}

void home(){
  var nama = user.getNama();
  print('\n');
  print('1 = Transfer');
  print('2 = Tarik Tunai');
  print('3 = Setor tunai');
  stdout.write('Pilih menu : ');

  menuPage();
}

void menuPage(){
  var menu = stdin.readLineSync();
  switch (menu){
    case '1':
    transfer();
    break;
    case '2':
    tarik();
    break;
    case '3':
    setor();
    break;

    default:
      print('\n');
      print('Menu tidak tersedia');
      print('\n');
      stdout.write('pilih 1,2 atau 3 : ');
      menuPage();
  }
}

void transfer(){
  print('\n');
  print('Transfer');
  stdout.write('rekening = ');
  var rekening = int.parse(stdin.readLineSync());
  stdout.write('jumlah = ');
  var jumlah = int.parse(stdin.readLineSync());
  if (user.getSaldo() > jumlah) {
    updateSaldo(-jumlah);
  } else{
    print('saldo tidak cukup');
  }
}

void tarik() {
  print('\n');
  print('Tarik Tunai');
  stdout.write('jumlah = ');
  var jumlah = int.parse(stdin.readLineSync());
  if (user.getSaldo() > jumlah) {
    updateSaldo(-jumlah);
  } else{
    print('saldo tidak cukup');
  }
}

void setor() {
  print('\n');
  print('Setor tunai');
  stdout.write('jumlah : ');
  var jumlah = int.parse(stdin.readLineSync());
  updateSaldo(jumlah);
}