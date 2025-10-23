Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF819CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:15:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw56-0005ve-Jf; Thu, 23 Oct 2025 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw51-0005tQ-Tb
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4u-0007Ok-4o
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso6682135e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228846; x=1761833646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPRRwLj76IcDwxiEgjfHUMq405RINil88LOEgkCDg4g=;
 b=KR/fBf+T8dykxTclQ88yXi28gAIRTfhlWhnuujmfkhobKW2o6sDUKUkxyeuJioFaHE
 J5AMDHBRqXmvcWpI+U//Q8sJI5+DQoTlijGLySH3WFukjHN2oOvaCnIlHpNOo/gfc/xW
 TZDamOhWMTockWsG4Si1HnIQYHVwxBEyXPVX3G1JqaUdCQckT5RXiz4XqREj95tO7pIR
 lGCr7M4JyEKHpSJZv+D00AUbfgE9vEtxurExQXNZeFIgbEVqAWQGK7eDZN1bivg9h4a8
 quLgEQxws7HsyaxlqV67KnybP0aOHFNO9y6CiqAuVaqMi8idn9yjsGeVQ63UUgVngjrR
 ADBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228846; x=1761833646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPRRwLj76IcDwxiEgjfHUMq405RINil88LOEgkCDg4g=;
 b=U0hUR0wffMuaMtuz9VdqStZ3HM+S7jX8A1J5lwiaNbNqbjc7ikS7DhzfwfTUSJxlwb
 0MTJd9y9gl0nIUIHmXPgHXVfctfdgeOYuDKQenCB5GmWDfZDKnF6uGaY9Y552dTd9+ab
 a/OVGN80rTcxPKWFKwtrHz2evA/noJWveIDJ/vmRpsQYybulTWnjmEcFt2EIT4GRcgYc
 AVmmW/k6mNC1ATsW3YOLxJCRYu0IIjrxD/A5A3JtNe47l+plu+wI7qXaFoaMC82OkqGP
 /RWOF9E5ztX7M8+PwA6XX1+v4EpFnDlLb+JHli6QURaoDJJkeepi/SX7s73sV5jzbzml
 YdkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuyWqhAwMB5l0dS7hlX2m9bp0It/2oltPIpsx4i1YpbdOkCiTKedll8mTyPkgh3ZSHlAFYDenj8A==@nongnu.org
X-Gm-Message-State: AOJu0YzB9cCzA7AUBPCWbA6e875xpyKHCS6sfUyOvAO18YU1eL12fQN4
 agVcl0dPL2w8lO7jVeTZwcKVgw0yBaq8VeWXWsm873KErUX4AWx02hEoSGCBT6M/D8I=
X-Gm-Gg: ASbGncsZb/cdB6Bf3rqzgVVAQ8aiJ2yzRMWI0kfOKuLFI9cQSMBPM3xzxUIe6jMWmaT
 /3xP4yukw49UIb3vLFKnOvkp4FZWKHQjjAHp+oZ9mdeHOG8LPuyf1WUp8aWE38fN/jukjDr1QNU
 LAWE2fA7K1RihSiArpYxASRBtI/uHQVSDLSkQmvmM9lbMlBey+6GVptXNxejxXSk8LERxqARdJq
 m77+2atA0GGybtXNHx0Xj8obaQ1VUJOrNhpb8ISleC9W2+DCGl1s/5g+AmEuWk/QDwWBoNRt5/0
 96T081V1KOkelIc62w75g/W0lDuFb07cOyHs6qSUcPt7mXcId8QtRmAB96PnhZKfpwwl/+Rm9jv
 2peSc25+4ycDtzZhUVVy1oF0JLkgltZ/WuR3HyQ4fC+u6nr34k0btuKKrazklecoP1bb4nImn7X
 As9EqyKP4aOPWMQZUGTSp1/+T4fJYYUR3qIIgAVZyqYOZanmA8N3DoMrrsJzjG
X-Google-Smtp-Source: AGHT+IFMdQ58xrMRUX6dzUgY79SmJ1MkX80IjdKXk4TetdhTTz3dppUk37vr8z/z4eOnZE4KqCL3+w==
X-Received: by 2002:a05:600c:3b83:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-47117925171mr251202815e9.34.1761228846452; 
 Thu, 23 Oct 2025 07:14:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342946sm99794275e9.10.2025.10.23.07.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:14:05 -0700 (PDT)
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
Subject: [PATCH v2 15/58] target/arm/hvf: Simplify
 hvf_arm_get_host_cpu_features()
Date: Thu, 23 Oct 2025 16:13:34 +0200
Message-ID: <20251023141339.10143-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Use index in the structure, dereference &host_isar.idregs[] once.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 890e9266f93..dea1cb37d1f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -743,21 +743,21 @@ static void clamp_id_aa64mmfr0_parange_to_ipa_size(ARMISARegisters *isar)
 static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     ARMISARegisters host_isar = {};
-    const struct isar_regs {
+    static const struct isar_regs {
         int reg;
-        uint64_t *val;
+        ARMIDRegisterIdx index;
     } regs[] = {
-        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.idregs[ID_AA64PFR1_EL1_IDX] },
+        { HV_SYS_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },
+        { HV_SYS_REG_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_IDX },
         /* Add ID_AA64PFR2_EL1 here when HVF supports it */
-        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.idregs[ID_AA64DFR0_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.idregs[ID_AA64DFR1_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.idregs[ID_AA64ISAR1_EL1_IDX] },
+        { HV_SYS_REG_ID_AA64DFR0_EL1, ID_AA64DFR0_EL1_IDX },
+        { HV_SYS_REG_ID_AA64DFR1_EL1, ID_AA64DFR1_EL1_IDX },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, ID_AA64ISAR0_EL1_IDX },
+        { HV_SYS_REG_ID_AA64ISAR1_EL1, ID_AA64ISAR1_EL1_IDX },
         /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
-        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.idregs[ID_AA64MMFR0_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.idregs[ID_AA64MMFR1_EL1_IDX] },
-        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.idregs[ID_AA64MMFR2_EL1_IDX] },
+        { HV_SYS_REG_ID_AA64MMFR0_EL1, ID_AA64MMFR0_EL1_IDX },
+        { HV_SYS_REG_ID_AA64MMFR1_EL1, ID_AA64MMFR1_EL1_IDX },
+        { HV_SYS_REG_ID_AA64MMFR2_EL1, ID_AA64MMFR2_EL1_IDX },
         /* Add ID_AA64MMFR3_EL1 here when HVF supports it */
     };
     hv_vcpu_t fd;
@@ -780,7 +780,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
-        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
+        r |= hv_vcpu_get_sys_reg(fd, regs[i].reg,
+                                 &host_isar.idregs[regs[i].index]);
     }
     r |= hv_vcpu_destroy(fd);
 
-- 
2.51.0


