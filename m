Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E7CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 21:59:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9K-0003v8-Hj; Wed, 08 Oct 2025 17:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9H-0003tz-Hm
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c8z-0006d5-SC
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:39 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b550a522a49so209177a12.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960579; x=1760565379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMlnh8zeYNwcYH9t58MHsQn/aIeWjLHUQw8sUnZOUp0=;
 b=DI1u872UZ3KGvyYmp1kdBz8bWAQ2eGbbZ7l3LH/yPZXDqXwKMSF3Lp0djN/DVs2M/A
 tXKoicIg533zAZCHVOzMvznwkuMylsXHpIFLmcLcq1TrGOohS21l5zdfWRYugM4rN/Tf
 UcyELHaI57t5dTbIJmf+S/+aZSIeqtKc/5AsiHVPPN7MUGdGvsDZ0+k+yX4UFBQwech2
 80Db1NE1sLMr8nkC0jc4PRQWUQTueLOLYIMV9AMDsmhOrN+7Kx3fBwF8jKpFd+XRHicA
 OC65meieJ11gQ1M6vi+dPbPhpY/SvFbV9/Ui2dvMcm3Wqw/5h0TTI+rCroE7UF6dsn7C
 58BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960579; x=1760565379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMlnh8zeYNwcYH9t58MHsQn/aIeWjLHUQw8sUnZOUp0=;
 b=eFgy4/3BCaxXy1w4HiKJ5sVjaWNNQJWUAEOcRpl9L2qh0ETy/EUcjby+j00bafqIln
 pEGW6H0QqCaqddl4K0MKIal2D5fqZIEZLW0MpZWNKzuYPME259XYP/H0of+s+zMk2ue1
 pbEVBgmY9tVcYqqqV6ykZhnrkw2SyVUfCiNEiNRfWflHwR+mT6gu+AW6GTq+pLRVhh6s
 EX7Ajoz48LRn62/V0EkQPOs/jNiT1rRVmuEkpCC0AS+lcR02/6IQrsRbYHydiXg6QrvR
 HdR+HOeDLUXiVNhrmEUkxQJ6qNQcA82WFsfGUGAXR+6xUWs+F9kLMbLyZ+Ic5a4STuSj
 AO/w==
X-Gm-Message-State: AOJu0Yy7yCCqAxHYAG1iqD5bcAw2tD4tU2Il5WSx+Ryy4q5XpmdC7wc6
 Tvj0vRDlVuvXQhc8nGavHgWuob+CUQ2beXQG45pLYEK0i5ez+YoCATufY80ZIr/LSzw=
X-Gm-Gg: ASbGnctYRp5k5uqp4R3PNR+x3qIwa5O3SdejMwcCbJPZx9bWorft+lMw/BYuqdlCeCp
 kZ94Qt8sdeWZc21NBY5qZldw4e30x0/xAdOIPfhATr0GN3w0yQCyQJKK4VSIFpXL0mz2lsL4U5q
 B0iTXWirmsHXPSt9PtjHiQC2vmcIyzpDBpi6d2M7atizwQSDGpQwEmWuz42Qx/TkeHqULbnUTZ6
 qldpwqUvPyA0OcsmS2J3V1fpOKDZU8UtKw+F5RpdXzdGqVIB2a9nEBT45/trFQR12eaVzJQ07+4
 04WscwWSwlmzY1KlESRdsFsnf7A/W25TFYLftmAzQv2XK4gcBelXtf/z1/ZdE8Av/qH+CnVVu77
 JT+feEq6pqtmH8Y4FZzqLS7dVRW0n2Lx+DV56K5pDZwgHgNnBwxxHtu0vFDwyzSTlgr8=
X-Google-Smtp-Source: AGHT+IGKUJMgtTlHWw2o2IM+XK9NJdl39lmRv4DQjNRNl4uCeuXQSyhzPVZnqCh5rAYVcLLn91if7w==
X-Received: by 2002:a17:903:a90:b0:27e:f201:ec90 with SMTP id
 d9443c01a7336-29027264d78mr66582075ad.25.1759960578669; 
 Wed, 08 Oct 2025 14:56:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 06/73] target/arm: Cache NV1 early in get_phys_addr_lpae
Date: Wed,  8 Oct 2025 14:55:06 -0700
Message-ID: <20251008215613.300150-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

We were not using the correct security space in the existing call
to nv_nv1_enabled, because it may have been modified for NSTable.

Cache it early, as we will shortly need it elsewhere as well.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2657023120..e1515675eb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -79,6 +79,8 @@ typedef struct S1Translate {
      * may be suppressed for debug or AT insns.
      */
     uint8_t in_prot_check;
+    /* Cached EffectiveHCR_EL2_NVx() bit */
+    bool in_nv1;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -1677,12 +1679,6 @@ static bool lpae_block_desc_valid(ARMCPU *cpu, bool ds,
     }
 }
 
-static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
-{
-    uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
-    return (hcr & (HCR_NV | HCR_NV1)) == (HCR_NV | HCR_NV1);
-}
-
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
@@ -1734,6 +1730,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                    !arm_el_is_aa64(env, 1));
         level = 0;
 
+        /*
+         * Cache NV1 before we adjust ptw->in_space for NSTable.
+         * Note that this is only relevant for EL1&0, and that
+         * computing it would assert for ARMSS_Root.
+         */
+        if (el == 1) {
+            uint64_t hcr = arm_hcr_el2_eff_secstate(env, ptw->in_space);
+            ptw->in_nv1 = (hcr & (HCR_NV | HCR_NV1)) == (HCR_NV | HCR_NV1);
+        }
+
         /*
          * If TxSZ is programmed to a value larger than the maximum,
          * or smaller than the effective minimum, it is IMPLEMENTATION
@@ -2109,7 +2115,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         xn = extract64(attrs, 54, 1);
         pxn = extract64(attrs, 53, 1);
 
-        if (el == 1 && nv_nv1_enabled(env, ptw)) {
+        if (el == 1 && ptw->in_nv1) {
             /*
              * With FEAT_NV, when HCR_EL2.{NV,NV1} == {1,1}, the block/page
              * descriptor bit 54 holds PXN, 53 is RES0, and the effective value
-- 
2.43.0


