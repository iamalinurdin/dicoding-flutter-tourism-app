import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourims_model.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({super.key, required this.tourism});

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // ditambahkan `late` karena value variable tidak diinisiasikan di awal
  late bool _isBookmarked;

  @override
  void initState() {
    final tourismInList = tourismList.where(
      (item) => item.id == widget.tourism.id,
    );

    setState(() {
      if (tourismInList.isNotEmpty) {
        _isBookmarked = true;
      } else {
        _isBookmarked = false;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_isBookmarked) {
            // keyword `widget` ini mirip dengan konsep `this` pada javascript atau php
            bookmarkTourismList.removeWhere(
              (item) => item.id == widget.tourism.id,
            );
          } else {
            bookmarkTourismList.add(widget.tourism);
          }

          _isBookmarked = !_isBookmarked;
        });
      },
      icon: Icon(!_isBookmarked ? Icons.bookmark : Icons.bookmark_outline),
    );
  }
}
