//
//  ImageLoader.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 4.06.2024.
//

import SwiftUI
import Kingfisher

struct ImageLoader: View {
    let url: String
    let width: Double
    let height: Double
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                ProgressView()
            }
            .resizable()
            .onSuccess({ result in
            })
            .onFailure({ error in
            })
            .onFailureImage(UIImage.sharingan)
            .cacheMemoryOnly()
            .frame(width: width, height: height)
            .background(Color.gray.opacity(0.4))
            .aspectRatio(contentMode: .fit)

    }
}

#Preview {
    ImageLoader(url: "https://static.wikia.nocookie.net/naruto/images/4/44/Amachi.png/revision/latest/scale-to-width-down/300?cb=20150528184924",
                width: UIScreen.screenWidth,
                height: 250
    )

}
