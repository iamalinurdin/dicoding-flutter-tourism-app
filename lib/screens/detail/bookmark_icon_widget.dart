import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/models/tourims_model.dart';
import 'package:tourism_app/providers/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/providers/detail/bookmark_list_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({super.key, required this.tourism});

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // ditambahkan `late` karena value variable tidak diinisiasikan di awal
  // late bool _isBookmarked;

  @override
  void initState() {
    // final tourismInList = tourismList.where(
    //   (item) => item.id == widget.tourism.id,
    // );

    // setState(() {
    //   if (tourismInList.isNotEmpty) {
    //     _isBookmarked = true;
    //   } else {
    //     _isBookmarked = false;
    //   }
    // });

    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() {
      final tourismInList = bookmarkListProvider.checkItemBookmark(
        widget.tourism,
      );

      bookmarkIconProvider.isBookmarked = tourismInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }

        bookmarkIconProvider.isBookmarked = !isBookmarked;

        // setState(() {
        //   if (_isBookmarked) {
        //     // keyword `widget` ini mirip dengan konsep `this` pada javascript atau php
        //     bookmarkTourismList.removeWhere(
        //       (item) => item.id == widget.tourism.id,
        //     );
        //   } else {
        //     bookmarkTourismList.add(widget.tourism);
        //   }

        //   _isBookmarked = !_isBookmarked;
        // });
      },
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
