import 'package:flutter/material.dart';
import 'package:instagramre/colors.dart';

class Stories {
  String avatar;
  bool isMe;
  bool isOpened;
  String name;
  Stories({this.avatar, this.isMe, this.isOpened, this.name = ""});
}

class Posts {
  String avatar;
  String name;
  String postDate;
  List<String> postImage;
  int postLikeCount;
  int postCommentCount;
  String postDesc;
  String commentName;
  String comment;
  Posts(
      {this.avatar,
      this.name,
      this.postDate,
      this.postImage,
      this.postLikeCount,
      this.postCommentCount,
      this.postDesc,
      this.commentName,
      this.comment});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  List<Stories> myStories = [
    new Stories(avatar: "assets/me.png", isMe: true, isOpened: true),
    new Stories(
        avatar: "assets/pp.png",
        isMe: false,
        isOpened: false,
        name: "Luz.anzo"),
    new Stories(
        avatar: "assets/pp2.png",
        isMe: false,
        isOpened: false,
        name: "Alice_002"),
    new Stories(
        avatar: "assets/pp3.png",
        isMe: false,
        isOpened: false,
        name: "Perla_Pipol"),
    new Stories(
        avatar: "assets/pp4.png",
        isMe: false,
        isOpened: false,
        name: "Cambray_Style"),
  ];

  List<Posts> myPosts = [
    new Posts(
        avatar: 'assets/post_avatar.png',
        name: 'Maoo.lopez',
        postDate: '20 Minutes ago',
        postImage: ['assets/post_image.png'],
        postLikeCount: 4558,
        postCommentCount: 500,
        postDesc:
            'SACRIFICE | VIRUS this photomanipulation inspired in the virus ',
        commentName: 'Perla_Pipol',
        comment: 'Perla_Pipol Esta edición está super genial, que pro!!'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 55.1, left: 36, right: 37, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icon_publish.png',
                      ),
                      Image.asset(
                        'assets/logo.png',
                      ),
                      Image.asset(
                        'assets/icon_messages.png',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 88,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                myStories[currentSelectedIndex].isOpened =
                                    false;
                                currentSelectedIndex = index;
                                myStories[currentSelectedIndex].isOpened = true;
                              });
                            },
                            child: Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    myStories[index].isMe == false
                                        ? Container(
                                            width: 72,
                                            height: 72,
                                            padding: EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                                left: 3,
                                                right: 3),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                    colors: [
                                                      newStoriesColor1,
                                                      newStoriesColor2
                                                    ])),
                                            child: CircleAvatar(
                                              radius: 33,
                                              backgroundImage: AssetImage(
                                                  myStories[index].avatar),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          )
                                        : Container(
                                            width: 72,
                                            height: 72,
                                            padding: EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                                left: 3,
                                                right: 3),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: CircleAvatar(
                                              radius: 33,
                                              backgroundImage: AssetImage(
                                                  myStories[index].avatar),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    myStories[index].isMe == false
                                        ? Column(
                                            children: [
                                              Text(
                                                myStories[index].name,
                                                style: TextStyle(
                                                    color: Color(0xFF737476),
                                                    fontSize: 10,
                                                    fontFamily: 'Archivo'),
                                              )
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 17,
                          )
                        ],
                      );
                    },
                    itemCount: myStories.length,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discovery",
                          style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Container(
                          width: 184,
                          height: 33,
                          decoration: BoxDecoration(
                              color: Color(0xFF31323B),
                              borderRadius: BorderRadius.circular(92)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                border: InputBorder.none,
                                prefixIcon:
                                    Image.asset('assets/icon_search.png')),
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: Column(
                      children: [
                        Container(
                          height: 445,
                          decoration: BoxDecoration(
                              color: Color(0xFF31323B),
                              borderRadius: BorderRadius.circular(30)),
                          child: ListView.builder(
                            itemBuilder: (context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 21, right: 17),
                                        child:
                                            Image.asset(myPosts[index].avatar),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  myPosts[index].name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily: 'Archivo',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  myPosts[index].postDate,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Archivo',
                                                      color: Colors.white
                                                          .withOpacity(0.5)),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 115.7,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 13),
                                            child: Image.asset(
                                                'assets/icon_send.png'),
                                          ),
                                          Image.asset(
                                              'assets/icon_options.png'),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Center(
                                      child: Image.asset(
                                          myPosts[index].postImage[0]),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 33),
                                      child: Row(
                                        children: [
                                          Text(
                                            myPosts[index]
                                                .postLikeCount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            " person liked photo",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(.5),
                                                fontSize: 10),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, bottom: 4),
                                    child: Text(
                                      myPosts[index].postDesc,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, bottom: 4),
                                    child: Text(
                                      'View all ${myPosts[index].postCommentCount.toString()} comments',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, bottom: 4),
                                    child: Text(
                                      '${myPosts[index].comment}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: myPosts.length,
                            shrinkWrap: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 46,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF31323B),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          30.5,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      MenuItem(
                                        icon: 'assets/icon_home.png',
                                      ),
                                      MenuItem(
                                        icon: 'assets/icon_search2.png',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                MenuItem(
                                  icon: 'assets/icon_notification.png',
                                ),
                                MenuItem(
                                  icon: 'assets/icon_avatar.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Image.asset('assets/icon_instagram.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  String icon;
  bool isSelected;
  MenuItem({this.icon, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width / 2) - 30.5) / 2,
      height: 70,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon),
            SizedBox(
              height: 5,
            ),
            isSelected
                ? Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2)),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
