import 'package:clima_now/widgets/additional_weather_info_card.dart';
import 'package:flutter/material.dart';
import 'package:clima_now/models/additional_weather_info_model.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  const AdditionalWeatherInfo({super.key, required this.additionalWeatherDatas});

  final List<AdditionalWeatherInfoModel> additionalWeatherDatas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: SizedBox(
          height: 340,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            children: [
              for (AdditionalWeatherInfoModel additionalData
                  in additionalWeatherDatas)
                AdditionalWeatherInfoCard(
                  additionalWeatherInfo: additionalData,
                )
            ],
          ),
        ),
      ),
    );
  }
}
