//
//  APIError.swift
//  weather_feels_like
//
//  Created by 신병기 on 2023/02/14.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case failureCode
    case decodingError
}
