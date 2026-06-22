Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A64CDB477
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 16:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbhCW-0006Rx-7T; Mon, 22 Jun 2026 12:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wbhCJ-0006Ia-En
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:08:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wbhCF-0006j5-OB
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:08:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so39540915e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782144506; x=1782749306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naAjGDZPbJ67GvzkWP49qsFsJVwJRVlvC8LloXp3eNQ=;
 b=Ktcv1NGMYhVyH2gIZkTlFVjTLBlF8j5TKrWpbDwmcXUOwF8fmBOblwGEt9LuDhBCam
 VWwzL6WzjAgGPBlhBEmVVPVN721QGagxLr/sx/Z/hQRdN8LdzdFPs+zvdYg7MnjzY3fs
 8Q/4Welrjd0c52y9n09ROMpXWJxiq8aVsjaxWVelQA+NH1awvqW8m+Hv0MV+YkWs6jSR
 /rKz4YB77OQKtNQC5klZCvLY9VV3EVA1wNcml53ViOGgVF7QoggnWU1FYu0DBLcFZWw4
 l/Af+OMCnlZ/FSOe8g00LZ0A6gVTl6dSq+SHh0lBzSUb4JWIqOFtLQikb52yuN7YjmbB
 4uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782144506; x=1782749306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=naAjGDZPbJ67GvzkWP49qsFsJVwJRVlvC8LloXp3eNQ=;
 b=mFoqVnXxzvdwWphaSjbDd2KDhGXevY9zy6laRdpJ093GX+Xf59xXy1siwHcEQqOkaE
 7QYUrozrCm/5JZCKBMk2AChE3/XciAAKecFxHs24gCuouHZ2nE7aYJpbRZwRM4zUIn+R
 FU1Nr7VEdO4V6S/FwyPUbWPN4wkkEIbGH77MLP1/bfb/F5cUD8vhCPKWkQePz4Rr9pmD
 EJq+xGopme7Y5drd1LXl/71Ol8o55VwyrPCJibfJ46wcc8A7ApqC4StJCuujf1q7mlwI
 pl0yWXmP7rOMABioqP21JnE6i8iZqKpHvhpli+J6/f2ZuYnGnvSg5/PlyogG8MNC5mHe
 Pu1Q==
X-Gm-Message-State: AOJu0YxTJcg95VELC8NzAlwms0VhQgvQ6My1XItA2bKDkSEWIT1g2CqZ
 uXmu0E88xJ6Q03K5DoYpam1CeUOhJC9f82G7yWGkziT2OkUnc2GpnneD
X-Gm-Gg: AfdE7cks7sTjn4W5PSbZMraB1uiI0CHKCizo2Aqbi6leClvsQiHNX/Su7wWjmNhnzLU
 tb8nBjkf6fYvjO5PXolCjFnMf8b5GBNHDWF+TtSW+2N2akv1y+rk4HmxevXn3sHIn4wQgYjIQdW
 WWS2v8bNTcpDcTSH5Sm/60GLrfqY0xThwPfU+WIU9NDVLt5FP1CDKhcKIQIfNndqucivh4wKm/z
 JXEx7begcINdufdw+WpUrCQ6M+gTndyCMEDHOHpShQbUpZ3lI4g9ASTojTdw0VXZO8L4ndoOo5U
 VMSrHB62tNVcMfdj67Z6sa5L0ycDNlllpbYo8EplJ9Xa8Q+xtiSsyG5LvMwPKOj0XsNHSYzdv4K
 7mh8Ss/f3QGJbtdNaDeRTz4Zcj3qvc5pqJH6ZhuNRwBc5W7HRb19lppZZI+9Dq5ql4ZAp8o3JqH
 fggerYe+QJoOVzNgeeFUSv+3qMCS15968dCYKZDODuWTY=
X-Received: by 2002:a05:600c:1f92:b0:490:a1dc:e542 with SMTP id
 5b1f17b1804b1-49242314217mr202502575e9.6.1782144505980; 
 Mon, 22 Jun 2026 09:08:25 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494496d8sm225062545e9.9.2026.06.22.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 09:08:25 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v6 2/7] hw/arm/sabrelite: Introduce class SabreliteMachineState
Date: Mon, 22 Jun 2026 18:08:07 +0200
Message-ID: <115740db83cf2e5a5e7bb349130c9706934ec1f3.1782140438.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782140438.git.matyas.bobek@gmail.com>
References: <cover.1782140438.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x32a.google.com
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
2.54.0


