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

= 毕业论文(设计)成绩评定表

TODO（较为复杂的表格，建议直接在Word中编辑）

#pagebreak()

= 摘#{ind}要

#ind 中文摘要应将学位论文的内容要点简短明了地表达出来，一般约300~800个汉字，字体为宋体小四号。内容应包括目的与意义、研究内容与方法以及研究结论等，同时需要突出论文的新论点、新见解或创造性成果，语言力求精炼。注意：中英文摘要和中英文关键词，要一一对应。

*关键词：*关键词1；关键词2；关键词3；关键词4；关键词5

#pagebreak()

= ABSTRACT

#ind #lorem(100)

#ind 英文摘要约200~600个单词。中文“学位论文”对应的英文宜用“thesis”或“dissertation”，不宜用“paper”。

*Keywords:* key word 1, key word 2, key word 3, key word 4, key word 5
#pagebreak()

#outline(
  title: [
    = 目#{ind}录
  ],
  indent: 2em,
)

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

=== 三级标题2

#ind #for i in range(40) [内容]。

#ind #for i in range(20) [内容]。

#pagebreak()


= 本科毕业论文写作规范

#pagebreak()


= 学位论文形式规范检查30条


#pagebreak()

#set heading(numbering: none)

#let std_bib = bibliography("ref.bib", title: [参考文献], style: "gb-7714-2015-numeric")
// 启用双语支持
#bilingual-bibliography(bibliography: std_bib)

#pagebreak()

= 致#{ind}谢

#ind 对指导教师和协助完成论文(设计)的组织和个人表示谢意。致谢应实事求是，切忌浮夸之词。(限一页，自己写，以下示例仅供参考)

#ind 本论文的研究工作是在我的指导老师XXX老师的悉心指导和严格要求下完成的，XXX老师认真指导我完成了论文选题、查阅文献、课题进展以及整个论文的撰写工作。XXX老师认真严谨的治学态度、实事求是的工作作风和科学高效的工作方法对我产生了极大的影响，这些也都是我今后工作和学习的榜样。

#ind 在课题进展、论文撰写以及多次修改定稿过程中，XXX老师给我提出了许多宝贵意见和建议，使我的论文写作更加规范，文字更加通顺，整个过程使我受益匪浅，在此，向X老师表示诚挚的谢意。

#ind 通过完成此论文，使我掌握了理工科课题的一般研究方法、科技论文的一般写法以及查阅文献资料的方法，巩固了所学的基础理论和专业知识，使我对XXXX领域有了更新更深的理解，提高了分析问题和解决问题的能力。衷心感谢山东大学和XXXXXX学院老师们四年来对我的教育和培养。我将牢记山东大学“学无止境，气有浩然”的校训，继续高标准、严要求、从优秀走向卓越，“珍惜拥有，荣校强国，互荣共进”。

#ind 在查阅文献、课题进展以及撰写论文期间，XXX、XXX和XXX等同学对我论文的研究工作给予了热情帮助，在此向他们表达我的感激之情；同时，也一并感谢所有关心、帮助过我的同学和朋友们。

#ind 最后，将特别的感谢送给我的父母和家人，感谢他们多年来对我的鼓励、关心和厚爱，是他们在物质上、生活上和精神上给予我莫大的帮助，他们的理解和支持使我能够在学校专心完成学业。


#pagebreak()

= 附#{ind}录

#ind “附录”二字黑体小二号加粗居中，中间空4个空格；内容为宋体小四号、首行缩进两字符、1.5倍行距。对于不宜放在正文中，但有参考价值的内容，可放附录中。例如，重复测试的实验结果图表，篇幅较大的图、表、数学式的推演、编写的算法、程序代码段等。注意：正文文字统领图表式、文献、附录。所有的附录均应在正文文字中提及。
