Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5223159lfh;
        Thu, 2 Jun 2022 15:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU6ulKgWudNZDFKhbL2amtn0dutj7vWQ1QXjR4HPYLs9zl0eQw85tt75SDo0DcP/tpJ7Cg
X-Received: by 2002:ac8:5e52:0:b0:2f9:3a62:68e9 with SMTP id i18-20020ac85e52000000b002f93a6268e9mr5477168qtx.173.1654210113493;
        Thu, 02 Jun 2022 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210113; cv=none;
        d=google.com; s=arc-20160816;
        b=alVIg0dJ7xjdAt2nuhcQqdBhTV7eLelzT6Yd7hUx1YEd1Z6Vlsu/46K4RsSUy38/D3
         Ojq+eLUSiBQ69G/XG5i/cFVQf2RNonBWuIer+AuITdXfY3o69j1VXC/Wjt+1h5bFvZRb
         K0cgsTDMJW6Pt8Xn1gxd3mpuP14rcqBzMMvx+c4fpXBygyDQO3spawHglIFJh0mWyXnX
         tl+WF25IwsO13OMw9lHnAVk873+r8dFb+6+Z2weUCZ9ptYygBDWRPrezGLjnF/QGQqcZ
         e16R2moT8T8MSO6T9rNVNafXXjWlWw7WvnXqAfz/7lV0FNDPeMAZPuFsjji3FrDaAtl9
         fj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1Il2EY1tYeQoGkETVU6ZiO8+VIpoFNiLUWrHdhwd5vU=;
        b=ntEUh+T0ezqNB6R591pnWwS6IymeiJXGLhqO7FE/hTtmGsqZgv/ZmHUSBe0CRFkAGV
         fjFG+BKnRPKP+hQdTAxu7u2qLM2mVbFQLhoHh63ZqGBexuXLIVSC6Lgh9AdRxsg8tAmR
         R7qQNuuicMfHbOHxhPJUkIzHVGN3tCfbaq661dBJt0RqNU+FGNzw4KOFSltJtBnZ9tTq
         LNTlkxqxmxFM5hCCTnen0jCdgDpAeJ4UNgc5aqyF1tT29YSKX+tVVxKKJ6WSVml7vILE
         jKRRDReltyfUvZiU32xYeP52W2xK0xq0COGSLmEMNahaM0eSPn+Y0o7GRWvSglHLFQno
         N2qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ad85cxzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05620a44cd00b006a37179fcd4si3010846qkp.536.2022.06.02.15.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ad85cxzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtcG-0002pD-VX
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskS-0001is-4R
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskP-0000v8-Jn
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:55 -0400
Received: by mail-pf1-x431.google.com with SMTP id 187so5797180pfu.9
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Il2EY1tYeQoGkETVU6ZiO8+VIpoFNiLUWrHdhwd5vU=;
 b=ad85cxztuPpNDJ4V2wwFUeNeV89mWgxashtc1pQiWYa/p9FCi8IIe/ppo07Lwm6NiJ
 MU/0JC5p7ucYCe+js76rlX3VTCv3O3d8pVpEt9s5ymrD4IHlz2fWNXgAvnx63ho/Ur8Y
 k4dcb9s2vtQiPiIq8dXEjnhtwj01PDZtr/uwm+F70BDqPnFIumpgF5Zq6UISAlxwNDTw
 tzGZ38BroU0pAb/WSPFm1DXinGA683bD/1mFeWMtZUTpMZ+GbILaqtdW3oXKo+exzrg2
 Zs6jU67tmCBrfBDTXiq0t3k5dshCSDymY0PgqZLZ70f+sLerLPjmsClBCZZK7pOsUSzQ
 MQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Il2EY1tYeQoGkETVU6ZiO8+VIpoFNiLUWrHdhwd5vU=;
 b=uMTTit42Nfg0JGBmYvxlhGWfw4wgaqOz+ffNIAeOvtGdS4WM6UOMybdVoSFuUr9/wF
 wTfsHMD5tmicPP2mk8W/gHTG450UKir7jKJN+rfqUzbQBsoJFWd+O8Y8hrO+aNT6uf/V
 mQ8hXTusV+Z/MY7OuLddSpuYuy/3kBPRJHGfv09MHEj7uHw6jwUN6CTcdUDDfhvCO1Cg
 32BzePzF5bus33m5o2h6+YPomBwEoZhd7UaATe3pN0BY6PTy5GiZIc3wOVJgdKMU8Mll
 xOJ+DRbUzJ1glc1cdCfBa1B4Ve+hI0BxrWCMVmOI3NZfqf8rgZoiAV/J/0+GTm71ZVOV
 HvQQ==
X-Gm-Message-State: AOAM531Eqoml0EXx4XM/+7U9x1ATu4t1b6PhQTmJmL+kDK19p3bekcat
 p2fAICQK0YRlodZGQjgc6WPpzA==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr7171764pfu.20.1654206772537; 
 Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 66/71] linux-user/aarch64: Implement SME signal handling
Date: Thu,  2 Jun 2022 14:48:48 -0700
Message-Id: <20220602214853.496211-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: MeIMn+8x4UJ2

Set the SM bit in the SVE record on signal delivery, create the ZA record.
Restore SM and ZA state according to the records present on return.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 158 ++++++++++++++++++++++++++++++++++--
 1 file changed, 149 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 73b15038ad..79b2fc1cfe 100644
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
@@ -207,6 +223,32 @@ static void target_setup_sve_record(struct target_sve_context *sve,
     }
 }
 
+static void target_setup_za_record(struct target_za_context *za,
+                                   CPUARMState *env, int vq, int size)
+{
+    int i, j, vl = vq * TARGET_SVE_VQ_BYTES;
+
+    memset(za, 0, sizeof(*za));
+    __put_user(TARGET_ZA_MAGIC, &za->head.magic);
+    __put_user(size, &za->head.size);
+    __put_user(vl, &za->vl);
+
+    if (size == TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
+        return;
+    }
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
@@ -252,16 +294,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 
 static bool target_restore_sve_record(CPUARMState *env,
                                       struct target_sve_context *sve,
-                                      int size)
+                                      int size, int *svcr)
 {
-    int i, j, vl, vq;
+    int i, j, vl, vq, flags;
+    bool sm;
 
+    /* ??? Kernel tests SVE && (!sm || SME); suggest (sm ? SME : SVE). */
     if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         return false;
     }
 
     __get_user(vl, &sve->vl);
-    vq = sve_vq_cached(env);
+    __get_user(flags, &sve->flags);
+
+    sm = flags & TARGET_SVE_SIG_FLAG_SM;
+    if (sm) {
+        if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+            return false;
+        }
+        vq = sme_vq_cached(env);
+    } else {
+        vq = sve_vq_cached(env);
+    }
 
     /* Reject mismatched VL. */
     if (vl != vq * TARGET_SVE_VQ_BYTES) {
@@ -278,6 +332,8 @@ static bool target_restore_sve_record(CPUARMState *env,
         return false;
     }
 
+    *svcr = FIELD_DP64(*svcr, SVCR, SM, sm);
+
     /*
      * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
@@ -304,15 +360,57 @@ static bool target_restore_sve_record(CPUARMState *env,
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
+    vq = sme_vq_cached(env);
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
 
@@ -350,6 +448,14 @@ static int target_restore_sigframe(CPUARMState *env,
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
@@ -381,9 +487,16 @@ static int target_restore_sigframe(CPUARMState *env,
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
 
@@ -451,7 +564,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         .total_size = offsetof(struct target_rt_sigframe,
                                uc.tuc_mcontext.__reserved),
     };
-    int fpsimd_ofs, fr_ofs, sve_ofs = 0, vq = 0, sve_size = 0;
+    int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0;
+    int sve_vq = 0, sve_size = 0, za_vq = 0, za_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
@@ -461,11 +575,22 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                       &layout);
 
     /* SVE state needs saving only if it exists.  */
-    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = sve_vq_cached(env);
-        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env)) ||
+        cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        sve_vq = sve_vq_cached(env);
+        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(sve_vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        /* ZA state needs saving only if it is enabled.  */
+        za_vq = sme_vq_cached(env);
+        if (FIELD_EX64(env->svcr, SVCR, ZA)) {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(za_vq);
+        } else {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(0);
+        }
+        za_ofs = alloc_sigframe_space(za_size, &layout);
+    }
 
     if (layout.extra_ofs) {
         /* Reserve space for the extra end marker.  The standard end marker
@@ -512,7 +637,10 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         target_setup_end_record((void *)frame + layout.extra_end_ofs);
     }
     if (sve_ofs) {
-        target_setup_sve_record((void *)frame + sve_ofs, env, vq, sve_size);
+        target_setup_sve_record((void *)frame + sve_ofs, env, sve_vq, sve_size);
+    }
+    if (za_ofs) {
+        target_setup_za_record((void *)frame + za_ofs, env, za_vq, za_size);
     }
 
     /* Set up the stack frame for unwinding.  */
@@ -536,6 +664,18 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
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

