import 'package:flutter/material.dart';
import 'package:smart_home_ui/smar_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  List mySmartDevices = [
    ["Smart Light", "lib/icons/lightbulb-filled-tool-svgrepo-com (1).png", true],
    ["Smart AC", "lib/icons/air-conditioner-svgrepo-com.png", true],
    ["Smart TV", "lib/icons/smart-tv-svgrepo-com.png", true],
    ["Smart Fan", "lib/icons/fan-svgrepo-com.png", true],
  ];

  void powerSwitchChanged(bool value, int index) {

    setState(() {
      mySmartDevices [index] [2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
              vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //custom app bar
                  Image.asset('lib/icons/four-dots-horizontally-aligned-as-a-line.png',
                    height: 45,),
                  Icon(Icons.person, size: 45,),
                ],
              ),
            ),

            //hello username
            const SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Home,', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Afaq', style: TextStyle(fontSize: 60, color: Colors.grey[700]),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Divider(
                color: Colors.grey[500],

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Smart Devices', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            
            Expanded(child: GridView.builder(
              itemCount: mySmartDevices.length,
                padding: EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3,
                ),
                itemBuilder: (context, index) {
              return SmartDeviceBox(
                smartDeviceName: mySmartDevices [index] [0],
                iconPath: mySmartDevices [index] [1],
                powerOn: mySmartDevices [index] [2],
                onChanged: (value) => powerSwitchChanged(value, index),
              );
            }

            ),),


            // grid


          ],
        ),
      ),
    );
  }
}
