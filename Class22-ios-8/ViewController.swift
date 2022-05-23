import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    
    let images: [String] = [
        "https://firebasestorage.googleapis.com/v0/b/class-wedding.appspot.com/o/Shakespeare.jpeg?alt=media&token=ba6d2a6e-b3ac-4534-bd05-53fae668a02d",
        "https://firebasestorage.googleapis.com/v0/b/class-wedding.appspot.com/o/img_girl.jpg?alt=media&token=fb11557d-994a-4cbb-8bc0-b814b0a95b92",
        "https://firebasestorage.googleapis.com/v0/b/class-wedding.appspot.com/o/img_girl2.jpg?alt=media&token=ec7b8e23-b60f-4dac-bb72-a28f5220a071",
        "https://upload.wikimedia.org/wikipedia/commons/f/f7/Crouching_Panda.jpg"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

//        image.layer.cornerRadius = 50.0
//        image.layer.masksToBounds = true

        let url = URL(string: images[2])
        image.kf.setImage(with: url)
        
        image2.kf.setImage(with: url)
        
        let processor = DownsamplingImageProcessor(size: image2.bounds.size)
                |> RoundCornerImageProcessor(cornerRadius: 140)
        
        KF.url(url)
          .setProcessor(processor)
          .loadDiskFileSynchronously()
          .fade(duration: 0.25)
          .set(to: image2)

    }


}


@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue

              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
    
}
