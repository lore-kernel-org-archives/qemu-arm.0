Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511273njk;
        Wed, 16 Apr 2025 20:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfYghKIDaTkdnJzEALu5G5JhxqjTxu4BgV1dweYK5OYBnW7tS6E5mLxkYNCROXGH2cQuJZwpLXHSJfZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE8k3fWbG12oin3yrk+2yR/ROrb6GWwfHrZGMdRMWj9iJPVv+ELS4saooXfP4E4C428qv+t
X-Received: by 2002:a05:6214:23c7:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2ba6897ecmr18748206d6.12.1744859547988;
        Wed, 16 Apr 2025 20:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859547; cv=none;
        d=google.com; s=arc-20240605;
        b=jxvrI6ZcMuY+PyT67nm3jDVuFP4Yqv1NlRqYANNdFGc10Llh+rBvRSSpDny8dzHTL4
         TU6285mrwUFnzTCRXqmWgbXwBS/IjlZp4WET9G8cpiTlw30zmUzUTV3THKVPfEZi6JdW
         3l4Cd0kSlDGVgst2ta666BwT+dFhe8j8+SxNwPh5JyUrNM2QQtZrFYbEyJS3jLTQj4N0
         i5vHv1MtHdjBft8RxX0Iwx55bBVTHdYBCy+MIK1sNFlEImF9A1DSTlBXO+/N2qCGSHpS
         q4seNEdgxtRYp6zgjODbXRNmqRV9uP82W+L4MpfdTXfXPNZnBp/OrUJJQPqREk3Ki/Ct
         mkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dTkchtQZ7IiyYjlxtntB8jYmhEB9jbFbirsjbxnj7Zk=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=iB0xM23gH88C4Lm/1+R7zV11wYrM1X5QAeFVwofLenGoEvAeNsMEEQ0YIEFh+32duH
         kzb8+JN1g9UVrFEK+TPhLnFeWczpSP/XHk4GWNH6AXiYEBiM+Z/u5t6FQY7pqqnvmjHe
         NHX/QjZEAgcwKHSPKB0GwlVz3EV4H9asZvIkHfJtg+G432Bj0DOYEBspxW499yEyGKT2
         sRaOq+nP2EsG56LKFI+dGE/tX3OEeBrVHDn/tOXj+VlszJREchP8Hv3vMloC+HT2eu8g
         HX0g836RtDLzq3Xn/BicHj7467pQmrbey+sCBxC5x2tnlf9vrujUmkFUhDmHEOm0t+Xk
         jaxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47983d34745si112024531cf.14.2025.04.16.20.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:12:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Ffr-0000pG-W3; Wed, 16 Apr 2025 23:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffp-0000o1-LT; Wed, 16 Apr 2025 23:12:21 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffo-0000cO-1b; Wed, 16 Apr 2025 23:12:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v4 02/10] hw/arm/aspeed_ast27x0 Introduce vbootrom memory
 region
Date: Thu, 17 Apr 2025 11:11:59 +0800
Message-ID: <20250417031209.2647703-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
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
X-TUID: RoJ1Uav5ttsD

Introduce a new vbootrom memory region. The region is mapped at address
"0x00000000" and has a size of 128KB, identical to the SRAM region size.
This memory region is intended for loading a vbootrom image file as part of the
boot process.

The vbootrom registered in the SoC's address space using the ASPEED_DEV_VBOOTROM
index.

Introduced a "vbootrom_size" attribute in "AspeedSoCClass" to define virtual
boot ROM size.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
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

