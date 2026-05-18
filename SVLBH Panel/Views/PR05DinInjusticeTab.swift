// SVLBHPanel — Views/PR05DinInjusticeTab.swift
// Passerelle énergétique-médicale : Blessure d'Âme 5 Din · Injustice

import SwiftUI

struct PR05DinInjusticeTab: View {
    @EnvironmentObject var session: SessionState

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    headerSection
                    pedagogieSection
                    mecanismeSection
                    mesuresSection
                    definitionSection
                    architectureSection
                    accumulationsSection
                    scleroseSection
                    reglesSection
                    protocoleSection
                    correspondancesSection
                    corneliaSection
                    masldSection
                    etApresSection
                    parametresSection
                }
                .padding()
                .padding(.bottom, 80)
            }
            .navigationTitle("PR 05 : Injustice")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 3) {
            Text("\u{25c8} Passerelle VLBH \u{2194} M\u{00e9}decine")
                .font(.title2.bold()).foregroundColor(Color(hex: "#8B3A62"))
            Text("Din 5 \u{00b7} R\u{00e9}tinaculum patellaire \u{00b7} G\u{2212}7")
                .font(.caption).foregroundColor(Color(hex: "#333333"))
            Text("Cas arch\u{00e9}type : Blessure d\u{2019}\u{00c2}me 5 Din \u{00b7} Injustice \u{00b7} M22.2 \u{00b7} Rigidit\u{00e9} structurelle")
                .font(.caption2)
                .foregroundColor(Color(hex: "#333333"))
        }
        .padding(.top, 14)
    }

    // MARK: - Architecture 5 couches

    private var architectureSection: some View {
        sectionCard(title: "4. Architecture passerelle \u{2014} 5 couches", icon: "square.stack.3d.up") {
            VStack(spacing: 0) {
                coucheRow(num: "1", system: "Sephiroth multig\u{00e9}n\u{00e9}rationnel", content: "Geburah (Din) \u{00b7} Pilier gauche \u{00b7} Jugement / S\u{00e9}v\u{00e9}rit\u{00e9} \u{00b7} lign\u{00e9}e G\u{2212}7 \u{00b7} SA 7 = 142 %", color: .red)
                coucheRow(num: "2", system: "SVLBHPanel \u{2014} hDOM", content: "Scores SLA/SLSA \u{00b7} Solide : Octa\u{00e8}dre \u{00b7} Masque Rigide actif", color: .blue)
                coucheRow(num: "3", system: "M\u{00e9}decine Traditionnelle Chinoise", content: "M\u{00e9}ridiens GB \u{00b7} LR \u{00b7} ST \u{00b7} BL \u{00b7} Qi contraint \u{2192} stagnation Bois/Feu", color: .green)
                coucheRow(num: "4", system: "Neurologie occidentale", content: "G57.3 nerf fibulaire \u{00b7} compression r\u{00e9}tinaculaire \u{00b7} paresth\u{00e9}sies lat\u{00e9}rales", color: .orange)
                coucheRow(num: "5", system: "M\u{00e9}decine Occidentale ICD-10", content: "M22.2 d\u{00e9}sordre f\u{00e9}moro-patellaire \u{00b7} M76.5 tendinite rotulienne \u{00b7} M35.9 scl\u{00e9}rose tissulaire", color: .red)
            }
            Text("R\u{00e9}tinaculum patellaire rigidifi\u{00e9} r\u{00e9}fractaire \u{00e0} la kin\u{00e9}sith\u{00e9}rapie = indicateur diagnostique VLBH.\nLa rigidit\u{00e9} tissulaire traduit le Masque Rigide de la blessure d\u{2019}Injustice encod\u{00e9} en Geburah.")
                .font(.caption)
                .foregroundColor(Color(hex: "#333333"))
                .padding(.top, 8)
        }
    }

    private func coucheRow(num: String, system: String, content: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(num)
                .font(.system(.title3, design: .rounded).bold())
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(color.opacity(0.8))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(system).font(.subheadline.bold())
                Text(content).font(.caption).foregroundColor(Color(hex: "#333333"))
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }

    // MARK: - Mesures

    private var mesuresSection: some View {
        sectionCard(title: "2. Mesures radiesth\u{00e9}siques", icon: "gauge.with.needle") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                mesureCell(param: "GB 34", val: "Gauche", detail: "Pilier gauche \u{00b7} lign\u{00e9}e paternelle")
                mesureCell(param: "Gu actifs", val: "7", detail: "Charge D5 Geburah")
                mesureCell(param: "Dimension", val: "D5", detail: "Plan Geburah \u{00b7} Jugement karmique")
                mesureCell(param: "Nature Gu", val: "Karmiques rigides", detail: "Syst\u{00e8}me de r\u{00e9}tribution transgn.")
                mesureCell(param: "SLM", val: "27%", detail: "Contraction active")
                mesureCell(param: "Masque", val: "Rigide", detail: "Blessure d\u{2019}Injustice")
                mesureCell(param: "G\u{00e9}n\u{00e9}ration", val: "G\u{2212}7", detail: "~XIXe si\u{00e8}cle")
                mesureCell(param: "pH surr\u{00e9}nale", val: "6.8 rouge", detail: "Cortisol chronique \u{2191}")
            }
        }
    }

    private func mesureCell(param: String, val: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(param).font(.caption2).foregroundColor(Color(hex: "#333333"))
            Text(val).font(.system(.headline, design: .monospaced))
            Text(detail).font(.caption2).foregroundColor(Color(hex: "#333333")).lineLimit(2)
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    // MARK: - Définition clinique

    private var definitionSection: some View {
        sectionCard(title: "3. R\u{00e9}tinaculum \u{2014} Masque Rigide somatique", icon: "brain.head.profile") {
            Text("Le r\u{00e9}tinaculum patellaire est la bande fibreuse qui maintient la rotule dans sa gorge. Lorsque Geburah porte une charge de Jugement/Injustice transgn. non r\u{00e9}solue, la s\u{00e9}v\u{00e9}rit\u{00e9} karmique se somatise en rigidification du r\u{00e9}tinaculum. La rotule perd sa mobilit\u{00e9} lat\u{00e9}rale \u{2014} miroir exact du Masque Rigide qui verrouille la flexibilit\u{00e9} \u{00e9}motionnelle.")
                .font(.callout)
            HStack(spacing: 16) {
                protocolLabel("Charge karmique", shape: "Octa\u{00e8}dre", color: .red)
                protocolLabel("Patient z\u{00e9}ro", shape: "Cube", color: .orange)
            }
            .padding(.top, 4)
        }
    }

    private func protocolLabel(_ label: String, shape: String, color: Color) -> some View {
        HStack(spacing: 6) {
            Circle().fill(color.opacity(0.3)).frame(width: 10, height: 10)
            Text("\(label) \u{2192} **\(shape)**").font(.caption)
        }
    }

    // MARK: - Mécanisme physique

    private var mecanismeSection: some View {
        sectionCard(title: "1. M\u{00e9}canisme Geburah \u{2192} r\u{00e9}tinaculum", icon: "arrow.down.right.and.arrow.up.left") {
            VStack(alignment: .leading, spacing: 12) {
                Text("**1a. Cascade de rigidification**").font(.subheadline)
                Text("Geburah (Din) G\u{2212}7 \u{2192} Jugement non pardonn\u{00e9}\n  \u{2193}\nMasque Rigide activ\u{00e9} \u{2192} hypercontr\u{00f4}le somatique\n  \u{2193}\nM\u{00e9}ridien GB (V\u{00e9}sicule Biliaire) \u{2192} face lat. genou\n  \u{2193}\nR\u{00e9}tinaculum lat\u{00e9}ral \u{2192} fibrose \u{2192} M22.2")
                    .font(.system(.caption, design: .monospaced))
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)

                Text("**1b. Double verrouillage articulaire**").font(.subheadline)
                HStack(spacing: 8) {
                    verrouCard(name: "R\u{00e9}tinaculum lat\u{00e9}ral", status: "Rigidifi\u{00e9} \u{2191}", effect: "Tilt patellaire ext.")
                    verrouCard(name: "R\u{00e9}tinaculum m\u{00e9}dial", status: "Inhib\u{00e9} \u{2193}", effect: "Instabilit\u{00e9} m\u{00e9}diale")
                }

                Text("**1c. Nerf fibulaire commun \u{2014} compression**").font(.subheadline)
                Text("La rigidification du r\u{00e9}tinaculum lat\u{00e9}ral comprime le nerf fibulaire commun au col de la fibula (G57.3). Paresth\u{00e9}sies \u{2192} pied tombant en cas extr\u{00ea}me. Signature neurologique de l\u{2019}Injustice non int\u{00e9}gr\u{00e9}e.")
                    .font(.caption)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
            }
        }
    }

    private func verrouCard(name: String, status: String, effect: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name).font(.caption.bold())
            Text(status).font(.system(.caption, design: .monospaced)).foregroundColor(.red)
            Text(effect).font(.caption2).foregroundColor(Color(hex: "#333333"))
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    // MARK: - Règles cliniques

    private var reglesSection: some View {
        sectionCard(title: "5. R\u{00e8}gles de d\u{00e9}codage", icon: "list.number") {
            VStack(alignment: .leading, spacing: 12) {
                regleRow(num: 1, title: "Lat\u{00e9}ralit\u{00e9} = pilier", body: "Genou gauche = pilier gauche (f\u{00e9}minin/maternel). Genou droit = pilier droit (masculin/paternel). V\u{00e9}rifier la concordance avec la lign\u{00e9}e porteuse.")
                regleRow(num: 2, title: "Rigidit\u{00e9} = Masque actif", body: "Toute fibrose r\u{00e9}fractaire au niveau du genou est un marqueur du Masque Rigide (Injustice). Plus le tissu r\u{00e9}siste, plus la charge Geburah est profonde.")
                regleRow(num: 3, title: "Octa\u{00e8}dre = solide de Geburah", body: "L\u{2019}Octa\u{00e8}dre porte la fr\u{00e9}quence de lib\u{00e9}ration de Din. Il sert de cl\u{00e9} g\u{00e9}om\u{00e9}trique pour la d\u{00e9}sintrication.")
                regleRow(num: 4, title: "Cube G = disjoncteur principal", body: "R\u{00e9}soudre le Cube G\u{2212}7 AVANT d\u{00e9}sintrication. Le patient z\u{00e9}ro porte l\u{2019}acte d\u{2019}injustice originel.")
                regleRow(num: 5, title: "GB 34 = mesure de r\u{00e9}f\u{00e9}rence", body: "GB 34 Yanglingquan (Source des tendons) \u{2014} point Ma\u{00ee}tre des tendons, n\u{0153}ud de mesure privil\u{00e9}gi\u{00e9} pour la charge Geburah sur le r\u{00e9}tinaculum.")
            }
        }
    }

    private func regleRow(num: Int, title: String, body: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text("D\(num)")
                .font(.system(.caption, design: .rounded).bold())
                .foregroundColor(.white)
                .padding(.horizontal, 6).padding(.vertical, 2)
                .background(Color.accentColor.opacity(0.8))
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline.bold())
                Text(body).font(.caption).foregroundColor(Color(hex: "#333333"))
            }
        }
    }

    // MARK: - Protocole

    private var protocoleSection: some View {
        sectionCard(title: "6. Protocole complet", icon: "checklist") {
            VStack(alignment: .leading, spacing: 8) {
                protoStep(n: 1, text: "Identifier la lat\u{00e9}ralit\u{00e9} \u{2014} genou G ou D \u{2192} pilier / lign\u{00e9}e")
                protoStep(n: 2, text: "Mesure GB 34 \u{2014} charge Geburah \u{2014} v\u{00e9}rifier SLM")
                protoStep(n: 3, text: "Cube G\u{2212}7 \u{2014} patient z\u{00e9}ro lign\u{00e9}e \u{2014} acte d\u{2019}injustice originel")
                protoStep(n: 4, text: "Octa\u{00e8}dre \u{2014} lib\u{00e9}ration g\u{00e9}om\u{00e9}trique Geburah \u{2192} Chesed")
                protoStep(n: 5, text: "D\u{00e9}sintrication Gu karmiques \u{00d7} 7 \u{2014} D5 Geburah")
                protoStep(n: 6, text: "Lib\u{00e9}ration du Masque Rigide \u{2014} r\u{00e9}tinaculum lat\u{00e9}ral")
                protoStep(n: 7, text: "Chromoth\u{00e9}rapie surr\u{00e9}nale \u{2014} pH 6.8 rouge \u{2192} \u{00e9}quilibre cortisol")
                protoStep(n: 8, text: "Labradorite blanche 53 t \u{2014} bouclier Geburah \u{2192} neutralisation charge karmique")
                protoStep(n: 9, text: "V\u{00e9}rifier GB 34 + mobilit\u{00e9} patellaire post-lib\u{00e9}ration")
            }
        }
    }

    private func protoStep(n: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\(n)")
                .font(.system(.caption, design: .rounded).bold())
                .frame(width: 22, height: 22)
                .background(Color(.systemGray5))
                .clipShape(Circle())
            Text(text).font(.callout)
        }
    }

    // MARK: - Correspondances anatomiques

    private var correspondancesSection: some View {
        sectionCard(title: "7. Correspondances anatomiques", icon: "figure.stand") {
            VStack(spacing: 0) {
                corrHeader
                corrRow("R\u{00e9}tinaculum lat\u{00e9}ral", "Geburah", "GB", "Gauche", "\u{2193}")
                corrRow("R\u{00e9}tinaculum m\u{00e9}dial", "Chesed", "SP", "Droit", "\u{2191}")
                corrRow("GB 34 Yanglingquan", "Geburah", "GB 34", "Lat\u{00e9}ral", "\u{2014}")
                corrRow("Nerf fibulaire", "Geburah/Hod", "GB/BL", "Lat\u{00e9}ral", "\u{2193}")
                corrRow("Tendon rotulien", "Tiphereth", "ST 35", "Central", "\u{2193}")
                corrRow("Surr\u{00e9}nale", "Geburah (feu)", "KI/BL", "Dorsal", "\u{2014}")
                corrRow("Fascia lata / TFL", "Geburah\u{2192}Netzach", "GB 31", "Lat\u{00e9}ral", "\u{2193}")
            }
        }
    }

    private var corrHeader: some View {
        HStack {
            Text("Structure").font(.caption2.bold()).frame(maxWidth: .infinity, alignment: .leading)
            Text("Sephirah").font(.caption2.bold()).frame(maxWidth: .infinity, alignment: .leading)
            Text("M\u{00e9}ridien").font(.caption2.bold()).frame(width: 60, alignment: .leading)
            Text("Pilier").font(.caption2.bold()).frame(width: 55, alignment: .leading)
            Text("Sens").font(.caption2.bold()).frame(width: 45, alignment: .leading)
        }
        .padding(.vertical, 4)
        .background(Color(.systemGray5))
    }

    private func corrRow(_ structure: String, _ seph: String, _ mer: String, _ pilier: String, _ sens: String) -> some View {
        HStack {
            Text(structure).font(.caption2).frame(maxWidth: .infinity, alignment: .leading)
            Text(seph).font(.caption2).frame(maxWidth: .infinity, alignment: .leading)
            Text(mer).font(.system(.caption2, design: .monospaced)).frame(width: 60, alignment: .leading)
            Text(pilier).font(.caption2).frame(width: 55, alignment: .leading)
            Text(sens).font(.caption2).frame(width: 45, alignment: .leading)
        }
        .padding(.vertical, 3)
    }

    // MARK: - Paramètres

    private var parametresSection: some View {
        sectionCard(title: "8. Param\u{00e8}tres SVLBHPanel", icon: "gearshape.2") {
            VStack(alignment: .leading, spacing: 4) {
                paramRow("blessure", "injustice")
                paramRow("masque", "rigide")
                paramRow("sephirah", "geburah_din_5")
                paramRow("solide", "octa\u{00e8}dre")
                paramRow("pilier", "gauche_s\u{00e9}v\u{00e9}rit\u{00e9}")
                paramRow("type_gu", "karmique_rigide | transgn._jugement")
                paramRow("m\u{00e9}ridien_ref", "GB_34_yanglingquan")
                paramRow("icd10", "M22.2 | M76.5 | G57.3 | K76.0 | K75.81")
                paramRow("pierre", "labradorite_blanche_53t")
            }
        }
    }

    private func paramRow(_ key: String, _ value: String) -> some View {
        HStack(spacing: 4) {
            Text("n\u{0153}ud.\(key)").font(.system(.caption2, design: .monospaced)).foregroundColor(.accentColor)
            Text(":").font(.caption2)
            Text(value).font(.system(.caption2, design: .monospaced)).foregroundColor(Color(hex: "#333333"))
        }
    }

    // MARK: - Pédagogie

    private var pedagogieSection: some View {
        sectionCard(title: "0. Introduction", icon: "lightbulb") {
            Text("Le neurologue observe un syndrome f\u{00e9}moro-patellaire r\u{00e9}fractaire M22.2 avec compression du nerf fibulaire G57.3. La cause r\u{00e9}elle est un Octa\u{00e8}dre Geburah G\u{2212}7 portant une charge de Jugement/Injustice h\u{00e9}rit\u{00e9}e du XIXe si\u{00e8}cle, somatisant le Masque Rigide en rigidification du r\u{00e9}tinaculum lat\u{00e9}ral, 7 Gu karmiques D5 sur GB 34, un d\u{00e9}s\u{00e9}quilibre cortisol surr\u{00e9}nalien, et une perte de mobilit\u{00e9} patellaire miroir de l\u{2019}inflexibilit\u{00e9} \u{00e9}motionnelle.")
                .font(.callout)
            Text("Cinq couches. Une seule blessure : l\u{2019}Injustice.")
                .font(.headline)
                .padding(.top, 4)
        }
    }

    // MARK: - Accumulations historiques

    private var accumulationsSection: some View {
        sectionCard(title: "Accumulations historiques", icon: "clock.arrow.circlepath") {
            VStack(alignment: .leading, spacing: 8) {
                Text("**Origine : SA 7 = 142 %**").font(.subheadline)
                Text("La Sur-\u{00c2}me 7 porte une surcharge de 142 % \u{2014} signature d\u{2019}accumulation transgn. sur 7 g\u{00e9}n\u{00e9}rations. L\u{2019}injustice originelle (G\u{2212}7, ~XIXe s.) n\u{2019}a jamais \u{00e9}t\u{00e9} reconnue ni r\u{00e9}par\u{00e9}e. Chaque g\u{00e9}n\u{00e9}ration a ajout\u{00e9} une couche de rigidit\u{00e9} compensatoire.")
                    .font(.callout)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 6) {
                    accumCell(gen: "G\u{2212}7", event: "Injustice originelle", charge: "20 %")
                    accumCell(gen: "G\u{2212}6", event: "Silence impos\u{00e9}", charge: "18 %")
                    accumCell(gen: "G\u{2212}5", event: "Masque Rigide h\u{00e9}rit\u{00e9}", charge: "22 %")
                    accumCell(gen: "G\u{2212}4", event: "Somatisation genou", charge: "19 %")
                    accumCell(gen: "G\u{2212}3", event: "Fibrose r\u{00e9}tinaculaire", charge: "21 %")
                    accumCell(gen: "G\u{2212}2", event: "Compression nerf.", charge: "23 %")
                    accumCell(gen: "G\u{2212}1", event: "H\u{00e9}ritage actif", charge: "19 %")
                }
                Text("Total cumul\u{00e9} : 142 % \u{2192} SA 7 en surcharge karmique active")
                    .font(.caption.bold())
                    .foregroundColor(Color(hex: "#8B3A62"))
                    .padding(.top, 4)
            }
        }
    }

    private func accumCell(gen: String, event: String, charge: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(gen).font(.system(.caption2, design: .monospaced).bold())
            Text(event).font(.caption2).foregroundColor(Color(hex: "#333333")).lineLimit(2)
            Text(charge).font(.caption2.bold()).foregroundColor(.red)
        }
        .padding(6)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(6)
    }

    // MARK: - Sclérose

    private var scleroseSection: some View {
        sectionCard(title: "Scl\u{00e9}rose tissulaire \u{2014} signature Din", icon: "bandage") {
            VStack(alignment: .leading, spacing: 8) {
                Text("La scl\u{00e9}rose du r\u{00e9}tinaculum est le stade terminal de la rigidification Geburah. Le tissu conjonctif perd son \u{00e9}lasticit\u{00e9}, les fibres de collag\u{00e8}ne s\u{2019}alignent en faisceaux rigides \u{2014} miroir histologique du Masque Rigide.")
                    .font(.callout)
                HStack(spacing: 8) {
                    scleroseCard(stade: "1. Inflammation", desc: "R\u{00e9}action initiale GB", icd: "M79.3")
                    scleroseCard(stade: "2. Fibrose", desc: "D\u{00e9}p\u{00f4}t collag\u{00e8}ne", icd: "M76.5")
                    scleroseCard(stade: "3. Scl\u{00e9}rose", desc: "Rigidit\u{00e9} terminale", icd: "M35.9")
                }
                Text("M35.9 scl\u{00e9}rose syst\u{00e9}mique non sp\u{00e9}cifi\u{00e9}e \u{2014} quand la rigidit\u{00e9} d\u{00e9}passe le r\u{00e9}tinaculum et atteint le fascia global.")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#333333"))
            }
        }
    }

    private func scleroseCard(stade: String, desc: String, icd: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(stade).font(.caption2.bold())
            Text(desc).font(.caption2).foregroundColor(Color(hex: "#333333"))
            Text(icd).font(.system(.caption2, design: .monospaced)).foregroundColor(.red)
        }
        .padding(6)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(6)
    }

    // MARK: - Cornelia 48

    private var corneliaSection: some View {
        sectionCard(title: "Cas Cornelia 48 \u{2014} erreurs 2h35", icon: "exclamationmark.triangle") {
            VStack(alignment: .leading, spacing: 8) {
                Text("**Erreurs rencontr\u{00e9}es \u{2014} session nocturne 2h35**")
                    .font(.subheadline)
                VStack(alignment: .leading, spacing: 6) {
                    erreurRow(code: "E1", desc: "SA 7 \u{00e0} 142 % d\u{00e9}tect\u{00e9}e hors plage standard \u{2014} surcharge non anticip\u{00e9}e")
                    erreurRow(code: "E2", desc: "Octa\u{00e8}dre Geburah instable \u{2014} charge karmique exc\u{00e8}de la capacit\u{00e9} du solide")
                    erreurRow(code: "E3", desc: "Nerf fibulaire en compression active pendant la d\u{00e9}sintrication")
                    erreurRow(code: "E4", desc: "Rebond scl\u{00e9}rotique post-lib\u{00e9}ration \u{2014} le r\u{00e9}tinaculum se re-rigidifie")
                    erreurRow(code: "E5", desc: "Cube G\u{2212}7 r\u{00e9}siste \u{2014} patient z\u{00e9}ro non compl\u{00e8}tement identifi\u{00e9}")
                }
                Text("Correction : stabiliser SA 7 avant d\u{00e9}sintrication. Doubler le temps de maintien de l\u{2019}Octa\u{00e8}dre. V\u{00e9}rifier Cube G\u{2212}7 en amont.")
                    .font(.caption.bold())
                    .foregroundColor(Color(hex: "#8B3A62"))
                    .padding(.top, 4)
            }
        }
    }

    private func erreurRow(code: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text(code)
                .font(.system(.caption2, design: .monospaced).bold())
                .foregroundColor(.white)
                .padding(.horizontal, 5).padding(.vertical, 2)
                .background(Color.red.opacity(0.8))
                .cornerRadius(4)
            Text(desc).font(.caption).foregroundColor(Color(hex: "#333333"))
        }
    }

    // MARK: - MASLD / Stéatose hépatique

    private var masldSection: some View {
        sectionCard(title: "MASLD \u{2014} St\u{00e9}atose h\u{00e9}patique m\u{00e9}tabolique", icon: "liver.fill") {
            VStack(alignment: .leading, spacing: 10) {
                Text("Geburah gouverne le Feu et la V\u{00e9}sicule Biliaire (GB). Quand le Masque Rigide comprime le m\u{00e9}ridien LR (Foie), la stagnation du Qi h\u{00e9}patique produit une st\u{00e9}atose m\u{00e9}tabolique \u{2014} le foie stocke ce que Din refuse de lib\u{00e9}rer.")
                    .font(.callout)

                Text("**Codification ICD**").font(.subheadline)
                VStack(spacing: 0) {
                    icdProgRow(system: "ICD-9", code: "571.8", label: "St\u{00e9}atose h\u{00e9}patique")
                    icdProgRow(system: "ICD-10", code: "K76.0", label: "St\u{00e9}atose graisseuse")
                    icdProgRow(system: "ICD-10", code: "K75.81", label: "NASH (st\u{00e9}ato-h\u{00e9}patite)")
                    icdProgRow(system: "ICD-11", code: "DB92.0", label: "MASLD")
                    icdProgRow(system: "ICD-11", code: "DB92.1", label: "MASH")
                }
                .background(Color(.systemGray6))
                .cornerRadius(8)

                Text("**Progression fibrotique**").font(.subheadline).padding(.top, 4)
                HStack(spacing: 6) {
                    progressionCard(stade: "Fibrose pr\u{00e9}coce", icd: "K74.01", color: .yellow)
                    progressionCard(stade: "Fibrose avanc\u{00e9}e", icd: "K74.02", color: .orange)
                    progressionCard(stade: "Cirrhose", icd: "K74.60", color: .red)
                }

                Text("K76.0 r\u{00e9}fractaire aux mesures di\u{00e9}t\u{00e9}tiques = marqueur VLBH. La st\u{00e9}atose traduit le refus de Geburah de lib\u{00e9}rer la charge karmique \u{2014} le foie accumule litt\u{00e9}ralement ce que l\u{2019}\u{00e2}me refuse de dig\u{00e9}rer.")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#333333"))
                    .padding(.top, 4)
            }
        }
    }

    private func icdProgRow(system: String, code: String, label: String) -> some View {
        HStack {
            Text(system)
                .font(.system(.caption2, design: .monospaced).bold())
                .frame(width: 50, alignment: .leading)
            Text(code)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(Color(hex: "#8B3A62"))
                .frame(width: 60, alignment: .leading)
            Text(label).font(.caption)
            Spacer()
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }

    private func progressionCard(stade: String, icd: String, color: Color) -> some View {
        VStack(spacing: 3) {
            Text(stade).font(.caption2.bold()).multilineTextAlignment(.center)
            Text(icd).font(.system(.caption, design: .monospaced)).foregroundColor(color)
        }
        .padding(6)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(6)
    }

    // MARK: - Et après

    private var etApresSection: some View {
        sectionCard(title: "Et apr\u{00e8}s ?", icon: "sparkles") {
            VStack(alignment: .leading, spacing: 8) {
                Text("**Suivi post-lib\u{00e9}ration Geburah/Din**").font(.subheadline)
                etApresRow(delai: "J+1", action: "V\u{00e9}rifier mobilit\u{00e9} patellaire lat\u{00e9}rale \u{2014} le r\u{00e9}tinaculum doit c\u{00e9}der")
                etApresRow(delai: "J+3", action: "Contr\u{00f4}le GB 34 \u{2014} la charge Geburah doit \u{00ea}tre < 10 %")
                etApresRow(delai: "J+7", action: "SA 7 doit redescendre sous 100 % \u{2014} d\u{00e9}cumulation en cours")
                etApresRow(delai: "J+14", action: "V\u{00e9}rifier absence de rebond scl\u{00e9}rotique \u{2014} si rechute, reprendre Cube G\u{2212}7")
                etApresRow(delai: "J+21", action: "Int\u{00e9}gration du pardon Chesed \u{2192} le Masque Rigide se dissout")
                etApresRow(delai: "J+30", action: "SLM global \u{2192} le neurologue doit constater am\u{00e9}lioration M22.2 / G57.3")
                Text("Si le Masque Rigide persiste apr\u{00e8}s J+30 : v\u{00e9}rifier une deuxi\u{00e8}me lign\u{00e9}e porteuse (pilier droit).")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#333333"))
                    .padding(.top, 4)
            }
        }
    }

    private func etApresRow(delai: String, action: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(delai)
                .font(.system(.caption, design: .monospaced).bold())
                .frame(width: 40, alignment: .leading)
                .foregroundColor(Color(hex: "#8B3A62"))
            Text(action).font(.caption)
        }
    }

    // MARK: - Section wrapper

    private func sectionCard<Content: View>(title: String, icon: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Divider()
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(Color(hex: "#8B3A62"))
            content()
        }
        .padding(.horizontal, 16)
    }
}
