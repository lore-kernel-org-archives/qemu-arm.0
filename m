Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1015208wrm;
        Fri, 11 Oct 2019 08:58:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOn323x8zoUvloS2tp7K2MfUpEchn5sgPMiwaXwiZkwwdYfpk9g8rRL8Dy6CjN6aHt1df5
X-Received: by 2002:aa7:cd0f:: with SMTP id b15mr14259483edw.3.1570809509849;
        Fri, 11 Oct 2019 08:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809509; cv=none;
        d=google.com; s=arc-20160816;
        b=0hiH1AvTYdBLjXqTe1LaD3WS0MbobGQwQz/mQxk5LYEMt2EHH3G2S7LSoYSP2WshEw
         k6wUogwOcZzhn81GD3W2KmZTxLeH4B+Xxh7+wZMti35U6A0Dlaa7SxO8c9QZ2GPTQ4EU
         lEJJxMqclwdxyicX/YbFnX8vDvbqVsmSKc2SnkX8Pp7L7gJ/PhiTSCZlGRvUH66ltzq1
         Q/NgKHg9YMh1JWkMUiG49j/8r4TgOS385p4MmdXuw9q5KCOUrFRi8+TurnKZo27/vMha
         X4Es2tvVVNy9MDsBiOvmZHSCk9HaEPz3OFdRbtZFjA5mgrOTh/OF4mVYMjrSN+ct6zL0
         SqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=JZ4FcxbCDDWJsqSaXfQWATqqO+tlQqneKyRyH+pvJoM=;
        b=xLiLMdykMVrIeZty00jQRekKh6lpMTRFN5QSLpESUfZqlcIoDYbecT7C1U8Hau5L0X
         GYE8hUN4jjTYJXGX2ouJgmVwUkQg/VcyMYqUkrMPwkgz9lhOx1kz7zZNvLNZ9+tinGVZ
         rgUe7XwtL2no2fAaHNh5vWiB3UYFu9tZfFoBkUFwpXtRpNxTM+IeaqtclO9srMJ2XxlM
         h84jv14tXY4aRoZxkibW58xHYUxHx94pk5za9ZDI6eCnz+kNEMipsF46betshryB4cdr
         HSaTrc97UnkMFzmhK9L2xPnLRwY4oflw4eHlS1JMEKhEUpSSPioW8JyseC9UR2DGKGzl
         hliw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VoKm83e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l45si6403938edc.185.2019.10.11.08.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VoKm83e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxJE-0006Y2-Gx
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGj-0002D6-6T
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGi-0007ZI-3i
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:53 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:39997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGh-0007Yo-Vk
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:52 -0400
Received: by mail-yb1-xb42.google.com with SMTP id s7so3254820ybq.7
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JZ4FcxbCDDWJsqSaXfQWATqqO+tlQqneKyRyH+pvJoM=;
 b=VoKm83e3fCwHAtGn1hsDLYwwFA2FmbBEeuMbI1Wuu/C6nJEnbuJOeozqfZHTgZz0fG
 KT4A2Gwyamd8MUTe82jS3tbMnjnezUBxRPYzzG1nCFYrc7QpVo5/8RSkITGpYKXx5IDT
 n7f2NbeOwcxfOTZPJ2oY586SKGWp/w2AiIbmX0filRsQ1i5jngKKkB0j4rjwRHr4xl4y
 ojDUy4RHKfQbYi9FuvvuZlii37W4Gp1J6vdlz9cgXaA6GlYRYuBJnYhvooEptfAJEMiZ
 iZb2v1abw/Wdaqh5J04itKQK/TLxgKrUzjEJHSsFvMWM2b2+SiuGy7kBanCAiVaO6iph
 KTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JZ4FcxbCDDWJsqSaXfQWATqqO+tlQqneKyRyH+pvJoM=;
 b=WUpk19qfAJjOC/bZDn8Ag+AWt39EZPv2vBdkZQyNcqVgAcqR5u169eCBChXOCFawN1
 j1+HFebdSoXCYn7NRlbQAet5To+4iKjPMkSJYZgVMUmNqJwmQIr4E3H7VuRydmX+t5gh
 7bxjZfCkg1Fmq6pHzoXpYnFTYH+0PuQScaJAkjVwNqh0xdpzLNyoPeU+t929DlMauhLZ
 BMZlJDRWAwvlI2Z6cg7KGNmKSM2KxVlcV/e6G2MaVYZgfjodeqc37hl1iyMAY0nVAlZa
 4snV7hll4uEze2RwtqhOpSfSURimwFBqZaf107WR//HH5e6c7Afjvl2IdeC2Z0OcPjba
 oR+A==
X-Gm-Message-State: APjAAAUV7JlA86uGPeAK0GjN+YxSpT4GWACha33hYjSbrFTzYYfwqlrb
 mrS511/RW6yK/Nzo1q1+j7V4yw==
X-Received: by 2002:a25:7b44:: with SMTP id w65mr10012844ybc.393.1570809351386; 
 Fri, 11 Oct 2019 08:55:51 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/20] target/arm: Split out rebuild_hflags_common_32
Date: Fri, 11 Oct 2019 11:55:29 -0400
Message-Id: <20191011155546.14342-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VUUxp2WeICr1

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69da04786e..f05d042474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,15 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                         ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11141,7 +11150,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
+    uint32_t flags;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11151,12 +11160,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
+        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
@@ -11166,8 +11174,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-
-        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

