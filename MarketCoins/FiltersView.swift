//
//  FiltersView.swift
//  MarketCoins
//
//  Created by Mariemik on 01/09/23.
//

import UIKit

class FiltersView: UIView {

    public var filterOptions: [String] = ["BRL", "USD", "EUR"]
    
    lazy var filterToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.doneTapped))
        
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    lazy var filterPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .systemGray6
        pickerView.isUserInteractionEnabled = true
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
    
    @objc private func doneTapped() {
        
    }
    
    @objc private func cancelTapped() {
        
    }
}

extension FiltersView {
    
    private func setupView() {
        addSubviews(filterToolbar, filterPickerView)
        
        
        filterToolbar.translatesAutoresizingMaskIntoConstraints = false
        filterPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        filterToolbar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        filterToolbar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        filterToolbar.bottomAnchor.constraint(equalTo: filterPickerView.topAnchor).isActive = true
        
        filterPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        filterPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        filterPickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension FiltersView: UIPickerViewDelegate {
    
}

extension FiltersView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterOptions[row]
    }
}
