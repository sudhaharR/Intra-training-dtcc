

### 1. Average number of monthly transactions

**With Numpy**

```
df["monthly_transactions"].mean()
```

**Without Numpy**

```
total = 0

for value in df["monthly_transactions"]:
    total += value

average = total / len(df["monthly_transactions"])
print(average)
```

### 2. Total balance across all records

**With Numpy**

```
df["total_balance_usd"].sum()
```

**Without Numpy**

```
total = 0

for value in df["total_balance_usd"]:
    total += value

print(total)
```

### 3. Unique cities in the dataset

**With Numpy**

```
df["city"].unique()
```

**Without Numpy**

```
cities = []

for city in df["city"]:
    if city not in cities:
        cities.append(city)

print(cities)
```

