
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cancerapp/news_provider.dart';
import '../Pages/newsdetail.dart';

class News extends StatefulWidget {
  final String name;
  const News({super.key,required this.name });

  @override
  State<News> createState() => _NewsState();
}



class _NewsState extends State<News> {




  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column (
          
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 20),
             child: TextFormField(
              
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 20, 0, 20),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                       
                          label: const Text(
                            " Search",
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.2,
                                color: Colors.black54),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.indigo, width: 1.7)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.indigo, width: 2.0))),
                    ),
           ),
               Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(widget.name,style: TextStyle(fontSize: 18 ,color: Colors.black87)),
                    Icon(Icons.newspaper_outlined,color: Colors.indigo,size: 25,)
                  ],
                 ),
               ) ,
               Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: FutureBuilder(
             future: Provider.of<NewsProvider>(context, listen: false).fetchTopHeadlines(widget.name),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load headlines'));
          } else {
            return Consumer<NewsProvider>(
              builder: (context, newsProvider, child) {
                return ListView.builder(
                  itemCount: newsProvider.articles.length,
                  itemBuilder: (context, index) {
                    final article = newsProvider.articles[index];
                    return GestureDetector(
                      onTap:()=>{
                         Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>NewsDetail(url: article.url)),
                )
                      },
                     child: Card(
                      title: article.title,
                      disc: article.content,
                      img: article.urlToImage,
                    ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
               )
            
          
        
          ],
      ),
    );
  }
}
class Card extends StatelessWidget {
  final String title;
  final String disc;
  final String img;
  const Card(
      {super.key,
       required this.title,
       required this.disc,
       required this.img
      
      /*required this. border*/
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      margin:EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 1.3),
         // borderRadius: BorderRadiusDirectional.circular(15),
          ),
      child: Column(
      
        children: [
            ClipRRect(
             // borderRadius:BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
              child:  Image.network(img,height: 200,width: MediaQuery.of(context).size.width,fit:BoxFit.cover,),),
          SizedBox(
            height: 8,
          ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          
           child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
         ),
         SizedBox(height: 5,),
           Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          
           child: Text(disc,style: TextStyle(color: Colors.black54), overflow:TextOverflow.ellipsis,),
         )
        ],
      ),
    );
  }
}