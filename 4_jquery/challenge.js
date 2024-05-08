let allAuthors = [];
const books = [
  { 
    title: "The Great Gatsby", 
    author: "F. Scott Fitzgerald", 
    pages: 180, 
    year: 1925, 
    isbn: "9780743273565" 
  },
  { 
    title: "To Kill a Mockingbird", 
    author: "Harper Lee", 
    pages: 281, 
    year: 1960, 
    isbn: "9780061120084" 
  },
  { 
    title: "1984", 
    author: "George Orwell", 
    pages: 328, 
    year: 1949, 
    isbn: "9780451524935" 
  }
];

// Write a function here
function getInventory(books) {
//   code here...
    const inventory = {
    totalBooks: books.length,
    totalPages: 0,
    authors: [],
    oldestBook: null,
    newestBook: null,
  };

  for (const book of books) {
    inventory.totalPages += book.pages;

    if (!allAuthors.includes(book.author)) {
      allAuthors.push(book.author);
    }
    if (!inventory.oldestBook || (book.year < inventory.oldestBook.year)) {
      inventory.oldestBook = book;
    }
    if (!inventory.newestBook || (book.year > inventory.newestBook.year)) {
      inventory.newestBook = book;
    }
  }

  return inventory;
  }

console.log(getInventory(books));