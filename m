Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE5ACCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:53:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDceM-0003YJ-89; Tue, 28 Oct 2025 01:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDce7-0003QX-N5
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:53:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDce3-0004gv-L7
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:53:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so4881422f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630802; x=1762235602; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPRRwLj76IcDwxiEgjfHUMq405RINil88LOEgkCDg4g=;
 b=l0pF6zHTLcorNjwnMtTlFAp6Jy9DfTIPZpLI1I/MuTBc5WxVpIVUfr4xflacPqCMEH
 wcLpu/N9Qxxy+NQ6iSsSTNdpeVIHFRS0dztOfUc7T11G9vDJXFbECzCY2shH3B/AP4yc
 nOsL0LGt7XWdAaET/U2eiYkWUO7w91p1ScinYFZXAPNwNJ4aujumh9V2uyKh93ORkiSY
 hbRoiOoy+yG2QOISkj6lPSkfPZmLqBxvEngWMkGZpzSP6hV9TcBgJZomR8miF+Nt4fWm
 MJAbUAiqn6uJuXCZFcATU/mHy6Suv7TnNFEfIQ2DVE6mXSapvGx7751PO5JVJ+2a9XVg
 xqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630802; x=1762235602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPRRwLj76IcDwxiEgjfHUMq405RINil88LOEgkCDg4g=;
 b=DqQwUkXFA96ehL27uHYB2Dh2oEnBW0KTIQgUE1ClbxVt6f7KZ/okAC7jW5D1Yc1eWR
 uDHPcIaYL6Uby+NodyVhqmx8yNd4Bi11fa1O8aUA+98GWxsvPHR3KSfhoVIlsinQD9uN
 kuYrpZSCrfKvD0jChfHBsiar3n3OvjDJbJK0FlhZaI/X2a/yyhKNM8lP/ic+Q9JjuwBO
 ICKcYkdE38ojleNAQQ/8oq1QU76I8bAsFpNuj5zX1MOV5oro1PCOSxp1gWe/vA+LjCWK
 p4e4UfRodmc6Br7kgOX+x7F1S5kUI+PgxhvlqTm+/z4rmYo38ogApedhRsOtQuYxYulE
 oBZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxwoXFvO8XsbEIRdOB5At1MJgc8yTfyxxU0I7gfLC1/P9hHAO3LGFjLL2d8BJ3zuu5Z5Ut3iIAEw==@nongnu.org
X-Gm-Message-State: AOJu0YyQU98plbdxJNCinAFq1V5hbfJiqgR9zYplH0ElLoYBqIr5zTTI
 t4UjgrIEZkaPcO77tZkOn6mEdIKNSNWJvt77GNMj7oUrTJz15SHcTrdhc3Uj+w8bQHk=
X-Gm-Gg: ASbGncuygiZXBruFEdQdEWhb/d8tmabYj7k3t5qYTrUj1dE4/OvJU5JWnx0uId5VJMi
 tCKAZ9UCeZTsSHTLjUhWqdm/G9LWsdp9p9C4NeEtb9KEepbSHQAHnkowiannM4Jxt0dIiTh7Usn
 fPAU/5RsF8BKjW8E26T8GyeWxEAnsVXv6xH+40MuS/A5NffEJO4SW8AZg1N8f92efX1i/6DHlQ1
 nOoaRjzu8E3rINBciDYQy+vbdJlmQp+lruuVH6YrRsWZ8R1qlqwze614bAowsnjM7X74htfRWU/
 jFT/KARjW3CAYkJzVPeaYdb2Y4BAbgP129LSUzG+FihZ48Ha8vaIGxgrkeMSKQLQMnFuvUObPks
 LNvJ9P1fehPgXhnLHPUppUJ2o00lN+vQd1B5QqsnQURSpxzvSExKonyopyMGGLmc3D5VDqGcA8P
 /qkIzsdEg2ryQmHwZsje3sO87UcICshix+jEv9SwzDGun6YC7Ql420VVs=
X-Google-Smtp-Source: AGHT+IGBx//945fjY+61kZB9I3lDSHqKuRIUCe22/xupT8sh4qbgKfJbxvD5raUlJ/JvbSaJV1ScOg==
X-Received: by 2002:a05:6000:2911:b0:428:52d8:9680 with SMTP id
 ffacd0b85a97d-429a7e5522bmr1605473f8f.18.1761630801797; 
 Mon, 27 Oct 2025 22:53:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79absm17995807f8f.3.2025.10.27.22.53.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:53:21 -0700 (PDT)
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
Subject: [PATCH v3 15/59] target/arm/hvf: Simplify
 hvf_arm_get_host_cpu_features()
Date: Tue, 28 Oct 2025 06:41:51 +0100
Message-ID: <20251028054238.14949-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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


