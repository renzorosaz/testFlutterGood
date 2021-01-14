// To parse this JSON data, do
//
//     final temperature = temperatureFromJson(jsonString);

import 'dart:convert';

List<Temperature> temperatureFromJson(String str) => List<Temperature>.from(json.decode(str).map((x) => Temperature.fromJson(x)));

String temperatureToJson(List<Temperature> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Temperature {
    Temperature({
        this.cityName,
        this.lat,
        this.lon,
        this.main,
        this.wind,
        this.clouds,
        this.weather,
        this.dt,
        this.dtIso,
        this.timezone,
        this.rain,
    });

    CityName cityName;
    double lat;
    double lon;
    MainClass main;
    Wind wind;
    Clouds clouds;
    List<Weather> weather;
    int dt;
    String dtIso;
    int timezone;
    Rain rain;

    factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        cityName: cityNameValues.map[json["city_name"]],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        main: MainClass.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        dt: json["dt"],
        dtIso: json["dt_iso"],
        timezone: json["timezone"],
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

    Map<String, dynamic> toJson() => {
        "city_name": cityNameValues.reverse[cityName],
        "lat": lat,
        "lon": lon,
        "main": main.toJson(),
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "dt": dt,
        "dt_iso": dtIso,
        "timezone": timezone,
        "rain": rain == null ? null : rain.toJson(),
    };
}

enum CityName { LONDON }

final cityNameValues = EnumValues({
    "London": CityName.LONDON
});

class Clouds {
    Clouds({
        this.all,
    });

    int all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class MainClass {
    MainClass({
        this.temp,
        this.tempMin,
        this.tempMax,
        this.feelsLike,
        this.pressure,
        this.humidity,
    });

    double temp;
    double tempMin;
    double tempMax;
    double feelsLike;
    int pressure;
    int humidity;

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class Rain {
    Rain({
        this.the3H,
        this.the1H,
    });

    double the3H;
    double the1H;

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"] == null ? null : json["3h"].toDouble(),
        the1H: json["1h"] == null ? null : json["1h"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "3h": the3H == null ? null : the3H,
        "1h": the1H == null ? null : the1H,
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    MainEnum main;
    Description description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
    };
}

enum Description { OVERCAST_CLOUDS, LIGHT_RAIN, BROKEN_CLOUDS, SKY_IS_CLEAR, FEW_CLOUDS, SCATTERED_CLOUDS }

final descriptionValues = EnumValues({
    "broken clouds": Description.BROKEN_CLOUDS,
    "few clouds": Description.FEW_CLOUDS,
    "light rain": Description.LIGHT_RAIN,
    "overcast clouds": Description.OVERCAST_CLOUDS,
    "scattered clouds": Description.SCATTERED_CLOUDS,
    "sky is clear": Description.SKY_IS_CLEAR
});

enum MainEnum { CLOUDS, RAIN, CLEAR }

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Rain": MainEnum.RAIN
});

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    double speed;
    int deg;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
