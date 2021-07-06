Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2602709lfk;
        Tue, 6 Jul 2021 16:49:43 -0700 (PDT)
X-Received: by 2002:a63:515f:: with SMTP id r31mr23054196pgl.406.1625615382833;
        Tue, 06 Jul 2021 16:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625615382; cv=none;
        d=google.com; s=arc-20160816;
        b=wc56IjYNBg3wWWhqBRJcip6fq6A50+iktEOPAc+YTVDiGumcsks0vVuvtMV2LUfyAl
         lrVPx4+3WftrUFLpQw0cc4wDlNQyu24lcH4CYJdtN3/VcK0ojend+Nvzctb5tWqQfGDa
         z1SX8DDnIDqca1ktMFbl8kfsZTZu7dMLw+45uorJazwCf30qJ55VxkLswHJIjLbnr0Rz
         +Tu+bq32Q2mv7o85yedNFmqFOO0u3OOQkyyw1sSdowIzYsrqIWfmwOJlU2qYF64i3/lj
         CM2pEtyge8p/I9ZElQxwlJnGwAhNNA7QOPp8vtNqslaJgg9ilZN/FP779y571ZpymMlU
         Dhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hwVQg6JfrKcWBzKjLQvWYej+HfhSntpRLUvINIA96YI=;
        b=Ewkm/xZt90K328jOLfj+sz4us3/hlkwK10gW6ODnPCvYBd1Nr+dwj9fMmENlVW0VX1
         xdPVsYR0sdf0z1LoROVMH4tMMz/FW3nR+uaL+y52JLblo007xI2jZisPK0ROusksVZv7
         /BAReCgS/FZM5GaawFXJJjit9B5I91z5O9tneGXdGva+vLTLavOxUCZRifXIIxJ5ORJ8
         QiX8j4S+Y08nAaLW+SE1JFYt9ZEYqu1KcJp7AZ5K3O6AGym9tK7eLisxNrz98PnCz4PO
         zLbFYtL+aVfVnEGNgEiA+rccgk9gnM4LHVMrm3oN1cqf+Hj0vkvr0MtfXiQEWP8FLurP
         JQrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CG31aZ1Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c21sor25451pfv.62.2021.07.06.16.49.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jul 2021 16:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CG31aZ1Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hwVQg6JfrKcWBzKjLQvWYej+HfhSntpRLUvINIA96YI=;
        b=CG31aZ1Q1UoD/nk2lA8WNWHRZAyBMyGxO4pTT318c6mRXTbOBGpkdQi+WyIPCezNrB
         AXny0prqngMOX18DMhr5xMHaSv2L7ht+hfTujQi60LxDdJRv+9IxoGzbjJjoO+BF354p
         1OF0RYLKoXkwTlxEX4BmlN73QMPHaDLYrZ3w8HfjFx1oh5MWfTwbCxhsdIpAohQ4F5Bu
         +v8g5bCHqXtvx+FzjNfFa6zlEzdyetG+PMedG5WKj4SzXaq89YORXuP1IBHNtMEHnUtA
         a4YqFUVmJOBBFeeWlej54nLiogkYPoubnhLGhjOWcoT0YUJdPUPf+gQbqt3ECyDeTAuy
         nn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwVQg6JfrKcWBzKjLQvWYej+HfhSntpRLUvINIA96YI=;
        b=lGkyZsOJfvvyThOP5zosnLZCwtcsJ2U/KqvHKdX6DePdYONJOPmbjrahM2yA5lsGGk
         3hevFiUC29Hbs3eQFGcv7ufxsONUPRxDmDPeLJtHx56C3t86s881qjY5M5PllisjkbjQ
         5SEW6w5cmj83DZkB4GdupFHQ5huTvagJSm0833kpr3KB0l7ukKSCsz4dF2i5wP64+edA
         7DU2uY7FcStyMaByloCDLc7HvXO9ktBPk14eosrpWIBvoid8FbOjuCOpKFR+SuyVUTmD
         7A1ZrQ/Nz3w1mWwnbc/xFWU6q4Ob+0uddwTMGRFssxnhCiKPp6B5ivjpV+i5SpMzfSzm
         opcA==
X-Gm-Message-State: AOAM533UeWmisQCMC2Evsa/WMQch+2IaILnKIGFe3dSO+ouHO0S1vyXJ
	Q9dvJnfux7IbIO+/ZVFG0491cC5Y
X-Google-Smtp-Source: ABdhPJysAH1REYD6lBTqv36FxjoihfPPEaVgsJSF3tGJNJXu3zobLCJwKqBmSj1XdsRUbbxJrJF1aQ==
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id s15-20020aa7828f0000b02902006e278c8fmr22828734pfm.44.1625615382299;
        Tue, 06 Jul 2021 16:49:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 16:49:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 13/36] linux-user/arm: Drop v1 signal frames
Date: Tue,  6 Jul 2021 16:49:09 -0700
Message-Id: <20210706234932.356913-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gx4h76yxEVHD

Version 2 signal frames are used from 2.6.12.
Since cbc14e6f286, we have set UNAME_MINIMUM_RELEASE to 2.6.32,
which means that version 1 signal frames are never used.

Cc: qemu-arm@nongnu.org
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 220 +---------------------------------------
 1 file changed, 4 insertions(+), 216 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302..f8288ab51c 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -45,14 +45,6 @@ struct target_sigcontext {
     abi_ulong fault_address;
 };
 
-struct target_ucontext_v1 {
-    abi_ulong tuc_flags;
-    abi_ulong tuc_link;
-    target_stack_t tuc_stack;
-    struct target_sigcontext tuc_mcontext;
-    target_sigset_t  tuc_sigmask;       /* mask last for extensibility */
-};
-
 struct target_ucontext_v2 {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
@@ -97,28 +89,12 @@ struct target_iwmmxt_sigframe {
 #define TARGET_VFP_MAGIC 0x56465001
 #define TARGET_IWMMXT_MAGIC 0x12ef842a
 
-struct sigframe_v1
-{
-    struct target_sigcontext sc;
-    abi_ulong extramask[TARGET_NSIG_WORDS-1];
-    abi_ulong retcode[4];
-};
-
 struct sigframe_v2
 {
     struct target_ucontext_v2 uc;
     abi_ulong retcode[4];
 };
 
-struct rt_sigframe_v1
-{
-    abi_ulong pinfo;
-    abi_ulong puc;
-    struct target_siginfo info;
-    struct target_ucontext_v1 uc;
-    abi_ulong retcode[4];
-};
-
 struct rt_sigframe_v2
 {
     struct target_siginfo info;
@@ -363,37 +339,6 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     }
 }
 
-/* compare linux/arch/arm/kernel/signal.c:setup_frame() */
-static void setup_frame_v1(int usig, struct target_sigaction *ka,
-                           target_sigset_t *set, CPUARMState *regs)
-{
-    struct sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, regs, sizeof(*frame));
-    int i;
-
-    trace_user_setup_frame(regs, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    setup_sigcontext(&frame->sc, regs, set->sig[0]);
-
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->extramask[i - 1]);
-    }
-
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
-}
-
 static void setup_frame_v2(int usig, struct target_sigaction *ka,
                            target_sigset_t *set, CPUARMState *regs)
 {
@@ -422,60 +367,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_frame_v2(usig, ka, set, regs);
-    } else {
-        setup_frame_v1(usig, ka, set, regs);
-    }
-}
-
-/* compare linux/arch/arm/kernel/signal.c:setup_rt_frame() */
-static void setup_rt_frame_v1(int usig, struct target_sigaction *ka,
-                              target_siginfo_t *info,
-                              target_sigset_t *set, CPUARMState *env)
-{
-    struct rt_sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
-    struct target_sigaltstack stack;
-    int i;
-    abi_ulong info_addr, uc_addr;
-
-    trace_user_setup_rt_frame(env, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    info_addr = frame_addr + offsetof(struct rt_sigframe_v1, info);
-    __put_user(info_addr, &frame->pinfo);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe_v1, uc);
-    __put_user(uc_addr, &frame->puc);
-    tswap_siginfo(&frame->info, info);
-
-    /* Clear all the bits of the ucontext we don't use.  */
-    memset(&frame->uc, 0, offsetof(struct target_ucontext_v1, tuc_mcontext));
-
-    memset(&stack, 0, sizeof(stack));
-    target_save_altstack(&stack, env);
-    memcpy(&frame->uc.tuc_stack, &stack, sizeof(stack));
-
-    setup_sigcontext(&frame->uc.tuc_mcontext, env, set->sig[0]);
-    for(i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    env->regs[1] = info_addr;
-    env->regs[2] = uc_addr;
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
+    setup_frame_v2(usig, ka, set, regs);
 }
 
 static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
@@ -516,11 +408,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_rt_frame_v2(usig, ka, info, set, env);
-    } else {
-        setup_rt_frame_v1(usig, ka, info, set, env);
-    }
+    setup_rt_frame_v2(usig, ka, info, set, env);
 }
 
 static int
@@ -554,54 +442,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     return err;
 }
 
-static long do_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct sigframe_v1 *frame = NULL;
-    target_sigset_t set;
-    sigset_t host_set;
-    int i;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    __get_user(set.sig[0], &frame->sc.oldmask);
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __get_user(set.sig[i], &frame->extramask[i - 1]);
-    }
-
-    target_to_host_sigset_internal(&host_set, &set);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->sc)) {
-        goto badframe;
-    }
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
-}
-
 static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
 {
     int i;
@@ -734,55 +574,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_sigreturn_v2(env);
-    } else {
-        return do_sigreturn_v1(env);
-    }
-}
-
-static long do_rt_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct rt_sigframe_v1 *frame = NULL;
-    sigset_t host_set;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_rt_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    target_to_host_sigset(&host_set, &frame->uc.tuc_sigmask);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
-
-    target_restore_altstack(&frame->uc.tuc_stack, env);
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return do_sigreturn_v2(env);
 }
 
 static long do_rt_sigreturn_v2(CPUARMState *env)
@@ -823,9 +615,5 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_rt_sigreturn_v2(env);
-    } else {
-        return do_rt_sigreturn_v1(env);
-    }
+    return do_rt_sigreturn_v2(env);
 }
-- 
2.25.1
