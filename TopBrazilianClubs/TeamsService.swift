//
//  ClubsService.swift
//  TopBrazilianClubs
//
//  Created by hugo.coutinho on 08/10/21.
//

import Foundation

typealias Teams = [TeamEntity]
struct TeamEntity {
    let name, clubLogoUrl, imageDetailUrl, description: String
    let nationalLeagueWinsCount: Int
}

class TeamsService {
    func getClubs() -> Teams {
        return [
            TeamEntity(
                name: "Flamengo",
                clubLogoUrl: "https://i.pinimg.com/originals/0e/89/ba/0e89baf1325db2ff7996bfb068416b1b.jpg",
                imageDetailUrl: "https://www.campeoesdofutebol.com.br/imagens5/flamengo_jogadores_comemoram_titulo_libertadores_2019.jpg",
                description: "Clube de Regatas do Flamengo, commonly referred to as Flamengo, is a Brazilian sports club based in Rio de Janeiro, in the neighbourhood of Gávea, best known for their professional football team",
                nationalLeagueWinsCount: 8),
            TeamEntity(
                name: "Galo",
                clubLogoUrl: "https://logodownload.org/wp-content/uploads/2016/10/atletico-mineiro-logo-escudo-.png",
                imageDetailUrl: "https://lh3.googleusercontent.com/-y3fslkh9MnU/VqvLFD3ZSVI/AAAAAAAADJQ/sO-EZl4E7OQ/s720-Ic42/2013%252520Atletico%252520Mineiro%252520Campe%2525C3%2525A3o%252520da%252520Libertadores%25252006.jpg",
                description: "Clube Atlético Mineiro, commonly known as Atlético Mineiro or Atlético, and colloquially as Galo, is a professional football club based in the city of Belo Horizonte || Clube Atlético Mineiro, commonly known as Atlético Mineiro or Atlético, and colloquially as Galo, is a professional football club based in the city of Belo Horizonte",
                nationalLeagueWinsCount: 1),
            TeamEntity(
                name: "Palmeiras",
                clubLogoUrl: "https://logoeps.com/wp-content/uploads/2012/06/palmeiras-logo-vector-01.png",
                imageDetailUrl: "https://observatoriodosfamosos.uol.com.br/portal/wp-content/uploads/2021/03/plameiras-2.jpg",
                description: "Sociedade Esportiva Palmeiras, commonly known as Palmeiras, is a Brazilian professional football club based in the city of São Paulo. ||| Sociedade Esportiva Palmeiras, commonly known as Palmeiras, is a Brazilian professional football club based in the city of São Paulo. ||| Sociedade Esportiva Palmeiras, commonly known as Palmeiras, is a Brazilian professional football club based in the city of São Paulo.",
                nationalLeagueWinsCount: 10)
        ]
    }
}
