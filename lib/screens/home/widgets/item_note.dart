import 'dart:ui';

import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red
            ),
            child:Column(
              children: [
                Text(
                    'DEC',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 3,),
                Text(
                    '02',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 3,),
                const Text(''
                    '2023',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
              child: Column(
                children: [
                  Text('This is the title'),
                  Text('Here is the description of this note'),
                ],
              )
          )
        ],
      ),
    );
  }
}
