import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrackListTile extends StatelessWidget {
  final String trackName;
  final String albumName;
  final String artistName;

  const TrackListTile(
      {Key? key,
      required this.trackName,
      required this.albumName,
      required this.artistName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.green,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.library_music),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            trackName.trim(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            albumName,
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Text(artistName),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
    // return ListTile(
    //   leading: const Icon(Icons.library_music),
    //   title: FittedBox(child: Text(trackName)),
    //   subtitle: FittedBox(child: Text(albumName)),
    //   trailing: FittedBox(child: Text(artistName)),
    // );
  }
}
