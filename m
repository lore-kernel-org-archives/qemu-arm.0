Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7601146njd;
        Wed, 9 Apr 2025 03:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpm7R55ZQfZqPBTgpqx2Pmn/C3rVYoblFTjD8upfyxeJ0/BLdiiVjeFyuMOnpudR952tEoLcqf04pTwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEmwltpmoq/oVNLUQZm9FXalQ1mN64ZGRu99YXgo0H1ThbNg9ein1DZDuv4rJmDmNPYGs6k
X-Received: by 2002:a05:622a:1a9d:b0:478:de12:14f6 with SMTP id d75a77b69052e-479600c74cfmr29618241cf.31.1744192875064;
        Wed, 09 Apr 2025 03:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192875; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZuQCXXYmrK/TI3fFfAsEfJGC6r+utIIQ4PGyd9AV7MoxuduiKZtz3sA2Uwh5NvPq1
         iajdF9r8qwB+NDZWT+bgB2HZkwmzYn+QBrq7JTSmHmwDy7NeE0YnAzjjg1tDXMez05NH
         8GT1vZ0Rd7PSI1wyiVYn+EnHAeatERmzB+WVj+Sq3m/FCV7GNWqAj8TR5HIyIWG7mQOx
         acZYUw+33HerrVHLLuBugfHD6rOTj7Ca9sn+IXm7GP0ZpxUjrsxo17ciWXj1H2rugb3o
         EqGnslgBjSZ0SxAICsFLf0k+181MBs3pZO/OmUelYeGI5SOhMYqhZtetNPeb5iRFsA1v
         JA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=iuiyeA382qpql8ri4f4K9qX62ldJ6xVrOZBRlakcIq4=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=NhN1vSa0xYhb5vxvp3UUSY7irgufJvIYQalIR2QLtPrEbX2iO2MjYJ8vt5sXoOUVpG
         A+DHQvXjb6bcTNGiz7APYrPnkZM2IUky1yT0qdovLKbBA6n5p+2OmM3yMViP2+Y957Kv
         BzFu1e6kKlDOPrP0XZqBTz7rjIa1RKnFLGDtlvRwT8XACrAfQC/uRyS1fCtWvJeBQWki
         QJVovXed+DY0vNqdZSMNcTjWk2bJj1KcB28hKofnFC0KGNTHDT0fEq4upQMKpX9orP6X
         MHEvSAPOTzcHONrM6GQupAUDGuNxrKJMqbmsDVOEez1zVtbND5NAZFp0R9MvC25YfL2e
         snTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47964f07430si6650151cf.460.2025.04.09.03.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2SF0-0006lh-6b; Wed, 09 Apr 2025 06:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEt-0006Tk-IF; Wed, 09 Apr 2025 06:01:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEr-0006jO-VC; Wed, 09 Apr 2025 06:00:59 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 3/9] hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
Date: Wed, 9 Apr 2025 18:00:31 +0800
Message-ID: <20250409100039.2391847-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: aeR7ag7gAE4/

Introduce a new vbootrom memory region. The region is mapped at address
"0x00000000" and has a size of 128KB, identical to the SRAM region size.
This memory region is intended for loading a vbootrom image file as part of the
boot process.

The vbootrom region is initialized as ROM and registered in the SoC's address
space using the ASPEED_DEV_VBOOTROM index.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/arm/aspeed_soc.h |  1 +
 hw/arm/aspeed_ast27x0.c     | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 432f6178ac..9af8cfbc3e 100644
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
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index c7188ae5f1..0982e63639 100644
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
+    if (!memory_region_init_rom(&s->vbootrom, OBJECT(s), name,
+                                sc->vbootrom_size, errp)) {
+        return;
+    }
+    memory_region_add_subregion(s->memory,
+                                sc->memmap[ASPEED_DEV_VBOOTROM], &s->vbootrom);
+
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
-- 
2.43.0

