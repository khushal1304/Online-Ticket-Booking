<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Ticket Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'fade-in': 'fadeIn 0.6s ease-in-out',
                        'slide-up': 'slideUp 0.8s ease-out',
                        'pulse-soft': 'pulseSoft 2s infinite',
                        'float': 'float 3s ease-in-out infinite',
                        'shake': 'shake 0.5s ease-in-out',
                        'glow': 'glow 2s ease-in-out infinite alternate',
                        'aurora': 'aurora 8s ease-in-out infinite',
                        'shimmer': 'shimmer 2s linear infinite',
                        'bounce-in': 'bounceIn 0.8s ease-out',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0', transform: 'translateY(20px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' }
                        },
                        slideUp: {
                            '0%': { opacity: '0', transform: 'translateY(50px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' }
                        },
                        pulseSoft: {
                            '0%, 100%': { opacity: '1' },
                            '50%': { opacity: '0.8' }
                        },
                        float: {
                            '0%, 100%': { transform: 'translateY(0px)' },
                            '50%': { transform: 'translateY(-10px)' }
                        },
                        shake: {
                            '0%, 100%': { transform: 'translateX(0)' },
                            '10%, 30%, 50%, 70%, 90%': { transform: 'translateX(-5px)' },
                            '20%, 40%, 60%, 80%': { transform: 'translateX(5px)' }
                        },
                        glow: {
                            '0%': { boxShadow: '0 0 20px rgba(99, 102, 241, 0.4)' },
                            '100%': { boxShadow: '0 0 30px rgba(168, 85, 247, 0.6)' }
                        },
                        aurora: {
                            '0%, 100%': { transform: 'translateX(-100px) rotate(0deg)' },
                            '50%': { transform: 'translateX(100px) rotate(180deg)' }
                        },
                        shimmer: {
                            '0%': { transform: 'translateX(-100%)' },
                            '100%': { transform: 'translateX(100%)' }
                        },
                        bounceIn: {
                            '0%': { opacity: '0', transform: 'scale(0.3)' },
                            '50%': { opacity: '1', transform: 'scale(1.1)' },
                            '100%': { opacity: '1', transform: 'scale(1)' }
                        }
                    },
                    backgroundImage: {
                        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
                        'gradient-conic': 'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
                    }
                }
            }
        }
    </script>
    <style>
        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }
        ::-webkit-scrollbar-track {
            background: #1a1a2e;
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(45deg, #6366f1, #a855f7);
            border-radius: 3px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(45deg, #a855f7, #ec4899);
        }

        /* Modern glass morphism effect */
        .glass {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Floating particles background */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            display: block;
            pointer-events: none;
            width: 4px;
            height: 4px;
            background: rgba(99, 102, 241, 0.6);
            border-radius: 50%;
            animation: float-particles 20s infinite linear;
        }

        .particle:nth-child(2n) {
            background: rgba(168, 85, 247, 0.6);
            width: 3px;
            height: 3px;
        }

        .particle:nth-child(3n) {
            background: rgba(236, 72, 153, 0.6);
            width: 5px;
            height: 5px;
        }

        .particle:nth-child(4n) {
            background: rgba(59, 130, 246, 0.6);
            width: 2px;
            height: 2px;
        }
        
        @keyframes float-particles {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-10vh) rotate(360deg);
                opacity: 0;
            }
        }

        /* Loading spinner */
        .spinner {
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-top: 2px solid #ffffff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Modern gradient text */
        .modern-gradient-text {
            background: linear-gradient(135deg, #6366f1, #a855f7, #ec4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Neon glow effect */
        .neon-glow {
            box-shadow: 0 0 5px rgba(99, 102, 241, 0.5),
                        0 0 10px rgba(99, 102, 241, 0.5),
                        0 0 15px rgba(99, 102, 241, 0.5),
                        0 0 20px rgba(99, 102, 241, 0.5);
        }

        /* Aurora background effect */
        .aurora {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                transparent 30%, 
                rgba(99, 102, 241, 0.1) 50%, 
                transparent 70%);
            animation: aurora 8s ease-in-out infinite;
            z-index: -1;
        }

        /* Shimmer effect */
        .shimmer {
            position: relative;
            overflow: hidden;
        }

        .shimmer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.1),
                transparent
            );
            animation: shimmer 2s linear infinite;
        }

        /* Password strength indicator */
        .strength-bar {
            height: 4px;
            border-radius: 2px;
            transition: all 0.3s ease;
        }

        .strength-weak { background: linear-gradient(90deg, #ef4444, #f87171); }
        .strength-medium { background: linear-gradient(90deg, #f59e0b, #fbbf24); }
        .strength-strong { background: linear-gradient(90deg, #10b981, #34d399); }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 flex justify-center p-4 relative py-12">
    
    <div class="aurora"></div>
    
    <div class="particles">
        <span class="particle" style="left: 10%; animation-delay: 0s;"></span>
        <span class="particle" style="left: 20%; animation-delay: 2s;"></span>
        <span class="particle" style="left: 30%; animation-delay: 4s;"></span>
        <span class="particle" style="left: 40%; animation-delay: 6s;"></span>
        <span class="particle" style="left: 50%; animation-delay: 8s;"></span>
        <span class="particle" style="left: 60%; animation-delay: 10s;"></span>
        <span class="particle" style="left: 70%; animation-delay: 12s;"></span>
        <span class="particle" style="left: 80%; animation-delay: 14s;"></span>
        <span class="particle" style="left: 90%; animation-delay: 16s;"></span>
        <span class="particle" style="left: 15%; animation-delay: 18s;"></span>
        <span class="particle" style="left: 35%; animation-delay: 20s;"></span>
        <span class="particle" style="left: 55%; animation-delay: 22s;"></span>
        <span class="particle" style="left: 75%; animation-delay: 24s;"></span>
    </div>

    <div class="w-full max-w-lg animate-slide-up">
        <div class="text-center mb-8 animate-float">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full mb-4 backdrop-blur-sm animate-glow shimmer">
                <i class="fas fa-user-plus text-white text-2xl drop-shadow-lg"></i>
            </div>
            <h1 class="text-white text-2xl font-bold drop-shadow-lg">Ticket Booking</h1>
            <p class="text-gray-300 text-sm drop-shadow">Join our travel community</p>
        </div>

        <div class="glass rounded-2xl shadow-2xl p-8 animate-fade-in hover:shadow-3xl transition-all duration-300 border border-white/10">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold modern-gradient-text">
                    Create Account
                </h2>
                <p class="text-gray-300 mt-2 font-medium">Start your journey with us today</p>
            </div>

            <%-- Display error messages with animation --%>
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="bg-red-500/10 border border-red-500/20 text-red-300 px-4 py-3 rounded-lg mb-6 animate-shake backdrop-blur-sm" role="alert">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-triangle mr-2 text-red-400"></i>
                        <span class="font-medium"><%= errorMessage %></span>
                    </div>
                </div>
            <% } %>

            <form id="registerForm" action="register" method="post" class="space-y-6">
                <div class="group">
                    <label for="username" class="block text-gray-300 text-sm font-semibold mb-2 transition-colors group-focus-within:text-indigo-400">
                        <i class="fas fa-user mr-2 text-indigo-400"></i>Username
                    </label>
                    <div class="relative">
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            required 
                            class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm hover:bg-white/10 text-white placeholder-gray-400"
                            placeholder="Choose a unique username"
                        >
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-check text-green-400 hidden" id="usernameCheck"></i>
                        </div>
                    </div>
                </div>

                <div class="group">
                    <label for="email" class="block text-gray-300 text-sm font-semibold mb-2 transition-colors group-focus-within:text-indigo-400">
                        <i class="fas fa-envelope mr-2 text-indigo-400"></i>Email Address
                    </label>
                    <div class="relative">
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            required 
                            class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm hover:bg-white/10 text-white placeholder-gray-400"
                            placeholder="Enter your email address"
                        >
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-at text-gray-400 group-focus-within:text-indigo-400 transition-colors"></i>
                        </div>
                    </div>
                </div>

                <div class="group">
                    <label for="password" class="block text-gray-300 text-sm font-semibold mb-2 transition-colors group-focus-within:text-indigo-400">
                        <i class="fas fa-lock mr-2 text-indigo-400"></i>Password
                    </label>
                    <div class="relative">
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            required 
                            class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm hover:bg-white/10 text-white placeholder-gray-400"
                            placeholder="Create a strong password"
                            onkeyup="checkPasswordStrength()"
                        >
                        <button 
                            type="button" 
                            onclick="togglePassword('password')" 
                            class="absolute inset-y-0 right-0 pr-3 flex items-center"
                        >
                            <i id="passwordIcon" class="fas fa-eye-slash text-gray-400 hover:text-indigo-400 transition-colors"></i>
                        </button>
                    </div>
                    <div class="mt-2">
                        <div class="flex justify-between text-xs text-gray-400 mb-1">
                            <span>Password Strength</span>
                            <span id="strengthText">-</span>
                        </div>
                        <div class="w-full bg-gray-700 rounded-full h-1">
                            <div id="strengthBar" class="strength-bar w-0"></div>
                        </div>
                    </div>
                </div>

                <div class="group">
                    <label for="confirmPassword" class="block text-gray-300 text-sm font-semibold mb-2 transition-colors group-focus-within:text-indigo-400">
                        <i class="fas fa-lock mr-2 text-indigo-400"></i>Confirm Password
                    </label>
                    <div class="relative">
                        <input 
                            type="password" 
                            id="confirmPassword" 
                            name="confirmPassword" 
                            required 
                            class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm hover:bg-white/10 text-white placeholder-gray-400"
                            placeholder="Re-enter your password"
                            onkeyup="checkPasswordMatch()"
                        >
                        <button 
                            type="button" 
                            onclick="togglePassword('confirmPassword')" 
                            class="absolute inset-y-0 right-0 pr-3 flex items-center"
                        >
                            <i id="confirmPasswordIcon" class="fas fa-eye-slash text-gray-400 hover:text-indigo-400 transition-colors"></i>
                        </button>
                    </div>
                    <div id="passwordMatch" class="mt-1 text-xs hidden">
                        <span class="text-red-400">
                            <i class="fas fa-times mr-1"></i>Passwords don't match
                        </span>
                    </div>
                </div>

                <div class="flex items-start">
                    <div class="flex items-center h-5">
                        <input 
                            id="terms" 
                            name="terms" 
                            type="checkbox" 
                            required
                            class="rounded border-white/20 bg-white/5 text-indigo-600 shadow-sm focus:border-indigo-400 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                        >
                    </div>
                    <div class="ml-3 text-sm">
                        <label for="terms" class="text-gray-300">
                            I agree to the 
                            <a href="terms.jsp" class="text-indigo-400 hover:text-purple-400 transition-colors">Terms and Conditions</a> 
                            and 
                            <a href="privacy.jsp" class="text-indigo-400 hover:text-purple-400 transition-colors">Privacy Policy</a>
                        </label>
                    </div>
                </div>

                <button 
                    type="submit" 
                    id="submitBtn"
                    class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-4 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl flex items-center justify-center shadow-lg neon-glow shimmer"
                >
                    <span id="btnText">Create Account</span>
                    <span id="btnSpinner" class="spinner ml-2 hidden"></span>
                </button>

                <div class="mt-6">
                    <div class="relative">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-white/10"></div>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <p class="text-gray-400 text-sm">
                        Already have an account? 
                        <a href="login.jsp" class="text-indigo-400 hover:text-purple-400 font-semibold transition-colors hover:underline">
                            Sign in here
                        </a>
                    </p>
                </div>
            </form>
        </div>

        <div class="text-center mt-8">
            <p class="text-gray-400 text-xs drop-shadow">
                © 2025 Ticket Booking. All rights reserved.
            </p>
        </div>
    </div>

    <script>
        // Password visibility toggle
        function togglePassword(fieldId) {
            const passwordInput = document.getElementById(fieldId);
            const passwordIcon = document.getElementById(fieldId + 'Icon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                passwordIcon.classList.remove('fa-eye-slash');
                passwordIcon.classList.add('fa-eye');
            } else {
                passwordInput.type = 'password';
                passwordIcon.classList.remove('fa-eye');
                passwordIcon.classList.add('fa-eye-slash');
            }
        }

        // Password strength checker
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthBar = document.getElementById('strengthBar');
            const strengthText = document.getElementById('strengthText');
            
            let strength = 0;
            let feedback = '';

            if (password.length >= 8) strength++;
            if (password.match(/[a-z]/)) strength++;
            if (password.match(/[A-Z]/)) strength++;
            if (password.match(/[0-9]/)) strength++;
            if (password.match(/[^a-zA-Z0-9]/)) strength++;

            switch (strength) {
                case 0:
                case 1:
                case 2:
                    strengthBar.className = 'strength-bar w-1/3 strength-weak';
                    strengthText.textContent = 'Weak';
                    strengthText.className = 'text-red-400';
                    break;
                case 3:
                case 4:
                    strengthBar.className = 'strength-bar w-2/3 strength-medium';
                    strengthText.textContent = 'Medium';
                    strengthText.className = 'text-yellow-400';
                    break;
                case 5:
                    strengthBar.className = 'strength-bar w-full strength-strong';
                    strengthText.textContent = 'Strong';
                    strengthText.className = 'text-green-400';
                    break;
                default:
                    strengthBar.className = 'strength-bar w-0';
                    strengthText.textContent = '-';
                    strengthText.className = 'text-gray-400';
            }
        }

        // Password match checker
        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const matchIndicator = document.getElementById('passwordMatch');

            if (confirmPassword.length > 0) {
                if (password === confirmPassword) {
                    matchIndicator.innerHTML = '<span class="text-green-400"><i class="fas fa-check mr-1"></i>Passwords match</span>';
                    matchIndicator.classList.remove('hidden');
                } else {
                    matchIndicator.innerHTML = '<span class="text-red-400"><i class="fas fa-times mr-1"></i>Passwords don\'t match</span>';
                    matchIndicator.classList.remove('hidden');
                }
            } else {
                matchIndicator.classList.add('hidden');
            }
        }

        // Form submission with loading state
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const terms = document.getElementById('terms').checked;
            
            // Validate password match
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return;
            }
            
            // Validate terms acceptance
            if (!terms) {
                e.preventDefault();
                alert('Please accept the terms and conditions!');
                return;
            }

            const submitBtn = document.getElementById('submitBtn');
            const btnText = document.getElementById('btnText');
            const btnSpinner = document.getElementById('btnSpinner');
            
            // Show loading state
            submitBtn.disabled = true;
            btnText.textContent = 'Creating Account...';
            btnSpinner.classList.remove('hidden');
            submitBtn.classList.add('opacity-75');
        });

        // Add floating animation to input focus
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('animate-pulse-soft');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('animate-pulse-soft');
            });
        });

        // Add ripple effect to buttons
        document.querySelectorAll('button').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.classList.add('ripple');
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Auto-hide alerts after 5 seconds
        setTimeout(() => {
            document.querySelectorAll('[role="alert"]').forEach(alert => {
                alert.style.transition = 'opacity 0.5s ease-out';
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            });
        }, 5000);

        // Enhanced glow effect on hover
        document.querySelector('.glass').addEventListener('mouseenter', function() {
            this.style.boxShadow = '0 25px 50px rgba(99, 102, 241, 0.15), 0 0 0 1px rgba(255, 255, 255, 0.05)';
            this.style.background = 'rgba(255, 255, 255, 0.08)';
        });

        document.querySelector('.glass').addEventListener('mouseleave', function() {
            this.style.boxShadow = '';
            this.style.background = 'rgba(255, 255, 255, 0.05)';
        });

        // Username availability check (placeholder)
        document.getElementById('username').addEventListener('blur', function() {
            const username = this.value;
            const checkIcon = document.getElementById('usernameCheck');
            
            if (username.length >= 3) {
                // Simulate username check
                setTimeout(() => {
                    checkIcon.classList.remove('hidden');
                    checkIcon.classList.add('animate-bounce-in');
                }, 500);
            } else {
                checkIcon.classList.add('hidden');
            }
        });
    </script>

    <style>
        /* Ripple effect with modern colors */
        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(99, 102, 241, 0.3);
            transform: scale(0);
            animation: ripple-animation 0.6s ease-out;
            pointer-events: none;
        }

        @keyframes ripple-animation {
            to {
                transform: scale(2);
                opacity: 0;
            }
        }

        /* Smooth transitions for all interactive elements */
        * {
            transition: all 0.3s ease;
        }

        /* Enhanced focus states with modern colors */
        input:focus, button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.3);
        }

        /* Responsive adjustments */
        @media (max-width: 640px) {
            .glass {
                margin: 1rem;
                padding: 1.5rem;
            }
        }

        /* Custom modern hover effects */
        .glass:hover {
            transform: translateY(-2px);
        }

        /* Enhanced background effects */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(99, 102, 241, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(168, 85, 247, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(236, 72, 153, 0.1) 0%, transparent 50%);
            z-index: -2;
        }
    </style>
</body>
</html>