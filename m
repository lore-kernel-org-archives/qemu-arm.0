Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp4382ejb;
        Tue, 6 Jun 2023 21:42:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hCJrlr+xWKGS50ck1LScGqSIfnwayqp9SuBDkZWrz3jqPnzx5p0AJkEuoBtDxbmQvTuGQ
X-Received: by 2002:a05:622a:30e:b0:3f8:465:23a9 with SMTP id q14-20020a05622a030e00b003f8046523a9mr2037220qtw.23.1686112947535;
        Tue, 06 Jun 2023 21:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112947; cv=none;
        d=google.com; s=arc-20160816;
        b=GI2VOkwmfO+Y3JzHrVee4rTwymrywFrRKiF0iTYShAYzYaJVWovHhcS81/OPM4F8Q1
         b1Vx+9Kn27dHLfRXqCWSZsfwESGzZA2UtwzQ37Tha32gBr1rKw3TgoOsT3QB+5a8nYx3
         cMHFOmvU/fFpnNRZBrrY6QhbziwduNgBOfYEM+X86uc1l4/v/FZe3BQPQYCLWjJIMXrg
         08L1UU4EQfWaaW7UTQMdcKghdyMtpGC//UPTW40Itcb2N1A9ebHZVmObjz8CL38Iep8X
         mmvrW2Iea/+AWmCVt6GxPT0/Uf5I2Q8QnemVszJHgBHMszJyn5ZmZTB11307LDL8su+W
         eRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=yIj7EVT0RJrZKUxQOOGGkjEgTRRQIjh5jA3ORdFLh28=;
        b=B18qwhxWfwfHq4iqpNlBKKH0qjJlpz1L6XrpxLYp9kE64L/29zHDm9ADVMsswUJiqs
         EgcWzuSu8vbnnFFrbvk5zb0WE7ybxRAlTlUQgQTZ9F2yFeJVJ4+3jyikRmNlMa+5GoxH
         hmN78dkvHf9Fzd3s4Uc8Nly2e9MQoSKCJoGfkgd4hpY+II+H4OEk/FGyPuSIyQ2yrlPI
         +7iR3NZUN0tGg8LgHp0SlZMcxKFD8cArXpDmQphPJXDcN+SXrLibhFG602X5pLe3Gb/X
         WVrnbDL3bhQu8BdpN0Z0eBzT3giLoBC3AKRHeQ+fu9hkj5VXVRbBJEr0E4R1LdfHfLu9
         0GWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85dd2000000b003f6b19a8ec7si7458114qtx.140.2023.06.06.21.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6kyi-000260-Fp; Wed, 07 Jun 2023 00:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kye-00024j-48; Wed, 07 Jun 2023 00:40:56 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kyQ-0003tc-FM; Wed, 07 Jun 2023 00:40:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQt3Kldz4x4M;
 Wed,  7 Jun 2023 14:40:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQq6HRtz4x41;
 Wed,  7 Jun 2023 14:40:35 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 12/12] target/arm: Allow users to set the number of VFP
 registers
Date: Wed,  7 Jun 2023 06:39:43 +0200
Message-Id: <20230607043943.1837186-13-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 85DXQOQMha9z

Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
have 16 64-bit FPU registers and not 32 registers. Let users set the
number of VFP registers with a CPU property.

The primary use case of this property is for the Cortex A7 of the
Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.h        |  2 ++
 hw/arm/aspeed_ast2600.c |  2 ++
 target/arm/cpu.c        | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d469a2637b32..79f1a96ddf39 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -916,6 +916,8 @@ struct ArchCPU {
     bool has_pmu;
     /* CPU has VFP */
     bool has_vfp;
+    /* CPU has 32 VFP registers */
+    bool has_vfp_d32;
     /* CPU has Neon */
     bool has_neon;
     /* CPU has M-profile DSP extension */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1bf12461481c..a8b3a8065a11 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -316,6 +316,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5182ed0c9113..74fe6ae78192 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1275,6 +1275,9 @@ static Property arm_cpu_cfgend_property =
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
+static Property arm_cpu_has_vfp_d32_property =
+            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
+
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
@@ -1406,6 +1409,22 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
+        cpu->has_vfp_d32 = true;
+        if (!kvm_enabled()) {
+            /*
+             * The permitted values of the SIMDReg bits [3:0] on
+             * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
+             * make sure that has_vfp_d32 can not be set to false.
+             */
+            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
+                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
+                qdev_property_add_static(DEVICE(obj),
+                                         &arm_cpu_has_vfp_d32_property);
+            }
+        }
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
         if (!kvm_enabled()) {
@@ -1672,6 +1691,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu->has_vfp_d32 != cpu->has_neon) {
+        error_setg(errp, "ARM CPUs must have both VFP-D32 and Neon or neither");
+        return;
+    }
+
+   if (!cpu->has_vfp_d32) {
+        uint32_t u;
+
+        u = cpu->isar.mvfr0;
+        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
+        cpu->isar.mvfr0 = u;
+    }
+
     if (!cpu->has_vfp) {
         uint64_t t;
         uint32_t u;
-- 
2.40.1

