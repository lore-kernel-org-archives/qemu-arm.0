Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1856699lff;
        Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
X-Received: by 2002:a65:6a16:: with SMTP id m22mr11651094pgu.29.1624044596119;
        Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624044596; cv=none;
        d=google.com; s=arc-20160816;
        b=uWxpZTiJQRhKqcEuh+szdaikI0ZMQYSza5UjFg1qDTpCghmidDVJho1S06aRLg57l6
         xxwjFlxS7q/3Cr6RMyDcLy5w38yN//rET5H8z9toX6Aew52wZYoBUSwEnwTJjM7mGXTx
         FLfjuaQnT2gXopFnk/BW3fO6Cxgvc13FDMe5pl0APQmBCBSBeoiXNBqWvt/QOudK7Zow
         IjxQljHA+bimBiHlUlkrib9UVy8/cB9vx04ITB2MsNzWlwjR+ajomMeDMiy6tF2F349z
         IibPY9RWWjnVbqagGhrOw1R0oY56q+OqhOmZRSLa//QkTe0Cz4iqbNqq8oJGy7c+Am4+
         ZEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BNQDUVyR3ttAl/s4i0xlO2IvPvq1tkDghI/KxgsvylI=;
        b=KuPHa1MXypu1+oRneUIOd8bFk85/9rQQSq5Pusb9SYmRD2m66MbQ4qQ/mFn56w5ZFP
         aCCoOE/p8eHetRXw+LO2KwZ4qwGN2wXjVI9bso5HdyYliSidX2Pe42Ju5xG+OXxgbG7G
         p72h8F6PrO6LSBtfLVN7ytc2kwtiXZFQxklxWzoubonOdxM1nDGLBSqA8SahA+4JNVgX
         XPyJMHppl4h0CQFFf0qBW2T/IWnOacpw8/4qzJXZtkuvVk9/A4MsQHgY9hVW7Fhr4x3W
         yDp2I7i9poN+nUQGzdkPh8gqsCsg1lXmAHcFV3XvG30TKgTMRaDWIMROhFtk3KErkgNp
         l9NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC1CWAdQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k23sor5346704pls.73.2021.06.18.12.29.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AC1CWAdQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BNQDUVyR3ttAl/s4i0xlO2IvPvq1tkDghI/KxgsvylI=;
        b=AC1CWAdQvfJEvLg1Akyz7PpKMSo5AtgvImyYJq9b8w9PNfynfZJnTqke3HXHaRPrhm
         HNM9VOzfKu7/ZkIYCb0VQDNnbCuKEtbgxZqbrCDvTOaXNDAmAeyEhasYaGvZaKYPAMYa
         DXMl+NdhCPqP3pKl4HhzBhIyj3aCfKVeRhQMYKAv+vjKNtO9IfVfoocSAqQTg3PnK6h6
         Rom33ECpxZW8e9N9XVxFFzjYMtSvQN/bj8JXfR3fzAxZQS0YNy6e3t8/cBL8ZJdInTkV
         vOgvmtMsYw3sgB4X0rOxRt81GCtmb7Cxq8HNv2qNBp4XR7txBM45nPRmXPhQ9a/c2AjO
         sIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BNQDUVyR3ttAl/s4i0xlO2IvPvq1tkDghI/KxgsvylI=;
        b=dQ1lQIC38e37p8NIVZuGZtdAdOYUjpUxu2LtxLsqCR0o67Uz0UCr4dj0nHrNftMFyh
         ffItB17OmKFm5k/AQpyjoljGGQWawbUqW66B0H9vXYpP/L8qjKqbgEuLSIyrekNi4yhu
         vk0HpuLI4ptsLNwDEaKQYNtqITbiOb3MXoSj2/TRTFiDfhiq05gkzfMEzYFswX+rJpBq
         yEnKY478oolv2GyShkjzRoqSPXNa7sD5DvaBCQofYPEZuJ1HlguRR0VTOp2PWhoAaVS9
         RU5bl1dGkgC+Ts8ZOlLde/y2JwVULMEloD19CHTCopNKBsSl7DfSPWmDkjoEsZb/q6pe
         uFDw==
X-Gm-Message-State: AOAM533VnsEJLZsHI6YlgK9gT7C/oXpMpnv12APeXjM/j9yW8Caev+Oa
	G87dmpMolZ0gGdzlCafFGpGiCJOW
X-Google-Smtp-Source: ABdhPJx4EZCjuWDopqawF6ieZS7OMH1OO355kYq36I4GWGQatiDkEQDynD29XHD++yTJ6o2q7m/yQQ==
X-Received: by 2002:a17:902:788d:b029:11f:6a5d:d5e2 with SMTP id q13-20020a170902788db029011f6a5dd5e2mr6264138pll.16.1624044595256;
        Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/23] linux-user/arm: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:33 -0700
Message-Id: <20210618192951.125651-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yHKLZYBQjZAV

ARM is more complicated than the others, in that we also
have trampolines for using SA_RESTORER with FDPIC, and
we need to create trampolines for both ARM and Thumb modes.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_signal.h |   2 +
 linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
 2 files changed, 100 insertions(+), 72 deletions(-)

diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
index 0998dd6dfa..1e7fb0cecb 100644
--- a/linux-user/arm/target_signal.h
+++ b/linux-user/arm/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* ARM_TARGET_SIGNAL_H */
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 2d30345fc2..63bdd59ab9 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -101,13 +101,12 @@ struct sigframe_v1
 {
     struct target_sigcontext sc;
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
-    abi_ulong retcode[4];
 };
 
 struct sigframe_v2
 {
     struct target_ucontext_v2 uc;
-    abi_ulong retcode[4];
+    abi_ulong fdpic_ret;
 };
 
 struct rt_sigframe_v1
@@ -116,49 +115,20 @@ struct rt_sigframe_v1
     abi_ulong puc;
     struct target_siginfo info;
     struct target_ucontext_v1 uc;
-    abi_ulong retcode[4];
 };
 
 struct rt_sigframe_v2
 {
     struct target_siginfo info;
     struct target_ucontext_v2 uc;
-    abi_ulong retcode[4];
+    abi_ulong fdpic_ret;
 };
 
 /*
- * For ARM syscalls, we encode the syscall number into the instruction.
+ * Stubs needed to make sure the FD register (r9) contains the right value.
+ * There are 4 of them, each consuming 8 bytes.
  */
-#define SWI_SYS_SIGRETURN       (0xef000000|(TARGET_NR_sigreturn + ARM_SYSCALL_BASE))
-#define SWI_SYS_RT_SIGRETURN    (0xef000000|(TARGET_NR_rt_sigreturn + ARM_SYSCALL_BASE))
-
-/*
- * For Thumb syscalls, we pass the syscall number via r7.  We therefore
- * need two 16-bit instructions.
- */
-#define SWI_THUMB_SIGRETURN     (0xdf00 << 16 | 0x2700 | (TARGET_NR_sigreturn))
-#define SWI_THUMB_RT_SIGRETURN  (0xdf00 << 16 | 0x2700 | (TARGET_NR_rt_sigreturn))
-
-static const abi_ulong retcodes[4] = {
-        SWI_SYS_SIGRETURN,      SWI_THUMB_SIGRETURN,
-        SWI_SYS_RT_SIGRETURN,   SWI_THUMB_RT_SIGRETURN
-};
-
-/*
- * Stub needed to make sure the FD register (r9) contains the right
- * value.
- */
-static const unsigned long sigreturn_fdpic_codes[3] = {
-    0xe59fc004, /* ldr r12, [pc, #4] to read function descriptor */
-    0xe59c9004, /* ldr r9, [r12, #4] to setup GOT */
-    0xe59cf000  /* ldr pc, [r12] to jump into restorer */
-};
-
-static const unsigned long sigreturn_fdpic_thumb_codes[3] = {
-    0xc008f8df, /* ldr r12, [pc, #8] to read function descriptor */
-    0x9004f8dc, /* ldr r9, [r12, #4] to setup GOT */
-    0xf000f8dc  /* ldr pc, [r12] to jump into restorer */
-};
+static abi_ulong sigreturn_fdpic_tramp;
 
 static inline int valid_user_regs(CPUARMState *regs)
 {
@@ -219,13 +189,12 @@ get_sigframe(struct target_sigaction *ka, CPUARMState *regs, int framesize)
 
 static int
 setup_return(CPUARMState *env, struct target_sigaction *ka,
-             abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_addr)
+             abi_ulong frame_addr, int usig)
 {
     abi_ulong handler = 0;
     abi_ulong handler_fdpic_GOT = 0;
     abi_ulong retcode;
-
-    int thumb;
+    int thumb, retcode_idx;
     int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
 
     if (is_fdpic) {
@@ -243,6 +212,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     }
 
     thumb = handler & 1;
+    retcode_idx = thumb + (ka->sa_flags & TARGET_SA_SIGINFO ? 2 : 0);
 
     uint32_t cpsr = cpsr_read(env);
 
@@ -260,37 +230,24 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
-            /* For FDPIC we ensure that the restorer is called with a
-             * correct r9 value.  For that we need to write code on
-             * the stack that sets r9 and jumps back to restorer
-             * value.
+            /*
+             * For FDPIC we ensure that the restorer is called with a
+             * correct r9 value.  For that we use a special trampoline
+             * that reads the function descriptor from the frame,
+             * sets r9 and jumps back to restorer value.
              */
-            if (thumb) {
-                __put_user(sigreturn_fdpic_thumb_codes[0], rc);
-                __put_user(sigreturn_fdpic_thumb_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_thumb_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
-            } else {
-                __put_user(sigreturn_fdpic_codes[0], rc);
-                __put_user(sigreturn_fdpic_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
-            }
-
-            retcode = rc_addr + thumb;
+            abi_ulong fd_ofs = (retcode_idx & 2
+                                ? offsetof(struct rt_sigframe_v2, fdpic_ret)
+                                : offsetof(struct sigframe_v2, fdpic_ret));
+            put_user_ual(ka->sa_restorer, frame_addr + fd_ofs);
+            /* Each trampoline variant consumes 8-byte slot. */
+            retcode = sigreturn_fdpic_tramp + retcode_idx * 8 + thumb;
         } else {
             retcode = ka->sa_restorer;
         }
     } else {
-        unsigned int idx = thumb;
-
-        if (ka->sa_flags & TARGET_SA_SIGINFO) {
-            idx += 2;
-        }
-
-        __put_user(retcodes[idx], rc);
-
-        retcode = rc_addr + thumb;
+        /* Each trampoline variant consumes one 4-byte slot. */
+        retcode = default_sigreturn + retcode_idx * 4 + thumb;
     }
 
     env->regs[0] = usig;
@@ -394,8 +351,7 @@ static void setup_frame_v1(int usig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->extramask[i - 1]);
     }
 
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v1, retcode))) {
+    if (setup_return(regs, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -419,8 +375,7 @@ static void setup_frame_v2(int usig, struct target_sigaction *ka,
 
     setup_sigframe_v2(&frame->uc, set, regs);
 
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v2, retcode))) {
+    if (setup_return(regs, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -475,8 +430,7 @@ static void setup_rt_frame_v1(int usig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v1, retcode))) {
+    if (setup_return(env, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -509,8 +463,7 @@ static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
 
     setup_sigframe_v2(&frame->uc, set, env);
 
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v2, retcode))) {
+    if (setup_return(env, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -841,3 +794,76 @@ long do_rt_sigreturn(CPUARMState *env)
         return do_rt_sigreturn_v1(env);
     }
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    enum {
+        /* For ARM, we encode the syscall number into the instruction. */
+        SWI_SYS_SIGRETURN =
+            0xef000000 | (TARGET_NR_sigreturn + ARM_SYSCALL_BASE),
+        SWI_SYS_RT_SIGRETURN =
+            0xef000000 | (TARGET_NR_rt_sigreturn + ARM_SYSCALL_BASE),
+
+        /*
+         * For Thumb , we pass the syscall number via r7.
+         * We therefore need two 16-bit instructions.
+         */
+        SWI_THUMB_SIGRETURN =
+            0xdf00 << 16 | 0x2700 | TARGET_NR_sigreturn,
+        SWI_THUMB_RT_SIGRETURN =
+            0xdf00 << 16 | 0x2700 | TARGET_NR_rt_sigreturn,
+
+        SIGFRAME_FDPIC_OFS = offsetof(struct sigframe_v2, fdpic_ret),
+        RT_SIGFRAME_FDPIC_OFS = offsetof(struct rt_sigframe_v2, fdpic_ret),
+    };
+
+    uint32_t total_size = 4 * 4 + 2 * 8;
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, total_size, 0);
+    uint32_t i = 0;
+
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(SWI_SYS_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_THUMB_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_SYS_RT_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_THUMB_RT_SIGRETURN, &tramp[i++]);
+
+    /*
+     * FDPIC require trampolines to call sa_restorer.
+     *
+     * ARM versions use:
+     *    ldr   r9, [sp, #ofs]
+     *    ldmia r9, {r9, pc}
+     *
+     * Thumb versions use:
+     *    ldrd  r9, r10, [sp, #ofs]
+     *    bx    r10
+     *    nop
+     */
+    sigreturn_fdpic_tramp = sigtramp_page + i * 4;
+
+    /* ARM sigframe */
+    QEMU_BUILD_BUG_ON(SIGFRAME_FDPIC_OFS > 0xfff);
+    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb sigframe */
+    QEMU_BUILD_BUG_ON(SIGFRAME_FDPIC_OFS > 0xff << 2);
+    QEMU_BUILD_BUG_ON(SIGFRAME_FDPIC_OFS & 3);
+    __put_user(0x9a00e9dd | (SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    /* ARM rt_sigframe */
+    QEMU_BUILD_BUG_ON(RT_SIGFRAME_FDPIC_OFS > 0xfff);
+    __put_user(0xe59d9000 | RT_SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb rt_sigframe */
+    QEMU_BUILD_BUG_ON(RT_SIGFRAME_FDPIC_OFS > 0xff << 2);
+    QEMU_BUILD_BUG_ON(RT_SIGFRAME_FDPIC_OFS & 3);
+    __put_user(0x9a00e9dd | (RT_SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    unlock_user(tramp, sigtramp_page, total_size);
+}
-- 
2.25.1
