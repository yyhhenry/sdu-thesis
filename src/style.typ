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
  楷体: ("Times New Roman", "Kaiti"),
  仿宋: ("Times New Roman", "FangSong"),
  等宽: ("Consolas", "SimHei"),
)

#let 颜色 = (
  深红: rgb(192, 0, 0),
)


#let heading_size = (字号.小二, 字号.三号, 字号.四号, 字号.小四)

#let custom-heading(body, level: 0, force-center: false) = [
  #set text(font: 字体.黑体, weight: "bold", size: heading_size.at(level))
  #if level <= 1 or force-center [
    #align(center)[
      #body
    ]
  ] else [
    #body
  ]
  #v(0.5em)
]

#let basic-rules(body) = [
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
  #let fakepar = context {
    let b = par[#box()]
    let t = measure(b + b)

    b
    v(-t.height)
  }
  #set par(spacing: 1.5em, leading: 1em, first-line-indent: 2em)
  #set heading(outlined: false)

  // 深红色突出显示
  #show cite: set text(fill: 颜色.深红)
  #show ref: set text(fill: 颜色.深红)
  #show ref: it => [
    #show regex("[\d-]+"): it => text(weight: "bold")[#it]
    #it
  ]
  #set math.equation(numbering: (..nums) => (text(fill: 颜色.深红)[(#counter(heading).get().at(0)-#nums.at(0))]))
  #set figure(numbering: (..nums) => (text(fill: 颜色.深红)[#counter(heading).get().at(0)-#nums.at(0)]))
  #show figure.caption: it => (
    text(size: 字号.五号, weight: "bold")[
      #text(fill: 颜色.深红)[#it.supplement]
      #context it.counter.display(it.numbering)
      #it.body
    ]
  )
  #show figure.where(kind: image): it => [
    #it.body
    #v(-0.5em)
    #it.caption
    #fakepar
  ]
  #show figure.where(kind: table): it => [
    #it.caption
    #v(-0.5em)
    #it.body
    #fakepar
  ]
  #show math.equation.where(block: true): it => [
    #it
    #fakepar
  ]
  #show list: it => [
    #it
    #fakepar
  ]
  #show enum: it => [
    #it
    #fakepar
  ]
  #show terms: it => [
    #it
    #fakepar
  ]

  #show heading: it => custom-heading(
    level: {
      if it.numbering == none {
        it.level - 1
      } else {
        it.level
      }
    },
    force-center: it.numbering == none,
  )[
    #it
    #fakepar
    #if it.level == 1 [
      #counter(figure.where(kind: image)).update(0)
      #counter(figure.where(kind: table)).update(0)
      #counter(math.equation).update(0)
    ]
  ]

  #body
]
#let custom-page(body) = [
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
#let appendix-like-page(body) = [
  // 参考文献，致谢，附录等部分不需要编号
  #set heading(numbering: none)
  #set math.equation(numbering: none)

  #set figure(numbering: (..nums) => (text(fill: 颜色.深红)[#nums.at(0)]))
  #show figure.where(kind: image): set figure(supplement: "附图")
  #show figure.where(kind: table): set figure(supplement: "附表")

  #body
]

// 段首缩进: #ind 段落内容。
// 短标题: 目#{ind}录
#let ind = h(2em)
