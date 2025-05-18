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
  方正大黑简体: ("Times New Roman", "FZDaHei-B02S", "SimHei"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "Kaiti"),
  等宽: ("Consolas", "SimHei"),
)

#let 颜色 = (
  深红: rgb(192, 0, 0),
  link-blue: rgb(51, 0, 245),
  tips: rgb("#00cbba"),
  attn: rgb("#f7e53c"),
)

// 段首缩进（通常已经自动添加）: #ind 段落内容。
// 短标题: 目#{ind}录
#let ind = h(2em)

#let heading-size = (字号.小二, 字号.三号, 字号.四号, 字号.小四)

#let custom-heading(body, level: 0, force-center: false) = {
  set text(font: 字体.黑体, weight: "bold", size: heading-size.at(level))
  if level <= 1 or force-center {
    align(center)[#body]
  } else {
    body
  }
  v(0.5em)
}

#let fakepar = context {
  let b = par[#box()]
  let t = measure(b + b)

  b
  v(-t.height)
}

#let tips(body) = {
  highlight(fill: 颜色.tips, top-edge: 1em, bottom-edge: -0.2em)[#body]
}
#let attn(body) = {
  highlight(fill: 颜色.attn, top-edge: 1em, bottom-edge: -0.2em)[#underline()[#body]]
}

#let indent-rules(body) = {
  set par(first-line-indent: 2em)
  show figure.where(kind: image): it => {
    rect(stroke: none)[
      #it.body
      #v(-0.5em)
      #it.caption
    ]
    fakepar
  }
  show figure.where(kind: table): it => {
    rect(stroke: none)[
      #it.caption
      #v(-0.5em)
      #it.body
    ]
    fakepar
  }
  show raw.where(block: true): it => {
    text(font: 字体.等宽)[#it]
    fakepar
  }
  show math.equation.where(block: true): it => {
    it
    fakepar
  }
  show list: it => {
    it
    fakepar
  }
  show enum: it => {
    it
    fakepar
  }
  show terms: it => {
    it
    fakepar
  }
  show heading: it => {
    it
    fakepar
  }

  body
}

#let re-index = {
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(math.equation).update(0)
}

#let ref-rules(body) = {
  show link: it => text(fill: 颜色.link-blue)[#underline[#it]]

  set math.equation(numbering: (..nums) => [(#counter(heading).get().at(0)-#nums.at(0))])
  set figure(numbering: (..nums) => [#counter(heading).get().at(0)-#nums.at(0)])
  show figure.caption: it => {
    set text(size: 字号.五号, weight: "bold")
    it.supplement
    context it.counter.display(it.numbering)
    it.body
  }
  set footnote(numbering: (..nums) => [#nums.at(0)])
  show heading.where(level: 1): it => {
    it
    re-index
  }

  body
}

#let heading-rules(body) = {
  show heading: it => {
    let force-center = it.numbering == none or not it.outlined
    let level = if force-center {
      it.level - 1
    } else {
      it.level
    }
    custom-heading(
      level: level,
      force-center: force-center,
    )[#it]
  }

  body
}

#let foreword-rules(body) = {
  set heading(numbering: none, outlined: false)
  body
}

#let main-body-rules(body) = {
  set page(
    footer: context {
      set text(fill: gray, font: 字体.宋体, size: 字号.小五)
      align(center)[#counter(page).display("1")]
    },
    header: {
      align(center)[
        #text(fill: gray, font: 字体.宋体, size: 字号.小五)[
          山东大学本科毕业论文(设计)
        ]
        #v(-0.5em)
        #line(length: 100%, stroke: (paint: gray, thickness: 0.5pt))
      ]
    },
  )
  set heading(numbering: "1.1 ", outlined: true)
  counter(page).update(1)
  counter(footnote).update(0)

  body
}

#let following-rules(body) = {
  // 参考文献，致谢，附录等部分不需要编号
  set heading(numbering: none)
  show heading.where(level: 2): set heading(outlined: false)
  show heading.where(level: 3): set heading(outlined: false)

  body
}

#let appendix-rules(body) = {
  set heading(supplement: none)
  show heading.where(level: 2): set heading(numbering: (..nums) => [附录#nums.at(1)])
  // 附录的二级标题仍然需要从头编号
  show heading.where(level: 2): it => {
    it
    re-index
  }

  set figure(numbering: (..nums) => [#nums.at(0)])
  show figure.where(kind: image): set figure(supplement: "附图")
  show figure.where(kind: table): set figure(supplement: "附表")

  set figure(supplement: none)


  body
}
