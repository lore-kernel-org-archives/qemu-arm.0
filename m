Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296827ejc;
        Thu, 19 Jan 2023 04:37:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAL3pFqiFyMdmsBjGv/+AKlCuaEtRoBSaQCCk3FyriBridtk7y3o4+su8xXvuLMPvuo1Ii
X-Received: by 2002:ac8:5184:0:b0:3b6:46ee:16f8 with SMTP id c4-20020ac85184000000b003b646ee16f8mr12222274qtn.49.1674131820706;
        Thu, 19 Jan 2023 04:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131820; cv=none;
        d=google.com; s=arc-20160816;
        b=m+fnP5fKF6DSM+WXJGHFdfj6hc2FqgeSO+4DblVKzfBbvnHUjaswi1/7SjOm9890jZ
         IR9YWWAhc76L+JWTcrshQXG7gD2cnzobRwzi28jPBy4TlgF1qR9XV+AFiqa7JqEDew4r
         SBZ52wRXzfQ+FQLzMxeIOnxqy4DmnnpcH09TRXAnZbFoEZkPcK/sKXPTrurqtK+z0tSX
         FZIBT84YJcz4Xf0vjrPqY1nMsuwQlsHfUhTtxz/oH+Bf2AcxDvIL++HKYdOQ78uRxTRY
         bbClHcFZg5kL2DIzlhZOksMC6chQAFz9qhBcfEXqPl+H0Lja9snXUgk5iVpPnHCwzTrS
         E+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ofUiYkgJPZOn10Twal2rfjAMQUQDu9jH6kwmL7c7NwA=;
        b=VnCosVZncYoIetqrGxoMcWN5+2qRtknXKEgDYurFqt+dhEl4t4nBCbQ6FHzx3l99TR
         Z83nVEMkFcyytbL2WvAqRQbP2BaYbSKjT4bRNvkNeofpbLMEEB1gdZg74MEv19DPiCvQ
         y5Dxe5qXkn+HcfmwzRbfGwIBZg/B4Cs3lO9Erzj9b7pNnbjX4XKp2e1xc7PttsScA4wR
         xDqc/m6srUZoTCVrChafZqTwBXjnmn1uDi97Llt5mDUYcPHcmJhz/svyItxOvjWS5vF5
         a3syo1WcDLKJEuh6+r33KJa9rqegtD4StLQDjG9546iawsdM18+KWGSJA516/5uGAzbC
         9gzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a124600b003ad45c0fd1bsi20307576qtx.461.2023.01.19.04.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU90-00075e-3Y; Thu, 19 Jan 2023 07:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8y-0006zD-7V; Thu, 19 Jan 2023 07:35:48 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8w-0007dk-8F; Thu, 19 Jan 2023 07:35:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYF1kH8z4xyV;
 Thu, 19 Jan 2023 23:35:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYC3FM7z4xZj;
 Thu, 19 Jan 2023 23:35:43 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 15/25] target/arm: Allow users to set the number of VFP
 registers
Date: Thu, 19 Jan 2023 13:34:39 +0100
Message-Id: <20230119123449.531826-16-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: QL5ZMB8uESNj

Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
have 16 64-bit FPU registers and not 32 registers. Let users set the
number of VFP registers with a CPU property.

The primary use case of this property is for the Cortex A7 of the
Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.h        |  2 ++
 hw/arm/aspeed_ast2600.c |  2 ++
 target/arm/cpu.c        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..5f2fefef4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -901,6 +901,8 @@ struct ArchCPU {
     bool has_pmu;
     /* CPU has VFP */
     bool has_vfp;
+    /* CPU has 32 VFP registers */
+    bool has_vfp_d32;
     /* CPU has Neon */
     bool has_neon;
     /* CPU has M-profile DSP extension */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..37f43b4165 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -309,6 +309,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..ad90de75fb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1269,6 +1269,9 @@ static Property arm_cpu_cfgend_property =
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
+static Property arm_cpu_has_vfp_d32_property =
+            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
+
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
@@ -1400,6 +1403,14 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
+        cpu->has_vfp_d32 = true;
+        if (!kvm_enabled()) {
+            qdev_property_add_static(DEVICE(obj),
+                                     &arm_cpu_has_vfp_d32_property);
+        }
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
         if (!kvm_enabled()) {
@@ -1661,6 +1672,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!cpu->has_vfp_d32 &&
+        arm_feature(env, ARM_FEATURE_V8) &&
+        !arm_feature(env, ARM_FEATURE_M)) {
+        error_setg(errp, "ARMv8A CPUs must have VFP32");
+        return;
+    }
+
+    if (cpu->has_vfp_d32 != cpu->has_neon) {
+        error_setg(errp, "ARM CPUs must have both VFP32 and Neon or neither");
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
2.39.0

