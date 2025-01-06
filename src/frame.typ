#import "style.typ": 字号, 字体, ind

#let cover(
  题目: "请输入论文题目",
  姓名: "请输入",
  学号: "20XX00X00XXX",
  学院: "机电与信息工程学院",
  专业: "请输入专业请输入专业请输入专业",
  年级: "20XX级",
  指导教师: "请输入指导教师",
  日期: "20XX年5月XX日",
  成绩评定表: false,
  实践与综合设计: false,
) = [
  #set page(margin: (x: 3.18cm, y: 2.54cm))
  #set text(
    font: 字体.宋体,
    size: 字号.小三,
    lang: "zh",
    region: "cn",
  )
  #set par(spacing: 1.5em, leading: 1em, first-line-indent: 0em)

  // 封面抬头
  #align(center)[
    #if 实践与综合设计 [
      #image("../media/tmpl/cover-sdu-wh.png")
    ] else [
      #image("../media/tmpl/cover-sdu.jpg")
    ]
  ]

  #align(center)[
    #if 实践与综合设计 [
      #par(spacing: 1em)[
        #text(font: 字体.楷体, weight: "bold", size: 32pt)[
          实践与综合设计
        ]
      ]
    ] else [
      #scale(x: 68%, reflow: true)[
        #text(font: "FZDaHei-B02S", size: 62pt, spacing: 0.2em)[
          毕 业 论 文#text(font: 字体.楷体)[（]设 计#text(font: 字体.楷体)[）]
        ]
      ]
    ]
  ]


  // 题目
  #text(weight: "bold", size: 字号.三号)[
    #v(1em)
    *论文（设计）题目：*

    #linebreak()

    #align(center)[
      #text(font: 字体.黑体, size: 字号.小二)[
        #题目
      ]
    ]

    #linebreak()
  ]

  // 毕设信息
  #let field_name(..parts) = text(font: 字体.楷体, size: 字号.三号, weight: "bold", spacing: 2em)[
    #parts.at(0)
    #if parts.pos().len() > 1 [
      #parts.at(1)
    ]
  ]

  #let field_value(body) = text(font: 字体.宋体, size: 字号.四号)[
    #body
  ]

  #align(center)[
    #table(
      stroke: (x, y) => (
        bottom: if x == 0 {
          none
        } else {
          1pt
        },
      ),
      align: (right + bottom, center + bottom),
      columns: (auto, 5.5cm),
      rows: (1cm, 1cm, 1cm, 2cm, 1cm, 1cm),
      field_name[姓][名], field_value[#姓名],
      field_name[学][号], field_value[#学号],
      field_name[学][院], field_value[#学院],
      field_name[专][业], field_value[#专业],
      field_name[年][级], field_value[#年级],
      field_name[指导教师], field_value[#指导教师],
    )
  ]

  #linebreak()
  #linebreak()


  // 日期
  #align(center)[
    #text(size: 字号.三号, font: 字体.楷体, weight: "bold")[
      #日期
    ]
  ]


  #pagebreak()

  #if 成绩评定表 [

    #set page(
      paper: "a4",
      margin: (x: 3cm, y: 2.5cm),
    )
    #align(center)[
      #text(font: 字体.黑体.at(1), size: 字号.二号)[
        毕业论文(设计)成绩评定表
      ]
    ]
    #set text(size: 字号.小四)


    #text(size: 字号.五号)[
      #grid(
        columns: (auto, 1fr, auto),
        align: (left, center, right),
        inset: 0pt,
        [学院：#学院], [专业：#专业], [年级：#年级],
      )
    ]

    #v(-1em) // 取消表格上方的间距

    #table(
      stroke: 0.5pt,
      align: bottom + left,
      columns: (2em, 1.5em, 1fr, 1.5cm, 3.6cm, 4cm, 1.74cm),
      rows: (0.75cm, 0.99cm, 7.57cm, 0.78cm, 7.36cm, 0.77cm),

      table.cell(colspan: 2)[姓名], table.cell()[#姓名],
      [学号], [#学号], [论文(设计)总成绩], [],

      table.cell(colspan: 3, inset: 8pt)[论文(设计)题目],
      table.cell(colspan: 4, inset: 8pt)[#题目],

      table.cell(rowspan: 2, align: center + horizon)[
        指
        导
        教
        师
        评
        语
      ],
      table.cell(colspan: 6)[],
      table.cell(colspan: 6)[
        #grid(
          columns: (auto, 1fr, auto),
          align: (left, right, right),
          [评定成绩：#h(5em)], [签名：#h(6em)], [#h(2.5em)年#h(1.5em)月#h(1.5em)日],
        )
      ],

      table.cell(rowspan: 2, align: center + horizon)[
        答
        辩
        小
        组
        评
        语
      ],
      table.cell(colspan: 6)[],
      table.cell(colspan: 6)[
        #grid(
          columns: (auto, 1fr, auto),
          align: (left, right, right),
          [答辩成绩：#h(5em)], [组长签名：#h(5em)], [#h(2.5em)年#h(1.5em)月#h(1.5em)日],
        )
      ],
    )

    #text(size: 字号.五号)[
      #ind 注：指导教师、答辩小组给予的成绩和论文(设计)总成绩统一实行百分制，总成绩中指导教师评分占40%(抽样答辩未被抽中的学生占100%)，答辩小组评分占60%。评语、成绩、签名及日期处必须手写。
    ]

    #pagebreak()
  ]
]

#let thesis-outline() = [
  #set page(numbering: "I")
  #counter(page).update(1)

  #outline(
    title: [
      = 目#{ind}录
    ],
    indent: 2em,
  )

  #pagebreak()
]
