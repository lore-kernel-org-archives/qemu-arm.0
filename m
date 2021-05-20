Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp271397lfm;
        Thu, 20 May 2021 08:29:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBEJv1dNRzbY+qHctsLJCUFmEt+BwLq2QhQLnWCQSSkd7R3Vu6J1emhnCAoP8PkWNnjs4+
X-Received: by 2002:a6b:8b58:: with SMTP id n85mr2584292iod.196.1621524550190;
        Thu, 20 May 2021 08:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621524550; cv=none;
        d=google.com; s=arc-20160816;
        b=HjFqD8NlC5uh+4iWusEBKYn3QBJZGjDjSQkjbdtHRqjxM9ITETMSZDDCAQEbPf/FIE
         ++8lBomM8SQV2L4SKDY/XCKngyrq/q/slu9tSRok96hzQ4xuHQkH9CrPjGfZZ96+fGAd
         FSQRFp9KwCQ9gujjF0vcxnBkAaZ2a3lJ+vZ+e0pns7t9SbAtsfzPnJWqBVB5bY406BaK
         7909IHs/Ht58arJ2/pzKFgWuE+kUNmD+Q0F9I6SZGK++AZ1L4JCzgl5j2VgG1nh2tSZA
         W0lZ2RiEBtgwTiBm7qWfUoOOQu8eSbfY8ys4tcZo7PT1ej3U4UL0wuFWkl6JxXcoTQdd
         Mukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UgJyl6SmpghGPffAzR64zbb98zEqURj95gernOR9oB4=;
        b=1EG+YKF5xRnCwJk/byjzuTtSDbCkcV72B1sn0NmmbMZGbAVu1iZRGkTQ9wcinqqrO4
         ah51hm3DziNyP3YMTCP4wKxpj3DmTi7z/RBa8FSlS/DQEW8hTlxQXPreEwxIWHcTQF5O
         Pq1UcM40jiblo1WDOj2ZZNaKoeD/E+zep1Dgyir90V8xmDkvbal+cGe5Lo/9sHHCL3TE
         VGpTg9RccCIMDcLFaKVFPHAEDVO33umCiwZBdogTjpHJiapbow/UVP+I6oE7WX8RcSR/
         DSwXpuZkFIWeI7O76AeijbNNsHm8IfJCBvJNiY8FsZ5oQfjt09Mmx2jMk+NEB/FMibCy
         z5QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltOff0Kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si3163271ilm.11.2021.05.20.08.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltOff0Kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkbl-0008F4-Dx
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbT-00082o-94
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbR-0000gr-3v
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id t206so9468196wmf.0
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UgJyl6SmpghGPffAzR64zbb98zEqURj95gernOR9oB4=;
 b=ltOff0KfVmFfHNnp9Q6l6JrPCOGaOOzh1ZotQ/fmpAcmhFRPxxhQeN/IGm+Dqnz/gE
 /ux3Ic6wIt7MLuQFWRRwsHS4L2RQzEqI7Ol3RgB9wrxTIwYIBRMf0Hu1DTGngjubYL7Z
 /fzLLbi+zkVqK/GJ2loXtIu4UmwNztUgvDyRTfqPQuQY7+GCi3VIYWIhTbio1N0s8ByP
 cC10blu4mFbs6PVjpGPy5P/ML1sVh9CrsFrSLcYVEDbUJi52MXQdZT9Jg5mv47Nq1x6v
 vOOgynulybouxM31s2BYBDybNmXOLm5VyD5Df0uPQJdGKw0kU16D2jNUndyvJM8sJ1Ia
 Jv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgJyl6SmpghGPffAzR64zbb98zEqURj95gernOR9oB4=;
 b=OrK+y317GkvF21xyMVGIvNqOph8W+E1RvhCC+tQ2TwfiP/AI71VMgcFXWxzBK+w5+R
 eQNNGYf1jzhFzcL2p8OLtZXegIw7DpFccWAc6JK6DLpbpLBH9pHYQrXMI5EYCUaqKw/9
 Y1offQc2UR86p/4P6eNebE/iyMs5MwM+G78J/0hc6oTmu/RGO704emK+V/3XIVk5wNNf
 ZFZxARS5RbLHNHmfFneqqpNGCyfoaUODgWOWQnxWQIOYb1+eBtWZkb0obsb6BwKrA2yS
 JUOgDBQVu30NAzL2Sga3BF9AUHnAu9q8agNOpR/skSjVkPnmWP0qn849UccW6HTncCVW
 PvAg==
X-Gm-Message-State: AOAM532/8I0aLrCjRd81CELpgA7NvBicSaP8GPcv8seh+8nWehI9uB63
 gs3Ec8/5UqxKdqZJTjNBZzMS6dhI8QL/DfWZ
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr4709920wml.122.1621524527742; 
 Thu, 20 May 2021 08:28:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/arm: Make FPSCR.LTPSIZE writable for MVE
Date: Thu, 20 May 2021 16:28:38 +0100
Message-Id: <20210520152840.24453-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: N2vm/d8dNq2j

The M-profile FPSCR has an LTPSIZE field, but if MVE is not
implemented it is read-only and always reads as 4; this is how QEMU
currently handles it.

Make the field writable when MVE is implemented.

We can safely add the field to the MVE migration struct because
currently no CPUs enable MVE and so the migration struct is never
used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 3 ++-
 target/arm/machine.c    | 1 +
 target/arm/vfp_helper.c | 9 ++++++---
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b0237f0dc83..0e33db88240 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -563,7 +563,7 @@ typedef struct CPUARMState {
         uint32_t fpdscr[M_REG_NUM_BANKS];
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
-        int ltpsize;
+        uint32_t ltpsize;
         uint32_t vpr;
     } v7m;
 
@@ -1561,6 +1561,7 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 
 #define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
 #define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+#define FPCR_LTPSIZE_LENGTH 3
 
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 62a71a3b640..81e30de8243 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -332,6 +332,7 @@ static const VMStateDescription vmstate_m_mve = {
     .needed = mve_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.vpr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ltpsize, ARMCPU),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f7..e0886ab5a56 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -195,8 +195,10 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
+    if (!cpu_isar_feature(any_fp16, cpu)) {
         val &= ~FPCR_FZ16;
     }
 
@@ -210,11 +212,12 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
          * because in v7A no-short-vector-support cores still had to
          * allow Stride/Len to be written with the only effect that
          * some insns are required to UNDEF if the guest sets them.
-         *
-         * TODO: if M-profile MVE implemented, set LTPSIZE.
          */
         env->vfp.vec_len = extract32(val, 16, 3);
         env->vfp.vec_stride = extract32(val, 20, 2);
+    } else if (cpu_isar_feature(aa32_mve, cpu)) {
+        env->v7m.ltpsize = extract32(val, FPCR_LTPSIZE_SHIFT,
+                                     FPCR_LTPSIZE_LENGTH);
     }
 
     if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.20.1

