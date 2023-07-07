// To parse this JSON data, do
//
//     final control = controlFromJson(jsonString);

import 'dart:convert';

List<Control> controlFromJson(String str) => List<Control>.from(json.decode(str).map((x) => Control.fromJson(x)));

String controlToJson(List<Control> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Control {
    int codControl;
    String nomControl;
    int nroOrden;
    String distanciaDeControlAControlPorcentaje;
    String? padronUnidad;
    String? distanciaControlAUnidad;
    int? ra;
    int tiempoUnidadAnterior;
    int unidadConsulta;
    String horaProgramada;
    int tiempoControlAControlMinutos;

    Control({
        required this.codControl,
        required this.nomControl,
        required this.nroOrden,
        required this.distanciaDeControlAControlPorcentaje,
        this.padronUnidad,
        this.distanciaControlAUnidad,
        this.ra,
        required this.tiempoUnidadAnterior,
        required this.unidadConsulta,
        required this.horaProgramada,
        required this.tiempoControlAControlMinutos,
    });

    factory Control.fromJson(Map<String, dynamic> json) => Control(
        codControl: json["CodControl"],
        nomControl: json["NomControl"],
        nroOrden: json["NroOrden"],
        distanciaDeControlAControlPorcentaje: json["DistanciaDeControlAControlPorcentaje"],
        padronUnidad: json["PadronUnidad"],
        distanciaControlAUnidad: json["DistanciaControlAUnidad"],
        ra: json["RA"],
        tiempoUnidadAnterior: json["TiempoUnidadAnterior"],
        unidadConsulta: json["UnidadConsulta"],
        horaProgramada: json["HoraProgramada"],
        tiempoControlAControlMinutos: json["TiempoControlAControlMinutos"],
    );

    Map<String, dynamic> toJson() => {
        "CodControl": codControl,
        "NomControl": nomControl,
        "NroOrden": nroOrden,
        "DistanciaDeControlAControlPorcentaje": distanciaDeControlAControlPorcentaje,
        "PadronUnidad": padronUnidad,
        "DistanciaControlAUnidad": distanciaControlAUnidad,
        "RA": ra,
        "TiempoUnidadAnterior": tiempoUnidadAnterior,
        "UnidadConsulta": unidadConsulta,
        "HoraProgramada": horaProgramada,
        "TiempoControlAControlMinutos": tiempoControlAControlMinutos,
    };
}
