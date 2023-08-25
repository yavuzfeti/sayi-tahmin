import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tFtahmin = TextEditingController();
  int rastgelesayi = 0;
  int kalanhak = 5;
  String mesaj = "";

  @override
  void initState() {
    super.initState();
    rastgelesayi = Random().nextInt(5)+1;
    print(rastgelesayi);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("Zar Oyunu",style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            SizedBox(width: 250,height:100,child: Text("Şu anda zar atıldı sizce zar kaç geldi?",textAlign: TextAlign.center, style: TextStyle(color: Colors.black54,fontSize: 25))),
            Text("Kalan deneme hakkınız: $kalanhak",style: TextStyle(color: Colors.amber,fontSize: 25),),
            Text("$mesaj",style: TextStyle(color: Colors.black54,fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                cursorColor: Colors.amber,
                controller: tFtahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: Text("Tahmin et"),
                  onPressed: (){
                    int tahmin = int.parse(tFtahmin.text);

                    if (tahmin == rastgelesayi)
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(sonuc: true,rastgelesayi: rastgelesayi)));
                      return;
                    }

                    else if(tahmin > rastgelesayi)
                    {
                      if (kalanhak>1)
                      {
                        setState(() {
                          mesaj = "Daha küçük bi tahminde bulun.";
                          kalanhak--;
                          tFtahmin.clear();
                        });
                      }
                      else
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(sonuc: false,rastgelesayi: rastgelesayi,)));
                      }
                    }

                    else if(tahmin < rastgelesayi)
                    {
                      if (kalanhak>0)
                      {
                        setState(() {
                          mesaj = "Daha büyük bi tahminde bulun.";
                          kalanhak--;
                          tFtahmin.clear();
                        });
                      }
                      else
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(sonuc: false,rastgelesayi: rastgelesayi)));
                      }
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
