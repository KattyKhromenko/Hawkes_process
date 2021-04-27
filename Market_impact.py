#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# df = pd.read_excel('стакан.xlsx')
# df = df.loc[df.S != 0.0, :][::-1]

d = {'PRICE' : [59.80, 58.70, 58.00, 57.48, 57.35, 49.74, 49.30, 48.61, 48.30, 48.25],
'B' :  [0.0, 0.0, 0.0, 0.0, 0.0, 7000.0, 4500.0, 4100.0, 5000.0, 4600.0],
'S' :  [5300.0, 100.0, 2550.0, 1000.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0]}
df = pd.DataFrame(d)
df = df.loc[df.S != 0.0, :][::-1]
print(df)

res = 0
s = []

for i in df.index:
	if res > 3650:
		delta = 3650 - (res - df.loc[i+1, 'S'])
		p = (sum(s[:-1]) + df.loc[i+1, 'PRICE']*delta)/3650
		break
	elif res == 3650:
		p = (sum(s[:-1]) + df.loc[i+1, 'PRICE']*df.loc[i+1, 'S'])/3650
		break
	else:
		res += df.loc[i, 'S']
		s.append(df.loc[i, 'S'] * df.loc[i, 'PRICE'])

print(p)


# In[ ]:




