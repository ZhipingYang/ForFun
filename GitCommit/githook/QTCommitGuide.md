### Git Commit Guide

目的是为了使commit更直观的反应提交的内容，不建议一个提交内容过大给 code reviewer 带来太大的负担

- feat：新功能
> 不同类型的功能最好不要放在一个commit里
> 
> 实例：`feat: 1.首页时长统计 2.首页进入次数统计`

- fix：修补bug
> 指定修复bug编号 & bug简易描述
> 
> 实例：`fix: 收藏列表滑动卡顿; ios-132:数组越界`

- refactor: 重构
> 优化重构代码（非功能添加和bug修复）
> 
> 实例：`refactor: 改进路由定位策略`

- test: 测试
> 添加、修改测试
> 
> 实例：`test: 更改API环境`

- doc: 文档注释
> 方法变量注释
> 
> 实例：`doc: 添加首页列表DataSource注释`
