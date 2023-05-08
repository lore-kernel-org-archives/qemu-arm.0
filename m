Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1886444ejq;
        Mon, 8 May 2023 01:03:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KTgkuSncjDsTa/NI2Zbg0/kjKHL3HZmChWXP4epMbs6NB5Lo+QazVSGlrFTZu7DMiOR/W
X-Received: by 2002:a05:622a:1995:b0:3e6:941b:47e0 with SMTP id u21-20020a05622a199500b003e6941b47e0mr13936889qtc.11.1683533032321;
        Mon, 08 May 2023 01:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683533032; cv=none;
        d=google.com; s=arc-20160816;
        b=S1B0JA1eCmWurQZh/xJPveeKEGJNT/BNa5fUG4VQb5rgQwEdiXYhqKBT/GQTIy3hVO
         Hq+nEVg32DU6MTdYqFEGa/tXDVGpPjatKEilm7vbTQ0TS0Q7Cdk5SuUeDUyqe32pmAER
         eTqUa+zEDglElge1yYXoeGqHH9+kR2wR2UKeQFAduFsDsDn6gXk30R7sfWov+yXeEO/C
         h7Jr3KicOU1/aLNkXqWyVCht5z3rBf9n3dssG/gu1iB7lIFjmHM2fJYHtytmAqu8Bevf
         dZrx5zmR2gbLGTFG7i1IT9MA78hnNKUZsG5pTiwd0A0jK3tDwOIA40aowaItWedzLnIm
         w5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XZxfCcP9xnuo01+rGXqqonSkTuBvpJAxiBzbtIdCuRg=;
        b=f+Dvent/iD1A30jY8WjjVjBMqJG20fUIosS4di7bOMEUE5kGC0AqSJi4jtac3uCU/F
         r2I5nM/iw+wEx85iyq1X+fbkRDg61njsN78duyGnUsR8Z9nmzY2Idu2Epb/r6u/xLUOk
         mEgfkBV6cQKC8yfsQCi46KkU/zjB3AjfwiY2YaJ32lSlXiWJ0bsV/uVZtwWaD1lhbTHp
         XQP8wg874d9OKhfdGShp/Tsb4/7+eKWR444qGZhTl5M/4nikIDRBBgLryEepqUZfoMB5
         YR56a6q1Q3jKM0iJjcNx8hRrWVa8bPYQN5mMTPZR9rezQazsUO6P3Djs6CBG/tjZLBVq
         d8fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a05622a110400b003f0abf74b20si2739171qty.443.2023.05.08.01.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvvmo-0008M9-0u; Mon, 08 May 2023 03:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmg-00087y-H4; Mon, 08 May 2023 03:59:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvme-0001IP-31; Mon, 08 May 2023 03:59:50 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDGS6CCLz4x4D;
 Mon,  8 May 2023 17:59:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDGQ4V0Hz4whj;
 Mon,  8 May 2023 17:59:42 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 12/12] target/arm: Allow users to set the number of VFP
 registers
Date: Mon,  8 May 2023 09:58:59 +0200
Message-Id: <20230508075859.3326566-13-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ghjt33xcvGaJ

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
index d469a2637b..79f1a96ddf 100644
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
index 1bf1246148..a8b3a8065a 100644
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
index 5182ed0c91..74fe6ae781 100644
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
2.40.0

