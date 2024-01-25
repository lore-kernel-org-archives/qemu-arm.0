Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp30385ejc;
        Wed, 24 Jan 2024 21:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENPE19zel5p6BKNLcuzMoHlzbVyiWJoIMZSFTlDBk5X41OaJRu6DWNdIR2giKXG6LCSxLb
X-Received: by 2002:a05:622a:188e:b0:42a:4263:4518 with SMTP id v14-20020a05622a188e00b0042a42634518mr426612qtc.8.1706162260994;
        Wed, 24 Jan 2024 21:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706162260; cv=none;
        d=google.com; s=arc-20160816;
        b=UrQmVvPKCmE6Fm9870JvxzKiziNbs5jSqrgbR1aczFvfniMVmXkWPYdADMC8h73Hfw
         tyFZnb29ZHXSOtqN2xN1enMP/6DlyDumoEqJ7qdBtg8l6/u9gUvtSh4Tk2kU4sK9Uv0k
         2L8h2lBR8dtNY18Z+r7kQjgWRsx3X3vmZZPaQNhyoJOVZv3yDUXX9XNjKXgx5eUGKPpi
         ItgxBTZ6mcu7Y8p7WRAbmUByQDrQyXxHGp+WUAhpOw9/pe/G+z/5f65o+8054jAq6i5B
         58rB133Wy2xwM1d7sqY/lT+ijr232/1Hk9/pzYWBluJxT9YkBKvWpn7DVzxND9+6KYY0
         eMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rKDbGwEXvltki2wl7qUZU0z++HxczA7j4HHaOXKhPHg=;
        fh=mgkM7j5chzFeBdbp6jSghBOXKGtgf9vcQQUOsrmpdjA=;
        b=R3QujhTP5PrKb+6WOxqqkE59Vyo9jRnQ7/PX5YbivTpBsOpg7FcrvrI2T/hyk+JXQc
         /iGiFMO9tBANCUGNHKXPIE6viKX7tqWHQV7AL1PfkUCvkDqfYUuO3lJE3+u31iwFi9QT
         oO+/BJkKyUmPWcQG6JDsvLS93RSYtC6RJwZZduK1GSdAPM6NK+wBmogedATwmOHj/xIn
         eLFjHf+QW31uYl/I9T0C4h22x4QZ28wUG2kMcMDA/Cj+etO406iRkwa0vI5Yg3pFL44t
         fxmAvTD9BSOyYFH0yDEdmDtzc4S8hxfN04q8XLWIwTLpQIq/AEd94RUUWDClZ7CFCyfS
         CUMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zGc/uNZZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05622a170200b0042a64ed10bcsi1906780qtk.36.2024.01.24.21.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 21:57:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zGc/uNZZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSsir-0003On-Rx; Thu, 25 Jan 2024 00:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsip-0003Nr-JY
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsin-0001IF-Ob
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e8fec0968so80970135e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 21:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706162176; x=1706766976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKDbGwEXvltki2wl7qUZU0z++HxczA7j4HHaOXKhPHg=;
 b=zGc/uNZZuYA2Bv/bIf5InCq0tv4CBJGTogFrFQOZKdf+0eZZlgFN6MeXNNkhMaHlu0
 WCFCEAuHH+GzmV0uCv/Vp2pSiIZFwrz2UpLLx1GQ/xB5Z1zVsM6iQgKmw+1wnCyeUxdX
 KyZAm15KAVuF6iSC8g5W8T4eS2eFlgWR8hsWfVjXm3VDvH2Azi3o6BNy/KcrxmZmraHA
 rddus7ELPQxQlS6lg8PHXUxkWYDvBZFNrI+pWjMSMLnlfi1D6jh/pUOI+1p7iAMWpH/E
 /7oD4R53a1tNPFoeXsNUI/zgu9Zci5KZXW/QZ+JduGbocbTxyXw+yFCujaG8YvXV3x8P
 lXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706162176; x=1706766976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKDbGwEXvltki2wl7qUZU0z++HxczA7j4HHaOXKhPHg=;
 b=kqQZHcWfBYfpCsllR1ri35RqrGbVSB1IhFO468uilggWYcCLz6kVOafnoAKXI741hI
 z0nYTQ4lFnG4AHo7Zi+Q0d9UnUXmth+a96CWLFvg5u6Z2kh3aTWo3KYgtdvBazEHQVp/
 zRCiAf5NdKczqSXCm8VUP0aak0Dl+J8o5vvmgwOBsH/t10L/j2G+fjwBCKjSPGLWL56e
 rcMlJVGPu0aq10vR7vYIvWIFupf3/A+0lDegZWei8oJSkiG2ajQ/6NjwmpKhZPMifZqW
 AvrqbfgNVyJFzarYd1YDcK/quX5uyx6Ur85xc0lT7i2fEK6eO6luvIu6VGFQ7lpDNmTq
 QovA==
X-Gm-Message-State: AOJu0YwjA0cBa11ThqskAOZ7m8bMETOp+RBtgYIdH1DMSmr5RPc7LqWy
 LBBqPT+p5LVdu/FuqYPY7Kl0SnQhxYToT18tKRaKQObbfjvrSKIBCQUcC34XjHA=
X-Received: by 2002:a05:600c:3581:b0:40e:6a5c:826a with SMTP id
 p1-20020a05600c358100b0040e6a5c826amr182613wmq.25.1706162176449; 
 Wed, 24 Jan 2024 21:56:16 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 fk15-20020a05600c0ccf00b0040e9f7dadc6sm1247688wmb.25.2024.01.24.21.56.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Jan 2024 21:56:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 5/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Date: Thu, 25 Jan 2024 06:55:44 +0100
Message-ID: <20240125055544.79405-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125055544.79405-1-philmd@linaro.org>
References: <20240125055544.79405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FFDp1DHKiWyE

Aspeed SoCs use a single CPU type (set as AspeedSoCClass::cpu_type).
Convert it to a NULL-terminated array (of a single non-NULL element).

Set MachineClass::valid_cpu_types[] to use the common machine code
to provide hints when the requested CPU is invalid (see commit
e702cbc19e ("machine: Improve is_cpu_type_supported()").

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h |  3 ++-
 hw/arm/aspeed.c             |  1 +
 hw/arm/aspeed_ast10x0.c     |  6 +++++-
 hw/arm/aspeed_ast2400.c     | 12 ++++++++++--
 hw/arm/aspeed_ast2600.c     |  6 +++++-
 hw/arm/aspeed_soc_common.c  |  5 ++++-
 6 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index a060a59918..0db5a41e71 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -128,7 +128,8 @@ struct AspeedSoCClass {
     DeviceClass parent_class;
 
     const char *name;
-    const char *cpu_type;
+    /** valid_cpu_types: NULL terminated array of a single CPU type. */
+    const char * const *valid_cpu_types;
     uint32_t silicon_rev;
     uint64_t sram_size;
     uint64_t secsram_size;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d2d490a6d1..fc8355cdce 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1149,6 +1149,7 @@ static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
     mc->default_cpus = sc->num_cpus;
     mc->min_cpus = sc->num_cpus;
     mc->max_cpus = sc->num_cpus;
+    mc->valid_cpu_types = sc->valid_cpu_types;
 }
 
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index dca601a3f9..c3b5116a6a 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -417,13 +417,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"), /* TODO cortex-m4f */
+        NULL
+    };
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(dc);
 
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
+    sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 0xc0000;
     sc->secsram_size = 0x40000; /* 256 * KiB */
diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index 3baf95916d..8829561bb6 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -503,6 +503,10 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
 
 static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("arm926"),
+        NULL
+    };
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
@@ -511,7 +515,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 
     sc->name         = "ast2400-a1";
-    sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
+    sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2400_A1_SILICON_REV;
     sc->sram_size    = 0x8000;
     sc->spis_num     = 1;
@@ -527,6 +531,10 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
 
 static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("arm1176"),
+        NULL
+    };
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
@@ -535,7 +543,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 
     sc->name         = "ast2500-a1";
-    sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
+    sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2500_A1_SILICON_REV;
     sc->sram_size    = 0x9000;
     sc->spis_num     = 2;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b264433cf0..46baba0e41 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -629,13 +629,17 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        NULL
+    };
     DeviceClass *dc = DEVICE_CLASS(oc);
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
 
     dc->realize      = aspeed_soc_ast2600_realize;
 
     sc->name         = "ast2600-a3";
-    sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
+    sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2600_A3_SILICON_REV;
     sc->sram_size    = 0x16400;
     sc->spis_num     = 2;
diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
index 36ca189ce9..123a0c432c 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -20,7 +20,10 @@
 
 const char *aspeed_soc_cpu_type(AspeedSoCClass *sc)
 {
-    return sc->cpu_type;
+    assert(sc->valid_cpu_types);
+    assert(sc->valid_cpu_types[0]);
+    assert(!sc->valid_cpu_types[1]);
+    return sc->valid_cpu_types[0];
 }
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
-- 
2.41.0

