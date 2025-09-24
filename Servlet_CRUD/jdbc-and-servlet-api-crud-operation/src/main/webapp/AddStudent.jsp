<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Student</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}


.registration-container {
	background: rgba(20, 20, 20, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	padding: 40px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
	border: 1px solid rgba(255, 255, 255, 0.1);
	width: 100%;
	max-width: 500px;
	animation: slideIn 0.6s ease-out;
}

@
keyframes slideIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.form-title {
	text-align: center;
	margin-bottom: 30px;
	color: #ffffff;
	font-size: 2.2em;
	font-weight: 300;
	letter-spacing: 1px;
}

.form-group {
	margin-bottom: 25px;
	position: relative;
}

.form-row {
	display: flex;
	gap: 15px;
}

.form-row .form-group {
	flex: 1;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #e0e0e0;
	font-weight: 500;
	font-size: 0.9em;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

input[type="text"], input[type="email"], input[type="password"], input[type="tel"],
	input[type="date"], input[type="number"], select {
	width: 100%;
	padding: 15px 20px;
	background: rgba(255, 255, 255, 0.05);
	border: 2px solid rgba(255, 255, 255, 0.1);
	border-radius: 12px;
	color: #ffffff;
	font-size: 1em;
	transition: all 0.3s ease;
	outline: none;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus,
	input[type="tel"]:focus, input[type="date"]:focus, input[type="number"]:focus,
	select:focus {
	border-color: #666666;
	background: rgba(255, 255, 255, 0.1);
	box-shadow: 0 0 20px rgba(102, 102, 102, 0.3);
	transform: translateY(-2px);
}

select {
	cursor: pointer;
}

select option {
	background: #2a2a2a;
	color: #ffffff;
}

input[type="number"] {
	background: rgba(255, 255, 255, 0.03);
	cursor: not-allowed;
}

.submit-btn {
	width: 100%;
	padding: 18px;
	background: linear-gradient(135deg, #333333, #555555);
	border: none;
	border-radius: 12px;
	color: #ffffff;
	font-size: 1.1em;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 1px;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-top: 20px;
	position: relative;
	overflow: hidden;
}

.submit-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 30px rgba(85, 85, 85, 0.4);
	background: linear-gradient(135deg, #444444, #666666);
}

.submit-btn:active {
	transform: translateY(-1px);
}

.submit-btn::before {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2),
		transparent);
	transition: left 0.5s;
}

.submit-btn:hover::before {
	left: 100%;
}

/* Responsive Design */
@media ( max-width : 600px) {
	.registration-container {
		padding: 30px 25px;
		margin: 10px;
	}
	.form-row {
		flex-direction: column;
		gap: 0;
	}
	.form-title {
		font-size: 1.8em;
	}
}

/* Custom scrollbar for webkit browsers */
::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	background: rgba(255, 255, 255, 0.1);
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	background: #666666;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #777777;
}
</style>
</head>
<body>
	<div class="registration-container">
		<h1 class="form-title">Add New Student</h1>
		<form id="registrationForm" action="addStudent" method="get"
			novalidate>
			<div class="form-group">
				<label for="id">User ID</label> <input type="text" id="id" name="id"
					required>
			</div>

			<div class="form-group">
				<label for="name">Full Name</label> <input type="text" id="name"
					name="name" required>
			</div>

			<div class="form-group">
				<label for="email">Email Address</label> <input type="email"
					id="email" name="email" required>
			</div>

			<div class="form-group">
				<label for="password">Create New Password</label> <input
					type="password" id="password" name="password" required>
			</div>

			<div class="form-group">
				<label for="phone">Phone Number</label> <input type="tel" id="phone"
					name="phone" required>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="dob">Date of Birth</label> <input type="date" id="dob"
						name="dob" required>
				</div>
				<div class="form-group">
					<label for="age">Age</label> <input type="number" id="age"
						name="age" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="gender">Gender</label> <select id="gender" name="gender"
					required>
					<option value="">Select Gender</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="other">Other</option>
					<option value="prefer-not-to-say">Prefer not to say</option>
				</select>
			</div>

			<button type="submit" class="submit-btn">ADD STUDENT</button>
		</form>
	</div>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const dobInput = document.getElementById("dob");
        const ageInput = document.getElementById("age");

        dobInput.addEventListener("change", function () {
            if (dobInput.value) {
                const today = new Date();
                const dob = new Date(dobInput.value);

                let age = today.getFullYear() - dob.getFullYear();
                const m = today.getMonth() - dob.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
                    age--;
                }

                ageInput.value = age;
            } else {
                ageInput.value = "";
            }
        });
    });
</script>

</body>
</html>