import 'package:flutter/material.dart';
import 'package:test_http/model/joke.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;


  const JokeCard({Key key, this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              padding: const EdgeInsets.all(10),

              child: Center(
                child: Column(
                  children: [
                    Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(joke.category != null && joke.category.length > 4)
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(joke.category),
                          decoration: BoxDecoration(
                            color:const Color(0xd9ecebeb),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        if(joke.dateTime != null)
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          padding: EdgeInsets.all(5),
                          child: Text(joke.dateTime.year.toString()),
                          decoration: BoxDecoration(
                              color: const Color(0xd9ecebeb),
                            borderRadius: BorderRadius.circular(15),

                          ),
                        )
                      ],
                    ),
                    SizedBox (
                      width: double.infinity,
                      height: 480,
                     /* padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        color: const Color(0xd9ecebeb),
                        borderRadius: BorderRadius.circular(15),
                      ),*/
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xd9ecebeb),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          joke.text,

                        ),
                      ),
                    )
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 530,
              decoration: BoxDecoration(
                color:const Color(0xffB62020),
                borderRadius: BorderRadius.circular(15),//
              ),


            ),
        ],
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

      ),
    );
  }

}