Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DFCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw58-0005wc-Tk; Thu, 23 Oct 2025 10:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw52-0005tb-Mv
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:16 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4z-0007PN-5U
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so7372205e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228851; x=1761833651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/iyIMlpli6FTCe5zjpzm5x3w0vLSEGAxerjR++HIGs=;
 b=Gm9qmD45sM5Wv2izY9MurTyOJygnzcg3KnUwrqxXUYVnRBWIg9ATxa8tE0tUCwVSx1
 Tb4No9ZHYotqX6fRdsFzbwJ3uvQaNIiE8MCrEY5S5n/M69g1aKAynYyBcJId6ywDfAGO
 kk9cY66GBIxHZ8EKzXtgpEBgJCWtG202mAtNjqIVylrgEzrEn1RtBG++MIn8sabVLyPO
 KSonYKNUQO0+rlYVdAoxEoQDz9p/LU3PuoW4SZ9zylmvXQ+88dmJYq3Q9N/FiEn3H4rk
 hq9vSLgotMAVvy5s7jN4o/N0SKX+kRquUGObUuz1ve9Y2b1U9YSV8+pEIJb06VaBL+wr
 oPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228851; x=1761833651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/iyIMlpli6FTCe5zjpzm5x3w0vLSEGAxerjR++HIGs=;
 b=OVt/nY2swQdo65N4Ct6sa0Rl3X9Qr+HvcE9vGRAJF+dF23g1CDgPP9l0iYfAv1tDK3
 5ysunw2TthVpQvy6kt2BHCb0cLLA/h9eYLTXDyjUSdFhCY6OS5on+DxTdvaL0uOEA+KV
 gDXwHVjeI1iZmloBCMFO5N3O7DwbE5QxlWzQ1sUbv1/lqzc4Jl/KPtlbOK/kwimuTxf8
 /HPJ6XZmZEOofNGVybVT5eswfJzEUBe9Ztip80rFwV3zHq82UZgtLO6DHNA42VXOvTTI
 AmF2I2+bB9ERSgEZAGexTq1IX7q1HQA45wNGBLJldr8+REdqtGMXlkIN3uA9QaeXQGlY
 BECA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlnHYqYRRhEfkJlXrSmKC3kpH+BKbFofkDdB6/a9DwpiOCeIKgJLeAFumMQSqhhkfi3dhHT8qxyQ==@nongnu.org
X-Gm-Message-State: AOJu0YyjsXPA//crtUlvgkplTjMY1tU9m/9aoBpAuauK6rtVPBot0pnJ
 xTkw7IQbef4/lSnPREYsyHP7hbUPGFPqXTi17ydpypfK8LXGq6+pPERPd5Uv8rvxiWQ=
X-Gm-Gg: ASbGnct9adxWYkpYJ8auJjCXOvo00HZlTdY9COqlxaj2fbgmIKQXqEsCbAbaPNaCgap
 5yTLn6jw8fX2EzwlCYpW0bS6r2ACjW7pJAsRznxLczZpGylA7wLiPm2pldxe1XnBk5FlziALYOT
 mRpjiNl9n4FMj9pudyYgvJtO/vaVd//+6gmK51BKIM7WLCY3g33Yu4/PbrmBFbguT48iqqsVtGe
 a6YdCzkY4yyDLyMcGnQcQqHPG2EMT+rKVJOWR2FFJYSIRdnTiLhLXZWgATqra0ibm8SbYkRhdUe
 O/2NC9I4eMWWxsz8y7EfO1Ok7SjnbapIJjS6aEgWFvjhgeeFTR+MyJhhNlvd1fGlZ7StLs/kTrc
 pbfDhs9VgStJ4NZrlIKTLJnO5HwtbHE4gIQ3e+vwyOwkXL9D8dLkvT/drskwPUCTInylAeMDhZS
 6hR0g9ItQ7oRVtEGtnp4wRFiWsLLI7MD6a3rld2wOVdNvHzDelbwEwhXzeDPMt
X-Google-Smtp-Source: AGHT+IHXpB3MzhtN00eUBw9o2qYBPxiuTR1FU2KSZ3PJiuEJZapYSBV6tWavzCkIKpkyCUDoeZ2B5g==
X-Received: by 2002:a05:600c:a4a:b0:471:145b:dd0d with SMTP id
 5b1f17b1804b1-4711790c334mr147062075e9.24.1761228851448; 
 Thu, 23 Oct 2025 07:14:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496bf7137sm62054175e9.3.2025.10.23.07.14.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:14:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 16/58] target/arm/hvf: switch hvf_arm_get_host_cpu_features
 to not create a vCPU
Date: Thu, 23 Oct 2025 16:13:35 +0200
Message-ID: <20251023141339.10143-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

From: Mohamed Mediouni <mohamed@unpredictable.fr>

Creating a vCPU locks out APIs such as hv_gic_create().

As a result, switch to using the hv_vcpu_config_get_feature_reg interface.

Besides, all the following methods must be run on a vCPU thread:

  - hv_vcpu_create()
  - hv_vcpu_get_sys_reg()
  - hv_vcpu_destroy()

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
Message-ID: <20250808070137.48716-3-mohamed@unpredictable.fr>
[PMD: Release config calling os_release()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index dea1cb37d1f..fcb6950692b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -744,25 +744,24 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     ARMISARegisters host_isar = {};
     static const struct isar_regs {
-        int reg;
+        hv_feature_reg_t reg;
         ARMIDRegisterIdx index;
     } regs[] = {
-        { HV_SYS_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },
-        { HV_SYS_REG_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_IDX },
         /* Add ID_AA64PFR2_EL1 here when HVF supports it */
-        { HV_SYS_REG_ID_AA64DFR0_EL1, ID_AA64DFR0_EL1_IDX },
-        { HV_SYS_REG_ID_AA64DFR1_EL1, ID_AA64DFR1_EL1_IDX },
-        { HV_SYS_REG_ID_AA64ISAR0_EL1, ID_AA64ISAR0_EL1_IDX },
-        { HV_SYS_REG_ID_AA64ISAR1_EL1, ID_AA64ISAR1_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64DFR0_EL1, ID_AA64DFR0_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64DFR1_EL1, ID_AA64DFR1_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64ISAR0_EL1, ID_AA64ISAR0_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64ISAR1_EL1, ID_AA64ISAR1_EL1_IDX },
         /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
-        { HV_SYS_REG_ID_AA64MMFR0_EL1, ID_AA64MMFR0_EL1_IDX },
-        { HV_SYS_REG_ID_AA64MMFR1_EL1, ID_AA64MMFR1_EL1_IDX },
-        { HV_SYS_REG_ID_AA64MMFR2_EL1, ID_AA64MMFR2_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64MMFR0_EL1, ID_AA64MMFR0_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64MMFR1_EL1, ID_AA64MMFR1_EL1_IDX },
+        { HV_FEATURE_REG_ID_AA64MMFR2_EL1, ID_AA64MMFR2_EL1_IDX },
         /* Add ID_AA64MMFR3_EL1 here when HVF supports it */
     };
-    hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
-    hv_vcpu_exit_t *exit;
+    hv_vcpu_config_t config = hv_vcpu_config_create();
     uint64_t t;
     int i;
 
@@ -773,17 +772,11 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                      (1ULL << ARM_FEATURE_PMU) |
                      (1ULL << ARM_FEATURE_GENERIC_TIMER);
 
-    /* We set up a small vcpu to extract host registers */
-
-    if (hv_vcpu_create(&fd, &exit, NULL) != HV_SUCCESS) {
-        return false;
-    }
-
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
-        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg,
-                                 &host_isar.idregs[regs[i].index]);
+        r |= hv_vcpu_config_get_feature_reg(config, regs[i].reg,
+                                            &host_isar.idregs[regs[i].index]);
     }
-    r |= hv_vcpu_destroy(fd);
+    os_release(config);
 
     /*
      * Hardcode MIDR because Apple deliberately doesn't expose a divergent
-- 
2.51.0


