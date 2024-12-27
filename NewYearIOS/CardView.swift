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
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)

            HStack {
                VStack(alignment: .leading) {
                    Text("Подборка 2024")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("Frank Sinatra — Christmas Dreaming")
                        .font(.caption)
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
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
