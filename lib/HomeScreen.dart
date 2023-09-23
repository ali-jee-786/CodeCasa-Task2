import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/TimerProviderModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<TimerProviderModel>(
      builder: ((context, value, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Stopwatch'),
            centerTitle: true,
          ),
          body: Column(

            children: [
              const SizedBox(
                height: 140,
              ),
              Text(
                value.min <= 9 ?
                '0${value.hour} : 0${value.min} : ${value.sec.toString().padLeft(2, '0')}'
                    :
                '0${value.hour} : ${value.min} : ${value.sec.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 50, color: Colors.white),

              ),
              const SizedBox(
                height: 160,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (value.alreadyStart == false) {
                          value.start();
                            value.alreadyStart = true;
                            value.startColor = Colors.red;
                            value.stopColor = Colors.blue;
                        }
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: value.startColor,

                        child: const Center(child: Text('Start',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (value.alreadyStart == true) {
                          value.stop();

                          value.stopColor = Colors.red;
                            value.startColor = Colors.blue;
                        }
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: value.stopColor,
                        child: const Center(child: Text('Stop',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500),)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onLongPressStart: (val) {
                          if (value.alreadyStart == true) {
                            value.hold();
                            value.holdColor = Colors.red;
                          }
                        },
                        onLongPressEnd: (val) {

                            value.start();
                            value.alreadyStart = true;
                            value.holdColor = Colors.blue;
                            value.stopColor = Colors.blue;
                            value.startColor = Colors.red;

                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: value.holdColor,
                          child: const Center(child: Text('Hold',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w500),)),
                        )
                      )

                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),

              value.saved == true?

              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 2),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                          child: Text(
                            value.min <= 9 ?
                            'Saved at 0${value.savedHour} : 0${value.savedMin} : ${value.savedSec.toString().padLeft(2, '0')}'
                                :
                            'Saved at 0${value.savedHour} : ${value.savedMin} : ${value.savedSec.toString().padLeft(2, '0')}',
                            style: const TextStyle(color: Colors.greenAccent, fontSize: 20),
                          )
                      ),
                      InkWell(
                          onTap: (){
                            value.removeSaveTime();
                          },
                          child: Icon(
                            Icons.highlight_remove_rounded,
                            size: 35,
                            color: Colors.grey.shade300,))
                    ],
                  ),
                ),
              )
                  :
              Container(),

            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  value.reset();
                },
                label: const Icon(CupertinoIcons.restart),
              ),
              const SizedBox(width: 5,),
              FloatingActionButton.extended(
                onPressed: (){
                  if(value.saved == false){
                    value.saveTime();
                  } else{
                  }
                },
                  label: const Text('Save'),
              ),
            ],
          ),

        );
      }
    ),
    );
  }

  // @override
  // void dispose() {
  //   value.timer!.cancel(); // Cancel the timer when the widget is disposed.
  //   super.dispose();
  // }
}
