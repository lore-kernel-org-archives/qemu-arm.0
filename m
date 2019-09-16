Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4067846wrp;
        Mon, 16 Sep 2019 07:15:53 -0700 (PDT)
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr32114wrw.108.1568643353677;
        Mon, 16 Sep 2019 07:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568643353; cv=none;
        d=google.com; s=arc-20160816;
        b=itHabl+LtTCTR6YPofPCNoO4upEVWBAvCeGVwtiB5durIPvLvtyEOiHBptyoAz+kkg
         UjRvxe7ZMaAVDTjmxqjgdnNFZsGgZJ95pwP9aqOELC/EAhOY1D8chMWBwWTQNmf3BVYy
         8Wa04L/FdfcBe1iDS3oza3ljs6zdjvVHcKWDWU8fj+KDSGayRfZzNPWWkfVe1G+PbDtg
         Yz51K4adLgHASgCq60TT/IcUHX4sxJAUnCUHZ43Bv4Ti+ageW13SND5HIhWR8Hj51LVJ
         kcbdicpJ+LVSYOq+ZkimiDNUJPYjdg7mHCCFVqkxogsBHhVoj4W7TrGqQwgIqCNeQb1O
         CIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JrBf8fxBHvOF8tG3dL8+QUmu7l6sNcvSOAp9ypkMt/s=;
        b=KD2b32fB4kRANALWzgtLotGnPgsnjOExKGxeO8pD8HL1suZ09Dxwyo3sz8CI8fmnmt
         pJaZ9jvrGLy/4SwREBne5oaQN7q/qXWuNUrd3v9C6KJZdeN1QVNoKD/+Kb6zeoW2J4JU
         dCe1pFgnnt7mVyAoKsONrz8diUt0PDSLE1TazAfIBB4Sm1M1Wbz7kmCmpO3UOMIynbLr
         fAt5WShvHAT66R0dc6iLJ6cLr8Lw+Du9jdYo+mv9ofzRrjJSKUyB0BgnuCGJ4dF/dBbB
         vbRXWnuieHAci8Hx5qOX/WjXb9or5Rlmh2DRWuSPuOc4xHQMWFACxzcGs5mO5nltMMa1
         GGeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6NHrntb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i15sor4210023wml.24.2019.09.16.07.15.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Sep 2019 07:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6NHrntb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrBf8fxBHvOF8tG3dL8+QUmu7l6sNcvSOAp9ypkMt/s=;
        b=P6NHrntbsaFiirDv0faAxcpSCjv/GPHPWr+QVGUo+ETbfNP39cxRaTDlTNe94IJP+o
         qgVGiLlO0KJ9JagR58m3nyWKoqcFWX8HZxO4c1Q4J12vzg9EIyhAxGZY0gXW7e1ElsW/
         LFSYs53c8rKzn0FUMNlTsMprJfZ+mcVRBGAMRGH9immKFs7fm2oxxY8+EXM1qPLWPjdK
         zuuPqxqm3zWyrchBXqsfif21QoFOD5jAmkB9DBnC09idjkb+4QZlGVf5NPu4X7MnjOr1
         VVHZobM6ra2dnxQY/sCPtkWjpDGl+prnQRLLnSysYsLpllqB1RhWn+PRdHsl0IR1U4PC
         6GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrBf8fxBHvOF8tG3dL8+QUmu7l6sNcvSOAp9ypkMt/s=;
        b=V5zart+TzXMFPyPN8kBGIn3BC/T7hsDUuc4L25B5XiVmZB2rpC1fvfzgjVqIZe7kui
         aU9QTznckoagt+gPDnrF7lOQloxjc7ukPY6v2leVcSzf/6wgpGyjwYyjsF/4IuCmHH/F
         S5H8oEjbbTrSdQPDCCLi0IRKnXmxSAYrua0BfjaCr5cIDPcyXk3iP4qGj/Ju7z1tGRAg
         tYh7A/ByFgaqhIKjE4ABO68/kB+oLdxfLGpFgbR7S+lLeJLvcv29MhC/CDbSHTvhcpws
         Ky3O85Zq7fvykm7de16vTA/rRDisYEhVrOK6SU6oIcEZNVOFQTCpZbsiVYxIdnkWUSbE
         6hzQ==
X-Gm-Message-State: APjAAAU2wEqKQT3qYzYlOKebJmyl5ifHu1OEOE4u+RZWfY74J4G1GYGc
	snudpjGGjjxB6PpjBXpPiH+6y1aS
X-Google-Smtp-Source: APXvYqwm4VQR9MHriuHthUMoHo3m+HOva1UCE/QIzpEdNBB7XNqYt0jJj7JSlPRa4b1PJhGvrU725Q==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr8226546wmj.25.1568643353344;
        Mon, 16 Sep 2019 07:15:53 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s9sm15185884wme.36.2019.09.16.07.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 07:15:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/15] target/arm/arm-semi: Restrict use of TaskState*
Date: Mon, 16 Sep 2019 15:15:34 +0100
Message-Id: <20190916141544.17540-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916141544.17540-1-peter.maydell@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: o/QYSVeug5TT

The semihosting code needs accuss to the linux-user only
TaskState pointer so it can set the semihosting errno per-thread
for linux-user mode. At the moment we do this by having some
ifdefs so that we define a 'ts' local in do_arm_semihosting()
which is either a real TaskState * or just a CPUARMState *,
depending on which mode we're compiling for.

This is awkward if we want to refactor do_arm_semihosting()
into other functions which might need to be passed the TaskState.
Restrict usage of the TaskState local by:
 * making set_swi_errno() always take the CPUARMState pointer
   and (for the linux-user version) get TaskState from that
 * creating a new get_swi_errno() which reads the errno
 * having the two semihosting calls which need the TaskState
   for other purposes (SYS_GET_CMDLINE and SYS_HEAPINFO)
   define a variable with scope restricted to just that code

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We use 'CPUARMState *', aka 'env', rather than the other
options of passing the ARMCPU* or the CPUState *, purely
because it means that the later refactoring of each SYS_*
can pass just the CPUARMState * and incidentally avoid
an ugly ifdef caused by the implicit use of env in the
softmmu lock_user().
---
 target/arm/arm-semi.c | 111 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index a4741d7e11b..2618588076f 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -213,26 +213,45 @@ static GuestFD *get_guestfd(int guestfd)
     return gf;
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
-{
-    if (code == (uint32_t)-1)
-        ts->swi_errno = errno;
-    return code;
-}
-#else
+/*
+ * The semihosting API has no concept of its errno being thread-safe,
+ * as the API design predates SMP CPUs and was intended as a simple
+ * real-hardware set of debug functionality. For QEMU, we make the
+ * errno be per-thread in linux-user mode; in softmmu it is a simple
+ * global, and we assume that the guest takes care of avoiding any races.
+ */
+#ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
+#include "exec/softmmu-semi.h"
+#endif
+
 static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
 {
     if (code == (uint32_t)-1) {
+#ifdef CONFIG_USER_ONLY
+        CPUState *cs = env_cpu(env);
+        TaskState *ts = cs->opaque;
+
+        ts->swi_errno = errno;
+#else
         syscall_err = errno;
+#endif
     }
     return code;
 }
 
-#include "exec/softmmu-semi.h"
+static inline uint32_t get_swi_errno(CPUARMState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    CPUState *cs = env_cpu(env);
+    TaskState *ts = cs->opaque;
+
+    return ts->swi_errno;
+#else
+    return syscall_err;
 #endif
+}
 
 static target_ulong arm_semi_syscall_len;
 
@@ -379,12 +398,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
     if (is_a64(env)) {                                  \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(ts, -1);               \
+            return set_swi_errno(env, -1);              \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(ts, -1);               \
+            return set_swi_errno(env, -1);              \
         }                                               \
     }                                                   \
 } while (0)
@@ -413,11 +432,6 @@ target_ulong do_arm_semihosting(CPUARMState *env)
     int nr;
     uint32_t ret;
     uint32_t len;
-#ifdef CONFIG_USER_ONLY
-    TaskState *ts = cs->opaque;
-#else
-    CPUARMState *ts = env;
-#endif
     GuestFD *gf;
 
     if (is_a64(env)) {
@@ -440,19 +454,19 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         s = lock_user_string(arg0);
         if (!s) {
             errno = EFAULT;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
         if (arg1 >= 12) {
             unlock_user(s, arg0, 0);
             errno = EINVAL;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         guestfd = alloc_guestfd();
         if (guestfd < 0) {
             unlock_user(s, arg0, 0);
             errno = EMFILE;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (strcmp(s, ":tt") == 0) {
@@ -466,7 +480,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
                                   (int)arg2+1, gdb_open_modeflags[arg1]);
         } else {
-            ret = set_swi_errno(ts, open(s, open_modeflags[arg1], 0644));
+            ret = set_swi_errno(env, open(s, open_modeflags[arg1], 0644));
             if (ret == (uint32_t)-1) {
                 dealloc_guestfd(guestfd);
             } else {
@@ -483,13 +497,13 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
             ret = arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
         } else {
-            ret = set_swi_errno(ts, close(gf->hostfd));
+            ret = set_swi_errno(env, close(gf->hostfd));
         }
         dealloc_guestfd(arg0);
         return ret;
@@ -507,7 +521,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
@@ -520,7 +534,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 /* Return bytes not written on error */
                 return len;
             }
-            ret = set_swi_errno(ts, write(gf->hostfd, s, len));
+            ret = set_swi_errno(env, write(gf->hostfd, s, len));
             unlock_user(s, arg1, 0);
             if (ret == (uint32_t)-1) {
                 ret = 0;
@@ -537,7 +551,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
@@ -551,7 +565,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 return len;
             }
             do {
-                ret = set_swi_errno(ts, read(gf->hostfd, s, len));
+                ret = set_swi_errno(env, read(gf->hostfd, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
             if (ret == (uint32_t)-1) {
@@ -569,7 +583,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
@@ -584,14 +598,14 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
                                    gf->hostfd, arg1);
         } else {
-            ret = set_swi_errno(ts, lseek(gf->hostfd, arg1, SEEK_SET));
+            ret = set_swi_errno(env, lseek(gf->hostfd, arg1, SEEK_SET));
             if (ret == (uint32_t)-1)
               return -1;
             return 0;
@@ -602,7 +616,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(ts, -1);
+            return set_swi_errno(env, -1);
         }
 
         if (use_gdb_syscalls()) {
@@ -610,7 +624,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                                    gf->hostfd, arm_flen_buf(cpu));
         } else {
             struct stat buf;
-            ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
+            ret = set_swi_errno(env, fstat(gf->hostfd, &buf));
             if (ret == (uint32_t)-1)
                 return -1;
             return buf.st_size;
@@ -628,9 +642,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             s = lock_user_string(arg0);
             if (!s) {
                 errno = EFAULT;
-                return set_swi_errno(ts, -1);
+                return set_swi_errno(env, -1);
             }
-            ret =  set_swi_errno(ts, remove(s));
+            ret =  set_swi_errno(env, remove(s));
             unlock_user(s, arg0, 0);
         }
         return ret;
@@ -648,9 +662,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             s2 = lock_user_string(arg2);
             if (!s || !s2) {
                 errno = EFAULT;
-                ret = set_swi_errno(ts, -1);
+                ret = set_swi_errno(env, -1);
             } else {
-                ret = set_swi_errno(ts, rename(s, s2));
+                ret = set_swi_errno(env, rename(s, s2));
             }
             if (s2)
                 unlock_user(s2, arg2, 0);
@@ -661,7 +675,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
     case TARGET_SYS_CLOCK:
         return clock() / (CLOCKS_PER_SEC / 100);
     case TARGET_SYS_TIME:
-        return set_swi_errno(ts, time(NULL));
+        return set_swi_errno(env, time(NULL));
     case TARGET_SYS_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
@@ -672,18 +686,14 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             s = lock_user_string(arg0);
             if (!s) {
                 errno = EFAULT;
-                return set_swi_errno(ts, -1);
+                return set_swi_errno(env, -1);
             }
-            ret = set_swi_errno(ts, system(s));
+            ret = set_swi_errno(env, system(s));
             unlock_user(s, arg0, 0);
             return ret;
         }
     case TARGET_SYS_ERRNO:
-#ifdef CONFIG_USER_ONLY
-        return ts->swi_errno;
-#else
-        return syscall_err;
-#endif
+        return get_swi_errno(env);
     case TARGET_SYS_GET_CMDLINE:
         {
             /* Build a command-line from the original argv.
@@ -706,6 +716,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             int status = 0;
 #if !defined(CONFIG_USER_ONLY)
             const char *cmdline;
+#else
+            TaskState *ts = cs->opaque;
 #endif
             GET_ARG(0);
             GET_ARG(1);
@@ -733,21 +745,21 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             if (output_size > input_size) {
                 /* Not enough space to store command-line arguments.  */
                 errno = E2BIG;
-                return set_swi_errno(ts, -1);
+                return set_swi_errno(env, -1);
             }
 
             /* Adjust the command-line length.  */
             if (SET_ARG(1, output_size - 1)) {
                 /* Couldn't write back to argument block */
                 errno = EFAULT;
-                return set_swi_errno(ts, -1);
+                return set_swi_errno(env, -1);
             }
 
             /* Lock the buffer on the ARM side.  */
             output_buffer = lock_user(VERIFY_WRITE, arg0, output_size, 0);
             if (!output_buffer) {
                 errno = EFAULT;
-                return set_swi_errno(ts, -1);
+                return set_swi_errno(env, -1);
             }
 
             /* Copy the command-line arguments.  */
@@ -763,7 +775,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             if (copy_from_user(output_buffer, ts->info->arg_start,
                                output_size)) {
                 errno = EFAULT;
-                status = set_swi_errno(ts, -1);
+                status = set_swi_errno(env, -1);
                 goto out;
             }
 
@@ -785,6 +797,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             target_ulong retvals[4];
             target_ulong limit;
             int i;
+#ifdef CONFIG_USER_ONLY
+            TaskState *ts = cs->opaque;
+#endif
 
             GET_ARG(0);
 
@@ -834,7 +849,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 if (fail) {
                     /* Couldn't write back to argument block */
                     errno = EFAULT;
-                    return set_swi_errno(ts, -1);
+                    return set_swi_errno(env, -1);
                 }
             }
             return 0;
-- 
2.20.1
