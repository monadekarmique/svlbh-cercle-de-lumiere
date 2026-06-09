// SVLBHPanel — Views/ProvocationView.swift
// v4.8.0 — Classification des énergies parasitaires — 3 permanentes + 5 temporaires

import SwiftUI

struct ProvocationView: View {
    @EnvironmentObject var session: SessionState
    @EnvironmentObject var tracker: SessionTracker
    /// Sélections permanentes (gauche) — uniquement les slots remplis (gris bulk-supprimés 2026-05-08).
    @State private var permanentSelections: [Int] = []
    /// Sélections temporaires (droite) — uniquement les slots remplis.
    @State private var temporarySelections: [Int] = []

    @State private var addPermanentSheet = false
    @State private var addTemporarySheet = false
    @State private var newPermanentPick: Int? = nil
    @State private var newTemporaryPick: Int? = nil

    var body: some View {
        VStack(spacing: 12) {
            // Header + compteur validées
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Énergies Parasitaires")
                        .font(.title3.bold())
                        .foregroundColor(Color(hex: "#8B3A62"))
                    Text("\(ParasiteEnergyData.permanentes.count) permanentes · \(ParasiteEnergyData.temporaires.count) temporaires")
                        .font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                // Compteur validées / affichées (côté droit)
                VStack(spacing: 2) {
                    Text("\(session.validatedCount)/\(session.visibleGenerations.count)")
                        .font(.title2.bold())
                        .foregroundColor(Color(hex: "#1D9E75"))
                    Text("validées")
                        .font(.caption).foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 12)
            .padding(.top, 8)

            HStack(alignment: .top, spacing: 10) {
                // ── Colonne gauche : Permanentes (dynamiques) ──
                VStack(spacing: 8) {
                    HStack {
                        Text("PERMANENTES (48)")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 8).padding(.vertical, 3)
                            .background(EnergyType.permanent.color)
                            .cornerRadius(5)
                        Spacer()
                    }

                    ForEach(permanentSelections.indices, id: \.self) { idx in
                        EnergyPickerSlot(
                            slotIndex: idx,
                            selection: Binding(
                                get: { permanentSelections[safe: idx] },
                                set: { newVal in
                                    if let v = newVal { permanentSelections[idx] = v }
                                    else { permanentSelections.remove(at: idx) }
                                }
                            ),
                            energies: ParasiteEnergyData.permanentes,
                            type: .permanent
                        )
                    }

                    addEnergyButton(type: .permanent) {
                        newPermanentPick = nil
                        addPermanentSheet = true
                    }
                }
                .frame(maxWidth: .infinity)

                // ── Colonne droite : Temporaires (dynamiques) ──
                VStack(spacing: 8) {
                    HStack {
                        Text("TEMPORAIRES (19)")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 8).padding(.vertical, 3)
                            .background(EnergyType.temporary.color)
                            .cornerRadius(5)
                        Spacer()
                    }

                    ForEach(temporarySelections.indices, id: \.self) { idx in
                        EnergyPickerSlot(
                            slotIndex: idx,
                            selection: Binding(
                                get: { temporarySelections[safe: idx] },
                                set: { newVal in
                                    if let v = newVal { temporarySelections[idx] = v }
                                    else { temporarySelections.remove(at: idx) }
                                }
                            ),
                            energies: ParasiteEnergyData.temporaires,
                            type: .temporary
                        )
                    }

                    addEnergyButton(type: .temporary) {
                        newTemporaryPick = nil
                        addTemporarySheet = true
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 12)
        }
        .sheet(isPresented: $addPermanentSheet, onDismiss: {
            if let v = newPermanentPick { permanentSelections.append(v) }
            newPermanentPick = nil
        }) {
            EnergyPickerSheet(
                selection: $newPermanentPick,
                energies: ParasiteEnergyData.permanentes,
                type: .permanent,
                tracker: tracker
            )
        }
        .sheet(isPresented: $addTemporarySheet, onDismiss: {
            if let v = newTemporaryPick { temporarySelections.append(v) }
            newTemporaryPick = nil
        }) {
            EnergyPickerSheet(
                selection: $newTemporaryPick,
                energies: ParasiteEnergyData.temporaires,
                type: .temporary,
                tracker: tracker
            )
        }
    }

    private func addEnergyButton(type: EnergyType, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 14))
                Text("Ajouter une énergie")
                    .font(.caption.bold())
                Spacer()
            }
            .foregroundColor(type.color)
            .padding(.horizontal, 8).padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(type.color.opacity(0.10))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

// MARK: - Slot picker individuel

struct EnergyPickerSlot: View {
    let slotIndex: Int
    @Binding var selection: Int?
    let energies: [ParasiteEnergy]
    let type: EnergyType
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var tracker: SessionTracker

    private var selectedEnergy: ParasiteEnergy? {
        guard let idx = selection else { return nil }
        return energies.first { $0.numero == idx }
    }

    private var bgColor: Color {
        Color(UIColor.secondarySystemBackground)
    }

    @State private var showPicker = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // ── Bouton ouvrant le sélecteur scrollable ──
            Button {
                showPicker = true
            } label: {
                HStack(spacing: 6) {
                    Text("\(selectedEnergy?.numero ?? (slotIndex + 1))")
                        .font(.caption.bold().monospaced())
                        .foregroundColor(type.color)
                        .frame(width: 24)
                    if let energy = selectedEnergy {
                        Text(energy.description)
                            .font(.caption.bold())
                            .foregroundColor(.primary)
                            .lineLimit(1)
                    } else {
                        Text("Sélectionner…")
                            .font(.caption.bold())
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 11))
                        .foregroundColor(type.color.opacity(0.6))
                }
                .padding(.horizontal, 8).padding(.vertical, 8)
                .background(bgColor)
                .cornerRadius(8)
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $showPicker) {
                EnergyPickerSheet(
                    selection: $selection,
                    energies: energies,
                    type: type,
                    tracker: tracker
                )
            }

            // ── Détails si sélectionné ──
            if let energy = selectedEnergy {
                VStack(alignment: .leading, spacing: 4) {
                    // Nom en couleur (violet/vert)
                    Text(energy.nom)
                        .font(.caption.bold())
                        .foregroundColor(type.color)

                    // Dimensions à vérifier
                    HStack(spacing: 4) {
                        Text(type == .temporary ? "D2" : energy.niveau)
                            .font(.caption.bold())
                            .foregroundColor(type.color)
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(type.color.opacity(0.15))
                            .cornerRadius(5)
                        Text("à vérifier")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    // Recommandation
                    Text(energy.liberation)
                        .font(.caption)
                        .foregroundColor(.primary.opacity(0.75))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 8).padding(.vertical, 6)
                .background(type.color.opacity(0.05))
                .overlay(
                    Rectangle()
                        .fill(type.color)
                        .frame(width: 2),
                    alignment: .leading
                )
                .cornerRadius(6)
                .padding(.top, 2)
            }
        }
    }
}

// MARK: - Sheet scrollable avec scroll-to-selection

struct EnergyPickerSheet: View {
    @Binding var selection: Int?
    let energies: [ParasiteEnergy]
    let type: EnergyType
    let tracker: SessionTracker
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                List {
                    Button {
                        selection = nil
                        dismiss()
                    } label: {
                        Text("— Aucune —")
                            .foregroundColor(.secondary)
                    }

                    ForEach(energies) { energy in
                        Button {
                            selection = energy.numero
                            tracker.logProvocation(energy)
                            dismiss()
                        } label: {
                            HStack(spacing: 8) {
                                Text("\(energy.numero)")
                                    .font(.caption.bold().monospaced())
                                    .foregroundColor(type.color)
                                    .frame(width: 28, alignment: .trailing)
                                Text(energy.description)
                                    .foregroundColor(.primary)
                                Spacer()
                                if selection == energy.numero {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(type.color)
                                }
                            }
                        }
                        .id(energy.numero)
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    if let sel = selection {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation { proxy.scrollTo(sel, anchor: .center) }
                        }
                    }
                }
            }
            .navigationTitle(type == .permanent ? "Permanentes" : "Temporaires")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Fermer") { dismiss() }
                }
            }
        }
    }
}
