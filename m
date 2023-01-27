Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338710ejc;
        Fri, 27 Jan 2023 09:58:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtXD6kvmYf5Uj44RPg5pJj7hU7W095DGheoWA4M8OZIGXsqBbsYDfLpd+iPMkFHZbD5uzxG
X-Received: by 2002:a05:622a:1a1b:b0:3b6:335a:828c with SMTP id f27-20020a05622a1a1b00b003b6335a828cmr74105780qtb.47.1674842307154;
        Fri, 27 Jan 2023 09:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842307; cv=none;
        d=google.com; s=arc-20160816;
        b=Ywvh40s0FzMq1MoYgFCpNLrVNUBQ0fsvRwqyVjQo0mfkN648JR+lhw2I6hl9tb4zCt
         ADDVZJ0O05WYXz7wDamQEk7bndVxbWe+Fq/iUMf6HOXE/db092BC7KfxAt+HfHvj4Q91
         sB+7AfOuUZYvPpQ8H75lgEIU1KaV1b+OLFTz9FsWQf2oJz6dJoTZkC3n2HpXA8SVeGVK
         3RJrcvrjD3df7q+20CQfV+Di9bQGd5pUl/9+J+XQvQ2DTuTYVksojcsMh4HPc6wbqQ0x
         xj/iw2p16CuVelF8QWbp/lHdmoqZBLvVMzowtHHbQtSmGpaYo9svf5e3AeswtASfitDS
         dRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dRvnpD/SS8NrhvE6itIT8RGFAlHq7tuRDHg3zL/7iNk=;
        b=qDKiuO9c0OAA3CA4oyO/iId4h3zSLZ46fbzfnvCIgBzQwxWnD+Sop3mtF/Gnzy3ihF
         ytyhI33B6AUultlUOJkTabkWA0qJm8iagccRZUw+SddbB5mVZY2ZGu75sc8/cE/D7q04
         F96dPC7N/uK0bP4KbPSVf8qU0WRxNsFr7K9kQtluSXaeW4LOazlVJABKh20c7vh9jfr8
         mzZP7MAJ40AQ97hrjSYAnti1OuBH4gnLlM+XLGE5K6W3i99sF3nFTpRcC/RIih4KeMk3
         YQPe5CmDOAGjm0yOphQDbzbrw8OX1CyebuIJouECvm/qqusjo9OlL+b2UIM/4EZsHu4D
         /oUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmTc7U3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b140-20020ae9eb92000000b007069b0ef749si3070919qkg.364.2023.01.27.09.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmTc7U3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx6-00012g-KX; Fri, 27 Jan 2023 12:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwx-0000uq-O4
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00061W-Qc
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r2so5665584wrv.7
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dRvnpD/SS8NrhvE6itIT8RGFAlHq7tuRDHg3zL/7iNk=;
 b=pmTc7U3gf/1bvYlUizDcF0EeVOGsuwQjjxMWFvGkig4+atS4nuvAq7WhATRcCLoFT/
 YEEeKPXwZw+sQxI+ND0u1FyGNyJGX5fs+GwBruHzpOll1B61IHP1H7Ycqsi7f3n18hWR
 Egem2VGcu+ixWX4x7K6+tNtUqiGbi2+0ydv1WAL3UYs4nKQGfgS+Sueu0fBJ7gGuFLYb
 n9SJett6f2V8J3Wly2wxb4cpIS9WW0C6rjtgDFMAQjN08QY28u4XzepxLNqqtU7y0YZf
 QbPBH00QU7QhU6IUlBkfwgqzpg8ICJzGfqjqRLxJhy/ThrYibHneFLzlM4sWAkbS7jpC
 KVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRvnpD/SS8NrhvE6itIT8RGFAlHq7tuRDHg3zL/7iNk=;
 b=FXa4SvAVSGZ0CwOmipn7RsSq7Z0csgjDreLsHm33nrY+nkUROpC/JU7fSanadXsaSU
 2ByspRloPUwAeGQlllHvd6FOVJewaO1MOiE1qXRQ5rcMbB7jxIsA/tO3Vwx7sSrsVWdx
 muarCchDQzLWCtEXMISHP9/wyEZCIa7nmAckGcKvAQkALCsDJhWaFI7Us5oVjMGdzLhi
 xlaoxYh5ODBk0jFvjfKb9fmr5lhLFZ4cV/NZ+T2bMNioXKDwZyzS5OXghrQXFQRi8lBd
 lsjDeK9rj7FtRjGhMo/EcM1yUQmOYhZh0GZccJPP84zDh8//h0hF6cJ9tp8Tjjz0Vs00
 UxKQ==
X-Gm-Message-State: AFqh2kot+ihxsYQ5ZXsmYYDFIvCl/XKH+j8jDH9tVrKRj61E/DyO796y
 v1q3mo5RT9Ril9DWe62ODiqbrA4ShO/w3Fo0
X-Received: by 2002:adf:f605:0:b0:2bd:be31:cd77 with SMTP id
 t5-20020adff605000000b002bdbe31cd77mr32440948wrp.30.1674842120771; 
 Fri, 27 Jan 2023 09:55:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/23] target/arm: Mark up sysregs for HFGRTR bits 0..11
Date: Fri, 27 Jan 2023 17:54:54 +0000
Message-Id: <20230127175507.2895013-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ru5XaHdy5uD7

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 0..11.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The annotation of the cpreg definitions is split into multiple
patches for ease of review, 12 bits or so at a time.
---
 target/arm/cpregs.h | 14 ++++++++++++++
 target/arm/helper.c | 17 +++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 8cc12045af6..82f2cefff0a 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -577,6 +577,20 @@ typedef enum FGTBit {
     FGT_HDFGRTR = FGT_RW | (FGTREG_HDFGRTR << R_FGT_IDX_SHIFT),
     FGT_HDFGWTR = FGT_W | (FGTREG_HDFGWTR << R_FGT_IDX_SHIFT),
     FGT_HFGITR = FGT_EXEC | (FGTREG_HFGITR << R_FGT_IDX_SHIFT),
+
+    /* Trap bits in HFGRTR_EL2 / HFGWTR_EL2, starting from bit 0. */
+    DO_BIT(HFGRTR, AFSR0_EL1),
+    DO_BIT(HFGRTR, AFSR1_EL1),
+    DO_BIT(HFGRTR, AIDR_EL1),
+    DO_BIT(HFGRTR, AMAIR_EL1),
+    DO_BIT(HFGRTR, APDAKEY),
+    DO_BIT(HFGRTR, APDBKEY),
+    DO_BIT(HFGRTR, APGAKEY),
+    DO_BIT(HFGRTR, APIAKEY),
+    DO_BIT(HFGRTR, APIBKEY),
+    DO_BIT(HFGRTR, CCSIDR_EL1),
+    DO_BIT(HFGRTR, CLIDR_EL1),
+    DO_BIT(HFGRTR, CONTEXTIDR_EL1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2389e41bd07..30e54455ac7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -633,6 +633,7 @@ static const ARMCPRegInfo cp_reginfo[] = {
     { .name = "CONTEXTIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_CONTEXTIDR_EL1,
       .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
@@ -2163,6 +2164,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R,
       .accessfn = access_tid4,
+      .fgt = FGT_CCSIDR_EL1,
       .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
     { .name = "CSSELR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 2, .opc2 = 0,
@@ -2179,6 +2181,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 7,
       .access = PL1_R, .type = ARM_CP_CONST,
       .accessfn = access_aa64_tid1,
+      .fgt = FGT_AIDR_EL1,
       .resetvalue = 0 },
     /*
      * Auxiliary fault status registers: these also are IMPDEF, and we
@@ -2187,10 +2190,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "AFSR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AFSR0_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AFSR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AFSR1_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * MAIR can just read-as-written because we don't implement caches
@@ -4392,6 +4397,7 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_AMAIR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /* AMAIR1 is mapped to AMAIR_EL1[63:32] */
     { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
@@ -7041,42 +7047,52 @@ static const ARMCPRegInfo pauth_reginfo[] = {
     { .name = "APDAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apda.lo) },
     { .name = "APDAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apda.hi) },
     { .name = "APDBKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apdb.lo) },
     { .name = "APDBKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 2, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APDBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apdb.hi) },
     { .name = "APGAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 3, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APGAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apga.lo) },
     { .name = "APGAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APGAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apga.hi) },
     { .name = "APIAKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apia.lo) },
     { .name = "APIAKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIAKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apia.hi) },
     { .name = "APIBKEYLO_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apib.lo) },
     { .name = "APIBKEYHI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 1, .opc2 = 3,
       .access = PL1_RW, .accessfn = access_pauth,
+      .fgt = FGT_APIBKEY,
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
 };
 
@@ -7940,6 +7956,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
             .access = PL1_R, .type = ARM_CP_CONST,
             .accessfn = access_tid4,
+            .fgt = FGT_CLIDR_EL1,
             .resetvalue = cpu->clidr
         };
         define_one_arm_cp_reg(cpu, &clidr);
-- 
2.34.1

