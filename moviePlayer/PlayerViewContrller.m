//
//  PlayerViewContrller.m
//  moviePlayer
//
//  Created by Christian on 16/6/11.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "PlayerViewContrller.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerLayerView.h"

#define StatusKeypath @"status"

static const NSString *AVPlayerItemStatusContext = @"AVPlayerItemStatusContext";

@interface PlayerViewContrller()

/**AVAsset*/
@property (nonatomic, strong) AVAsset *asset;
/**AVPlayerItem*/
@property (nonatomic, strong) AVPlayerItem *playerItem;
/**AVPlayer*/
@property (nonatomic, strong) AVPlayer *player;
/**AVPlayerLayer*/
@property (nonatomic, strong) PlayerLayerView *playerLayerView;

@end

@implementation PlayerViewContrller

- (id)initWithUrl:(NSURL *)assetUrl {
    if (self = [super init]) {
        _asset = [AVAsset assetWithURL:assetUrl];
        [self playVideo];
    }
    return self;
}

/**
 *  播放视频
 */
- (void)playVideo {
    NSArray *keys = @[@"tracks",
                      @"duration",
                      @"commonMetadata"];
    // 1 初始化AVPlayerItem
    self.playerItem = [AVPlayerItem playerItemWithAsset:_asset automaticallyLoadedAssetKeys:keys];
    // 监听一定要在创建AVPlayer之前
    [self.playerItem addObserver:self
                      forKeyPath:StatusKeypath
                         options:0
                         context:&AVPlayerItemStatusContext];
    // 2 初始化AVPlayer
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    // 3 初始化AVPlayerLayer
    self.playerLayerView = [[PlayerLayerView alloc] initWithPlayer:self.player];    
}

// 监听AVPlayerItem状态来决定是否播放视频
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == &AVPlayerItemStatusContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.playerItem removeObserver:self forKeyPath:StatusKeypath];
            if (self.playerItem.status == AVPlayerStatusReadyToPlay) {
               // 设置时间监听
                [self.player play];
                
            }else {
                NSLog(@"加载视频信息失败");
            }
           
        });
    }
}

// 重新定义View，把视频播放器指向它
- (UIView *)view {
    return self.playerLayerView;
}



- (void)dealloc {
    NSLog(@"%s",__func__);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
