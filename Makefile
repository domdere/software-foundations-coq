compilecoq := coqc -noglob -init-file coq.config
coq_makefile := coq_makefile -R .
coqsource := $(shell find src -name \*.v)
allsource := $(coqsource)
src_dir := src
output_dir := build

all_build_src := $(patsubst $(src_dir)/%.v,$(output_dir)/%.v,$(allsource))
drop_build_dir := $(patsubst $(output_dir)/%,%,$(all_build_src))

ch1_src_dir := $(src_dir)/ch1
ch1_build_dir := $(output_dir)/ch1
ch1_vo := EnumeratedTypes.vo Simplification.vo Rewriting.vo
ch1_src := $(patsubst %.vo,$(ch1_build_dir)/%.v,$(ch1_vo))
ch1_output := $(patsubst %,$(ch1_build_dir)/%,$(ch1_vo))

all_intermediate_src := $(ch1_src)

.PHONY: clean

default: all

makefile: $(all_build_src)
	cd $(output_dir); $(coq_makefile) $(drop_build_dir) > Makefile.coq

all: makefile
	cd $(output_dir); make -f Makefile.coq

$(ch1_build_dir):
	mkdir -p $(ch1_build_dir)

$(ch1_build_dir)/%.v: $(ch1_src_dir)/%.v $(ch1_build_dir)
	cp $< $@

$(ch1_build_dir)/%.vo: $(ch1_build_dir)/%.v $(ch1_build_dir) $(ch1_src)
	$(compilecoq) $<

ch1: $(ch1_output)

clean:
	rm -rfv $(ch1_build_dir)
	rm $(output_dir)/Makefile.coq
