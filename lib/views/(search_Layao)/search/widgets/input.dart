import 'package:flutter/material.dart';

import 'package:babysitterapp/core/components.dart';

Widget searchButtons(TextEditingController searchTxt) => CustomTextInput(
      controller: searchTxt,
      onChanged: (String value) {},
      onClear: () {},
      prefixIcon: const Icon(Icons.search),
      hintText: 'Search...',
      textInputAction: TextInputAction.next,
    );
