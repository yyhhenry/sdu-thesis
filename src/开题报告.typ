#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#import "style.typ": (
  字号,
  字体,
  颜色,
  ind,
  fakepar,
  indent-rules,
  ref-rules,
  heading-rules,
  foreword-rules,
  main-body-rules,
  following-rules,
)
#import "bilingual-bibliography.typ": bilingual-bibliography

#set page(paper: "a4", margin: (x: 3.18cm, y: 2.54cm))
#set text(
  font: 字体.宋体,
  size: 字号.小四,
  lang: "zh",
  region: "cn",
)
#set par(spacing: 1em, leading: 1em)

#show: indent-rules
#show: ref-rules

// 开题报告-封面
#align(center)[
  #text(font: "STXinwei", size: 28pt)[
    山东大学（威海）

    毕业论文（设计）开题报告
  ]
]

#text(size: 字号.小初)[
  #linebreak()
]

#let field_name(..parts) = text(size: 字号.三号, weight: "bold")[
  #parts.at(0)：
]

#let field_value(body) = text(size: 字号.三号, weight: "bold")[
  #body
]

#align(center)[
  #table(
    stroke: (x, y) => (
      bottom: if x == 0 {
        none
      } else {
        0.5pt
      },
    ),
    align: (right + bottom, center + bottom),
    columns: (auto, 7cm),
    inset: 1em,
    rows: 1.5cm,
    field_name[论文题目], field_value[请输入论文题目请输入论文题目],
    field_name[姓#{ind}名], field_value[请输入姓名],
    field_name[学#{ind}号], field_value[请输入学号],
    field_name[专#{ind}业], field_value[请输入专业],
    field_name[指导教师], field_value[请输入指导教师],
  )
]

#text(size: 字号.五号)[
  #for _ in range(6) [
    #linebreak()
  ]
]

#align(center)[
  #text(size: 字号.小四)[
    20XX年XX月XX日
  ]
]

#pagebreak()

#align(center)[
  #text(size: 字号.小二)[
    开题报告填写要求
  ]
  #text(size: 字号.五号)[
    #linebreak()
  ]
]

1．#link("http://biyelunwen.yjbys.com/kaitibaogao/")[开题报告]作为毕业论文（设计）答辩委员会对学生答辩资格审查的依据材料之一。此报告应在指导教师指导下，由学生在毕业论文（设计）工作前期内完成，经指导教师签署意见及教研室审查后生效；

2．开题报告内容必须用黑碳素笔工整书写或按教务处统一设计的电子文档标准格式（可从教务处网址上下载）打印，禁止打印在其它纸上后剪贴，完成后应及时交给指导教师签署意见；

3．学生查阅资料的#link("http://biyelunwen.yjbys.com/cankaowenxian/")[参考文献]应不少于3篇（不包括辞典、手册）；

4．有关年月日等日期的填写，应当按照国标GB/T 7408—94《数据元和交换格式、信息交换、日期和时间表示法》规定的要求，一律用阿拉伯数字书写。如“2014年4月26日”或“2014-04-26”。

#pagebreak()

#align(center)[
  #text(font: 字体.黑体, size: 字号.二号)[
    毕 业 论 文（设计）开 题 报 告
    #v(-0.5em)
  ]
]

#let inline-title(body) = table.cell(inset: (y: 0.8em))[
  #text(size: 字号.四号, weight: "bold")[
    #body
  ]
]
#let inline-doc(body) = table.cell(inset: (y: 0.8em))[
  #fakepar

  #body
]

#let 研究意义 = inline-doc[

  你需要填写一些内容，以及引用文献 @vaswani2023attentionneed 。


  == 参考文献 #v(0.5em)

  #let std_bib = bibliography("../ref.bib", title: none, style: "gb-7714-2015-numeric")
  #bilingual-bibliography(bibliography: std_bib)
]

#let 基本内容 = inline-doc[

  你需要填写一些内容。

]

#let 重点和难点 = inline-doc[

  你需要填写一些内容。
]

#let 论文提纲 = inline-doc[

  你需要填写一些内容。

]

#let 进度安排 = inline-doc[

  你需要填写一些内容。

]

#table(
  columns: (100%),
  inline-title[1. 本课题的研究意义],
  研究意义,
  inline-title[2. 本课题的基本内容],
  基本内容,
  inline-title[3. 本课题的重点和难点],
  重点和难点,
  inline-title[4. 论文提纲],
  论文提纲,
  inline-title[4. 进度安排],
  进度安排,
)
