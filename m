Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067822wrp;
        Mon, 16 Sep 2019 07:15:52 -0700 (PDT)
X-Received: by 2002:a1c:4102:: with SMTP id o2mr13721605wma.66.1568643352509;
        Mon, 16 Sep 2019 07:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643352; cv=none;
        d=google.com; s=arc-20160816;
        b=fROfKELpndsnNFdu285+Q1IlVuK43KSmnaGf67lyqLDQGyyozGliZMKdLdzrjGTT5u
         +qMiFKtYvEZ0fCpaElo5La7OrnGGTG4BMbnTcG8SzBauz/Yas8Jbk1LFrYjSXzO5F+t8
         NydqCELxwt/tLexS2In7jzYaLl7OoicZ1FrCjnoewRqtGNOhwXbdnYRqOP19l7aFmMQn
         /n/MJnMIO5Xre7VX3wZLOj1Nfw6nso1BTar4jWNy3N0yJR4AoYjHMbVAI+sdWpMGoQH3
         xuVsPXUi8vSO+2crwVk+b2QJBml2zCV7WVdEOxqIlWRDtDHaR7QgtrPvWtyOyNzan5bq
         85bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zGtF7wePyTsFnBePrFWXafT2YX5OltqEDRO5DE8ar0c=;
        b=Hwy+RRdOH8oojEdJggPq2zRwrGXsJ/LGeqL6lSpgig1JYMsvz7fWVEVId/vKCiUJvN
         xr9IXHZaQD+ifOGNrI0rCTRNPo7X6D8zp/EjTb/SAjtDMVwg/QnzYfrC0lpd/IpNtUY1
         LvRe1pVYEHcQ4/EVuJa0AhSOZpvHEAnv6jQFZT61fGQv9SPCZfYcAMt+aTEVdD1jiWqd
         bGHlQAPMjN+5H1+hpLPBk4jv59L3Zh0PZ6UjPtURDsse0t3PYaf6IgGUBUnyEhblY7sv
         ad/RQO1BZPGD8iwrfCa37dGJAcU546FOU2IKFSXq9PFWc+k2Ef/vfPzDNTeoquZl/+gO
         TA6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuNI4ZJc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z72sor7017079wmc.29.2019.09.16.07.15.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuNI4ZJc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zGtF7wePyTsFnBePrFWXafT2YX5OltqEDRO5DE8ar0c=;
        b=xuNI4ZJcE8VCUgo1/FvrTHiB/2ypwXZe5MQd/wnI9UyuN9Ouu0RXUs+ytJUB9pQwkF
         FFpjBmZiD0zHgAkC/eqBVgbXbhEl7Ld0gx7LFVC5hQASbmUpcmoX6OxtixVR7fVGTzaj
         F1tNA+Ky9aRWkqpqgguI8gwoIoImPzgOL8PbmWRi0YmJ+C4kkhw5OiapwPnK6hLPVmAV
         K5gSKF1oAvdXbaNHp9k+DaDI9DScisGz7UuD3NJFGXdPd9jU4uNlNiuBn19fQXXmiBcy
         WKe8Ei1cAGS50GCwY9Mo4TT4rnanUjieVHtmtQQZYIWgtXYLYCn2s+6WZ03vvcU7RgFQ
         hoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zGtF7wePyTsFnBePrFWXafT2YX5OltqEDRO5DE8ar0c=;
        b=OnDjd0sYCog9YvlLh9fAz5XP6lG8VLm/6FkIW3wp3qYgKmB6qqzqDoYxU7YAwZQ8ut
         cuKjdGQpGTmjGQmUaCbX5UcWPu/jb2jPedDTFkGac5QoOW9UhXeNkMdZc+yD8dSqDRl6
         sXWyoXSeAqeVLfpYMLtwEmyjpT81dpvjgFVEgI6SsT87qT7kU/Ue2cNOYT3MOCDuO3ko
         sMBsDK9tL/K6cjg4dnV1oHT7phOFE6I3PhFChJqHXNaLNtrgk6ro2K/KxfV9cXr+UyFs
         5DQiKX3zZ5ldtHbqwpn0NHMu7ib0FD3C34AtbVAdX/mIduJkEW3GkwJxLKFru3Y7ufDn
         mQ4A==
X-Gm-Message-State: APjAAAWf327ure5gPDoYW2nGUMg5tBAJIqR7MTt//6C3EO8b7REuRyFc
	LLlGHG8KRcFU4EejNgkVMkKCXx+3
X-Google-Smtp-Source: APXvYqyuNf1xIeBkWcgxvn14ERwBLqkrzUia6IT3wGt1cwbHFwB8iDEzSuJN4atGOuk3Z+AJmHfnxg==
X-Received: by 2002:a1c:49d4:: with SMTP id w203mr13443030wma.132.1568643352128;
        Mon, 16 Sep 2019 07:15:52 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 04/15] target/arm/arm-semi: Make semihosting code hand out its own file descriptors
Date: Mon, 16 Sep 2019 15:15:33 +0100
Message-Id: <20190916141544.17540-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bte7/hty/ep+

Currently the Arm semihosting code returns the guest file descriptors
(handles) which are simply the fd values from the host OS or the
remote gdbstub. Part of the semihosting 2.0 specification requires
that we implement special handling of opening a ":semihosting-features"
filename. Guest fds which result from opening the special file
won't correspond to host fds, so to ensure that we don't end up
with duplicate fds we need to have QEMU code control the allocation
of the fd values we give the guest.

Add in an abstraction layer which lets us allocate new guest FD
values, and translate from a guest FD value back to the host one.
This also fixes an odd hole where a semihosting guest could
use the semihosting API to read, write or close file descriptors
that it had never allocated but which were being used by QEMU itself.
(This isn't a security hole, because enabling semihosting permits
the guest to do arbitrary file access to the whole host filesystem,
and so should only be done if the guest is completely trusted.)

Currently the only kind of guest fd is one which maps to a
host fd, but in a following commit we will add one which maps
to the :semihosting-features magic data.

If the guest is migrated with an open semihosting file descriptor
then subsequent attempts to use the fd will all fail; this is
not a change from the previous situation (where the host fd
being used on the source end would not be re-opened on the
destination end).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Change since v1: we mustn't treat the return value of
arm_gdb_syscall() as being the new fd from gdb, as in
softmmu mode it is not. So we need a custom callback for open
that can update the guestfd association.
---
 target/arm/arm-semi.c | 232 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 216 insertions(+), 16 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 302529f2278..a4741d7e11b 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -106,6 +106,113 @@ static int open_modeflags[12] = {
     O_RDWR | O_CREAT | O_APPEND | O_BINARY
 };
 
+typedef enum GuestFDType {
+    GuestFDUnused = 0,
+    GuestFDHost = 1,
+} GuestFDType;
+
+/*
+ * Guest file descriptors are integer indexes into an array of
+ * these structures (we will dynamically resize as necessary).
+ */
+typedef struct GuestFD {
+    GuestFDType type;
+    int hostfd;
+} GuestFD;
+
+static GArray *guestfd_array;
+
+/*
+ * Allocate a new guest file descriptor and return it; if we
+ * couldn't allocate a new fd then return -1.
+ * This is a fairly simplistic implementation because we don't
+ * expect that most semihosting guest programs will make very
+ * heavy use of opening and closing fds.
+ */
+static int alloc_guestfd(void)
+{
+    guint i;
+
+    if (!guestfd_array) {
+        /* New entries zero-initialized, i.e. type GuestFDUnused */
+        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+    }
+
+    for (i = 0; i < guestfd_array->len; i++) {
+        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
+
+        if (gf->type == GuestFDUnused) {
+            return i;
+        }
+    }
+
+    /* All elements already in use: expand the array */
+    g_array_set_size(guestfd_array, i + 1);
+    return i;
+}
+
+/*
+ * Look up the guestfd in the data structure; return NULL
+ * for out of bounds, but don't check whether the slot is unused.
+ * This is used internally by the other guestfd functions.
+ */
+static GuestFD *do_get_guestfd(int guestfd)
+{
+    if (!guestfd_array) {
+        return NULL;
+    }
+
+    if (guestfd < 0 || guestfd >= guestfd_array->len) {
+        return NULL;
+    }
+
+    return &g_array_index(guestfd_array, GuestFD, guestfd);
+}
+
+/*
+ * Associate the specified guest fd (which must have been
+ * allocated via alloc_fd() and not previously used) with
+ * the specified host fd.
+ */
+static void associate_guestfd(int guestfd, int hostfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDHost;
+    gf->hostfd = hostfd;
+}
+
+/*
+ * Deallocate the specified guest file descriptor. This doesn't
+ * close the host fd, it merely undoes the work of alloc_fd().
+ */
+static void dealloc_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDUnused;
+}
+
+/*
+ * Given a guest file descriptor, get the associated struct.
+ * If the fd is not valid, return NULL. This is the function
+ * used by the various semihosting calls to validate a handle
+ * from the guest.
+ * Note: calling alloc_guestfd() or dealloc_guestfd() will
+ * invalidate any GuestFD* obtained by calling this function.
+ */
+static GuestFD *get_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    if (!gf || gf->type == GuestFDUnused) {
+        return NULL;
+    }
+    return gf;
+}
+
 #ifdef CONFIG_USER_ONLY
 static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
 {
@@ -207,6 +314,34 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 #endif
 }
 
+static int arm_semi_open_guestfd;
+
+static void arm_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = cs->opaque;
+#endif
+    if (ret == (target_ulong)-1) {
+#ifdef CONFIG_USER_ONLY
+        ts->swi_errno = err;
+#else
+        syscall_err = err;
+#endif
+        dealloc_guestfd(arm_semi_open_guestfd);
+    } else {
+        associate_guestfd(arm_semi_open_guestfd, ret);
+        ret = arm_semi_open_guestfd;
+    }
+
+    if (is_a64(env)) {
+        env->xregs[0] = ret;
+    } else {
+        env->regs[0] = ret;
+    }
+}
+
 static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
                                     const char *fmt, ...)
 {
@@ -283,6 +418,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 #else
     CPUARMState *ts = env;
 #endif
+    GuestFD *gf;
 
     if (is_a64(env)) {
         /* Note that the syscall number is in W0, not X0 */
@@ -295,6 +431,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
     switch (nr) {
     case TARGET_SYS_OPEN:
+    {
+        int guestfd;
+
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
@@ -308,26 +447,52 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             errno = EINVAL;
             return set_swi_errno(ts, -1);
         }
+
+        guestfd = alloc_guestfd();
+        if (guestfd < 0) {
+            unlock_user(s, arg0, 0);
+            errno = EMFILE;
+            return set_swi_errno(ts, -1);
+        }
+
         if (strcmp(s, ":tt") == 0) {
             int result_fileno = arg1 < 4 ? STDIN_FILENO : STDOUT_FILENO;
+            associate_guestfd(guestfd, result_fileno);
             unlock_user(s, arg0, 0);
-            return result_fileno;
+            return guestfd;
         }
         if (use_gdb_syscalls()) {
-            ret = arm_gdb_syscall(cpu, arm_semi_cb, "open,%s,%x,1a4", arg0,
+            arm_semi_open_guestfd = guestfd;
+            ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
                                   (int)arg2+1, gdb_open_modeflags[arg1]);
         } else {
             ret = set_swi_errno(ts, open(s, open_modeflags[arg1], 0644));
+            if (ret == (uint32_t)-1) {
+                dealloc_guestfd(guestfd);
+            } else {
+                associate_guestfd(guestfd, ret);
+                ret = guestfd;
+            }
         }
         unlock_user(s, arg0, 0);
         return ret;
+    }
     case TARGET_SYS_CLOSE:
         GET_ARG(0);
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", arg0);
-        } else {
-            return set_swi_errno(ts, close(arg0));
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
         }
+
+        if (use_gdb_syscalls()) {
+            ret = arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
+        } else {
+            ret = set_swi_errno(ts, close(gf->hostfd));
+        }
+        dealloc_guestfd(arg0);
+        return ret;
     case TARGET_SYS_WRITEC:
         qemu_semihosting_console_outc(env, args);
         return 0xdeadbeef;
@@ -338,17 +503,24 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         GET_ARG(2);
         len = arg2;
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             arm_semi_syscall_len = len;
             return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
-                                   arg0, arg1, len);
+                                   gf->hostfd, arg1, len);
         } else {
             s = lock_user(VERIFY_READ, arg1, len, 1);
             if (!s) {
                 /* Return bytes not written on error */
                 return len;
             }
-            ret = set_swi_errno(ts, write(arg0, s, len));
+            ret = set_swi_errno(ts, write(gf->hostfd, s, len));
             unlock_user(s, arg1, 0);
             if (ret == (uint32_t)-1) {
                 ret = 0;
@@ -361,10 +533,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         GET_ARG(2);
         len = arg2;
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             arm_semi_syscall_len = len;
             return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
-                                   arg0, arg1, len);
+                                   gf->hostfd, arg1, len);
         } else {
             s = lock_user(VERIFY_WRITE, arg1, len, 0);
             if (!s) {
@@ -372,7 +551,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 return len;
             }
             do {
-                ret = set_swi_errno(ts, read(arg0, s, len));
+                ret = set_swi_errno(ts, read(gf->hostfd, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
             if (ret == (uint32_t)-1) {
@@ -386,31 +565,52 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         return 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", arg0);
+            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
         } else {
-            return isatty(arg0);
+            return isatty(gf->hostfd);
         }
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
-                                   arg0, arg1);
+                                   gf->hostfd, arg1);
         } else {
-            ret = set_swi_errno(ts, lseek(arg0, arg1, SEEK_SET));
+            ret = set_swi_errno(ts, lseek(gf->hostfd, arg1, SEEK_SET));
             if (ret == (uint32_t)-1)
               return -1;
             return 0;
         }
     case TARGET_SYS_FLEN:
         GET_ARG(0);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                                   arg0, arm_flen_buf(cpu));
+                                   gf->hostfd, arm_flen_buf(cpu));
         } else {
             struct stat buf;
-            ret = set_swi_errno(ts, fstat(arg0, &buf));
+            ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
             if (ret == (uint32_t)-1)
                 return -1;
             return buf.st_size;
-- 
2.20.1
