Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1885025ejq;
        Mon, 8 May 2023 01:01:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Nn/W7rJiST/yyGQp425AWIiu/MCvizqv5jHxen3Vtm9Ohw/txl3nY9/e/2X/P5P5Z3MBn
X-Received: by 2002:ac8:58d4:0:b0:3eb:6892:2930 with SMTP id u20-20020ac858d4000000b003eb68922930mr14940214qta.39.1683532894547;
        Mon, 08 May 2023 01:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532894; cv=none;
        d=google.com; s=arc-20160816;
        b=cCm4DEu+LkOGaiBv5Z+7amqcz7oV97QmNBkgWGmlkndniUVDK9EwI7w0dePNMyTgsN
         Ei6Mz6ynmI5zjw5Q3JqNk4WI+aOFRbVMiikz06wB/R+J6SW7NPaXUleRalvsSfqp5Gzn
         QWyVcrIe8sZFCw5sEyWBCVXMwGr/zdbzxIqgqecCCR/jimvOKgP5L3cl83zLuuOvmizX
         PZGuEN8D1JOBGI8qQNRaFcYinfq2bRsAVe7SQ1PXcKhBpwWPqQYxMyz4yoWGv6rMNsxV
         /5zd9w6I7IEhs8OhP3Ns/DjCS1DSIH/qcf7yyvKiLw+2h3YHSEGheh1P/qY5eu8e0LFV
         SW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BKPE0DPnxj1KB8PORfHG14w74IEQbmuTVfGjFHCDRMQ=;
        b=jcwf12UDaAclwHwfxXD67naWTSr3h3F4ZVD2/LVySN7oQ/B35oXExWGBctBZF3QMDz
         mJeG6OAiSU1clBzol1/wHXlxTUzBdYNXtLzLqGf8TsdKJhMK7lnVqgkaVY7saJ8oenu/
         qqEShJzg/6q9WqgMbMfUGMkYPuk5TElTe9yDpelBqO/vsUZuEWHfezVRXF2TXdy+PGu2
         HjF+IKrGrsRQW8EjxO2YBa2Mf9XaGA+tl0IpvyIWvRpWynXcxWg2chPgPvpVEk00/fW3
         DoiYPiIGQMWc6HJdDBNK6I5zG4/yTzbo8/iYK3ZlCIM8JOa1tVZyUtI8mNtUqnEtTckH
         bHTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a060600b003f21f632b11si2732918qta.422.2023.05.08.01.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmm-0008Fq-Ja; Mon, 08 May 2023 03:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmR-00082M-JF; Mon, 08 May 2023 03:59:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmP-0001A5-DN; Mon, 08 May 2023 03:59:35 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDGB4Fppz4x4D;
 Mon,  8 May 2023 17:59:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDG76LQ7z4whj;
 Mon,  8 May 2023 17:59:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 07/12] hw/ssi: Check for duplicate addresses
Date: Mon,  8 May 2023 09:58:54 +0200
Message-Id: <20230508075859.3326566-8-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BE7HyzLw1y1N

This to avoid address conflicts on the same SSI bus. Adapt machines
using multiple devices on the same bus to avoid breakage.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/stellaris.c                  |  4 +++-
 hw/arm/xilinx_zynq.c                |  1 +
 hw/arm/xlnx-versal-virt.c           |  1 +
 hw/arm/xlnx-zcu102.c                |  2 ++
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/ssi.c                        | 20 ++++++++++++++++++++
 6 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index f7e99baf62..ffa5999a1d 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1242,7 +1242,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    qdev_get_child_bus(sddev, "sd-bus"),
                                    &error_fatal);
 
-            ssddev = ssi_create_peripheral(bus, "ssd0323");
+            ssddev = qdev_new("ssd0323");
+            qdev_prop_set_uint32(ssddev, "addr", 1);
+            qdev_realize_and_unref(ssddev, bus, &error_fatal);
 
             gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
             qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..91718c5267 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -164,6 +164,7 @@ static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
                                         blk_by_legacy_dinfo(dinfo),
                                         &error_fatal);
             }
+            qdev_prop_set_uint32(flash_dev, "addr", j);
             qdev_realize_and_unref(flash_dev, BUS(spi), &error_fatal);
 
             cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 668a9d65a4..ac2ad3fd0d 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -701,6 +701,7 @@ static void versal_virt_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint32(flash_dev, "addr", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4c84bb932a..70b4e4b320 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -201,6 +201,7 @@ static void xlnx_zcu102_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint32(flash_dev, "addr", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
@@ -224,6 +225,7 @@ static void xlnx_zcu102_init(MachineState *machine)
             qdev_prop_set_drive_err(flash_dev, "drive",
                                     blk_by_legacy_dinfo(dinfo), &error_fatal);
         }
+        qdev_prop_set_uint32(flash_dev, "addr", i);
         qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..0ef5b3a02b 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -192,6 +192,7 @@ petalogix_ml605_init(MachineState *machine)
                                         blk_by_legacy_dinfo(dinfo),
                                         &error_fatal);
             }
+            qdev_prop_set_uint32(dev, "addr", i);
             qdev_realize_and_unref(dev, BUS(spi), &error_fatal);
 
             cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index a25e064417..685b7678e0 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -42,10 +42,30 @@ DeviceState *ssi_get_cs(SSIBus *bus, int addr)
     return NULL;
 }
 
+static bool ssi_bus_check_address(BusState *b, DeviceState *dev, Error **errp)
+{
+    SSIPeripheral *s = SSI_PERIPHERAL(dev);
+
+    if (ssi_get_cs(SSI_BUS(b), s->addr)) {
+        error_setg(errp, "addr '0x%x' already in use", s->addr);
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
2.40.0

