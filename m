Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858355njd;
        Wed, 23 Apr 2025 00:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX98cfLIDdmMGVSM8bpkZYu4dF9mbOHwgm9Yii8jSenCdVEkM1Q8UV0K+TV6iB0jN0OOMtFaM+qiqk3Pg==@linaro.org
X-Google-Smtp-Source: AGHT+IGkiyXDU2HHP1fBsJ/oLpVH3KJj7DjbOfkrvFZW/S0YxIkgFaEbXA5ogix2ZNhiwmaO6KjS
X-Received: by 2002:a05:620a:a005:b0:7c9:3085:f848 with SMTP id af79cd13be357-7c93085f9bcmr1771217285a.13.1745393111465;
        Wed, 23 Apr 2025 00:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393111; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyMRHHwATnTOP2ppSKJws7/qwWHX7KGElsmu5eEJ5NWdFKXSz8i6beQ258VEF81ptU
         2Mg6iQyudp901Kc1WI7qGxzpuGfK4g6DF5JZCm+ALEanL4MzpEfdSBMmggj4FZ07YwJf
         j9BCQXuiMIpq5+l/nOguglS6G8RuGz0SejwyXlR15SYfCiYCd9l+K9CRE7v0PmAVeGze
         v2P7EgrP9aHGJsIhoKYRhwTdgWDknLfj0u3xYD9SgVH7BAqtZkHQ5EKtIZya6XFQmTEI
         g84TJiSZ/yImEAS0X3B2GLrTy/p/BRvm+oCyPFDZnW2/yflhXrNLo0/h3cr1ZMoTckt1
         O6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Z+4JRriFrdTglSsvy5f+WfdZ44yaCDD3vBpc2cnKSEw=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=OYcLBEJ2C4w/nANL9mhzTQH1xI2aUpAp7wq1AKT8DNmfp5UIjDRV2vC/6xcIgFInh9
         yA4wiRa5niWIpifw4hplZ4LZkk3Kpi7yBXizD40WvDi3m/SJibGUfivM17ttFgc1SMab
         RWIL2Zcs41DSrF4S9ETmE1hY9/IBwN62vRB2y9+6SUd1eSmaYR92J7Pv8j92MaKOqu7K
         F6RN3cxO+2iqEGPOpq5ZYx4jfIqUrjbAGzbM2PxCkyybrP93yoTVKdQ4TainH57fAIKE
         nlh9TMbaRxf8y3WDNBWQBNe9wo0bqd5DX96Uk0Gbl8tgaLBRt1DH1PqiWIKukBVB5vIc
         voeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925bfeecasi1224293685a.606.2025.04.23.00.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7USo-0002ba-MS; Wed, 23 Apr 2025 03:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USm-0002b5-HO; Wed, 23 Apr 2025 03:24:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USk-0001IR-Uk; Wed, 23 Apr 2025 03:24:08 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 15:23:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 23 Apr 2025 15:23:51 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v5 02/11] hw/arm/aspeed_ast27x0 Introduce vbootrom memory
 region
Date: Wed, 23 Apr 2025 15:23:38 +0800
Message-ID: <20250423072350.541742-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ciIxg8bP4Tgg

Introduce a new vbootrom memory region. The region is mapped at address
"0x00000000" and has a size of 128KB, identical to the SRAM region size.
This memory region is intended for loading a vbootrom image file as part of the
boot process.

The vbootrom registered in the SoC's address space using the ASPEED_DEV_VBOOTROM
index.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
---
 include/hw/arm/aspeed_soc.h | 2 ++
 hw/arm/aspeed_ast27x0.c     | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f069d17d16..b4b23d693d 100644
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
@@ -169,6 +170,7 @@ struct AspeedSoCClass {
 const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 
 enum {
+    ASPEED_DEV_VBOOTROM,
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
     ASPEED_DEV_UART0,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b05ed75ff4..968dfa5526 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_HACE]      =  0x12070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
@@ -657,6 +658,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
+    /* VBOOTROM */
+    if (!memory_region_init_ram(&s->vbootrom, OBJECT(s), "aspeed.vbootrom",
+                                0x20000, errp)) {
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

