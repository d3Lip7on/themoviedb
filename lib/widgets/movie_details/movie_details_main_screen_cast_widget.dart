import 'package:flutter/material.dart';
import 'package:themoviedb/resources/images.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'В главных ролях',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 260,
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      _ActorCardWidget(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ActorCardWidget extends StatelessWidget {
  const _ActorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 8)
          ]),
      width: 120,
      child: const Column(
        children: [
          Image(
            image: Images.leonardoImage,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leonardo DiCaprio',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Ernest Burkhart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
