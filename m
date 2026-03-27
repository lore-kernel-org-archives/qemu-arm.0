Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF58510ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:26:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Dp-0001oa-Bh; Fri, 27 Mar 2026 07:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CT-0007Rc-QV
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CN-0008VH-AU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43b40fb7f95so1731282f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610273; x=1775215073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RE5bgzAjVOacUgbbD9Z/UDipABb/jWxn6hy30QQZTF0=;
 b=RFBJH/+D0U6+/9cyZYFrC/4PcQVnTSGJ4DaD2l5O4o2am4oix/9QNyzLDOAqQ5fymm
 Q9qb9rrQaPHkNkwXoJFvjPAptfECYHEANrlgyzKeNjGPIPl1N08D6dRprC/mAAfDkHzy
 BNDZzMdebW9k5EnZBTNLXRhwkUvHNFa/qIc0KcUKAxQawNjz1z0zWZh+A2qq3qvlRLsa
 m5LeipLXe+ZmGKsp33w8XmqzbE83a+7Qk8pyCCNSbv+DLDEN3djig0Fffe91V14tiYzE
 QUsRQj/PMD0tWPm6SeKk4wWIX12xYPJoVeI7cFfIasPUOAHFp74Oq2xZ4fLIEHUNefjq
 6E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610273; x=1775215073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RE5bgzAjVOacUgbbD9Z/UDipABb/jWxn6hy30QQZTF0=;
 b=WUJaXnwOK6tiYCXXaL+pxHbrRtDk3YgYEgVytrMPHIq7uS9xj9eyfPSRIkgNDOHqqC
 p95rd+l6iZuAKFtq3G4bT0R2vVjt2lc5rYLxMDEx08YQm3tHLNXmJ2RB7DGwUv7NjIrj
 Zg2I/issYeYnkNnsqRmXf3huzkTDg/hnBAKps5/F5BAalKszGsGshscBQoU4omkqM90j
 DM0UTpjf87AdyHWwab3GnJFMLISCNcg1oCD4DIQciZe4svAuir+CyVUeu8a0EKs/GSRv
 GI/J+VrF9KHPcEdyaQJA7iGEkWnYbnHyrUaB5hAHjVrSzC2nkfSUwR0qf/gZAzY+dwl/
 q/jA==
X-Gm-Message-State: AOJu0YwyvgIGGLKAFxO91td3RowHKGXFYVzE5e3SkKMr3ULzRkj4ORv9
 Q/eLrzfWvqrzbbQY5nPLecBwYVRFJwEATdsh6oqtelzf+cp2xuEYEupGiv61NChdYjsH2gUrJXP
 PNMtnOPo=
X-Gm-Gg: ATEYQzxygO5WleatFCJYSYrhXWCyQessgUUmXRsqvBiMXj8um++mEP7Z6sW998HGAxr
 I6q4/24gdxJaS5HdA3ztO7RUIGfNViJw082zhzBB2NjPv2GARStZ1LXg5/0XV2LmXlGs5N+Dgmv
 qn5uynCfHd+zqABeNxxOdgrOmzDElyGTWgEwAENaw+6EGpqcqKWsjKPaRAX4a803DP6vo52fhrm
 Y1E+A3U8Z40lNb6h+npxHtjgwE7wbhY+7mvTf5iwIJ/cDdZ2uuPhq8+DKWUUt3knBnMHt08JsZw
 p/cn9VSsXeHENZARvGVaVN67mP18bSuki98emrT+dFRNjfeooGqDHsRkkDVDFJiN13eCmLfpKjS
 YIhdumwKk1/q0WvD2WsJG4evdZeq2xnhyYQIMBEQDZTnPFdl8yKzuAQrd4xwSl2KJ/LkHX6Tp9l
 OQ1l6Xf6AGtUcV1Cj6Vi8qT8NbC2oGJL6qD8X52O4SJWvoYFO5Kj0qMeK5UU7WKwhjXTwPkQR1Z
 kj/eJt/Bxz9f04V+1eYEWdDMFR95H8=
X-Received: by 2002:a05:6000:4027:b0:43a:580:f60d with SMTP id
 ffacd0b85a97d-43b9ea4a5b4mr3266355f8f.35.1774610273421; 
 Fri, 27 Mar 2026 04:17:53 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 54/65] target/arm: Add has_gcie property to enable FEAT_GCIE
Date: Fri, 27 Mar 2026 11:16:49 +0000
Message-ID: <20260327111700.795099-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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
index ceb303a55a..21c2953501 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1197,6 +1197,9 @@ static const Property arm_cpu_has_el2_property =
 
 static const Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
+
+static const Property arm_cpu_has_gcie_property =
+            DEFINE_PROP_BOOL("has_gcie", ARMCPU, has_gcie, false);
 #endif
 
 static const Property arm_cpu_cfgend_property =
@@ -1425,6 +1428,11 @@ static void arm_cpu_post_init(Object *obj)
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
@@ -1699,6 +1707,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
 
@@ -2022,6 +2036,37 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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


