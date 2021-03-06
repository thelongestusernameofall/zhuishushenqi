//
//  RankingViewCell.swift
//  zhuishushenqi
//
//  Created by Nory Cao on 2017/3/5.
//  Copyright © 2017年 QS. All rights reserved.
//

import UIKit

typealias AccessoryImageViewClosure = ()->Void

class RankingViewCell: UITableViewCell {
    
    var accessoryClosure:AccessoryImageViewClosure?
    var model:QSRankModel? {
        didSet{
            self.textLabel?.text = "\(model?.title ?? "")"
            if let image = model?.image ,model?.image != "" {
                self.imageView?.image = UIImage(named: image)
                self.accessoryImageView.isHidden = false
                return
            }
            let imageUrlString =  "\(IMAGE_BASEURL)\(model?.cover ?? "")"
            self.imageView?.qs_setBookCoverWithURLString(urlString: imageUrlString)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.accessoryImageView)
        self.accessoryImageView.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.imageView?.image =  nil;
        self.textLabel?.text = nil;
        self.accessoryImageView.isHidden = true
    }
    
    public lazy var accessoryImageView:UIButton = {
       let imageView = UIButton()
        imageView.frame = CGRect(x: self.bounds.width - 29, y: self.bounds.height/2 - 3.5, width: 14, height: 7)
        imageView.setImage(UIImage(named: "ranking_arrow_down"), for: .normal)
        imageView.setImage(UIImage(named: "IQButtonBarArrowUp"), for: .selected)
        imageView.isSelected = false
        imageView.addTarget(self, action: #selector(accessoryTouch(sender:)), for: .touchUpInside)
        return imageView
    }()

    @objc func accessoryTouch(sender:Any){
        self.accessoryImageView.isSelected = !self.accessoryImageView.isSelected
        if let closure = accessoryClosure {
            closure()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageViewHeight = self.bounds.height - 20
        let imageViewWidth = self.bounds.height - 20
        self.imageView?.frame = CGRect(x: 15, y: 10, width: imageViewWidth, height: imageViewHeight)
        let textLabelX = (self.imageView?.bounds.maxX ?? 0) + 20
        let textLabelWidth = self.bounds.width - (self.imageView?.bounds.maxX ?? 0) - 50
        let textLabelHeight = self.bounds.height - 10
        self.textLabel?.frame = CGRect(x: textLabelX , y: 5, width: textLabelWidth, height: textLabelHeight)
        self.textLabel?.font = UIFont.systemFont(ofSize: 13)
        let accessoryX = self.bounds.width - 29
        let accessoryY = self.bounds.height/2 - 3.5
        self.accessoryImageView.frame = CGRect(x: accessoryX, y: accessoryY, width: 14, height: 7)
    }
}
