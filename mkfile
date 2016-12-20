REFERENCE_GTF=/reference/ucsc.hg19.gtf

all:VE:
	./targets | xargs mk

results/htseq-count/%.counts:	data/%.sam
	mkdir -p `dirname "$target"`
	htseq-count \
		"$prereq" \
		$REFERENCE_GTF \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
