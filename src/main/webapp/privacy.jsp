<%-- File: privacy.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy - MovieTime</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'fade-in': 'fadeIn 0.6s ease-in-out',
                        'slide-up': 'slideUp 0.8s ease-out',
                        'slide-down': 'slideDown 0.6s ease-out',
                        'pulse-soft': 'pulseSoft 2s infinite',
                        'float': 'float 3s ease-in-out infinite',
                        'glow': 'glow 2s ease-in-out infinite alternate',
                        'aurora': 'aurora 8s ease-in-out infinite',
                        'shimmer': 'shimmer 2s linear infinite',
                        'privacy-shield': 'privacyShield 3s ease-in-out infinite',
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
                        slideDown: {
                            '0%': { opacity: '0', transform: 'translateY(-30px)' },
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
                        privacyShield: {
                            '0%, 100%': { transform: 'scale(1) rotate(0deg)' },
                            '50%': { transform: 'scale(1.05) rotate(2deg)' }
                        }
                    }
                }
            }
        }
    </script>
    <style>
        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #1a1a2e;
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(45deg, #6366f1, #a855f7);
            border-radius: 4px;
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

        .glass-content {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Floating particles background */
        .particles {
            position: fixed;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
            top: 0;
            left: 0;
        }
        
        .particle {
            position: absolute;
            display: block;
            pointer-events: none;
            width: 4px;
            height: 4px;
            background: rgba(99, 102, 241, 0.6);
            border-radius: 50%;
            animation: float-particles 25s infinite linear;
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

        .privacy-gradient-text {
            background: linear-gradient(135deg, #10b981, #3b82f6, #6366f1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Aurora background effect */
        .aurora {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                transparent 30%, 
                rgba(99, 102, 241, 0.1) 50%, 
                transparent 70%);
            animation: aurora 12s ease-in-out infinite;
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

        /* Privacy section styling */
        .privacy-section {
            position: relative;
            padding-left: 1rem;
            border-left: 2px solid transparent;
            background: linear-gradient(to right, rgba(16, 185, 129, 0.1), transparent);
            border-image: linear-gradient(to bottom, #10b981, #3b82f6) 1;
        }

        /* Data type cards */
        .data-card {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.1), rgba(168, 85, 247, 0.1));
            border: 1px solid rgba(99, 102, 241, 0.2);
            transition: all 0.3s ease;
        }

        .data-card:hover {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.15), rgba(168, 85, 247, 0.15));
            transform: translateY(-2px);
        }

        /* Smooth scroll behavior */
        html {
            scroll-behavior: smooth;
        }

        /* Reading progress bar */
        .progress-bar {
            position: fixed;
            top: 0;
            left: 0;
            width: 0%;
            height: 3px;
            background: linear-gradient(90deg, #10b981, #3b82f6, #6366f1);
            z-index: 1000;
            transition: width 0.1s ease;
        }

        /* Privacy shield animation */
        .privacy-shield {
            animation: privacyShield 3s ease-in-out infinite;
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 relative overflow-x-hidden">
    
    <!-- Reading progress bar -->
    <div class="progress-bar" id="progressBar"></div>

    <!-- Aurora effect -->
    <div class="aurora"></div>
    
    <!-- Floating particles background -->
    <div class="particles">
        <span class="particle" style="left: 5%; animation-delay: 0s;"></span>
        <span class="particle" style="left: 15%; animation-delay: 2s;"></span>
        <span class="particle" style="left: 25%; animation-delay: 4s;"></span>
        <span class="particle" style="left: 35%; animation-delay: 6s;"></span>
        <span class="particle" style="left: 45%; animation-delay: 8s;"></span>
        <span class="particle" style="left: 55%; animation-delay: 10s;"></span>
        <span class="particle" style="left: 65%; animation-delay: 12s;"></span>
        <span class="particle" style="left: 75%; animation-delay: 14s;"></span>
        <span class="particle" style="left: 85%; animation-delay: 16s;"></span>
        <span class="particle" style="left: 95%; animation-delay: 18s;"></span>
    </div>

    <!-- Header -->
    <header class="glass backdrop-blur-md border-b border-white/10 animate-slide-down sticky top-0 z-50">
        <nav class="container mx-auto px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center animate-glow">
                        <i class="fas fa-film text-white text-lg"></i>
                    </div>
                    <a class="text-2xl font-bold modern-gradient-text" href="index.jsp">MovieTime</a>
                </div>
                
                <!-- Navigation breadcrumb -->
                <div class="hidden md:flex items-center space-x-2 text-sm text-gray-400">
                    <a href="index.jsp" class="hover:text-indigo-400 transition-colors">Home</a>
                    <i class="fas fa-chevron-right text-xs"></i>
                    <span class="text-green-400">Privacy Policy</span>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-6 py-12">
        <!-- Page Title -->
        <div class="text-center mb-16 animate-fade-in">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-green-500 to-blue-600 rounded-full mb-6 animate-float privacy-shield">
                <i class="fas fa-shield-alt text-white text-2xl"></i>
            </div>
            <h1 class="text-4xl md:text-5xl font-bold privacy-gradient-text mb-4">Privacy Policy</h1>
            <p class="text-gray-300 text-lg mb-2">Your privacy is our priority</p>
            <p class="text-gray-400 text-sm">Last updated: <span class="text-green-400">July 26, 2024</span></p>
            <div class="mt-6 w-24 h-1 bg-gradient-to-r from-green-500 to-blue-600 mx-auto rounded-full"></div>
        </div>

        <!-- Privacy Content -->
        <div class="max-w-4xl mx-auto">
            <div class="glass-content rounded-2xl shadow-2xl p-8 md:p-12 animate-slide-up">
                
                <!-- Introduction -->
                <div class="mb-12">
                    <p class="text-gray-300 text-lg leading-relaxed">
                        This Privacy Policy describes our policies and procedures on the collection, use and disclosure of your information when you use MovieTime and tells you about your privacy rights and how the law protects you.
                    </p>
                </div>

                <!-- Information We Collect Section -->
                <section class="privacy-section mb-12 animate-fade-in" style="animation-delay: 0.2s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-6 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">
                            <i class="fas fa-database text-xs"></i>
                        </span>
                        Information We Collect
                    </h2>
                    <p class="text-gray-300 leading-relaxed mb-6">
                        We collect several different types of information for various purposes to provide and improve our Service to you.
                    </p>

                    <!-- Data Types Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                        <!-- Personal Data Card -->
                        <div class="data-card rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-lg flex items-center justify-center mr-3">
                                    <i class="fas fa-user text-white"></i>
                                </div>
                                <h3 class="font-bold text-white">Personal Data</h3>
                            </div>
                            <p class="text-gray-300 text-sm leading-relaxed">
                                Email address, username, first and last name, and securely hashed passwords for account management and identification.
                            </p>
                        </div>

                        <!-- Usage Data Card -->
                        <div class="data-card rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-gradient-to-r from-purple-500 to-pink-600 rounded-lg flex items-center justify-center mr-3">
                                    <i class="fas fa-chart-line text-white"></i>
                                </div>
                                <h3 class="font-bold text-white">Usage Data</h3>
                            </div>
                            <p class="text-gray-300 text-sm leading-relaxed">
                                IP address, browser information, pages visited, timestamps, and device identifiers for service improvement and analytics.
                            </p>
                        </div>

                        <!-- Booking Data Card -->
                        <div class="data-card rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-gradient-to-r from-green-500 to-teal-600 rounded-lg flex items-center justify-center mr-3">
                                    <i class="fas fa-ticket-alt text-white"></i>
                                </div>
                                <h3 class="font-bold text-white">Booking Data</h3>
                            </div>
                            <p class="text-gray-300 text-sm leading-relaxed">
                                Movie titles, show times, number of tickets, and booking history to provide ticketing services and support.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- How We Use Information Section -->
                <section class="privacy-section mb-12 animate-fade-in" style="animation-delay: 0.4s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-6 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">
                            <i class="fas fa-cogs text-xs"></i>
                        </span>
                        How We Use Your Information
                    </h2>
                    <p class="text-gray-300 leading-relaxed mb-6">
                        We use the collected data for various purposes to enhance your experience:
                    </p>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Service Provision</h4>
                                <p class="text-gray-300 text-sm">To provide and maintain our movie booking platform</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Account Management</h4>
                                <p class="text-gray-300 text-sm">To manage your user account and preferences</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Communication</h4>
                                <p class="text-gray-300 text-sm">To notify you about service changes and updates</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Customer Support</h4>
                                <p class="text-gray-300 text-sm">To provide assistance and resolve issues</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Service Improvement</h4>
                                <p class="text-gray-300 text-sm">To analyze usage and enhance our platform</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-3 p-4 rounded-lg bg-white/5">
                            <div class="w-6 h-6 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                                <i class="fas fa-check text-white text-xs"></i>
                            </div>
                            <div>
                                <h4 class="text-white font-semibold mb-1">Legal Compliance</h4>
                                <p class="text-gray-300 text-sm">To comply with applicable laws and regulations</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Data Security Section -->
                <section class="privacy-section mb-12 animate-fade-in" style="animation-delay: 0.6s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-6 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">
                            <i class="fas fa-lock text-xs"></i>
                        </span>
                        Security of Data
                    </h2>
                    <div class="space-y-6">
                        <p class="text-gray-300 leading-relaxed">
                            The security of your data is important to us. We implement various security measures to protect your personal information:
                        </p>
                        
                        <div class="bg-green-500/10 border border-green-500/20 rounded-xl p-6">
                            <div class="flex items-start space-x-4">
                                <div class="w-12 h-12 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center flex-shrink-0">
                                    <i class="fas fa-shield-alt text-white text-lg"></i>
                                </div>
                                <div>
                                    <h3 class="text-green-300 font-bold text-lg mb-2">Our Security Measures</h3>
                                    <ul class="text-green-100 space-y-2 text-sm">
                                        <li class="flex items-center"><i class="fas fa-check-circle mr-2"></i>Encrypted data transmission using HTTPS</li>
                                        <li class="flex items-center"><i class="fas fa-check-circle mr-2"></i>Secure password hashing and storage</li>
                                        <li class="flex items-center"><i class="fas fa-check-circle mr-2"></i>Regular security audits and updates</li>
                                        <li class="flex items-center"><i class="fas fa-check-circle mr-2"></i>Access controls and authentication protocols</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="bg-yellow-500/10 border border-yellow-500/20 rounded-lg p-4">
                            <p class="text-yellow-300 text-sm">
                                <i class="fas fa-exclamation-triangle mr-2"></i>
                                <strong>Important:</strong> While we strive to use commercially acceptable means to protect your personal data, no method of transmission over the Internet or electronic storage is 100% secure. We cannot guarantee absolute security.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Your Rights Section -->
                <section class="privacy-section mb-12 animate-fade-in" style="animation-delay: 0.8s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-6 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">
                            <i class="fas fa-balance-scale text-xs"></i>
                        </span>
                        Your Privacy Rights
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="data-card rounded-xl p-6">
                            <h3 class="text-white font-bold mb-3 flex items-center">
                                <i class="fas fa-eye mr-2 text-blue-400"></i>
                                Access Your Data
                            </h3>
                            <p class="text-gray-300 text-sm">Request access to the personal data we hold about you</p>
                        </div>

                        <div class="data-card rounded-xl p-6">
                            <h3 class="text-white font-bold mb-3 flex items-center">
                                <i class="fas fa-edit mr-2 text-green-400"></i>
                                Rectify Data
                            </h3>
                            <p class="text-gray-300 text-sm">Request correction of inaccurate or incomplete data</p>
                        </div>

                        <div class="data-card rounded-xl p-6">
                            <h3 class="text-white font-bold mb-3 flex items-center">
                                <i class="fas fa-trash mr-2 text-red-400"></i>
                                Delete Data
                            </h3>
                            <p class="text-gray-300 text-sm">Request deletion of your personal data in certain circumstances</p>
                        </div>

                        <div class="data-card rounded-xl p-6">
                            <h3 class="text-white font-bold mb-3 flex items-center">
                                <i class="fas fa-download mr-2 text-purple-400"></i>
                                Data Portability
                            </h3>
                            <p class="text-gray-300 text-sm">Request transfer of your data to another service provider</p>
                        </div>
                    </div>
                </section>

                <!-- Contact Information Section -->
                <section class="privacy-section animate-fade-in" style="animation-delay: 1.0s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-6 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-green-500 to-blue-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">
                            <i class="fas fa-headset text-xs"></i>
                        </span>
                        Contact Us
                    </h2>
                    <div class="bg-indigo-500/10 border border-indigo-500/20 rounded-xl p-6">
                        <p class="text-gray-300 leading-relaxed mb-4">
                            If you have any questions about this Privacy Policy or wish to exercise your privacy rights, please contact us:
                        </p>
                        <div class="space-y-3 text-gray-400">
                            <p class="flex items-center">
                                <i class="fas fa-envelope mr-3 text-indigo-400 w-5"></i>
                                <span class="text-indigo-300">project@gmail.com</span>
                            </p>
                            <p class="flex items-center">
                                <i class="fas fa-phone mr-3 text-indigo-400 w-5"></i>
                                <span>+910123456789</span>
                            </p>
                            <p class="flex items-center">
                                <i class="fas fa-map-marker-alt mr-3 text-indigo-400 w-5"></i>
                                <span>Yavatmal, Maharashtra, India</span>
                            </p>
                            <p class="flex items-center">
                                <i class="fas fa-clock mr-3 text-indigo-400 w-5"></i>
                                <span>Response time: Within 48 hours</span>
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Action Buttons -->
                <div class="flex flex-col sm:flex-row gap-4 justify-center mt-12 pt-8 border-t border-white/10">
                    <a href="index.jsp" class="inline-flex items-center justify-center bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl shimmer">
                        <i class="fas fa-home mr-2"></i>
                        Back to Home
                    </a>
                    
                    <a href="terms.jsp" class="inline-flex items-center justify-center bg-gradient-to-r from-green-600 to-blue-600 hover:from-green-700 hover:to-blue-700 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-green-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl">
                        <i class="fas fa-file-contract mr-2"></i>
                        Terms & Conditions
                    </a>
                    
                    <button onclick="window.print()" class="inline-flex items-center justify-center bg-gradient-to-r from-gray-600 to-gray-700 hover:from-gray-700 hover:to-gray-800 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-gray-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl">
                        <i class="fas fa-print mr-2"></i>
                        Print Policy
                    </button>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="glass border-t border-white/10 mt-16">
        <div class="container mx-auto px-6 py-8">
            <div class="text-center">
                <p class="text-gray-400 text-sm">© 2025 MovieTime. All rights reserved.</p>
                <p class="text-gray-500 text-xs mt-2">Your privacy matters to us</p>
            </div>
        </div>
    </footer>

    <script>
        // Reading progress bar
        window.addEventListener('scroll', () => {
            const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrolled = (winScroll / height) * 100;
            document.getElementById('progressBar').style.width = scrolled + '%';
        });

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
        document.querySelector('.glass-content').addEventListener('mouseenter', function() {
            this.style.background = 'rgba(255, 255, 255, 0.12)';
            this.style.boxShadow = '0 25px 50px rgba(99, 102, 241, 0.15), 0 0 0 1px rgba(255, 255, 255, 0.1)';
        });

        document.querySelector('.glass-content').addEventListener('mouseleave', function() {
            this.style.background = 'rgba(255, 255, 255, 0.08)';
            this.style.boxShadow = '';
        });

        // Data card hover effects
        document.querySelectorAll('.data-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-4px) scale(1.02)';
                this.style.boxShadow = '0 10px 25px rgba(99, 102, 241, 0.2)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
                this.style.boxShadow = '';
            });
        });

        // Intersection Observer for animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-fade-in');
                }
            });
        }, observerOptions);

        document.querySelectorAll('.privacy-section').forEach(section => {
            observer.observe(section);
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
            
            .particles, .aurora, .glass {
                display: none !important;
            }
            
            .glass-content {
                background: white !important;
                border: 1px solid #ccc !important;
                box-shadow: none !important;
            }
            
            .modern-gradient-text, .privacy-gradient-text {
                color: black !important;
                background: none !important;
                -webkit-text-fill-color: initial !important;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 640px) {
            .container {
                padding-left: 1rem;
                padding-right: 1rem;
            }
            
            .glass-content {
                padding: 1.5rem;
            }
            
            .privacy-section {
                padding-left: 0.5rem;
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
