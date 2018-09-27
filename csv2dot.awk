{
	inn = split($2, ina, /,/);
	outn = split($3, outa, /,/);

	for (i = 1; i <= inn; i +=2) {
		for (j = 1; j <= outn; j +=2) {
			graph[ina[i] "\t" outa[j]] = 1;
		}
	}
}

END {
	short["steel-plate"] = "S";
	short["electronic-circuit"] = "C1";
	short["iron-plate"] = "I";
	short["iron-gear-wheel"] = "G";
	short["advanced-circuit"] = "C2";
	short["copper-plate"] = "C";
	short["processing-unit"] = "C3";
	short["pipe"] = "P";
	short["copper-cable"] = "CC";
	short["water"] = "W";

	fluid["crude-oil"] = 1;
	fluid["heavy-oil"] = 1;
	fluid["light-oil"] = 1;
	fluid["lubricant"] = 1;
	fluid["petroleum-gas"] = 1;
	fluid["steam"] = 1;
	fluid["sulfuric-acid"] = 1;
	#fluid["water"] = 1;

	for (tuple in graph) {
		split(tuple, tuple1, "\t");
		if (tuple1[1] in short) {
			if (!(tuple1[2] in trans))
				trans[tuple1[2]] = short[tuple1[1]];
			else if (trans[tuple1[2]] !~ short[tuple1[1]])
				trans[tuple1[2]] = trans[tuple1[2]] "," short[tuple1[1]]
		}
	}

	for (tuple in graph) {
		split(tuple, tuple1, "\t");
		for (k in tuple1) {
			name = tuple1[k];
			if (name in trans)
				trans1[name] = name " " trans[name];
			else
				trans1[name] = name;
		}
	}

	print("digraph {");
	print("rankdir=LR;");
	print("subgraph cluster_legend {");
	print("label = \"Legend\";");
	print("style=solid;");
	for (i in short)
		print("\"" short[i] "\" -> \"" i " \" [dir=none];");
	print("}");

	for (i in fluid)
		print("\"" trans1[i] "\" [style=dashed];");

	for (tuple in graph) {
		split(tuple, tuple1, "\t");
		if (tuple1[2] in short)
			continue;
		if (tuple1[1] in short)
			continue;
		print("\"" trans1[tuple1[1]] "\" -> \"" trans1[tuple1[2]] "\";");
	}

	print("}");
}
