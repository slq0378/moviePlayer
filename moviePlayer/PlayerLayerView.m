//
//  PlayerLayer.m
//  moviePlayer
//
//  Created by Christian on 16/6/16.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "PlayerLayerView.h"


@interface PlayerLayerView()
@end

@implementation PlayerLayerView
/**
 *  创建一个layerClass ,返回CALayerPlayer 类作为支持层
 *
 *  @return [CALayerPlayer class]
 */
+ (Class )layerClass {
    return [AVPlayerLayer class];
}

/**
 *  初始化方法
 *
 *  @param player player
 *
 *  @return
 */
- (id)initWithPlayer:(AVPlayer *)player
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        [(AVPlayerLayer *)[self layer] setPlayer:player]; // 将AVPlayer的视频输出指向AVPlayerLayer以播放
        // 设置视频缩放样式
        ((AVPlayerLayer *)[self layer]).videoGravity = AVLayerVideoGravityResizeAspect;
        
    }
    return self;
}

@end
