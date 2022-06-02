Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5195696lfh;
        Thu, 2 Jun 2022 14:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaGA1VNX6ZixCITnMmb2Rv3/EeQtWHkqFDQp61EYqWGl78L/As5sDxMByWVo9NDu5By3wo
X-Received: by 2002:ac8:4e50:0:b0:304:c8f1:fc48 with SMTP id e16-20020ac84e50000000b00304c8f1fc48mr5213077qtw.592.1654206583651;
        Thu, 02 Jun 2022 14:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206583; cv=none;
        d=google.com; s=arc-20160816;
        b=rtgzGrfXoDEM9aaqYbgiXLQlPZYZM0K4rBK4DQgPjvRXPLpQNHYG+4jgiu/s60aL+S
         KfSZiPghNwlpwd7G8xchFD69ka+xiDZspNuyDAg9b2xlExcY6rkBQ0EIaTEq7TNUTBSZ
         HHSvRN0PnVDf6c1Zo8Fyhdt+4oYEyOP7idh+kKzUXr/63eMxS0qt2FRetMpaxlk2IC4s
         2OMvhcGiL7QRS78oof3CnCYhDIzLkAOHICWWa0cQXc0srioZXbh1bP3ML/ExgSnnD4NH
         82eWavRDHOPl4VVL/tdocUrSiGa1uf1BuBVUSvdV2dzVJnBP6BKNerLSfhauTDXl18K+
         qyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BnYlj1QWtoxKlbicrTFs8TmSm+Qpy+0FoE3R3RxAx04=;
        b=s1x2/iNVcIxzIvklxYbtTD15rzajefHJH/d2Q8cL2/T0mPJbNiCV7Og2UAte0NCJD6
         p8UvxhAA7Z89Z76+H7sPujjzPMNLJ3SzgHJEy3aU20ldzUzgRM9mpfC5dtU6w3VLMDkm
         yrAL3IVw/sXKRcG2fnOSEHaIc0Hoc8ailMf+zxQLdWgx5o3MGyY8AaECbF0cp0khr41T
         J9a1ySlm4BR3RTZpneuv5Gng2vOnsIqOtwfYXgAhr20oXteTIHBX3q7w6q3otDo/HM2X
         ZRVyFmce5mYIkfQJkj9Jb0aYTSV0dzotu3YT3uO/yBxpOV/cHLPn1hLnlhfZC3Hmkgbk
         2tGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPb7Aazh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05622a02cf00b002f917ce5e62si2647431qtx.152.2022.06.02.14.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPb7Aazh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwshL-0004Rz-2P
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsge-0004QA-8r
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgc-0008UD-1m
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:48:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso6070513pjb.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BnYlj1QWtoxKlbicrTFs8TmSm+Qpy+0FoE3R3RxAx04=;
 b=DPb7AazhBnPiJ/I9UdyRKp+2L6bEJMFCf0lvlhKV4q5ZlmgIY7+c5HI/Ta+Y4EyAmr
 dTfC5SZyr0mnV3NlyQrcU4eWsAmvSYGEAttlEUF5WMrOgQHR2IPcZroWpdTgQjUYeeld
 t5uYb41KApfLfA/xcSSBAo19fCrg0MBVO2bWAdk8hXBWGvwciJyPiyGJHEjs/Ag22yme
 8aULnzdGjNAXC9j0AfanGOQtD2JzbTAS7SAxPrEOaqNbhuu1vGEB2W29afWRvSLKocs9
 h5BBz5JXk48RSpRVHHra2l2U8rzzTPCH2Oobxhw5cll/sUhCeKiZPRpZaFXykaPAYgn2
 584g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BnYlj1QWtoxKlbicrTFs8TmSm+Qpy+0FoE3R3RxAx04=;
 b=QaaT04GliRtVusKB+AIFmRDXGPQ8DE7p8+a6JYcEZALbPtUgitONawc8wYFfYIFvlr
 pHXt31Z4/9/9pEY4GObrzuoUHm5pXc6GKuTVVfmBQSEgm16Ey3Frn4DOzqnytD0yigXa
 M26H9Inpo0DmSVAUYI0U8tMz2BQhql0cbWMMAvbjzoBcsTCK/7zQjO3fiz13L3gdlGX/
 Y7ogVrVv6zNCJBKTcakpOLnDFJLel0Jqy6W7lKuwh7oM0JBC8KLv66BkN2N5IyG7pm77
 bG9y9eru5DWXWFr2Sta+zUrIkTanq4HbZLsSsqmHxpWga9HMQYlxrkwZaaDP4fHL5hdb
 UcTw==
X-Gm-Message-State: AOAM533Popf5GQMvx5Y0s+bfxEM/NgGCMOxPD/RlCius9MuiQn06LZdw
 kgg8bRfjJRdKsZvUeJf/+zKe2A==
X-Received: by 2002:a17:90a:7e02:b0:1e0:a6a7:6eb with SMTP id
 i2-20020a17090a7e0200b001e0a6a706ebmr7445024pjl.203.1654206536631; 
 Thu, 02 Jun 2022 14:48:56 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/71] linux-user/aarch64: Introduce sve_vq_cached
Date: Thu,  2 Jun 2022 14:47:44 -0700
Message-Id: <20220602214853.496211-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: HNAJ7Gvx2lFU

Add an interface function to extract the digested vector length
rather than the raw zcr_el[1] value.  This fixes an incorrect
return from do_prctl_set_vl where we didn't take into account
the set of vector lengths supported by the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add sve_vq_cached rather than directly access hflags.
---
 linux-user/aarch64/target_prctl.h | 20 +++++++++++++-------
 target/arm/cpu.h                  | 11 +++++++++++
 linux-user/aarch64/signal.c       |  4 ++--
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933..fdd973e07d 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return sve_vq_cached(env) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,24 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
-        vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        old_vq = sve_vq_cached(env);
 
+        /*
+         * Bound the value of arg2, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild to
+         * sort out the length supported by the cpu.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, ARM_MAX_VQ);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = sve_vq_cached(env);
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 015ce12fe2..830d358d46 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3286,6 +3286,17 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
+/**
+ * sve_vq_cached
+ * @env: the cpu context
+ *
+ * Return the VL cached within env->hflags, in units of quadwords.
+ */
+static inline int sve_vq_cached(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, VL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9..30e89f67c8 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = sve_vq_cached(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = sve_vq_cached(env);
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.34.1

