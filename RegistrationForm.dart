import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  // Gender
  String gender = 'Male';

  // Qualification
  bool tenth = false;
  bool twelfth = false;
  bool graduate = false;

  // City
  String city = 'City1';

  // Height
  double height = 48;

  // Birth Date
  DateTime? birthDate;

  // Birth Time
  TimeOfDay? birthTime;

  // ==================================================
  // DATE PICKER
  // ==================================================

  void selectDate() async {

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        birthDate = date;
      });
    }
  }

  // ==================================================
  // TIME PICKER
  // ==================================================

  void selectTime() async {

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        birthTime = time;
      });
    }
  }

  // ==================================================
  // SUBMIT
  // ==================================================

  void submitForm() {

    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter User Name'),
        ),
      );
      return;
    }

    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter Email'),
        ),
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter Password'),
        ),
      );
      return;
    }

    if (repasswordController.text != passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password does not match'),
        ),
      );
      return;
    }

    if (birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select Birth Date'),
        ),
      );
      return;
    }

    // Qualification
    String qualification = '';

    if (tenth) {
      qualification += '10th ';
    }

    if (twelfth) {
      qualification += '12th ';
    }

    if (graduate) {
      qualification += 'Graduate';
    }

    // Next page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          name: nameController.text,
          email: emailController.text,
          gender: gender,
          qualification: qualification,
          city: city,
          height: height,
          birthDate: birthDate!,
          birthTime: birthTime,
        ),
      ),
    );
  }

  // ==================================================
  // BUILD
  // ==================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Registration Form'),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // ==========================================
              // USER NAME
              // ==========================================

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // ==========================================
              // EMAIL
              // ==========================================

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // ==========================================
              // PASSWORD
              // ==========================================

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // ==========================================
              // RE-ENTER PASSWORD
              // ==========================================

              TextField(
                controller: repasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Re-enter Password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // ==========================================
              // GENDER
              // ==========================================

              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,

                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,

                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              Text(
                'Selected Gender: $gender',
              ),

              const SizedBox(height: 20),

              // ==========================================
              // QUALIFICATION
              // ==========================================

              const Text(
                'Qualification',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              CheckboxListTile(
                title: const Text('10th'),
                value: tenth,

                onChanged: (value) {
                  setState(() {
                    tenth = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text('12th'),
                value: twelfth,

                onChanged: (value) {
                  setState(() {
                    twelfth = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text('Graduate'),
                value: graduate,

                onChanged: (value) {
                  setState(() {
                    graduate = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ==========================================
              // CITY
              // ==========================================

              const Text(
                'City',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              DropdownButton<String>(
                value: city,

                items: const [

                  DropdownMenuItem(
                    value: 'City1',
                    child: Text('City1'),
                  ),

                  DropdownMenuItem(
                    value: 'City2',
                    child: Text('City2'),
                  ),

                  DropdownMenuItem(
                    value: 'City3',
                    child: Text('City3'),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    city = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ==========================================
              // HEIGHT
              // ==========================================

              Text(
                'Height: ${height.toInt()} inch',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Slider(
                min: 48,
                max: 84,
                divisions: 36,
                value: height,

                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),

              const Text('48 inch                    84 inch'),

              const SizedBox(height: 20),

              // ==========================================
              // DATE OF BIRTH
              // ==========================================

              const Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: selectDate,
                child: const Text('Select Birth Date'),
              ),

              if (birthDate != null)
                Text(
                  'Selected Date: '
                  '${birthDate!.day}/'
                  '${birthDate!.month}/'
                  '${birthDate!.year}',
                ),

              const SizedBox(height: 15),

              // ==========================================
              // TIME
              // ==========================================

              ElevatedButton(
                onPressed: selectTime,
                child: const Text('Select Birth Time'),
              ),

              if (birthTime != null)
                Text(
                  'Selected Time: ${birthTime!.format(context)}',
                ),

              const SizedBox(height: 25),

              // ==========================================
              // SUBMIT BUTTON
              // ==========================================

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: submitForm,

                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ======================================================
// RESULT PAGE
// ======================================================

class ResultPage extends StatelessWidget {

  final String name;
  final String email;
  final String gender;
  final String qualification;
  final String city;
  final double height;
  final DateTime birthDate;
  final TimeOfDay? birthTime;

  const ResultPage({
    super.key,
    required this.name,
    required this.email,
    required this.gender,
    required this.qualification,
    required this.city,
    required this.height,
    required this.birthDate,
    required this.birthTime,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('User Information'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              'User Name: $name',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Gender: $gender',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Qualification: $qualification',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'City: $city',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Height: ${height.toInt()} inch',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Birth Date: '
              '${birthDate.day}/'
              '${birthDate.month}/'
              '${birthDate.year}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Birth Time: '
              '${birthTime?.format(context) ?? "Not Selected"}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
