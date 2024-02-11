//
//  ContentView.swift
//  movieBook
//
//  Created by MacBook Pro on 9.02.2024.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
  
    }
    var body: some View {
        
        NavigationView {
            VStack{
                TextField("Aranacak filmi giriniz..", text: $aranacakFilm, onEditingChanged: { _ in}, onCommit: {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in:.whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                List(filmListeViewModel.filmler, id : \.imdbId) { film in
                    NavigationLink(destination: DetayView(imdbId: film.imdbId)) {
                        HStack{
                            OzelImage(url: film.poster)
                                .frame(width: 90, height: 130)
                            
                            VStack(alignment: .leading) {
                                
                                Text(film.title)
                                    .bold()
                                    .foregroundColor(.blue)
                                Text(film.year)
                            }
                            
                        }
                    }
                    
                }
            }.navigationTitle("Movie Book")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
