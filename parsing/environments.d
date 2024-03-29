module superAwesome.parsing.environments;

import superAwesome.environments;
import superAwesome.parsing.primitives;
import std.xml;

public alias EnvironmentService function(ElementParser xml) EnvironmentParser;

public EnvironmentParser GetEnvironmentParser(string typeName)
{
	assert(typeName in parsers);
	return parsers[typeName];
}
private EnvironmentParser[string] parsers;

static this()
{
	parsers["NaiveNASAEnvironment"] = &parseNaiveNASAEnvironment;
	parsers["NaiveWikiEnvironment"] = &parseNaiveWikiEnvironment;
}

private EnvironmentService parseNaiveNASAEnvironment(ElementParser xml)
{
	return new NaiveNASAEnvironment();
}

private EnvironmentService parseNaiveWikiEnvironment(ElementParser xml)
{
	return new NaiveWikiEnvironment();
}
