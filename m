Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2470230eja;
        Mon, 4 Mar 2024 01:13:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLn+T0FR4THGHzUhzLLBNFM7kTxTkXoqeiy+PGYVi8QNZAdHVk2vudsfT/29PGbPILjiBo8JINrinMhB2VHeWxYld/EmrZ
X-Google-Smtp-Source: AGHT+IH9v+1i3Dgm8D1iknlJ+lJ4J82B+jqlFbXU3GYoJKQ01QcnVflarZi4IBJ4fRZLcceUGmzd
X-Received: by 2002:ad4:4e21:0:b0:690:79b6:f44e with SMTP id dm1-20020ad44e21000000b0069079b6f44emr1229478qvb.35.1709543591229;
        Mon, 04 Mar 2024 01:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709543591; cv=none;
        d=google.com; s=arc-20160816;
        b=PKy9qeakfFRo0YML1fMNuKrxjwSXX4YYgjWMTczeTaXv2hGHEpV7EZSDYIlZjl/PYs
         qF64g/m4stf5LG0JcY8UEJT+qAEuoZMIpNGhViwerMzXkxW3OXhrYe6j8/YzNK5pBvCc
         ONOMTfGHDE5oJo3e8iNyr2GLSZF6yEjF6Dn7/vHrkKGrtsTyWcccIr9Ibj74grCaqDAt
         1aUKqCiDU29U+pE26mXAG5Ph22dKVS+zK9L+Qxnjloh5L+9olOaIWnc20IDC8ZWi4oYa
         2BvcMueNhprL+MAAvNQQXnzAfIGonCyrSXA/HilKnrEcwf1NssiLiW5pviiUn3EyC+mq
         Nv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Yi8l0UUyr5OQ3C1Ud7Q+0H+Jog/K/cSunla2/Tc9BLg=;
        fh=MGNs5MsPfS8GULtQe2qMcYQbAiZJSQuMQcVfuHK1z7k=;
        b=WjoQ/qway8WRso7u79PHvGmCInFeSnxOkh3PDJeLlus/Wi7CazbFixWHDHjWDYtb81
         z3dadhOpDcNvnMfWiVdoi9F3jnDrMeGQZoCnwAvAauFAsmgbFQAEe+KMzQsYMhUkLFlY
         OMT1Fj1kmbg2KrAupHMeOyjSmFUtWcq3ZNoXLgy9Kn0rMRSgD+FUbNeil2RMLQXBD2Ze
         tCWN8A+hW14Friz8V4MAQDYGVGeD8YuXoNzTCUYceQmPhsyovQfAbNZllGEzOYug1gqD
         fK8Y9QgG/KQ7UaQAoThaV+SVc2MEeBvfm6MMs/ruz7kQZCUerJMXqEBXpMxu7UZGyojx
         GPJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b0068ff18d776asi9127954qvh.296.2024.03.04.01.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 01:13:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh4NJ-0007PK-Tu; Mon, 04 Mar 2024 04:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4NI-0007Oi-Fg; Mon, 04 Mar 2024 04:12:44 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4NH-0003Bk-1d; Mon, 04 Mar 2024 04:12:44 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Mar
 2024 17:12:28 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Mar 2024 17:12:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 9/9] aspeed/soc: fix incorrect dram size for AST2700
Date: Mon, 4 Mar 2024 17:12:21 +0800
Message-ID: <20240304091221.1855398-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
References: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8C06C63RP9fc

AST2700 dram size calculation is not back compatible AST2600.
According to the DDR capacity hardware behavior,
if users write the data to address which is beyond the ram size,
it would write the data to address 0.
For example:
a. sdram base address "0x4 00000000"
b. sdram size is 1 GiB
The available address range is from "0x4 00000000" to "0x4 40000000".
If users write 0xdeadbeef to address "0x6 00000000",
the value of DRAM address 0 (base address 0x4 00000000) should be 0xdeadbeef.

Adds aspeed_soc_ast2700_dram_init to calculation the dram size and add
memory I/O whose address range is from max_ram_size - ram_size to max_ram_size
and its read/write handler to emulate DDR capacity hardware behavior.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c     | 94 ++++++++++++++++++++++++++++++++++++-
 include/hw/arm/aspeed_soc.h |  1 +
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index c120994e5c..b78ae9369e 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -20,6 +20,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/intc/arm_gicv3.h"
 #include "qapi/qmp/qlist.h"
+#include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
@@ -118,6 +119,97 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(a->intc.gic, sc->irqmap[dev]);
 }
 
+static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
+                                                    unsigned int size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: read @%" PRIx64 " out of ram size\n",
+                   __func__, addr);
+    return 0;
+}
+
+static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
+                                                unsigned int size)
+{
+    AspeedSoCState *s = ASPEED_SOC(opaque);
+    uint32_t test_pattern = 0xdeadbeef;
+    bool invalid_pattern = true;
+    uint32_t *ram_ptr;
+    int sz;
+
+    ram_ptr = memory_region_get_ram_ptr(s->dram_mr);
+
+   /*
+    * Emulate ddr capacity hardware behavior.
+    * If writes the test_pattern to address which is beyond the ram size,
+    * it would write the test_pattern to address 0.
+    */
+    for (sz = 4; sz > 0 ; sz--) {
+        test_pattern = (test_pattern << 4) + sz;
+        if (data == test_pattern) {
+            ram_ptr[0] = test_pattern;
+            invalid_pattern = false;
+            break;
+        }
+    }
+
+    if (invalid_pattern) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write invalid pattern @%" PRIx64
+                      " to addr @%" HWADDR_PRIx "]\n",
+                      __func__, data, addr);
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
@@ -362,7 +454,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_SDMC]);
 
     /* RAM */
-    if (!aspeed_soc_dram_init(s, errp)) {
+    if (!aspeed_soc_ast2700_dram_init(dev, errp)) {
         return;
     }
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index fab5abff9e..fae49f205b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -126,6 +126,7 @@ struct Aspeed27x0SoCState {
 
     ARMCPU cpu[ASPEED_CPUS_NUM];
     AspeedINTCState intc;
+    MemoryRegion dram_empty;
 };
 
 #define TYPE_ASPEED27X0_SOC "aspeed27x0-soc"
-- 
2.25.1

