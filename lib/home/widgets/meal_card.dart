import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';
import 'package:iss_mir_egal/home/models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: meal.imageUrl,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) =>
              Assets.images.logo.image(height: 120),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.title,
                style: TextTheme.of(context).labelLarge,
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(meal.location), Text('${meal.price}€')],
              )
            ],
          ),
        )
      ],
    );
  }
}
