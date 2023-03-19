//
//  ContentView.swift
//  Desafio4
//
//  Created by Erik Loures on 19/03/23.
//

import SwiftUI

struct ContentView: View {
    struct Sea: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }

    struct BrazilState: Identifiable {
        let name: String
        let seas: [Sea]
        let id = UUID()
    }

    private let brazilState: [BrazilState] = [
        BrazilState(name: "Distrito Federal",
                    seas: [Sea(name: "Brasilia")]),
        BrazilState(name: "Estados da Região Norte",
                    seas: [Sea(name: " Acre (AC)"),
                           Sea(name: "Amapá (AP)"),
                           Sea(name: "Amazonas (AM)"),
                           Sea(name: "Pará (PA)"),
                           Sea(name: "Rondônia (RO)"),
                           Sea(name: "Roraima (RR)"),
                           Sea(name: "Tocantins (TO)")]),
        BrazilState(name: "Estados da Região Nordeste",
                    seas: [Sea(name: "Maranhão (MA)"),
                           Sea(name: "Piauí (PI)"),
                           Sea(name: "Ceará (CE)"),
                           Sea(name: "Rio Grande do Norte (RN)"),
                           Sea(name: "Paraíba (PB)"),
                           Sea(name: "Pernambuco (PE)"),
                           Sea(name: "Alagoas (AL)"),
                           Sea(name: "Sergipe (SE)"),
                           Sea(name: "Bahia (BA)")]),
        BrazilState(name: "Estados da Região Centro-Oeste",
                    seas: [Sea(name: "Distrito Federal (DF)"),
                           Sea(name: "Goiás (GO)"),
                           Sea(name: "Mato Grosso (MT)"),
                           Sea(name: "Mato Grosso do Sul (MS)")]),
        BrazilState(name: "Estados da Região Sudeste",
                    seas: [Sea(name: "São Paulo (SP)"),
                           Sea(name: "Rio de Janeiro (RJ)"),
                           Sea(name: "Minas Gerais (MG)"),
                           Sea(name: "Espírito Santo (ES)")]),
        BrazilState(name: "Estados da Região Sul",
                    seas: [Sea(name: "Paraná (PR)"),
                           Sea(name: "Santa Catarina (SC)"),
                           Sea(name: "Rio Grande do Sul (RS)")]),
      
    ]
    
    @State private var singleSelection: UUID?

    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                ForEach(brazilState) { region in
                    Section(header: Text(" \(region.name)")) {
                        ForEach(region.seas) { sea in
                            Text(sea.name)
                                .onAppear(perform: {
                                    print("Apareceu na tela!")
                                })
                                .onDisappear(perform: {
                                    print("Desapareceu da tela!")
                                })
                        }
                    }
                }
            }
            .navigationTitle("Estados do Brasil")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
