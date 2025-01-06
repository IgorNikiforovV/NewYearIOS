//
//  TabView.swift
//  NewYearIOS
//
//  Created by Игорь Никифоров on 27.12.2024.
//

import SwiftUI

// MARK: - Основное представление с TabView
struct MainTabView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(hex: "#E7E7E7")
        UITabBar.appearance().backgroundColor = UIColor(hex: "#E7E7E7")
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor(hex: "#5548E7")
        UITabBar.appearance().unselectedItemTintColor = .gray
    }

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image("Home")
                    Text("")
                }
                .ignoresSafeArea()
                .tag(0)
            CardView()
                .tabItem {
                    Image("Play")
                    Text("")
                }
                .tag(1)
            CustomBannerView()
                .tabItem {
                    Image("More Circle")
                    Text("")
                }
                .tag(2)
            ContentView()
                .tabItem {
                    Image("Chat")
                    Text("")
                }
                .tag(3)
        }
    }
}

// MARK: - Превью
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 14")
    }
}

// MARK: - Расширения для работы с hex

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF,
                            (int >> 16) & 0xFF,
                            (int >> 8) & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}
