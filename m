Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3469942lff;
        Tue, 15 Jun 2021 18:12:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d30a:: with SMTP id p10mr2189280pju.104.1623805933763;
        Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623805933; cv=none;
        d=google.com; s=arc-20160816;
        b=bLF6GNtv241l+eokfwPlu9Aap42KxMBQ0VU5MbhizHZZhc/j9HpmcjNCT6+z30s6Go
         +KpmDZF1Oy/Zq2dBIzXZYNmf47LQeZYhmqWFa+jLnd0sSx0p5B6GnMStQMIrbml6BGY8
         lxgvR138rdHWFOAgcYkcpVfFs6Z61syR8EIV8X5mcxC99W2B9uPL6qqgDLqc2/j4+10f
         kHp9yfyZLUpgGIHmMBqBkcvtULIuy+erUdGu1lSGWtXraDS8y75xd47+E4Cap0TKa8sk
         CvpHA03f9N6qrneytS+R+zsJFFx4cU+i3pCfvljJk6oG5JDsnnZLObkzQZU6MzwE3zwx
         0aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8Y7lnR+2rZo6JZgZkMGROv3kdJ+G1tzBBjEC9+c66tY=;
        b=nJ4eBXJjpk3yseAH+fiI+Q7RzAdxlZfe/vyiJd3y9l2LlSf/wDDumE+7R//8hjrnCl
         1ObWnl6b44hHSKur7ygv64tY//upsJ+z1MDOCQfLgOranVW+Hj4f1g2hU0VzLctsbX7l
         2IQJrwmuriOA8M5aE+Qh7XY6F45WCYoC3/DdtjOh2lb8vX2vMaF4acyU4uI9kAOuac2k
         POAc+JEZxZbJkJQn9K2z6+yaHrTbAqWsuVODjkX23usiENg2gbeT1DEK9QxShuoxjf/4
         yImdS/q5YZWkesgbgI+qksramAOaIhWtcZjfpVwm2Caf6S9wt09EKhsNNU5kX+WBWzjM
         ZLwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJ04eVRg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c12sor347116pll.33.2021.06.15.18.12.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJ04eVRg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Y7lnR+2rZo6JZgZkMGROv3kdJ+G1tzBBjEC9+c66tY=;
        b=WJ04eVRgJbe6eHsz+zN8rb7NX4EueSbMvAB0XRmNm6CtVyWf4HbEhSoyR7wUk1+bgJ
         QJSUqSwFR0x+bO34knLs/pUeM/3Z3mspgY6QHpie6m1OivwKTBPdCZSgohd0ERUZWNM0
         1cW7UZdzHyvstc4+5nzo6ERhGdpDVgwnOyL3vHFTnZZAduK6wvWpXAaaDqLq0GL+m3AU
         UPoP37wfkO3pYQwrk+xinxGX07DYfPYHp7t+lJAQo97ISilUMW7l0Kk/Dfs+GA3tkRK7
         mts6ZXREhRg6NtgvR6hbbeocUtlKiAL9pplTGlJBCD/Aj/1DKr9vwbb+yPus1rWkGkq+
         BwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Y7lnR+2rZo6JZgZkMGROv3kdJ+G1tzBBjEC9+c66tY=;
        b=J2WlHtokizWHd1OcAkH9Jg/MvAfrI0rK5j+TzC8k/YFhKTTtzQlAadEyOsyC2dcuwl
         C4bTJhCKBk9AhnVDf7PZFYzL57iGgddj6bJnKWqXmcLQzzMY3ikYDSMxDlseKO5f9aPD
         kshCubkMyMshs3itkWOV6YKCZsYauQCohbNAC7I/HmnyasBuUD6J7sZILCm15brXXrGh
         Yw86s0k6lNbOOVTAKv8YZxrFzdm80nXNF+RsPgcr61gPEC2RydfekdK0YTpaPWW9cI0i
         Cg6Z8KVQPbCmBt6lVYSK4gk78BqeyjxCvXI68LzVtjEFsXPisv0U6XWePiDB7oDmZnyU
         PTGQ==
X-Gm-Message-State: AOAM530RPkKZXwhF5TyLhhGKfgsEUc/IHVX4z7hhHb8wrbOFCSwWqYlM
	2zqYk+lPBUIQA1ZZyEtq16o9cZ3A
X-Google-Smtp-Source: ABdhPJzBXxLUW7JbtJi3Q7frKOXgbrXIn0SDJLaiQebBZ3vDt8YYN/0CVsn6Nu9WEv5GSx1hpqg9xg==
X-Received: by 2002:a17:902:a981:b029:116:a139:6054 with SMTP id bh1-20020a170902a981b0290116a1396054mr6498117plb.60.1623805933175;
        Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:52 -0700
Message-Id: <20210616011209.1446045-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kiuzUUbYhwkz

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
index 2d30345fc2..b7c3c80c75 100644
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
+    _Static_assert(SIGFRAME_FDPIC_OFS <= 0xfff);
+    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb sigframe */
+    _Static_assert(SIGFRAME_FDPIC_OFS <= 0xff << 2);
+    _Static_assert((SIGFRAME_FDPIC_OFS & 3) == 0);
+    __put_user(0x9a00e9dd | (SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    /* ARM rt_sigframe */
+    _Static_assert(RT_SIGFRAME_FDPIC_OFS <= 0xfff);
+    __put_user(0xe59d9000 | RT_SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb rt_sigframe */
+    _Static_assert(RT_SIGFRAME_FDPIC_OFS <= 0xff << 2);
+    _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) == 0);
+    __put_user(0x9a00e9dd | (RT_SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    unlock_user(tramp, sigtramp_page, total_size);
+}
-- 
2.25.1
