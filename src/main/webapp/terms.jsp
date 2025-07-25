<%-- File: terms.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions - MovieTime</title>
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
                        'typewriter': 'typewriter 2s steps(40) infinite',
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
                        typewriter: {
                            '0%': { width: '0' },
                            '50%': { width: '100%' },
                            '100%': { width: '0' }
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

        /* Section styling */
        .terms-section {
            position: relative;
            padding-left: 1rem;
            border-left: 2px solid transparent;
            background: linear-gradient(to right, rgba(99, 102, 241, 0.1), transparent);
            border-image: linear-gradient(to bottom, #6366f1, #a855f7) 1;
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
            background: linear-gradient(90deg, #6366f1, #a855f7, #ec4899);
            z-index: 1000;
            transition: width 0.1s ease;
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
                    <span class="text-indigo-400">Terms & Conditions</span>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-6 py-12">
        <!-- Page Title -->
        <div class="text-center mb-16 animate-fade-in">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full mb-6 animate-float">
                <i class="fas fa-file-contract text-white text-2xl"></i>
            </div>
            <h1 class="text-4xl md:text-5xl font-bold modern-gradient-text mb-4">Terms & Conditions</h1>
            <p class="text-gray-300 text-lg mb-2">Please read these terms carefully before using our service</p>
            <p class="text-gray-400 text-sm">Last updated: <span class="text-indigo-400">July 26, 2024</span></p>
            <div class="mt-6 w-24 h-1 bg-gradient-to-r from-indigo-500 to-purple-600 mx-auto rounded-full"></div>
        </div>

        <!-- Terms Content -->
        <div class="max-w-4xl mx-auto">
            <div class="glass-content rounded-2xl shadow-2xl p-8 md:p-12 animate-slide-up">
                
                <!-- Introduction -->
                <div class="mb-12">
                    <p class="text-gray-300 text-lg leading-relaxed">
                        Please read these terms and conditions carefully before using Our Service. By accessing or using MovieTime, you agree to be bound by these terms.
                    </p>
                </div>

                <!-- Section 1: Introduction -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 0.2s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">1</span>
                        Introduction
                    </h2>
                    <p class="text-gray-300 leading-relaxed">
                        Welcome to MovieTime ("Company", "we", "our", "us")! These Terms of Service govern your use of our website and mobile application (together or individually "Service") operated by MovieTime. Our platform provides movie ticket booking services and related entertainment content.
                    </p>
                </section>

                <!-- Section 2: Accounts -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 0.4s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">2</span>
                        User Accounts
                    </h2>
                    <div class="space-y-4">
                        <p class="text-gray-300 leading-relaxed">
                            When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on our Service.
                        </p>
                        <div class="bg-indigo-500/10 border border-indigo-500/20 rounded-lg p-4">
                            <p class="text-indigo-300 text-sm">
                                <i class="fas fa-shield-alt mr-2"></i>
                                You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Section 3: Bookings and Payments -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 0.6s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">3</span>
                        Bookings & Payments
                    </h2>
                    <div class="space-y-4">
                        <p class="text-gray-300 leading-relaxed">
                            All bookings are subject to availability. We reserve the right to refuse or cancel your booking at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.
                        </p>
                        <div class="bg-red-500/10 border border-red-500/20 rounded-lg p-4">
                            <p class="text-red-300 text-sm">
                                <i class="fas fa-exclamation-triangle mr-2"></i>
                                <strong>Important:</strong> All ticket sales are final. No refunds or exchanges will be provided for any reason except as required by law.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Section 4: Intellectual Property -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 0.8s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">4</span>
                        Intellectual Property
                    </h2>
                    <p class="text-gray-300 leading-relaxed">
                        The Service and its original content, features and functionality are and will remain the exclusive property of MovieTime and its licensors. The Service is protected by copyright, trademark, and other laws of India. Our trademarks and trade dress may not be used in connection with any product or service without our prior written consent.
                    </p>
                </section>

                <!-- Section 5: Governing Law -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 1.0s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">5</span>
                        Governing Law
                    </h2>
                    <p class="text-gray-300 leading-relaxed">
                        These Terms shall be governed and construed in accordance with the laws of India, without regard to its conflict of law provisions. Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions will remain in effect.
                    </p>
                </section>
                
                <!-- Section 6: Changes to Agreement -->
                <section class="terms-section mb-10 animate-fade-in" style="animation-delay: 1.2s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">6</span>
                        Changes to This Agreement
                    </h2>
                    <div class="space-y-4">
                        <p class="text-gray-300 leading-relaxed">
                            We reserve the right to modify these terms at any time. We will notify you of any changes by posting the new terms on this page and updating the "Last updated" date at the top of this page.
                        </p>
                        <div class="bg-yellow-500/10 border border-yellow-500/20 rounded-lg p-4">
                            <p class="text-yellow-300 text-sm">
                                <i class="fas fa-bell mr-2"></i>
                                Your continued use of the Service after any modifications indicates your acceptance of the new terms.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Contact Information -->
                <section class="terms-section animate-fade-in" style="animation-delay: 1.4s;">
                    <h2 class="text-2xl md:text-3xl font-bold text-white mb-4 flex items-center">
                        <span class="w-8 h-8 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-full flex items-center justify-center text-sm font-bold mr-3">7</span>
                        Contact Us
                    </h2>
                    <p class="text-gray-300 leading-relaxed mb-4">
                        If you have any questions about these Terms and Conditions, please contact us:
                    </p>
                    <div class="space-y-2 text-gray-400">
                        <p><i class="fas fa-envelope mr-2 text-indigo-400"></i> support@movietime.com</p>
                        <p><i class="fas fa-phone mr-2 text-indigo-400"></i> +91 (555) 123-4567</p>
                        <p><i class="fas fa-map-marker-alt mr-2 text-indigo-400"></i> Mumbai, Maharashtra, India</p>
                    </div>
                </section>

                <!-- Action Buttons -->
                <div class="flex flex-col sm:flex-row gap-4 justify-center mt-12 pt-8 border-t border-white/10">
                    <a href="index.jsp" class="inline-flex items-center justify-center bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl shimmer">
                        <i class="fas fa-home mr-2"></i>
                        Back to Home
                    </a>
                    
                    <button onclick="window.print()" class="inline-flex items-center justify-center bg-gradient-to-r from-gray-600 to-gray-700 hover:from-gray-700 hover:to-gray-800 text-white font-bold py-3 px-6 rounded-lg focus:outline-none focus:ring-4 focus:ring-gray-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl">
                        <i class="fas fa-print mr-2"></i>
                        Print Terms
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
                <p class="text-gray-500 text-xs mt-2">Your trusted partner for cinema experiences</p>
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

        // Smooth scroll to sections
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Intersection Observer for animation triggers
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

        document.querySelectorAll('.terms-section').forEach(section => {
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
            
            .modern-gradient-text {
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
            
            .terms-section {
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
