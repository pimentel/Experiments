#include <iostream>
#include <string>

#include <api/BamAlignment.h>
#include <api/BamReader.h>

namespace bt = BamTools;

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        std::cerr << "Usage: a.out [file.bam | file.sam]" << std::endl;
        return 1;
    }

    std::string f_name(argv[1]);
    std::cout << "File name: " << f_name << std::endl;

    bt::BamReader reader;

    if ( ! reader.Open(f_name) )
    {
        std::cerr << "Couldn't open file: " << f_name << std::endl;
        return 1;
    }

    bt::SamHeader header = reader.GetHeader();
    if ( header.IsValid() )
        std::cout << "Header is valid" << std::endl;
    else
        std::cout << "Header is INVALID!!" << std::endl;

    bt::SamSequenceDictionary dict = header.Sequences;
    std::cout << "Header info: " << std::endl;
    for (bt::SamSequenceConstIterator seq = dict.ConstBegin();
         seq != dict.ConstEnd();
         ++seq)
    {
        if ( seq->HasName() ) 
        {
            std::cout << seq->Name << '\t';
        }

        if ( seq->HasLength() )
        {
            std::cout << seq->Length;
        }

        std::cout << std::endl;
    }
    std::cout << "****************************************" << std::endl;

    bt::RefVector refVector = reader.GetReferenceData();
    bt::BamAlignment aln;
    while ( reader.GetNextAlignment(aln) )
    {
        std::cout << "'" << aln.Name << "'\t" << aln.Position << '\t'
                  << aln.GetEndPosition() << '\t' << aln.RefID << '\t'
                  << refVector[ aln.RefID ].RefName << std::endl;
    }
    return 0;
}
