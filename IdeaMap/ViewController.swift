//
//  ViewController.swift
//  IdeaMap
//
//  Created by Aoi Saito on 2019/02/08.
//  Copyright © 2019年 Aoi Saito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = table.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //セルの縦横の長さ
        table.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        table.collectionViewLayout = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   @IBOutlet var table: UICollectionView!
    
    //数指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 9
    }

    class IdeaMapViewController: UIViewController{
        
        @IBOutlet var titleTextField: UITextField!
        @IBOutlet var contentTextView: UITextView!
        
        var saveDate: UserDefaults = UserDefaults.standard
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            titleTextField.text = saveDate.set(titleTextField.text, forkey: "title") as? String
            contentTextView.text = saveDate.set(contentTextView.text, forkey: "content")as? String
            
            
            //Do any additional setup after loading the view.
            
            @IBOutlet func saveMemo() {
                //UserDefaultsに書き込み
                saveDate.set(titleTextField.text, forkey: "tite")
                saveDate.set(contentTextView.text, forkey: "content")
                
            }
        }
        @IBOutlet func saveMemo() {
            
            //UserDefaultに書き込み
            saveDate.set(titleTextField.text, forkey: "title")
            saveDate.set(contentTextView.text, forkey: "content")
            
            //alertをだす
            let alert: UIAlertController = UIAlertController(title: "保存", message: "内容の保存が完了しました", preferredStyle: .alert)
            
            //OKボタン
            alert.addAction(
                UIAlertAction(title: "OK",
                              style: .default,
                    handler: { action in
                        //ボタンが押された時の動作
                        print("OKボタンが押されました")
                }
                )
            )
            present(alert, animated: true, completion: nil)
            
            //ボタンが押された時の動作
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
}

