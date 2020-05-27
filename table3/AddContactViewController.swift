//
//  AddContactViewController.swift
//  table3
//
//  Created by Ngoduc on 5/27/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
import Photos
class AddContactViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var saveBT: UIButton!
    var passData: ((Person1) -> ())?
       // để gọi được UIImagePickerController cần import thư viện Photos
       var imagePicker: UIImagePickerController!
       // ManagerImagePicker là class tự viết, không phải của hệ thống
       var manager: ManagerImagePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBT.layer.cornerRadius = 10
      
       title = "Tạo person"
       let saveButton = UIBarButtonItem(title: "List Contact", style: .done, target: self, action: #selector(list))
       navigationItem.leftBarButtonItem = saveButton
       
       // khởi tạo imagePicker
       imagePicker = UIImagePickerController()
       //gán delegate cho ImagePicker
       imagePicker.delegate = self
       // khởi tạo class quản lý việc truy cập vào thiết bị của ImagePicker
       manager = ManagerImagePicker(imagePicker, self)
    }
    // thực hiện lưu dữ liệu
    @objc func list(){
        
        navigationController?.popViewController(animated: true)
    }

    @IBAction func saveContact(_ sender: Any) {
        // lấy dữ liệu từ textField
        guard let name = nameTextField.text, let phone = phoneTextField.text else {
            return
        }
        
        // lấy dữ liệu từ việc chọn ảnh
        guard let avatar = photoImageView.image else { return }
        let person = Person1(name: name, phone: phone, avatarImage: avatar)
        
        // truyền dữ liệu
        passData?(person)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func selectImage(_ sender: Any) {
        let alert = UIAlertController(title: "App", message: "Chọn ảnh từ", preferredStyle: .alert)
                   let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
                   let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
                       self.manager.fromCamera()
                   })
                   let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
                       self.manager.fromLibrary()
                   })
                   
                   alert.addAction(camera)
                   alert.addAction(libray)
                   alert.addAction(cancel)
                   present(alert, animated: true, completion: nil)
               }
    }
    
  
    

extension AddContactViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // hàm này để chọn ảnh, sau khi chọn thì sử dụng dismiss để tắt thư viện hoặc camera
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
