//
//  CardView.swift
//  NewYearIOS
//
//  Created by Игорь Никифоров on 27.12.2024.
//

//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Simon Ng on 14/8/2020.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Image("Сhristmas_winter")
                .resizable()
                .aspectRatio(contentMode: .fill)

            HStack {
                VStack(alignment: .leading) {
                    Text("Подборка 2024")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Frank Sinatra — Christmas Dreaming")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                }

                Spacer()

                Button {

                } label: {
                    Image("Image1")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            .padding()
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                .shadow(radius: 5)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
