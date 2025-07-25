<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Ticket Booking</title>
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

    <div class="w-full max-w-md animate-slide-up">
        <div class="text-center mb-8 animate-float">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full mb-4 backdrop-blur-sm animate-glow shimmer">
                <i class="fas fa-ticket-alt text-white text-2xl drop-shadow-lg"></i>
            </div>
            <h1 class="text-white text-2xl font-bold drop-shadow-lg">Ticket Booking</h1>
            <p class="text-gray-300 text-sm drop-shadow">Your premium travel experience</p>
        </div>

        <div class="glass rounded-2xl shadow-2xl p-8 animate-fade-in hover:shadow-3xl transition-all duration-300 border border-white/10">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold modern-gradient-text">
                    Welcome Back!
                </h2>
                <p class="text-gray-300 mt-2 font-medium">Sign in to continue your journey</p>
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

            <%-- Display success/status messages with animation --%>
            <% 
                String status = request.getParameter("status");
                if ("regsuccess".equals(status)) {
            %>
                <div class="bg-green-500/10 border border-green-500/20 text-green-300 px-4 py-3 rounded-lg mb-6 animate-fade-in backdrop-blur-sm" role="alert">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle mr-2 text-green-400"></i>
                        <span class="font-medium">Registration successful! Please login.</span>
                    </div>
                </div>
            <% } else if ("logout".equals(status)) { %>
                <div class="bg-blue-500/10 border border-blue-500/20 text-blue-300 px-4 py-3 rounded-lg mb-6 animate-fade-in backdrop-blur-sm" role="alert">
                    <div class="flex items-center">
                        <i class="fas fa-info-circle mr-2 text-blue-400"></i>
                        <span class="font-medium">You have been logged out successfully.</span>
                    </div>
                </div>
            <% } %>

            <form id="loginForm" action="login" method="post" class="space-y-6">
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
                            <i class="fas fa-user text-gray-400 group-focus-within:text-indigo-400 transition-colors"></i>
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
                            placeholder="Enter your password"
                        >
                        <button 
                            type="button" 
                            onclick="togglePassword()" 
                            class="absolute inset-y-0 right-0 pr-3 flex items-center"
                        >
                            <i id="passwordIcon" class="fas fa-eye-slash text-gray-400 hover:text-indigo-400 transition-colors"></i>
                        </button>
                    </div>
                </div>

                <div class="flex items-center justify-between text-sm">
                    <label class="flex items-center">
                        <input type="checkbox" class="rounded border-white/20 bg-white/5 text-indigo-600 shadow-sm focus:border-indigo-400 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                        <span class="ml-2 text-gray-300 font-medium">Remember me</span>
                    </label>
                </div>

                <button 
                    type="submit" 
                    id="submitBtn"
                    class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-4 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl flex items-center justify-center shadow-lg neon-glow shimmer"
                >
                    <span id="btnText">Sign In</span>
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
                        Don't have an account? 
                        <a href="register.jsp" class="text-indigo-400 hover:text-purple-400 font-semibold transition-colors hover:underline">
                            Create one now
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
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const passwordIcon = document.getElementById('passwordIcon');
            
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

        // Form submission with loading state
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            const btnText = document.getElementById('btnText');
            const btnSpinner = document.getElementById('btnSpinner');
            
            // Show loading state
            submitBtn.disabled = true;
            btnText.textContent = 'Signing In...';
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

        // Add keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Enter' && e.target.tagName !== 'BUTTON') {
                const form = document.getElementById('loginForm');
                if (form.checkValidity()) {
                    form.submit();
                }
            }
        });

        // Add enhanced glow effect on hover
        document.querySelector('.glass').addEventListener('mouseenter', function() {
            this.style.boxShadow = '0 25px 50px rgba(99, 102, 241, 0.15), 0 0 0 1px rgba(255, 255, 255, 0.05)';
            this.style.background = 'rgba(255, 255, 255, 0.08)';
        });

        document.querySelector('.glass').addEventListener('mouseleave', function() {
            this.style.boxShadow = '';
            this.style.background = 'rgba(255, 255, 255, 0.05)';
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