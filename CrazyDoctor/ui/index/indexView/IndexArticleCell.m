//
//  IndexArticleCell.m
//  CrazyDoctor
//
//  Created by xubojoy on 16/4/12.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "IndexArticleCell.h"

@implementation IndexArticleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.articleLogoImageView.layer.cornerRadius = 5;
    self.articleLogoImageView.layer.borderWidth = splite_line_height;
    self.articleLogoImageView.layer.borderColor = [ColorUtils colorWithHexString:splite_line_color].CGColor;
    self.articleLogoImageView.layer.masksToBounds = YES;
    
    self.redDotImgView.hidden = YES;
    self.articleTitleLabel.textColor = [ColorUtils colorWithHexString:black_text_color];
    self.shortIntroLabel.textColor = [ColorUtils colorWithHexString:gray_text_color];
    self.dateLabel.textColor = [ColorUtils colorWithHexString:light_gray_text_color];
    
    self.downLine.backgroundColor = [ColorUtils colorWithHexString:splite_line_color];
}

- (void)renderIndexArticleCellWithAcupoint:(Acupoint *)acupoint{
    [self.articleLogoImageView sd_setImageWithURL:[NSURL URLWithString:acupoint.imageUrl] placeholderImage:[UIImage imageNamed:@"icon_default_homepage_picture"]];
//    if ([NSStringUtils isNotBlank:acupoint.name]) {
       self.articleTitleLabel.text = acupoint.title;
//    }
    if ([NSStringUtils isNotBlank:acupoint.remark]) {
        self.shortIntroLabel.text = acupoint.remark;
    }
    if ([NSStringUtils isNotBlank:[AppStatus sharedInstance].recommendAcupointTime]) {
        self.dateLabel.text = [AppStatus sharedInstance].recommendAcupointTime;
    }else{
        self.dateLabel.text = [DateUtils dateWithStringFromLongLongInt:acupoint.createTime];
    }
}

- (void)renderIndexArticleCellWithRecommendArticle:(RecommendArticle *)recommendArticle{
    [self.articleLogoImageView sd_setImageWithURL:[NSURL URLWithString:recommendArticle.article.logoUrl] placeholderImage:[UIImage imageNamed:@"icon_default_homepage_picture"]];
    if ([NSStringUtils isNotBlank:recommendArticle.article.title]) {
        self.articleTitleLabel.text = recommendArticle.article.title;
    }
    if ([NSStringUtils isNotBlank:recommendArticle.article.intro]) {
        self.shortIntroLabel.text = recommendArticle.article.intro;
    }
    
    self.dateLabel.text = [DateUtils dateWithStringFromLongLongInt:recommendArticle.createTime];
}

- (void)renderIndexArticleCellWithUserFavArticle:(UserFavArticle *)userFavArticle{
    [self.articleLogoImageView sd_setImageWithURL:[NSURL URLWithString:userFavArticle.logoUrl] placeholderImage:[UIImage imageNamed:@"icon_default_homepage_picture"]];
    if ([NSStringUtils isNotBlank:userFavArticle.articleTitle]) {
        self.articleTitleLabel.text = userFavArticle.articleTitle;
    }
    if ([NSStringUtils isNotBlank:userFavArticle.intro]) {
        self.shortIntroLabel.text = userFavArticle.intro;
    }
    
    self.dateLabel.text = [DateUtils dateWithStringFromLongLongInt:userFavArticle.createTime];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end