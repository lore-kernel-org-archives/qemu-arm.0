Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E94EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:12:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMl-0005Pn-Pp; Mon, 23 Feb 2026 12:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLB-0002pp-LC
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:28 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL4-0000PZ-P0
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so27431295e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866194; x=1772470994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Oc4IQYy6jHc0YZ0doMPC3fB8hIXKqwZ6F4RE9AoioM0=;
 b=Z+4NqwgNKHwCgXFwfU/6FvdMfunw6YwossNC/SPg/QmqpK+w2mSLfb5FL8y6Z0Hgei
 lB0CcvdVVqboaGLNBWX1aByKFrBtUG0uPep/RKDDhNvvD50njI0rtqR6mFCsKxOj1bnf
 jbibzy4COdxz1DXVX5q3h/yPRR2b4/t1LNi+GMB9pX+fpEkCjtavxNg2rpq1F4nIhwWW
 ODhRfOtQXUWwXR567/vhqAecxlCz8GM9Vz799sQsgPMqsRUWhT3DZj8rHD68mVTxthpI
 PFYYRMeBE5R4v40IqkrC/ALKHuxvnvuMWgjKXCUCqviiGkD9lZwoWaqs/7AiZiW46d8m
 5Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866194; x=1772470994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Oc4IQYy6jHc0YZ0doMPC3fB8hIXKqwZ6F4RE9AoioM0=;
 b=r7efnHPS2acIW/u0j4Y0w4hnPROdsNUcG3UZTs9zW/Xb6xoFpv9Oicb1rAl4FDX1U9
 2pnkxVlH34+3hKd2yMtOdRLRatnTBojGYp2ZrCs8i+bwLg7KIR4oEnYSNJgfaw4yOi46
 BFfg8jdM0dHv2TFzoXnTDyHA3RIRqJzKWSriwojm571jNoj3f/HiGBWSrJLx4p3p3mMD
 2C/L1TyzDIyWGl8J8ijhOsVlBAKRnqxRyIx/vnVqB9Nc9ssx61Cnri8U6kUYN/3IvmLt
 MAIVAYPLaJPCKBXDdGbbrPubvH6nAqqCljFptJwosfDpaQPgV2s4WcKrmkj7XTmQOaL7
 0ahw==
X-Gm-Message-State: AOJu0YyNh3GnJdtmo+cMWv5K8PJHpCKOuhi0VUKwTybf00RuE283lgu0
 0vbkkzo02bAKjMMt0dq2H5rNMjlUKm6s5l+2cmbKyJexXT2EjSKVW+ig+mq4u+i5ux6bxF7vfRb
 Vdi4u
X-Gm-Gg: AZuq6aJBQdjYtK7KwqU3QBVCti23uZxjvnmKoSHWwhhnbNO5OOPMzuZXLcHtp/IWOEt
 yTxHRdhWhxugwrlBL2B+TUqjgsl2DDOIRr7/fI6OG4Eap9gymR/aFGncryfAIAvlt1OhuhDCyCU
 Dc9b3aefGE7ktY1WIwumiKQFoLM1xvTCHjdXl8sx7hZDEEKJ6BD8wYa+6SrlaiaxlAiKVH1w5v7
 Psr0IRrYwc5ULYSLWPXpy1src9WC8XYvKR7rnjB1/6hNaRsdR0hOHeHdu8hSBSnFz4AlFWFJ3FL
 sIvVH3f8QJ76KAVyoXaA/WNuwQ0R4LLWLzwnae1Gv4qHbnDMq3CZmYMe9w3aU+7wkOqN8b+rBjY
 dr8riZ6akzsMVd41m/ei9DGviOdNiWiwKZNAOrlur675n+vCXM3eGRFFFNXzmY/gfYszrhGcZs5
 oGvVxT3dkRM2zo9q93xeyVN+inaddOZwfwSw41eP7+jaBZ6q/+A6P6l1jcXM1m4obD6pvJ2sl6N
 WUZchcLXXRCSfE5t/e+f5yJsAWgWIg=
X-Received: by 2002:a05:600c:628d:b0:483:5a29:9678 with SMTP id
 5b1f17b1804b1-483a95bd8a7mr165353425e9.2.1771866193551; 
 Mon, 23 Feb 2026 09:03:13 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 53/65] target/arm: Add has_gcie property to enable FEAT_GCIE
Date: Mon, 23 Feb 2026 17:02:00 +0000
Message-ID: <20260223170212.441276-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Add a has_gcie QOM property to the CPU which allows the board code to
enable FEAT_GCIE, the GICv5 CPU interface.

Enabling the GICv5 CPU interface comes with a significant
restriction: because the GICv5 architecture is Armv9, it assumes the
Armv9 requirement that only EL0 (userspace) may be in AArch32.  So
there are no GIC control system registers defined for AArch32.  We
force AArch32 at ELs 1, 2 and 3 to disabled, to avoid a guest being
able to get into an EL where interrupts are completely broken.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.c          | 45 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h          |  2 ++
 3 files changed, 52 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e391b394ba..c0ba56f244 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1072,6 +1072,11 @@ static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
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
index 551be14e22..7f67e8ae47 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1191,6 +1191,9 @@ static const Property arm_cpu_has_el2_property =
 
 static const Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
+
+static const Property arm_cpu_has_gcie_property =
+            DEFINE_PROP_BOOL("has_gcie", ARMCPU, has_gcie, false);
 #endif
 
 static const Property arm_cpu_cfgend_property =
@@ -1423,6 +1426,11 @@ static void arm_cpu_post_init(Object *obj)
         object_property_add_uint64_ptr(obj, "rvbar",
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
+
+        /* We only allow GICv5 on a 64-bit v8 CPU */
+        if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_gcie_property);
+        }
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
@@ -1697,6 +1705,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                        current_accel_name());
             return;
         }
+        if (cpu->has_gcie) {
+            error_setg(errp,
+                       "Cannot enable %s when guest CPU has GICv5 enabled",
+                       current_accel_name());
+            return;
+        }
     }
 #endif
 
@@ -2020,6 +2034,37 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         FIELD_DP32_IDREG(isar, ID_PFR1, VIRTUALIZATION, 0);
     }
 
+    /* Report FEAT_GCIE in our ID registers if property was set */
+    FIELD_DP64_IDREG(isar, ID_AA64PFR2, GCIE, cpu->has_gcie);
+    if (cpu_isar_feature(aa64_gcie, cpu)) {
+        if (!arm_feature(env, ARM_FEATURE_AARCH64)) {
+            /*
+             * We only create the have_gcie property for AArch64 CPUs,
+             * but the user might have tried aarch64=off with has_gcie=on.
+             */
+            error_setg(errp, "Cannot both enable has_gcie and disable aarch64");
+            return;
+        }
+
+        /*
+         * FEAT_GCIE implies Armv9, which implies no AArch32 above EL0.
+         * Usually we don't strictly insist on this kind of feature
+         * dependency, but in this case we enforce it, because the
+         * GICv5 CPU interface has no AArch32 versions of its system
+         * registers, so interrupts wouldn't work if we allowed AArch32
+         * in EL1 or above. Downgrade "AArch32 and AArch64" to "AArch64".
+         */
+        if (cpu_isar_feature(aa64_aa32_el3, cpu)) {
+            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL3, 1);
+        }
+        if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
+            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL2, 1);
+        }
+        if (cpu_isar_feature(aa64_aa32_el1, cpu)) {
+            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL1, 1);
+        }
+    }
+
     if (cpu_isar_feature(aa64_mte, cpu)) {
         /*
          * The architectural range of GM blocksize is 2-6, however qemu
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 651fccd59b..a5f27dfe0f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1032,6 +1032,8 @@ struct ArchCPU {
     bool has_neon;
     /* CPU has M-profile DSP extension */
     bool has_dsp;
+    /* CPU has FEAT_GCIE GICv5 CPU interface */
+    bool has_gcie;
 
     /* CPU has memory protection unit */
     bool has_mpu;
-- 
2.43.0


