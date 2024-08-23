import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { FaStarAndCrescent } from "react-icons/fa";
import { MdEmail } from "react-icons/md";
import { MdDriveFileRenameOutline } from "react-icons/md";
import { TbBrandCashapp } from "react-icons/tb";
import { TbCategory } from "react-icons/tb";
import { IoLogOut } from "react-icons/io5";
import { CiEdit } from "react-icons/ci";
import { HiUsers } from "react-icons/hi";
const EmployeeDetail = () => {
  const [employee, setEmployee] = useState([]);
  const [admins, setAdmins] = useState([])
  const [name, setName] = useState([]);
  const { id } = useParams();
  const navigate = useNavigate();
  const AdminRecords = () => {
    axios.get('http://localhost:3000/auth/admin_records')
    .then(result => {
      if(result.data.Status) {
        setAdmins(result.data.Result)
      } else {
         alert(result.data.Error)
      }
    })
  }
  useEffect(() => {
    AdminRecords();
    axios
      .get("http://localhost:3000/employee/detail/" + id)
      .then((result) => {
        setEmployee(result.data[0]);
        axios.get('http://localhost:3000/category/name/'+result.data[0].category_id)
        .then(res => {
            setName(res.data[0])
            console.log(res.data)
        })
        .catch(err => console.log(err))
      })
      .catch((err) => console.log(err));

      
  }, []);
  const handleLogout = () => {
    axios
      .get("http://localhost:3000/employee/logout")
      .then((result) => {
        if (result.data.Status) {
          localStorage.removeItem("valid");
          navigate("/");
        }
      })
      .catch((err) => console.log(err));
  };
  return (
    <div>
      <div className="col p-0 m-0">
        <p className="p-2 d-flex justify-content-center shadow text-dark navbar">
        Crescent HR Management System<FaStarAndCrescent />
        </p>
      </div>
      <div className="d-flex justify-content-center flex-column align-items-center mt-3">
        <img
          src={`http://localhost:3000/Images/` + employee.image}
          className="emp_det_image"
        />
        <div className="d-flex align-items-center flex-column mt-3">
          <h3><MdDriveFileRenameOutline/> Name: {employee.name}</h3>
          <h3><MdEmail/> Email: {employee.email}</h3>
          <h3><TbBrandCashapp/> Salary: ${employee.salary}</h3>
          <h3><TbCategory/> Field: {name.name}</h3>
        </div>
        <div>
          <button className="btn bn me-2">Edit <span><CiEdit/></span></button>
          <button className="btn bn" onClick={handleLogout}>
            Logout <span><IoLogOut/></span>
          </button>
        </div>
        <div>
          <h4 p-2 d-flex justify-content-center shadow text-dark >For any queries or leave request, please contact following admins through their emails:</h4>
        </div>
        <div className='mt-2 px-5 pt-1'>
          <h3><HiUsers/> List of Admins</h3>
          <table className='table'>
            <thead>
              <tr>
                <th>Emails</th>
              </tr>
            </thead>
            <tbody>
              {
                admins.map(a => (
                  <tr>
                    <td>{a.email}</td>
                  </tr>
                ))
              }
            </tbody>
          </table>
      </div>
      </div>
    </div>
  );
};

export default EmployeeDetail;
