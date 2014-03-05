compilecoq := coqc -noglob
coqsource := $(shell find src -name \*.v)
allsource := $(coqsource)
src_dir := src
output_dir := build


output_vo := MyFirstCoq.vo

output := $(patsubst %,$(output_dir)/%,$(output_vo))


.PHONY: clean

$(output_dir)/%.v: $(src_dir)/%.v
	cp $< $@

$(output_dir)/%.vo: $(output_dir)/%.v
	$(compilecoq) $<

default: $(output)

clean:
	rm -f $(output_dir)/*.vo
	rm -f $(output_dir)/*.v
