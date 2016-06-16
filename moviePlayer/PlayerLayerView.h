//
//  PlayerLayer.h
//  moviePlayer
//
//  Created by Christian on 16/6/16.
//  Copyright © 2016年 slq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerLayerView : UIView
/**
 *  初始化方法
 *
 *  @param player player
 *
 *  @return self
 */
- (id)initWithPlayer:(AVPlayer *)player;

@end
