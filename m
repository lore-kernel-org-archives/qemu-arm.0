Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C8CC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:41:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3g-0007fW-HN; Tue, 13 Oct 2026 04:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3Q-000720-3R
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:14 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3L-0007h0-I2
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so26704265e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880802; x=1792485602; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=phhovw2oMK5AXV5XzQAgTt3Eg1fVusDb5Wdqr/0Mm3w=;
 b=aIp1DGjni4JYFhzF0GIsarj0LkQER+Wz+hU1SLFhhj5Le0IM66j60BJkrgob0oJSoq
 rd9GSX0+YHZbehkKzEDL8u4u4v3q8IQKMnICE9uDFXWdJgc5Nmid/JX+OC/47GzBNUSB
 QVTUIYCa6XGLY0PttcQpTKY1/bg606ZxKXMaE7xNrmPvO09skJVdSGBArSUq8YpkFxFz
 p+8mJE6dwge0tywvYTOa3SzNXYzFbNEjz0y/LeEJG9lHFAZTg7OdFLfZetWO9Mg0MjHL
 EWIoLtosXE69EKdQ2MYj8h8zbfs4ipDUVeiUpsP2uxhEJSaZQc2uFiuGq1GW1AZwBnNu
 KLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880802; x=1792485602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=phhovw2oMK5AXV5XzQAgTt3Eg1fVusDb5Wdqr/0Mm3w=;
 b=rUUjcX2k398xMAB1qF3mvi0PD059YCUXPZ3tf2y03dtI5nvUzy4+zPJjKNGy3rbE3C
 fonEqCA5A7zv+f5ohBMYAH/iIMqwxj7jCWHmLoiTELooyzpUbdRgaj4J/9umPFN05xFU
 2klGnHAUrB+S+Vh2kY4MZDfuw8lDh/bClfO0vAvue8aUZz5POst4jBnKnyWfNedQfDqw
 g/+xxvqdADTueN2pQc8kHaOHXg/Vp6zS1NyidLAtfMHZe9dBB7dUmpeIcMaEIkJHZ7Yq
 uiggxB3OTyC565G8nb9XjGbBHJ6NcPpZNKx8h6mzbfs7pvjDYQ+ERms6dYgEGSTuU4+t
 HDbA==
X-Gm-Message-State: AFq9FYLs7FD5BHqTTzUtpDQZCfUb8hl4m5obpjfxqKB9PFpzH6JIqPGn
 wV5p7hkK8c3G29tXlHlryj6sC4htAe4Xh8ZX0o0YtZ6xkTEW8UAPrYmFbuUp1Eqf7VZ0jCagMTM
 z1HXb8mg=
X-Gm-Gg: AYBFou2dRWbowEzq0/2wDKoEkecCe+9gC9j7hdqynpWjQhEZVMnJ2CXA/0tins+U6sZ
 cTWMjGPjSXFzinej3Y1X3cshpY2HDQFQfn4njMadZzWhzgAwJ1PuMoswlFa7p15oFkxJ0eH5pNg
 zMNq3Hkvgk6gV6JzCo+/Zk+VyKnk6ed84LpRWUNsc8C46hbXGxggccqRh3IwqI2ZM7irzpu2UqY
 xcd7zxeC85GNeNOgFcJe/K1j+iuh5kcNcSSYKxTy00twltOD7OBMVpUYFa4TxrR8RnXd8RltSTT
 +3Vd/3UM2mdGUZzy/Y5kBc1blk/YIoMrBPE/yksMMiwIRj5fwlnqEntVRDDxo4BthxkK204vLKz
 KdMQDZ/gLrVcs+WqFy/vRR6Oi6xCI7VIBr0HjucjEMN8tf1iFPmLnpSUY44eU6/DOU3zWZ7O5Qt
 u5EkMNGYHw/MV03lcB4Tdp6HV3IbBw/ZQj10orF8365XawcqlLdQ/BDwucmWSrBCvEEStCBbsXz
 vQtX0WBYfR2OyvxjRQiFMdwY/9duexiX9Mn+Jx3awOr8XmkIMhnjlysw7bggaNbe4nc4JhdMqmc
 0fQ+raH4qaHzoQ==
X-Received: by 2002:a05:600c:a4b:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a1af68d397mr8797305e9.2.1791880802413; 
 Tue, 13 Oct 2026 01:40:02 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/86] target/arm: GICv5 cpuif: Mark GIC insns for
 fine-grained traps
Date: Tue, 13 Oct 2026 09:38:27 +0100
Message-ID: <20261013083933.1024405-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Annotate the GICv5 system insn cpreg structs with the
fine-grained trap information. This covers all the bits
in ICH_HFGITR_EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index a829b90f334..be34312d242 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -800,56 +800,67 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     {   .name = "GIC_CDDIS", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 0,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDDIS,
         .writefn = gic_cddis_write,
     },
     {   .name = "GIC_CDEN", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDEN,
         .writefn = gic_cden_write,
     },
     {   .name = "GIC_CDPRI", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 2,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDPRI,
         .writefn = gic_cdpri_write,
     },
     {   .name = "GIC_CDAFF", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 3,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDAFF,
         .writefn = gic_cdaff_write,
     },
     {   .name = "GIC_CDPEND", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 4,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDPEND,
         .writefn = gic_cdpend_write,
     },
     {   .name = "GIC_CDRCFG", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 5,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDRCFG,
         .writefn = gic_cdrcfg_write,
     },
     {   .name = "GIC_CDEOI", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 7,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDEOI,
         .writefn = gic_cdeoi_write,
     },
     {   .name = "GIC_CDDI", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 0,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDDI,
         .writefn = gic_cddi_write,
     },
     {   .name = "GIC_CDHM", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICCDHM,
         .writefn = gic_cdhm_write,
     },
     {   .name = "GICR_CDIA", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 3, .opc2 = 0,
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICRCDIA,
         .readfn = gicr_cdia_read,
     },
     {   .name = "GICR_CDNMIA", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 3, .opc2 = 1,
         .access = PL1_R, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fgt = FGT_GICRCDNMIA,
         .readfn = gicr_cdia_read,
     },
     {   .name = "ICC_IDR0_EL1", .state = ARM_CP_STATE_AA64,
-- 
2.43.0


