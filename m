Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087612njc;
        Tue, 15 Apr 2025 20:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWFL9g5F2cpYJb0kivVSzi+ID0xHKjPiG7iq3OnwmBk9iygLXFr3mJtvPO1TdPa8Ng9Roi+I+zk/LGFg==@linaro.org
X-Google-Smtp-Source: AGHT+IEIhDUQLK95VYjn9GKKfQu1/tusq/i4z9cT5qrO2qX3N2P2KXotUeKELm52MS+XrR4h6SEv
X-Received: by 2002:a05:6214:4004:b0:6ed:1da2:afb9 with SMTP id 6a1803df08f44-6f2b2f8bd86mr4559206d6.19.1744775040100;
        Tue, 15 Apr 2025 20:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775040; cv=none;
        d=google.com; s=arc-20240605;
        b=YUs6N/XroMRGOlqO22UP94qFpAvS/AzG/0Uqo7gbnU6xsI8AwtZ+iBGLIG43eIplHq
         Ne1gd5y4qan9jlAqrVLLYylMEMavGs/wwtDM8wP+cFQXVxUPo5XoScK5jLz7x08+SLV3
         eBx9mAcLsJYbCwgvsf2rKVyHgcoJHx7R7mBp9fMsTwk3EZMlkkKUCrp9pFIViRnV0i3g
         IeS9+p8fXJG2WYT18S1mD7L4WtcTgE9zkjVRo4PqHAi4rq272DhgQ34G9ej0coeuOZg5
         T9AXJiuTvqnqzlSb+BxUHVQTgulDYtmRcAhhlmiz7sfo+v0CfVcvtY7pqRMNxFnM3ROA
         tr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=YhDjLbQyugfKoG4IZcof7BM/+sCxLpt3JmWAIDTimpI=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=OQrKmqWh/V1YX0NDVJfAGd55e/Fvuypjlh0rh0R/03L0gmM8tAWzk8kX2eb3yaYxn/
         9gPJauaqTTsAirDT604PtUR17W9pcfqfgKuYPB7bXHBUmaSS8YaSw9iJ6eIaC+JQvDN2
         FPWJqiMEDgp1B+EgihwCDTmx0BOJrWA46n0nRSpjukPzYadiLTHRkg7/iaVfj9vGm31x
         y+eU5YJab6/0nYxCHprNDa2dRMEeEfUZPHded7Gafi6k0smwdRUGWRlDTenIMaqs8hKD
         4Fn0pjp1wjvcpIFIt2URU+r3EPqUlBbgU9ojgESrLwKrzG6o58yIbVKIp4RSuKkSLZik
         OepQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0ec23a920si115578936d6.476.2025.04.15.20.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4tgo-0001nN-RI; Tue, 15 Apr 2025 23:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgl-0001n2-TP; Tue, 15 Apr 2025 23:43:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgj-0006uD-Fu; Tue, 15 Apr 2025 23:43:50 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:28 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 02/10] hw/arm/aspeed_ast27x0 Introduce vbootrom memory
 region
Date: Wed, 16 Apr 2025 11:43:17 +0800
Message-ID: <20250416034327.315714-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xCB58faUS/tD

Introduce a new vbootrom memory region. The region is mapped at address
"0x00000000" and has a size of 128KB, identical to the SRAM region size.
This memory region is intended for loading a vbootrom image file as part of the
boot process.

The vbootrom registered in the SoC's address space using the ASPEED_DEV_VBOOTROM
index.

Introduced a "vbootrom_size" attribute in "AspeedSoCClass" to define virtual
boot ROM size.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast27x0.c     | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f069d17d16..9af8cfbc3e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -59,6 +59,7 @@ struct AspeedSoCState {
     MemoryRegion sram;
     MemoryRegion spi_boot_container;
     MemoryRegion spi_boot;
+    MemoryRegion vbootrom;
     AddressSpace dram_as;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
@@ -152,6 +153,7 @@ struct AspeedSoCClass {
     const char * const *valid_cpu_types;
     uint32_t silicon_rev;
     uint64_t sram_size;
+    uint64_t vbootrom_size;
     uint64_t secsram_size;
     int spis_num;
     int ehcis_num;
@@ -169,6 +171,7 @@ struct AspeedSoCClass {
 const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 
 enum {
+    ASPEED_DEV_VBOOTROM,
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
     ASPEED_DEV_UART0,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b05ed75ff4..7eece8e286 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_HACE]      =  0x12070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
@@ -657,6 +658,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
+    /* VBOOTROM */
+    name = g_strdup_printf("aspeed.vbootrom.%d", CPU(&a->cpu[0])->cpu_index);
+    if (!memory_region_init_ram(&s->vbootrom, OBJECT(s), name,
+                                sc->vbootrom_size, errp)) {
+        return;
+    }
+    memory_region_add_subregion(s->memory,
+                                sc->memmap[ASPEED_DEV_VBOOTROM], &s->vbootrom);
+
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
@@ -898,6 +908,7 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
 
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2700_A0_SILICON_REV;
+    sc->vbootrom_size = 0x20000;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
     sc->wdts_num     = 8;
@@ -925,6 +936,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, void *data)
 
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2700_A1_SILICON_REV;
+    sc->vbootrom_size = 0x20000;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
     sc->wdts_num     = 8;
-- 
2.43.0

