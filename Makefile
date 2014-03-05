compilecoq := coqc -noglob
coqsource := $(shell find src -name \*.v)
allsource := $(coqsource)
src_dir := src
output_dir := build

.PHONY: clean

$(output_dir)/%.v: $(src_dir)/%.v
	cp $@ $<

$(output_dir)/%.vo: $(output_dir)/%.v
	$(compilecoq) $<

clean:
	rm -f $(output_dir)/*.vo
	rm -f $(output_dir)/*.v
