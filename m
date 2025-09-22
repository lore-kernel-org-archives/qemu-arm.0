Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00ECAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbf-0004hD-Qg; Mon, 22 Sep 2025 14:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lba-0004ex-Nd
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbU-00044P-IC
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-77f3405c38aso1263587b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566973; x=1759171773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVdjjmeNl369fORWFFYrAmuAxl5OexK+Goh2FzAHrEY=;
 b=m5agun4KvHBgNcQVjdcCMf3eeYwOT5RY+5OZPMWqJ1NQJsAEUDIByyATq+OG9f8AKk
 48jlgLpxAv72PeYyXrhE0LtrG1qm0oZcGo5RPjb8MNORVFvckXWfa3t/g9iS+Fj8G0yA
 PhTnQ82RPJseRSbo4xk2PkpqMQypTgcc+vkdvAZwp7G2LbxYx+AC+MLsitxiwCcAL/Ll
 +/fwfUOAFVRQTfj8vRXka3zO7cLsqPPM83rwPUsjSD+2Di8phHhc/tUTyM1WP1Si5fwg
 q/0dmynlmJnOrxjw9tkkV45O+wekAqgcEh7BKdje5JJdkku7GjnHYNANmlyMt/XvBb/C
 01ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566973; x=1759171773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVdjjmeNl369fORWFFYrAmuAxl5OexK+Goh2FzAHrEY=;
 b=rtQ4F8I5QW7JEEXX2578HpmJYfyxJOCUhHFjt9V5WwTHI+ktVYr3fB3kFSxRp6E5Ut
 MGuZBACYT3mZdaP/Vaql9xz/F3BVi/0gJFRsunJ+JKqa1WqZtpWzlvQQBuOljoEdW5y7
 ydm5TayaYMGiWvG3FTNWb4FewlBndybr9PMI9QTYGyZw0Rvwj1jnSFqGaQR4Jq4uKD7e
 jLKh7nqjK6QZeYyGd5SBwENl2ie2XlT4eyuT1PJSwyzGMwz1bmpqYgNNIuaicE+4hgdd
 RaUVTmkEDPf+kkSrvYObFzg1nbUkcc+2Sa6BHuyjj3MGtwDcD7qeiWO2SAbu+zBuMgFO
 mPpg==
X-Gm-Message-State: AOJu0Yw7x6YRueUP50oFK1lCsC6BXlbxPZl22mKbNZLhCCgqk8fm8uy6
 ym3wX1OoeAnAqD2BkbKrPPurhAKZssSntfSqJHKkIS3NTstbz35puqbAAvg2uSvW8aV4iolY7o3
 563/j
X-Gm-Gg: ASbGnct+bVoqhwXXVertrykHicRZgO58PCCLVzUAdXKh9We6iCdNfk21UTSoklm0XAs
 vxE6xSrpN5fMvFc3YwppBotaHAhMZ8WNgX/KJ7U8aSYebyYaLEiGh51d2XgnVg0B9VpRd8Dwjs6
 8m6my3nINnL29iVyKOLB+ME+dl1g6XFUM5zjrGfyeYew7wscJoshBIS/uVKoxFjh53DZ1UjvfdG
 SrWbB6Iv497MGQwpZABV6kFOaB4KAXfTooyMSL+7F/b0ONu2I8V9/0DE0pGrVzT781j3Cr5StUY
 XyEkAtTsaAQQLuk7OOH4KEeK9wlRxOTNU3Ax7droExAYOB6I0+lgZUK1I5M3mH7ohIo8zzndvfF
 qsiDmL3/qIFHesEgx1P/jhK2jpDxl
X-Google-Smtp-Source: AGHT+IEOwp7yBrFpj2ykLOAsvcpYVsTDMi5AA+MwGHlNEj9aY/o6Wx17ebuMIC2GGn5J9WHXam2wMw==
X-Received: by 2002:a05:6a00:c85:b0:77f:472b:bc73 with SMTP id
 d2e1a72fcca58-77f472bbe3amr2909312b3a.6.1758566972882; 
 Mon, 22 Sep 2025 11:49:32 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 05/76] target/arm: Cache NV1 early in get_phys_addr_lpae
Date: Mon, 22 Sep 2025 11:48:13 -0700
Message-ID: <20250922184924.2754205-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

We were not using the correct security space in the existing call
to nv_nv1_enabled, because it may have been modified for NSTable.

Cache it early, as we will shortly need it elsewhere as well.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ebb260d54d..d6d704e2a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -76,6 +76,8 @@ typedef struct S1Translate {
      * may be suppressed for debug or AT insns.
      */
     uint8_t in_prot_check;
+    /* Cached EffectiveHCR_EL2_NVx() bit */
+    bool in_nv1;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -1641,12 +1643,6 @@ static bool lpae_block_desc_valid(ARMCPU *cpu, bool ds,
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
@@ -1698,6 +1694,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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
@@ -2073,7 +2079,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         xn = extract64(attrs, 54, 1);
         pxn = extract64(attrs, 53, 1);
 
-        if (el == 1 && nv_nv1_enabled(env, ptw)) {
+        if (el == 1 && ptw->in_nv1) {
             /*
              * With FEAT_NV, when HCR_EL2.{NV,NV1} == {1,1}, the block/page
              * descriptor bit 54 holds PXN, 53 is RES0, and the effective value
-- 
2.43.0


