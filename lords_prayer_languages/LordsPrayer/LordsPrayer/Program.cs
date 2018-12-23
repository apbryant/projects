using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LordsPrayer
{
    class Program
    {
        static void Main(string[] args)
        {
            Function();
        }
        private static void Function()
        {
            List<Word> words = Read();
            words = Process(words);
            Output(words);
            Console.WriteLine("Finished");
            Console.ReadLine();
        }
        private static List<Word> Read()
        {
            string path = @"C:\\lords_prayer_levenshtein\data.xlsx";
            XSSFWorkbook wb = new XSSFWorkbook(path);
            XSSFSheet ws = (XSSFSheet)wb.GetSheetAt(1);
            int lastExcelRow = 1048576;
            List<string> headers = new List<string>();
            XSSFRow header = (XSSFRow)ws.GetRow(0);
            List<Word> words = new List<Word>();
            List<string> englishWords = new List<string>();
            for (int i = 1; i < lastExcelRow; i++)
            {
                XSSFRow row = (XSSFRow)ws.GetRow(i);
                if (row == null)
                {
                    break;
                }
                string english = row.GetCell(0).StringCellValue;
                Word eng = new Word();
                eng.English = english;
                eng.Language = Word.englishCode;
                eng.WordText = english;
                words.Add(eng);
                string spanish = row.GetCell(1).StringCellValue;
                Word spa = new Word();
                spa.English = english;
                spa.Language = Word.spanishCode;
                spa.WordText = spanish;
                words.Add(spa);
                string portuguese = row.GetCell(2).StringCellValue;
                Word por = new Word();
                por.English = english;
                por.Language = Word.portugueseCode;
                por.WordText = portuguese;
                words.Add(por);
                string french = row.GetCell(3).StringCellValue;               
                Word fra = new Word();
                fra.English = english;
                fra.Language = Word.frenchCode;
                fra.WordText = french;
                words.Add(fra);
                string italian = row.GetCell(4).StringCellValue;
                Word ita = new Word();
                ita.English = english;
                ita.Language = Word.italianCode;
                ita.WordText = italian;
                words.Add(ita);
                string catalan = row.GetCell(5).StringCellValue;
                Word cat = new Word();
                cat.English = english;
                cat.Language = Word.catalanCode;
                cat.WordText = catalan;
                words.Add(cat);
                string romanian = row.GetCell(6).StringCellValue;
                Word ron = new Word();
                ron.English = english;
                ron.Language = Word.romanianCode;
                ron.WordText = romanian;
                words.Add(ron);
                string latin = row.GetCell(7).StringCellValue;
                Word lat = new Word();
                lat.English = english;
                lat.Language = Word.latinCode;
                lat.WordText = latin;
                words.Add(lat);
                englishWords.Add(english);
            }
            return words;
        }
        private static List<Word> Process(List<Word> words)
        {
            List<Word> englishWords = new List<Word>();
            foreach (Word word in words.Where(x => x.Language == Word.englishCode))
            {
                englishWords.Add(word);
            }
            foreach (Word word in englishWords)
            {
                List<Word> similarTerms = words.Where(x => x.Language != Word.englishCode && x.English == word.English).ToList();
                foreach (Word term in similarTerms)
                {
                    int index = similarTerms.IndexOf(term);
                    if (term.Comparisons == null)
                    {
                        term.Comparisons = new Dictionary<Word, int>();
                    }
                    List<int> indexes = Enumerable.Range(0, similarTerms.Count).ToList();
                    for (int i = 0; i < indexes.Count; i++)
                    {
                        if (i == index) 
                        {
                            term.Comparisons.Add(term, -1);
                        }
                        else
                        {
                            int j = LevenshteinDistance.Compute(similarTerms[index].WordText, similarTerms[i].WordText);
                            term.Comparisons.Add(similarTerms[i], j);
                            Console.WriteLine("Distance between {0}({1}) and {2}({3}): {4}",
                                similarTerms[index].WordText, similarTerms[index].Language,
                                similarTerms[i].WordText, similarTerms[i].Language, j.ToString());
                        }
                    }
                    //indexes.Remove(index);
                    foreach (int i in indexes)
                    {
                        //int j = LevenshteinDistance.Compute(similarTerms[index].WordText, similarTerms[i].WordText);
                        //term.Comparisons.Add(similarTerms[i], j);
                        //Console.WriteLine("Distance between {0}({1}) and {2}({3}): {4}",
                        //    similarTerms[index].WordText, similarTerms[index].Language,
                        //    similarTerms[i].WordText, similarTerms[i].Language, j.ToString());
                    }
                }
            }
            return words;
        }

        private static void Output(List<Word> words)
        {
            XSSFWorkbook wb = new XSSFWorkbook();
            int rowCounter = 0;
            XSSFSheet ws = (XSSFSheet)wb.CreateSheet("Sheet1");
            XSSFRow header = (XSSFRow)ws.CreateRow(rowCounter);
            rowCounter++;
            header.CreateCell(0).SetCellValue("Word");
            header.CreateCell(1).SetCellValue("Language");
            int counter = 2;
            foreach (string code in Word.codeList.Where(x => x != Word.englishCode))
            {
                
                header.CreateCell(counter).SetCellValue(code);
                counter++;
            }
            IEnumerable<IGrouping<string, Word>> groupedWords = words.Where(x => x.Language != Word.englishCode).GroupBy(x => x.Language);
            foreach (var group in groupedWords)
            {
                int colToSkip = Word.codeList.IndexOf(group.Key) + 2;
                foreach (var item in group)
                {
                    XSSFRow row = (XSSFRow)ws.CreateRow(rowCounter);
                    rowCounter++;
                    row.CreateCell(0).SetCellValue(item.WordText);
                    row.CreateCell(1).SetCellValue(item.Language);
                    int cellCounter = 2;
                    foreach (var j in item.Comparisons)
                    {
                        
                        if (cellCounter == colToSkip)
                        {
                            row.CreateCell(cellCounter).SetCellValue(-1);                       
                        }
                        else
                        {
                            row.CreateCell(cellCounter).SetCellValue(j.Value);                          
                        }
                        cellCounter++;
                    }
                }
            }
            using (FileStream fs = new FileStream(@"C:\\lords_prayer_levenshtein\output.xlsx", FileMode.Create, FileAccess.Write))
            {
                wb.Write(fs);
            }
        }
    }
}
