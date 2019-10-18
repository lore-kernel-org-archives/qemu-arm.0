Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1228321wrm;
        Fri, 18 Oct 2019 10:49:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuBSbv9ct30jj18gIKVB4wcpdrHqS1hMGih7fQA/3uDzLhAjxq5Ud43MytUc7mkBk6c5mq
X-Received: by 2002:ac8:2653:: with SMTP id v19mr7581866qtv.278.1571420955252;
        Fri, 18 Oct 2019 10:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420955; cv=none;
        d=google.com; s=arc-20160816;
        b=QTKYPEryXzzFk4apiHZJthPreL1grJrxSAj3upSFT0P7m7AJu0MY+ZKnX1mXbTICld
         oQhRsLmHFEFwLlU0bgYOB+H9t7+lQr+f91iiD3C6wXZyN+Gy5/h56/gKGCSjSx44DbQ/
         /IGGePJUCsssJHMmoskdyQYDH3cSJA0VcN01fqdMUW9TMwY7pGZgpi5EdYwcmLx8lwo2
         rKSaRfTp1+7oVl3vNl/G9IuEveAkaBjv+AuchUOIHuHr5466x6I9adaTOSRntJCzWN6K
         mM4YbG3aDjbpvenWTm5EPv6tFU9SV2zFKYCtsbyBkg4OdMSUvdIYXYfvt7kMqoXq7PMG
         N8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
        b=Xyq2Pf5Komm+wKtw9CBoeJ4ROsE1ZafFN6u2BiE+iQ/BFOgW//jAiT2+MNnUF3Dd4/
         4VIGovoGwXPQ1Y+E2v9BnSAUCfJFKTfLqeXAjI8zMDz8W9Kq43EWEx3dCTTXBDNrDJC5
         DUbKD1ctNJQkVLuXdi3VeQye+T5x725QS54pVym23iqbT4AwZwJbHtSQijRRy5e//aJ2
         kiHn4Ra5YSU033rfoEasVGRLvwiCYBCKOZy8mgVmMF0el3BRTWx9PH5VDOdmCKSDR10A
         m6WG8pmThED+NoDv4RZQIOrB2UP4YHz+z4LQ6Ttp6/eGsWWa0f1KWQmBPIuVYQnrKJSa
         QxSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kFYtkl62;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si5764492qkn.156.2019.10.18.10.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kFYtkl62;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWNF-0001LU-Vd
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0006Sy-7g
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIr-0005P0-R0
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIp-0005Ml-OC
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:41 -0400
Received: by mail-pg1-x544.google.com with SMTP id i32so3742545pgl.10
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
 b=kFYtkl62zY6PW+luGe9TZwJ7mEStN2EUGHwVIjT7YnMEr1NtqavFgtXVKH1l+75sRf
 1ixz+lv/bl0D/bRyYRBsTHb+7WsT4RNjKbWXP7fVV9sMRjqJvhARthjNdfKF3iyI15Qj
 KkhU6VJHJuNpAJ+XUJc7L/fuUnwey4LH/EfXazpVwvmdAnTYfS5zlwxSQty/70HflDcn
 96Q3ng07ztaLWfHXYuUBYQmjl0dE8dZkiLbPLd6fZCaUkFmTgmecEBiGl5PlwkGSx8lk
 gsGpcqeE/7A/7A7LeInXQBB1+nbSrAtMHj+wpSgLVEp2hTyW7wR4A+Qh5NkrCBu+/H5G
 bECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
 b=YdR4Gy59ovE0psWW40T/baMwtwgeZHiIDEWZCzQPF6qAh35mNxforYKSEDVwCRauDd
 5gEG0ym8XBKwpTjmX8TOfZGytdd9jdSoeEZpIyGcpD6OZDIwHPmYTtXxqVdCOBJ8tXgg
 du96rCg9LWG+mFf4u93dLeWz/L8dRQJA+7NBa19svZ93Y1GFOuKA/d9bjv5Wz3BJGcK8
 Ijk1GjJFsdocydO5zXlYOguLLxWt/83+A+29LhHLdG/8oNEDxAgTfP440MvWnCZp/F93
 URUd+60FAZkvlR6GjdGZzCJdFTI0diy3jhRlV9O7hpWqJY4xdgMY0DGhdRpjNviEPwfn
 XJbg==
X-Gm-Message-State: APjAAAU9Nfjf/dy9fId9yxHEKHgp/I+XMtfZUsdBiK/bR6YYjxRXvem0
 Y+9iAzJHoEI/rUPxLkZXy1ZtOCc02dA=
X-Received: by 2002:a17:90a:aa97:: with SMTP id
 l23mr12570299pjq.7.1571420678183; 
 Fri, 18 Oct 2019 10:44:38 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/22] target/arm: Split out rebuild_hflags_m32
Date: Fri, 18 Oct 2019 10:44:14 -0700
Message-Id: <20191018174431.1784-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SfURf/e1d59A

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by M-profile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4c65476d93..d4303420da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11083,6 +11083,29 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
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
@@ -11168,7 +11191,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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
@@ -11204,20 +11233,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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

