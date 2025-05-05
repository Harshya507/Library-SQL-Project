-- Create Tables
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Available BOOLEAN
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert Sample Data
INSERT INTO Books VALUES (1, 'The Alchemist', 'Paulo Coelho', TRUE);
INSERT INTO Books VALUES (2, 'Wings of Fire', 'A.P.J. Abdul Kalam', TRUE);

INSERT INTO Members VALUES (1, 'Harsh Patil', 'harsh@example.com');
INSERT INTO Members VALUES (2, 'Riya Sharma', 'riya@example.com');

INSERT INTO BorrowedBooks VALUES (101, 1, 1, '2025-05-01', NULL);

-- Update Availability
UPDATE Books SET Available = FALSE WHERE BookID = 1;

-- Sample Query: Show borrowed books
SELECT m.Name, b.Title, bb.BorrowDate
FROM BorrowedBooks bb
JOIN Members m ON bb.MemberID = m.MemberID
JOIN Books b ON bb.BookID = b.BookID;

-- Sample Query: List all available books
SELECT Title FROM Books WHERE Available = TRUE;
