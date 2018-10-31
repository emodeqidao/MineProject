//
//  MineViewController.m
//  MSeek
//
//  Created by xixi on 2018/10/29.
//  Copyright © 2018年 STBL. All rights reserved.
//

#import "MineViewController.h"
#import "MineCell.h"
#import "MineHeaderView.h"
#import "XBaseModel.h"



@interface MineViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MineHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *dataSources;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setData];
    [self customNav];
    [self initView];
}

-(void) customNav
{
  
}

-(void) initView
{
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.tableHeaderView = self.headerView;
        
        UIView *fv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        fv.backgroundColor = [UIColor grayColor];
        _tableView.tableFooterView = fv;
        
        if (@available(iOS 11.0, *))
        {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

-(MineHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 250.f)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

#pragma mark
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSources.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [self.dataSources objectAtIndex:section];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:[MineCell cellIdentifier]];
    if (!cell)
    {
        cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MineCell cellIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSArray *sectionArray = [self.dataSources objectAtIndex:indexPath.section];
    XBaseModel *model = [sectionArray objectAtIndex:indexPath.row];
    BGViewType type = 0;
    if (sectionArray.count == 1)
    {
        type = AllCorner;
    }
    else if (sectionArray.count > 1)
    {
        if (indexPath.row == 0)
        {
            type = TopCorner;
        }
        else if (indexPath.row == (sectionArray.count - 1))
        {
            type = BottomCorner;
        }
        else
        {
            type = NullCorner;
        }
    }

    
    [cell setData:model indexpath:type];
//    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MineCell_Height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBaseModel *model = [[self.dataSources objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSString *keyStr = model.key;
    
    NSLog(@"点击了 %@", keyStr);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerSectionID = @"x_list_cell_header_id";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerSectionID];
    if (headerView == nil)
    {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerSectionID];
//        headerView.backgroundView = [[UIImageView alloc] initWithImage:[SingleCenterObj createImageWithColor:SetColor(ASC_grayColor_F6F6F6)]];
    }
    
    
    return headerView;
}

#pragma mark
#pragma mark ========== 初始化 ==========
// 设置基本数据
- (void)setData
{
    XBaseModel * walletModel = [[XBaseModel alloc] init];
    walletModel.leftTitleStr = @"积分钱包";
    walletModel.leftIconStr = @"MS_Mine_point";
    walletModel.key = @"point";

    XBaseModel * collectModel = [[XBaseModel alloc] init];
    collectModel.leftTitleStr = @"收藏";
    collectModel.leftIconStr = @"MS_Mine_Collect";
    collectModel.key = @"collect";
    
    XBaseModel * signInModel = [[XBaseModel alloc] init];
    signInModel.leftTitleStr = @"签到";
    signInModel.leftIconStr = @"MS_Mine_SignIn";
    signInModel.key = @"sign";
    
    //    MSMineItemModel * missionModel = [[MSMineItemModel alloc] initWithTitle:@"任务") Icon:@"MS_Mine_Mission"];
    //    missionModel.key = @"mission";
    
    XBaseModel * idModel = [[XBaseModel alloc] init];
    idModel.leftTitleStr = @"认证";
    idModel.leftIconStr = @"MS_Mine_Id";
    idModel.key = @"id";
    
    XBaseModel * draftboxModel = [[XBaseModel alloc] init];
    draftboxModel.leftTitleStr = @"草稿箱";
    draftboxModel.leftIconStr = @"MS_Mine_DraftBox";
    draftboxModel.key = @"draft";
    
    XBaseModel * settingModel = [[XBaseModel alloc] init];
    settingModel.leftTitleStr = @"设置";
    settingModel.leftIconStr = @"MS_Mine_Setting";
    settingModel.key = @"setting";
    
    XBaseModel * sysMsgModel = [[XBaseModel alloc] init];
    sysMsgModel.leftTitleStr = @"系统消息";
    sysMsgModel.leftIconStr = @"MS_Mine_Setting";
    sysMsgModel.key = @"sysMsgModel";
    
    NSArray * sectionArray0 = @[walletModel];
    NSArray * sectionArray1 = @[collectModel, signInModel];
    NSArray * sectionArray2 = @[idModel, draftboxModel, settingModel, sysMsgModel];
    
    [self.dataSources addObject:sectionArray0];
    [self.dataSources addObject:sectionArray1];
    [self.dataSources addObject:sectionArray2];
}
- (NSMutableArray *)dataSources
{
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
