import React, { useState } from 'react';
import axios from 'axios';

function FileUpload() {
  const [selectedFile, setSelectedFile] = useState(null);
  const [data, setData] = useState([]);

  const handleFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
  };

  const handleImportClick = () => {
    if (!selectedFile) {
      alert('Please select a file to import.');
      return;
    }

    const formData = new FormData();
    formData.append('file', selectedFile);

    axios.post('http://localhost:3000/upload', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    }).then(response => {
      setData(response.data);
      alert('File uploaded successfully.');
    }).catch(error => {
      console.error('Error uploading file:', error);
      alert('Error uploading file. Please try again.');
    });
  };

  const handleExportClick = () => {
    axios.get('http://localhost:3000/export', {
      responseType: 'blob' // Set responseType to 'blob' to receive binary data
    })
    .then(response => {
      const blob = new Blob([response.data], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
      const url = window.URL.createObjectURL(blob);
      const link = document.createElement('a');
      link.href = url;
      link.download = 'products.xlsx';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    })
    .catch(error => {
      console.error('Error exporting data:', error);
    });
  };

  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-md-6">
          <div className="input-group">
            <div className="custom-file">
              <input type="file" className="custom-file-input" id="inputGroupFile" onChange={handleFileChange} />
              <label className="custom-file-label" htmlFor="inputGroupFile">Choose file</label>
            </div>
            <div className="input-group-append">
              <button className="btn btn-primary" type="button" onClick={handleImportClick}>Import</button>
            </div>
          </div>
        </div>
        <div className="col-md-6">
          <button className="btn btn-success" onClick={handleExportClick}>Export Data</button>
        </div>
      </div>
      {data.length > 0 && (
        <div className="row mt-4">
          <div className="col">
            <table className="table table-striped">
              <thead className="thead-dark">
                <tr>
                  {Object.keys(data[0]).map(key => (
                    <th key={key}>{key}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {data.map((item, index) => (
                  <tr key={index}>
                    {Object.values(item).map((value, index) => (
                      <td key={index}>{value}</td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}

export default FileUpload;
