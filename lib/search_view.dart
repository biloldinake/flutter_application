import 'package:flutter/material.dart';

class searchview extends StatefulWidget {
   searchview({super.key});

  
  @override
  State<searchview> createState() => _searchviewState();
  
}

class _searchviewState extends State<searchview> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/biloldin.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: controller,

            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context,controller.text);
                },
                icon: Icon(
                  Icons.skip_next_outlined,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
              hintText: 'Shaardan atin jaz',
              helperStyle: TextStyle(
                color: Colors.grey,
              ),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 4,
                color: Colors.cyanAccent,
              )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
