Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24355CD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 16:33:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waFgJ-0006ig-HR; Thu, 18 Jun 2026 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg5-0006eZ-Cw
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg3-0006Mc-1i
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so6891405e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781800393; x=1782405193; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DFZBT8LvMlXH9tb/dA5m2Omj2BFyYAOCQ6rYsyJrFYc=;
 b=pfnoUw58Gvkh31Ahg7TEu4T1t7ogaLHmD3KEoNxFn9Dggag70QrrJ+M4PXzvfEZ9Zh
 LWTkdZQLo0p9mfzb1akry75geYJ4Y951abm5tf73/phSPev2s4pNZJkunngoqqQN4AaD
 /Vh/LS7EdgSLyUiTl9WwMc6e3fyFJo5vKzbdwTpp7zuZJYkVGFdOK105ZE7KaSxDlmxA
 UryO+MLQqAR8K9axDeNwePpZB/JXDIm3o+uNUhbj3pkXpxdsew5ZXDMuMy3byuCfOaen
 iYHGTfIv2rd49qX/jl2FZKr4nbl2ZCoHRykwGC2dIg3TYJESF9nfebIZOz4YsNup4F46
 3Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781800393; x=1782405193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DFZBT8LvMlXH9tb/dA5m2Omj2BFyYAOCQ6rYsyJrFYc=;
 b=Y2mfgTcTWtmzMrSMVGqWzIdPfeKgIUZkFxweWzWsIJ9M3KQ57/lUzK3W+KIYwziL0k
 0IF0EDL0Ge3Ay+4Pcahqie8J4lAxW/CvwlYXfLcsJW/xVDGF9QlSejfd8cLrc8IvkUvM
 8kT6y/s3PJdBLp4alexf1cXY7m0Bu1Nb1bEFxVY3f0wvyQoc36kB94xeVM1boTgjX1qp
 8TjnICqQQHfqzuedu4JsaJse57CyJ/9wuyin48BuP3RAWmYM2hBumkLA2XhVQaC9C2UF
 NIrFjOdckQEMx6AA+YBQZ2KCSwJLsNKb+67XaaN9zzhx+lGkJl4cgl6FAFc2LTmL1owT
 hItA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eNy7DhthwpoaP3MnpHY8K8uXU14vy6ycbdMmGOn39clDX6cR7Is6DAFUshisYuhuTAZ8Xl/2JSA==@nongnu.org
X-Gm-Message-State: AOJu0YzzE+pJ5rMZe/IvNFRUuxus1HV5Y99G6Xh1lyfxKc40eNwfwK2W
 IPZN7UDhcY3/j3KWkjLpkKQUUEOFWl+MYFgJ2lFxb3EWOAxcKhNEa3lpZ5bC24KOWSY=
X-Gm-Gg: AfdE7cmP3AKkA0YG2eouzvsyY+DF4E3ocUeqjZXufrHoFyx8wb9J4Mx2hGL1NB2Nufj
 nS3kzY1cq4DP805WApgDxGBmQT7z1yoOVS+sNbu7EkjJ4BHpwtqTrLLgxAD4qbZ95y/HlqXOmsT
 YTNMu51eyky17pIvjbfNK4BZQA/fKeodDya3w52QPHMBQhOwbZgiAJ3vHQLQafP1Qn/oQXcMwlW
 atvZ1Ew5WfQj56WUmKTLriGSyNhRO7amhvba8j+b4l2s2owSMo9/x/Ty7lY6TFbCL78rSHOeC95
 JZ+T4dRWSPcLJqwfCr1arQrVYs1gQ76k1YcWhatbzjFUnqkuouiViaOnFc/9GNJ1m0DYGiVNHJM
 llQJ7hlqesmGwdA79MgwoWrcpcHEd1bO3L8RCSldR/hV4i4xCAC+Uwm6wsSEpSG69l9lsirUNYi
 A6hcqgG7yuLFh2oQ==
X-Received: by 2002:a05:600c:6386:b0:492:3763:aeb9 with SMTP id
 5b1f17b1804b1-4923f6d2ff1mr4258645e9.21.1781800393457; 
 Thu, 18 Jun 2026 09:33:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:b52:6a9:569d:e33e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc426e1sm26942f8f.29.2026.06.18.09.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 09:33:13 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 18 Jun 2026 17:33:06 +0100
Subject: [PATCH v3 3/6] target/arm/ptw.c: Add Granule Bypass Windows
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-jmac-gpc3b-v3-3-353e546067e7@linaro.org>
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
In-Reply-To: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x330.google.com
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

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/ptw.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8b54018c98..493e198da7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -341,11 +341,21 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
         .space = ARMSS_Root,
     };
     const uint64_t gpccr = config.gpccr;
+    const uint64_t gpcbw = config.gpcbw;
     unsigned pps, pgs, l0gptsz, level = 0;
     uint64_t tableaddr, pps_mask, align, entry, index;
     MemTxResult result;
     int gpi;
 
+    const uint64_t BW_ADDR_SHIFT = 30;
+    const uint64_t BW_SIZE_SHIFT = 30;
+    const uint64_t BW_STRIDE_SHIFT = 40;
+
+    uint64_t bw_size_field = FIELD_EX64(gpcbw, GPCBW, BWSIZE);
+    uint64_t bw_stride_field = FIELD_EX64(gpcbw, GPCBW, BWSTRIDE);
+    uint64_t bw_addr = FIELD_EX64(gpcbw, GPCBW, BWADDR) << BW_ADDR_SHIFT;
+    uint64_t bw_mask = 0;
+
     /*
      * We assume Granule Protection Check is enabled when
      * calling this function (GPCCR.GPC == 1).
@@ -397,6 +407,58 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
         goto fault_walk;
     }
 
+    /* At this point, GPCCR_EL3 is valid */
+
+    /*
+     * GPC Priority 1 (R_GMGRR):
+     * If GPCCR_EL3.GPCBW is 1 and the configuration GPCBW
+     * is invalid, the access fails as GPT walk fault at level 0.
+     */
+    if (FIELD_EX64(gpccr, GPCCR, GPCBW)) {
+        uint64_t bw_size = 0;
+        uint64_t bw_stride = 0;
+
+        /* BWSIZE, BWSTRIDE have a limited number of acceptable values. */
+        switch (bw_size_field) {
+        case 0b000:
+        case 0b001:
+        case 0b010:
+        case 0b100:
+        case 0b110:
+            bw_size = 1ULL << (bw_size_field + BW_SIZE_SHIFT);
+            break;
+        default: /* Reserved value */
+            goto fault_walk;
+        }
+        switch (bw_stride_field) {
+        case 0b00000:
+        case 0b00010:
+        case 0b00100:
+        case 0b00110:
+        case 0b00111:
+        case 0b01000:
+        case 0b01001:
+        case 0b01010:
+        case 0b10000:
+            bw_stride = 1ULL << (bw_stride_field + BW_STRIDE_SHIFT);
+            break;
+        default: /* Reserved value */
+            goto fault_walk;
+        }
+        /*
+         * GPCBW is invalid if the base address is:
+         * not aligned to the size programmed in BWSIZE, or
+         * greater than or equal to the stride value configured by BWSTRIDE.
+         * We can make bw_mask which marks exactly which bits in bw_addr may
+         * be set (gpcbwu:gpcbwl).
+         */
+        bw_mask = bw_stride - bw_size;
+
+        if (bw_addr & ~bw_mask) {
+            goto fault_walk;
+        }
+    }
+
     /* Note this field is read-only and fixed at reset. */
     l0gptsz = 30 + FIELD_EX64(gpccr, GPCCR, L0GPTSZ);
 
@@ -431,6 +493,20 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
         goto fault_fail;
     }
 
+    /*
+     * Bypass window check.
+     * I_JJLRM: Granule Protection Table (GPT) lookups can be skipped
+     * in portions of the memory map by using GPC bypass windows.
+     * I_XNHTX: The GPC bypass window check (...) is performed
+     * immediately after priority 3.
+     * bw_mask from earlier makes this check for us.
+     */
+    if (FIELD_EX64(gpccr, GPCCR, GPCBW)) {
+        if ((paddress & bw_mask) == bw_addr) {
+            return true;
+        }
+    }
+
     /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
     tableaddr = config.gptbr << 12;
     if (tableaddr & ~pps_mask) {
@@ -3861,6 +3937,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
         };
         struct ARMGranuleProtectionConfig config = {
             .gpccr = env->cp15.gpccr_el3,
+            .gpcbw = env->cp15.gpcbw_el3,
             .gptbr = env->cp15.gptbr_el3,
             .parange = FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE),
             .support_sel2 = cpu_isar_feature(aa64_sel2, cpu),

-- 
2.43.0


