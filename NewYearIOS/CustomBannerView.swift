//
//  CustomBannerView.swift
//  NewYearIOS
//
//  Created by Игорь Никифоров on 27.12.2024.
//

import SwiftUI

struct CustomBannerView: View {
    var body: some View {
        HStack(spacing: 16) { // Пространство между изображением и текстом
            Image("Santa") // Замените на имя вашего изображения из Assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50) // Задайте нужные размеры
                .padding(12) // Отступ 12 от подложки

            Text("Удачного года без deprecated API!")
                .font(.system(size: 16, weight: .regular))
                //.foregroundColor(Color(hex: "#121212"))
                .multilineTextAlignment(.leading)

            Spacer() // Заполнение оставшегося пространства
        }
        .padding() // Внутренние отступы для всего HStack
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
        )
        .frame(maxWidth: .infinity, maxHeight: 80) // Задайте нужный размер или удалите для адаптивности
        .padding([.leading, .trailing], 16) // Внешние отступы слева и справа
    }
}

// MARK: - Preview

struct CustomBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBannerView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
