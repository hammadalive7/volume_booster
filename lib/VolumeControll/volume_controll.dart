import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

import '../Common/user_manual.dart';

class VolumeControlScreen extends StatefulWidget {
  const VolumeControlScreen({super.key});

  @override
  _VolumeControlScreenState createState() => _VolumeControlScreenState();
}

class _VolumeControlScreenState extends State<VolumeControlScreen> {
  double _volumeListenerValue = 0;
  double _setVolumeValue = 0;
  bool _isLocked = true;
  int _selectedIndex = 0;



  final List<Widget> _pages = [ VolumeControlScreen()  ];
  //scfold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  void _toggleLock() {
    setState(() {
      _isLocked = !_isLocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        //center title
        centerTitle: true,
        title: const Text('Volume Booster', style: TextStyle(color: Colors.black),),
        // Add the menu icon to the AppBar
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,),

            // Open the Drawer when the menu icon is clicked
            onPressed: () => _scaffoldKey.currentState?.openDrawer(), // And this!

        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Diamond icon
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white54,
                    ),
                    child:  Row(
                      children: const [
                        Icon(Icons.diamond, color: Colors.yellow, size: 60,),
                        SizedBox(width: 10,),
                        Center(child: Text('Remove ADs', style: TextStyle(fontSize: 20, color: Colors.grey),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //divider
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('How to use?'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  UserManual(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share this App'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('More Apps'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_outline),
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
              },
            ),
            // Add more ListTiles for additional screens
          ],
        ),
      ),
      body: Column(

        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            height: 230,
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Boost'),
                      SizedBox(width: 16),
                      // Switch(
                      //   value: _isLocked,
                      //   onChanged: (value) {
                      //     _toggleLock();
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //volume icon
                        Icon(Icons.volume_up),
                        SizedBox(width: 16),
                        Flexible(
                          child: Slider(
                            min: 0,
                            max: 2,
                            onChanged: (double value) {
                              if (!_isLocked) {
                                _setVolumeValue = value;
                                VolumeController().setVolume(_setVolumeValue/2);
                                setState(() {});
                              }
                            },
                            value: _setVolumeValue,
                          ),
                        ),
                        //volume percentage
                        Text('${(_setVolumeValue * 100).round()}%'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(

                    onPressed: () {
                      _toggleLock();
                    },
                    child: Text(_isLocked ? 'Unlock Volume Control' : 'Lock Volume Control'),
                    style: ButtonStyle(
                      //size
                      minimumSize: MaterialStateProperty.all(Size(300, 40)),
                      backgroundColor: MaterialStateProperty.all(_isLocked ? Colors.red : Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 46),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Are you tired of these ADs? Upgrade!'),
              SizedBox(width: 6),
              TextButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.diamond, color: Colors.yellow, size: 60,),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Tired of Annoying Ads',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'We are sorry about it, we try our best to keep the amount of  ads  as  minimum as possible but in order to keep our App free for all we will have to keep showing ads  if  don’t  want  to  continue  seeing these ads  you  can  remove  the ads  fora  very cheap  price,  this  helps us  to maintain  the app  and keep it free for everyone, Thanks \nTEAM ASQUARE',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              //button size
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(500, 40),
                              ),
                              //Navigate to VolumeControlScreen
                              onPressed: () {
                                //pop the dialog
                                Navigator.of(context).pop();

                              },
                              child: const Text('Remove ADs'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  //rounded corners
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),

                  //border
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text('Remove ADs'),
              ),


            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 350,
            width: 370,
            //set grey background
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child:  Text(
                'No ADs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
