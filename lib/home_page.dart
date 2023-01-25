import 'package:animations/image_page.dart';
import 'package:animations/notifier.dart';
import 'package:animations/widgets/alert_wiggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/downloading_progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index){
              return const AlertWiggle(
                child: const ListTile(
                  leading: DownloadingProgress(),
                  title: Text("Hola"),
                  subtitle: Text("kapito sala"),
                ),
              );
            }
        ),
      ),
      floatingActionButton: Consumer<DownloadNotifier>(
       builder: (_, dCtr, __) {
       return Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           FloatingActionButton(
             heroTag: "btn1",
            onPressed: ()async {
              await dCtr.resetValue();
            },
            child: const Icon(Icons.lock_reset_outlined),
            ),
           FloatingActionButton(
             heroTag: "btn2",
            onPressed: ()async {
              await dCtr.startDownload();
            },
            child: const Icon(Icons.download),
            ),
         ],
       );
       }
      ),
    );
  }

}
