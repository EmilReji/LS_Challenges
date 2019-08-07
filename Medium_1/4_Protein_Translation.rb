=begin
RNA sequence contains capital letters (A, U, G, C)
A codon is a group of 3 letters; 64 types
RNA sequence is made of one or more codons
Each codon is mapped to a amino acid; 20 types
Also have 4 codons that terminate the protine
Means codons after a STOP codon are not valid even if they themselves are valid

of_codon:
input: 3 letter string; (A, U, G, C)
output: protein name or command (STOP)
algorithm:
verify string has 3 letters of A, U, G, or C
use hash mapping to find protein for codon and return

of_rna:
input: string; combo of multiple 3 letter string; (A, U, G, C)
output: array of proteins in same order; if STOP is what one codon represents, it and follow up proteins not included
algorithm:
split string into an array of strings each 3 characters long

=end

class InvalidCodonError < StandardError
end

class Translation
  MAPPING = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }
  def self.of_codon(seq)
    Translation.validate_codon(seq)
    MAPPING[seq]
  end

  def self.of_rna(seq)
    arr = seq.split(/(.{3})/)
    arr.delete('')
    result = []
    
    arr.each do |codon|
      amino = Translation.of_codon(codon)
      break if amino == 'STOP'
      result << amino
    end
    
    result
  end

  def self.validate_codon(seq)
    raise InvalidCodonError if seq.match(/[^AUGC]/) || seq.size != 3
  end
end