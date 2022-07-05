Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4177387lft;
        Tue, 5 Jul 2022 12:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vz0dQwAdHQxBl+d5LiMib9XcmDhCuQmYHt8S+ctrmAoVLahFVitcDElaNtTYfvSvyKvoXU
X-Received: by 2002:a05:620a:2916:b0:6af:3d79:ebb7 with SMTP id m22-20020a05620a291600b006af3d79ebb7mr24898953qkp.58.1657048472582;
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657048472; cv=none;
        d=google.com; s=arc-20160816;
        b=dMBcYOM8iJOuDyFp/Py4j+GOkHoyaD+CtGsGGBLE8d0CJaZ1Fea/lX39Dat/hilbxM
         RYMHO0EYYVG60n4pV2noI/vEVK1xY1KhTu6N/nENk3nNJUpwlTOUlkdL2iupSnn5g9a1
         cngG5UUgjFcvX2Af46BIL81fbfXgYK2UZgVDqGx8+lkmynjLPxGHg59v+ljVZtySYpNn
         0+I4bJ6d5iJ+MYrCbh2X3XPodjwTH5qlH8gYh4OVLcWYMmC3dA0kibrWao2oU5CLBz6W
         h53AQ2Jx1wP6iI1aiV+yA5fzhC0khXcBUJ4Yg6uvKlLaVpfA2ZCzdLSLjbUth0q9M2OS
         2jAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=VS1KQYXXFvLzCmZIqWAf4o9ftLi+4f6o/PgwWZUCRtE=;
        b=Ty4bZ1Xc+6KVwCNEQPUr7+BlxJt6sgXUsiNe2xJlCCyuvl1bsuwpL8Q4oa0AaiwtGs
         47rPCijkytef6gWwCgxexDr/9hh+ZT+fXbxckOnDwVSvXXbjLDeKoNb2juP9cplGdD5y
         sfu3t3SHFk1APZy/bVwQtn57Ia8QzWOc8W+3742RaD+UOVx+VNVwH9OL573OoHtQ6F2Z
         K5N7mzDiSv4ApiXxjXH4cqlFLOtRyAs+3JeObLNkEsEvTVl/i5IJD3tIkQ4G/XfDTi3T
         OlDK05RdbsWHxi1/YAY6x1FdPjvOAYar3FmvTbcaDmx1O/TdgHl367rfqUv6fTudmEO5
         Qe8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=GTbI5E9N;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=t69HXiun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85742000000b0031e85b88a2bsi1632804qtx.582.2022.07.05.12.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=GTbI5E9N;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=t69HXiun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8o0G-0001D6-2B
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 15:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzx-00019J-0Q; Tue, 05 Jul 2022 15:14:13 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzu-00015o-Sy; Tue, 05 Jul 2022 15:14:12 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 288E458031C;
 Tue,  5 Jul 2022 15:14:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Jul 2022 15:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048450; x=1657052050; bh=VS
 1KQYXXFvLzCmZIqWAf4o9ftLi+4f6o/PgwWZUCRtE=; b=GTbI5E9Ne6KoiDnp6r
 tb9KYO6Z5NiHf1fu+A5/8bIqbUAgD6Ed3xcDny78Njh7TANGVt+AavDewXG6f8cH
 RO/wRAS/ElDCGMaShfG9oDRhtjHLzyIj/u1v1KWWMNAP3ahD+0Tn6wJE4tHoGiiV
 7ETX6M2DB0SDnkg7GIDXqxfbBxAxuYem5Ch6NcXxZ3ydj6QdsIlhmFSBPZqPdwvD
 au3tEn92ARjKTuPG6wbt4x62YuxG9zQTW5QmCCp0wHO46eyosnTdUjf75XgeVDcu
 8HewooJSf+M0+QkogAuT+pNZxcM8N89Yw9CnvLdcCjJPaKY59nhBl/MQ8EDan8mn
 ubgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048450; x=1657052050; bh=VS1
 KQYXXFvLzCmZIqWAf4o9ftLi+4f6o/PgwWZUCRtE=; b=t69HXiunMLmqSosqNZG
 kpkIXrGtxlt40GbWcVK2DBwM+JnBGsva5YsA+jWyk574Xkge3AueTxdcUP/5TG1y
 J+/j83Gdr0TYsm1vTEbBttTOs6Q+XuJG9KedLR2hgV+qqq/pW3oCBjyGcfCQ68j7
 V32uzXivAOW4jFIwXGHIklDCsDslW2hhDXC4XIl0cfBAFVwpxwqcvgg1TkzcQE8w
 s3xpJ1evHM34pospTjJEqyrT3Euj+EjqA5DWlpYVtJfMyCui/nUrrYl72lEHCQek
 +NbrV6riNRqRFe/3znqMLyydJRVLXIu6Ad3WvxpjOaoQWJ6Sy2FoUNq8V/uCkEnR
 3Dg==
X-ME-Sender: <xms:gY3EYh5xlffTF55CUItioOhCY9-dblq-DXzaCYGRV4MXSdM0GHOOFw>
 <xme:gY3EYu454EF8E0A6FXYKt0QUVbPmo1fhKUh-uRrCMOtwKP7oxfFeAAnkZ2zKqZMIm
 GVMR98JK1iml3jiqLE>
X-ME-Received: <xmr:gY3EYofWTEOS-HH0l8lqjb7JYlhrrAPAUcb0AWuQ9hS9rClXCN2jZAk6rWgwLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvd
 ejveefleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:gY3EYqINzMtkBj7Gv8Gj5Q00rDDiAyc4m9c9cilz5HUtqF23et6RLA>
 <xmx:gY3EYlIevWNMwU6zvHfXbqTdanxVc1yixvK4LTyuDUzImnSH1gtx6w>
 <xmx:gY3EYjwxQvFYYiV5fof-gzGPMGtpRbsyQJdpcBmr_EfffyG2x0r0pA>
 <xmx:gY3EYjitKTKHDTPnkPD1RAJyX-t0S6UlQ9lXBa3YVyfgF0XkD1fUEg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:09 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] aspeed: Refactor UART init for multi-SoC machines
Date: Tue,  5 Jul 2022 12:13:54 -0700
Message-Id: <20220705191400.41632-4-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cAqDs2y8zS7t

This change moves the code that connects the SoC UART's to serial_hd's
to the machine.

It makes each UART a proper child member of the SoC, and then allows the
machine to selectively initialize the chardev for each UART with a
serial_hd.

This should preserve backwards compatibility, but also allow multi-SoC
boards to completely change the wiring of serial devices from the
command line to specific SoC UART's.

This also removes the uart-default property from the SoC, since the SoC
doesn't need to know what UART is the "default" on the machine anymore.

I tested this using the images and commands from the previous
refactoring, and another test image for the ast1030:

    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf

Fuji uses UART1:

    qemu-system-arm -machine fuji-bmc \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -nographic

ast2600-evb uses uart-default=UART5:

    qemu-system-arm -machine ast2600-evb \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -serial null -serial mon:stdio -display none

Wedge100 uses UART3:

    qemu-system-arm -machine palmetto-bmc \
        -drive file=wedge100.mtd,format=raw,if=mtd \
        -serial null -serial null -serial null \
        -serial mon:stdio -display none

AST1030 EVB uses UART5:

    qemu-system-arm -machine ast1030-evb \
        -kernel Y35BCL.elf -nographic

Fixes: 6827ff20b2975 ("hw: aspeed: Init all UART's with serial devices")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c             | 22 +++++++++++++---
 hw/arm/aspeed_ast10x0.c     |  8 +++++-
 hw/arm/aspeed_ast2600.c     |  8 +++++-
 hw/arm/aspeed_soc.c         | 50 +++++++++++++++++++++++++------------
 include/hw/arm/aspeed_soc.h |  7 ++++--
 5 files changed, 71 insertions(+), 24 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bee8a748ec..cc395f988c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
+#include "sysemu/sysemu.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -301,6 +302,21 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
                                &error_fatal);
 }
 
+static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
+{
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCState *s = &bmc->soc;
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        if (uart == amc->uart_default) {
+            continue;
+        }
+        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
+    }
+}
+
 static void aspeed_machine_init(MachineState *machine)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
@@ -346,8 +362,7 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
@@ -1372,8 +1387,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     object_property_set_link(OBJECT(&bmc->soc), "memory",
                              OBJECT(get_system_memory()), &error_abort);
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 677699e54c..4d0b9b115f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -144,6 +144,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
@@ -255,7 +259,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 64eb5a7b26..aa2cd90bec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -214,6 +214,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
         object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
@@ -386,7 +390,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0bb6a2f092..b05b9dd416 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -208,6 +208,10 @@ static void aspeed_soc_init(Object *obj)
                                 TYPE_FTGMAC100);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
@@ -315,7 +319,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
@@ -482,8 +488,6 @@ static Property aspeed_soc_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
-                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -573,23 +577,37 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
 
-void aspeed_soc_uart_init(AspeedSoCState *s)
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i, uart;
-
-    /* Attach an 8250 to the IO space as our UART */
-    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
-        if (uart == s->uart_default) {
-            uart++;
+    SerialMM *smm;
+
+    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        smm = &s->uart[i];
+
+        /* Chardev property is set by the machine. */
+        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
+        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
+        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
+        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
+        if (!sysbus_realize(SYS_BUS_DEVICE(smm), errp)) {
+            return false;
         }
-        serial_mm_init(s->memory, sc->memmap[uart], 2,
-                       aspeed_soc_get_irq(s, uart), 38400,
-                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(smm), 0, sc->memmap[uart]);
     }
+
+    return true;
+}
+
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i = dev - ASPEED_DEV_UART1;
+
+    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
+    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
 }
 
 /*
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e65926a667..68e907cd64 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -36,12 +36,14 @@
 #include "hw/misc/aspeed_lpc.h"
 #include "hw/misc/unimp.h"
 #include "hw/misc/aspeed_peci.h"
+#include "hw/char/serial.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
+#define ASPEED_UARTS_NUM 13
 
 struct AspeedSoCState {
     /*< private >*/
@@ -79,7 +81,7 @@ struct AspeedSoCState {
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
     AspeedPECIState peci;
-    uint32_t uart_default;
+    SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
     UnimplementedDeviceState video;
@@ -175,7 +177,8 @@ enum {
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
-void aspeed_soc_uart_init(AspeedSoCState *s);
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
-- 
2.37.0

