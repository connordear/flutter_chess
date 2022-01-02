import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return const Board();
  }
}

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<Square> squares = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        squares.add(Square(file: File.values[j], rank: i + 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chess'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                ),
                children: squares)));
  }
}

enum File {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h,
}

class Square extends StatefulWidget {
  File file;
  int rank;
  Square({
    required this.file,
    required this.rank,
    Key? key,
  }) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Piece? _piece;
  @override
  Widget build(BuildContext context) {
    return Container(color: getColorForSquare(widget.file, widget.rank));
  }
}

class Piece extends StatefulWidget {
  const Piece({Key? key}) : super(key: key);

  @override
  _PieceState createState() => _PieceState();
}

class _PieceState extends State<Piece> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Queen extends Piece {
  const Queen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icons.emoji_;
  }
}

Color getColorForSquare(File file, int rank) {
  return rank % 2 == 0
      ? (file.index % 2 == 0 ? Colors.black87 : Colors.transparent)
      : (file.index % 2 == 0 ? Colors.transparent : Colors.black87);
}
