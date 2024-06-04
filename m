Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718076ejs;
        Mon, 3 Jun 2024 22:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi7ZW2lnAQ9CsoBg+sr3KFGC4M9bp6L3YU43uv5QGQYCcYRIDJ2RNP0rMAEMbFO+PLOnsgG28n7XMQclYywnuc++l1NYEE
X-Google-Smtp-Source: AGHT+IE+Y1XyFT9sBpgQXCdqAQh7Gnz1MZB4L/noCY8oYTynxUT9WW/XfCy9l5uH45qDZN3Rjrmp
X-Received: by 2002:ac8:7e8f:0:b0:43d:f0f8:1985 with SMTP id d75a77b69052e-43ff5286d33mr116395781cf.28.1717480035412;
        Mon, 03 Jun 2024 22:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480035; cv=none;
        d=google.com; s=arc-20160816;
        b=zpKIhzL0HJUof7vOUPeMNCciFMbf2sE1Krun8MIeq9qYNRVfP4EHYNHUS7lgG/+5Xf
         MQtBh/7nVXZL9Vqzh4DQf1iveuANMEZS2p7NnstEgKuWTwu1xphJCfEXbe4SQBQmOxAY
         naNRZVD4Q16hwu7ay46QRg+xQoNs5A9OIIp2ht4geGoKIl6sbOP0/purytD68fTF+sU2
         NZ8Ex1fhq78EHQr5ebwuvbHfd+hZD+YtqdtceqqmfmgA9luVhOFAaVG0AAWRp/VmgITP
         ZqP8Q9yQRQASKa/NTq5fwU51ofkppX96Ax2Tru35FbNdMYlfV7N9ZvbcVGAZLCq0/YXy
         sbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hiiC/8O+IdKhvJdirgsTXWhK0Qys4ljXa9eh3bSj/mQ=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=NwcouiWBHPR7BfwH3jAMzosyXFBSHv+8ffGf/2CWnt3vB/NDIZnu7PfgOW48o7JA/D
         HNbJG+nJk0HTO6bT3KD6VZJcg/1jBNU49ICyJUcQx4z4tpMGvEW+jCzZ7rlLdffDj6be
         cUYVtu3NjahSmURBL3A6o8683TeYUJsjiSKBzJT0WpzqEaS+covjbpVKCRAjvS7Gw2hI
         hqBEa7dxA5yuK7lwU7xYAKv1hd3jjoxgQtuo1BA5g1DgtG+xPHnoqp5Y5nYvXwA8o1Us
         cx23jjVVAMxtmaLB6C2ouYm8In+WY1R5bV6pYH/cDDcvuwNLWhzgABtSt4EFLFs0imTO
         WV4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff257f12asi12836081cf.471.2024.06.03.22.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEN0A-0006zJ-6R; Tue, 04 Jun 2024 01:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMzf-0006Xr-Po; Tue, 04 Jun 2024 01:46:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMze-0000ML-2i; Tue, 04 Jun 2024 01:45:59 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:47 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:47 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 15/17] aspeed/soc: fix incorrect dram size for AST2700
Date: Tue, 4 Jun 2024 13:44:36 +0800
Message-ID: <20240604054438.3424349-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yK0HkO37ilRy

AST2700 dram size calculation is not back compatible AST2600.
According to the DDR capacity hardware behavior,
if users write the data to the address which is beyond the ram size,
it would write the data to the "address % ram_size".
For example:
a. sdram base address "0x4 00000000"
b. sdram size 1 GiB
The available address range is from "0x4 00000000" to "0x4 3FFFFFFF".
If users write 0x12345678 to address "0x5 00000000",
the value of DRAM address 0 (base address 0x4 00000000) will be 0x12345678.

Add aspeed_soc_ast2700_dram_init to calculate the dram size and add
memory I/O whose address range is from "max_ram_size - ram_size" to max_ram_size
and its read/write handler to emulate DDR capacity hardware behavior.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c     | 87 ++++++++++++++++++++++++++++++++++++-
 include/hw/arm/aspeed_soc.h |  2 +
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 29e75072c4..b6876b4862 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -20,6 +20,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/intc/arm_gicv3.h"
 #include "qapi/qmp/qlist.h"
+#include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
@@ -191,6 +192,90 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&a->gic), sc->irqmap[dev]);
 }
 
+static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
+                                                    unsigned int size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: DRAM read out of ram size, addr:0x%" PRIx64 "\n",
+                   __func__, addr);
+    return 0;
+}
+
+static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
+                                                unsigned int size)
+{
+    AspeedSoCState *s = ASPEED_SOC(opaque);
+    ram_addr_t ram_size;
+    MemTxResult result;
+
+    ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
+                                        &error_abort);
+
+    /*
+     * Emulate ddr capacity hardware behavior.
+     * If writes the data to the address which is beyond the ram size,
+     * it would write the data to the "address % ram_size".
+     */
+    result = address_space_write(&s->dram_as, addr % ram_size,
+                                 MEMTXATTRS_UNSPECIFIED, &data, 4);
+    if (result != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: DRAM write failed, addr:0x%" HWADDR_PRIx
+                      ", data :0x%" PRIx64  "\n",
+                      __func__, addr % ram_size, data);
+    }
+}
+
+static const MemoryRegionOps aspeed_ram_capacity_ops = {
+    .read = aspeed_ram_capacity_read,
+    .write = aspeed_ram_capacity_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
+
+/*
+ * SDMC should be realized first to get correct RAM size and max size
+ * values
+ */
+static bool aspeed_soc_ast2700_dram_init(DeviceState *dev, Error **errp)
+{
+    ram_addr_t ram_size, max_ram_size;
+    Aspeed27x0SoCState *a = ASPEED27X0_SOC(dev);
+    AspeedSoCState *s = ASPEED_SOC(dev);
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
+                                        &error_abort);
+    max_ram_size = object_property_get_uint(OBJECT(&s->sdmc), "max-ram-size",
+                                            &error_abort);
+
+    memory_region_init(&s->dram_container, OBJECT(s), "ram-container",
+                       ram_size);
+    memory_region_add_subregion(&s->dram_container, 0, s->dram_mr);
+    address_space_init(&s->dram_as, s->dram_mr, "dram");
+
+    /*
+     * Add a memory region beyond the RAM region to emulate
+     * ddr capacity hardware behavior.
+     */
+    if (ram_size < max_ram_size) {
+        memory_region_init_io(&a->dram_empty, OBJECT(s),
+                              &aspeed_ram_capacity_ops, s,
+                              "ram-empty", max_ram_size - ram_size);
+
+        memory_region_add_subregion(s->memory,
+                                    sc->memmap[ASPEED_DEV_SDRAM] + ram_size,
+                                    &a->dram_empty);
+    }
+
+    memory_region_add_subregion(s->memory,
+                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
+    return true;
+}
+
 static void aspeed_soc_ast2700_init(Object *obj)
 {
     Aspeed27x0SoCState *a = ASPEED27X0_SOC(obj);
@@ -461,7 +546,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_SDMC]);
 
     /* RAM */
-    if (!aspeed_soc_dram_init(s, errp)) {
+    if (!aspeed_soc_ast2700_dram_init(dev, errp)) {
         return;
     }
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index caef0d100b..849ba37f95 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -59,6 +59,7 @@ struct AspeedSoCState {
     MemoryRegion sram;
     MemoryRegion spi_boot_container;
     MemoryRegion spi_boot;
+    AddressSpace dram_as;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
@@ -129,6 +130,7 @@ struct Aspeed27x0SoCState {
     ARMCPU cpu[ASPEED_CPUS_NUM];
     AspeedINTCState intc;
     GICv3State gic;
+    MemoryRegion dram_empty;
 };
 
 #define TYPE_ASPEED27X0_SOC "aspeed27x0-soc"
-- 
2.25.1

