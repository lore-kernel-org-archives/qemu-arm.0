Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp258725ejb;
        Thu, 1 Feb 2024 06:14:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6JiQ/iTdmOKT7SvnwAXKL2wEuntIt6ykGk4HXlEuPH4K4pLXvmlz/LkzT/6LpCxJr6mdL
X-Received: by 2002:a05:620a:a13:b0:785:440e:af52 with SMTP id i19-20020a05620a0a1300b00785440eaf52mr2259713qka.35.1706796856391;
        Thu, 01 Feb 2024 06:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796856; cv=none;
        d=google.com; s=arc-20160816;
        b=kdRU7TVxqcFWybtbFCN1arMzh3keF4xeQ2gLQPU3E28YqngoplzLl4+97bYQqcdcEu
         rU3lMBOUKgfwTiLad3XtuBeebELKBLzs98jM8SC054i5wRaMXK2be49UAvw1P7zplup3
         yY6HvIJkCftVHbfAmWCeAgMVwl9NNlRIQHBXTNx7r67vPTPABl6Q2bf+1q0AoJGpbepz
         DLzIO4V4ydGIRqJmqr28HtUgzSE3CyEOPu7IFifCeyzvoFAYJinJHsA03IbDGQde5NpX
         zk4vbLhzOvUb7RrDyh1ofZapuw+MyB4+2Xby7vjJIdTQuNAS+tyfN06Waqdn1BUSltFB
         TFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=bd8XyG+OFDecPO1GD/AJ7IsTnxWyWtqfhTTnnGyxqLo=;
        fh=EaFpkAn1P5Cxf7rMPXzbgSNWj6lWXw0vZhvza+03QVI=;
        b=TGR2l2x4FOQMzkeL1om3GGuKsGoG4hdaA7m0HuTGLOoHgR7Idj/1k/QK8bZHqYXFf+
         YjRK0qhMkeUIrVzoBs8Td3IF0xrALyXJwYehOnVjQCspll6SKOdY95J5dU1sRDv/CWQO
         /boB+iJqcw6gF3J6S2ydQ1eDITgheN7JZyUFsU/XJtsQJbIp+ASE5oo2KxNzE4AVfSQN
         PqVsfFKebc9zkizyNP+DzemBCPWY+lysaO9xNo/b8MtJkSRfCozym/vg3NAb591+ckW9
         WKm49wY43BvLlLQid31uxsQ3SmTBsDCXUfXuXBYVyTeuvxZmx8vFL9glkHw9Ie1nFaJq
         E31A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCVrruvlZLa7X65cJuqUvmUuWTJfc3tDUKD2q/PJcD3Lhz5HeEMaU9ELF0AhWtS9bS9qaBRkoXzMlf5iQlDst/4qzpxLdtS4
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26-20020a05620a02fa00b00783f957a2afsi9314554qko.537.2024.02.01.06.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXpA-0001H3-7w; Thu, 01 Feb 2024 09:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXod-0000x6-Vu; Thu, 01 Feb 2024 09:13:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXoZ-0007mj-Jr; Thu, 01 Feb 2024 09:13:18 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqF1ShYz4wcP;
 Fri,  2 Feb 2024 01:13:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgqC19jQz4wcM;
 Fri,  2 Feb 2024 01:13:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 05/17] hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
Date: Thu,  1 Feb 2024 15:12:41 +0100
Message-ID: <20240201141253.806055-6-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: Kt7LCEjR1ahr

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In order to alter AspeedSoCClass::cpu_type in the next
commit, introduce the aspeed_soc_cpu_type() helper to
retrieve the per-SoC CPU type from AspeedSoCClass.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast10x0.c     | 2 +-
 hw/arm/aspeed_ast2400.c     | 3 ++-
 hw/arm/aspeed_ast2600.c     | 3 ++-
 hw/arm/aspeed_soc_common.c  | 5 +++++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cb832bc1ee14..a060a5991874 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -143,6 +143,7 @@ struct AspeedSoCClass {
     qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
 };
 
+const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 
 enum {
     ASPEED_DEV_SPI_BOOT,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 8becb146a8df..dca601a3f9b6 100644
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
index ad76035528fd..3baf95916d46 100644
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
index 386a88d4e0f9..b264433cf095 100644
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
index 828f61093bfa..36ca189ce960 100644
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
2.43.0

