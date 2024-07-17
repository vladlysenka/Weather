// Created by Vlad Lysenka 17.07.2024

import SwiftUI


struct ContentView: View {
    @State private var store = Store()
    
    var body: some View {
        VStack {
            Text("Weather")
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 5) {
                    ForEach(WeatherEvents.allCases, id: \.self) { phenomenon in
                        WeatherRow(phenomenon: phenomenon)
                    }
                }
            }
            
            Spacer()
            
            if store.showPhenomenon {
                VStack(spacing: 15) {
                    Image(systemName: store.currentPhenomenon.rawValue)
                        .font(.system(size: 100))
                        .symbolRenderingMode(.multicolor)
                        .frame(width: 125, height: 125, alignment: .top)
                    
                    Text(store.currentPhenomenon.title)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                }
                .transition(.scale)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .safeAreaPadding(.horizontal, 15)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.25)) {
                store.selectPhenomenon(WeatherEvents.allCases.randomElement() ?? .sunny)
            }
        }
    }
    
    @ViewBuilder func WeatherRow(phenomenon: WeatherEvents) -> some View {
        VStack(spacing: 15) {
            Image(systemName: phenomenon.rawValue)
                .font(.largeTitle)
                .symbolRenderingMode(.multicolor)
                .frame(width: 40, height: 40, alignment: .top)
            
            Text(phenomenon.title)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
        }
        .frame(width: 125, height: 125)
        .background(store.currentPhenomenon == phenomenon ? Color.green.opacity(0.2) : Color.clear, in: .rect(cornerRadius: 16))
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
        .padding(5)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                store.selectPhenomenon(phenomenon)
            }
        }
    }
}

#Preview {
    ContentView()
}
