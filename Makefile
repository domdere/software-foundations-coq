compilecoq := coqc -noglob -init-file coq.config
coq_makefile := coq_makefile -R .
coq_top := coqtop -R . ""
coqsource := $(shell find src -name \*.v)
src_dir := src
output_dir := build

all_build_src := $(patsubst $(src_dir)/%.v,$(output_dir)/%.v,$(coqsource))
drop_build_dir := $(patsubst $(output_dir)/%,%,$(all_build_src))

# ch1 paths

ch1_src_dir := $(src_dir)/ch1
ch1_build_dir := $(output_dir)/ch1

# end ch1 paths

all_intermediate_src := $(ch1_src)

.PHONY: clean

default: all

makefile: $(all_build_src)
	cd $(output_dir); $(coq_makefile) $(drop_build_dir) > Makefile.coq

console: $(all_build_src)
	cd $(output_dir); $(coq_top)

all: makefile
	cd $(output_dir); make -f Makefile.coq

# ch1 targets

$(ch1_build_dir):
	mkdir -p $(ch1_build_dir)

$(ch1_build_dir)/%.v: $(ch1_src_dir)/%.v $(ch1_build_dir)
	cp $< $@

# end ch1 targets

clean:
	rm -rfv $(ch1_build_dir)
	rm $(output_dir)/Makefile.coq
