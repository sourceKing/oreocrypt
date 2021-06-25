import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oreocrypt/components/storyring.dart';
import 'package:oreocrypt/components/storytile.dart';
import 'package:oreocrypt/global.dart';
import 'package:oreocrypt/models/story_model.dart';
import 'package:oreocrypt/models/user_model.dart';

class StoriesScreen extends StatelessWidget {
  List<String> _getShowStory() {
    // List<Story> showStories;

    // for (var story in stories) {
    //   var currentName = story.user.name;

    //   for (var i = 0; i < stories.length; i++) {
    //     if (currentName == stories[i].user.name) {
    //       showStories.add(stories[i]);
    //     }
    //   }
    // }

    var compList = <String>[];
    for (var item in stories) {
      compList.add(item.user.name);
    }

    return [...new Set.from(compList)];

    print([...new Set.from(compList)]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final usersWithStories = _getShowStory();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: size.height * .39,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  widthFactor: double.infinity,
                  heightFactor: double.infinity,
                  child: Container(
                    width: double.infinity,
                    height: size.height * .35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                      ),
                      color: bgColor.withAlpha(255),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * .055,
                  left: 35,
                  right: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StoryRing(
                        radius: 55,
                        ringColors: [Colors.white, Colors.grey[400]!],
                      ),
                      Icon(
                        CupertinoIcons.bell,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * .14,
                  left: 35,
                  right: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Benjamin',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .75,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'How are you today?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          letterSpacing: .5,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * .25,
                  left: 35,
                  right: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          // margin: EdgeInsets.all(30),
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          elevation: 14,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 25,
                            ),
                            child: Column(children: [
                              Text(
                                'Loan Balance',
                                style: TextStyle(
                                  color: Colors.redAccent[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '-\$3,000',
                                style: TextStyle(
                                  color: Colors.redAccent[700],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          // margin: EdgeInsets.all(30),
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          elevation: 14,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 25,
                            ),
                            child: Column(children: [
                              Text(
                                'Credit Balance',
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.greenAccent[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$21,330',
                                style: TextStyle(
                                  color: Colors.greenAccent[700],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 35.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Recent Activity',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              itemCount: usersWithStories.length,
              itemBuilder: (context, index) {
                List<Story> story = [];
                User currentStoryUser = stories[index].user;

                for (var i = 0; i < stories.length; i++) {
                  // check if multiple stories have one user
                  // if (usersWithStories[i] == stories[i].user.name) {
                  story.add(stories[i]);
                  //   continue;
                  // }
                }
                return GestureDetector(
                  onTap: () {
                    print('Full story screen entered');
                    Navigator.of(context)
                        .pushNamed('full_story', arguments: story);
                  },
                  child: StoriesListTile(userName: usersWithStories[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
