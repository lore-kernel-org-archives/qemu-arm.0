Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DCA1091910
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 19:54:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3JRM-0008Uj-SS; Thu, 19 Mar 2026 15:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Ion-0004Uw-LY
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Ioi-0000mC-2K
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so1653888f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773947638; x=1774552438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZQIAqd1C3za4aw1XWQN0FNbaHnNMI3gmGgywrKY80E=;
 b=gYOQNZZnup090ELmGiuVYn5GDnOmqyvPuZNSgu1zT8QF9PjCrvoygpr/HW9ARezDDR
 t4MYaBqPS0uHMJqqHiJftDiWTFvzohgrTD7po37oQcrCu5F+H1y2qmSz9c/ud3vFvjxy
 Q7lcLx2DMVSplOcdOMbxxkQvTLaNpyhxzVqRiNTgOeNt/OnxJtxrkP9e6Qb1nwgZ3B3l
 CERXIJK7hk4qfvqErriIsz5CtQmbJU30uhbRneRCbqIY6seZA97S02sgmNcm0v2cXE0r
 xCkGyNSC2Uo0ZAIQQ1I5vH4XQOEYiSqVWfFiHs0av9wd/8u80cjauF7dm3HgygW+csmV
 iW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773947638; x=1774552438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZQIAqd1C3za4aw1XWQN0FNbaHnNMI3gmGgywrKY80E=;
 b=FfTdH3ZP3Rp1qOuUr8beKGxdYfhyS1PlMmRhtjhALmJ7uyKQB6yAE8AyODP9dGBYWi
 5QgvUBwM5x+lDNRP520ujimgf+xBpvibrwetOvbkMxfPD86cVCgbLRAKrwzyrjT0Lpqw
 y7mRYzFYp4WDFTgG2VrD/Bvbm9VGwBeupaynkDbTy+C7ah772fr2pibkI5wZN0u+rjw3
 WxI8HKNapfOP2LsvkB6eJzPsgWdlLLzDpEWPfo7bOQw4/ISLVIrTC0vFAiqRC4GCet97
 he35gEXNBUZvROh32PtPt8R1piUAFTboinM+2jhc9XuxVUWXCzN/0WbQySLlbBrjS1tb
 HENg==
X-Gm-Message-State: AOJu0Yx7qjfd4DygHqo5mzhLoLG4jQGUYA4xeF0hITCQ5NdMownnzsGk
 t9ZafZhwwUQVj6DpG3vhUdRmbEMBt6+nhG+uctdY0668+btm089inqgh
X-Gm-Gg: ATEYQzyrdO4VFn4k0Eb04rbO6EdYY/piNTuYbuSrz0+jR0ayOKmWasYZFHDp7MQkI7u
 zPH0/pUrVL58rYNmx9tcISZT0cqHYyP2Ha5Zbd9YpOhpBLNFfdzH+zhGJHQFSkV/+gl9t1nDLY3
 Kah4ILXj1ABi6p4likbBrPRY2xHIP8rZfOM6t/BC/Q4lGknKh4SHU5S3W1Ld/HyTp72MjmHFde+
 zbCiSHzW/Wnm6iJ2YI6PwgOb/z/3xusNKXFtxHqW1caCRBjS1yJcw0e8V2oyO4iX6ZJCO0ceO0A
 Y4bM1Vd1qV/HckAD0Wko2+vpE97AyjG08KfyXwbriCsYX51DojkhKVFWkGYLbyrkPAuRALV53vp
 6dpmGiIT+vZ3ei8IIqne+L6j1rXIftgR/fWDKMjRnL0n/icvjBU7IsxkwvWDFcgc2rIviTqvL6X
 d8KHqYqr76vKW/uRBSeUI1h4DiWXNYQxMetRz+YAGVF4wPp+BqTBwgUw==
X-Received: by 2002:a05:6000:2407:b0:439:b3d2:3766 with SMTP id
 ffacd0b85a97d-43b6423fc13mr980808f8f.19.1773947638294; 
 Thu, 19 Mar 2026 12:13:58 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm635921f8f.32.2026.03.19.12.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 12:13:57 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v2 2/7] hw/arm/sabrelite: Introduce class SabreliteMachineState
Date: Thu, 19 Mar 2026 20:13:09 +0100
Message-ID: <6b21c46dde0f562eba1a5e2dfd9dc8635daaedf1.1773866323.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773866323.git.matyas.bobek@gmail.com>
References: <cover.1773866323.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Mar 2026 15:53:55 -0400
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
---
 hw/arm/sabrelite.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 40ee8196ac..7e036e6388 100644
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
@@ -100,12 +108,14 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
+        arm_load_kernel(&s->soc.cpu[0], machine, &sabrelite_binfo);
     }
 }
 
-static void sabrelite_machine_init(MachineClass *mc)
+static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
@@ -114,18 +124,11 @@ static void sabrelite_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    sabrelite_machine_init(mc);
-}
-
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
2.53.0


