import 'package:flutter/material.dart';
import 'package:sayi_tahmin/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zar Oyunu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _Anasayfastate();
}

class _Anasayfastate extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zar Oyunu",style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            SizedBox(width: 250,height:100,child: Text("Başladığınızda bir zar atılacak ve siz atılan zarın kaç geldiğini tahmin etmeye çalışacaksınız",textAlign: TextAlign.center, style: TextStyle(color: Colors.black54,fontSize: 20))),
            Text("Hadi başlayalım",style: TextStyle(color: Colors.green,fontSize: 25),textAlign: TextAlign.center),
            SizedBox(
              width: 250,
                height: 250,
                child: Image.asset("resimler/dices.png")),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  child: Text("Oyuna başla"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TahminEkrani()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
