#import "style.typ": 字号, 字体

#let cover(
  题目: "请输入论文题目",
  姓名: "请输入姓名",
  学号: "20XX00X00XXX",
  学院: "机电与信息工程学院",
  专业: "请输入专业",
  年级: "20XX级",
  指导教师: "请输入指导教师",
  日期: "20XX年5月XX日",
) = [
  #set page(
    paper: "a4",
    margin: (x: 3.18cm, y: 2.54cm),
  )
  #set text(
    font: 字体.宋体,
    size: 字号.小三,
    lang: "zh",
    region: "cn",
  )

  // 封面抬头
  #align(center)[
    #image("../media/tmpl/cover-sdu.jpg")
  ]

  #align(center)[
    #scale(x: 68%, reflow: true)[
      #text(font: "FZDaHei-B02S", size: 62pt, spacing: 0.2em)[
        毕 业 论 文#text(font: 字体.楷体)[（]设 计#text(font: 字体.楷体)[）]
      ]
    ]
  ]


  // 题目
  #text(weight: "bold", size: 字号.三号)[
    #v(1em)
    *论文（设计）题目：*

    #linebreak()

    #par[
      #align(center)[
        #text(font: 字体.黑体, size: 字号.小二)[
          #题目
        ]
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
      rows: 1cm,
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
]
