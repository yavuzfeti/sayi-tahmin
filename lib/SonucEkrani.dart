import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;
  int rastgelesayi;

  SonucEkrani({required this.sonuc,required this.rastgelesayi}){

  }

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

  @override
  Widget build(BuildContext context) {

    String imagepath = "resimler/dices.png";
    switch (widget.rastgelesayi)
    {
      case 1:
        imagepath = "resimler/dice.png";
        break;
      case 2:
        imagepath = "resimler/dice_2.png";
        break;
      case 3:
        imagepath = "resimler/dice_3.png";
        break;
      case 4:
        imagepath = "resimler/dice_4.png";
        break;
      case 5:
        imagepath = "resimler/dice_5.png";
        break;
      case 6:
        imagepath = "resimler/dice_6.png";
        break;
      default:
        imagepath = "resimler/dices.png";
        break;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zar Oyunu",style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text(widget.sonuc ? "Cevabınız Doğru" : "Hakkınız Bitti",style: TextStyle(color: Colors.green,fontSize: 30),),
            Text(widget.sonuc ? "Atılan zar:" : "Doğru cevap:",style: TextStyle(color: Colors.black54,fontSize: 25),),
            SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(imagepath)),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  child: Text(widget.sonuc ? "Tekrar oyna" : "Tekrar dene"),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
