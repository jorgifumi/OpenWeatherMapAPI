import Foundation

public class OpenWeatherMapAPI {
    static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")!
    static var apiKey: String = ""
    static var _session: URLSession = URLSession.shared

    static let instance = OpenWeatherMapAPI()

    public static func initialize(apiKey: String, session: URLSession = URLSession.shared) -> OpenWeatherMapAPI {
        self.apiKey = apiKey
        self._session = session

        return instance
    }

    static var lang: String = "es"
    static var units: String = "metric"
}

extension OpenWeatherMapAPI: NetworkServiceType {
    public var session: URLSession {
        return OpenWeatherMapAPI._session
    }
}

public extension Resource {

    static func current(latitude: Double, longitude: Double) -> Resource<CurrentWeatherResponse> {

        let url = OpenWeatherMapAPI.baseURL.appendingPathComponent("weather")

        let parameters: [String : CustomStringConvertible] = [
            "appid": OpenWeatherMapAPI.apiKey,
            "lat": latitude,
            "lon": longitude,
            "units": OpenWeatherMapAPI.units,
            "lang": OpenWeatherMapAPI.lang
        ]
        return Resource<CurrentWeatherResponse>(url: url, parameters: parameters)
    }

    static func oneCall(latitude: Double, longitude: Double) -> Resource<OneCallResponse> {
        let url = OpenWeatherMapAPI.baseURL.appendingPathComponent("onecall")
        let parameters: [String : CustomStringConvertible] = [
            "appid": OpenWeatherMapAPI.apiKey,
            "lat": latitude,
            "lon": longitude,
            "units": OpenWeatherMapAPI.units,
            "lang": OpenWeatherMapAPI.lang
        ]
        return Resource<OneCallResponse>(url: url, parameters: parameters)
    }
}
