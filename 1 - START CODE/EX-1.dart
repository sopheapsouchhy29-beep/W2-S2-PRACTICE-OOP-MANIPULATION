enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city ($_zipCode)';
}

class Employee {
  static const double _defaultBaseSalary = 40000;

  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._address,
    this._yearsOfExperience,
    this._skills, [
    this._baseSalary = _defaultBaseSalary,
  ]);


  Employee.mobileDeveloper(
    this._name,
    this._address,
    this._yearsOfExperience, [
    this._baseSalary = _defaultBaseSalary,
  ]) : _skills = const [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  
  double computeSalary() {
    double totalSalary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

  void printDetails() {
    print(
      'Employee: $_name | Address: $_address | Experience: $_yearsOfExperience yrs | '
      'Skills: ${_skills.map((s) => s.name).join(', ')} | '
      'Base Salary: \$${_baseSalary.toStringAsFixed(2)} | '
      'Total Salary: \$${computeSalary().toStringAsFixed(2)}',
    );
  }
}

void main() {
  const addr1 = Address('St 2004', 'Phnom Penh', '12000');
  const addr2 = Address('National Road 6A', 'Phnom Penh', '12100');

  var emp1 = Employee('Sokea', addr1, 3, [Skill.OTHER]);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper('Ronan', addr2, 5);
  emp2.printDetails();
}