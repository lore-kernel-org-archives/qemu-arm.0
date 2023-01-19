Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296358ejc;
        Thu, 19 Jan 2023 04:36:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3ygM+Vud5hBIgEisc01aNfL9agAaQ0GljupEN+Iilcms/kx2/w3VitKem4C0TCz6w28HJ
X-Received: by 2002:ac8:67d7:0:b0:3b2:e9c2:37f3 with SMTP id r23-20020ac867d7000000b003b2e9c237f3mr15753021qtp.16.1674131777916;
        Thu, 19 Jan 2023 04:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131777; cv=none;
        d=google.com; s=arc-20160816;
        b=WYk/CtPwUlU6pkkLYfuEmX905Ad9lqvxEzMrmPVsF4DyYhpNl75XkciMX19U4aMq57
         UsYOMOrPAWw65jwJpYl3E7An3WLt2cMrX5cWchSGx8qBUZ1TuaVpGEVE8QXNB5tc0TDT
         J1vHQmy9AYHFlNeGqQKxomdiPIW0mDQU2VTRvPYhO2qQGmR2/2ZxzWPnzWbcXcGTT27N
         DuPsXJwhV3XJiDNR0aPC2Tco9H+ytkxDWtWHki+NPxbvR21JSZLKrNvj83fg5wz4pwcz
         vlgtjSbjwHjTAQJ/8cMB8FHQd0kmWmaGD+5+4RGnMZhh08iL3c2p9fmMDmin86n9Q+tV
         qLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=68sfN0VrK+i6SZ3h+ySgG2wZoEw9UEgzhE/s2R7NaAc=;
        b=oweYkVAgBJlZ7tUmrmW6MWauJxV7Bo8dgBjU0399/ngNDYWutZsEcnYEIbzF80s4f2
         s+FULMSDp1uLRonJkrAUFGmLxaw7gU6IJRX4UlRAvkjSo2Tb3EQ3w2bFB5hyQjdh0Ypp
         HbTAF67TTo+/Uw5kt8Vp21ST7IjGZHX2fg85YDxuhMVIV8HkZKY33NQLppDnTyQiHevQ
         lZlfxLeDJ8sqsbzUZOGRU9Z/EpgxeR/VpFkyj3kReWW/YAswccSgjo5nJEY2AdlyldCU
         fP4O6to+E2AlV2SokA7N8dbvrDV8D9tE+cOvuR2DpPIvxPWMeyu76NYQBGxOs8OHINiz
         qLCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ac8474f000000b003a53df740besi22252282qtp.632.2023.01.19.04.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8w-0006tR-Pr; Thu, 19 Jan 2023 07:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8v-0006nT-6Q; Thu, 19 Jan 2023 07:35:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8s-0007dk-Gg; Thu, 19 Jan 2023 07:35:44 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMY813rJz4xN1;
 Thu, 19 Jan 2023 23:35:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMY566YMz4xN4;
 Thu, 19 Jan 2023 23:35:37 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH 13/25] hw/arm/aspeed: Add aspeed_eeprom.c
Date: Thu, 19 Jan 2023 13:34:37 +0100
Message-Id: <20230119123449.531826-14-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: SUodzDsKvYtP

From: Peter Delevoryas <peter@pjd.dev>

- Create aspeed_eeprom.c and aspeed_eeprom.h
- Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
- Include aspeed_eeprom.h in aspeed.c
- Add fby35_bmc_fruid data
- Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM with data
  from aspeed_eeprom.c

wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
...
user: root
pass: 0penBmc
...
root@bmc-oob:~# fruid-util bb

FRU Information           : Baseboard
---------------           : ------------------
Chassis Type              : Rack Mount Chassis
Chassis Part Number       : N/A
Chassis Serial Number     : N/A
Board Mfg Date            : Fri Jan  7 10:30:00 2022
Board Mfg                 : XXXXXX
Board Product             : Management Board wBMC
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : N/A
root@bmc-oob:~# fruid-util bmc

FRU Information           : BMC
---------------           : ------------------
Board Mfg Date            : Mon Jan 10 21:42:00 2022
Board Mfg                 : XXXXXX
Board Product             : BMC Storage Module
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : Config A
root@bmc-oob:~# fruid-util nic

FRU Information           : NIC
---------------           : ------------------
Board Mfg Date            : Tue Nov  2 08:51:00 2021
Board Mfg                 : XXXXXXXX
Board Product             : Mellanox ConnectX-6 DX OCP3.0
Board Serial              : XXXXXXXXXXXXXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXXXXXXXXX
Board FRU ID              : FRU Ver 0.02
Product Manufacturer      : XXXXXXXX
Product Name              : Mellanox ConnectX-6 DX OCP3.0
Product Part Number       : XXXXXXXXXXXXXXXXXXXXX
Product Version           : A9
Product Serial            : XXXXXXXXXXXXXXXXXXXXXXXX
Product Custom Data 3     : ConnectX-6 DX

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
[ clg: Re-introduced len variables for each array ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_eeprom.h | 19 ++++++++++
 hw/arm/aspeed.c        | 10 ++++--
 hw/arm/aspeed_eeprom.c | 81 ++++++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build     |  1 +
 4 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.h
 create mode 100644 hw/arm/aspeed_eeprom.c

diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
new file mode 100644
index 0000000000..1048e244fc
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#ifndef ASPEED_EEPROM_H
+#define ASPEED_EEPROM_H
+
+#include "qemu/osdep.h"
+
+extern const uint8_t fby35_nic_fruid[];
+extern const size_t fby35_nic_fruid_len;
+extern const uint8_t fby35_bb_fruid[];
+extern const size_t fby35_bb_fruid_len;
+extern const uint8_t fby35_bmc_fruid[];
+extern const size_t fby35_bmc_fruid_len;
+
+#endif
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e6d541ad0f..d07fe702d9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/aspeed_eeprom.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
@@ -952,9 +953,12 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
 
     at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
     at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
-    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
-    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init_rom(i2c[8], 0x50, 32 * KiB, fby35_nic_fruid,
+                          fby35_nic_fruid_len);
+    at24c_eeprom_init_rom(i2c[11], 0x51, 128 * KiB, fby35_bb_fruid,
+                          fby35_bb_fruid_len);
+    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
+                          fby35_bmc_fruid_len);
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
new file mode 100644
index 0000000000..ed50e97d52
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.c
@@ -0,0 +1,81 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#include "aspeed_eeprom.h"
+
+const uint8_t fby35_nic_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0xd7,
+    0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xdd,
+    0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f, 0x6e,
+    0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20, 0x4f,
+    0x43, 0x50, 0x33, 0x2e, 0x30, 0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xcc, 0x46, 0x52, 0x55, 0x20, 0x56, 0x65, 0x72,
+    0x20, 0x30, 0x2e, 0x30, 0x32, 0xc0, 0xc0, 0xc0, 0xc1, 0x00, 0x00, 0x2f,
+    0x01, 0x11, 0x19, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0xdd, 0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f,
+    0x6e, 0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20,
+    0x4f, 0x43, 0x50, 0x33, 0x2e, 0x30, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xd3, 0x41, 0x39, 0x20, 0x20, 0x20, 0x20, 0x20,
+    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+    0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xc0, 0xc0, 0xc0, 0xc0, 0xcd, 0x43, 0x6f, 0x6e, 0x6e, 0x65, 0x63,
+    0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0xc1, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0xdb, 0xc0, 0x82, 0x30, 0x15, 0x79, 0x7f, 0xa6, 0x00,
+    0x01, 0x18, 0x0b, 0xff, 0x08, 0x00, 0xff, 0xff, 0x64, 0x00, 0x00, 0x00,
+    0x00, 0x03, 0x20, 0x01, 0xff, 0xff, 0x04, 0x46, 0x00, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0x01, 0x81, 0x09, 0x15, 0xb3, 0x10, 0x1d, 0x00,
+    0x24, 0x15, 0xb3, 0x00, 0x02, 0xeb, 0x8a, 0x95, 0x5c,
+};
+const size_t fby35_nic_fruid_len = G_N_ELEMENTS(fby35_nic_fruid);
+
+const uint8_t fby35_bb_fruid[] = {
+    0x01, 0x00, 0x01, 0x03, 0x10, 0x00, 0x00, 0xeb, 0x01, 0x02, 0x17, 0xc3,
+    0x4e, 0x2f, 0x41, 0xc3, 0x4e, 0x2f, 0x41, 0xc1, 0x00, 0x00, 0x00, 0x23,
+    0x01, 0x0d, 0x00, 0xb6, 0xd2, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xd5, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x6d, 0x65, 0x6e, 0x74,
+    0x20, 0x42, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x77, 0x42, 0x4d, 0x43, 0xcd,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa8, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x4e, 0x2f,
+    0x41, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43,
+};
+const size_t fby35_bb_fruid_len = G_N_ELEMENTS(fby35_bb_fruid);
+
+const uint8_t fby35_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
+const size_t fby35_bmc_fruid_len = G_N_ELEMENTS(fby35_bmc_fruid);
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 76d4d650e4..f70e8cfd45 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
+  'aspeed_eeprom.c',
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
-- 
2.39.0

