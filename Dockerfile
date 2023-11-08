FROM asciidoctor/docker-asciidoctor

CMD ["/bin/sh", "-c", "\
if [ \"$OUTPUT_FORMAT\" = \"pdf\" ]; then \
  asciidoctor-pdf --theme resources/themes/poetry.yml -a pdf-fontsdir=\"resources/fonts;GEM_FONTS_DIR\" -a compress -vwt -o output/mybook.pdf master.adoc; \
elif [ \"$OUTPUT_FORMAT\" = \"epub\" ]; then \
  asciidoctor-epub3 -vwt -o output/mybook.epub master.adoc; \
elif [ \"$OUTPUT_FORMAT\" = \"html\" ]; then \
  asciidoctor -vwt -o output/mybook.html master.adoc; \
else \
  echo \"Format de sortie non pris en charge\"; \
fi"]
