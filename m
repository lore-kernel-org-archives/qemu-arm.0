Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B946CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3w-0008RI-QD; Tue, 13 Oct 2026 04:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3U-0007FI-KR
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3Q-0007qb-5X
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so21872125e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880810; x=1792485610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4fi3KaUQEy1+IJ+5cSEeFvIQP/QNmNxFWZjQRxfI9as=;
 b=KfHpZzP1LooLBUS7nCCXO7jW4UfzjU7Wp7nVYRxhTqVcBAHens6oK70Jv73XlS/+BE
 BLXnMHNG6k27NmVBcXeZNyS2Jgq4UQhB6HPfgIeCUspu/KcyE9ub1v9Du6pkJSptOjfT
 ZWyZFGt9/2uiKX9Z705xHVFoQLwOAlNFGzQs39cpMPP120JEuIN3FgAPwkfcEs44qXT8
 xm7VVNNX/RnYjPDWdEkiLwLybLTLanaY8q1b4jmeGLpNS0di1OoZDkSmXPey/wjBYcyS
 7s0NdFq2B7Y9zIzk9IMCS+oWUxi9qTYs3bL7bjOBeZ5eN8/1PqcqhNqtK9QbKW1NNxwM
 h+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880810; x=1792485610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=4fi3KaUQEy1+IJ+5cSEeFvIQP/QNmNxFWZjQRxfI9as=;
 b=Moc5Rtis0nq2nSBd9NAUeaLHShCu54Z9Jfk/UXDRpnINmAH0QtiGbbQUZhadkuUmVG
 0q6kKwmrqB3dHEo+ko4EQFILI1Q/nzzS1dTtdAXaCrWURXGk47B15oHIORG4MpadLyuH
 pW3NTqmIfF4KS9kXYKjR3Jh9yZbHOjAS60NFol/MM9GnYTljHzBuHwea30DcjQV//RBQ
 Ds8vMpJykVPyWggVWs2ZMzqh9Qzl/F9eYmVJvvqlENNrkWuToIB+QQTcgc/oRU4SuMcK
 yaHCtQLtieSAfUHzOLL6orcie8g8PyoQ4BYQQCARihxuKvPSTCx32qtbJ52iyypwpvv2
 /meg==
X-Gm-Message-State: AFq9FYIjaxy1LIe7DCM6DfudHnkncnLC/CLMu9j1/qqT3c/szG+e5oTV
 5ZuSL4Tf+0rVfd9Opqu9AndPlSZYjCL6R3cHfpDQOCpaWW0tsf5ILOEmJH1qm+B3g4gtHBAsddx
 /48Nc04Y=
X-Gm-Gg: AYBFou3KEmHUylhxYEcOQZRUxs8psnN1SlJ0o/e9Qkq5vFZ0g0bXZjRKF7d+okBDw6g
 JWmUTxpUF14vCsihPZV5EbwLGmIBY5ltwMmy3TS+aE7qyL4sqcAYK2NKgm2GGZFcy0e+10ng0wl
 H0HpEqsp8ZBCIC1yI2gbSjC8R2SV8XmCNrQvqdcfRPFLq6qve9cNtcYjBAqh1dClm38emBNThVT
 IQOoMMeS02yYxjdzu7+36+miSsaytjad8mSLgJBI/ceuygLgAM3Wh3EndfgF2ugDv7tStKkJgS0
 FZZ372HP6LBTmuRXxyyCEYvG4p1mLaLkLEi9U0g6oK496TuBAAxcnK3ca8HD0XiZMJ2RvwaH5rr
 CM5dHw6WCsHd0NBumO4RzzM8BR/VITgF5VK/fwk9nGJUiJTyooXYzYpp/qfvGqvWlOLP6IF8IOM
 VndETZVToshtRN7u5iU97K9i4F1cQy5ael2fqIoqKBb0dmfUNTEeAiB7DOYBr/aOLqsiEQnuqrs
 /reeoVmwtUHXeZGGFBVoK6M4TR4sbcBSq6FqSpXnIjZf4saeK5xespTUZhcjy2YWUbd+KWCnjcM
 3FCzU4GEgd5pjg==
X-Received: by 2002:a05:600c:348d:b0:4a1:813f:2a63 with SMTP id
 5b1f17b1804b1-4a18e4aa26amr220023575e9.18.1791880810486; 
 Tue, 13 Oct 2026 01:40:10 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/86] target/arm: GICv5 cpuif: Implement ICV_PCR_EL1
Date: Tue, 13 Oct 2026 09:38:32 +0100
Message-ID: <20261013083933.1024405-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement the redirection of the ICC_PCR_EL1 encoding to the
hypervisor guest's view ICV_PCR_EL1. This contains only the
PRIORITY field, which is stored in ICH_VMCR_EL2.VMPR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 247cefd9e68..125dcd8cf4d 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -612,18 +612,32 @@ static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 
 static uint64_t gic_icc_pcr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    GICv5Domain domain = gicv5_logical_domain(env);
-    return env->gicv5_cpuif.icc_pcr[domain];
+    if (gicv5_icv_access(env)) {
+        return FIELD_EX64(env->gicv5_cpuif.ich_vmcr_el2,
+                          ICH_VMCR_EL2, VMPR);
+    } else {
+        GICv5Domain domain = gicv5_logical_domain(env);
+        return env->gicv5_cpuif.icc_pcr[domain];
+    }
 }
 
 static void gic_icc_pcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    GICv5Domain domain = gicv5_logical_domain(env);
+    if (gicv5_icv_access(env)) {
+        /* The PRIORITY field lives in ICH_VMCR_EL2.VMPR */
+        uint64_t vmcr = env->gicv5_cpuif.ich_vmcr_el2;
 
-    value &= R_ICC_PCR_PRIORITY_MASK;
-    env->gicv5_cpuif.icc_pcr[domain] = value;
-    gicv5_update_irq_fiq(env);
+        vmcr = FIELD_DP64(vmcr, ICH_VMCR_EL2, VMPR,
+                          FIELD_EX64(value, ICC_PCR, PRIORITY));
+        env->gicv5_cpuif.ich_vmcr_el2 = vmcr;
+    } else {
+        GICv5Domain domain = gicv5_logical_domain(env);
+
+        value &= R_ICC_PCR_PRIORITY_MASK;
+        env->gicv5_cpuif.icc_pcr[domain] = value;
+        gicv5_update_irq_fiq(env);
+    }
 }
 
 static void gic_icc_pcr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.43.0


