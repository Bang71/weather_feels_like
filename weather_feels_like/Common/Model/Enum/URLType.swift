//
//  URLType.swift
//  weather_feels_like
//
//  Created by 신병기 on 2023/02/14.
//

import Foundation

enum URLType {
    case current_weather
    case historical_weather
    
    var urlString: String {
        switch self {
        case .current_weather:
            return "https://api.openweathermap.org/data/3.0/onecall"
        case .historical_weather:
            return "https://api.openweathermap.org/data/3.0/onecall/timemachine"
        }
    }
}
