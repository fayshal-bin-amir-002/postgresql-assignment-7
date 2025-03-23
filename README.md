- What is PostgreSQL?
  PostgreSQL হলো একটি ওপেন-সোর্স, রিলেশনাল ডাটাবেস ম্যানেজমেন্ট
  সিস্টেম (RDBMS)। এটি SQL এবং JSON উভয়ই সাপোর্ট করে। এটি ডেটা সংরক্ষণ, পরিচালনা এবং বিশ্লেষণের জন্য ব্যবহৃত হয়।

- What is the purpose of a database schema in PostgreSQL?
  ডাটাবেস স্কিমা হলো একটি লজিক্যাল স্ট্রাকচার যা ডাটাবেসের টেবিল, ভিউ, ইনডেক্স, ফাংশন এবং অন্যান্য অবজেক্টগুলোকে একত্র করে ডাটাবেজের বিভিন্ন কাজ করতে সাহায্য করে। একই ডাটাবেসে একাধিক স্কিমা তৈরি করে ডাটা ম্যানেজমেন্টকে সহজ করে তোলে।

- Explain the Primary Key and Foreign Key concepts in PostgreSQL.
  ✅ Primary Key:
  একটি টেবিলের প্রাইমারি কী (Primary Key) হলো এমন একটি কলাম বা কলামের সমষ্টি যা প্রতিটি সারিকে অন্যসব সারি থেকে আলাদা (Unique) ভাবে প্রেজেন্ট করে এবং এটি শূন্য / (NULL) হতে পারে না। এটি দিয়ে কোন নির্দিষ্ট সারিকে খুব সহজেই বের করা যায়।
  ✅ Foreign Key:
  ফরেন কী (Foreign Key) হল এমন একটি কলাম যা অন্য একটি টেবিলের প্রাইমারি কী। এটি টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে এবং রেফারেন্সিয়াল ইন্টিগ্রিটি বজায় রাখে।

- What is the difference between the VARCHAR and CHAR data types?
  ✅VARCHAR:
  ১। নির্দিষ্ট দৈর্ঘ্যের ফিক্সড সাইজ স্ট্রিং সংরক্ষণ করে না করে এটি ডাইনামিক সাইজের স্ট্রিং সংরক্ষণ করে।
  ২। সাইজের তুলনার ডাটা ছোট হইলেও সমস্যা নেই, কারণ এটি সম্পূন জায়গা দখল করে না।
  ✅CHAR:
  ১। নির্দিষ্ট দৈর্ঘ্যের ফিক্সড সাইজ স্ট্রিং সংরক্ষণ করে।
  ২। সাইজের তুলনার ডাটা ছোট হইলেও এটি সম্পূন জায়গা দখল করে।

- Explain the purpose of the WHERE clause in a SELECT statement.
  WHERE clause নির্দিষ্ট শর্ত অনুযায়ী ডাটা ফিল্টার করতে ব্যবহৃত হয়। এটি শুধুমাত্র ঐসব সারি বা ডাটা রিটার্ন করবে, যেগুলো নির্দিষ্ট শর্ত পূরণ করবে।

- What are the LIMIT and OFFSET clauses used for?
  ✅ LIMIT: নির্দিষ্ট সংখ্যাক ডাটা পেতে এটি ব্যবহৃত হয়।
  ✅ OFFSET: নির্দিষ্ট সংখ্যক সারি বাদ দিয়ে পরবর্তী সারিগুলো পেতে এটি ব্যবহৃত হয়।

- How can you modify data using UPDATE statements?
  UPDATE statement ব্যবহার করে টেবিলের উপস্থিত ডাটা পরিবর্তন করা যায়। যেমনঃ

  ```bash
  UPDATE books
    SET price = price + ((price * 10) / 100)
    WHERE published_year::INTEGER < 2000;
  ```

- What is the significance of the JOIN operation, and how does it work in PostgreSQL?
  JOIN বিভিন্ন টেবিলের ডাটা একত্রিত (combine) করতে ব্যবহৃত হয়। যদি কোন টেবিলে Foreign Key থাকে তাহলে সেই Foreign Key দিয়ে ওই টেবিলে সব ডাটা দেখা যাবে।
  ✅ JOIN-এর প্রকারভেদ:
  ১। INNER JOIN → শুধু মাত্র যেসব ডাটার মিল আছে ওইসব ডাটা রিটার্ন করে।
  ২। LEFT JOIN → বাম টেবিলের সব ডাটা ও ডান টেবিলের যেসব ডাটার মিল আছে ওইসব রিটার্ন করে।
  ৩। RIGHT JOIN → ডান টেবিলের সব ডাটা ও বাম টেবিলের যেসব ডাটার মিল আছে ওইসব রিটার্ন করে।
  ৪। FULL JOIN → উভয় টেবিলের সব ডাটা রিটার্ন করে।

- Explain the GROUP BY clause and its role in aggregation operations.
  GROUP BY এক বা একাধিক কলামের ভিত্তিতে ডাটাগুলো গ্রুপ করতে ব্যবহৃত হয়। এটি সাধারণত aggregate functions যেমন sum(), count(), avg() এসব এর সাথে ব্যবহৃত হয়।

- How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
  ✅ COUNT() → কোন টেবিলের মোট রেকর্ড সংখ্যা গণনা করতে ব্যবহৃত হয়।
  ✅ SUM() → কোন টেবিলের নির্দিষ্ট একটি কলামের সমস্ত ডাটার যোগফল দেয়।
  ✅ AVG() → কোন টেবিলের নির্দিষ্ট একটি ডাটার উপর ভিত্তি করে গড় মান নির্ণয় করে।
