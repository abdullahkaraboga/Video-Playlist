//
//  ContentView.swift
//  VideoPlaylist
//
//  Created by Abdullah Karaboğa on 17.02.2023.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if UIDevice.current.orientation.isLandscape {
                    Color.black.edgesIgnoringSafeArea(.all)
                }

                VStack {
                    player().frame(height: UIDevice.current.orientation.isLandscape ? geo.size.height : geo.size.height / 3)

                    if !UIDevice.current.orientation.isLandscape {

                        MainBody()

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

struct player: UIViewControllerRepresentable {

    func makeUIViewController (context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {

        let player1 = AVPlayer(url: URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_10MB.mp4")!)
        let controller = AVPlayerViewController()
        controller.player = player1
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
    }
}

struct MainBody: View {
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                subscriber()

                ForEach(1..<10) { i in

                    VideoCard(image: "img\(i)", name: "Video \(i)")

                }
            }

        }.padding(20)
    }
}

struct subscriber: View {
    var body: some View {
        HStack {
            Image("img2")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, content: {
                Text("Abdullah Karaboğa").fontWeight(.bold).fixedSize()
                Text("120 subscribers").fixedSize()

            })

            Spacer()

            Button(action: {

            }) {

                Text("Subscribe").fontWeight(.bold)

            }.foregroundColor(.red)
        }
    }
}

struct VideoCard: View {
    var image = ""
    var name = ""

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .cornerRadius(4.0)
                .frame(width: 120, height: 80)

            VStack (alignment: .leading, content: {
                Text(name).fontWeight(.semibold)
                Text("Abdullah Karaboğa")
                Text("1200 views")
            }).frame(width: UIScreen.main.bounds.width - 170, alignment: .leading)

            VStack {
                Button(action: {

                }) {

                    Image(systemName: "play.fill")

                        .resizable()
                        .frame(width: 15, height: 15)
                    Spacer()

                }.padding(.horizontal, -20)
                    .foregroundColor(Color("Custom"))
            }
        }
    }
}
