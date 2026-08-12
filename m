Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B36C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:46:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFp3-0003vH-QU; Wed, 12 Aug 2026 16:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFox-0003hg-GZ
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:45:11 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFot-0002J2-Ry
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:45:06 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-84867f07d63so25047b3a.2
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567502; x=1787172302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bbExbS5TImnPXe0ZEmZGgBmLPlCUZJyNs5IyQcxmzCQ=;
 b=W5+VK1yjQ2N1iO90gOXO5u7xCYBVL2kIM+bWfr36RCG9u5IPfoUE9ZfUpeIg9CtiRY
 JJaAzB/Jty0C3hzhkEdnhPVwTACedu7qT7f2jatUKw5Lz01q1IA2BPtqOIOQLxDqoJxp
 j8O3e6wn6j3RvgIPYIWDx++M4bXVEnhLHuuiQq/b/oDD5tIJhpGTtDB1I4AsW1wkY4wi
 j5UowZtSEl+X6vAN1DAhGnh+LvoUZXl16R6KkRdgmmGCNEknLqfQpV9UtwwGM4LrsQuS
 idY+vNH58y4ZL0bfeZIcF7Vc5JBlW1HXU+AcClt1FhVpE38Oy+H0Q1k2ZiKSGBZDe4+E
 GsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567502; x=1787172302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bbExbS5TImnPXe0ZEmZGgBmLPlCUZJyNs5IyQcxmzCQ=;
 b=l4ak5GkdzoWEkYD+CEfIMnG2HyMVjCujypGDV1j/koG4KgVYBpY7rX5CVQgt78zzNE
 VnvNO6rLOiIsheqNl0H6h6nUaccNXpAzq8o10Yv8c22cixNxXRxzFR2EBPe/7SbX6XxK
 E6VMgKoeMHMwthLDc4qO+qYYbXS1irsnG04+juCUdkzGxUk/9lmS3qURUkfZDdTnSNtw
 O+9kHcZq3FVCmd6BRlqGbSmhy8BDycBQhXGWJLLwXj6pl9t+9mOeXruJ04kjFCZTCbQ4
 HJyxEGtMeB+mzHd8B6+RmOem6C2Q4etinNv5lSBEe4M3E7RiHwSl7UdFn0NwQBzKbuCI
 G36w==
X-Gm-Message-State: AOJu0YzCNSuHYFDcO2KzsdZa0FNEnaV3ZghFWc2AlNOuFNtkxw3bNNdM
 FD5FvnX5svvV557XgK28/PudQtfRizYJgyC4L3oWctLyNQL/dSCdJ5T8v0sak7oXguQ=
X-Gm-Gg: AR+sD12JrsETym1o+5HC03z9ynoZ9fxpvWDOMzcbX6uMSU31wEsOEmyUBiNbDlcEogl
 /o+o1Ak/7/Zsn/MGkokFwaJtlPWnP0iB4HT0lcmzOLsHUcNvUtZstwASH4aksAiv93zZrtP3SRe
 Jku0HgB0sKcp4GEL3twKq4D0+RUrEU7eQUynoKWaT753R/9g8GpwaIjDEybdUUZ4KLrCQaDOvl1
 LynRnohy+nPTrGFPZO1j3EdI0S+100Jy5tAv2bqSL8CTy8st5LH0JtXOfLdBz9jnpm8tJpezFRw
 3O+zpMwCIKY4qpF9zTX62gg9Soyf9byj0LGs04Hte+bg4d6X7tJRgl6NYdhciZ8eOhqPBhvdTjX
 BVVDeFQx42mzuYQ8NYFeCQOmp66MCDJihpwgiXwbWTef/pizTX06cfAh8GYsYdwr10wiK4o/ku8
 OUAm92nprqenWiKhyLH9v8HsRS9zdJkuemAdXzI6b0bF4ErDHOtYnFbBWWEgZ1Hdhio6DKYdo5m
 BF5EWQ738zMBjPprvrXUfUbr03Wplec
X-Received: by 2002:a05:6a00:3907:b0:847:99bb:b6d8 with SMTP id
 d2e1a72fcca58-84fc745d499mr532756b3a.26.1786567483877; 
 Wed, 12 Aug 2026 13:44:43 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/10] target/arm: Split out aarch32_max_tcg_init
Date: Wed, 12 Aug 2026 13:44:30 -0700
Message-ID: <20260812204435.295067-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/cpu-max.c   | 16 +---------------
 target/arm/tcg/cpu32.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5e7f41a50d..f6b4e173a5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1838,6 +1838,7 @@ uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure,
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
+void aarch32_max_tcg_init(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 93f24114a5..7df7d015a9 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -202,22 +202,8 @@ static void cpu_max_initfn(Object *obj)
     }
 
     if (tcg_enabled()) {
-        /*
-         * '-cpu max' for TCG: we currently do this as
-         * "A57 with extra things"
-         */
         if (!aarch64_enabled) {
-            aarch64_aa32_a57_init(cpu, false);
-            aa32_max_features(cpu);
-#ifdef CONFIG_USER_ONLY
-            /*
-             * Break with true ARMv8 and add back old-style VFP short-vector
-             * support. Only do this for user-mode, where -cpu max is the default,
-             * so that older v6 and v7 programs are more likely to work without
-             * adjustment.
-             */
-            cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-#endif
+            aarch32_max_tcg_init(cpu);
         } else {
             aarch64_max_tcg_initfn(obj);
         }
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 8220d785f5..e1ff074b47 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -748,3 +748,18 @@ static void arm_tcg_cpu_register_types(void)
 type_init(arm_tcg_cpu_register_types)
 
 #endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
+
+void aarch32_max_tcg_init(ARMCPU *cpu)
+{
+    aarch64_aa32_a57_init(cpu, false);
+    aa32_max_features(cpu);
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Break with true ARMv8 and add back old-style VFP short-vector
+     * support. Only do this for user-mode, where -cpu max is the default,
+     * so that older v6 and v7 programs are more likely to work without
+     * adjustment.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+#endif
+}
-- 
2.43.0


