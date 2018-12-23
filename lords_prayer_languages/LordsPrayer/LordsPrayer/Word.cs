using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LordsPrayer
{
    class Word
    {
        public static string englishCode = "eng";
        public static string spanishCode = "spa";
        public static string portugueseCode = "por";
        public static string frenchCode = "fra";
        public static string italianCode = "ita";
        public static string catalanCode = "cat";
        public static string romanianCode = "ron";
        public static string latinCode = "lat";
        public static List<string> codeList = new List<string>(){
            spanishCode,
            portugueseCode,
            frenchCode,
            italianCode,
            catalanCode,
            romanianCode,
            latinCode
        };
        public Dictionary<Word, int> Comparisons { get; set; }
        public string English { get; set; }
        public string Language { get; set; }
        public string WordText { get; set; }
    }
}
