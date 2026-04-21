Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F196F55805
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rx-0008In-SF; Tue, 21 Apr 2026 01:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RE-0007xm-Ja
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RB-0006N1-9k
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2aaed195901so16374065ad.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748456; x=1777353256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKmMywFawCK57VzKvKaE3Fm1cw6vdHmu9uE7XMxBtQ8=;
 b=Z1rAiTvyxCtLBemxG0mVrPyrEqbKi+6xF2WmT68/P0CCX8QbRpzRU8DzYcFdbvFSK1
 y9rFJsswMQycCQsxcIKXqKpN+eJofCIslZl6c/DRJhljATITukN29SRzm+o/DOZVWlUQ
 SwrKlOfHd0cJdtJBPjVb7LYM1zH91awnYuc6kKOa3XszF1il1Z6k75848Ng5ph2Ta5rW
 VcFwAMXwaJ9s+H/+2EjMCQUtyrexWGPRJzfUfA8QaZxYF0R2pHjkR5qB9mGX3m+Dzmrg
 I7FoQzoWwrYU47edLafo1nI0Gwu4OQRU0QRwAj2DCLFcTOsSMAL0Wb2/jKz9tWq5l65R
 r22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748456; x=1777353256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CKmMywFawCK57VzKvKaE3Fm1cw6vdHmu9uE7XMxBtQ8=;
 b=J1h52uz6xx2VLQlWtF+Ej7WETJTJQTMCBB+f8+ZcS5Y6SFnebt7wd/jfHxHFQ58tDQ
 AIZyirKcYS8uanIv69i0o//FiDevzCEO5MYnxxO677wrzBFDzcw8pOjQMDkg1BrtsivW
 qQfl1lEttejO0oHukMBKnBuSZqhuCtp2uznUuz/y+VIrY7Ip4GVd9aE5j+4sqjCXLPpq
 0OvU+2i9/HFwVfX+4+UMgCT8q7krnPp5qDj5YO17uVruccCivm/i/pCb+/CJYtGj2401
 f8Lu8BjGM959ZVlsdT2tdNe9j11ccQookDefnJKcZNr8GLrgQHvRx0Ju47HRDiq3w5Vc
 A32w==
X-Gm-Message-State: AOJu0Yzf98iNAK+XbJOveuewMQaq5qf7Ta6Za444yC3VvRkzAcGf9pQi
 PdI6gBg4sKKJkwQS+LSmhO9q//lM73Nk7tRB2wR3yBuNlHB3fazju/TkUKYqjoAv3j5v6fhBvAU
 OAIbG2/4=
X-Gm-Gg: AeBDiet2O0o3iICgHAJyo+RXNVKWTSQmHoBHh/hfZok9w0JxtrBOl84ku9ABdREV+0W
 3DnXZ3kydEfLviL2/n4EVVXe0p+OPOviWWZ6kYsLNUMpcvkdfB5hvAeFV7jyia4zXY7egTrHKe6
 j5C3mlyCjoUFqZAPNkhog5ZgNpD5ctL6GiL/eQjnG8dpjYgwHmr9FZLMl4CZzPhSjNBZxcwx0NO
 UFwl2Ta9Bmal/Ob6aHm0L410RyhjF5YwzcXCS/e6815pIwRQ7FfFeCDXbYOa6Eb45sWi4MthW5T
 B9r6vRSJlTm5htZcfcVfzhdbE8rvIMGMTpTIrIo1DDmeEDymoN3lwdHIKJsAoM/sboK8iUFYAiz
 zTlFYyoD2HVPKRrpyi2YwS2PCAOqIoL3QeepUzeIGv2Vbyuqet5ZG7Vouqh2h4HoSK71xF5HyAY
 AJEPi21tcr0Wr6rGWV0NsL7jyhvJIY1iJ9ORvSwKxG
X-Received: by 2002:a17:902:da89:b0:2b0:ba14:fc55 with SMTP id
 d9443c01a7336-2b5f9fa70camr183057305ad.29.1776748455649; 
 Mon, 20 Apr 2026 22:14:15 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/37] target/arm: Enable EnFPM bits for FEAT_FPMR
Date: Tue, 21 Apr 2026 15:13:19 +1000
Message-ID: <20260421051346.41106-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a0673a343..06b5fbbe55 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -787,6 +787,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mec, cpu)) {
             valid_mask |= SCR_MECEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            valid_mask |= SCR_ENFPM;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -4030,6 +4033,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_gcs, cpu)) {
         valid_mask |= HCRX_GCSEN;
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        valid_mask |= HCRX_ENFPM;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
@@ -4103,6 +4109,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
         if (cpu_isar_feature(aa64_gcs, cpu)) {
             hcrx |= HCRX_GCSEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            hcrx |= HCRX_ENFPM;
+        }
         return hcrx;
     }
     if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_HXEN)) {
-- 
2.43.0


