# 我的图书数据库作业

## 环境
- MySQL 版本：8.4.13 LTS
- 本地安装 / Docker：本地安装
- 数据库名称：bookshop

## 从空库复现
1. 使用客户端连接到本地MySQL服务
2. 打开sql/schema.sql并执行
3. 打开sql/seed.sql并执行
4.打开sql/queries.sql并执行

## 设计解释
- 主键为什么存在：主键用来负责身份，能够精确表示身份，避免在查找数据时出现重复
- 外键引用哪张表的哪一列：books表中的author_id列是外键，他引用了authors表的主键id列
- 价格为什么选择这个类型：DECIMAL类型能够在计算时防止产生精度丢失

## 六道题的预期结果
| 题号 | 预期结果 / 行数 | 验证方式 |
|---|---|---|
| Q1 |球闪和白夜行/两行 |运行 SELECT title, stock FROM books WHERE stock = 0;看结果|
| Q2 |白夜行 解忧 球闪/三行 | 运行SELECT title, stock FROM books WHERE stock = 0;看结果 |
| Q3 |7行 |运行WHERE price BETWEEN 20 AND 40看结果 |
| Q4 |8行 |运行指定join指令，看结果 |
| Q5 |三体库存从12变为11 |运行指定代码，看结果 |
| Q6 |先查出一行，再查出0行 |运行指定代码，看结果 |

## 排错或边界验证
- 现象：在首次导入SQL脚本时，DBeaver报错SQL错误[1064]，导致建表
- 原因：我唐了没找到原脚本文件
- 处理与复验：在文件夹中找到.sql文件后成功导入

## AI 辅助使用说明
- 未使用 / 使用工具与范围：在下载DBeaver时向ai询问了其的配置与安装安装事项。
- 我自己审阅、修改和验证了哪些内容：全部的代码内容
