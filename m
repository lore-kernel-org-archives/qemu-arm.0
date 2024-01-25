Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp30024ejc;
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdxZG6K7MXkS7aJpGYGkQSEa0q3Vu79dpgEltaIxLPHW6r8eGYYuvI8WPH5UPKHef6NoPw
X-Received: by 2002:a05:620a:4488:b0:783:1b18:e911 with SMTP id x8-20020a05620a448800b007831b18e911mr779418qkp.91.1706162182409;
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706162182; cv=none;
        d=google.com; s=arc-20160816;
        b=PjGfiBJHODOV8owwpTnZ74wfGpXJIXUZaF3HRLGNVrKTqVtqK2JTEvTaEAV/ih2ar5
         zbxIuYcs3w3J10MdmYw2ST346tv8iuDFXuIJQTVMcCx3RyG5a2E/nKbBbvRru1S0awv0
         dUWrT+djTaT0BdFkZ1TQRReryY6z/fTX5JBY3iCZdBq+yJ94X7LRVtq4AOyx4/s0dO0Y
         ngjxMJsMb/hRERKKXbbILBJji5PiAlQwBl7FXC0K2yzi7k5d2uARctULU/BL8WoF5zrM
         erixUygrvYdjzEH+bT2p55qvN3mYeZ/DsSTRMSNKqfIMln0vao0/0pyyNZUunBn8J3Cd
         Jh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=34UBB3mcO7ZaMebRDdhjL43nDYc+kT1XdddwXkamjjk=;
        fh=mgkM7j5chzFeBdbp6jSghBOXKGtgf9vcQQUOsrmpdjA=;
        b=RapsOetJYfZwedXn5OJk04HbKspsB5qV52CdXMGT0TbJztSj9hJTktjDurNVBUz48s
         fZZI9Dtx0CE5ZQTYo/ISPP2/bToRHqeINzagQ6NNZjhVnpP9g60Fvg/Q7rEoAhnS4wv9
         1RLBcdofzNKFVnjlUZ75LOAMlbaaARwE+uBYfn4Hw7QWd87OJpRXf38S9JcFTvAfT+Ja
         8nr1EVlfk1SdEzO1TsOsglWHSo+s3puQ2h9GtCyxrcoOrTDONcWUoamMxafY29lZLnqq
         5zlD4mEvMwNxxQ0/Vrx1P4ihQy+w0c4Rak88r+PF5gu13yPxHgOBoVOBJidt3/Xj9hjB
         yjOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJOD2qsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20-20020a05620a14b400b007838ef44330si11362228qkj.522.2024.01.24.21.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJOD2qsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSsik-0003LQ-MG; Thu, 25 Jan 2024 00:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsij-0003Kv-Bn
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsih-0001HX-Oz
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso80881085e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 21:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706162170; x=1706766970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34UBB3mcO7ZaMebRDdhjL43nDYc+kT1XdddwXkamjjk=;
 b=AJOD2qsjuOMgUJiH6dXazUzrsg/oRCT1tB4R/7yEF/0RaNOzUfVjq3HOGmPNG+/WiL
 UdFpYJtGpUKw8fhlt43gfmC+IFFQdXQ0Jsat+XLZPizuWrWS/WEjUSVRBepwuG+10c7V
 ETE89q5RY163sfNKEzuuc9nm/cq9+v1hqBbPL4UdCXWOlApGzunKvB+Xkx2Sl5JXDgNH
 yPwRSItNdmczWqP7zP4IVwo5USpkOfONsVvKFbsW8jDu+bahKOXf665RqwaNc00ViKlL
 jfd5fRSefZWYIRHr0Z9Qrc3B0g+zTFJiBXH8O6d5P+Oo2IBU7vWaduJbncVhItKcstw7
 PDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706162170; x=1706766970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34UBB3mcO7ZaMebRDdhjL43nDYc+kT1XdddwXkamjjk=;
 b=AeX67IpsihCLWzZ/8AKI9zvIZii9NCuFZ7iLq+TWd/fqk1kvYNWKIrvsxW+dvnnl7+
 c+I08c/mgIAy3NKFxJhEZiBsLyUhDAYFyaGZ6QOpfloYVnJEIxYMSyvp1NyLZoruTzeU
 y3osikMasJyhqySKXoKCpBce8VKGgpBLT7GjonnlhtPWxqHPy1RWF8QsBMX9GOWTxqhX
 VrPEXO1EsTMB9uSyQtgHUb7fmR4aBw8EmVD+JM72SBmkpIk3xJOYu0xzgtbr/L+WPBTB
 w9qeK1/Ou5eIOVc7VEwOE2+uuT4Q5s7qndusPGVtac84UlZio1tmiqx8Mr1yy4CqQflG
 iniA==
X-Gm-Message-State: AOJu0Yz6XOZiu5opYRt2CW6N7kS75nocs+TRxzF6MA5ECWaVjkL6u0Vj
 7joUm7nxs7Evv/1mQuhedQiP1YBthYBkX8obStft3oh0LBor+zy6r+W8wjYmeujVsr6xmjPJmkz
 4
X-Received: by 2002:a05:600c:3c8c:b0:40e:c4f8:bdf with SMTP id
 bg12-20020a05600c3c8c00b0040ec4f80bdfmr180379wmb.31.1706162170518; 
 Wed, 24 Jan 2024 21:56:10 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b0040e621feca9sm1241668wmq.17.2024.01.24.21.56.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Jan 2024 21:56:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 4/5] hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
Date: Thu, 25 Jan 2024 06:55:43 +0100
Message-ID: <20240125055544.79405-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125055544.79405-1-philmd@linaro.org>
References: <20240125055544.79405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 0o0dUk4pMTw7

In order to alter AspeedSoCClass::cpu_type in the next
commit, introduce the aspeed_soc_cpu_type() helper to
retrieve the per-SoC CPU type from AspeedSoCClass.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast10x0.c     | 2 +-
 hw/arm/aspeed_ast2400.c     | 3 ++-
 hw/arm/aspeed_ast2600.c     | 3 ++-
 hw/arm/aspeed_soc_common.c  | 5 +++++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cb832bc1ee..a060a59918 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -143,6 +143,7 @@ struct AspeedSoCClass {
     qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
 };
 
+const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 
 enum {
     ASPEED_DEV_SPI_BOOT,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 8becb146a8..dca601a3f9 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -211,7 +211,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     /* AST1030 CPU Core */
     armv7m = DEVICE(&a->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 256);
-    qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
+    qdev_prop_set_string(armv7m, "cpu-type", aspeed_soc_cpu_type(sc));
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     object_property_set_link(OBJECT(&a->armv7m), "memory",
                              OBJECT(s->memory), &error_abort);
diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index ad76035528..3baf95916d 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -156,7 +156,8 @@ static void aspeed_ast2400_soc_init(Object *obj)
     }
 
     for (i = 0; i < sc->num_cpus; i++) {
-        object_initialize_child(obj, "cpu[*]", &a->cpu[i], sc->cpu_type);
+        object_initialize_child(obj, "cpu[*]", &a->cpu[i],
+                                aspeed_soc_cpu_type(sc));
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 386a88d4e0..b264433cf0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -158,7 +158,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     }
 
     for (i = 0; i < sc->num_cpus; i++) {
-        object_initialize_child(obj, "cpu[*]", &a->cpu[i], sc->cpu_type);
+        object_initialize_child(obj, "cpu[*]", &a->cpu[i],
+                                aspeed_soc_cpu_type(sc));
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
index 828f61093b..36ca189ce9 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -18,6 +18,11 @@
 #include "hw/char/serial.h"
 
 
+const char *aspeed_soc_cpu_type(AspeedSoCClass *sc)
+{
+    return sc->cpu_type;
+}
+
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
 {
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
-- 
2.41.0

