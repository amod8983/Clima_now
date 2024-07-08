import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  final _controller = TextEditingController();
  final _places =
      GoogleMapsPlaces(apiKey: 'API_KEY');
  List<Prediction> _suggestions = [];

  @override
  void dispose() {
    _controller.dispose();
    _places.dispose();
    super.dispose();
  }

  Future<void> _onSearchChanged() async {
    if (_controller.text.isNotEmpty) {
      final response = await _places.autocomplete(
        _controller.text,
        types: ['(cities)'],
      );
      if (response.isOkay) {
        setState(() {
          _suggestions = response.predictions;
        });
      } else {
        print('Error fetching suggestions: ${response.errorMessage}');
      }
    } else {
      setState(() {
        _suggestions = [];
      });
    }
  }

  Future<void> _onSuggestionTap(Prediction suggestion) async {
    final detail = await _places.getDetailsByPlaceId(suggestion.placeId!);
    if (detail.isOkay) {
      final location = detail.result.geometry!.location;
      Navigator.of(context).pop(location); // Close the bottom sheet
    } else {
      print('Error fetching place details: ${detail.errorMessage}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: _controller,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
            decoration: InputDecoration(
              labelText: 'Search Location',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
            ),
            onChanged: (value) => _onSearchChanged(),
          ),
          const SizedBox(height: 8.0),
          _suggestions.isEmpty
              ? Center(
                  child: Text(
                    'No suggestions',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                        ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_suggestions[index].description ?? ''),
                        onTap: () => _onSuggestionTap(_suggestions[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: OutlinedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: const Text('Cancel')),
                )
        ],
      ),
    );
  }
}
