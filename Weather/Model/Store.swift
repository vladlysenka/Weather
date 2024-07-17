// Created by Vlad Lysenka 17.07.2024

import SwiftUI
import Combine
import Observation

@Observable class Store {
    var currentPhenomenon: WeatherEvents = .sunny
    var showPhenomenon = false
        
    private var cancellable: AnyCancellable?

    func selectPhenomenon(_ phenomenon: WeatherEvents) {
        currentPhenomenon = phenomenon
        showPhenomenon = true
        
        cancellable?.cancel()
        
        cancellable = Timer.publish(every: 3, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                withAnimation(.easeInOut) {
                    self.showPhenomenon = false
                }
            }
    }
}
