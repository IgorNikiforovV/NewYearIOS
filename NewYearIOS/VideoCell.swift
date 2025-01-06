//
//  VideoCell.swift
//  NewYearIOS
//
//  Created by Игорь Никифоров on 27.12.2024.
//

import SwiftUI
import AVKit

struct VideoCell: View {
    let video: ChristmasVideo
    @State private var isPlaying = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(video.title)
                .font(.headline)
                .padding(.bottom, 8)

            ZStack {
                if isPlaying {
                    VideoPlayer(player: AVPlayer(url: video.url))
                        .frame(height: 200)
                        .onDisappear {
                            // Остановка видео при уходе с экрана
                            isPlaying = false
                        }
                } else {
                    Image("video_placeholder") // Плейсхолдер для видео (замените на свое изображение)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .overlay(
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                        )
                }
            }
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
            .onTapGesture {
                isPlaying.toggle()
            }

            Text(video.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 8)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}

struct ContentView1: View {
    let christmasVideos = [
        ChristmasVideo(
            title: "Рождественская классика",
            description: "Насладитесь мелодиями рождественских колокольчиков.",
            url: Bundle.main.url(forResource: "christmas1", withExtension: "mp4")!
        ),
        ChristmasVideo(
            title: "Снежные узоры",
            description: "Захватывающее видео зимней сказки.",
            url: Bundle.main.url(forResource: "christmas2", withExtension: "mp4")!
        ),
        ChristmasVideo(
            title: "Праздничное настроение",
            description: "Подарите себе немного магии праздника.",
            url: Bundle.main.url(forResource: "christmas3", withExtension: "mp4")!
        )
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(christmasVideos, id: \.id) { video in
                        VideoCell(video: video)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Рождественские видео")
        }
    }
}

struct ChristmasVideo: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let url: URL
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
