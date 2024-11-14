#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#import "style.typ": (
  字号,
  字体,
  颜色,
  ind,
  tips,
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
    rows: (2.5cm, 1.5cm, 1.5cm, 2.5cm, 1.5cm),
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


  #par(spacing: 1.5em, first-line-indent: 0pt)[
    #text(size: 字号.四号, weight: "bold")[
      参考文献
    ]
  ]

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


  #set par(first-line-indent: 0pt)

  #let h1_c = counter("h1")
  #let h2_c = counter("h2")

  #let h1 = {
    h1_c.step()
    context h1_c.display("一、")
    h(1em)
    h2_c.update(0)
  }
  #let tab_h2 = {
    h2_c.step()
    h(3em)
    context h2_c.display("（一）")
  }

  #h1 引言

  #tab_h2 课题研究背景及意义

  #tab_h2 国内外研究现状

  #tab_h2 主要研究内容

  #tab_h2 论文组织结构

  #h1 内容一

  #tab_h2 二级标题2.1

  #tab_h2 二级标题2.2

  #h1 内容二

  #tab_h2 二级标题3.1

  #tab_h2 二级标题3.2

  #h1 总结与展望

  #tab_h2 总结及结果价值分析

  #tab_h2 未来方向展望
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
  inline-title[5. 进度安排],
  进度安排,
)

#pagebreak()

#align(center)[
  #text(font: 字体.黑体, size: 字号.二号)[
    毕 业 论 文（设计）开 题 报 告
    #v(-0.5em)
  ]
]


#let 指导教师意见 = inline-doc[

  （对本课题的深度、广度及工作量的意见）

  #tips[
    示例：本课题旨在通过研究基于已有的医学影像诊断报告数据集，设计实现一种智能化诊断报告书写工具，实现报告书写过程中的智能化提示和纠错。论文选题较为前沿，反映人工智能技术应用发展趋势及本专业研究重点，具有一定的创新性，选题有一定的深度和广度，工作量适中，能够满足毕业设计要求，同意开题。
  ]

  #align(bottom)[
    #align(center)[
      #text(size: 字号.四号)[
        指导教师：（签字）
      ]
    ]
    #align(right)[
      #h(2.5em)年#h(1.5em)月#h(1.5em)日
    ]
  ]
]


#let 教研室审查意见 = inline-doc[


  #align(bottom)[
    #align(center)[
      #text(size: 字号.四号)[
        教研室负责人：（签字）
      ]
    ]
    #align(right)[
      #h(2.5em)年#h(1.5em)月#h(1.5em)日
    ]
  ]
]

#table(
  columns: (100%),
  rows: (auto, 10cm, auto, 10cm),
  inline-title[
    指导教师意见：
  ],
  指导教师意见,
  inline-title[教研室审查意见：],
  教研室审查意见,
)
