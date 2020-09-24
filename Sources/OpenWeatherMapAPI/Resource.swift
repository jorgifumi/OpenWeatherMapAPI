//
//  Resource.swift
//  
//
//  Created by Jorge Lucena Pino on 19/09/2020.
//

import Foundation
import Combine

public protocol NetworkServiceType: AnyObject {

    var session: URLSession { get }

    @discardableResult
    func load<T: Decodable>(_ resource: Resource<T>) -> AnyPublisher<T, NetworkError>
}

/// Defines the Network service errors.
public enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}

public final class NetworkService {
    private let session: URLSession

    public init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
}

extension NetworkServiceType {

    @discardableResult
    public func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, NetworkError> {
        guard let request = resource.request else {
            return Fail(outputType: T.self, failure: NetworkError.invalidRequest).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(outputType: Data.self, failure: NetworkError.invalidResponse).eraseToAnyPublisher()
                }

                guard 200..<300 ~= response.statusCode else {
                    return Fail(outputType: Data.self, failure: NetworkError.dataLoadingError(statusCode: response.statusCode, data: data)).eraseToAnyPublisher()
                }
                return Just(data).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in NetworkError.jsonDecodingError(error: error) }
            .eraseToAnyPublisher()
    }
}

public struct Resource<T: Decodable> {
    let url: URL
    let parameters: [String: CustomStringConvertible]
    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.keys.map { key in
            URLQueryItem(name: key, value: parameters[key]?.description)
        }
        guard let url = components.url else {
            return nil
        }
        return URLRequest(url: url)
    }

    public init(url: URL, parameters: [String: CustomStringConvertible] = [:]) {
        self.url = url
        self.parameters = parameters
    }
}
