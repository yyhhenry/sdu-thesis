#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "STKaiti"),
  仿宋: ("Times New Roman", "STFangSong"),
  等宽: ("Consolas", "SimHei"),
)

#let 颜色 = (
  深红: rgb(192, 0, 0),
)


#let heading_size = (字号.小二, 字号.三号, 字号.四号, 字号.小四)

#let custom_heading(body, level: 0) = [
  #set text(font: 字体.黑体, weight: "bold", size: heading_size.at(level))
  #if level <= 1 [
    #align(center)[
      #body
    ]
  ] else [
    #body
  ]
  #v(0.5em)
]

#let basic_rules(body) = [
  #set page(
    paper: "a4",
    margin: (x: 3cm, y: 2.5cm),
  )
  #set text(
    font: 字体.宋体,
    size: 字号.小四,
    lang: "zh",
    region: "cn",
  )
  #set par(spacing: 1.5em, leading: 1em)
  #set heading(outlined: false)
  #show cite: set text(fill: 颜色.深红)

  #show heading: it => custom_heading(level: {
    if it.numbering == none {
      0
    } else {
      it.level
    }
  })[#it]

  #body
]
#let custom_page(body) = [
  #set page(
    footer: context [
      #set text(fill: gray, font: 字体.宋体, size: 字号.小五)
      #align(center)[
        #counter(page).display("1")
      ]
    ],
    header: [
      #align(center)[
        #text(fill: gray, font: 字体.宋体, size: 字号.小五)[
          山东大学本科毕业论文(设计)
        ]
        #v(-1em)
        #line(length: 100%, stroke: (paint: gray))
      ]
    ],
  )
  #set heading(numbering: "1.1 ", outlined: true)
  #counter(page).update(1)
  #counter(footnote).update(0)

  #body
]

// 段首缩进: #ind 段落内容。
// 短标题: 目#{ind}录
#let ind = h(2em)
