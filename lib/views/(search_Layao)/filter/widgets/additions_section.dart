import 'package:flutter/material.dart';

import 'package:babysitterapp/core/constants.dart';

import 'package:babysitterapp/views/search.dart';

Widget additionsSection() {
  return filterCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            sectionTitle('Additions', Icons.add_circle_outline),
            TextButton(
              child: const Text(
                'See all',
                style: TextStyle(color: GlobalStyles.primaryButtonColor),
              ),
              onPressed: () {},
            ),
          ],
        ),
        ...<Widget>[const AdditionCheckbox()],
      ],
    ),
  );
}
