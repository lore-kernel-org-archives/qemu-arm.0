Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6846184ejb;
        Mon, 2 Jan 2023 09:53:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukw9HsFxvplGMdKvVWxNqPKpRXHl8Mvdqk2lbynDyRzXh+w9F7lB3cb/2VRnN4OjRHZrjL
X-Received: by 2002:ac8:74cc:0:b0:3a5:306f:b124 with SMTP id j12-20020ac874cc000000b003a5306fb124mr57266311qtr.10.1672682032743;
        Mon, 02 Jan 2023 09:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672682032; cv=none;
        d=google.com; s=arc-20160816;
        b=gDyCUhQHEObAn4sElCA2fb/9YDUb/7GKmoZsJMgRpWI5r04UM74Lo9UruOxheycHP/
         Vg93Bj/qbbA+NrASerjH1uNfho/0mMMWPBmrCr23TXiWwxYek0AxdN04ZonXbSAkKOLf
         MH6z989AP9rytR95At7YzI8r3t7gM+8Hvc1G/72Yvott1DdGGExyHqOf1+HXl5ue6PbF
         fkfvGg6PikXIItTkEz87ZQuNQdFn0Ri/X4mRWocm/tYqloldSUSUBKBjnMIsRqSYGLuA
         cCMENk2I3Qs1XFg3NhL+J0IbPwebIFnKGlkCK3YqjN/7HcblFi/nHN0PruMfC8Q/SrSL
         uUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=Gfkhfj04KQE26RJX4KrV4f/7WWmoW2rKlsO4pJG9W3A=;
        b=I5pxlVor3d0yF+dvfrz55+IU88viXDmOwsAIj6nZICHXK3EP03SNflZH/7KMnkEIQR
         csootCnG3m2K6gdWFbEvE68Po6t8UV1iOXUBq5e8jA2vYcj1y6yiYf3EjSYktwNVB5S7
         WqE0cj28wqHRW/eu8tVfGHoJpBL9s5hRcz+8KTQQwmcwAAxvegy8poKDXCWGIN3zLsOK
         mkMZbj8TwM5xCWrkwZAvxhUkt7b/5M5GFYJsDiozsTPQGL9H0Am2I179Eahlwy0eMMPB
         qrC4rL9eiKakfbhrXCx0a1tlq8m3mylKDV7+mAegx0Ssbx73PwhvCBe+bDOh9fYsOOop
         EH7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020ac84b6a000000b003a803633c22si14366394qts.369.2023.01.02.09.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 09:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCP00-0000fY-67; Mon, 02 Jan 2023 12:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vkp6=47=kaod.org=clg@ozlabs.org>)
 id 1pCOzq-0000f1-TI; Mon, 02 Jan 2023 12:53:16 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vkp6=47=kaod.org=clg@ozlabs.org>)
 id 1pCOzo-0005ra-IU; Mon, 02 Jan 2023 12:53:14 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nm3P34rBFz4xP3;
 Tue,  3 Jan 2023 04:52:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nm3P20rVHz4xGM;
 Tue,  3 Jan 2023 04:52:53 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] target/arm: Allow users to set the number of VFP registers
Date: Mon,  2 Jan 2023 18:52:45 +0100
Message-Id: <20230102175245.1895037-1-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=vkp6=47=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4NRFGhmpMRtS

Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
have 16 64-bit FPU registers and not 32 registers. Let users set the
number of VFP registers with a CPU property.

The primary use case of this property is for the Cortex A7 of the
Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.h        |  2 ++
 hw/arm/aspeed_ast2600.c |  2 ++
 target/arm/cpu.c        | 14 ++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..55e2e9a584 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -897,6 +897,8 @@ struct ArchCPU {
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
index 2fa022f62b..27af57ea9a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1258,6 +1258,9 @@ static Property arm_cpu_cfgend_property =
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
+static Property arm_cpu_has_vfp_d32_property =
+            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
+
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
@@ -1384,8 +1387,11 @@ void arm_cpu_post_init(Object *obj)
         ? cpu_isar_feature(aa64_fp_simd, cpu)
         : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
+        cpu->has_vfp_d32 = true;
         if (!kvm_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
+            qdev_property_add_static(DEVICE(obj),
+                                     &arm_cpu_has_vfp_d32_property);
         }
     }
 
@@ -1650,6 +1656,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!cpu->has_vfp_d32) {
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
2.38.1

