using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace W24_TP2.Models
{
    public partial class Forum01Context : DbContext
    {
        public Forum01Context()
        {
        }

        public Forum01Context(DbContextOptions<Forum01Context> options)
            : base(options)
        {
        }

        public virtual DbSet<AspNetRole> AspNetRoles { get; set; } = null!;
        public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; } = null!;
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; } = null!;
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; } = null!;
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; } = null!;
        public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Message> Messages { get; set; } = null!;
        public virtual DbSet<Sujet> Sujets { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(System.Configuration.ConfigurationManager.ConnectionStrings["Forum01Connection"].ConnectionString);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AspNetRole>(entity =>
            {
                entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedName] IS NOT NULL)");

                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetRoleClaim>(entity =>
            {
                entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetRoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetUser>(entity =>
            {
                entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

                entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedUserName] IS NOT NULL)");

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.UserName).HasMaxLength(256);

                entity.HasMany(d => d.Roles)
                    .WithMany(p => p.Users)
                    .UsingEntity<Dictionary<string, object>>(
                        "AspNetUserRole",
                        l => l.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                        r => r.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                        j =>
                        {
                            j.HasKey("UserId", "RoleId");

                            j.ToTable("AspNetUserRoles");

                            j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                        });
            });

            modelBuilder.Entity<AspNetUserClaim>(entity =>
            {
                entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogin>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.ProviderKey).HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.Name).HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserTokens)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.CatId);

                entity.Property(e => e.CatId).HasColumnName("catID");

                entity.Property(e => e.CatActif).HasColumnName("catActif");

                entity.Property(e => e.CatDescription)
                    .HasMaxLength(125)
                    .HasColumnName("catDescription");

                entity.Property(e => e.CatImg)
                    .HasMaxLength(255)
                    .HasColumnName("catIMG");

                entity.Property(e => e.CatNom)
                    .HasMaxLength(50)
                    .HasColumnName("catNom");
            });

            modelBuilder.Entity<Message>(entity =>
            {
                entity.HasKey(e => e.MsgId);

                entity.Property(e => e.MsgId).HasColumnName("msgID");

                entity.Property(e => e.MsgActif).HasColumnName("msgActif");

                entity.Property(e => e.MsgDate)
                    .HasColumnType("datetime")
                    .HasColumnName("msgDate")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.MsgText)
                    .HasMaxLength(500)
                    .HasColumnName("msgText");

                entity.Property(e => e.MsgView).HasColumnName("msgView");

                entity.Property(e => e.SujetId).HasColumnName("sujetID");

                entity.Property(e => e.UserId)
                    .HasMaxLength(450)
                    .HasColumnName("userID");

                entity.HasOne(d => d.Sujet)
                    .WithMany(p => p.Messages)
                    .HasForeignKey(d => d.SujetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Messages_Sujets");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Messages)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Messages_User");
            });

            modelBuilder.Entity<Sujet>(entity =>
            {
                entity.Property(e => e.SujetId).HasColumnName("sujetID");

                entity.Property(e => e.CatId).HasColumnName("catID");

                entity.Property(e => e.SujetActif).HasColumnName("sujetActif");

                entity.Property(e => e.SujetDate)
                    .HasColumnType("datetime")
                    .HasColumnName("sujetDate")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.SujetTexte)
                    .HasMaxLength(255)
                    .HasColumnName("sujetTexte");

                entity.Property(e => e.SujetView).HasColumnName("sujetView");

                entity.Property(e => e.UserId)
                    .HasMaxLength(450)
                    .HasColumnName("userID");

                entity.HasOne(d => d.Cat)
                    .WithMany(p => p.Sujets)
                    .HasForeignKey(d => d.CatId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sujets_Categories");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Sujets)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Sujets_User");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
