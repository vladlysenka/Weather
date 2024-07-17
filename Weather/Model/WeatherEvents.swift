// Created by Vlad Lysenka 17.07.2024

import SwiftUI

enum WeatherEvents: String, CaseIterable {
    case sunny        = "sun.max.fill"
    case cloud        = "cloud.fill"
    case rain         = "cloud.rain.fill"
    case thunderstorm = "cloud.bolt.rain.fill"
    case fog          = "cloud.fog.fill"
    
    var title: LocalizedStringKey {
        switch self {
        case .sunny        : "Ясно"
        case .cloud        : "Облачно"
        case .rain         : "Дождь"
        case .thunderstorm : "Гроза"
        case .fog          : "Туман"
        }
    }
}
