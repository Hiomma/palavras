import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:palavras/app/controller/play/play.controller.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';

class Play extends StatefulWidget {
  final List<PalavrasModel> palavras;
  final String letra;

  const Play(this.palavras, this.letra);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  num index = 0;

  PlayerController playController = PlayerController();
  CarouselController carouselController = CarouselController();

  FutureBuilder<String> getImage(PalavrasModel palavra) {
    return new FutureBuilder(
        future: playController.getImage(palavra),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.network(
                  snapshot.data,
                  width: double.infinity,
                  height: 300,
                ),
              );
          }
        });
  }

  void buttonPressed(String button) async {
    playController.addDisplay(button.toUpperCase());

    await audioCache.play("$button.mp3");
    await advancedPlayer.onPlayerCompletion.first;

    if (playController.display.length >=
        widget.palavras[index].palavra.length) {
      if (playController.display.toLowerCase() ==
          widget.palavras[index].palavra) {
        await audioCache.play("acertou.mp3");
        await advancedPlayer.onPlayerCompletion.first;

        playController.eraseDisplay();

        index++;

        carouselController.nextPage();

        if (index <= widget.palavras.length - 1)
          audioCache.play("${widget.palavras[index].palavra}.mp3");
        else
          Navigator.pop(context);
      } else {
        await audioCache.play("errou.mp3");
        playController.eraseDisplay();
      }
    }
  }

  @override
  void initState() {
    super.initState();

    advancedPlayer = new AudioPlayer();
    audioCache =
        new AudioCache(fixedPlayer: advancedPlayer, prefix: "palavras/");

    audioCache.play("${widget.palavras[0].palavra}.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Letra " + widget.letra),
      ),
      body: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
            height: double.infinity,
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            scrollPhysics: NeverScrollableScrollPhysics()),
        items: widget.palavras.map(
          (palavra) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getImage(palavra),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      color: Colors.grey,
                      width: double.infinity,
                      child: Observer(
                        builder: (_) => Text(
                          playController.display,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Observer(
                        builder: (_) {
                          return GridView.count(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 8,
                            crossAxisCount: 3,
                            childAspectRatio: 3.5,
                            padding: EdgeInsets.all(4),
                            children: List.generate(
                              palavra.letras.length,
                              (index) {
                                final button = palavra.letras[index];
                                return Observer(
                                  builder: (_) {
                                    return Container(
                                      child: RaisedButton(
                                        color: Colors.blue,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            side:
                                                BorderSide(color: Colors.blue)),
                                        child: Text(
                                          button.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          buttonPressed(button);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }

  // Future playAudio(String name) async {
  //   await audioCache.play(name + ".mp3");
  //   audioCache.clear(name + '.mp3');
  // }
}
