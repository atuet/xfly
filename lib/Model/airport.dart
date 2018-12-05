import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


Welcome welcomeFromJson(String str) {
    final jsonData = json.decode(str);
    return Welcome.fromJson(jsonData);
}

String welcomeToJson(Welcome data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Welcome {
    Request request;
    List<Response> response;

    Welcome({
        this.request,
        this.response,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => new Welcome(
        request: Request.fromJson(json["request"]),
        response: new List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "request": request.toJson(),
        "response": new List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Request {
    String lang;
    String currency;
    int time;
    int id;
    String server;
    String host;
    int pid;
    Key key;
    Params params;
    int version;
    String method;
    Client client;

    Request({
        this.lang,
        this.currency,
        this.time,
        this.id,
        this.server,
        this.host,
        this.pid,
        this.key,
        this.params,
        this.version,
        this.method,
        this.client,
    });

    factory Request.fromJson(Map<String, dynamic> json) => new Request(
        lang: json["lang"],
        currency: json["currency"],
        time: json["time"],
        id: json["id"],
        server: json["server"],
        host: json["host"],
        pid: json["pid"],
        key: Key.fromJson(json["key"]),
        params: Params.fromJson(json["params"]),
        version: json["version"],
        method: json["method"],
        client: Client.fromJson(json["client"]),
    );

    Map<String, dynamic> toJson() => {
        "lang": lang,
        "currency": currency,
        "time": time,
        "id": id,
        "server": server,
        "host": host,
        "pid": pid,
        "key": key.toJson(),
        "params": params.toJson(),
        "version": version,
        "method": method,
        "client": client.toJson(),
    };
}

class Client {
    String countryCode;
    String country;
    double lat;
    double lng;
    String ip;
    Device device;
    Agent agent;

    Client({
        this.countryCode,
        this.country,
        this.lat,
        this.lng,
        this.ip,
        this.device,
        this.agent,
    });

    factory Client.fromJson(Map<String, dynamic> json) => new Client(
        countryCode: json["country_code"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        ip: json["ip"],
        device: Device.fromJson(json["device"]),
        agent: Agent.fromJson(json["agent"]),
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "country": country,
        "lat": lat,
        "lng": lng,
        "ip": ip,
        "device": device.toJson(),
        "agent": agent.toJson(),
    };
}

class Agent {
    String browser;
    String version;
    String os;
    String platform;

    Agent({
        this.browser,
        this.version,
        this.os,
        this.platform,
    });

    factory Agent.fromJson(Map<String, dynamic> json) => new Agent(
        browser: json["browser"],
        version: json["version"],
        os: json["os"],
        platform: json["platform"],
    );

    Map<String, dynamic> toJson() => {
        "browser": browser,
        "version": version,
        "os": os,
        "platform": platform,
    };
}

class Device {
    String type;

    Device({
        this.type,
    });

    factory Device.fromJson(Map<String, dynamic> json) => new Device(
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
    };
}

class Key {
    int id;
    String apiKey;
    String type;
    dynamic trialPrice;
    dynamic expired;
    String registered;
    int limitsByHour;
    int limitsByMinute;
    List<dynamic> demoMethods;
    int usageByHour;
    int usageByMinute;

    Key({
        this.id,
        this.apiKey,
        this.type,
        this.trialPrice,
        this.expired,
        this.registered,
        this.limitsByHour,
        this.limitsByMinute,
        this.demoMethods,
        this.usageByHour,
        this.usageByMinute,
    });

    factory Key.fromJson(Map<String, dynamic> json) => new Key(
        id: json["id"],
        apiKey: json["api_key"],
        type: json["type"],
        trialPrice: json["trial_price"],
        expired: json["expired"],
        registered: json["registered"],
        limitsByHour: json["limits_by_hour"],
        limitsByMinute: json["limits_by_minute"],
        demoMethods: new List<dynamic>.from(json["demo_methods"].map((x) => x)),
        usageByHour: json["usage_by_hour"],
        usageByMinute: json["usage_by_minute"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "api_key": apiKey,
        "type": type,
        "trial_price": trialPrice,
        "expired": expired,
        "registered": registered,
        "limits_by_hour": limitsByHour,
        "limits_by_minute": limitsByMinute,
        "demo_methods": new List<dynamic>.from(demoMethods.map((x) => x)),
        "usage_by_hour": usageByHour,
        "usage_by_minute": usageByMinute,
    };
}

class Params {
    String code;
    String lang;

    Params({
        this.code,
        this.lang,
    });

    factory Params.fromJson(Map<String, dynamic> json) => new Params(
        code: json["code"],
        lang: json["lang"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "lang": lang,
    };
}

class Response {
    String code;
    String name;

    Response({
        this.code,
        this.name,
    });

    factory Response.fromJson(Map<String, dynamic> json) => new Response(
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
    };
}

String convertAirport() {
  
}

Future<List<Response>> fetchFlights() async {
  var iata = 'SVO';
  final response = await http.get(
    'https://iatacodes.org/api/v6/airports?api_key=e8a2828b-a2e9-494a-be98-d5d9d602b874&code=${iata}',
  );
    if(response.statusCode == 200) {
      Map data = json.decode(response);
      final items = (data['items'] as List).map((i) => new CardInfo.fromJson(i));
    for (final item in items) {
      print(item.id);
    }
    }
    else {
      throw Exception('Erreur dans le chargement de la liste');
    }
}