# CircularProgressBar
```swift
// Пример
class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: ProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            progressBar.setProgress(to: 67, with: 0.05)
    }
}

```
```swift
progressBar.progress = 0.23 // Диапазон - 0.0...1.0 

```
![Fotoram io](https://user-images.githubusercontent.com/78022759/122054303-392c9400-cdf0-11eb-9c9c-1bc510274763.png)
