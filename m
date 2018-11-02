Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1465046wro;
        Thu, 1 Nov 2018 17:20:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dIdwoM8IfpJ3nur6o468zzqk7xDs1X37CRp7kCvR1HwSvlRTbZendiDEMbwK8+ebDXYukl
X-Received: by 2002:a0c:86bb:: with SMTP id 56mr9097546qvf.78.1541118020550;
        Thu, 01 Nov 2018 17:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541118020; cv=none;
        d=google.com; s=arc-20160816;
        b=BSXO4eIuA63IctfLmUKGGELYW/FNzrjhYWNXIfZnDMGZjL2Nq3ibAkvLzSnSx+Se8b
         pTff3txEU9gLjsbCS3wu8XKibRb7TMzaXDp7rI4BLRKnewO7/e5orvquZvJxd3rHLioa
         cNKtdXBhCdM4I0X9rUhgSCh5U0DFKOWbeqPAtg50+XRvjWq5E4ECqcKwYA75gpvJy2Gh
         Sphp3/EON02P+vE9wwqCh2dzItWOVH8AAROM2xAaFeS3I+0IOmNH32l/PJifijW/Hueq
         hm6Ctc61c+/m4sGSCztMo/N42F61thIZ8CCYkLwDWnRJ+S3V6oEUf31naOvZtk50xQjU
         kdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8QUOsR11JabtcDRpBF0D8vI8qMwiohFRUYembFnfVBc=;
        b=pwgRjRx+IJFFiIZiN6mbn5c7V3YCoMhIdnqf0QoOgFdHuz7f9Cc1638Y6CS1NP9zbV
         3XGu/Em5DtTd+XNRHjXpp4Mr5VEICplrnnuqaJaT5Yi+Q9ktUrpks+kxBq475NOcPigy
         0h8djy6PlhCLfpah3Hp9uWBlPvDBW6oFe8Is3mUgN6XgqTE1EoVXZ720pSi4seuTrS7B
         O1QTbT+u8XmZoVsb6bv2xjyzjJVYN/k7jaleNG0eo12m9as5yRFBNn+YAE2J21u9QD/2
         1Hnd4wb/qJqoS+RXQi63ixrQMXLdVTzsl5/ez5VKsPINM+Tst7GgghbFWsBkupaY4wYU
         ZaOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GYmfghx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j90si3417186qtd.27.2018.11.01.17.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GYmfghx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gINCG-0007Oq-0u
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:20:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5e-00010f-Sy
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5c-000577-W4
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34022)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5c-00055r-Is; Thu, 01 Nov 2018 20:13:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id j26-v6so252087wre.1;
	Thu, 01 Nov 2018 17:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8QUOsR11JabtcDRpBF0D8vI8qMwiohFRUYembFnfVBc=;
	b=GYmfghx75vVUEwTzQ3FqRVx+H9SAinl6FdrZG5iNZAYjlT+SdWQshe6As0JYU/XUTW
	u3JdAndagWc6INh6R6eYFI8DHvkPqZ0I/GxqujGi8cETmFLS+L+l6zCFda6BVgQzdiMf
	EXpn98HcEgDnY8USEolzz9Y+L+iCJfzNOsLtACNV1TIFSsHQ4rO9eQtW5k/SKLbmlm5P
	NUbGtLCQYW3K6g+Il0mAqADBpxROKMTa5D5u8+MMPA2UGw0v6zz7sk8Lm1M2aHw/nMvl
	KCW4uDHkgCJ3edrEF0s8M13He25QXUq+BtVS7cTwxYr/z0k/AVeEeg6Z6OnzKzOdXBXV
	PeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8QUOsR11JabtcDRpBF0D8vI8qMwiohFRUYembFnfVBc=;
	b=Lq28RbYFqx9Ef0yD6KGDA5rNAu9P6lsei8Cr+uL+eREisbjRVF9u7a8RwNEIF2luyH
	ivBAKpQuk2nFTYdFAh1OtuW6Z83gQ1uTWXIYTrLMnETZDmf9YnjM9n/ZO011uAjOvXpD
	uTOj9jYmYW2VbzcCIRAXA1Lcu32pv3Ba2smXAHm5+o9SFd7PsG3I7v9MDzuE8V7vls3p
	ULV/qk6I96UcsNEmruo1rHSGCI1QQV/2K5mVDKmsI6wAseOdS5Sq/4ULJ8KJmyOH97Ql
	PrL3CrQhIsiL7TqWMF1L+HzFntsSIr6WWRihHP1VADxIzWUMQS09I7nDF2oXU3P6vZUw
	KpJw==
X-Gm-Message-State: AGRZ1gJqk05SJuvl7ssX3HNqOBwkO+s1WJl97B7xT8ozDyLNVp6/n686
	TQe6L3/fUPzcGv7+wQnIIXM=
X-Received: by 2002:adf:e14b:: with SMTP id
	f11-v6mr7916286wri.42.1541117607172; 
	Thu, 01 Nov 2018 17:13:27 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:13:02 +0100
Message-Id: <20181102001303.32640-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for 3.2 v2 6/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eR7Nm+a2qK6b

Add basic support for BCM283x CPRMAN. Provide support for reading and
writing CPRMAN registers and initialize registers with sensible default
values. During runtime retain any written values.

Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
and raspi3 systems.

Without this change, recent Linux kernels fail to boot on raspi2 and
raspi3. raspi2 images experience with various divide by 0 errors and
hang. raspi3 images fail to initialize the console (ttyS1).

Register addresses and fields taken from the "BCM2835 ARM Peripherals"
datasheet from February 06 2012:
https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c         |  16 +-
 hw/misc/Makefile.objs                |   1 +
 hw/misc/bcm2835_cprman.c             | 277 +++++++++++++++++++++++++++
 hw/misc/trace-events                 |   8 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/misc/bcm2835_cprman.h     |  28 +++
 6 files changed, 331 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/bcm2835_cprman.c
 create mode 100644 include/hw/misc/bcm2835_cprman.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 108c058d17..11fb098063 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -99,6 +99,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
+    /* Clock subsystem */
+    object_initialize(&s->cprman, sizeof(s->cprman), TYPE_BCM2835_CPRMAN);
+    object_property_add_child(obj, "cprman", OBJECT(&s->cprman), NULL);
+    qdev_set_parent_bus(DEVICE(&s->cprman), sysbus_get_default());
+
     /* Random Number Generator */
     object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
     object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
@@ -258,6 +263,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
 
+    /* Clock subsystem */
+    object_property_set_bool(OBJECT(&s->cprman), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* Random Number Generator */
     object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
     if (err) {
@@ -265,6 +277,9 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    memory_region_add_subregion(&s->peri_mr, CPRMAN_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cprman), 0));
+
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
@@ -350,7 +365,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     }
 
     create_unimp(s, &s->pm, "bcm2835-pm", PM_OFFSET, 0x1000);
-    create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", 0x102000, 0x1000);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 680350b3c3..93c11a2d4d 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -53,6 +53,7 @@ obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_RASPI) += bcm2835_rng.o
+obj-$(CONFIG_RASPI) += bcm2835_cprman.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
new file mode 100644
index 0000000000..df7e92e77f
--- /dev/null
+++ b/hw/misc/bcm2835_cprman.c
@@ -0,0 +1,277 @@
+/*
+ * BCM2835 Clock subsystem (poor man's version)
+ * https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
+ *
+ * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
+ * Copyright (C) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/misc/bcm2835_cprman.h"
+#include "hw/register.h"
+#include "trace.h"
+
+FIELD(CM,     PASSWD,   24, 8)
+
+FIELD(CM_CTL, SRC,       0, 4)
+FIELD(CM_CTL, ENABLE,    4, 1)
+FIELD(CM_CTL, KILL,      5, 1)
+FIELD(CM_CTL, GATE,      6, 1)
+FIELD(CM_CTL, BUSY,      7, 1)
+FIELD(CM_CTL, BUSYD,     8, 1)
+FIELD(CM_CTL, FRAC,      9, 1)
+
+FIELD(CM_DIV, FRAC,      0, 12)
+FIELD(CM_DIV, INTEGER,  12, 12)
+
+enum cprman_clock_source {
+    SRC_GND = 0,
+    SRC_OSC = 1,
+    SRC_TEST_DBG0 = 2,
+    SRC_TEST_DBG1 = 3,
+    SRC_PLLA_CORE = 4,
+    SRC_PLLC_CORE0 = 5,
+    SRC_PLLD_CORE = 6,
+    SRC_PLLH_AUX = 7,
+    SRC_PLLC_CORE1 = 8,
+    SRC_PLLC_CORE2 = 9
+};
+
+static const char *src_name(int src)
+{
+    static const char *src_names[16] = {
+        [SRC_GND] = "GND",
+        [SRC_OSC] = "OSC",
+        [SRC_TEST_DBG0] = "TEST_DBG0",
+        [SRC_TEST_DBG1] = "TEST_DBG1",
+        [SRC_PLLA_CORE] = "PLLA_CORE",
+        [SRC_PLLC_CORE0] = "PLLC_CORE0",
+        [SRC_PLLD_CORE] = "PLLD_CORE",
+        [SRC_PLLH_AUX] = "PLLH_AUX",
+        [SRC_PLLC_CORE1] = "PLLC_CORE1",
+        [SRC_PLLC_CORE2] = "PLLC_CORE2",
+    };
+    return src_names[src] ? src_names[src] : "UNKN";
+}
+
+static const char *ctldiv_names[CPRMAN_NUM_REGS] = {
+    [0] = "GNRIC",
+    [1] = "VPU",
+    [2] = "SYS",
+    [3] = "PERIA",
+    [4] = "PERII",
+    [5] = "H264",
+    [6] = "ISP",
+    [7] = "V3D",
+    [8] = "CAM0",
+    [9] = "CAM1",
+    [10] = "CCP2",
+    [11] = "DSI0E",
+    [12] = "DSI0P",
+    [13] = "DPI",
+    [14] = "GP0",
+    [15] = "GP1",
+    [16] = "GP2",
+    [17] = "HSM",
+    [18] = "OTP",
+    [19] = "PCM",
+    [20] = "PWM",
+    [21] = "SLIM",
+    [22] = "SMI",
+    [24] = "TCNT",
+    [25] = "TEC",
+    [26] = "TD0",
+    [27] = "TD1",
+    [28] = "TSENS",
+    [29] = "TIMER",
+    [30] = "UART",
+    [31] = "VEC",
+    [43] = "DSI1E",
+    [44] = "DSI1P",
+    [45] = "DFT",
+    [50] = "PULSE",
+    [53] = "SDC",
+    [54] = "ARM",
+    [55] = "AVEO",
+    [56] = "EMMC",
+};
+
+static bool is_ctldiv(hwaddr addr)
+{
+    return !!ctldiv_names[addr / 8];
+}
+
+static const char *rname(hwaddr addr)
+{
+    addr &= ~3;
+    switch (addr) {
+    case 0x100: return "OSCCOUNT";
+    case 0x104 ... 0x110:
+    case 0x170: return "PLLx";
+    case 0x114: return "LOCK";
+    case 0x118: return "EVENT";
+    default: {
+        int idx = addr / 8;
+        return ctldiv_names[idx] ? ctldiv_names[idx] : "UNKN";
+        }
+    }
+}
+
+static uint32_t scale(uint32_t value)
+{
+    return (1000ull * value) / 1024;
+}
+
+static uint64_t bcm2835_cprman_read(void *opaque, hwaddr addr, unsigned size)
+{
+    BCM2835CprmanState *s = (BCM2835CprmanState *)opaque;
+    bool is_div = addr % 8;
+    uint64_t value = s->regs[addr >> 2];
+
+    trace_bcm2835_cprman_rd(size << 3, addr, rname(addr), value);
+    if (is_ctldiv(addr)) {
+        if (is_div) {
+            trace_bcm2835_cprman_rd_div(rname(addr),
+                                        FIELD_EX32(value, CM_DIV, INTEGER),
+                                        scale(FIELD_EX32(value, CM_DIV, FRAC)));
+        } else {
+            trace_bcm2835_cprman_rd_ctl(rname(addr), src_name(value & 0xf),
+                                        FIELD_EX32(value, CM_CTL, ENABLE));
+        }
+    } else {
+        switch (addr & ~3) {
+        case 0x100 ... 0x118:
+        case 0x170:
+            qemu_log_mask(LOG_UNIMP, "[CM]: unimp r%02d PLL? 0x%04"
+                                     HWADDR_PRIx " = 0x%"PRIx64 "\n",
+                          size << 3, addr, value);
+            value = -1; /* FIXME PLL lock? */
+            break;
+        default:
+            qemu_log_mask(LOG_UNIMP, "[CM]: unimp r%02d ??? 0x%04"
+                                     HWADDR_PRIx " = 0x%"PRIx64 "\n",
+                          size << 3, addr, value);
+        }
+    }
+    return value;
+}
+
+#define CM_PASSWD 'Z'
+
+static void bcm2835_cprman_write(void *opaque, hwaddr addr,
+                                 uint64_t value, unsigned size)
+{
+    BCM2835CprmanState *s = (BCM2835CprmanState *)opaque;
+    bool is_div = addr % 8;
+    const char *name = rname(addr);
+
+    if (FIELD_EX32(value, CM, PASSWD) != CM_PASSWD) {
+        qemu_log_mask(LOG_GUEST_ERROR, "[CM]: password key error w%02d *0x%04"
+                                       HWADDR_PRIx " = 0x%" PRIx64 " (%s)\n",
+                      size << 3, addr, value, name);
+        return;
+    }
+    value &= ~R_CM_PASSWD_MASK;
+    trace_bcm2835_cprman_wr(size << 3, addr, name, value);
+
+    s->regs[addr >> 2] = value;
+    if (is_ctldiv(addr)) {
+        if (is_div) {
+            trace_bcm2835_cprman_wr_div(name,
+                                        FIELD_EX32(value, CM_DIV, INTEGER),
+                                        scale(FIELD_EX32(value, CM_DIV, FRAC)));
+        } else {
+            trace_bcm2835_cprman_wr_ctl(name, src_name(value & 0xf),
+                                        FIELD_EX32(value, CM_CTL, ENABLE));
+        }
+    } else {
+        switch (addr & ~3) {
+        case 0x100 ... 0x118:
+        case 0x170:
+            qemu_log_mask(LOG_UNIMP, "[CM]: unimp w%02d PLL? *0x%04"
+                                     HWADDR_PRIx " = 0x%" PRIx64 "\n",
+                          size << 3, addr, value);
+            break;
+        default:
+            qemu_log_mask(LOG_UNIMP, "[CM]: unimp w%02d ??? 0x%04"
+                                     HWADDR_PRIx " = 0x%"PRIx64 "\n",
+                          size << 3, addr, value);
+        }
+    }
+}
+
+static const MemoryRegionOps bcm2835_cprman_ops = {
+    .read = bcm2835_cprman_read,
+    .write = bcm2835_cprman_write,
+    .impl.min_access_size = 4,
+    .valid.min_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_bcm2835_cprman = {
+    .name = TYPE_BCM2835_CPRMAN,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, BCM2835CprmanState, CPRMAN_NUM_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_cprman_reset(DeviceState *dev)
+{
+    BCM2835CprmanState *s = BCM2835_CPRMAN(dev);
+    int i;
+
+    /*
+     * Available information suggests that CPRMAN registers have default
+     * values which are not overwritten by ROMMON (u-boot). The hardware
+     * default values are unknown at this time.
+     * The default values selected here are necessary and sufficient
+     * to boot Linux directly (on raspi2 and raspi3). The selected
+     * values enable all clocks and set clock rates to match their
+     * parent rates.
+     */
+    for (i = 0; i < CPRMAN_NUM_REGS; i += 2) {
+        if (!is_ctldiv(i * 4)) {
+            continue;
+        }
+        s->regs[i] = R_CM_CTL_ENABLE_MASK | (SRC_OSC << R_CM_CTL_SRC_SHIFT);
+        s->regs[i + 1] = (1 << R_CM_DIV_FRAC_SHIFT);
+    }
+}
+
+static void bcm2835_cprman_init(Object *obj)
+{
+    BCM2835CprmanState *s = BCM2835_CPRMAN(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_cprman_ops, s,
+                          TYPE_BCM2835_CPRMAN, 0x200);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void bcm2835_cprman_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bcm2835_cprman_reset;
+    dc->vmsd = &vmstate_bcm2835_cprman;
+}
+
+static TypeInfo bcm2835_cprman_info = {
+    .name          = TYPE_BCM2835_CPRMAN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835CprmanState),
+    .class_init    = bcm2835_cprman_class_init,
+    .instance_init = bcm2835_cprman_init,
+};
+
+static void bcm2835_cprman_register_types(void)
+{
+    type_register_static(&bcm2835_cprman_info);
+}
+
+type_init(bcm2835_cprman_register_types)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 52466c77c4..3dea1d10ff 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -132,3 +132,11 @@ iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysI
 iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
+
+# hw/misc/bcm2835_cprman.c
+bcm2835_cprman_rd(unsigned size, uint64_t offset, const char *reg_name, uint32_t value) "cprman: rd%u @0x%03" PRIx64 " %s val:0x%x"
+bcm2835_cprman_rd_div(const char *reg_name, uint32_t v0, uint32_t v1) "cprman: rd %s.DIV float:%u.%u"
+bcm2835_cprman_rd_ctl(const char *reg_name, const char *src, uint32_t ena) "cprman: rd %s.CTL src:%s enabled:%u"
+bcm2835_cprman_wr(unsigned size, uint64_t offset, const char *reg_name, uint32_t value) "cprman: wr%u @0x%03" PRIx64 " %s val:0x%x"
+bcm2835_cprman_wr_div(const char *reg_name, uint32_t v0, uint32_t v1) "cprman: wr %s.DIV float:%u.%u"
+bcm2835_cprman_wr_ctl(const char *reg_name, const char *src, uint32_t ena) "cprman: wr %s.CTL src:%s enabled:%u"
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 6fb52d20a8..4e7e26eaed 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -18,6 +18,7 @@
 #include "hw/dma/bcm2835_dma.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_cprman.h"
 #include "hw/misc/bcm2835_rng.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
@@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
     qemu_irq irq, fiq;
 
     UnimplementedDeviceState pm;
-    UnimplementedDeviceState cprman;
+    BCM2835CprmanState cprman;
     UnimplementedDeviceState a2w;
     SysBusDevice *uart0;
     BCM2835AuxState aux;
diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
new file mode 100644
index 0000000000..376dd7c3a5
--- /dev/null
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -0,0 +1,28 @@
+/*
+ * BCM2835 Poor-man's version of CPRMAN
+ *
+ * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_CPRMAN_H
+#define BCM2835_CPRMAN_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_CPRMAN "bcm2835-cprman"
+#define BCM2835_CPRMAN(obj) \
+        OBJECT_CHECK(BCM2835CprmanState, (obj), TYPE_BCM2835_CPRMAN)
+
+#define CPRMAN_NUM_REGS         (0x200 / 4)
+
+typedef struct {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t regs[CPRMAN_NUM_REGS];
+} BCM2835CprmanState;
+
+#endif
-- 
2.17.2

