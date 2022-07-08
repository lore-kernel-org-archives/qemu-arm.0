Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp351127lft;
        Fri, 8 Jul 2022 08:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t54DWiKcbZWY/6Ytv8b9hF1qkHQbs9h3PB5iJVcaWWvyGwv3S2I3KdtV55AKo1ZfN320WA
X-Received: by 2002:a05:6214:29c3:b0:473:2ae:e92a with SMTP id gh3-20020a05621429c300b0047302aee92amr3120583qvb.36.1657295464638;
        Fri, 08 Jul 2022 08:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295464; cv=none;
        d=google.com; s=arc-20160816;
        b=F0pnnqg9FpXj7ARTBVynVzRwtWtU0HfGfYTQBB0PJlqbPmC672M6obDUsifV+bzRxR
         i8fDDnF4vSQnD4cFqYIs+5kRXNuf5n7s0Vf3LTMbjWgMATJbG6av1gPyqfoy0mzNIlpb
         KxkmzORJkcDwycHqL6dcpHlbXQYLLAjaxPQ2MLuT1jkBQzDSbwUzwup6mNvsHCrkKyEa
         obyO8xjHhBj01hHQKyj5J41UNr4a32Vg/5jBmY9wMLxC7znd4Hy/m+503cnvdi2bq1r3
         uUx4EEK6SLGGSHoH4k2AVM76+gpjA0FDb9VWZd/YZkn7amkZ9vr1s4TKj8h/r2g4HhDh
         3t/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eZwyJS+DI6VXP8TVU6OuO37fm60h5FhLdjsLlNVqKXk=;
        b=mG2Hof7zCAzQVrvCHzM4E/YFxgDUDGCHwT0TWeZaOL8PuiKdrElTWs4mbpCMsUDTQZ
         nWiGh4imp/Q1C/de60C4aOgEKuLM6ZEn33kh0WzcYDu7NDqDjBsYL/Xk+BLykD95LbwP
         Wt8R7cY0x1qWK+Sb6QENay2+kYOvrOHg9srUCmEssh8HqWsnfPViMBQwamflDgZHbhMx
         1onUlRbWMixfGUWShyXcWIhADDY4Ib4sml532hsI7lxSU6jO6Bc1oqoYTtRYuolw8ebv
         GzmSeD93mU66LZNepnC8HdMQJ9JgYVl5UyWHqkuFOOa5GeT/6CIVzlzz7oyoGow3Y3V9
         PVlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0eUZFbw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05620a28d400b006b24cc136f7si18014258qkp.354.2022.07.08.08.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0eUZFbw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qG0-0002Vh-2o
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmo-0003Ec-Fi
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:20:54 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmm-0003EA-Dj
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:20:54 -0400
Received: by mail-pg1-x529.google.com with SMTP id e132so22617295pgc.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZwyJS+DI6VXP8TVU6OuO37fm60h5FhLdjsLlNVqKXk=;
 b=l0eUZFbwuXNFm8Z28qebRMsopGHJpOh4hwAKUJa9xlE4rhkqlSo146+GlWLg326yCB
 mMb1a5MV5kfzNGHAPiVdRP0MCGiOGkFU06+rLSlONe5uySBVUDvrzbfMTTTcGCffrDbi
 PFo05DkdAEeinAsA2yQ3rdu67oQGnyhQvUoTlRxYB1mfBCzH8fzknvIq7JN4RMXCQpxJ
 5vfayod/aZ625R7EGbquTsh25Zh6V0YClCPFOQ8gJIM+5jaHzUg6vrZ5SjgV5R1tnqMl
 rSh3swG6mnMh+tf/PPmyU7PUx2pHe/7Jtnuzq+xyvN8GT42+WXU+QjpfVWT+KjrEOxHn
 eB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZwyJS+DI6VXP8TVU6OuO37fm60h5FhLdjsLlNVqKXk=;
 b=cDLpLdhaerOTH2OEpbhzlvSSezOc0tgQC4Eb2oULY4U2izBgSTPe7NBL3EeEC9kwbi
 VtcxJrCNyKHzbn8hQeTt5zuwucuPqMbkDthhlVGGsOcRRabGaWz2oZ+S1gTw73EZPB0t
 vIArllhgBrhw4XdEZAYlYKccJwKKc6xE565y47zWiRy1h0H/b5ha8Z7peH5xN1ILY1Ck
 Gkq0rtjFcJiFj67V8aHea9hrdWrCyYQwqhX5PcXcoqpr1eFrozsGMiyAmm6xSL3BPIM/
 MunmsMB9sqCvxgzVakvpYk+uVBckP8jqnBOFHyXCyTWBrs7fEIZlrhxloRJY9GHJm2rw
 FFcw==
X-Gm-Message-State: AJIora/KcsQIsb09WZ/7a8jLh1oq2L/gNMR4LxUCHzl/njUGefU9e7v7
 zcIHagpGHtWoGNMcvK0cDKyymg==
X-Received: by 2002:a63:8649:0:b0:415:c328:4dff with SMTP id
 x70-20020a638649000000b00415c3284dffmr1053576pgd.430.1657293650994; 
 Fri, 08 Jul 2022 08:20:50 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:20:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 40/45] linux-user/aarch64: Implement SME signal handling
Date: Fri,  8 Jul 2022 20:45:35 +0530
Message-Id: <20220708151540.18136-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lc9xV58wBWA5

Set the SM bit in the SVE record on signal delivery, create the ZA record.
Restore SM and ZA state according to the records present on return.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 167 +++++++++++++++++++++++++++++++++---
 1 file changed, 154 insertions(+), 13 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 22d0b8b4ec..6a2c6e06d2 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -104,6 +104,22 @@ struct target_sve_context {
 
 #define TARGET_SVE_SIG_FLAG_SM  1
 
+#define TARGET_ZA_MAGIC        0x54366345
+
+struct target_za_context {
+    struct target_aarch64_ctx head;
+    uint16_t vl;
+    uint16_t reserved[3];
+    /* The actual ZA data immediately follows. */
+};
+
+#define TARGET_ZA_SIG_REGS_OFFSET \
+    QEMU_ALIGN_UP(sizeof(struct target_za_context), TARGET_SVE_VQ_BYTES)
+#define TARGET_ZA_SIG_ZAV_OFFSET(VQ, N) \
+    (TARGET_ZA_SIG_REGS_OFFSET + (VQ) * TARGET_SVE_VQ_BYTES * (N))
+#define TARGET_ZA_SIG_CONTEXT_SIZE(VQ) \
+    TARGET_ZA_SIG_ZAV_OFFSET(VQ, VQ * TARGET_SVE_VQ_BYTES)
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -176,9 +192,9 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
 }
 
 static void target_setup_sve_record(struct target_sve_context *sve,
-                                    CPUARMState *env, int vq, int size)
+                                    CPUARMState *env, int size)
 {
-    int i, j;
+    int i, j, vq = sve_vq(env);
 
     memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
@@ -207,6 +223,35 @@ static void target_setup_sve_record(struct target_sve_context *sve,
     }
 }
 
+static void target_setup_za_record(struct target_za_context *za,
+                                   CPUARMState *env, int size)
+{
+    int vq = sme_vq(env);
+    int vl = vq * TARGET_SVE_VQ_BYTES;
+    int i, j;
+
+    memset(za, 0, sizeof(*za));
+    __put_user(TARGET_ZA_MAGIC, &za->head.magic);
+    __put_user(size, &za->head.size);
+    __put_user(vl, &za->vl);
+
+    if (size == TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
+        return;
+    }
+    assert(size == TARGET_ZA_SIG_CONTEXT_SIZE(vq));
+
+    /*
+     * Note that ZA vectors are stored as a byte stream,
+     * with each byte element at a subsequent address.
+     */
+    for (i = 0; i < vl; ++i) {
+        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __put_user_e(env->zarray[i].d[j], z + j, le);
+        }
+    }
+}
+
 static void target_restore_general_frame(CPUARMState *env,
                                          struct target_rt_sigframe *sf)
 {
@@ -252,16 +297,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 
 static bool target_restore_sve_record(CPUARMState *env,
                                       struct target_sve_context *sve,
-                                      int size)
+                                      int size, int *svcr)
 {
-    int i, j, vl, vq;
+    int i, j, vl, vq, flags;
+    bool sm;
 
-    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+    __get_user(vl, &sve->vl);
+    __get_user(flags, &sve->flags);
+
+    sm = flags & TARGET_SVE_SIG_FLAG_SM;
+
+    /* The cpu must support Streaming or Non-streaming SVE. */
+    if (sm
+        ? !cpu_isar_feature(aa64_sme, env_archcpu(env))
+        : !cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         return false;
     }
 
-    __get_user(vl, &sve->vl);
-    vq = sve_vq(env);
+    /*
+     * Note that we cannot use sve_vq() because that depends on the
+     * current setting of PSTATE.SM, not the state to be restored.
+     */
+    vq = sve_vqm1_for_el_sm(env, 0, sm) + 1;
 
     /* Reject mismatched VL. */
     if (vl != vq * TARGET_SVE_VQ_BYTES) {
@@ -278,6 +335,8 @@ static bool target_restore_sve_record(CPUARMState *env,
         return false;
     }
 
+    *svcr = FIELD_DP64(*svcr, SVCR, SM, sm);
+
     /*
      * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
@@ -304,15 +363,57 @@ static bool target_restore_sve_record(CPUARMState *env,
     return true;
 }
 
+static bool target_restore_za_record(CPUARMState *env,
+                                     struct target_za_context *za,
+                                     int size, int *svcr)
+{
+    int i, j, vl, vq;
+
+    if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &za->vl);
+    vq = sme_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.ZA. */
+    if (size <= TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_ZA_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    *svcr = FIELD_DP64(*svcr, SVCR, ZA, 1);
+
+    for (i = 0; i < vl; ++i) {
+        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __get_user_e(env->zarray[i].d[j], z + j, le);
+        }
+    }
+    return true;
+}
+
 static int target_restore_sigframe(CPUARMState *env,
                                    struct target_rt_sigframe *sf)
 {
     struct target_aarch64_ctx *ctx, *extra = NULL;
     struct target_fpsimd_context *fpsimd = NULL;
     struct target_sve_context *sve = NULL;
+    struct target_za_context *za = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
     int sve_size = 0;
+    int za_size = 0;
+    int svcr = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -350,6 +451,14 @@ static int target_restore_sigframe(CPUARMState *env,
             sve_size = size;
             break;
 
+        case TARGET_ZA_MAGIC:
+            if (za || size < sizeof(struct target_za_context)) {
+                goto err;
+            }
+            za = (struct target_za_context *)ctx;
+            za_size = size;
+            break;
+
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
                 goto err;
@@ -381,9 +490,16 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+    if (sve && !target_restore_sve_record(env, sve, sve_size, &svcr)) {
         goto err;
     }
+    if (za && !target_restore_za_record(env, za, za_size, &svcr)) {
+        goto err;
+    }
+    if (env->svcr != svcr) {
+        env->svcr = svcr;
+        arm_rebuild_hflags(env);
+    }
     unlock_user(extra, extra_datap, 0);
     return 0;
 
@@ -451,7 +567,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         .total_size = offsetof(struct target_rt_sigframe,
                                uc.tuc_mcontext.__reserved),
     };
-    int fpsimd_ofs, fr_ofs, sve_ofs = 0, vq = 0, sve_size = 0;
+    int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0;
+    int sve_size = 0, za_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
@@ -461,11 +578,20 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                       &layout);
 
     /* SVE state needs saving only if it exists.  */
-    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = sve_vq(env);
-        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env)) ||
+        cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(sve_vq(env)), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        /* ZA state needs saving only if it is enabled.  */
+        if (FIELD_EX64(env->svcr, SVCR, ZA)) {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(sme_vq(env));
+        } else {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(0);
+        }
+        za_ofs = alloc_sigframe_space(za_size, &layout);
+    }
 
     if (layout.extra_ofs) {
         /* Reserve space for the extra end marker.  The standard end marker
@@ -512,7 +638,10 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         target_setup_end_record((void *)frame + layout.extra_end_ofs);
     }
     if (sve_ofs) {
-        target_setup_sve_record((void *)frame + sve_ofs, env, vq, sve_size);
+        target_setup_sve_record((void *)frame + sve_ofs, env, sve_size);
+    }
+    if (za_ofs) {
+        target_setup_za_record((void *)frame + za_ofs, env, za_size);
     }
 
     /* Set up the stack frame for unwinding.  */
@@ -536,6 +665,18 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
+    /*
+     * Invoke the signal handler with both SM and ZA disabled.
+     * When clearing SM, ResetSVEState, per SMSTOP.
+     */
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+    }
+    if (env->svcr) {
+        env->svcr = 0;
+        arm_rebuild_hflags(env);
+    }
+
     if (info) {
         tswap_siginfo(&frame->info, info);
         env->xregs[1] = frame_addr + offsetof(struct target_rt_sigframe, info);
-- 
2.34.1

