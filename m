Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2307497njj;
        Mon, 5 May 2025 02:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkil4owsJfoWvutZeaibUwl8oc+KdjfQKxUBgAnEN8H0Svs1YQZOUHPXXiNiowMvWduoMtiV1nvHqVuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFDrNYx0/LBrnVBCe9TQwCyv8QEjGukRbKh85x2znLEB5D5MAq+k70cZy9mO+e3EhiQD3fu
X-Received: by 2002:a05:6000:290b:b0:3a0:832e:5d0b with SMTP id ffacd0b85a97d-3a09fd811cfmr4380102f8f.32.1746436426639;
        Mon, 05 May 2025 02:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436426; cv=none;
        d=google.com; s=arc-20240605;
        b=GLBSyoa7w5zm/LP2Qz/JRJVfIKXrmh91YVFEfsVZDIU/I1l/DP5ed15NEKhQsn1Xll
         KQpBwbkPp4qvinR1ggvGs9co9LrxfSVRTOH3avbzIS76E78TfHRnROJ1AfyC+HZaJ6sM
         UdcWfCfRzj91cGupw3JSQnYLg8PvB/HRw9V8nAEp970C8/Y7QzdoXTAt8cLwtm20CK0A
         LFVvy84O6DrhBjTpKe4uSYL+i8hpQbxe1ehnqzHtegu7Y070G7X1Y+KP6ds8AZ+4t2Tx
         aB6kVX31ht8qBcOXppf3Kw3OF4xwdEhK9R8E366JeX6HI0l7/7JF8+oyDKKBCVT859kT
         FZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SXPjEs8uK5wDWsY0wIN/xTL3HevqsBtG8a0jYszAUO4=;
        fh=O3GBR2OOT5hhNkvxv+rlHs7YTTnYAArA4Xdium3ocZU=;
        b=hVcz7/jh/d0wBvix99SLKS4lmzxXNhVVRHwYqHW2L8eaWlbvtC2H3FE/3sleJA4nz+
         7mTlZAQYPS+OWeZb/t3o6gpMFST+DsE/HIls22SYNb3cXmatPu07+gIx6xNylrBGpwmX
         K28uUn/+JcFhp1qaU94abLbfk4hM7AGJAjJCUSmSQnR0Vl8A8F+8nqDOdQT4M7U/HnuB
         jZZrdj3T9GxPQ+0nMPkd6ENiihGouy8xTexL1gsTJ7DgscaRjJRVElE67tmaJAf6aIBB
         sEHcG8ALXgfAqM2jiA6xn9wQPDjoDc/8pRa3jHgboqss9nw+AuUCRc0yahgghWxNSpxA
         H5zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XOJYKa4E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b00b9csi4847251f8f.576.2025.05.05.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XOJYKa4E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uBrr6-0004o0-RW; Mon, 05 May 2025 05:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnO-000861-Q7
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnM-0006NE-DA
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXPjEs8uK5wDWsY0wIN/xTL3HevqsBtG8a0jYszAUO4=;
 b=XOJYKa4ExPl9KyxFdk4SEYJiXghr4GSQ5/B+ha/mzUh630+xRHSjYb4ktgl7i5w7zyeecw
 RjcUGu1QNmlmbovzGFLFdS7kSgCEvagC5NZXPh8I7ir9iFTh9aSWnWE1Cu+jD+Bv/EwPQe
 C6u1u7sVcw4y73kVxy3TIdlw8Ozp+yk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-OcZJklT8NqukJEGu2_VSpw-1; Mon,
 05 May 2025 05:07:23 -0400
X-MC-Unique: OcZJklT8NqukJEGu2_VSpw-1
X-Mimecast-MFC-AGG-ID: OcZJklT8NqukJEGu2_VSpw_1746436042
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 32E161800370; Mon,  5 May 2025 09:07:22 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 87FF430001A2; Mon,  5 May 2025 09:07:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 15/23] aspeed: ast27x0: Map unimplemented devices in SoC memory
Date: Mon,  5 May 2025 11:06:27 +0200
Message-ID: <20250505090635.778785-16-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +xuIHVMi+xwe

From: Steven Lee <steven_lee@aspeedtech.com>

Maps following unimplemented devices in SoC memory
- dpmcu
- iomem
- iomem0
- iomem1
- ltpi

Iomem, Iomem0 and Iomem1 include unimplemented controllers in the memory ranges 0x0 - 0x1000000, 0x120000000 - 0x121000000 and
0x14000000 - 0x141000000.

For instance:
- USB hub at 0x12010000
- eSPI at 0x14C5000
- PWM at 0x140C0000

DPMCU stands for Display Port MCU controller. LTPI is used to connect to AST1700.
AST1700 is an I/O expander that supports the DC-SCM 2.1 LTPI protocol.
It provides AST2700 with additional GPIO, UART, I3C, and other interfaces.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Iae4db49a4818af3e2c43c16a27fc76329d2405d6
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250502103449.3091642-2-steven_lee@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h |  6 +++++
 hw/arm/aspeed_ast27x0.c     | 52 ++++++++++++++++++++++++++++++++-----
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 4dcb1010dc28..5fcfd2fe2e62 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -91,6 +91,8 @@ struct AspeedSoCState {
     SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
+    UnimplementedDeviceState iomem0;
+    UnimplementedDeviceState iomem1;
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
@@ -98,6 +100,7 @@ struct AspeedSoCState {
     UnimplementedDeviceState espi;
     UnimplementedDeviceState udc;
     UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState ltpi;
     UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
     AspeedAPB2OPBState fsi[2];
 };
@@ -173,6 +176,9 @@ enum {
     ASPEED_DEV_VBOOTROM,
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
+    ASPEED_DEV_IOMEM0,
+    ASPEED_DEV_IOMEM1,
+    ASPEED_DEV_LTPI,
     ASPEED_DEV_UART0,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a289e65e495d..21769669df27 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,9 +23,17 @@
 #include "qobject/qlist.h"
 #include "qemu/log.h"
 
+#define AST2700_SOC_IO_SIZE          0x01000000
+#define AST2700_SOC_IOMEM_SIZE       0x01000000
+#define AST2700_SOC_DPMCU_SIZE       0x00040000
+#define AST2700_SOC_LTPI_SIZE        0x01000000
+
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_DPMCU]     =  0x11000000,
+    [ASPEED_DEV_IOMEM0]    =  0x12000000,
     [ASPEED_DEV_EHCI1]     =  0x12061000,
     [ASPEED_DEV_EHCI2]     =  0x12063000,
     [ASPEED_DEV_HACE]      =  0x12070000,
@@ -39,6 +47,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
     [ASPEED_DEV_SPI1]      =  0x14020000,
@@ -73,6 +82,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_UART12]    =  0X14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
+    [ASPEED_DEV_LTPI]      =  0x300000000,
     [ASPEED_DEV_SDRAM]     =  0x400000000,
 };
 
@@ -507,6 +517,16 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+    object_initialize_child(obj, "dpmcu", &s->dpmcu,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "ltpi", &s->ltpi,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem", &s->iomem,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem0", &s->iomem0,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem1", &s->iomem1,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 /*
@@ -542,8 +562,11 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(gicbusdev, errp)) {
         return false;
     }
-    sysbus_mmio_map(gicbusdev, 0, sc->memmap[ASPEED_GIC_DIST]);
-    sysbus_mmio_map(gicbusdev, 1, sc->memmap[ASPEED_GIC_REDIST]);
+
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 0,
+                    sc->memmap[ASPEED_GIC_DIST]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 1,
+                    sc->memmap[ASPEED_GIC_REDIST]);
 
     for (i = 0; i < sc->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&a->cpu[i]);
@@ -911,11 +934,26 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 
-    create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
-    create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
-    create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-    create_unimplemented_device("ast2700.ltpi", 0x30000000, 0x1000000);
-    create_unimplemented_device("ast2700.io", 0x0, 0x4000000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu),
+                                  "aspeed.dpmcu",
+                                  sc->memmap[ASPEED_DEV_DPMCU],
+                                  AST2700_SOC_DPMCU_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->ltpi),
+                                  "aspeed.ltpi",
+                                  sc->memmap[ASPEED_DEV_LTPI],
+                                  AST2700_SOC_LTPI_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem),
+                                  "aspeed.io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  AST2700_SOC_IO_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem0),
+                                  "aspeed.iomem0",
+                                  sc->memmap[ASPEED_DEV_IOMEM0],
+                                  AST2700_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem1),
+                                  "aspeed.iomem1",
+                                  sc->memmap[ASPEED_DEV_IOMEM1],
+                                  AST2700_SOC_IOMEM_SIZE);
 }
 
 static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, const void *data)
-- 
2.49.0

