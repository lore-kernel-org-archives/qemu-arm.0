Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp949734wrp;
        Thu, 14 Feb 2019 05:02:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibd0UnAFqNX6kE3aC0nWrszOxOxnvZrf+84oxcKb6noM/7MVL0fBRaEoArpTWZSXNoPA7Pb
X-Received: by 2002:aed:3aa7:: with SMTP id o36mr2883034qte.240.1550149353121;
        Thu, 14 Feb 2019 05:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149353; cv=none;
        d=google.com; s=arc-20160816;
        b=pJgb18QwDr3q1bEgH4n5ZCcy1nBsJL8PEtfI6xvMH1/u9x57sGfwWzBzS1TGUnTJnO
         3wfRAZp6DBt0G8oEr0DZLXzLjIE/2HHxxBxAha4G+sST8CiPfQF7fYRzl05ZZf0h6dhi
         j61Kv7MUCuc1aZ0VxkhriscN55L9qKajsfqVGcOcWSR5RhnSu+hQBQxgDx72RUYjbIzw
         KTxEEU2cVQUnXXFvBiAboUAOnCEr4+cVSi838upQOX7728MMdEpeiiSJ3LNVjO78bhYm
         DSqlOVhpfld1SpmizRHfncI491bx5DyrrpdOU7n9cVOeRKwDBW/BA4I71pK0VGh7jCRT
         F0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Cmk9snjFVJivgWjfslWczIKV+LYGTGnCXg+808OCaPc=;
        b=fra9w4jLBwnOFIAjG22ceebbufkx7MR9EPE3jdWuvR815CLX4VBjISVqJfQQmiVTq+
         td2ysGN1mRS9pKhAODIxIBIDutBnLhOuiB/b3NZ6zB2ncntN/uKRCxKETPs5Ds2/AeQK
         WTxcG3v3FrovAQ/ILlwPnSumHQuItPcaHJDYKJua7+UkgJuGkun4Q/Xig/8RotsdKBgs
         /mZ6eTfhHszHahA093FEX0QMFyxuFxXp6Uo5KXdax3FaT22xsby0kACZFhvRspI+TZiC
         cOWxilcfTSrIXoQWRqS+CN1PK1t21pDTBUJdp52R0n8+tIkK57i+C76EEkWIB657HGA2
         WGSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pwjEot2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si1379538ybb.24.2019.02.14.05.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pwjEot2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGes-0003JG-BS
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeN-0002tV-8D
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-00072L-Mf
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39385)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUe-0006dp-Fl
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:56 -0500
Received: by mail-wm1-x333.google.com with SMTP id f16so5970187wmh.4
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Cmk9snjFVJivgWjfslWczIKV+LYGTGnCXg+808OCaPc=;
	b=pwjEot2G4mDp5+2iW28i7Yv7SsC4jJynE6iVdbEo1j5O6VBAx3BbcTAN2Q11Dn7+nd
	SnxSF782kJIcjiIaUNZYB3ZajyD4v6sUDzG52IusTqocbK4b32LXwFXugXgue2G+rxWX
	Xg4XpKOQt9gHOB/HEFOcrBFyEaRNK5IwRTJhfL6O4EiEs3pLYi07OSkfMRsDkValZr9e
	j3vEXoCXtF3idgXUfIdn2QaRvU0xQtD7kCIcwSD4CuOk48Y/Fv+FFzvxoF7ErstXYLo5
	YSnsNW9iDo93tBtqoiczARpm9wNs9uKxG9PFatHpess7oQhX2JCiyYrr3XSk398f1R9s
	auKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cmk9snjFVJivgWjfslWczIKV+LYGTGnCXg+808OCaPc=;
	b=iLo9fUhrm1PijD9ZiSlwCOhbxrHdTHT/75ADPwWj/3aa6McFRJt7FH4bQGQtHpKe1J
	Azmq5++tFAA+J4wcpEQY5BB3fz7B4XHTfIQvPccdv8K3j+fyZDFb9Cv0KjJRMxIimHLa
	iEpPEFviprws21dSN8RspQX4+hYdeJieRxC1XMgWYr88aAu2r9Sjzpm7i3taturmbLx3
	QmXm/BuU82jMGSYyjWEDgZIX0xa2HmuomTO8rtA2sLlf/7+KlPc8YVzmeddbUl163SXS
	ckAbOSSNiug4cAN9zksg79GXxP3dsQK3oiHtRPPa8vOlvZ0cFxCpsqFcCuucJOfFKV3m
	Xz1g==
X-Gm-Message-State: AHQUAubxHAJ+hJ+CNZTIlDEaVWqnRRDrFjzYSwhUX8KEesYiyuDs7Ywj
	q1g98nXXG1da7/86x/rH0tq14b1yO0656w==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr2770572wmi.68.1550148680940; 
	Thu, 14 Feb 2019 04:51:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:03 +0000
Message-Id: <20190214125107.22178-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: [Qemu-arm] [PATCH 10/14] hw/arm/musca.c: Implement models of the
 Musca-A and -B1 boards
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
X-TUID: 7r/KHsqPOKUM

The Musca-A and Musca-B1 development boards are based on the
SSE-200 subsystem for embedded. Implement an initial skeleton
model of these boards, which are similar but not identical.

This commit creates the board model with the SSE and the IRQ
splitters to wire IRQs up to its two CPUs. As yet there
are no devices and no memory: these will be added later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Makefile.objs            |   1 +
 hw/arm/musca.c                  | 197 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   6 +
 default-configs/arm-softmmu.mak |   1 +
 4 files changed, 205 insertions(+)
 create mode 100644 hw/arm/musca.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fa40e8d6412..fa57c7c7704 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -35,6 +35,7 @@ obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MPS2) += mps2-tz.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_MUSCA) += musca.o
 obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
new file mode 100644
index 00000000000..cc624c7d160
--- /dev/null
+++ b/hw/arm/musca.c
@@ -0,0 +1,197 @@
+/*
+ * Arm Musca-B1 test chip board emulation
+ *
+ * Copyright (c) 2019 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * The Musca boards are a reference implementation of a system using
+ * the SSE-200 subsystem for embedded:
+ * https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-a-test-chip-board
+ * https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-b-test-chip-board
+ * We model the A and B1 variants of this board, as described in the TRMs:
+ * http://infocenter.arm.com/help/topic/com.arm.doc.101107_0000_00_en/index.html
+ * http://infocenter.arm.com/help/topic/com.arm.doc.101312_0000_00_en/index.html
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/arm/armsse.h"
+#include "hw/boards.h"
+#include "hw/core/split-irq.h"
+
+#define MUSCA_NUMIRQ_MAX 96
+
+typedef enum MuscaType {
+    MUSCA_A,
+    MUSCA_B1,
+} MuscaType;
+
+typedef struct {
+    MachineClass parent;
+    MuscaType type;
+    uint32_t init_svtor;
+    int sram_addr_width;
+    int num_irqs;
+} MuscaMachineClass;
+
+typedef struct {
+    MachineState parent;
+
+    ARMSSE sse;
+    SplitIRQ cpu_irq_splitter[MUSCA_NUMIRQ_MAX];
+} MuscaMachineState;
+
+#define TYPE_MUSCA_MACHINE "musca"
+#define TYPE_MUSCA_A_MACHINE MACHINE_TYPE_NAME("musca-a")
+#define TYPE_MUSCA_B1_MACHINE MACHINE_TYPE_NAME("musca-b1")
+
+#define MUSCA_MACHINE(obj) \
+    OBJECT_CHECK(MuscaMachineState, obj, TYPE_MUSCA_MACHINE)
+#define MUSCA_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(MuscaMachineClass, obj, TYPE_MUSCA_MACHINE)
+#define MUSCA_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(MuscaMachineClass, klass, TYPE_MUSCA_MACHINE)
+
+/*
+ * Main SYSCLK frequency in Hz
+ * TODO this should really be different for the two cores, but we
+ * don't model that in our SSE-200 model yet.
+ */
+#define SYSCLK_FRQ 40000000
+
+static void musca_init(MachineState *machine)
+{
+    MuscaMachineState *mms = MUSCA_MACHINE(machine);
+    MuscaMachineClass *mmc = MUSCA_MACHINE_GET_CLASS(mms);
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    DeviceState *ssedev;
+    int i;
+
+    assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
+
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
+        error_report("This board can only be used with CPU %s",
+                     mc->default_cpu_type);
+        exit(1);
+    }
+
+    sysbus_init_child_obj(OBJECT(machine), "sse-200", &mms->sse,
+                          sizeof(mms->sse), TYPE_SSE200);
+    ssedev = DEVICE(&mms->sse);
+    object_property_set_link(OBJECT(&mms->sse), OBJECT(system_memory),
+                             "memory", &error_fatal);
+    qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
+    qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
+    qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
+    qdev_prop_set_uint32(ssedev, "MAINCLK", SYSCLK_FRQ);
+    object_property_set_bool(OBJECT(&mms->sse), true, "realized",
+                             &error_fatal);
+
+    /*
+     * We need to create splitters to feed the IRQ inputs
+     * for each CPU in the SSE-200 from each device in the board.
+     */
+    for (i = 0; i < mmc->num_irqs; i++) {
+        char *name = g_strdup_printf("musca-irq-splitter%d", i);
+        SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
+
+        object_initialize_child(OBJECT(machine), name,
+                                splitter, sizeof(*splitter),
+                                TYPE_SPLIT_IRQ, &error_fatal, NULL);
+        g_free(name);
+
+        object_property_set_int(OBJECT(splitter), 2, "num-lines",
+                                &error_fatal);
+        object_property_set_bool(OBJECT(splitter), true, "realized",
+                                 &error_fatal);
+        qdev_connect_gpio_out(DEVICE(splitter), 0,
+                              qdev_get_gpio_in_named(ssedev, "EXP_IRQ", i));
+        qdev_connect_gpio_out(DEVICE(splitter), 1,
+                              qdev_get_gpio_in_named(ssedev,
+                                                     "EXP_CPU1_IRQ", i));
+    }
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x2000000);
+}
+
+static void musca_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->default_cpus = 2;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->init = musca_init;
+}
+
+static void musca_a_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MuscaMachineClass *mmc = MUSCA_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM Musca-A board (dual Cortex-M33)";
+    mmc->type = MUSCA_A;
+    mmc->init_svtor = 0x10200000;
+    mmc->sram_addr_width = 15;
+    mmc->num_irqs = 64;
+}
+
+static void musca_b1_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MuscaMachineClass *mmc = MUSCA_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM Musca-B1 board (dual Cortex-M33)";
+    mmc->type = MUSCA_B1;
+    /*
+     * This matches the DAPlink firmware which boots from QSPI. There
+     * is also a firmware blob which boots from the eFlash, which
+     * uses init_svtor = 0x1A000000. QEMU doesn't currently support that,
+     * though we could in theory expose a machine property on the command
+     * line to allow the user to request eFlash boot.
+     */
+    mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 17;
+    mmc->num_irqs = 96;
+}
+
+static const TypeInfo musca_info = {
+    .name = TYPE_MUSCA_MACHINE,
+    .parent = TYPE_MACHINE,
+    .abstract = true,
+    .instance_size = sizeof(MuscaMachineState),
+    .class_size = sizeof(MuscaMachineClass),
+    .class_init = musca_class_init,
+};
+
+static const TypeInfo musca_a_info = {
+    .name = TYPE_MUSCA_A_MACHINE,
+    .parent = TYPE_MUSCA_MACHINE,
+    .class_init = musca_a_class_init,
+};
+
+static const TypeInfo musca_b1_info = {
+    .name = TYPE_MUSCA_B1_MACHINE,
+    .parent = TYPE_MUSCA_MACHINE,
+    .class_init = musca_b1_class_init,
+};
+
+static void musca_machine_init(void)
+{
+    type_register_static(&musca_info);
+    type_register_static(&musca_a_info);
+    type_register_static(&musca_b1_info);
+}
+
+type_init(musca_machine_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 85d4b4c9f7c..9b5042b883a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -636,6 +636,12 @@ F: include/hw/misc/iotkit-sysinfo.h
 F: hw/misc/armsse-cpuid.c
 F: include/hw/misc/armsse-cpuid.h
 
+Musca
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/musca.c
+
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 734ca721e9e..87ad2674946 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -89,6 +89,7 @@ CONFIG_TUSB6010=y
 CONFIG_IMX=y
 CONFIG_MAINSTONE=y
 CONFIG_MPS2=y
+CONFIG_MUSCA=y
 CONFIG_NSERIES=y
 CONFIG_RASPI=y
 CONFIG_REALVIEW=y
-- 
2.20.1

