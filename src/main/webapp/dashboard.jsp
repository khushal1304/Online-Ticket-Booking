<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.booking.model.*, com.booking.util.DBConnection, java.sql.*" %>
<%
    // Security Check: Redirect to login if user is not in session
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch movies from DB
    List<Movie> movies = new ArrayList<>();
    String sql = "SELECT * FROM movies";
    try (Connection conn = DBConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {
        
        while(rs.next()) {
            Movie movie = new Movie();
            movie.setId(rs.getInt("id"));
            movie.setTitle(rs.getString("title"));
            movie.setGenre(rs.getString("genre"));
            movie.setDescription(rs.getString("description"));
            movie.setPosterUrl(rs.getString("poster_url"));
            movies.add(movie);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle error appropriately
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Now Showing</title>
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
                        'scale-in': 'scaleIn 0.5s ease-out',
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
                        scaleIn: {
                            '0%': { opacity: '0', transform: 'scale(0.9)' },
                            '100%': { opacity: '1', transform: 'scale(1)' }
                        },
                        bounceIn: {
                            '0%': { opacity: '0', transform: 'scale(0.3)' },
                            '50%': { opacity: '1', transform: 'scale(1.1)' },
                            '100%': { opacity: '1', transform: 'scale(1)' }
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

        .glass-card {
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

        /* Neon glow effect */
        .neon-glow {
            box-shadow: 0 0 5px rgba(99, 102, 241, 0.5),
                        0 0 10px rgba(99, 102, 241, 0.5),
                        0 0 15px rgba(99, 102, 241, 0.5),
                        0 0 20px rgba(99, 102, 241, 0.5);
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

        /* Movie poster hover effect */
        .movie-poster {
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .movie-poster:hover {
            transform: scale(1.05);
        }

        .movie-poster img {
            transition: all 0.3s ease;
        }

        .movie-poster:hover img {
            transform: scale(1.1);
            filter: brightness(1.2);
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

        /* Genre badge styling */
        .genre-badge {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.2), rgba(168, 85, 247, 0.2));
            border: 1px solid rgba(99, 102, 241, 0.3);
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 relative overflow-x-hidden">
    
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
        <span class="particle" style="left: 10%; animation-delay: 20s;"></span>
        <span class="particle" style="left: 30%; animation-delay: 22s;"></span>
        <span class="particle" style="left: 50%; animation-delay: 24s;"></span>
        <span class="particle" style="left: 70%; animation-delay: 26s;"></span>
        <span class="particle" style="left: 90%; animation-delay: 28s;"></span>
    </div>

    <!-- Header -->
    <header class="glass backdrop-blur-md border-b border-white/10 animate-slide-down">
        <nav class="container mx-auto px-6 py-4 flex justify-between items-center">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center animate-glow">
                    <i class="fas fa-film text-white text-lg"></i>
                </div>
                <a class="text-2xl font-bold modern-gradient-text" href="#">MovieTime</a>
            </div>
            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-2">
                    <div class="w-8 h-8 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full flex items-center justify-center">
                        <i class="fas fa-user text-white text-sm"></i>
                    </div>
                    <span class="text-gray-300 font-medium">Welcome, <span class="text-indigo-400"><%= user.getUsername() %></span>!</span>
                </div>
                <a href="logout" class="bg-gradient-to-r from-red-500 to-pink-500 hover:from-red-600 hover:to-pink-600 text-white font-bold py-2 px-4 rounded-lg transition-all duration-300 transform hover:scale-105 hover:shadow-lg flex items-center space-x-2">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-6 py-8">
        <!-- Page Title -->
        <div class="text-center mb-12 animate-fade-in">
            <h1 class="text-4xl md:text-5xl font-bold modern-gradient-text mb-4">Now Showing</h1>
            <p class="text-gray-300 text-lg">Discover amazing movies and book your tickets</p>
            <div class="mt-6 w-24 h-1 bg-gradient-to-r from-indigo-500 to-purple-600 mx-auto rounded-full"></div>
        </div>

        <!-- Movies Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
            <% for (Movie movie : movies) { %>
            <div class="glass-card rounded-2xl overflow-hidden shadow-2xl hover:shadow-3xl transition-all duration-500 transform hover:scale-105 animate-scale-in border border-white/10">
                <!-- Movie Poster -->
                <div class="movie-poster relative">
                    <img src="<%= movie.getPosterUrl() %>" alt="<%= movie.getTitle() %> Poster" class="w-full h-80 object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent"></div>
                    <div class="absolute top-4 right-4">
                        <div class="genre-badge px-3 py-1 rounded-full backdrop-blur-sm">
                            <span class="text-indigo-300 text-sm font-medium"><%= movie.getGenre() %></span>
                        </div>
                    </div>
                </div>
                
                <!-- Movie Details -->
                <div class="p-6">
                    <h2 class="font-bold text-xl mb-3 text-white line-clamp-2"><%= movie.getTitle() %></h2>
                    <p class="text-gray-300 text-sm mb-4 line-clamp-3"><%= movie.getDescription() %></p>
                    
                    <!-- Booking Form -->
                    <form action="bookTicket" method="post" class="space-y-4">
                        <input type="hidden" name="movieId" value="<%= movie.getId() %>">
                        <input type="hidden" name="movieTitle" value="<%= movie.getTitle() %>">
                        
                        <!-- Show Time Selection -->
                        <div>
                            <label for="showTime-<%= movie.getId() %>" class="block text-gray-300 text-sm font-semibold mb-2">
                                <i class="fas fa-clock mr-2 text-indigo-400"></i>Show Time
                            </label>
                            <select name="showTime" id="showTime-<%= movie.getId() %>" class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm text-white">
                                <option value="10:00 AM">10:00 AM</option>
                                <option value="01:00 PM">01:00 PM</option>
                                <option value="04:00 PM">04:00 PM</option>
                                <option value="07:00 PM">07:00 PM</option>
                                <option value="10:00 PM">10:00 PM</option>
                            </select>
                        </div>
                        
                        <!-- Number of Tickets -->
                        <div>
                            <label for="numTickets-<%= movie.getId() %>" class="block text-gray-300 text-sm font-semibold mb-2">
                                <i class="fas fa-ticket-alt mr-2 text-indigo-400"></i>Tickets
                            </label>
                            <input type="number" id="numTickets-<%= movie.getId() %>" name="numTickets" value="1" min="1" max="10" class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all duration-300 backdrop-blur-sm text-white">
                        </div>
                        
                        <!-- Book Button -->
                        <button type="submit" class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold py-3 px-4 rounded-lg focus:outline-none focus:ring-4 focus:ring-indigo-300/50 transition-all duration-300 transform hover:scale-105 hover:shadow-xl neon-glow shimmer flex items-center justify-center space-x-2">
                            <i class="fas fa-ticket-alt"></i>
                            <span>Book Now</span>
                        </button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>

        <!-- No Movies Message -->
        <% if (movies.isEmpty()) { %>
        <div class="text-center py-16">
            <div class="glass-card rounded-2xl p-12 max-w-md mx-auto">
                <i class="fas fa-film text-6xl text-gray-400 mb-6"></i>
                <h3 class="text-2xl font-bold text-white mb-4">No Movies Available</h3>
                <p class="text-gray-300">Check back later for new movie releases!</p>
            </div>
        </div>
        <% } %>
    </main>

    <!-- Footer -->
    <footer class="glass border-t border-white/10 mt-16">
        <div class="container mx-auto px-6 py-8">
            <div class="text-center">
                <p class="text-gray-400 text-sm">© 2025 MovieTime. All rights reserved.</p>
                <p class="text-gray-500 text-xs mt-2">Experience cinema like never before</p>
            </div>
        </div>
    </footer>

    <script>
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

        // Add floating animation to form focus
        document.querySelectorAll('input, select').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('animate-pulse-soft');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('animate-pulse-soft');
            });
        });

        // Enhanced hover effects for movie cards
        document.querySelectorAll('.glass-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.background = 'rgba(255, 255, 255, 0.12)';
                this.style.boxShadow = '0 25px 50px rgba(99, 102, 241, 0.15), 0 0 0 1px rgba(255, 255, 255, 0.1)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.background = 'rgba(255, 255, 255, 0.08)';
                this.style.boxShadow = '';
            });
        });

        // Form submission enhancement
        document.querySelectorAll('form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const button = this.querySelector('button[type="submit"]');
                button.innerHTML = '<i class="fas fa-spinner animate-spin mr-2"></i>Booking...';
                button.disabled = true;
            });
        });

        // Staggered animation for movie cards
        document.querySelectorAll('.glass-card').forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });

        // Smooth scroll behavior
        document.documentElement.style.scrollBehavior = 'smooth';
    </script>

    <style>
        /* Ripple effect */
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

        /* Smooth transitions */
        * {
            transition: all 0.3s ease;
        }

        /* Focus states */
        input:focus, select:focus, button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.3);
        }

        /* Line clamp utilities */
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .line-clamp-3 {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* Responsive adjustments */
        @media (max-width: 640px) {
            .container {
                padding-left: 1rem;
                padding-right: 1rem;
            }
            
            .glass-card {
                margin: 0 0.5rem;
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

        /* Select dropdown styling */
        select option {
            background: #1e293b;
            color: white;
        }
    </style>
</body>
</html>