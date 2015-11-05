## 概述

api开发时将按照公司规范定义接口，即除了code、message、data三个字段名需要统一，其他的可以根据情况自定义。
每个请求需要携带参数method=xxx。

## 约驾相关接口

### 获取身份列表[fake]
 * GET: /api/yuejia/identity?method=list
 * 参数：无
 * 返回值
 <pre>
{
  "code": "0",
  "message": "success",
  "data": {
    "carIdentitys" : [
      {"id":"1", "name":"我是土豪", description":"选车价格在50万以上"},
      ...
      ]
  }
}
 </pre>
 
### 获取车辆的用途列表[fake]
 * GET: /api/yuejia/purpose?method=list
 * 参数：无
 * 返回值
  <pre>
{
  "code":"0",
  "message":"success",
  "data":{
    "purpose":[
      {"id":"1", "name":"个人海", "description":"保留字段"}
      ]
  }
}
  </pre>

### 获取星座列表
 * GET: /api/yuejia/constelllation?method=list
 * 入参：无
 * 返回值：
 <pre>
 {
  "code":"0",
  "message":"success",
  "data":{
    "purpose":[
      {"id":"1", "name":"处女座",  "description":"保留字段"}
      ]
  }
 }
 </pre>
 
### 提交约驾者的个人信息
 * POST: /api/yuejia/profile?method=post
 * 入参: 
 
| 参数名 | Required | 默认值 | 备注 |
| ----- | ----- | ----- | ----- |
| uid | y |  | 用户id |
| iid | y |  | 身份id |
| pid | y |  | 用途id |
| cid | y |  | 星座id |

 * 返回值：
 <pre>
 {
  "code":"0",
  "message":"success"
 }
 
 </pre>
 
### 获取用户的约驾个人信息
 * GET: /api/yuejia/profile?method=get
 * 入参：
   
| 参数名 | Required | 默认值 | 备注 |
| ----- | ----- | ----- | ----- |
| uid | y |  | 用户id |

 * 返回值：
 <pre>
  {
  "code":"0",
  "message":"success",
  "data":{
    "carId":"1",
    "carUrl":"http://baoma.jpg",
    "carName":"宝马x5",
    "reason":"温和的你，宝马x5 你值得拥有"
  }
}
 </pre>
 
### 获取拥有车型的经销商的城市列表
 * GET: /api/yuejia/dealer?method=city
 * 入参：
     
| 参数名 | Required | 默认值 | 备注 |
| ----- | ----- | ----- | ----- |
| carId | y |  | 车型的id |

 * 返回值：
 <pre>
  {
  "code":"0",
  "message":"success",
  "data":{
    "cities":[
      "北京", "上海"
      ]
  }
}
 </pre>
 
### 获取指定城市拥有该车型的经销商列表
 * GET: /api/yuejia/dealer?method=list
 * 入参：

| 参数名 | Required | 默认值 | 备注 |
| ----- | ----- | ----- | ----- |
| city | y |  | 城市 |
| carId | y |  | 车型的id |
| limit | n | 20 | 一次分页的结果个数 |
| offset| n | 0 | 已取到的结果个数 |

 * 返回值：
 <pre>
 {
  "code":"0",
  "message":"success",
  "data":{
    "dealers":[
      {"name":"广丰澳林", "city":"北京", "phone":"13811000000", "address":"望京xxx"}
      ]
  }
}
 </pre>
