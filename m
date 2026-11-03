Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE7606D803
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UfjfKAgc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIHN-0000C8-IA; Tue, 03 Nov 2026 12:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIHB-00007q-SV
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIHA-0006QW-1H
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so4619863f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793726782; x=1794331582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=34KHtRevO4j1KwkNGPsiHWeCTNRp5jN9Be6wHWBz8uI=;
 b=UfjfKAgca6rpLEwkaJGpsOhNmf62nh614jBF3a76FSH2Ql3XxpyyDBN/Mi1cBQpsLw
 fbezKnUFI1AEiPQfw9kFPqRA/KpgBYhceK/0wd+vjDPl6JafQgMQzWyCUFHDkeBZWn6v
 QIsTANCEmDqoWeypiKsYUGX1qpyiqTA8/unkrcCx0DO/XsgQcBi4t+rF01QvEQoBpKSB
 w+F+wqGGWtZNSsGbzkvhnm3zZ/f6BgkFbS02TOhwhThXjZg2lm2sTZJijMczead44sRt
 kauGuPQq4C56PGJ70jwnQZfi/vlPpppOwc2xm2mNBxqyoZW8us8c3xjlX4sA01oG/a8x
 oVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793726782; x=1794331582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=34KHtRevO4j1KwkNGPsiHWeCTNRp5jN9Be6wHWBz8uI=;
 b=TpXx7l090R6N5WeAoqI8WtDxgkDVVmAzLyrb5MndTE8cAEUAQKcHfgSw7dxyfE9PzR
 1Sfqf2FKf5tW5sWVgIVTj9cIV7JYec0ooICrMOaHBvXA1SAgbQeP3OyaJ4P2Z/HY7Hr3
 +lWrpmU2BS/qqi14Q0+uOqInoIdyrOXXDgJEdGAfABfN9qx2br+LihnC+tP3Li6ERlpi
 mKPyiBubL+83LeLgyauWgtej1CcjudRBAfMe+LAXdbJYvygQgq7N00cuj/JbF3cIZMsP
 L894KNiSwItmlrq7b8clOxF5LVA3NOmRC219wECt26C3n/+wTSsqxwO8bCw3VGt8IaB2
 1sjA==
X-Gm-Message-State: APuU4Z9U5ubh9M7jjZy1Z50mhrkEZrLcGikF4kQEevx8VprHhX30QTqV
 ZmN7lnjhQPdTBiM7Az9ohQiF+4hYD8ICdQVneivfi0vL7nCO4lxFiLgwH6+3pxYKDl6vR2YQrgA
 vGn/t5z4=
X-Gm-Gg: AYBFou304wkrZXzt8tkLL5O3069FI3DQXUMqu2hTk9OdvNrVIlG+ZKCuN0pvJyjoJ44
 VQybYkiIQk6hmtPb1Fn+DeL+tIqvV5QmlZ2pRMcYtAZ0EWcXsiBftpqHCsRYAj2QAj9o6XHITIW
 7b5M8TnWnRuPIU1ziFcf98KCDe51PEsGom8+bT7w5ndYYRNaTXsqensewMZbCqVBo0X/iPaZU2d
 oy8h9gSuaia4BI3BZS/qCCH8PF2tANI5EpZm61I9c9fxmOlAf7NMJb2LFMCoVm4j5p3KdOneb06
 43yTJtGoES5tT8O4pyTgfUV2lhHf5caNPJsAEo0hvFd94vCYN6e7J9fokcZsQGyfB7drMkS82Tm
 MNYpUCZUX/I9rNoz8loaNmPJ3pompYILKpc8oqvEWLLF5e5naGfB78zKlVNKYY6ZIZwZg2BcOjR
 BhnwyR/h0uEuZjmAPc3I402exVtqcGV1MTRbyeTiKqKqpzLCnMiCu8UeKDLrchk6jB1vt+SYYgi
 z67EmTNeFEUZYHH2RcbJxDle9ZLnbv1zbq2febxBFPOIymHcfsMWilObqKC8EoWAQftHoSiAhas
 D9nt+kgvOZR4hd7XiLi2ca6bRKVPXnezk/2N/0e1M0ktuuI33McNFMU279Hrtv6Qt+G8l2lrjim
 GMQwwJGMI6GeOX2IsyldWAvxckP5ZIF811n4=
X-Received: by 2002:a05:600c:468c:b0:4a3:59c9:a750 with SMTP id
 5b1f17b1804b1-4ac17d168bcmr321244145e9.9.1793726782487; 
 Tue, 03 Nov 2026 09:26:22 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm211082605e9.3.2026.11.03.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:26:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.2 3/4] target/arm: Only allow GICv5 on CPUs without
 AArch32 at EL1..3
Date: Tue,  3 Nov 2026 17:26:15 +0000
Message-ID: <20261103172616.2400758-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103172616.2400758-1-peter.maydell@linaro.org>
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We previously allowed the GICv5 on any 64-bit CPU, with a hack where
enabling the GICv5 silently disabled AArch32 for EL1..3.

Now that we have a separate 'max-v8' and 'max-v9' where max-v9
correctly doesn't implement AArch32 at EL1..3, we can fix the "when
do we expose the has_gcie property" condition so that we only allow
the GICv5 when AArch32 doesn't exist above EL0, and remove the hack
disabling AArch32.

We could instead have defined a new ARM_FEATURE_V9, but "allow the
feature to be present on CPUs where it doesn't actively break
anything" fits the way we've generally handled things in QEMU, and it
avoids having a new V9 feature bit that we only use for this one
thing and where it's not clear when we should be setting it for KVM,
hvf, etc accelerators.

In practice the only CPUs which will allow GICv5 now are max, max-v9
and a64fx.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h |  8 ++++++++
 target/arm/cpu.c          | 37 +++++++------------------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 96ec12f64f4..b0edec28378 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1130,6 +1130,14 @@ static inline bool isar_feature_aa64_aa32_el3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL3) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_above_el0(const ARMISARegisters *id)
+{
+    /* True if any EL above EL0 has AArch32 support */
+    return isar_feature_aa64_aa32_el1(id) ||
+        isar_feature_aa64_aa32_el2(id) ||
+        isar_feature_aa64_aa32_el3(id);
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 71681447b21..dde03ffdd6f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1596,8 +1596,13 @@ static void arm_cpu_post_init(Object *obj)
                                        &cpu->rvbar_prop,
                                        OBJ_PROP_FLAG_READWRITE);
 
-        /* We only allow GICv5 on a 64-bit v8 CPU */
-        if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        /*
+         * We only allow GICv5 on a CPU with no AArch32 support above EL0
+         * (which is typically a v9 CPU), because GICv5 defines no AArch32
+         * system registers to control it.
+         */
+        if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
+            !cpu_isar_feature(aa64_aa32_above_el0, cpu)) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_gcie_property);
         }
     }
@@ -2274,34 +2279,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     /* Report FEAT_GCIE in our ID registers if property was set */
     FIELD_DP64_IDREG(isar, ID_AA64PFR2, GCIE, cpu->has_gcie);
-    if (cpu_isar_feature(aa64_gcie, cpu)) {
-        if (!arm_feature(env, ARM_FEATURE_AARCH64)) {
-            /*
-             * We only create the have_gcie property for AArch64 CPUs,
-             * but the user might have tried aarch64=off with has_gcie=on.
-             */
-            error_setg(errp, "Cannot both enable has_gcie and disable aarch64");
-            return;
-        }
-
-        /*
-         * FEAT_GCIE implies Armv9, which implies no AArch32 above EL0.
-         * Usually we don't strictly insist on this kind of feature
-         * dependency, but in this case we enforce it, because the
-         * GICv5 CPU interface has no AArch32 versions of its system
-         * registers, so interrupts wouldn't work if we allowed AArch32
-         * in EL1 or above. Downgrade "AArch32 and AArch64" to "AArch64".
-         */
-        if (cpu_isar_feature(aa64_aa32_el3, cpu)) {
-            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL3, 1);
-        }
-        if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
-            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL2, 1);
-        }
-        if (cpu_isar_feature(aa64_aa32_el1, cpu)) {
-            FIELD_DP64_IDREG(isar, ID_AA64PFR0, EL1, 1);
-        }
-    }
 
     if (cpu_isar_feature(aa64_mte, cpu)) {
         /*
-- 
2.43.0


