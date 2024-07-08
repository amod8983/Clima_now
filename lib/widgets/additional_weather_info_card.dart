import 'package:clima_now/models/additional_weather_info_model.dart';
import 'package:flutter/material.dart';

class AdditionalWeatherInfoCard extends StatelessWidget {
  const AdditionalWeatherInfoCard(
      {super.key, required this.additionalWeatherInfo});

  final AdditionalWeatherInfoModel additionalWeatherInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 18, 8, 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            additionalWeatherInfo.paramaterIcon,
            Text(additionalWeatherInfo.parameterName,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    additionalWeatherInfo.formattedParamValue['first']!,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    additionalWeatherInfo.formattedParamValue['second']!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
