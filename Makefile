compilecoq := coqc -noglob
coqsource := $(shell find src -name \*.v)
allsource := $(coqsource)
src_dir := src
output_dir := build


ch1_src_dir := $(src)/ch1-Basics
ch1_build_dir := $(output_dir)/ch1-Basics
ch1_vo := EnumeratedTypes.vo
ch1_output := $(patsubst %,$(ch1_build_dir)/%,$(ch1_vo))


.PHONY: clean

ch1outputdir:
	mkdir -p $(ch1_build_dir)

$(ch1_build_dir)/%.v: $(ch1_src_dir)/%.v ch1outputdir
	cp $< $@

$(ch1_output_dir)/%.vo: $(ch1_build_dir)/%.v ch1outputdir
	$(compilecoq) $<

ch1: $(ch1_output)

default: ch1

clean:
	rm -rfv $(ch1_build_dir)
