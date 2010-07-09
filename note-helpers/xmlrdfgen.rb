#!/usr/bin/env ruby

# Generates an XML/RDF stub file for notes/transcriptions of archival material.
# Half-baked, not really useful yet, and needs documentation.

require "fileutils"
require "yaml"
require 'pathname'
require 'pp'
#require 'rdf/ntriples'
require 'rubygems'
require 'rdf'
require 'rdf/ntriples'
require 'tempfile'

include RDF

METADATA_FILE = "metadata.yml"
ROOT_FILE = "root.yml"
TEMPFILE = 'yaaar.nt'


class App
	
	def initialize(debug=0)
		@dirstack = Array.new()
		@DEBUG = debug
	end

	def debug(str)
	  if @DEBUG == 1
	  	pp str
	  end
	end
	
	def pushd(dir)
		p = Pathname.new(Dir.pwd())
		@dirstack.push(p)
		if dir == ".."
			dir = p.dirname
		end
		Dir.chdir(dir)
		debug("PushD to " + Dir.pwd())		
	end
	
	def popd
		if @dirstack.length > 0
			Dir.chdir(@dirstack.pop)
		end
		debug("PopD to " + Dir.pwd())				
	end
	
	
	def metadata_walker(data=nil)
		debug("Started metadata_walker")
		if File.exist?(ROOT_FILE)
			debug("Root file in " + Dir.pwd())
			# read the root file here, if it turns out to have anything important.
			# It doesn't, yet, so this is just a base case.
			
		else
			# we're not yet at root
			debug("Didn't see root.yml")
			pushd '..'
			
			# recurse up the directory tree
			data = metadata_walker(data)

			# Start walking back down the directory tree, loading the
			# metadata file in each path, overriding values as we go.
			popd			
			if File.exist?(METADATA_FILE)
				debug " Processing " + METADATA_FILE + " in " + Dir.pwd()
				mydata = YAML.load_file(METADATA_FILE)
				if data == nil:
					@data = mydata
				else
					# Since we're walking down the tree at this point, 
					# overwrite values from higher up with this file's values.
					@data.update(mydata)
				end
				debug @data				
			else
				# no metadata file
				debug(" No metadata file in " + Dir.pwd())
			end

			return @data
		end
	end

	def output_yaml()
	
	end
	
	def serialize_xml (outfile)
		nss = {
			:bibo => "http://purl.org/ontology/bibo/",
			:heml => "http://www.heml.org/rdf/2003-09-17/heml#",
			# Zotero's schema isn't available at this URL but their code exports it
			#:z    => "http://www.zotero.org/namespaces/export#",
			:geo  => "http://www.w3.org/2003/01/geo/wgs84_pos#",
	    :crm  =>"http://cidoc.ics.forth.gr/rdfs/cidoc_v4.2.rdfs#"
		}
		#pp @data
	
		bibo = RDF::Vocabulary.new(nss[:bibo])
		mods = RDF::Vocabulary.new(nss[:mods])
		#z = RDF::Vocabulary.new(nss[:z])
	
		# TODO: remove spaces from outfile
	
		# Write out to N3, which doesn't require working with the Raptor libraries. See below.
		RDF::Writer.for(:ntriples).open(TEMPFILE) do |writer|
			root = 'http://data.cliotropic.org/images/'
			item_url = root + outfile
			thisuri = RDF::URI.new(item_url)
			repo = RDF::Repository.new
			
			myid = [outfile, @data['Locator'], @data['Collection'], @data['Repository'] ].join(', ')
			
			repo << [thisuri, DC.Identifier, myid]
			#repo << [thisuri, z.Archive, @data['Repository']]
			repo << [thisuri, DC.Title, "Foo to Bar, date"]
			repo << [thisuri, DC.Date, "TODO"]
			repo << [thisuri, DC.Creator, "TODO"]		
			

			repo.each_statement do |statement|
    		writer << statement
  		end
  	end

		# This command-line hack is much more functional than the current RDF::Raptor::Writer::CLI,
		# which doesn't support abbreviations or namespace options well.
		# Prioritize readable output.
		
		# TODO: clean this up so that we iterate over @nss to generate the -f options.
  	@command = 'rapper -i ntriples -o rdfxml-abbrev ' + TEMPFILE + ' -f xmlns:bibo=\"http://purl.org/ontology/bibo/\" -f xmlns:DC=\"http://purl.org/dc/terms/\"' +
  	' -f xmlns:heml=\"http://www.heml.org/rdf/2003-09-17/heml#\"'
  	@xml = `#{@command} 2>/dev/null`
		print @xml
	end

	def run	
		bigdata = metadata_walker()
		#pp(bigdata)
		serialize_xml(ARGV[0])
		
	end

end

app = App.new(debug=0)
app.run
