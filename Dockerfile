FROM asciidoctor/docker-asciidoctor

CMD ["/bin/sh", "-c", "\
if [ \"$OUTPUT_FORMAT\" = \"pdf\" ]; then \
  asciidoctor-pdf --theme resources/themes/poetry.yml -a pdf-fontsdir=\"resources/fonts;GEM_FONTS_DIR\" -a compress -a optimize -vwt -o output/mybook.pdf master.adoc; \
elif [ \"$OUTPUT_FORMAT\" = \"epub\" ]; then \
  asciidoctor-epub3 -a epub3-stylesdir=resources/epub3-styles -vwt -o output/mybook.epub master.adoc; \
elif [ \"$OUTPUT_FORMAT\" = \"html\" ]; then \
  asciidoctor -vwt -o output/mybook.html master.adoc; \
else \
  echo \"Format de sortie non pris en charge\"; \
fi"]
