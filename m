Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp950063wrp;
        Thu, 14 Feb 2019 05:02:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbnO6+ve29/XBAA6zqPpukBxAby3oiLSgPkv+34LzC059xY61y4ko1/yTVqa+EnTX01Fy95
X-Received: by 2002:a25:3c41:: with SMTP id j62mr2958125yba.263.1550149368765;
        Thu, 14 Feb 2019 05:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149368; cv=none;
        d=google.com; s=arc-20160816;
        b=mbCRDsCdnbCoOZf3QaoWIb1Y0jTE1y398fUBSMjlmfrtG2HF5G2HTzc+cnVTyD2aAn
         0mi8MKvqtYnUPw0XS9lXLPAAXNwWj9RjpfWgq4SIps+lhqm2CXGQ+ddONDnkQdnsyRib
         L+YBDkXXgKFMXryA3xOCLlnD2dhSmnMgsIkZMM3YBQmt648OdTPiMEdDoZvgXDS2gc1R
         7GBWiu+ciSDuH3TjriKkNp2TgJBYcD8cQmfOvQMn4Ip/Fz3Wk9YU9a20VYqxwmMC1hsw
         ex5z14GnPSkVO07nk4TkVovBmHKQuUCmIGSinSfqItTqQgAjgxZuIkDu9wIDAMDDnOip
         bbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=SAS7c3NHgx+SQKlm+sDAr0gChkJR6CgxyAh5pRIpxIM=;
        b=TwPIEurLxc1Zw2UndwHTpGsLgsP6D/wLVoBIDFv8p9V9J6QMcO+9gznYOVBlzbNW3L
         AEh3oxXsPAAWH8NYP8Vi5oh9Ib6M9MEe6SbKBSKjhBxrxfbq9hZ74ib6H3c16laRVu2c
         QH4SkkF6Q+yTKHM+1QlLm3tOTA7+1L/2L2zcGT9HRBN+M9/AqbXwuCRy/bI+yHVWkmwn
         SS94TG2I55ueHMyH1aGs+NSllLZ74FE4OkfcEcPkj2dnPG6sLKx/JTDAh3iyV3gGLY+6
         ysTFGUzHR7vAhL4OCFVkm/6HyNLV1GSKEiV2lCg8Sw0+qPHRxEB13sSr8oXspxoeX8JZ
         U6HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o0rYZSBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i196si1561476ywc.3.2019.02.14.05.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o0rYZSBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGfA-0003bh-4u
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:02:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeO-0002tX-Rf
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-00071F-7F
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:57 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUc-0006hV-CA
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:55 -0500
Received: by mail-wr1-x442.google.com with SMTP id i12so6395202wrw.0
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SAS7c3NHgx+SQKlm+sDAr0gChkJR6CgxyAh5pRIpxIM=;
	b=o0rYZSBTLaUG5q49MQoTySeXjvJGCyjkaUCm5W0lnzfC0B0xHfbD7Bk2F36fgLgi77
	fBTqT5/P2uRc01nX7ROaRk/ipcRQgQHhxza6P5COmWudUS5ThD95X+0C1+XaD7FCH/VP
	YIZ6VWUJIePQKWcabgsI08hB1zw5wSxCiRxJMXsPWF5ra+OHYRc2vDvuHY0jXKUqdTWN
	t7rtIw5U/irtrxH0UHk4T9IRFQQEwM8FqDLJjDTBx/O5CGwC0u3NGLxUbBYl61N+4rNc
	jUB0XKrOitSaA+AUKFMl515HS37Afj5TlYIFg6EVvzmhzKA4otOBK3g4nvnabLNvzb80
	388A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SAS7c3NHgx+SQKlm+sDAr0gChkJR6CgxyAh5pRIpxIM=;
	b=GRUpdo9pY+7Rgd9/tTxCs2jE/hYje+Rh/uu4RdynrPmcxawQ54gbPyghUgpnHPCBYl
	us2IY+UYpEzabShiyx6S2iwZWu/3TSLpQy19nenhZFoXVDtMWPG0UlE7nQoP3Jv5KmJe
	xBwdGIHEIty4wqW4mXlvur+nEirb2yt+EBQoonl5peRfjy9u6R9bssJGXWvXZlB9QAm0
	pTIPkwtn7zhH+zyjICo8pkKm7OO9DZfKZlmVm0yZFcVqIzBK+f+QrR30zQFLsv7yyG34
	K6ItVqT1a8mNvRkgYrKN2KE0ZdhkLybagSorPioaKbs08zbJy4vDTXQl6DicwCkmAdtr
	Nx8Q==
X-Gm-Message-State: AHQUAuZTY3147/0zgnaKm9imFMEgoud9Ef9wP4xawVHRO2nR5EBp2v6i
	i2vCm8enie3MQz6RyN0tsMwHIpl9qLzS6Q==
X-Received: by 2002:adf:a147:: with SMTP id r7mr2668837wrr.5.1550148683574;
	Thu, 14 Feb 2019 04:51:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:05 +0000
Message-Id: <20190214125107.22178-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 12/14] hw/arm/musca: Add MPCs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b2mZ6kuGHtAb

The Musca board puts its SRAM and flash behind TrustZone
Memory Protection Controllers (MPCs). Each MPC sits between
the CPU and the RAM/flash, and also has a set of memory mapped
control registers. Wire up the MPCs, and the memory behind them.
For the moment we implement the flash as simple ROM, which
cannot be reprogrammed by the guest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musca.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 8774e0b87b7..5fadac8c09b 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -27,11 +27,15 @@
 #include "hw/arm/armsse.h"
 #include "hw/boards.h"
 #include "hw/core/split-irq.h"
+#include "hw/misc/tz-mpc.h"
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/unimp.h"
 
 #define MUSCA_NUMIRQ_MAX 96
 #define MUSCA_PPC_MAX 3
+#define MUSCA_MPC_MAX 5
+
+typedef struct MPCInfo MPCInfo;
 
 typedef enum MuscaType {
     MUSCA_A,
@@ -44,19 +48,23 @@ typedef struct {
     uint32_t init_svtor;
     int sram_addr_width;
     int num_irqs;
+    const MPCInfo *mpc_info;
+    int num_mpcs;
 } MuscaMachineClass;
 
 typedef struct {
     MachineState parent;
 
     ARMSSE sse;
+    /* RAM and flash */
+    MemoryRegion ram[MUSCA_MPC_MAX];
     SplitIRQ cpu_irq_splitter[MUSCA_NUMIRQ_MAX];
     SplitIRQ sec_resp_splitter;
     TZPPC ppc[MUSCA_PPC_MAX];
     MemoryRegion container;
     UnimplementedDeviceState eflash[2];
     UnimplementedDeviceState qspi;
-    UnimplementedDeviceState mpc[5];
+    TZMPC mpc[MUSCA_MPC_MAX];
     UnimplementedDeviceState mhu[2];
     UnimplementedDeviceState pwm[3];
     UnimplementedDeviceState i2s;
@@ -69,6 +77,7 @@ typedef struct {
     UnimplementedDeviceState pvt;
     UnimplementedDeviceState sdio;
     UnimplementedDeviceState gpio;
+    UnimplementedDeviceState cryptoisland;
 } MuscaMachineState;
 
 #define TYPE_MUSCA_MACHINE "musca"
@@ -131,6 +140,131 @@ static MemoryRegion *make_unimp_dev(MuscaMachineState *mms,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(uds), 0);
 }
 
+typedef enum MPCInfoType {
+    MPC_RAM,
+    MPC_ROM,
+    MPC_CRYPTOISLAND,
+} MPCInfoType;
+
+typedef struct MPCInfo {
+    const char *name;
+    hwaddr addr;
+    hwaddr size;
+    MPCInfoType type;
+} MPCInfo;
+
+/* Order of the MPCs here must match the order of the bits in SECMPCINTSTATUS */
+static const MPCInfo a_mpc_info[] = { {
+        .name = "qspi",
+        .type = MPC_ROM,
+        .addr = 0x00200000,
+        .size = 0x00800000,
+    }, {
+        .name = "sram",
+        .type = MPC_RAM,
+        .addr = 0x00000000,
+        .size = 0x00200000,
+    }
+};
+
+static const MPCInfo b1_mpc_info[] = { {
+        .name = "qspi",
+        .type = MPC_ROM,
+        .addr = 0x00000000,
+        .size = 0x02000000,
+    }, {
+        .name = "sram",
+        .type = MPC_RAM,
+        .addr = 0x0a400000,
+        .size = 0x00080000,
+    }, {
+        .name = "eflash0",
+        .type = MPC_ROM,
+        .addr = 0x0a000000,
+        .size = 0x00200000,
+    }, {
+        .name = "eflash1",
+        .type = MPC_ROM,
+        .addr = 0x0a200000,
+        .size = 0x00200000,
+    }, {
+        .name = "cryptoisland",
+        .type = MPC_CRYPTOISLAND,
+        .addr = 0x0a000000,
+        .size = 0x00200000,
+    }
+};
+
+static MemoryRegion *make_mpc(MuscaMachineState *mms, void *opaque,
+                              const char *name, hwaddr size)
+{
+    /*
+     * Create an MPC and the RAM or flash behind it.
+     * MPC 0: eFlash 0
+     * MPC 1: eFlash 1
+     * MPC 2: SRAM
+     * MPC 3: QSPI flash
+     * MPC 4: CryptoIsland
+     * For now we implement the flash regions as ROM (ie not programmable)
+     * (with their control interface memory regions being unimplemented
+     * stubs behind the PPCs).
+     * The whole CryptoIsland region behind its MPC is an unimplemented stub.
+     */
+    MuscaMachineClass *mmc = MUSCA_MACHINE_GET_CLASS(mms);
+    TZMPC *mpc = opaque;
+    int i = mpc - &mms->mpc[0];
+    MemoryRegion *downstream;
+    MemoryRegion *upstream;
+    UnimplementedDeviceState *uds;
+    char *mpcname;
+    const MPCInfo *mpcinfo = mmc->mpc_info;
+
+    mpcname = g_strdup_printf("%s-mpc", mpcinfo[i].name);
+
+    switch (mpcinfo[i].type) {
+    case MPC_ROM:
+        downstream = &mms->ram[i];
+        memory_region_init_rom(downstream, NULL, mpcinfo[i].name,
+                               mpcinfo[i].size, &error_fatal);
+        break;
+    case MPC_RAM:
+        downstream = &mms->ram[i];
+        memory_region_init_ram(downstream, NULL, mpcinfo[i].name,
+                               mpcinfo[i].size, &error_fatal);
+        break;
+    case MPC_CRYPTOISLAND:
+        /* We don't implement the CryptoIsland yet */
+        uds = &mms->cryptoisland;
+        sysbus_init_child_obj(OBJECT(mms), name, uds,
+                              sizeof(UnimplementedDeviceState),
+                              TYPE_UNIMPLEMENTED_DEVICE);
+        qdev_prop_set_string(DEVICE(uds), "name", mpcinfo[i].name);
+        qdev_prop_set_uint64(DEVICE(uds), "size", mpcinfo[i].size);
+        object_property_set_bool(OBJECT(uds), true, "realized", &error_fatal);
+        downstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(uds), 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(mms->mpc[0]),
+                          TYPE_TZ_MPC);
+    object_property_set_link(OBJECT(mpc), OBJECT(downstream),
+                             "downstream", &error_fatal);
+    object_property_set_bool(OBJECT(mpc), true, "realized", &error_fatal);
+    /* Map the upstream end of the MPC into system memory */
+    upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
+    memory_region_add_subregion(get_system_memory(), mpcinfo[i].addr, upstream);
+    /* and connect its interrupt to the SSE-200 */
+    qdev_connect_gpio_out_named(DEVICE(mpc), "irq", 0,
+                                qdev_get_gpio_in_named(DEVICE(&mms->sse),
+                                                       "mpcexp_status", i));
+
+    g_free(mpcname);
+    /* Return the register interface MR for our caller to map behind the PPC */
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
+}
+
 static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
                                        const char *name, hwaddr size)
 {
@@ -160,8 +294,8 @@ static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
         { "pwm1", make_unimp_dev, &mms->pwm[1], 0xe000, 0x1000 },
         { "pwm2", make_unimp_dev, &mms->pwm[2], 0xf000, 0x1000 },
         { "gpio", make_unimp_dev, &mms->gpio, 0x10000, 0x1000 },
-        { "mpc0", make_unimp_dev, &mms->mpc[0], 0x12000, 0x1000 },
-        { "mpc1", make_unimp_dev, &mms->mpc[1], 0x13000, 0x1000 },
+        { "mpc0", make_mpc, &mms->mpc[0], 0x12000, 0x1000 },
+        { "mpc1", make_mpc, &mms->mpc[1], 0x13000, 0x1000 },
     };
 
     memory_region_init(container, OBJECT(mms), "musca-device-container", size);
@@ -190,6 +324,7 @@ static void musca_init(MachineState *machine)
     int i;
 
     assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
+    assert(mmc->num_mpcs <= MUSCA_MPC_MAX);
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
         error_report("This board can only be used with CPU %s",
@@ -285,10 +420,10 @@ static void musca_init(MachineState *machine)
                 { "eflash1", make_unimp_dev, &mms->eflash[1],
                   0x52500000, 0x1000 },
                 { "qspi", make_unimp_dev, &mms->qspi, 0x42800000, 0x100000 },
-                { "mpc0", make_unimp_dev, &mms->mpc[0], 0x52000000, 0x1000 },
-                { "mpc1", make_unimp_dev, &mms->mpc[1], 0x52100000, 0x1000 },
-                { "mpc2", make_unimp_dev, &mms->mpc[2], 0x52200000, 0x1000 },
-                { "mpc3", make_unimp_dev, &mms->mpc[3], 0x52300000, 0x1000 },
+                { "mpc0", make_mpc, &mms->mpc[0], 0x52000000, 0x1000 },
+                { "mpc1", make_mpc, &mms->mpc[1], 0x52100000, 0x1000 },
+                { "mpc2", make_mpc, &mms->mpc[2], 0x52200000, 0x1000 },
+                { "mpc3", make_mpc, &mms->mpc[3], 0x52300000, 0x1000 },
                 { "mhu0", make_unimp_dev, &mms->mhu[0], 0x42600000, 0x100000 },
                 { "mhu1", make_unimp_dev, &mms->mhu[1], 0x42700000, 0x100000 },
                 { }, /* port 9: unused */
@@ -296,7 +431,7 @@ static void musca_init(MachineState *machine)
                 { }, /* port 11: unused */
                 { }, /* port 12: unused */
                 { }, /* port 13: unused */
-                { "mpc4", make_unimp_dev, &mms->mpc[4], 0x52e00000, 0x1000 },
+                { "mpc4", make_mpc, &mms->mpc[4], 0x52e00000, 0x1000 },
             },
         }, {
             .name = "apb_ppcexp1",
@@ -434,6 +569,8 @@ static void musca_a_class_init(ObjectClass *oc, void *data)
     mmc->init_svtor = 0x10200000;
     mmc->sram_addr_width = 15;
     mmc->num_irqs = 64;
+    mmc->mpc_info = a_mpc_info;
+    mmc->num_mpcs = ARRAY_SIZE(a_mpc_info);
 }
 
 static void musca_b1_class_init(ObjectClass *oc, void *data)
@@ -453,6 +590,8 @@ static void musca_b1_class_init(ObjectClass *oc, void *data)
     mmc->init_svtor = 0x10000000;
     mmc->sram_addr_width = 17;
     mmc->num_irqs = 96;
+    mmc->mpc_info = b1_mpc_info;
+    mmc->num_mpcs = ARRAY_SIZE(b1_mpc_info);
 }
 
 static const TypeInfo musca_info = {
-- 
2.20.1

