#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#import "src/style.typ": 字号, 字体, basic_rules, ind, custom_heading, custom_page
#import "src/frame.typ": cover
#import "src/bilingual-bibliography.typ": bilingual-bibliography

#show: basic_rules


#cover(
  // 题目: [],
  // 姓名: [],
  // 学号: [],
  // 学院: [],
  // 专业: [],
  // 年级: [],
  // 指导教师: [],
  // 日期: [],
)

// 生成目录
#outline(indent: 2em, title: custom_heading[目#{ind}录])

#pagebreak()

#show: custom_page

= 绪#{ind}论

#ind 英文引用：大模型（Large Language Model, LLM） @vaswani2023attentionneed 的使用越来越广泛……

#ind 中文引用：LLM对知识管理也有很大的帮助 @TSQC202302017 。

== 选题背景与研究意义

#ind #for i in range(100) [内容]。
#footnote[注释：这是一个注释。]

#ind #for i in range(100) [内容]。

== 国内外研究现状

#ind #for i in range(40) [内容]。

=== 三级标题

#ind #for i in range(100) [内容]。

#ind #for i in range(300) [内容]。

#pagebreak()


= 本科毕业论文写作规范

#pagebreak()


= 学位论文形式规范检查30条


#pagebreak()


#let std_bib = bibliography("ref.bib", title: custom_heading[参考文献], style: "gb-7714-2015-numeric")
// 启用双语支持
#bilingual-bibliography(bibliography: std_bib)
