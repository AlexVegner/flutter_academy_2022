import 'dart:convert';

class Neo {
  final String id;
  final String name;
  final double sizeMin; // meters
  final double sizeMax; // meters
  final double velocity; // kilometers_per_second
  final double missDistance; // "kilometers": "45290438.204452618",

  Neo({
    required this.id,
    required this.name,
    required this.sizeMin,
    required this.sizeMax,
    required this.velocity,
    required this.missDistance,
  });

  factory Neo.fromNasaJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final estimatedDiameter = json['estimated_diameter'];
    final estimatedDiameterMeters = estimatedDiameter['meters'];
    final sizeMax = estimatedDiameterMeters['estimated_diameter_max'];
    final sizeMin = estimatedDiameterMeters['estimated_diameter_min'];
    final closeApproachData = json['close_approach_data'][0];
    final relativeVelocity = closeApproachData['relative_velocity'];
    final velocity = double.parse(relativeVelocity['kilometers_per_hour']);
    final missDistanceVal = closeApproachData['miss_distance'];
    final missDistance = double.parse(missDistanceVal['kilometers']);

    return Neo(
      id: id,
      name: name,
      sizeMax: sizeMax,
      sizeMin: sizeMin,
      velocity: velocity,
      missDistance: missDistance,
    );
  }

  Neo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        sizeMin = json['sizeMin'],
        sizeMax = json['sizeMax'],
        velocity = json['velocity'],
        missDistance = json['missDistance'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sizeMin': sizeMin,
        'sizeMax': sizeMax,
        'velocity': velocity,
        'missDistance': missDistance
      };
}

void testNeo() {
  final json = jsonDecode(_testJson);
  final neo = Neo.fromNasaJson(json);
  final jsonNeo = neo.toJson();
  final rawNeo = jsonEncode(jsonNeo);
  print(rawNeo);
}

const _testJson = ''' {
        "links": {
          "self": "http://www.neowsapp.com/rest/v1/neo/2465633?api_key=DEMO_KEY"
        },
        "id": "2465633",
        "neo_reference_id": "2465633",
        "name": "465633 (2009 JR5)",
        "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2465633",
        "absolute_magnitude_h": 20.36,
        "estimated_diameter": {
          "kilometers": {
            "estimated_diameter_min": 0.2251930467,
            "estimated_diameter_max": 0.5035469604
          },
          "meters": {
            "estimated_diameter_min": 225.1930466786,
            "estimated_diameter_max": 503.5469604336
          },
          "miles": {
            "estimated_diameter_min": 0.1399284286,
            "estimated_diameter_max": 0.3128894784
          },
          "feet": {
            "estimated_diameter_min": 738.8223552649,
            "estimated_diameter_max": 1652.0570096689
          }
        },
        "is_potentially_hazardous_asteroid": true,
        "close_approach_data": [
          {
            "close_approach_date": "2015-09-08",
            "close_approach_date_full": "2015-Sep-08 20:28",
            "epoch_date_close_approach": 1441744080000,
            "relative_velocity": {
              "kilometers_per_second": "18.1279547773",
              "kilometers_per_hour": "65260.6371983344",
              "miles_per_hour": "40550.4220413761"
            },
            "miss_distance": {
              "astronomical": "0.3027478814",
              "lunar": "117.7689258646",
              "kilometers": "45290438.204452618",
              "miles": "28142173.3303294084"
            },
            "orbiting_body": "Earth"
          }
        ],
        "is_sentry_object": false
      } 
''';
