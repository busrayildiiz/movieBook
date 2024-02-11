//
//  OzelImage.swift
//  movieBook
//
//  Created by MacBook Pro on 10.02.2024.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMmFiMTczYjgtMWQwOC00MjFlLWFlZjUtMjJjNTcxNjAzY2Q1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg")
    }
}
