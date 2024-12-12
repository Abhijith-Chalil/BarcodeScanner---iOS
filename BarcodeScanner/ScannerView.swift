//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Abhijith Chalil on 12/12/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedBarcode: String
    
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedBarcode = barcode
            print(barcode)
        }
        
        func didSurface(error: CamaraError) {
            print(error.rawValue)
        }
        
        
    }
    //    typealias UIViewControllerType = ScannerVC
    
    
}

#Preview {
    ScannerView(scannedBarcode: .constant("123456789"))
}
