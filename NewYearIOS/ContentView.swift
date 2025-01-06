//
//  ContentView.swift
//  NewYearIOS
//
//  Created by Игорь Никифоров on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {

            ScrollView {
                // Заголовок
                HStack(alignment: .bottom) {
                    Button {

                    } label: {
                        Image("Seach")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                    Text("Хо-хо-хо!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    Spacer()
                    Button {

                    } label: {
                        Image("Notification")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.horizontal)

                // Верхний блок с елкой и подарками
                CardView()
                    .padding(.bottom, 20)

                // Блок с пожеланиями
                VStack(alignment: .leading) {
                    Text("Пожелания в Новом году")
                        .font(.headline)
                    HStack {
                        VStack {
                            WishCard(model: Wish(imageName: "Santa", text: "Удачного года без deprecated API!", size: CGSize(width: 138, height: 177)))
                            WishCard(model: Wish(imageName: "Socks", text: "Пусть новые фичи не ломают старые релизы!", size: CGSize(width: 137, height: 116)))
                        }

                        VStack {
                            WishCard(model: Wish(imageName: "Gloves", text: "Пусть App Store никогда не тормозит модерацию!", size: CGSize(width: 130, height: 116)))
                            WishCard(model:  Wish(imageName: "Cookie", text: "Стабильной работы Xcode... ну хоть на праздники!", size: CGSize(width: 130, height: 176)))
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .padding(.top, 50)
    }
}

struct Wish: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var text: String
    var size: CGSize

    static let list: [Wish] = [
        Wish(imageName: "Santa", text: "Удачного года без deprecated API!", size: CGSize(width: 138, height: 177)),
        Wish(imageName: "Mittens", text: "Пусть App Store никогда не тормозит модерацию!", size: CGSize(width: 130, height: 116)),
        Wish(imageName: "Socks", text: "Пусть новые фичи не ломают старые релизы!", size: CGSize(width: 137, height: 116)),
        Wish(imageName: "Gingerbread", text: "Стабильной работы Xcode... ну хоть на праздники!", size: CGSize(width: 130, height: 176)),
    ]
}

struct WishCard: View {
    var model: Wish

    var body: some View {
        VStack {
            Image(model.imageName)
                .resizable()
                .frame(width: model.size.width, height: model.size.height)

            Text(model.text)
                .font(.footnote)
                //.multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
