Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2704996lfk;
        Fri, 4 Feb 2022 08:56:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1/FQ2w+LOag7Fsmj3dZzmGkq5r0OF6zkyun8NyMnlERJi6j/IaNdhjU9O0lXBCJvS1zle
X-Received: by 2002:a81:5b85:: with SMTP id p127mr3854031ywb.132.1643993775357;
        Fri, 04 Feb 2022 08:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643993775; cv=none;
        d=google.com; s=arc-20160816;
        b=k6zPcKYXih2ztxiXHXVGp3pEVzSWdah+cXsuVraDTVrzPWxLkZwcTkpj2qxK+rUqFr
         3tYzWWrXX2+SbLavif5+SZQSzxEtxzRyLdrVpocwPW5JwqQbHbCg5mWXXVDs6GY8XM1T
         aLnZ6BLy9rG8Hxk5zuc6KagWRZKA5H6s/FHE53abVpa0T5xq3irLyBrN2UjiJZGmFH6S
         ZPPuSOL9TUNCgM3iAHQ7GQTy9MFlELa3WcF/Jwth9AzcphoadRyUApumfDzKZ4TnWEt6
         9/xML0JdrOOnqjFUC1I1r8LsFmd9o9mMkY1QyEq4az17gjw1TRfGRaYUvFX5110yb4uL
         CX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ed0qXw0YpiQhxHwBF5JeFrQNFqGWUzVgHXWJkQg7ggw=;
        b=mfweNcZpli5KDGHc/pAjVFv2/746/BAaUV4rVh5S9gekb2NA/U6kiyiTFUNI8bQ3OJ
         /HdnxGoaYQMIwzmZN+YcJYFMoWUICZZFYNFJKASExbgTVwsPQfxpYMj3RyqvJF9ngoUI
         oUJTvWaPIkCk+0YDJlJty9RPcTKXcmw2fBgqvoDKhogDXG5jy2FQ9u64YkhBPx0It60k
         KymNCbj31ap/wo+eyZ6R35qzR/NC0FRBRL8aQQv7qThN9IcY/bVFVHXl1LoAx7d/eOj2
         yd+3U+UKT74vjmU53qMmgxt2sf1LxHHRh+ojwm/FucfipkKcYdhKHbQfma3JtE4aR6bU
         IeOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r1xskzYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a85si1705112ywh.322.2022.02.04.08.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 08:56:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r1xskzYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1sc-0002dI-OY
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 11:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rp-0002cl-Tx
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:25 -0500
Received: from [2a00:1450:4864:20::433] (port=44658
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rm-0003BJ-D4
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id k18so12455414wrg.11
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed0qXw0YpiQhxHwBF5JeFrQNFqGWUzVgHXWJkQg7ggw=;
 b=r1xskzYwJh5kv8t31WC88bJfIdXPdWP1ZzFgIvwTneD793hnHVyb7bUd3M3zXbP3zZ
 YOYGoyc572RMv02b9HlwoVtXpl9PLwgBKcMGphGdMyefpFcNUWsFjhuTADByaLZ0tvuO
 7NgITk7yHRK9q6g1G5A/kVJbS6CmmJZ4KFIfLYEY/8RyGK1+HECbiWybMw+lR3yS6n5c
 xUowDfKJDFHJDZeb0VMQQDhivyHkBUQg1Uo+vjkDb6MCG5kjedBRvlpC9lDJeK4MhdRa
 TD4/AdSvr2QUFhea962SPTNZHawPTtPNTIobc0G4mUYHgvktgTQ3FvXVuG6bJ+f5aB74
 TP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ed0qXw0YpiQhxHwBF5JeFrQNFqGWUzVgHXWJkQg7ggw=;
 b=SmgE/zfsFhWwhsr8Gj3rWmbdd2+li6chcYB6lcvAEAAlco/WQdFyLT0EW5LkM7en+w
 RArKHbob0lVUKJcDEacRgNjLHuVcJSJrUfQkBC/6l7a99MM2SVSNG6S/cikOPTVbiZMC
 HrA9C5DlsnoU9S5L4q0RB9GDR2r7YNo+Ie6lGTZVfiZ/pKZO4RzwVLzG0eZ6eOOUX0gn
 T4F9qczGB1EbJNiGIQFilG5847+9sSBjtH2BKW0s9TpUAjzSW2n2ywCxITXWU+l3bSMc
 5GhleMT0pxYk5m2/gCJetgv6qneH05Py5DRqusa2l/vKTkh31mEGJJVK3WIwAF0ueJlG
 mE0Q==
X-Gm-Message-State: AOAM530NZXfjo+iMYhwX2t9mkoxQvMBHMaIidxtntF8K+3XJwNXSGvOX
 awKYYkhG965Brq065l2PPmlP2ihC73Ltmg==
X-Received: by 2002:adf:e48c:: with SMTP id i12mr3091639wrm.259.1643993709217; 
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Move '-cpu host' code to cpu64.c
Date: Fri,  4 Feb 2022 16:55:01 +0000
Message-Id: <20220204165506.2846058-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGBktyujm2sh

Now that KVM has dropped AArch32 host support, the 'host' CPU type is
always AArch64, and we can move it to cpu64.c.  This move will allow
us to share code between it and '-cpu max', which should behave
the same as '-cpu host' when using KVM or HVF.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 30 ------------------------------
 target/arm/cpu64.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cdbc4cdd012..d655daa949c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,7 +39,6 @@
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
-#include "hvf_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
@@ -2075,31 +2074,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
-    }
-#else
-    hvf_arm_set_cpu_features_from_host(cpu);
-#endif
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static void arm_cpu_instance_init(Object *obj)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
@@ -2147,10 +2121,6 @@ static const TypeInfo arm_cpu_type_info = {
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8786be7783e..052666b819e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -30,6 +30,7 @@
 #endif
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 
@@ -681,6 +682,31 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+static void arm_host_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+#ifdef CONFIG_KVM
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+        aarch64_add_pauth_properties(obj);
+    }
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
+    arm_cpu_post_init(obj);
+}
+
+static const TypeInfo host_arm_cpu_type_info = {
+    .name = TYPE_ARM_HOST_CPU,
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = arm_host_initfn,
+};
+
+#endif
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -1023,6 +1049,10 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
+
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    type_register_static(&host_arm_cpu_type_info);
+#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1

