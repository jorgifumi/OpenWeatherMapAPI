//
//  OneCallResponse.swift
//  
//
//  Created by Jorge Lucena Pino on 20/09/2020.
//

import Foundation

// MARK: - OneCallResponse
public struct OneCallResponse: Codable {
    public let lat, lon: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let current: Current
    public let minutely: [Minutely]?
    public let hourly: [Current]
    public let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }

    // MARK: - Current
    public struct Current: Codable {
        public let dt: Int
        public let sunrise, sunset: Int?
        public let temp, feelsLike: Double
        public let pressure, humidity: Int
        public let dewPoint: Double
        public let uvi: Double?
        public let clouds, visibility: Int
        public let windSpeed: Double
        public let windDeg: Int
        public let weather: [Weather]
        public let rain: Rain?
        public let pop: Double?

        enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, temp
            case feelsLike = "feels_like"
            case pressure, humidity
            case dewPoint = "dew_point"
            case uvi, clouds, visibility
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather, rain, pop
        }
    }

    // MARK: - Rain
    public struct Rain: Codable {
        public let the1H: Double?

        enum CodingKeys: String, CodingKey {
            case the1H = "1h"
        }
    }

    // MARK: - Weather
    public struct Weather: Codable {
        public let id: Int
        public let main, weatherDescription, icon: String

        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }

    // MARK: - Daily
    public struct Daily: Codable {
        public let dt, sunrise, sunset: Int
        public let temp: Temp
        public let feelsLike: FeelsLike
        public let pressure, humidity: Int
        public let dewPoint, windSpeed: Double
        public let windDeg: Int
        public let weather: [Weather]
        public let clouds: Int
        public let pop: Double
        public let rain: Double?
        public let uvi: Double

        enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, temp
            case feelsLike = "feels_like"
            case pressure, humidity
            case dewPoint = "dew_point"
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather, clouds, pop, rain, uvi
        }
    }

    // MARK: - FeelsLike
    public struct FeelsLike: Codable {
        public let day, night, eve, morn: Double
    }

    // MARK: - Temp
    public struct Temp: Codable {
        public let day, min, max, night: Double
        public let eve, morn: Double
    }

    // MARK: - Minutely
    public struct Minutely: Codable {
        public let dt: Int
        public let precipitation: Double
    }
}
