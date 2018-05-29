#  计时器

## 倒计时器

### 1.创建计时器变量，并且在Xib或者故事板中拖一个UIButton
```
{
NSTimer * timerRepeat;
int secCount;
}
```
### 2.按钮事件
```
(IBAction)button:(id)sender {
if (timerRepeat == nil) {

timerRepeat = [NSTimer scheduledTimerWithTimeInterval: 1.0f
target: self
selector: @selector(repeatRefresh:)
userInfo: nil
repeats: YES];

secCount = 59;
}
[_codeBtn setTitle:@"(60)秒后重发" forState:UIControlStateNormal];
[_codeBtn setEnabled:NO];
}
```
### 3.计时器方法
```
- (void) repeatRefresh:(NSTimer *)timer{
if(secCount==1){
[_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
[_codeBtn setEnabled:YES];
[timerRepeat invalidate];
timerRepeat = nil;
return;
}
NSString *curstr = [NSString stringWithFormat:@"(%ld)秒后重发", (long)secCount];

[_codeBtn setTitle:curstr forState:UIControlStateNormal];
secCount--;
}

```
#### 注意事项 --- UIButton 闪烁时，将UIButton的类型由system改为custom就好了
