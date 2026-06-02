// SVLBHPanel — Views/LectureFatigueView.swift
// Lecture radiesthésique de la fatigue — Terrain hydrique & Triade chromatique v0.1.0

import SwiftUI

struct LectureFatigueView: View {

    private let vlbhOr      = Color(hex: "#C28D43")
    private let vlbhOrProf  = Color(hex: "#8B6914")
    private let vlbhBleu    = Color(hex: "#2B5EA7")
    private let vlbhBleuP   = Color(hex: "#1E4D8C")
    private let vlbhMagenta = Color(hex: "#BD3482")
    private let vlbhFondSable = Color(hex: "#FBF6EC")
    private let vlbhTexte     = Color(hex: "#2C2C2C")
    private let vlbhTexteDoux = Color(hex: "#555555")
    private let vlbhTexteLeg  = Color(hex: "#888888")
    private let vlbhBorderDoux = Color(hex: "#E8E0D0")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                headerSection
                terrainSection
                triadeSection
                critereSection
                footerSection
            }
            .padding(.horizontal, 20)
        }
        .background(Color(hex: "#F2F6FD"))
        .navigationTitle("Fatigue & Triade")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("SVLBH · LECTURE RADIESTHÉSIQUE")
                .font(.system(size: 11, weight: .bold))
                .tracking(2)
                .foregroundColor(vlbhOrProf)

            Text("La fatigue : terrain hydrique et triade chromatique")
                .font(.system(size: 22, weight: .regular, design: .serif))
                .foregroundColor(vlbhBleuP)

            Text("Différencier une dépense interne légitime d'une captation externe par la lecture de la teinte et de la cinétique.")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexteDoux)
        }
        .padding(.top, 32)
        .padding(.bottom, 24)
        .overlay(alignment: .bottom) {
            Rectangle().fill(vlbhOr).frame(height: 1)
        }
    }

    // MARK: - Terrain

    private var terrainSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Le terrain — nutrition et hydratation")
                .font(.system(size: 19, weight: .bold, design: .serif))
                .foregroundColor(vlbhBleu)
                .padding(.top, 28)

            Text("Parmi les leviers physiologiques classiques de la fatigue, un seul est transposable au cadre SVLBH sans présupposer une cause corporelle : le terrain hydrique et nutritionnel. Il opère au niveau du substrat physique, support de la circulation, sans rien affirmer sur l'origine de l'épuisement.")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexte)

            Text("Une déshydratation même légère altère la lisibilité du signal. La stabilité du terrain ne génère pas la fatigue : elle conditionne la clarté de sa lecture radiesthésique. C'est à ce titre — et à ce titre seul — qu'il entre dans la pratique.")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexte)

            encartOr(text: "**Exclusion explicite.** Les leviers neurochimiques (adénosine, glymphatique, BDNF, cortisol) décrivent une fatigue corporelle de la consultante. Le travail SVLBH écarte cette grille : la fatigue du champ vibratoire relève des mémoires vibratoires lignagères, non du métabolisme neuronal individuel.")
        }
        .padding(.bottom, 12)
    }

    // MARK: - Triade chromatique

    private var triadeSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("La triade chromatique du cycle")
                .font(.system(size: 19, weight: .bold, design: .serif))
                .foregroundColor(vlbhBleu)
                .padding(.top, 16)

            Text("Les trois primaires RVB pures — un seul canal à 255, les deux autres à 0 — portent chacune une phase du cycle physiologique. Leur pureté est le marqueur : tant que la lecture donne une primaire isolée, le drainage reste interne et légitime.")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexte)

            triadeCards
        }
        .padding(.bottom, 12)
    }

    private var triadeCards: some View {
        HStack(spacing: 12) {
            signatureCard(
                color: Color(hex: "#FF0000"),
                hexCode: "#FF0000",
                phase: "L'aube",
                desc: "Montée d'énergie, réactivation du terrain."
            )
            signatureCard(
                color: Color(hex: "#00FF00"),
                hexCode: "#00FF00",
                phase: "La nuit",
                desc: "Repos, récupération du système."
            )
            signatureCard(
                color: Color(hex: "#0000FF"),
                hexCode: "#0000FF",
                phase: "La fin de journée",
                desc: "Drainage interne légitime, dépense propre."
            )
        }
        .padding(.vertical, 10)
    }

    private func signatureCard(color: Color, hexCode: String, phase: String, desc: String) -> some View {
        VStack(spacing: 10) {
            Circle()
                .fill(color)
                .frame(width: 34, height: 34)
                .overlay(
                    Circle().stroke(Color.black.opacity(0.12), lineWidth: 1)
                )

            Text(hexCode)
                .font(.system(size: 11, weight: .bold))
                .tracking(0.5)
                .foregroundColor(vlbhTexteLeg)

            Text(phase)
                .font(.system(size: 15, weight: .regular, design: .serif))
                .foregroundColor(vlbhBleuP)

            Text(desc)
                .font(.system(size: 13))
                .foregroundColor(vlbhTexteDoux)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .padding(.horizontal, 10)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(vlbhBorderDoux, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }

    // MARK: - Critère diagnostique

    private var critereSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Le critère diagnostique")
                .font(.system(size: 19, weight: .bold, design: .serif))
                .foregroundColor(vlbhBleu)
                .padding(.top, 16)

            Text("La lecture combine deux axes — la teinte et la cinétique de survenue :")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexte)

            critereTable

            Text("Toute teinte composite — deux ou trois canaux actifs, ou une primaire dégradée — couplée à une fatigue **subite**, signale la projection d'une volonté externe sur le système énergétique. L'énergie n'est alors plus consumée de l'intérieur : elle est captée et drainée *hors* du système.")
                .font(.system(size: 15))
                .foregroundColor(vlbhTexte)

            encartOr(text: "À relier ultérieurement : le spectre des teintes « hors primaire pure » gagnerait à être cartographié sur les directions Rose des Vents et les signatures Gui 鬼, plutôt que laissé indifférencié.")
        }
        .padding(.bottom, 12)
    }

    private var critereTable: some View {
        VStack(spacing: 0) {
            // Header row
            HStack(spacing: 0) {
                tableHeaderCell("AXE", flex: 1)
                tableHeaderCell("INTERNE / LÉGITIME", flex: 2)
                tableHeaderCell("EXTERNE / CAPTATION", flex: 2)
            }

            // Teinte row
            HStack(spacing: 0) {
                tableCell("Teinte", bold: true, flex: 1)
                tableCell("Primaire RVB pure isolée (#FF0000, #00FF00, #0000FF)", flex: 2)
                tableCell("Toute teinte composite ou primaire dégradée", flex: 2)
            }

            // Cinétique row
            HStack(spacing: 0) {
                tableCell("Cinétique", bold: true, flex: 1, isLast: true)
                tableCell("Progressive (fin de cycle physiologique)", flex: 2, isLast: true)
                tableCell("Subite", flex: 2, isLast: true)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(vlbhBorderDoux, lineWidth: 1)
        )
        .padding(.vertical, 4)
    }

    private func tableHeaderCell(_ text: String, flex: Int) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .bold))
            .tracking(0.5)
            .foregroundColor(vlbhBleuP)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(hex: "#F2F6FD"))
            .overlay(alignment: .bottom) {
                Rectangle().fill(vlbhBorderDoux).frame(height: 1)
            }
    }

    private func tableCell(_ text: String, bold: Bool = false, flex: Int, isLast: Bool = false) -> some View {
        Text(text)
            .font(.system(size: 14, weight: bold ? .semibold : .regular))
            .foregroundColor(vlbhTexte)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .overlay(alignment: .bottom) {
                if !isLast {
                    Rectangle().fill(vlbhBorderDoux).frame(height: 1)
                }
            }
    }

    // MARK: - Encart or

    private func encartOr(text: String) -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(vlbhOr)
                .frame(width: 3)

            Text(LocalizedStringKey(text))
                .font(.system(size: 14))
                .foregroundColor(vlbhTexte)
                .padding(.horizontal, 18)
                .padding(.vertical, 16)
        }
        .background(vlbhFondSable)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }

    // MARK: - Footer

    private var footerSection: some View {
        VStack(spacing: 0) {
            Rectangle().fill(vlbhBorderDoux).frame(height: 1)
                .padding(.top, 32)

            Text("lecture-fatigue-triade-chromatique-v0.1.0 · SVLBH · Juin 2026")
                .font(.system(size: 12))
                .foregroundColor(vlbhTexteLeg)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 20)
    }
}
