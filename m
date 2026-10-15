Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D08CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKTz-0006kD-8k; Thu, 15 Oct 2026 08:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTe-0006Dw-Av
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTc-0005dw-Fs
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792066947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRxtsBUaS7eHPjNmFbqad0JSrWMq5v0udk1YgsjAYcY=;
 b=O6eotSfK0eY1QmZT8Z6T3bQFsBsl/v4dqMO3cRRm5SovMD2kpyjOkoQ0x2WoET+RZPZOz5
 LhN+3ZcshEYNAvf16iLtso9pbezvxs68Mn8hYDDLuDsllqUuvfg0N8CVsW6+e5DA30wcsg
 M1A6yzU3hxThC8NiqnGQxaQu4SmTc+g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-m9Yy6YsePLGWm4VhgaC5Tg-1; Thu,
 15 Oct 2026 12:22:24 +0000
X-MC-Unique: m9Yy6YsePLGWm4VhgaC5Tg-1
X-Mimecast-MFC-AGG-ID: m9Yy6YsePLGWm4VhgaC5Tg_1792066943
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 762EF1955DBD; Thu, 15 Oct 2026 12:22:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.48.67])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CEE087D8; Thu, 15 Oct 2026 12:22:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 14/21] hw/arm/aspeed_ast1040: Use a table for unimplemented
 devices
Date: Thu, 15 Oct 2026 14:21:44 +0200
Message-ID: <20261015122151.889017-15-clg@redhat.com>
In-Reply-To: <20261015122151.889017-1-clg@redhat.com>
References: <20261015122151.889017-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: e4-giJGkSMBdkD-s01R1aFEyNthH7x8eeviLKz1qhGg_1792066943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jamin Lin <jamin_lin@aspeedtech.com>

Before this change, each unimplemented device needed its own field in
AspeedSoCState. This made the variable names confusing. For example,
AspeedSoCState has "udc" as an unimplemented device, but
Aspeed2600SoCState also has "udc" as the real UDC model.

Use the unimp_devs table in AspeedSoCClass to describe the
unimplemented devices, and use create_unimplemented_devices() to create
and map them. This makes the code easier to maintain and read. Convert
AST1040 to use them.

This also fixes a type mismatch. AST1040 used the "pwm" field
(AspeedPWMState) to create an unimplemented device. It is not used for
that anymore.

No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20261012064445.2571633-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast1040.c | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/hw/arm/aspeed_ast1040.c b/hw/arm/aspeed_ast1040.c
index 57ffc0807ab7..0b078f10c403 100644
--- a/hw/arm/aspeed_ast1040.c
+++ b/hw/arm/aspeed_ast1040.c
@@ -81,6 +81,15 @@ static const int aspeed_soc_ast1040_irqmap[] = {
     [ASPEED_DEV_PECI]      = 164,
 };
 
+static const UnimplementedDeviceConfig aspeed_soc_ast1040_unimp_devs[] = {
+    { "pwm", "aspeed.pwm", 0x740C0000, 0x10000, -1000 },
+    { "espi", "aspeed.espi", 0x74C05000, 0x1000, -1000 },
+    { "udc", "aspeed.udc", 0x74120000, 0x4000, -1000 },
+    { "jtag[0]", "aspeed.jtag0", 0x74C01000, 0x100, -1000 },
+    { "jtag[1]", "aspeed.jtag1", 0x74C09000, 0x100, -1000 },
+    { }
+};
+
 static qemu_irq aspeed_soc_ast1040_get_irq(AspeedSoCState *s, int dev)
 {
     Aspeed10x0SoCState *a = ASPEED10X0_SOC(s);
@@ -123,14 +132,6 @@ static void aspeed_soc_ast1040_init(Object *obj)
         object_initialize_child(obj, "wdt[*]", &s->wdt[i],
                                 "aspeed.wdt-ast2700");
     }
-
-    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
-                            TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
-                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1040_realize(DeviceState *dev_soc, Error **errp)
@@ -267,26 +268,8 @@ static void aspeed_soc_ast1040_realize(DeviceState *dev_soc, Error **errp)
         aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(&s->wdt[i]), 0, wdt_offset);
     }
 
-    /* Unimplemented peripherals */
-    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->pwm),
-                                  "aspeed.pwm",
-                                  sc->memmap[ASPEED_DEV_PWM], 0x10000);
-
-    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->espi),
-                                  "aspeed.espi",
-                                  sc->memmap[ASPEED_DEV_ESPI], 0x1000);
-
-    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->udc),
-                                  "aspeed.udc",
-                                  sc->memmap[ASPEED_DEV_UDC], 0x4000);
-
-    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->jtag[0]),
-                                  "aspeed.jtag0",
-                                  sc->memmap[ASPEED_DEV_JTAG0], 0x100);
-
-    aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->jtag[1]),
-                                  "aspeed.jtag1",
-                                  sc->memmap[ASPEED_DEV_JTAG1], 0x100);
+    /* Unimplemented devices */
+    create_unimplemented_devices(OBJECT(s), s->memory, sc->unimp_devs);
 }
 
 static void aspeed_soc_ast1040_class_init(ObjectClass *klass, const void *data)
@@ -312,6 +295,7 @@ static void aspeed_soc_ast1040_class_init(ObjectClass *klass, const void *data)
     sc->uarts_base      = ASPEED_DEV_UART0;
     sc->irqmap          = aspeed_soc_ast1040_irqmap;
     sc->memmap          = aspeed_soc_ast1040_memmap;
+    sc->unimp_devs      = aspeed_soc_ast1040_unimp_devs;
     sc->num_cpus        = 1;
 }
 
-- 
2.56.0


