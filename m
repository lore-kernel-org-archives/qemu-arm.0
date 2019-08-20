Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4459414wrs;
        Tue, 20 Aug 2019 14:12:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjdUKiPs6b2M7PbzOcKLhzLNIz7YOHopryPwJl0wHNd0c0l5+A5o8sjrtN/43lmnk0dnEp
X-Received: by 2002:a37:6248:: with SMTP id w69mr27843003qkb.225.1566335543999;
        Tue, 20 Aug 2019 14:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335543; cv=none;
        d=google.com; s=arc-20160816;
        b=arRCIVNjGsgDQInt4w2kAErlr95nHshNmXSQcAwCA0LdknzWTT3w1MhCEutO6pzBgq
         lKGg3hhZ/GYEba86mejwxlNz1RJyqVo1WVN3jPOgwVqRzyYSdddIO/N3Nc/ltJrfmNKY
         Gpf8BS25trTA4BCLMvFPIVD1QdC/hhObEAHD2Cg5P+VL+V4RSO2RtpusirE6S9VEeWz1
         ZHNRfTnLC/XVQZxLCeQMRxp8kAetrmHr4QaqGEL3w1VK7c/gb/9AYyfAfJkp82PR5Na1
         ATH1LjIBTTlqJ+W7zaMJy2Z583Eyjqpp/HhKE6qygIosbyg+zX3UEPbSCleQG8RR5au5
         pUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=q1Zy0h8c3J4D30AFqGiFYUkCGaChDdqpfUNuVmWLPgM=;
        b=ECibk/Dt8PH4HdH8Tq/2hBhUl5IBgF3f8tQJhUxN2Wn8sZyjj/gpRYTr9SrD20xHmE
         4qMgS584aOagm1/jhmkCvt4dbsfkuN4Kl8GzQOPghjx3gVc1nZL69IP5nQX9VZGInhag
         hp9zDSL0JCGjDRxZ0Bnd0fOjtkjwpWbJ/io84HUYyAuTamOq02MvxoTN5u0A/AS8WN1Q
         oONrtbKMf1yEnQAkYaB5mgZjZNJjUevFV/7giNCIpwUoj9sDF5W6uMKBMxgi7LHBYXec
         f6Mxqfo4Mwyifk7HyGEK7mEwqn6Ot+PwCO+ycpb6usrsdCFU4uq8cnzln+7EtpooaCQx
         m0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jN7XTRkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l33si3726073qtf.52.2019.08.20.14.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jN7XTRkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BQV-0004w4-1A
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLs-0000Gw-UH
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLo-0008Qs-9k
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:33 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35628)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLn-0008P8-Le
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:32 -0400
Received: by mail-pg1-x543.google.com with SMTP id n4so24085pgv.2
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q1Zy0h8c3J4D30AFqGiFYUkCGaChDdqpfUNuVmWLPgM=;
 b=jN7XTRkfRBVPUpHW/tfohU5SfFaGZUq6eh1Dz11xAiHA3EZLmzD3JG1tVdp9kNpY4s
 7iYxabCwzS5xw2bAdWowKbwPiCcCjGK83zfTzBkP3g1rBQm2DW32ZJUm7eH0kb9a55+H
 HBglPPUKviN8JBvv2O/Nh2hE5/GLSIO26zocAdsm1YeSiQ1K0xODeodUpjVL0dfW+YtO
 Zv9+XZsBa2KWnZASn1BMq7G8ooDAvpMqRWMdTNStrvTWkxKh+2YglH1dioxBfLscYCgF
 E1w2+lG2Jdbh8l5rj8NLX9/SdXaGTKp9okMsfyp6UVoRAXZZeqRhIEf2RloiEkI0bS24
 n5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q1Zy0h8c3J4D30AFqGiFYUkCGaChDdqpfUNuVmWLPgM=;
 b=OCSiEqaeVjqW2UJhB5cyztQMyPV5j1RlAyMtfmp8IisU/k/ZXwf8O+7KT6thItNvrz
 4/wdLL0r0g7GkeEaDL/huzd6B338CP0C2904xvgln9TaCHhjcda1msVOpj9KmlDn/1Im
 CIhx5OsQOPX2VKraj/ZclA3lpPx4aUgjiSWj4mz/D6iWNXnx1RAk3aKk0Inh9VOB8T7q
 mmIgx9PDXrgZCWy7jIgjksrbF56C+MUzciPdTObM/OfzqaEO7AX5QykvDATUIiuGDixV
 s2/XjbCEA75858mzecjN0QrDzziq2//z47664FITWfu8QMAJmZFjDFHoxr5hCmkyCwvg
 Nosw==
X-Gm-Message-State: APjAAAUiN9PLINEluYeZ52x5+EDJ9HZL4XTZDhYTJyaISGmQlC3ZAGTk
 DypqXLUkThvMb9rTiL5Z+WkITw==
X-Received: by 2002:a63:d84e:: with SMTP id k14mr26449715pgj.234.1566335249619; 
 Tue, 20 Aug 2019 14:07:29 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:08 -0700
Message-Id: <20190820210720.18976-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v5 05/17] target/arm: Split out rebuild_hflags_m32
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOvPWLmFOkh6

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by M-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6570d7e195..c36ec6c530 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11045,6 +11045,29 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    uint32_t flags = 0;
+
+    if (arm_v7m_is_handler_mode(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
+    }
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
+          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11130,7 +11153,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
-        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+        } else {
+            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+        }
+
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
@@ -11166,20 +11195,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_v7m_is_handler_mode(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
-    }
-
-    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
-     * suppressing them because the requested execution priority is less than 0.
-     */
-    if (arm_feature(env, ARM_FEATURE_V8) &&
-        arm_feature(env, ARM_FEATURE_M) &&
-        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
-    }
-
     if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
         FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
         flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-- 
2.17.1

