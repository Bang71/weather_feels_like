//
//  APIService.swift
//  weather_feels_like
//
//  Created by 신병기 on 2023/02/14.
//

import Foundation

class APIService {
    
    func getRequestData<T: Codable>(type: T.Type, path: URLType, parameters: [String : Any]? = nil) async throws -> T {
        guard var urlComponents = URLComponents(string: path.urlString) else {
            throw APIError.invalidURL
        }
        
        if let parameters = parameters {
            let urlQueryItemList = parameters.compactMap { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
            
            urlComponents.queryItems = urlQueryItemList
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.failureCode
        }
        
        do {
            guard let responseData = try? JSONDecoder().decode(type.self, from: data) else {
                throw APIError.decodingError
            }
            return responseData
        } catch {
            throw APIError.decodingError
        }
    }
}
