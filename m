Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBEEC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKo-0002Xf-N3; Mon, 23 Feb 2026 12:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKm-0002W8-NR
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKl-0000JI-4y
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43945763558so2798633f8f.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866177; x=1772470977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d/expR217T5l2ZpgIxw9igXVO7ZIf/mmczK8CZEhS9Q=;
 b=o2lWedMp5lMZpGjfZiKeFAMyr1kg+DTWcmp2R9F7sw27aEUXGUnAw9mCujtyAq5weX
 URv+YNSKCRoPDUkZIrh1XZiGqinTASul7Q4XoGDdr/i4YFBYG+1iV1QIfm+2+NXIZWtI
 wn719pv+nD6Bae8Bx6zn221fpeUXxDLVnJEVpPj8xzs5He7uNGpNJ2clcM6r9Y+fhV7i
 SbETqLbqJhpWev4qm42prIC6oK9j2x4G79oXru0UBNJzWzcCpVUzMOKx9ZIbP5HnGsuL
 zvRhRc5A8hQBU64NDp+O2ohMDANTqTqSGX8aYF/I8LpKI8ZqFrZ7zbdKpR+Dt3dtvOA4
 aYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866177; x=1772470977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d/expR217T5l2ZpgIxw9igXVO7ZIf/mmczK8CZEhS9Q=;
 b=rgwnM4Dn8HtUI5OqnkdSJABPm1YcN7Vv4DLfD1YS/uxCrdhu+t4ewrypOu0E4oXaVP
 zzbDhnzAYn+2mR8xmiP2xKaO9MEIwRG2OB+uzwZIDUbBIvJEz8YtUVhooBdAJR4I4PZE
 O1Nn+UrU7bImdWdSaAbr4dxkNIBA+BKS6mVtTAK4/96dCzbl+WtPp0STP7sNWH2F9M3C
 93bJAANvtqKdhCcoDI9KcLHMamRhsdtDh7L8k17OLa8pkxV74OPXTN5FIsQ7WkmUFjm6
 LpjdYGHANL9Ae5+YtkGOoc5AKsVIu7O556VjxhWQ7icgH4vGk+KBx0wX5ce/BxkGKjoC
 ZO4A==
X-Gm-Message-State: AOJu0YyYzpXGfEaXNr9e8MfQ+pIYnz1QA2OUn2sCiceukCS8pZz3obxX
 NiSKGIyd7LCpaLH13wa1wJaWz49T+0Id9h7kq7HWbgEtAV/dq1MMSlynzuiOSTIuPDXgZgtWRuz
 UxLlu
X-Gm-Gg: AZuq6aI+HO4PZYwb2TAF8jRlVT0D/L1KAxvUFESBf3tTUX6Py7H2pQqMx0d0wagWR7q
 hFNZsEiItM6w0ONsPRBFGFKQ7oiRHJtqlV3Y37UCMV8r5fKNq3uIUX2XzzJTf5sYXc2AE/RSDn5
 ojzhZRVL2geVv0YogoKQJ9HD+42yEvO+s3T34aFLkvY4y+z86EuI8QVrpMQK//5L0ydGDxIjcAr
 lFj5TI80PteAhyGebCW8Owrbw8L6cfCWlOSkRVLVe0Yeltgm7ll49PYzEZmPZV9J4Qax3L9QxnO
 A/fSDO7LojrfYzt2ebWXPJ94xIA4FvUKJ6M5dIwsv4fhAJo3zExzl6ffuZjikU1rHtBBUGnu2j1
 taaRJw+Mp8hZ9OS2+2jEOIZhawvtA8AWcKRXURLV2E5iIhjrouVsQpSmu6/+NpSv7+GDehH+Gmo
 wOI/IR1hpK0U7eblBB1OQc3DpX/ZxUjqShjQn1hLPY4uZg3g+UUyslZm3YOTR0jhmtnNGImHbQa
 7vYzx4DHgpivqeMeaVKdJBCpQbqX04=
X-Received: by 2002:a05:600c:6217:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-483a95eb550mr137670155e9.3.1771866177201; 
 Mon, 23 Feb 2026 09:02:57 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 38/65] target/arm: GICv5 cpuif: Implement PPI enable register
Date: Mon, 23 Feb 2026 17:01:45 +0000
Message-ID: <20260223170212.441276-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement the GICv5 register which holds the enable state of PPIs:
ICC_PPI_ENABLER<n>_EL1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  1 +
 target/arm/tcg/gicv5-cpuif.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 980abda3ca..915a225f8e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -607,6 +607,7 @@ typedef struct CPUArchState {
         uint64_t ppi_active[GICV5_NUM_PPIS / 64];
         uint64_t ppi_hm[GICV5_NUM_PPIS / 64];
         uint64_t ppi_pend[GICV5_NUM_PPIS / 64];
+        uint64_t ppi_enable[GICV5_NUM_PPIS / 64];
     } gicv5_cpuif;
 
     struct {
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 4647fd40ba..c54e784dc4 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -219,6 +219,12 @@ static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, old | value);
 }
 
+static void gic_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t value)
+{
+    raw_write(env, ri, value);
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -334,6 +340,18 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_hm[1]),
         .resetvalue = PPI_HMR1_RESET,
     },
+    {   .name = "ICC_PPI_ENABLER0_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 6,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_enable[0]),
+        .writefn = gic_ppi_enable_write,
+    },
+    {   .name = "ICC_PPI_ENABLER1_EL1", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 10, .opc2 = 7,
+        .access = PL1_RW, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .fieldoffset = offsetof(CPUARMState, gicv5_cpuif.ppi_enable[1]),
+        .writefn = gic_ppi_enable_write,
+    },
     {   .name = "ICC_PPI_CPENDR0_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 13, .opc2 = 4,
         .access = PL1_RW, .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
-- 
2.43.0


