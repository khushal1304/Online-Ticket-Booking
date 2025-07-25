<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.booking.model.User" %>
<%
    // Security Check
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Retrieve booking details from request attributes
    String movieTitle = (String) request.getAttribute("movieTitle");
    Integer numTickets = (Integer) request.getAttribute("numTickets");
    String showTime = (String) request.getAttribute("showTime");
    Double totalPrice = (Double) request.getAttribute("totalPrice");
    
    // If attributes are null (e.g., user directly navigates here), redirect
    if (movieTitle == null || numTickets == null) {
        // Mock data for direct access/testing
        movieTitle = "Galaxy Quest";
        numTickets = 2;
        showTime = "09:30 PM";
        totalPrice = 550.00;
        // In production, you'd redirect:
        // response.sendRedirect("dashboard.jsp");
        // return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation - MovieTime</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'fade-in': 'fadeIn 0.6s ease-in-out',
                        'slide-up': 'slideUp 0.8s ease-out',
                        'bounce-in': 'bounceIn 1s ease-out',
                        'pulse-soft': 'pulseSoft 2s infinite',
                        'float': 'float 3s ease-in-out infinite',
                        'glow': 'glow 2s ease-in-out infinite alternate',
                        'aurora': 'aurora 8s ease-in-out infinite',
                        'shimmer': 'shimmer 2s linear infinite',
                        'confetti': 'confetti 3s ease-out infinite',
                        'success-pulse': 'successPulse 2s ease-in-out infinite',
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
                        bounceIn: {
                            '0%': { opacity: '0', transform: 'scale(0.3)' },
                            '50%': { opacity: '1', transform: 'scale(1.1)' },
                            '70%': { transform: 'scale(0.9)' },
                            '100%': { opacity: '1', transform: 'scale(1)' }
                        },
                        pulseSoft: {
                            '0%, 100%': { opacity: '1' },
                            '50%': { opacity: '0.8' }
                        },
                        float: {
                            '0%, 100%': { transform: 'translateY(0px)' },
                            '50%': { transform: 'translateY(-10px)' }
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
                        confetti: {
                            '0%': { transform: 'translateY(0) rotate(0deg)' },
                            '100%': { transform: 'translateY(-20px) rotate(180deg)' }
                        },
                        successPulse: {
                            '0%, 100%': { transform: 'scale(1)', boxShadow: '0 0 20px rgba(34, 197, 94, 0.5)' },
                            '50%': { transform: 'scale(1.05)', boxShadow: '0 0 30px rgba(34, 197, 94, 0.8)' }
                        }
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

        /* Modern gradient text */
        .modern-gradient-text {
            background: linear-gradient(135deg, #6366f1, #a855f7, #ec4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .success-gradient-text {
            background: linear-gradient(135deg, #10b981, #34d399, #6ee7b7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
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

        /* Success icon styling */
        .success-icon {
            background: linear-gradient(135deg, #10b981, #34d399);
            animation: successPulse 2s ease-in-out infinite;
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

        /* Confetti particles */
        .confetti-particle {
            position: absolute;
            width: 6px;
            height: 6px;
            background: linear-gradient(45deg, #6366f1, #a855f7, #ec4899);
            animation: confetti 3s ease-out infinite;
        }

        /* Ticket styling */
        .ticket-card {
            background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(52, 211, 153, 0.1));
            border: 1px solid rgba(16, 185, 129, 0.2);
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
    </div>

    <div class="confetti-particle" style="left: 20%; top: 20%; animation-delay: 0.5s;"></div>
    <div class="confetti-particle" style="left: 80%; top: 30%; animation-delay: 1s;"></div>
    <div class="confetti-particle" style="left: 60%; top: 10%; animation-delay: 1.5s;"></div>
    <div class="confetti-particle" style="left: 30%; top: 80%; animation-delay: 2s;"></div>
    <div class="confetti-particle" style="left: 70%; top: 70%; animation-delay: 2.5s;"></div>

    <div class="w-full max-w-2xl animate-slide-up">
        <div class="text-center mb-8 animate-bounce-in">
            <div class="inline-flex items-center justify-center w-24 h-24 success-icon rounded-full mb-4">
                <i class="fas fa-check text-white text-4xl"></i>
            </div>
            <div class="space-y-2">
                <h1 class="text-4xl md:text-5xl font-bold success-gradient-text">Booking Confirmed!</h1>
                <p class="text-gray-300 text-lg">Thank you, <span class="text-indigo-400 font-semibold"><%= user.getUsername() %></span>! Your cinema experience awaits.</p>
            </div>
        </div>

        <div class="glass rounded-2xl shadow-2xl p-8 animate-fade-in hover:shadow-3xl transition-all duration-300 border border-white/10 mb-8">
            <div class="text-center mb-8">
                <div class="inline-flex items-center space-x-3 mb-4">
                    <div class="w-10 h-10 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center">
                        <i class="fas fa-film text-white"></i>
                    </div>
                    <h2 class="text-2xl font-bold modern-gradient-text">MovieTime Ticket</h2>
                </div>
                <div class="w-32 h-1 bg-gradient-to-r from-indigo-500 to-purple-600 mx-auto rounded-full"></div>
            </div>
            
            <div class="ticket-card rounded-xl p-6 backdrop-blur-sm">
                <h3 class="text-xl font-semibold text-white mb-6 flex items-center">
                    <i class="fas fa-receipt mr-3 text-green-400"></i>
                    Booking Summary
                </h3>
                
                <div class="space-y-4">
                    <div class="flex items-center justify-between py-3 border-b border-white/10">
                        <div class="flex items-center space-x-3">
                            <i class="fas fa-film text-indigo-400"></i>
                            <span class="text-gray-300 font-medium">Movie</span>
                        </div>
                        <span class="text-white font-semibold text-lg"><%= movieTitle %></span>
                    </div>
                    
                    <div class="flex items-center justify-between py-3 border-b border-white/10">
                        <div class="flex items-center space-x-3">
                            <i class="fas fa-clock text-indigo-400"></i>
                            <span class="text-gray-300 font-medium">Show Time</span>
                        </div>
                        <span class="text-white font-semibold"><%= showTime %></span>
                    </div>
                    
                    <div class="flex items-center justify-between py-3 border-b border-white/10">
                        <div class="flex items-center space-x-3">
                            <i class="fas fa-ticket-alt text-indigo-400"></i>
                            <span class="text-gray-300 font-medium">Tickets</span>
                        </div>
                        <span class="text-white font-semibold"><%= numTickets %> &times; <%= numTickets > 1 ? "Tickets" : "Ticket" %></span>
                    </div>
                    
                    <div class="flex items-center justify-between py-4 bg-gradient-to-r from-green-500/10 to-emerald-500/10 rounded-lg px-4 border border-green-500/20">
                        <div class="flex items-center space-x-3">
                            <i class="fas fa-rupee-sign text-green-400"></i>
                            <span class="text-green-300 font-bold text-lg">Total Amount</span>
                        </div>
                        <span class="text-green-400 font-bold text-2xl">₹<%= String.format("%.2f", totalPrice) %></span>
                    </div>
                </div>
            </div>

            <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="glass rounded-xl p-4 text-center">
                    <h4 class="text-gray-300 font-medium mb-2">Booking ID</h4>
                    <p class="text-indigo-400 font-mono text-lg font-bold">MT<%= System.currentTimeMillis() % 100000 %></p>
                </div>
                
                <div class="glass rounded-xl p-4 text-center">
                    <h4 class="text-gray-300 font-medium mb-2">Show this at theater</h4>
                    <div class="w-16 h-16 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-lg mx-auto flex items-center justify-center">
                        <i class="fas fa-qrcode text-white text-2xl"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="dashboard.jsp" class="inline-flex items-center justify-center bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl shimmer">
                <i class="fas fa-arrow-left mr-2"></i>
                Back to Dashboard
            </a>
            
            <button onclick="printTicket()" class="inline-flex items-center justify-center bg-gradient-to-r from-green-600 to-emerald-600 hover:from-green-700 hover:to-emerald-700 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-green-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl">
                <i class="fas fa-print mr-2"></i>
                Print Ticket
            </button>
        </div>

        <div class="text-center mt-8">
            <p class="text-gray-400 text-sm">
                <i class="fas fa-info-circle mr-1"></i>
                Please arrive 15 minutes before show time. Enjoy your movie!
            </p>
        </div>
    </div>

    <script>
        // Print ticket function
        function printTicket() {
            window.print();
        }

        // Add ripple effect to buttons
        document.querySelectorAll('button, a').forEach(element => {
            element.addEventListener('click', function(e) {
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

        // Enhanced hover effects
        document.querySelector('.glass').addEventListener('mouseenter', function() {
            this.style.background = 'rgba(255, 255, 255, 0.08)';
            this.style.boxShadow = '0 25px 50px rgba(99, 102, 241, 0.15), 0 0 0 1px rgba(255, 255, 255, 0.1)';
        });

        document.querySelector('.glass').addEventListener('mouseleave', function() {
            this.style.background = 'rgba(255, 255, 255, 0.05)';
            this.style.boxShadow = '';
        });
    </script>

    <style>
        /* Ripple effect */
        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
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

        /* Smooth transitions */
        * {
            transition: all 0.3s ease;
        }

        /* Focus states */
        button:focus, a:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.3);
        }

        /* Print styles */
        @media print {
            body {
                background: white !important;
                color: black !important;
            }

            .glass, .ticket-card {
                background: transparent !important;
                border: 1px solid #ddd !important;
                box-shadow: none !important;
                backdrop-filter: none !important;
            }

            .particles, .aurora, .confetti-particle, .shimmer, button, a[href] {
                display: none !important;
            }

            .text-white, .text-gray-300, .text-green-300, .text-green-400 {
                color: black !important;
            }

            .modern-gradient-text, .success-gradient-text {
                background: none !important;
                -webkit-text-fill-color: inherit !important;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 640px) {
            .glass {
                margin: 1rem;
                padding: 1.5rem;
            }
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