Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D192CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 17:18:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSeMh-0006be-Dc; Thu, 28 May 2026 13:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMM-0006TT-S4
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeML-00046s-1U
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ed9336049so2654736f8f.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779988647; x=1780593447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naAjGDZPbJ67GvzkWP49qsFsJVwJRVlvC8LloXp3eNQ=;
 b=XM+NVbO0YEw3uuFDOEmQBzZaS67KdEl05/0oRqkz3m+Qyg12YZP3O2mSzV8sDCwXhV
 dnCEU8lrQUnxM6L5YVClLlp18pN8LpSvCK6BIFQc17hPGN1kZvvx9qms7H8xgx7L1RAq
 0HXk3hPM5wErxPONiDokucCE0gwXqWs8yA0Kp0P8VEI/iZ21AuM+JQxae6OMiaeqTEcZ
 D9v6B5BgsGe9xqhXiIqLgH4ugBWNg1F3zfOCxUFzPhcginGo1ERNhHulyqJ6sBkRdzY7
 GSkGq1XWFCvKFhoBxdVTj43QiBuMRwx4E1uF1/4gs6eUGCloVj6lqB86GVaHuysTmjvy
 o6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779988647; x=1780593447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=naAjGDZPbJ67GvzkWP49qsFsJVwJRVlvC8LloXp3eNQ=;
 b=bD2c6afdiLnMBcAxYV2vJ3yRv6v2E0hPZPJ2/DsquNm2FcqLN+BB1iyRaB1rhgtAPC
 1MjpLdHubHzSwH4XziZvtuKx5ONnok3l5RIFkLs32M0tEa+/Bu2+jYaZJjGASVlzlQuo
 KkhZD9vkjSL1cLYBwqa4+OS/VdHLoM1Z/+Z4cZm/n0oJYPYvSBLLysjBFJ89CLr8Cgyi
 BWj4iRYUZll0h93z+ILb3uwXpXQn8khYrXIMr5TVv7kEB2Naxmiucl8ksR9C9OBZNWZ7
 +3DOBojQ1s0vyexxpk5mVYtWAiTtQCTa+X5Y3l0G6svfFbzcKc8V7SOYtxU8dOUeZXCr
 zpmA==
X-Gm-Message-State: AOJu0YxJZq90ne/IEAd13afgaukdVaEiQuDBewr4LlB1/cbqrXDEErXY
 HhG16NrKq4iZXuW+pJlLqB5kvWgMWNdkOND+dGJ+fdxAznH4Jjxv2KAd
X-Gm-Gg: Acq92OEUrbRSXYDv49BY0PG16BlTbJh8Yk4kXPZ/EUIgNx5QpMAvMtyf+bt4Vmp8BIf
 Aky6SAzB5aaUcG6k+aDmbP+yycHFnYbuUSSToIMw6YKxw7zcVT1GZDmoKZHdxVtX3FaC1+oCOZD
 a6r2yno+HEndaa1q7xCphG8Ll0F/JTwC/4Mbw4pJadWL4Q3+c8a1Zw81FPQC1G7eg9ME03nH+SB
 Q8btS+UlRrBV1ncLWpl0o3bx8vKcmGekfI4jtcaBZIRtJnmR247oH9Qor49ESir8XP6AaoO11Qz
 0PtIacQSJGw3xEJrz8eT7xhTnxq7J/cmeX73kN1S/vfYkcdvFfKcBTXDxrb8BrhWF4kysnOZMVv
 61oNFPZiqpZDhNJcYQB64zBUCxjBoTgJ065VoBjobqB4g9vv8bG6XeB5kdxF5VuoaNIGrrJa94k
 Mi7rnfy5WpGgaehayVHk5rmkGtc8Ip1BgbYi6uxhjvkfgYa1Tsf/gi2DieClp997dkqn6USl+NO
 NA=
X-Received: by 2002:a05:600c:1c0b:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-490426aa7acmr513786875e9.14.1779988647059; 
 Thu, 28 May 2026 10:17:27 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092968066sm53774085e9.15.2026.05.28.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:17:26 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v4 2/7] hw/arm/sabrelite: Introduce class SabreliteMachineState
Date: Thu, 28 May 2026 19:17:12 +0200
Message-ID: <838e241ffe451b508403a716ff200cb7ae3af564.1779986496.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779986496.git.matyas.bobek@gmail.com>
References: <cover.1779986496.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Create full class SabreliteMachineState extending MachineState.

Previously, Sabrelite board MachineState was declared indirectly by the
DEFINE_MACHINE_ARM macro. FslIMX6State was only instantiated in the
sabrelite_init function. For FlexCAN device, machine properties
will be used to select QEMU CAN buses. A custom class is therefore
required, so the CanBusState "connections" can then be added as fields.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>
---
 hw/arm/sabrelite.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 04484aaa14..7e036e6388 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -20,6 +20,15 @@
 #include "qemu/error-report.h"
 #include "system/qtest.h"
 
+struct SabreliteMachineState {
+    MachineState parent_obj;
+
+    FslIMX6State soc;
+};
+
+#define TYPE_SABRELITE_MACHINE MACHINE_TYPE_NAME("sabrelite")
+OBJECT_DECLARE_SIMPLE_TYPE(SabreliteMachineState, SABRELITE_MACHINE)
+
 static struct arm_boot_info sabrelite_binfo = {
     /* DDR memory start */
     .loader_start = FSL_IMX6_MMDC_ADDR,
@@ -41,7 +50,7 @@ static void sabrelite_reset_secondary(ARMCPU *cpu,
 
 static void sabrelite_init(MachineState *machine)
 {
-    FslIMX6State *s;
+    SabreliteMachineState *s = SABRELITE_MACHINE(machine);
 
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > FSL_IMX6_MMDC_SIZE) {
@@ -50,13 +59,12 @@ static void sabrelite_init(MachineState *machine)
         exit(1);
     }
 
-    s = FSL_IMX6(object_new(TYPE_FSL_IMX6));
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IMX6);
 
     /* Ethernet PHY address is 6 */
-    object_property_set_int(OBJECT(s), "fec-phy-num", 6, &error_fatal);
+    object_property_set_int(OBJECT(&s->soc), "fec-phy-num", 6, &error_fatal);
 
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
                                 machine->ram);
@@ -70,7 +78,7 @@ static void sabrelite_init(MachineState *machine)
         /* Add the sst25vf016b NOR FLASH memory to first SPI */
         Object *spi_dev;
 
-        spi_dev = object_resolve_path_component(OBJECT(s), "spi1");
+        spi_dev = object_resolve_path_component(OBJECT(&s->soc), "spi1");
         if (spi_dev) {
             SSIBus *spi_bus;
 
@@ -89,7 +97,7 @@ static void sabrelite_init(MachineState *machine)
                 qdev_realize_and_unref(flash_dev, BUS(spi_bus), &error_fatal);
 
                 cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
-                qdev_connect_gpio_out(DEVICE(&s->gpio[2]), 19, cs_line);
+                qdev_connect_gpio_out(DEVICE(&s->soc.gpio[2]), 19, cs_line);
             }
         }
     }
@@ -100,7 +108,7 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
+        arm_load_kernel(&s->soc.cpu[0], machine, &sabrelite_binfo);
     }
 }
 
@@ -117,10 +125,10 @@ static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo sabrelite_machine_init_typeinfo = {
-    .name          = MACHINE_TYPE_NAME("sabrelite"),
+    .name          = TYPE_SABRELITE_MACHINE,
     .parent        = TYPE_MACHINE,
     .class_init    = sabrelite_machine_class_init,
-    .instance_size = sizeof(MachineState),
+    .instance_size = sizeof(SabreliteMachineState),
     .abstract      = false,
     .interfaces    = arm_machine_interfaces,
 };
-- 
2.54.0


