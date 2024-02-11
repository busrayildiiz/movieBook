//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Atil Samancioglu on 17.10.2020.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
           
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title2).foregroundColor(.blue).padding()
            HStack{
                Text("Yıl:").padding(.leading).bold()
                Text(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")
            }
            HStack{
                Text("Yönetmen:").padding(.leading).bold()
                Text(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")
            }
           
            
            HStack{
                Text("Yazar:").padding(.leading).bold()
                Text(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")
            }
            HStack{
                Text("Ödüller:").padding(.leading).bold()
                Text( filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")
            }
          
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
           
            Spacer()
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "t")
    }
}
