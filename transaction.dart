class Transaction {
  String name;
  double code;
  DateTime createdDate;

  Transaction({this.name, this.code, this.createdDate});

  @override
  String toString() {
    // TODO: implement toString
    return 'name = $name , code = $code , date = $createdDate';
  }
}
