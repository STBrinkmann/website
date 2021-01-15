---
authors:
- admin
date: "2020-05-07T00:00:00Z"
draft: false
featured: false
image:
  focal_point: ""
  placement: 2
  preview_only: true
lastmod: "2020-05-07T00:00:00Z"
projects: []
subtitle: "Text Mining and Topic Modelling using a Structural Topic Model"
tags:
- STM
- Text Mining
- R
- Tidyverse
title: Text Mining Belval Campus
---

In 2001 a project has been created to transform the former steel production site in Belval,
Luxembourg into the [Cité des Sciences](https://wwwde.uni.lu/fhse/belval_campus). 
In [2015](https://lequotidien.lu/luxembourg/le-campus-de-belval-en-un-clin-doeil/) the new campus has been opened.
![Campus Belval](https://wwwde.uni.lu/var/storage/images/media/images/campus_belval_final_1/1014043-1-fre-FR/campus_belval_final_1.jpg)

In this analysis I want to explore how this topic is being represented in the news.

Therefore I first collected the top 58 news articles from [Google News](https://www.google.com/search?q=belval+campus+esch-sur-alzette&client=firefox-b-d&sxsrf=ALeKk0080OxF6oOpC3lb6hNxafFccNgYjA:1590592264605&source=lnms&tbm=nws&sa=X&ved=2ahUKEwi57Kf3qdTpAhU7ThUIHSw_CG0Q_AUoAXoECCwQAw&biw=1920&bih=966).
The texts have been translated to English with [DeepL](https://www.deepl.com/en/translator) and structured 
in a .txt document like so:
```
Title: Title_Name
DATE: dd.mm.yyyy
.
. Text
.
Title: Title_Name
DATE: dd.mm.yyyy
.
. Text
.
```

### Wordcloud
Next a Wordcloud with the word frequency of the whole corpus has been created:
<img src="https://raw.githubusercontent.com/STBrinkmann/Text_Mining_Belval/master/Plots/wordcloud.svg?sanitize=true">
We can already see that the new campus is of high importance. But also, the look into the future ("2022", "future"),
and the acknowledgement of its history ("furnace", "steel", "industrial"...) are often thematised.

### Term Frequency-Inverse Document Frequency
At this point the corpus does not contain many articles for 2014 and 2015. 
Therefore these articles have been combined for the further analysis. The next figure shows the number of articles per year:
<img src="https://raw.githubusercontent.com/STBrinkmann/Text_Mining_Belval/master/Plots/Articles_Count.svg?sanitize=true">

With the wordcloud we explored the word frequency of the whole corpus. To analyse the keywords of each year, a [term frequency-inverse document frequency](http://www.tfidf.com/) has been conducted: 
<img src="https://raw.githubusercontent.com/STBrinkmann/Text_Mining_Belval/master/Plots/tf_idf.svg?sanitize=true">

### Structural Topic Model
Next a [Structural Topic Model (STM)](https://www.structuraltopicmodel.com/) has been applied on the data set. From the previous steps we already have gained an understanding of the complexity of the coverage of reports about Belval. Therefore, we knew that there are not that many different topics. After an iterative process of setting the parameter K (number of topics) and interpreting the results, I set K = 6. These 6 topics have been labeled manually.
<img src="https://raw.githubusercontent.com/STBrinkmann/Text_Mining_Belval/master/Plots/stm.svg?sanitize=true">
To evaluate the importance and the change over time of these topics, the topic of each article within the corpus has been predicted. The result is shown in the final figure:
<img src="https://raw.githubusercontent.com/STBrinkmann/Text_Mining_Belval/master/Plots/timeseries.svg?sanitize=true">
The most frequent articles are those that deal with the university campus in Belval itself. The second most frequent type of article is the one dealing with structural change, i.e. the transformation from a former steel industry location to the Cité des Sciences, the city of science. It should be emphasized that articles on this topic predominantly highlight the positive implementation of structural change. This is followed by articles on the topic of culture, although it is clearly visible here that there has been increased reporting on this area since 2019. This is due to the fact that this year Belval was admitted to the Capital of Culture 2022. This analysis was complemented by a qualitative interview with a partner from the University of Luxembourg about the Belval project.\
\
\
The code is available on [GitHub](https://github.com/STBrinkmann/Text_Mining_Belval).
