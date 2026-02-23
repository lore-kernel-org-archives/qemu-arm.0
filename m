Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7055EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZLw-0003Zb-5P; Mon, 23 Feb 2026 12:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKv-0002cK-E5
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:11 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKt-0000Lr-Cz
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so27430015e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866184; x=1772470984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AW764VCsKq3y+ySrJ/HlW9c07iwK2oyw1ZIlJo/TovI=;
 b=VbgX3dqTrDnquNhel/dpTJdo8ivkSfDSZ88RCGCMcP/mzNC5jJMggjByN+7I9FjCYg
 ylRiMAlOSZy6C2o2U69TQwYwLZZ70/6A4WsYtfOcY4zL07D8FDuL5VCNxgXWsBC/lDeZ
 QzWEu0Ujm89NKFWRyQ+hvVh6rfybTKjqzUgmxayVvyWRF0A+AsSf4SoXB2Zyt1PclVP6
 PwPnnsNCfaIpF225GqztPAvziTLgIXVB00QRvC2AjUf7+0D0SdGDBhL8Cy86wQpR7KvC
 4f3Y65wHdepalTRLnzb5KLd2KBR9Knw/kaf18HI84gX0XrLWFcgF+o3UaFqRy6tqXCL2
 fi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866184; x=1772470984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AW764VCsKq3y+ySrJ/HlW9c07iwK2oyw1ZIlJo/TovI=;
 b=dDonY+fbh5qTinqh93gGA1w92JNJiCNL2VAPoWU0wr/rkqfaVfm9++myOL6Se8rW5E
 Pj4ul7GYCmTyQnfcqje5fu8KZ6GV14pzrd3Phvww7Jwu+oIclj7FgZHb8tsK93MhfVbl
 mRegqj+54URaO8RebBwjvpQSiQMItZhojUGAyw8p7M9XVdht8dC5oRnbWq1F1EUJX9ik
 Gjgv683n7qF3PeJCHDwlE0fCKjpCTO9G8yULmOm5gfzZvW++kV6pGDo+bdOpuFvs0Oz6
 RQ0SqfPP0cGWgsHuiZz24HZCTklWysfzGYJ74rrOm62CyZuyt3P0uN2jBiU1Kbd1FnQu
 5zgQ==
X-Gm-Message-State: AOJu0Yy4U2+3sTRn/cg3l23PvYvCSyAMePpgXJ6VklPAoN0TCvL14ZiC
 7TNj0PUjvuj1nXW1wpYF5AqIA9OeR/xXwhJXL862yj4aOBC0CSZGmRoEsoDFsnEk3/QOdEh6mfs
 DRrVX
X-Gm-Gg: AZuq6aIAgFH+qsUiLyAshuJ2jI5clE/P+nhgL87bZo2Tq2pWTZu3JAiwBsMlN/kghDX
 pIigyFaZt5JFQaQN7ljyYSTUjP2Yi4RlzsUcgT9BY4jhmXKTMOSPgercAtxBHGIb3Xo6uXb4IjB
 4jUuBGK8omUbPT/bogsbGg/dbqFUJ3HpFhmO9tgnE4ISdNCiW1ucleZfV5vDDvldbU4Yxkf7fwq
 AaHFrB0qH6F+8NTx2oX7fwbkgR/+syAFWJUl9pbx2m+hjmZUtEnz/g7CMyYTOTW10sEfGVrnKFi
 P/vOWCeD937+IS1WtoRSmf/Pas/7saW0LWUPr/lC3/eDPQBikSKASs+UwGa3GK3WjkvvkG920wt
 YC7FdFd7+844+MWCfEzwi/GjSith/eZGn9rD2xyyPqAqaxg132F8una/a5JK9VswG6t6l/jiSZ9
 RFcOqiXEQWtCoYdnUlKjm/DHIWX9eIQmEHUjcZC34Hg6tICL62NjILoUcDITzFiFgjdaIAO7cd2
 913duBXxokfW2MFfwr9spPe8E0sO30=
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id
 5b1f17b1804b1-483a95bd842mr143352255e9.3.1771866184283; 
 Mon, 23 Feb 2026 09:03:04 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 44/65] target/arm: GICv5 cpuif: Implement ICC_PCR_EL1
Date: Mon, 23 Feb 2026 17:01:51 +0000
Message-ID: <20260223170212.441276-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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

Implement the ICC_PCR_* registers.  These hold the physical priority
mask for each interrupt domain -- an HPPI is only sufficientyl high
priority to preempt if it is higher priority than this mask value.
Here we just implement the access to this data.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1263841a1d..651fccd59b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -606,6 +606,7 @@ typedef struct CPUArchState {
         uint64_t icc_icsr_el1;
         uint64_t icc_apr[NUM_GICV5_DOMAINS];
         uint64_t icc_cr0[NUM_GICV5_DOMAINS];
+        uint64_t icc_pcr[NUM_GICV5_DOMAINS];
         /* Most PPI registers have 1 bit per PPI, so 64 PPIs to a register */
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 5af9fdb1db..45ef80ca87 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -49,6 +49,8 @@ FIELD(ICC_CR0, LINK_IDLE, 2, 1)
 FIELD(ICC_CR0, IPPT, 32, 6)
 FIELD(ICC_CR0, PID, 38, 1)
 
+FIELD(ICC_PCR, PRIORITY, 0, 5)
+
 /*
  * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
  * and no legacy GICv3.3 vcpu interface (yet)
@@ -383,6 +385,28 @@ static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
+static uint64_t gic_icc_pcr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+    return env->gicv5_cpuif.icc_pcr[domain];
+}
+
+static void gic_icc_pcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    GICv5Domain domain = gicv5_logical_domain(env);
+
+    value &= R_ICC_PCR_PRIORITY_MASK;
+    env->gicv5_cpuif.icc_pcr[domain] = value;
+}
+
+static void gic_icc_pcr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.icc_pcr); i++) {
+        env->gicv5_cpuif.icc_pcr[i] = 0;
+    }
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -548,6 +572,13 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .writefn = gic_icc_cr0_el1_write,
         .resetfn = gic_icc_cr0_el1_reset,
     },
+    {   .name = "ICC_PCR_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 2,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .readfn = gic_icc_pcr_el1_read,
+        .writefn = gic_icc_pcr_el1_write,
+        .resetfn = gic_icc_pcr_el1_reset,
+    },
     {   .name = "ICC_HAPR_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 1, .crn = 12, .crm = 0, .opc2 = 3,
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


