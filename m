Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE4CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 10:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4GNI-0001W4-Fk; Thu, 02 Oct 2025 06:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v4GN7-0001Tv-Cw
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 06:17:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v4GMv-0003iC-R3
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 06:17:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso567286f8f.3
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 03:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759400213; x=1760005013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBgpG96y2lKR3XM562KnP0FZkiyq1hYqwBo0lMKPO14=;
 b=cvLL+NT+6bkyIY6eQaRGQuxmId0wRE+7nuOghrs+VgkWaT6981Z2URkBUpMnjN7RV0
 q+8lJlTuY8pvlNgVU/pH2PPZrNUKFQ/7mbk2umzxNGwYzRAQufzwhSOxpdUmlG2Fo5yz
 /4BGH0oZ6LNMvjJ1yp8oIFH+wsNaOWQ1bDF5wtoJK/4U1XTG9RqsQsHNoEpHpxEyQ0UR
 VGnpJcoJwQsC8FM4oogwIatUVpFp5ZvJc0QIAZ3SREu6stZcBRGeALJvtr7yT9tg5Eyz
 itXw3Nh2JzcA8bIkhdV2ACk8RM5kNsE1l23Wc1ADAH2sU1j0cernazeOhm1b21x3mTOz
 cfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759400213; x=1760005013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBgpG96y2lKR3XM562KnP0FZkiyq1hYqwBo0lMKPO14=;
 b=B7WTNILM/OT4ddzpb5uyGs+Vv/4BPS8EqoVBNThwvq2Dm5/zibKtjltIBgGJ4g1R+7
 W4c+6al5Jd+/kOTeVU6mPqtyu9ty+mj3/4c2ftVz/EcY5m3QvkxElnok9wEsXNVpof+6
 yCvYiaoUjWDOYZzmQzKgXLqXGk+RT2aNqMLNDSIUqC4bNDoodakDogCfv/zkjVwI5BDm
 Gn9BFEimQ4qfH+ciLnwAXjh3dKIm/bmbQ6Fhv8mDBv7BIz27O+61nvKle/w3cHwH/fup
 9j1J6Ph3ExOgkh9MBRzq5wfnh5Lp/nP9q/a6XDtVmdJ+VoEDX59+ykQHxTyusuvBKmaB
 rhAw==
X-Gm-Message-State: AOJu0YwEkEdzQtQSHni9Dj+y3NEFh1uTi/r9PRLTzOlP3RJ42cRdwY58
 IUloXY3WLIm+Dy0L2EPqQyTWdl0X9fJ1PP5iftxH7Is6wyuxEieXQCznjmotUwk0WxgjJr3iqtq
 Tkl72
X-Gm-Gg: ASbGncuc8Vx80pPoeITVsIquMPvp3hSBsIwvFlVw58D8x/vzlrTboZFZMgfjICjWkDo
 3ytW9d8Tnd6czNeHIJyGBJclkbktjNahP3YE96WXyEwjZ8bcg7LsOWjSSNop32mslZ6mHL5zZne
 mkbzXFB24zj9stNmMBb3pQTOD7HGPF9foVOU44LBGHFpA02SBBLDC+M7EQDTWAwtDsS/Gbn98/J
 xrwL1XDum+KRr0qfUyVjvymscXHzjlo3upWJt5GfYp45rG8qqnSJJSs+1/SxqPnEzxHymuys0FL
 VhVq6Dr3pc35N9k/axWXhc1sVYbM++BRcuPRHCtq0Y2drAFKVPiLnBiJmd2CWjyExIuSPeEHrzz
 b3WlJOkG1DVrEC5nlS1jtLouTHRCif2nZZuv4XwDyY5FU+4J440gr67rCFx6yM3+LCms=
X-Google-Smtp-Source: AGHT+IEdfyV10SxaVF2JzlGoG0ODRu/WHoFKdhHC/kWiGy39gP7L3l9HKnavGfoB5g/iw4Jth+0/+g==
X-Received: by 2002:a05:6000:2002:b0:3ec:75c0:9cf5 with SMTP id
 ffacd0b85a97d-42557a1599bmr4680127f8f.47.1759400212655; 
 Thu, 02 Oct 2025 03:16:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9780sm2978809f8f.29.2025.10.02.03.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 03:16:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [RFC PATCH 2/2] target/arm: Allow 'aarch64=off' to be set for TCG CPUs
Date: Thu,  2 Oct 2025 11:16:48 +0100
Message-ID: <20251002101648.2455374-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002101648.2455374-1-peter.maydell@linaro.org>
References: <20251002101648.2455374-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Allow the 'aarch64=off' property, which is currently KVM-only, to
be set for TCG CPUs also.

Note that we don't permit it on the qemu-aarch64 user-mode binary:
this makes no sense as that executable can only handle AArch64
syscalls (and it would also assert at startup since it doesn't
compile in the A32-specific GDB xml files like arm-neon.xml).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst |  7 ++++---
 target/arm/cpu-features.h        |  5 +++++
 target/arm/cpu.c                 | 36 ++++++++++++++++++++++++++++----
 tests/qtest/arm-cpu-features.c   |  8 ++-----
 4 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b3..7c339f1fb71 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -24,9 +24,10 @@ QEMU's support may be limited for some CPU features, only partially
 supporting the feature or only supporting the feature under certain
 configurations.  For example, the ``aarch64`` CPU feature, which, when
 disabled, enables the optional AArch32 CPU feature, is only supported
-when using the KVM accelerator and when running on a host CPU type that
-supports the feature.  While ``aarch64`` currently only works with KVM,
-it could work with TCG.  CPU features that are specific to KVM are
+on the TCG accelerator and when the KVM accelerator is running on a
+host CPU type that supports the feature.
+
+CPU features that are inherently specific to KVM are
 prefixed with "kvm-" and are described in "KVM VCPU Features".
 
 CPU Feature Probing
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 602f6a88e53..201fb93ac7e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1066,6 +1066,11 @@ static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL2) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL3) >= 2;
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e0376b02119..79d71b2e8d2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1220,10 +1220,38 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
      * uniform execution state like do_interrupt.
      */
     if (value == false) {
-        if (!kvm_enabled() || !kvm_arm_aarch32_supported()) {
-            error_setg(errp, "'aarch64' feature cannot be disabled "
-                             "unless KVM is enabled and 32-bit EL1 "
-                             "is supported");
+        if (kvm_enabled()) {
+            if (!kvm_arm_aarch32_supported()) {
+                error_setg(errp, "'aarch64' feature cannot be disabled for KVM "
+                           "because this host does not support 32-bit EL1");
+                return;
+            }
+        } else if (tcg_enabled()) {
+#ifdef CONFIG_USER_ONLY
+            error_setg(errp, "'aarch64' feature cannot be disabled for "
+                       "usermode emulator qemu-aarch64; use qemu-arm instead");
+            return;
+#else
+            bool aa32_at_highest_el;
+            if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
+                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el3, cpu);
+            } else if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
+                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el2, cpu);
+            } else {
+                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el1, cpu);
+            }
+
+            if (!aa32_at_highest_el) {
+                error_setg(errp, "'aarch64' feature cannot be disabled for "
+                           "this TCG CPU because it does not support 32-bit "
+                           "execution at its highest implemented exception "
+                           "level");
+                return;
+            }
+#endif
+        } else {
+            error_setg(errp, "'aarch64' feature cannot be disabled for "
+                       "this accelerator");
             return;
         }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index eb8ddebffbf..66009c3900a 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -493,12 +493,8 @@ static void test_query_cpu_model_expansion(const void *data)
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-        /* Test that features that depend on KVM generate errors without. */
-        assert_error(qts, "max",
-                     "'aarch64' feature cannot be disabled "
-                     "unless KVM is enabled and 32-bit EL1 "
-                     "is supported",
-                     "{ 'aarch64': false }");
+        /* TCG allows us to turn off AArch64 on the 'max' CPU type */
+        assert_set_feature(qts, "max", "aarch64", false);
     }
 
     qtest_quit(qts);
-- 
2.43.0


