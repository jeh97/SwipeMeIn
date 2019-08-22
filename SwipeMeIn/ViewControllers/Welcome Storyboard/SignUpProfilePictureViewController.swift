//
//  SignUpProfilePictureViewController.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 8/19/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class SignUpProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    let imagePicker = UIImagePickerController()

    // MARK: - Outlets
    @IBOutlet var profilePictureButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up image picker
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false

        // Set up profile picture button
        profilePictureButton.contentMode = .scaleAspectFill
        profilePictureButton.imageView?.contentMode = .scaleAspectFill
        profilePictureButton.setImage(DEFAULT_NOT_LOADED, for: .normal)
        // Make image circular
        let height = profilePictureButton.frame.height
        profilePictureButton.layer.cornerRadius = height / 2.0
        profilePictureButton.clipsToBounds = true

        // Requires user to pick profile picture before signing up
        checkIfSignUpReady()
    }

    // MARK: - Actions
    @IBAction func profilePictureButtonTouchUp(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let selectPhoto = UIAlertAction(title: "Select Photo from Library", style: .default) { (action) in
            // TODO: Select photo
            self.selectFromLibrary()
        }

        let takePhoto = UIAlertAction(title: "Take Photo with Camera", style: .default) { (action) in
            // TODO: Take Photo
            self.takeWithCamera()
        }

        let removePhoto = UIAlertAction(title: "Remove Photo", style: .destructive) { (action) in
            // TODO: Remove photo
            self.profilePictureButton.setImage(DEFAULT_NOT_LOADED, for: .normal)
            self.checkIfSignUpReady()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // TODO: Cancel
            self.checkIfSignUpReady()
        }

        actionSheet.addAction(selectPhoto)
        actionSheet.addAction(takePhoto)
        actionSheet.addAction(removePhoto)
        actionSheet.addAction(cancelAction)

        self.present(actionSheet, animated: true, completion: nil)

    }
    @IBAction func signUpTouchUp(_ sender: Any) {
        // TODO: - Create user
    }
    @IBAction func cancelButtonTouchUp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Methods
    private func selectFromLibrary() {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }

    private func takeWithCamera() {
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }

    private func checkIfSignUpReady() {
        guard let profilePicture = profilePictureButton.image(for: .normal) else { return }
        if profilePicture.isEqual(DEFAULT_NOT_LOADED)  {
            // If no profile picture has been selected, disable sign up
            signUpButton.isEnabled = false
            let disabledColor = UIColor.lightGray
            signUpButton.setTitleColor(disabledColor, for: .normal)

        } else {
            // If profile picture has been selected, enable sign up
            signUpButton.isEnabled = true
            let enabledColor = self.view.backgroundColor
            signUpButton.setTitleColor(enabledColor, for: .normal)
        }
    }

    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let newSize = CGSize(width: 1000, height: 1000)
            if let resizedImage = resizeImage(image: pickedImage, targetSize: newSize) {
                profilePictureButton.setImage(resizedImage, for: .normal)
                self.checkIfSignUpReady()
            } else {
                // TODO: Handle error
                print("Failed to resize image")
            }
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio < heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: targetSize.height)
        } else {
            newSize = CGSize(width: targetSize.width,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }

}
