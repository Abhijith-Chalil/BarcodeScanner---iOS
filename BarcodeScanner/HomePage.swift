//
//  HomePage.swift
//  BarcodeScanner
//
//  Created by Abhijith Chalil on 11/12/24.
//

import SwiftUI

struct HomePage: View {
    
    @State private var scannedBarcode = ""
    
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                ScannerView(scannedBarcode: $scannedBarcode).frame(maxWidth: .infinity,maxHeight: 300)
                Spacer().frame(height: 20)
                Label("Scanned Barcode",systemImage: "barcode.viewfinder").font(.title)
                Spacer().frame(height: 20)
                Text(scannedBarcode.isEmpty ? "Not Yet Scanned" : scannedBarcode).bold().font(.largeTitle).foregroundColor(scannedBarcode.isEmpty ?.red : .green)
                Spacer()
            }.navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    HomePage()
}
