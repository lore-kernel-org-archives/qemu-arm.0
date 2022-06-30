Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp254323lft;
        Thu, 30 Jun 2022 04:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uddlFTt5pptuyDlvrxLKBFtlYoLetsSRiHkJcOKZcaCiaaJHoLOIW+Eh2de0Scvpa1BZ9c
X-Received: by 2002:a05:620a:1a90:b0:6af:3a05:d68b with SMTP id bl16-20020a05620a1a9000b006af3a05d68bmr5844738qkb.434.1656588438504;
        Thu, 30 Jun 2022 04:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588438; cv=none;
        d=google.com; s=arc-20160816;
        b=ThIdxHtrjXxvKVaZm85KaEOZ3QmTT5DEaXxjRyfbnmzLPv2UPLuKvVUVamC73T3tLs
         273qWNGz05+F63GC9FmmxnODVcmPpF1Suqu4RdmF0OeLrMxYIgx9zuLIe5IT/4hPWktq
         y2xzDo+E32y9plk7hn92Rn7aVQkO50ntyFQmlYmTSIYOqNRLLzg+14W9emNjQEUnWYdk
         jpLxnLCm8rfEZnPFjYc8DGgjV9oRdmx+af9HSfJZ9maKkO+F3kvo9/dXcQ6Oxv/xsjlE
         lztPm2iNPI/iJhSEszAEyaD/7g8y5eO0X3fpYYFsy1FvJsYvvo9wsSswW6GwPCw3+nIJ
         vLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4Jc2K4kRZ9N6zZUNX490kb0QQChHLnTgBX/gQF13UWc=;
        b=tcZFkdr44cntssFLZU2NSz4OKWMvM9TSdm/SjtlH9Jyt+VuOvCNkwzw7q/L2295PHf
         CccPEROEZga0ye7p2XIOuOnQyJ+EEw6keK2DF1A25ckmTPxjtrilNpVKy0uaUVkdLjqe
         XpNNVOrr6LUVim3vt3R5gvmOfFViEKSu95/8YheLCO3V/1tTLDdX84okY4y4x7TPBngO
         Gx4n/T18F3zLgZMBWGwq1L9bg4tcnSK0jhGplJQDdyqRuCQJRikw8dEg6FSp+4LOHr8p
         B3PhJ/3KMKyecUNuBASKIx+MUFWSq3FUVBIRNp0MmNNT5JXYVRBrNrbTIVCav9zzAWEb
         0KHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05620a25c700b006a68fcaa6e2si12141955qko.734.2022.06.30.04.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:27:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sKL-00035w-T2
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHv-0007li-6O; Thu, 30 Jun 2022 07:24:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHt-00024n-01; Thu, 30 Jun 2022 07:24:46 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZy3trkz4xYS;
 Thu, 30 Jun 2022 21:24:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZw3bx0z4xD5;
 Thu, 30 Jun 2022 21:24:40 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/27] aspeed: Add memory property to Aspeed SoC
Date: Thu, 30 Jun 2022 13:23:53 +0200
Message-Id: <20220630112411.1474431-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: frlZ9t8/cJBO

From: Peter Delevoryas <pdel@fb.com>

Multi-SoC machines can use this property to specify a memory container
for each SoC. Single SoC machines will just specify get_system_memory().

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220624003701.1363500-3-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  1 +
 hw/arm/aspeed.c             |  4 ++++
 hw/arm/aspeed_ast10x0.c     |  5 ++---
 hw/arm/aspeed_ast2600.c     |  4 ++--
 hw/arm/aspeed_soc.c         | 12 +++++++-----
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e8a104823d35..c8e903b821db 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -49,6 +49,7 @@ struct AspeedSoCState {
     ARMCPU cpu[ASPEED_CPUS_NUM];
     A15MPPrivState     a7mpcore;
     ARMv7MState        armv7m;
+    MemoryRegion *memory;
     MemoryRegion *dram_mr;
     MemoryRegion dram_container;
     MemoryRegion sram;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index dc09773b0ba5..b43dc0fda853 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -329,6 +329,8 @@ static void aspeed_machine_init(MachineState *machine)
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_strap2,
                             &error_abort);
+    object_property_set_link(OBJECT(&bmc->soc), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
@@ -1336,6 +1338,8 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
     qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
 
+    object_property_set_link(OBJECT(&bmc->soc), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
     qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
                          amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5df480a21f39..e074f80cc742 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -148,7 +148,6 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
 {
     AspeedSoCState *s = ASPEED_SOC(dev_soc);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    MemoryRegion *system_memory = get_system_memory();
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
@@ -172,7 +171,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
-                             OBJECT(system_memory), &error_abort);
+                             OBJECT(s->memory), &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
@@ -181,7 +180,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(system_memory,
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM],
                                 &s->sram);
 
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a4d90daf3702..e4aa908faba6 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -291,7 +291,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
-                                 OBJECT(get_system_memory()), &error_abort);
+                                 OBJECT(s->memory), &error_abort);
 
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
@@ -329,7 +329,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(),
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
     /* DPMCU */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a53a0ca6d63a..502c23dd0218 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -243,7 +243,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
-                                 OBJECT(get_system_memory()), &error_abort);
+                                 OBJECT(s->memory), &error_abort);
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
@@ -256,7 +256,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(),
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
     /* SCU */
@@ -456,6 +456,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] = {
+    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
@@ -555,14 +557,14 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
     int i, uart;
 
     /* Attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
     for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
         if (uart == s->uart_default) {
             uart++;
         }
-        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+        serial_mm_init(s->memory, sc->memmap[uart], 2,
                        aspeed_soc_get_irq(s, uart), 38400,
                        serial_hd(i), DEVICE_LITTLE_ENDIAN);
     }
@@ -604,7 +606,7 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1000);
     }
 
-    memory_region_add_subregion(get_system_memory(),
+    memory_region_add_subregion(s->memory,
                       sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
     return true;
 }
-- 
2.35.3

