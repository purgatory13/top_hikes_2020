import 'package:flutter/material.dart';
import 'package:top_hikes_2020/model/Hike.dart';
import 'package:top_hikes_2020/ui/hike_ui/hike_ui.dart';


class HikeListView extends StatelessWidget {

  final List<Hike> hikeList = Hike.getHikes();

  final List hikes = [
    "Camelback Mountain",
    "Devils Bridge"

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Top 2020 Hikes"),
        backgroundColor: Colors.blueGrey.shade900,
      ), //Appbar
      backgroundColor: Colors.blueGrey.shade100,
      body: ListView.builder(
          itemCount: hikeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:<Widget>[

                  hikeCard(hikeList[index], context),

                  Positioned(
                      top: 10.0,
                      //left: 10.0,
                      child: movieImage(hikeList[index].poster))
                  // child: movieCard(movieList[index], context))
                ]);
          }), //Listview.builder
    ); //scaffold
  }
  Widget hikeCard(Hike hike, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
              bottom: 8.0,
              left: 40.0,
              right: 20.0,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Flexible(
                          child: Text(
                              hike.title, style:
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white
                          )
                          ),
                        ),
                        Text("Rating: ${hike.rated}",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey
                          ),)
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Date Hiked: ${hike.date}",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey
                        ),),
                      Text(hike.terrain,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey
                        ),),
                      Text(hike.outback,
                          style: mainTextStyle()
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HikeListViewDetails(hikeName: hike.title,
                hike: hike )))
      },
    );
  }
  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 14.0,
        color: Colors.grey
    );
  }



  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ?? 'https://cdn.pixabay.com/photo/2019/08/11/18/54/icon-4399690_1280.png'),
              fit: BoxFit.cover)
      ),
    );

  }

}

//end of HikeListView
//new route/screen/page Details page




