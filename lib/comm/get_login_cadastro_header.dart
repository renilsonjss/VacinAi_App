import 'package:flutter/material.dart';

class getLoginCadastroHeader extends StatelessWidget {
  String headerName;
  String imagePath;

  getLoginCadastroHeader({required this.headerName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            imagePath,
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'VacinAi',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
