Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC810ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:18:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65CF-00073g-0m; Fri, 27 Mar 2026 07:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CC-00070g-22
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C8-0008Dc-PT
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so1274728f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610259; x=1775215059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oXt+HGm1k+OhZUlKvZnQCKSizbDBAvFnTtOI2ID7Ok=;
 b=r0fDB4E9MZUHtpkrQaJ8ue+BgUxRYyPUUAy1NJV+C2Hx5ScJAvDjk0MH0t6yEpW69f
 Mgrkg9o9CghD3MwsNYJab4BvFA9/672Oh6IXJFg4ud5ReFzvkUimtkA55Int8U5sERDd
 GYIvM6/+L+tAMTHNArACGyT6uugYwyyUyyLtNoPWCCsx6ZQAmaWTKZjq0rBiRjoMeLMV
 pOnEpE80b4QVtxtEg91/e6DbcRQ2ssVMZ+g8M/HrbEtHXtacApKB/lUatf/vj4i4XUnm
 YCRYl0vKZ1jrLa4EgRVRGOPt0OQmsH2qG20bAnpdA0P/WxziyBsNrs4J0v7zpAt4IG3f
 l6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610259; x=1775215059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7oXt+HGm1k+OhZUlKvZnQCKSizbDBAvFnTtOI2ID7Ok=;
 b=MrubBK2W3eQXUi3xU9mYSmKl8kiIPcJIx35TeubIz+WjHaR6F+EGdiuMFJlx7Vqh2r
 x45LTKzsgzW2SKRuQ6fKIhnVWx/TaNypcZCnT+UWy32KLiVgwDT6uyA5k+5M1Dyio7Ok
 XrnE/aX5kNUKjggquntSjj56G2JeWgBR+eSefREOwu1roT9inCWAi2s6n/OQLllA/63P
 HWJ9WPE8UxzlT9nLUsNfWGFvpdSoHCr/r80Q2/EmViUi/i1L8IYOsxBuMQVl95wpORAn
 J0IK6hhrdo94EesUYdRQTQG4VchJoetbXnKKdEpYpdVvv1nqrtGCfGKRnqN6nerIl+Lk
 Dyqw==
X-Gm-Message-State: AOJu0YwXnc1Hl/6Xx7KY2gTSAZiuZgQbX/DdFtAFr7WKirPTxGn9QfO/
 Sm+hatjfVjMlDcFKe6NhV7WKgJs2qIK0F+umOt4PAPBAhPAQcF6jyTjy8nt/IrkncFunwsblJKW
 S/dWnaoM=
X-Gm-Gg: ATEYQzwT3PabJc6yqrnqZw6NoRdq66piM+R7hKgVI0Qp2nZQW/gqEw/rFnu3jSJ5+hI
 2X9ecd/FxONCx1taGj8jXx6NSRCMF/JtWaVTIkzvhDDCoSFYKDLZVYCCVNcgPsaKrAqvQHxUI1v
 BYVWPxvADonS0vfI8Tazxk/WguSofoX8E1m40u8qzf6BN/Ci9vcViizdfSagEHFHGmEUXX3CRFT
 6VIK5ewQC8PN9zA6sYN2uL4BhSd/ljZJjSJdxRNevWhT6ycHTm3GY3Nr0FjYnRWEReuvCatHsnq
 iU0HahokGyADx7q/bDMeRkhfWMYb1TYg4E13NykCgs/M/ibyxNzBGgRtISXcfE08iiPUzgXA6e1
 Hm5Z2keCkPIcs+0VbigIdPm0vs62Iv1w74tG5BtKMbpSkKDvSZaa3Xvj+wE/Z/VG+7ErkE+epe/
 kvTIJaeh0BqRGH4duR9kzPv7FLzFKJniZTy+mEoODbKgyYyvyKukr1CQdbsAa4SBv7Uwi2n/c0m
 91zAuVLfegmV5V9l9WOTYCNkQiRB+U=
X-Received: by 2002:a05:6000:4703:b0:43b:9fee:939f with SMTP id
 ffacd0b85a97d-43b9fee9571mr2783082f8f.5.1774610259262; 
 Fri, 27 Mar 2026 04:17:39 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 39/65] target/arm: GICv5 cpuif: Implement PPI enable
 register
Date: Fri, 27 Mar 2026 11:16:34 +0000
Message-ID: <20260327111700.795099-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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
index ee97d98d7e..09cd56cbfa 100644
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


