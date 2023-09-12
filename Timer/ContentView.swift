//
//  ContentView.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab: Int, Identifiable, CaseIterable {
        var id: Int { rawValue }
        
        case timer15, timer30
    }

    @State private var tab: Tab = .timer15

    var body: some View {
        TabView {
            ForEach(Tab.allCases) { tab in
                switch tab {
                case .timer15:
                    TimerUIComposer.composeWith(seconds: 15)
                        .tag(tab)
                        .tabItem {
                            Image(systemName: "clock")
                            Text("15")
                        }
                case .timer30:
                    TimerUIComposer.composeWith(seconds: 30)
                        .tag(tab)
                        .tabItem {
                            Image(systemName: "clock")
                            Text("30")
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
