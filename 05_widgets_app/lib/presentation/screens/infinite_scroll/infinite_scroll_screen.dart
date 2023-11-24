import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imageIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastId = imageIds.last;
    imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;

    isLoading = false;
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imageIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imageIds[index]}/500/300'));
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
          onPressed: () => context.pop()),
    );
  }
}
