const express = require('express');
const multer = require('multer');
const xlsx = require('xlsx');
const connectDatabase = require('./models/index');
const cors = require('cors');
const nodemailer = require('nodemailer');

const app = express();
app.use(cors());
const port = 3000;
let countEmail = 0;

const upload = multer({ dest: 'uploads/' });

app.post('/upload', upload.single('file'), async (req, res) => {
    try {
        const filePath = req.file.path;
        const workbook = xlsx.readFile(filePath);
        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];
        const data = xlsx.utils.sheet_to_json(worksheet);

        const connection = connectDatabase();

        for (const item of data) {
            const { productname, sku, variantid, price, discountpercentage, description, categoryid } = item;
            const query = `INSERT INTO products (productname, sku, variantid, price, discountpercentage, description, categoryid) 
                           VALUES (?, ?, ?, ?, ?, ?, ?)`;
            connection.query(query, [productname, sku, variantid, price, discountpercentage, description, categoryid], (err, result) => {
                if (err) {
                    console.error('Error inserting product:', err);
                } else {
                    console.log('Product inserted:', result.insertId);
                }
            });
        }
        countEmail++;
        const transporter = nodemailer.createTransport({
            host: 'smtp.gmail.com',
            port: 587,
            secure: false,
            auth: {
                user: 'pchauhan.netclues@gmail.com', // Your email address
                pass: 'onwv plux ziqr qbch' // Your email password
            }
        });

        const mailOptions = {
            from: 'pchauhan.netclues@gmail.com',
            to: 'prch2103@gmail.com',
            subject: 'Import operation completed',
            text: 'The import operation has been completed '+ countEmail
        };

        transporter.sendMail(mailOptions, (error, info) => {

            connection.query('INSERT INTO emailcounter (counter) VALUES (?)', [countEmail], (err, result) => {
                if (err) {
                    console.error('Error inserting into database:', err);
                } else {
                    console.log('Email sending data inserted into database',result);
                }
            })
        });

        res.json({ message: `${data.length} products inserted into the database` });
    } catch (err) {
        console.error('Error uploading file:', err);
        res.status(500).json({ error: 'Internal server error' });
    }
});

app.get('/export', async (req, res) => {
    try {
        const connection = connectDatabase();
        const query = `SELECT productname, description, price, sku, discountpercentage FROM products`;
        connection.query(query, (err, results) => {
            if (err) {
                console.error('Error fetching products:', err);
                res.status(500).json({ error: 'Internal server error' });
                return;
            }

            const data = results.map(({ productname, description, price, sku, discountpercentage }) => ({
                productName: productname,
                description: description,
                price: price,
                sku: sku,
                discountPercentage: discountpercentage
            }));

            const worksheet = xlsx.utils.json_to_sheet(data);
            const workbook = xlsx.utils.book_new();
            xlsx.utils.book_append_sheet(workbook, worksheet, 'Products');

            const excelBuffer = xlsx.write(workbook, { bookType: 'xlsx', type: 'buffer' });

            res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            res.setHeader('Content-Disposition', 'attachment; filename=products.xlsx');
            res.send(excelBuffer);
        });
    } catch (error) {
        console.error('Error exporting data:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// app.get('/export', async (req, res) => {
//     try {
//         const connection = connectDatabase();
//         const query = `SELECT p.productname, p.description, p.price, p.sku, p.discountpercentage, p.categoyid 
//                        FROM products p 
//                        INNER JOIN category c ON p.categoryid = c.categoryid`;
//         connection.query(query, (err, results) => {
//             if (err) {
//                 console.error('Error fetching products:', err);
//                 res.status(500).json({ error: 'Internal server error' });
//                 return;
//             }

//             const data = results.map(({ productname, description, price, sku, discountpercentage, category_name }) => ({
//                 productName: productname,
//                 description: description,
//                 price: price,
//                 sku: sku,
//                 discountPercentage: discountpercentage,
//                 categoryName: category_name
//             }));

//             const worksheet = xlsx.utils.json_to_sheet(data);
//             const workbook = xlsx.utils.book_new();
//             xlsx.utils.book_append_sheet(workbook, worksheet, 'Products');

//             const excelBuffer = xlsx.write(workbook, { bookType: 'xlsx', type: 'buffer' });

//             res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//             res.setHeader('Content-Disposition', 'attachment; filename=products.xlsx');
//             res.send(excelBuffer);
//         });
//     } catch (error) {
//         console.error('Error exporting data:', error);
//         res.status(500).json({ error: 'Internal server error' });
//     }
// });

app.listen(port, () => {
    console.log(`Server is listening at http://localhost:${port}`);
});
