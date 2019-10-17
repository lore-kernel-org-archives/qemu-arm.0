Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1346216wrm;
        Thu, 17 Oct 2019 11:54:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrdA5s/ndL1lDJg2loEPqyCBj4vAFZ9uBY7vI9zCQOXFVMnY+uBWJ5ui1hOvSxdB5kAiPm
X-Received: by 2002:a05:6214:180a:: with SMTP id o10mr5429285qvw.91.1571338478819;
        Thu, 17 Oct 2019 11:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338478; cv=none;
        d=google.com; s=arc-20160816;
        b=QwvHtXJWSlcexRRQWrN7yBJSRAIIhwhzM4ZokTG/+T1+nhEM/ptaTvegJyM3ZM2xkQ
         Ux5jXFdXXcClS24zkCJmSSilVNM+zJbBIF3vM7PTTgfjHDLIH8ogL8x/4Gsd5xGw9N8a
         our/KC7cBE56oHH6VXSlPAbnR6qmxvD/4rhNtdfZlrqtAm+8jFPZE4c98HeBoQQawxYI
         dX9pFxPkW4OfPUVnlQl7uK1tZ1S3IGWe+UbBvQMgGAmEICG/YDyoYCs4ihDVVVIp0I2T
         FI2p6y86Zx/6JH6b1UCo1D1pBu6JDRO8IqTDHdS5FK5yyqXvodaxpYXUuzhUaCvYeXfF
         wE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
        b=XiAhfr1YWjjVlAoHkaW+5evcP8WaE4HMVBgOld/5QLLSK5pU9SZjZdYTTqmK2vAWnC
         Aq0J7pCECmFvmtG1NCej05syRv8Dcb0sB/rZ7NqfH8ctqfVDHAHUC1oP/Rsn86N5R6iN
         tvzFN46ZXLcjbD8ak4XnA3wqeqrBgtryKAEDx8tSozT0ufMAarqiKX4MGWIN07PmQrwp
         FEqNSjpY9cz95pBmVNWMBLQU25OHvW5oaM6pMmd8z30P9pIW1TT1RrrXrkXSvy4v7tKY
         x0sFnlQM8H+29dBg7IMISmDOQfm6r/4hgGtkiQbE1mGCBtR0VGPOmkgS6Nc66Lc+gRXD
         pW0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3HJ+WlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si2866545qth.84.2019.10.17.11.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3HJ+WlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAuz-0004wa-V5
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArm-00012M-DZ
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArl-0000pi-DP
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:18 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42864)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArl-0000pJ-7E
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:17 -0400
Received: by mail-pf1-x441.google.com with SMTP id q12so2205103pff.9
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=x3HJ+WlZiIOQaJOpC7HfOW8NG5F/im4gZXFPtNgCl8FUUpjgkQI5cmvqa+AbjDLGrL
 gkg0h6VMkX60fMCBHiLvxaWP+VAUi2Mnnm3nYzhf1xtzaTchsZtmVHWPx5bjO2bPpi4k
 AGIxN1c/DX4MRsstodj/FN/TUuzIQLQ8o9pUTpHiQSEoDWrcEKpcsFWhT3qcbDS0SNDc
 AdomEEoshsoQ+a4zW+wQ0G1cJok5Jsj2tbjAVUzeFZTKsyWZnkBVt4ajs37Oha6ikM5o
 5MEdKbYMB6DaxOp33i3q0YvINvZDwUt24X/sWOk1S2eQNgE3YoULikRmnjPpJnxLQRDg
 0Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=IXfddKkTeRgfjfs3VPPiPh/0ksr8hmRCA5UM/QxlgNVdOQyjvCaNRDZa0rRaVZxIR7
 PRWtjqZK7/reLPmg/Yl/hyZ6wamk0GYx/G1yD5hkUeQWPPsoVesnoqMu+WvjlGMRSVNx
 GGfR7PGGZYmvmXvLGPrNk8VR3ibQWQKoKk2v0Kp6L0NbTZLpTiAraAfo/QEc3PElpFHt
 +ndRiHV/9DhnljhhM9aaBIAnLkUa4HdWaAJKlzD8o546fckpPK1zZC+ThcJ/daq0dkGE
 Ez8LerEtbqBeBT3ZQJ9GE4sSYjxdvTdHsvcF4vvysBS9CXBIUcfMr4WidYt13tRvLyhP
 /gjA==
X-Gm-Message-State: APjAAAXPxC1YL0Ir+ZtTCJsO1wy4t9n9aX+2ECwicQLOnVhH+pQoIFxm
 7/6J3ysXlFIaEiZLX7thqCAP4w==
X-Received: by 2002:a62:ed01:: with SMTP id u1mr1865679pfh.54.1571338276212;
 Thu, 17 Oct 2019 11:51:16 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/20] target/arm: Split out rebuild_hflags_common_32
Date: Thu, 17 Oct 2019 11:50:53 -0700
Message-Id: <20191017185110.539-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: RJ1qp+FpRXbO

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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

