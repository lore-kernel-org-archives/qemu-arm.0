Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21411FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 18:27:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIW6K-0006bB-L4; Thu, 30 Apr 2026 14:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wIW5o-0006Wo-Qm
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 14:26:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wIW5f-0005UL-DH
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 14:26:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so851940f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777573581; x=1778178381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30GY1IKrltrPVzUIuoJTA3lYJMRk3qcolQ/AgKSRsLY=;
 b=ROuLToVYu2IHpKwe+LPszGyHEl542kyI4l2UheRiiKK56gtyvWkPGGTIlFs67b7kg4
 2EzYPbbddCLG/Zcjw8r4K18QKU80MtDIo1/g2ozKsx8SuVxEz1XAMAywA+lBTURXhp5E
 DiIWWK/HbFPDLTkO3Xl2RtpjLp3Zue0uqUporNFZINtzF6vyg7Nm6dA9PwPjA7jA/p2n
 jTTgf7Jdhfz/VlOw8p4IHEFPwlt1eLkrZ2JifgO2Ifmj2N61Gt+ge0coN5ng1PKItU83
 RHcmIvMtjMUpztpznWXYzfjY8M3mMAOlUh3WpatGNrveG/RMYpEORz/wufeHNh7x9r0a
 f3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777573581; x=1778178381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=30GY1IKrltrPVzUIuoJTA3lYJMRk3qcolQ/AgKSRsLY=;
 b=JfQDHQjdUv6YO49wyN1iLKGp9OGDN48CZAk9zMNuFdfeDUGYjpRoEPtlYTUsvAWOrZ
 K2qfrw9qj9beWppQS/ligoZL0D49P5iI182IWNJx7K+lYN0ZpENFuGGNARF+R00LcrZ+
 whDU5mlLo2Lb+0oQ6sqYNk4JeIeRuNWk/A1ATOO+uFOUxe3fwfQBOCDiDAkM/JKwLB4u
 Wp7noJzYcwQUFExPdmIh+/exPfDUafLdJ2vOxN6pVd+Hilh988iwxZI5rBwyBpf6FOMu
 F+Iz6TYZQOmq4Ibn6+9XjFyNaJmUNzZPp7e0L9kzKYpCNpE0sGG3jMVGL8yT5Wcpael0
 6LTA==
X-Gm-Message-State: AOJu0YwJGTJqAGYK8OqW9cYrEKp+TPHPaOKStzK5J2cK+bIpt2fUrftJ
 ZZ2o7CHnSq+8LIX654O4pI8lZc6RNQT5hi6t4nQg3onP+2690lBV5Vi+
X-Gm-Gg: AeBDiet3T264tIg6RpyP6NJ7rTbeddXZ5X6faY1y5dFJUuLWojOd5DLSwxpP3l4ioko
 dTGBa0Jo+yR2VlVyiVtnV7wKV7NjrwGpRmYWsHLzhiB2RwFdFoheIekJjGK8NhMwPuHjDQHl35F
 cSVZA5qZa9i+kJBDi3uXxkNDcWowrXdMfFhJCOOm0k8VAeE1g0eFq7NeAw6bJYKilCz9NLrVHUC
 F4ZcyVlx8lwBJaIbNgdMcxKiVJeOX+M90a9T7O8BrX2d/4vtUJo4XG5zQZZHTkDFoB++g4UzKQV
 46KUlrdRnrD2bDykc1+TAT2QnfvFOd4Q6xoXsfIPDilR6KsMjlxCdjAeDW7A1fzI/0VcvrTX7+b
 zSmruSmJBLXbf1z61+nBLZXAU/UNuu1XaDOv7DqzNRRu6j6JWsOhDt/DWLk71YuY8WEFTOmTNL4
 iSnPo0DxC6vZ2MyW6ixi4I6JGwisxxLguVkW3ZlVhak8OcOMa5hu5Lry2oRdp40Vvh
X-Received: by 2002:a05:6000:430a:b0:43d:e31:68d1 with SMTP id
 ffacd0b85a97d-4493ec61b5cmr7122353f8f.21.1777573580839; 
 Thu, 30 Apr 2026 11:26:20 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b76e5c00sm14674925f8f.25.2026.04.30.11.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 11:26:20 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v3 2/7] hw/arm/sabrelite: Introduce class SabreliteMachineState
Date: Thu, 30 Apr 2026 20:26:04 +0200
Message-ID: <ff0c870a705914ed4f5968802d398c24d19a13e7.1777571962.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777571962.git.matyas.bobek@gmail.com>
References: <cover.1777571962.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
2.53.0


