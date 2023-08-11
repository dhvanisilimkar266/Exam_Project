import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/modal/modalPAge.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController DateContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: GoogleFonts.robotoSlab(fontSize: 50, color: Colors.black87),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffCCD6A6)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(120),
            bottomRight: Radius.circular(120),
          ),
        ),
        backgroundColor: Color(0xffCCD6A6).withOpacity(0.35),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              controller: DateContoller,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' BOD',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.black87,
                  size: 80,
                ),
              ),
              style: TextStyle(color: Colors.black87, fontSize: 40),
              keyboardType: TextInputType.text,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019, 1),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    DateContoller.text =
                        "${pickedDate.day}/${pickedDate.month}";
                  });
                } else {
                  setState(() {
                    DateContoller.text = DateTime.now().toString();
                  });
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.black,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            ...day.map(
                              (day) => Text(
                                "\t  ${day}",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.black87,
            ),
            ...time.map(
              (timeSlot) => Row(
                children: [
                  Container(
                    width: 110,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      timeSlot,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.black87,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffDAE2B6).withOpacity(0.90),
    );
  }
}
