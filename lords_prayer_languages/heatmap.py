import pandas as pd
from pandas import DataFrame
import seaborn as sns
import matplotlib.pyplot as plt

ReadExcel = pd.read_excel("C:\lords_prayer_levenshtein\output.xlsx")
df = DataFrame(ReadExcel)
Index = ["spa", "por", "fra", "ita", "cat", "ron", "lat"]
Cols = df["Word"].tolist()
df = df.drop(columns = ["Word", "Language"])
df2 = pd.DataFrame(df, index=Index, columns=Cols)
dims = (10, 10)
fig, ax = plt.subplots(figsize=dims)
sns.heatmap(df, ax=ax, yticklabels=Cols)
plt.xlabel("Language")
plt.ylabel("Word")
plt.title("lalala")
plt.show()