Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3485FCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDceq-0003xS-2o; Tue, 28 Oct 2025 01:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcen-0003p0-KH
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:54:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcek-0004ja-B2
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:54:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475dd54d7cdso10139045e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630844; x=1762235644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/iyIMlpli6FTCe5zjpzm5x3w0vLSEGAxerjR++HIGs=;
 b=XazHInvhBjbnktxjcs97gXDkCDmZCctvzbq8/Bt74RsmlNGVidtgwi/+7F3cJDjpgb
 lJ5dyj9KDfeWAgFWETII0xJtr3zsQfdTLEfR2wcNL0mTcFCwz8fDncXPgKQzs6103JAx
 4deiL/MJ/+k/QrRtJ022tdgiW56BmtcTU/6dFe5bXs8AFM/xdZNOzXYFP6GWYKWoA+cO
 2yn1MagkpfZZqg8NheEbWXxQhubrlNakPhpDO4mW1YKGnhoOEoaBlAbsBVzxrvE0qllk
 kVpbG9TFqxUUdqgLF48hBCjAqANxIw2saAsfyNcHI/Xy5xlq8e91Q0Z+yjYgSJDAQUl4
 2crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630844; x=1762235644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/iyIMlpli6FTCe5zjpzm5x3w0vLSEGAxerjR++HIGs=;
 b=mYlQsQ5orIL/8VZtUvSbOZDhoiJFaeeTMH3KBM+spsMPfAwkWeLbILb4+oXlxNWnK9
 6TKyf8DDfLT4aEyL7svwHmkVjPbdJJbTCMh6AWtXBZjCyyEmlFJdLkwBjtutk6+qu139
 FbU3OVie16fx6fqDYt4OlBzWlQllcWRCSfl4jVUeCuorWG0JkRZWTgM2SV6UGGJ0p+xQ
 f8VfP6b0i+ypaEBsfu2WkzEpklhnu0fMksQuBON5ALK4oHJ/htnGFzCGoieCUK5EC14n
 x5jtaJHCBnJ5AhcuK90qAJ0mQP5y3IsUnrMyrcNb2pu/PFKpbKsilP4nuBYC/zvxZSRC
 aIxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1JglQ2DOjRhtrhjkqDmNfM58cTeFgqAFjgeATaAuB4RBlFWslCD+jOEe0zuHfKXZR9G0n+MvaAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy7QZ8ltlxSa7T4y2MOrcHdTx6gjTpZ+lrC9qsqCkkMfaedvfii
 LZBx5griSl/gu0CO/oo6EcT6ialpUWdMS72donB/TcrAZawdVYnULYPF+ERLlpz5cqE=
X-Gm-Gg: ASbGncvoRadpdpNu8cG98npRBE4kegUrV69uMIhPv9YodMfu8dKvSt9+Xj8yxYEs3Qc
 SBR9H1DVM9hfwTcLodcN4Mu4ceTyozE6UK1C2/vpV7LmrmKN7n93soObQ/icWJ7vBFGI0J3jGLo
 Oh1QuRwuUfu3RvJTz81mK5xyL/it+oZHrnsJiK3Zr0x/il+UtK8NWRVymJHqRMTCXPa56xYC41Q
 YFEOGv5MKvyDGBucHE5zrt8ItdCq2VurfxJNjFXD1ZHXW0tRaItwmZgr7pR3zJ/yOy8mbgpJxD9
 uUeqLNC8R7T1n7iaZx5q3iu3W+Z6Wx5QYj6EXHArjtsDIORzMPj56w6zUxjoTnGKcqQCOG2WQQ7
 loh+EtLCCxM1j4kETaUkg+sT4NxZmJxCw8o9SVx0NQT+EjOxykJo9Z7J2/nHP21nknJzBVrwTp9
 RdmiW1jbh8iPBahM3/q29gToVEHdYpv84sU+3ZKvOviM8Dav+15fUydT8=
X-Google-Smtp-Source: AGHT+IEb5h81e+/XRFYjkuXTFEucItwYLOcip2VYuQP8l/oQrFzh/8Ox6YeT99QNDXQq5I5Nuj0bJw==
X-Received: by 2002:a05:600c:3510:b0:46f:b42e:e394 with SMTP id
 5b1f17b1804b1-47717e7a904mr13880105e9.41.1761630844106; 
 Mon, 27 Oct 2025 22:54:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm170237355e9.0.2025.10.27.22.54.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:54:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 16/59] target/arm/hvf: switch hvf_arm_get_host_cpu_features
 to not create a vCPU
Date: Tue, 28 Oct 2025 06:41:52 +0100
Message-ID: <20251028054238.14949-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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


