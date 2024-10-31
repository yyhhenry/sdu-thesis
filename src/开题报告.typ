#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#import "style.typ": (
  字号,
  字体,
  颜色,
  ind,
  indent-rules,
  ref-rules,
  heading-rules,
  foreword-rules,
  main-body-rules,
  following-rules,
)
#import "bilingual-bibliography.typ": bilingual-bibliography

#set page(margin: (x: 3.18cm, y: 2.54cm))
#set text(
  font: 字体.宋体,
  size: 字号.小四,
  lang: "zh",
  region: "cn",
)
#set par(spacing: 1em)

#show: indent-rules

// 开题报告-封面
#align(center)[
  #text(font: "STXinwei", size: 28pt)[
    山东大学（威海）

    毕业论文（设计）开题报告
  ]
]

TODO
