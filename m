Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5060748ejc;
        Thu, 31 Aug 2023 05:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbkYkYCRX5cYD1F7+uhApkhOuOjPBHT+AMN/vIazWvDBa9Guxl1XvXF+YtwoBSwdIrYKqc
X-Received: by 2002:a0c:8c8b:0:b0:651:67bd:7501 with SMTP id p11-20020a0c8c8b000000b0065167bd7501mr2265619qvb.37.1693485715668;
        Thu, 31 Aug 2023 05:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485715; cv=none;
        d=google.com; s=arc-20160816;
        b=CPzDiPZiD8nzPSlndsTc8A01mpiaKY7gvvg0x6fQ4dUGO3TE+JZBWBvK1naQU8QvBo
         +p8fsOYhqkzin19yOS6mT/PGlrnPpzjKzrAdKKPsaJ1n8n2mh0Hy9XmzOkPdg1piILQ5
         Ah89IAlXxclsQuHDF1VN+7QCCrRjgD5ZVyMX/NDhwoU//cY0npSr29NWXmx88Za4rvx6
         XW8j0JTldigcBpNTbsJpIni8u8t5uDXTraDg95//+Wgwazwz7BAL3U37KlAcdivbfLml
         o7W4pZhi5bHt/BR6vIZU6mX62zJ4JB3ua6ymj/c1bOiz+IdY2dclWGXv+3E4TF9Qy2kZ
         YAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=EoMPgiZk5FaLdAd+2mhZb6XtHJAjzdHIqwWjeA3hCME=;
        fh=+hpXvNY5dyGoVJmqAs9coFOpaKfzFwYUrNzBgnmL9/k=;
        b=wF3Zqac2gHiCxhpdTVAwMiZ8z3J88HcFt4IWtmzHq7RFTBytKyX7sEE4qGgUTlZBPB
         mMicsFvaYDc8yi68t/fDCvfglZEDD3sSLZ04wrieCkEvWEHIZxj617lgxXYXnafVYo4B
         OlrMtpLkEtacx/+U/+RbgEWyZ61SYbAm5tjrBCBTEzQ3L0nDYbMc8mXnSny4M2IUjOT6
         ASXZxW+YvGfyd3CIRWySeASGPaJSylFnjcLZLE/SwWF/5/qKwnvyuv9zVRtRhn5nmNix
         CpsX3R1LJ132i9qZtwfVwSyjY8eiL9GmaXo2QTVBPix54atGQyniP/zBPrVyejZkLy4F
         t30g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a0ce48d000000b0064f53ba19c6si792136qvl.389.2023.08.31.05.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbgxn-0007xq-8T; Thu, 31 Aug 2023 08:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxf-0007tV-G9; Thu, 31 Aug 2023 08:39:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxc-0008DN-9N; Thu, 31 Aug 2023 08:39:47 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12P6Qj9z4x2n;
 Thu, 31 Aug 2023 22:39:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12M0bFZz4x2b;
 Thu, 31 Aug 2023 22:39:38 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 4/7] hw/ssi: Check for duplicate CS indexes
Date: Thu, 31 Aug 2023 14:39:19 +0200
Message-ID: <20230831123922.105200-5-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V+LRw7g9suGe

This to avoid indexes conflicts on the same SSI bus. Adapt machines
using multiple devices on the same bus to avoid breakage.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/stellaris.c                  |  4 +++-
 hw/arm/xilinx_zynq.c                |  1 +
 hw/arm/xlnx-versal-virt.c           |  1 +
 hw/arm/xlnx-zcu102.c                |  2 ++
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/ssi.c                        | 21 +++++++++++++++++++++
 6 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index f7e99baf6236..5a3106e00939 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1242,7 +1242,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    qdev_get_child_bus(sddev, "sd-bus"),
                                    &error_fatal);
 
-            ssddev = ssi_create_peripheral(bus, "ssd0323");
+            ssddev = qdev_new("ssd0323");
+            qdev_prop_set_uint8(ssddev, "cs", 1);
+            qdev_realize_and_unref(ssddev, bus, &error_fatal);
 
             gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
             qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8dbc..8dc2ea83a93b 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -164,6 +164,7 @@ static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
                                         blk_by_legacy_dinfo(dinfo),
                                         &error_fatal);
             }
+            qdev_prop_set_uint8(flash_dev, "cs", j);
             qdev_realize_and_unref(flash_dev, BUS(spi), &error_fatal);
 
             cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 1ee2b8697fe2..88c561ff6328 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -740,6 +740,7 @@ static void versal_virt_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint8(flash_dev, "cs", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4c84bb932aa0..21483f75fd93 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -201,6 +201,7 @@ static void xlnx_zcu102_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint8(flash_dev, "cs", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
@@ -224,6 +225,7 @@ static void xlnx_zcu102_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint8(flash_dev, "cs", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index babb05303520..ea0fb68cf026 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -192,6 +192,7 @@ petalogix_ml605_init(MachineState *machine)
                                         blk_by_legacy_dinfo(dinfo),
                                         &error_fatal);
             }
+            qdev_prop_set_uint8(dev, "cs", i);
             qdev_realize_and_unref(dev, BUS(spi), &error_fatal);
 
             cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 54ca3c34e9d0..1f3e540ab8a1 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -42,10 +42,31 @@ DeviceState *ssi_get_cs(SSIBus *bus, uint8_t cs_index)
     return NULL;
 }
 
+static bool ssi_bus_check_address(BusState *b, DeviceState *dev, Error **errp)
+{
+    SSIPeripheral *s = SSI_PERIPHERAL(dev);
+
+    if (ssi_get_cs(SSI_BUS(b), s->cs_index)) {
+        error_setg(errp, "CS index '0x%x' in use by a %s device", s->cs_index,
+                   object_get_typename(OBJECT(dev)));
+        return false;
+    }
+
+    return true;
+}
+
+static void ssi_bus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+
+    k->check_address = ssi_bus_check_address;
+}
+
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(SSIBus),
+    .class_init = ssi_bus_class_init,
 };
 
 static void ssi_cs_default(void *opaque, int n, int level)
-- 
2.41.0

