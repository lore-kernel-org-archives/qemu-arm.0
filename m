Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1839361ejc;
        Mon, 16 Jan 2023 15:57:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXterdBK7uivvz9vsmqCAhkoefepzlpCXpWbjua2w6uzoa5Ub0RxurqELqfGI0jYBhk1e8Xi
X-Received: by 2002:a0c:f783:0:b0:534:252f:b08e with SMTP id s3-20020a0cf783000000b00534252fb08emr1942788qvn.52.1673913423226;
        Mon, 16 Jan 2023 15:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673913423; cv=none;
        d=google.com; s=arc-20160816;
        b=YTp0mfPjZ+KKyYhZVmSKuzTIAMeFhXHtBaCPZhuWZVDx+F1Jm+zkI/U80Ierh2c38D
         skbXXIa9Er88XZHYDqNocoKAeXMycIgwSVLzNFfQwP5bbtOHJFaGcfBY6itZMJUrnC+Z
         cvo85Inv22swE7O6JQs4l55LE78/kIzfiOPW4tDMSnuIRZW9bl8Qq+Cr+OkJI0mPj4/X
         pLCzGaycFE0c61NqEb+I3s4BNQyUUV3LKkCiXy+T3F+ItujWNNrPC3z3FoMzBYqzkOBX
         FEruJoXTjJNBKllR39NGvnAE1kvAEZ78LZRYZf/BB/ng9d4rG7rWpH05hakM7dLu71oO
         fhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=9RR7AqdkIyiM5lD+2y8tGjFSEwMYKEEfE+QBJh5nkFY=;
        b=JS5np2+za2svPLotTa6QmgjmGiHfa3LyoiTlSVBnC3THoxG4Y0dn/ateH7l5r4BOfM
         CU5vDQhPI1BpzOMy8iViUPuTcgsY39IqzeBHllfBeXRHuY/YYiyt+iaDZjxdpINhwKzv
         UlnjHxewG50o282fIBn8o8ahBSIbFGWhj16RzAXN268KzpwIwMQxsTr7BAaVYhyKhD9r
         5Wb4EvuYKzFzJi7WF2bLyhLFFX6npwYd7IjLj/TmgHyrdrJHPoG17JvFFYILtnMDUFIS
         LKzuAqhoVwQIu8HiSli/EvomkRl8kGZC12rP2j4eHql84w6v7WTH5122NJvUp/tW/YmG
         Baqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=bIi8LtEq;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kOjk3Ksx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a0562140dc800b00530d08f3da7si18980363qvt.336.2023.01.16.15.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 15:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=bIi8LtEq;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=kOjk3Ksx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZKq-0002mT-MU; Mon, 16 Jan 2023 18:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKp-0002lv-2A; Mon, 16 Jan 2023 18:56:15 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKn-0003mu-9I; Mon, 16 Jan 2023 18:56:14 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 33D7B32007D7;
 Mon, 16 Jan 2023 18:56:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 16 Jan 2023 18:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673913370; x=1673999770; bh=9R
 R7AqdkIyiM5lD+2y8tGjFSEwMYKEEfE+QBJh5nkFY=; b=bIi8LtEqp6P1M1EFPm
 xcf7c5hir+SPcRNW/K+YpUoygfUnySVEVj3gHs3HU9Sf9YE9az1H5/33eDVWz9ov
 QzTDb9USHYDvGrlPOZNNknfymfulBtsev0Jfo8AtKCL7oXMPsMN6sx/FX5cO/Q5j
 UfoK3/2NXhtoyxxHVrg51NYLgP2fbs8RDOFixhP4tsJ+N/Oi/atIIwGyMFrehvqy
 40A66+4TcRG/D/1IpUuc08GbGUDj0vfqCexMzYEpbhjIh8kTUV4D05jWBImas0RB
 c3J1kEbMe9L/nLrQsIseCCNg+2rFYYdHGT7RmJIuuoEOmVw1sdhMCqH0hrpboTql
 nOPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913370; x=1673999770; bh=9RR7AqdkIyiM5
 lD+2y8tGjFSEwMYKEEfE+QBJh5nkFY=; b=kOjk3KsxiJFpAStbNolyciwnEoov1
 yzX6ciSxZs2Onj8cQsDl5pHB1jS137mPT+TByqE+ZhAQVVNXT0E8lLG2gv5RV2QV
 JHJIfd3lxg8VzSzuJsZQ8zKIc8mEnC10Oaltv31EMkWVeltZnFE6gKg1O18n6k7i
 aY0ZUaoeg0itI6DVgCGS3YmJCynuSnFJroq3wUTQy3e2xiGxBA7RLGt6VYHyqebF
 Kt6Zb6sFOHmhLlfAEpZ4t7IfErZqvI34gufYibsUU5si1SvAZnImUoHsF+rKDeVJ
 gAtf7M3ATAooKwHCS59iyTq1qcBYumC34qdUr13qd6S3D9tWNIk1yNeJg==
X-ME-Sender: <xms:GuTFY1v5fjmqUBEykrXqWeQppz2ZgeEZeDU_xCGqXLKPOju7ddinVw>
 <xme:GuTFY-cJ8qDFASt3d55Fx2k0-A7oxIb2ZF5Mmdi9ZiCO_8COPf6szpdBpnZRY-zzj
 fOyART5B7-Bguw-tNs>
X-ME-Received: <xmr:GuTFY4wZSGajo61pJRN3ouqftcpCa3aU9Uio6cA3GpIqIH9qltOOcMO9GPf9pERk8NFyXYXOzH9N3rqRIYh9vKBJOmzv-OFzf5oU-K0XY0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:GuTFY8MUmo1Wyi3LfaNgBeoOgqvz08BmwH_R_X0FGYxYIByiGqr-VQ>
 <xmx:GuTFY1_NSTNhHB5SUv_L9at1vEGYuRSIWsNEQuKQTJa4TeUTirtAmw>
 <xmx:GuTFY8Vnalu6WLxqZDKraJBAiJbRsNWxD7XpKTPm_eW67IicKOFcyQ>
 <xmx:GuTFY-PbndA_yYutQdS6D5W50KXXemkX2eDcGVISA6fA0pXk3Oc_gQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:09 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/arm: Extract at24c_eeprom_init helper from Aspeed
 and Nuvoton boards
Date: Mon, 16 Jan 2023 15:56:00 -0800
Message-Id: <20230116235604.55099-2-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lGny5xxhc2SH

This helper is useful in board initialization because lets users initialize and
realize an EEPROM on an I2C bus with a single function call.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c                 | 10 +---------
 hw/arm/npcm7xx_boards.c         | 20 +++++---------------
 hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
 include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
 4 files changed, 28 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef729f..1f9799d4321e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -17,6 +17,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/sensor/tmp105.h"
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
@@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 6bc6f5d2fe29..9b31207a06e9 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
-{
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
-}
-
 static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
                                       NPCM7xxState *soc, const int *fan_counts)
 {
@@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 0x55, 8192);
 
     /*
      * i2c-11:
@@ -360,7 +350,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
-    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru */
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
-    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcfru */
 
     /* TODO: Add remaining i2c devices. */
 }
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 2d4d8b952f38..98857e3626b9 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/i2c/i2c.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
@@ -128,6 +129,17 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
     return 0;
 }
 
+I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
+{
+    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rom_size);
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+
+    return i2c_dev;
+}
+
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
new file mode 100644
index 000000000000..79a36b53ca87
--- /dev/null
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -0,0 +1,10 @@
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#ifndef EEPROM_AT24C_H
+#define EEPROM_AT24C_H
+
+#include "hw/i2c/i2c.h"
+
+I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+
+#endif
-- 
2.39.0

