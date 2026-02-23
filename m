Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9938EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZLt-0003QI-0O; Mon, 23 Feb 2026 12:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKt-0002cA-PK
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKq-0000LN-V4
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so27429875e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866183; x=1772470983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9EclDtotkR1f0lyay0/isT6zoNQaUcu9GIY6GSoSdes=;
 b=dEbk59Bj6E87I/29t9ETR84h4MHh7p2SBt/3RjZJ6DZKpnUbLfT/sDFcZk2zo5RDq+
 dy1DqD373EBJ8wGpEJOWKUakFKkfMSJEhoZqT7YW5/viuJnatapLP00DHEzmdDEwgNrw
 KjZnEOvUioJi8OEhLrt5Fopo6nEYUUn8+hwQ+PWTk2zj9l4G2Ur1k1KCG+ngqLVLjPw7
 +fSOObDjpRuXAY8347IxdBLK6I25qpgyt1LHMOZU1+rSqJWHZvTr9Q5P+KD18vP39v9k
 +8QzydFoMbFzuUfVtAaG8jz6py6pgsqo79d4vBrXMuM9goGFcyITuOo7ayHpZFBpDt06
 pFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866183; x=1772470983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9EclDtotkR1f0lyay0/isT6zoNQaUcu9GIY6GSoSdes=;
 b=FPknkR+jGTO8dMWj0oob8y3WbZudHb5KtkmrZK4eptdRWjcUyBArcu4XfmrWODS2R1
 LeCpiqTchwXyqDnOFMASTgm/atVbTRpJ3Yw/x4/r/0MuUFSriL9D+renUKRtUAhrOGAg
 8sECTUzF5pbSUZVOBL5S0iP3EB/YTiHmeY/djGneb4rEpwDbgxPFDrRd2rXXuSXCxseY
 eE1+OBsaXptvs9kyGn0slHDUn+A7XwwBLiXTR4qCienkmsKWFjLSofSnfMN4YB+GVLtm
 aSrdjcdLumXLLjXxoHv0B5NWL2HgXad6SRiMiOgRj6qk5Or8a4nbzir/3u54hQ8PGTyc
 PSYg==
X-Gm-Message-State: AOJu0Yw173AaTmV3+BlOLrz59xPcS12flxMs3YfJzHaVbQIQCHgYNZU/
 X1b+b8LQiigJKlti0Dno2kenxWNalADIpk1XwLhg7HqLiRcvTFVRWrFivpEi0R+i1Guu0OLGGpO
 3WEKk
X-Gm-Gg: AZuq6aL8bZix3xRanljUstrjlPKf3xNbRdhJBfMUxQ5dzv4/94uITmln23D3HrTd7V/
 e7QcWcdCoIFnfD9GlwO7L6w1joaLVb65gY9g55MKSPHirluoMIOA5W0mw6KPF/cd8a/tdTUpdjy
 +3eKG6aeh9+fdEFbMZUJNZQTkSqRP2A/3NIFHl+KhbufAJgcjmmLw8fxeheinWTkxhLuA0FO1AK
 FVXfIMacqJQmGCWt79AiYZ+fWtpIzqgR7q3ymUSxtYvJl64az3O3Y+0bSASh6xjobUvE0HliDod
 PteyS/LUW+jk3q2NiAQSchm6UQEz4dLEabSTvbHY5RziSkrZtg7ORZDc0Z/qz1AtqRYCocgstLp
 CnS/78mGzLhFYTdXUp35Z2nZRp9AhW+Aol9JgeMlo2PEuSMHa0YwXG+pvPqr2HVIEPU9DEo1//V
 MHr6kdScZQH9qdNtgoZD87pKmnLdxtJN+EIf4e8gFXIOZsXpzjw642NE8GGmpRCDAIUmzX0mmA0
 IsgRgXcE76pw8Ked++UJZguC9Ks548=
X-Received: by 2002:a05:600c:3115:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-483a961602dmr194341685e9.35.1771866183329; 
 Mon, 23 Feb 2026 09:03:03 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/65] target/arm: GICv5 cpuif: Implement ICC_CR0_EL1
Date: Mon, 23 Feb 2026 17:01:50 +0000
Message-ID: <20260223170212.441276-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Implement ICC_CR0_EL1, which is the main control register.  This is
banked between interrupt domains in the same way as ICC_APR_*.

The GICv5 spec assumes that typically there will need to be a
hardware handshake between the CPU and the IRS, which is kicked off
by guest software setting a LINK bit in this register to bring the
link between the two online.  However it is permitted to have an
implementation where the link is permanently up.  We take advantage
of this, so our LINK and LINK_IDLE bits are read-only and always 1.

This means the only interesting bit in this register for us is the
main enable bit: when disabled for a domain, the cpuif considers that
there is never an available highest priority interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 44 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e0a7d02386..1263841a1d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -605,6 +605,7 @@ typedef struct CPUArchState {
         /* GICv5 CPU interface data */
         uint64_t icc_icsr_el1;
         uint64_t icc_apr[NUM_GICV5_DOMAINS];
+        uint64_t icc_cr0[NUM_GICV5_DOMAINS];
         /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 2f6827dc13..5af9fdb1db 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -43,6 +43,12 @@ FIELD(ICC_IDR0_EL1, ID_BITS, 0, 4)
 FIELD(ICC_IDR0_EL1, PRI_BITS, 4, 4)
 FIELD(ICC_IDR0_EL1, GCIE_LEGACY, 8, 4)
 
+FIELD(ICC_CR0, EN, 0, 1)
+FIELD(ICC_CR0, LINK, 1, 1)
+FIELD(ICC_CR0, LINK_IDLE, 2, 1)
+FIELD(ICC_CR0, IPPT, 32, 6)
+FIELD(ICC_CR0, PID, 38, 1)
+
 /*
  * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
  * and no legacy GICv3.3 vcpu interface (yet)
@@ -346,6 +352,37 @@ static uint64_t gic_icc_hapr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return gic_running_prio(env, gicv5_current_phys_domain(env));
 }
 
+/* ICC_CR0_EL1 is also banked */
+static uint64_t gic_icc_cr0_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+    return env->gicv5_cpuif.icc_cr0[domain];
+}
+
+static void gic_icc_cr0_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * For our implementation the link to the IRI is always connected,
+     * so LINK and LINK_IDLE are always 1. Without EL3, PID and IPPT
+     * are RAZ/WI, so the only writeable bit is the main enable bit EN.
+     */
+    GICv5Domain domain = gicv5_logical_domain(env);
+    value &= R_ICC_CR0_EN_MASK;
+    value |= R_ICC_CR0_LINK_MASK | R_ICC_CR0_LINK_IDLE_MASK;
+
+    env->gicv5_cpuif.icc_cr0[domain] = value;
+}
+
+static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* The link is always connected so we reset with LINK and LINK_IDLE set */
+    for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.icc_cr0); i++) {
+        env->gicv5_cpuif.icc_cr0[i] =
+            R_ICC_CR0_LINK_MASK | R_ICC_CR0_LINK_IDLE_MASK;
+    }
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -504,6 +541,13 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_apr_el1_write,
         .resetfn = gic_icc_apr_el1_reset,
     },
+    {   .name = "ICC_CR0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 1,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gic_icc_cr0_el1_read,
+        .writefn = gic_icc_cr0_el1_write,
+        .resetfn = gic_icc_cr0_el1_reset,
+    },
     {   .name = "ICC_HAPR_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 3,
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


