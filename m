Received: by 10.28.71.27 with SMTP id u27csp3200345wma;
        Mon, 22 Jan 2018 11:52:20 -0800 (PST)
X-Google-Smtp-Source: AH8x225BINVccaNz0OMnMyFtrxJQqdjwK/LU1vKdlF2LpvhMqIU2OCscdIS2V6AYb6L9LYcCPM8e
X-Received: by 10.37.77.6 with SMTP id a6mr11886ybb.410.1516650740515;
        Mon, 22 Jan 2018 11:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650740; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBbwS5jPMO+n6SdBM5XFLUW2weLlfcLRNL6sJD05jHelxDQo+8NoP0xAeuzjjz+7h2
         sHunrDv9J15l2uy09QrJGbdnFvzqbeaYsIk83JMz+PchW9pmWGpWyLysIZwuhKN9TJws
         R+lrzq8QoqxqPV4fDP75psByVyALH9g+2VaG22A3o98ro0yH47u36eG5h4nPW8GFP96S
         bxQfHEkfk63qKnP1+lm1ppmfEM91QM4QsZi3zf0NKLv/MDf2GoFSxUXPudqCKGjeCvV4
         KRLFssV1hPU565v9wXjLleGr/v5Zj6DnQiDi+akmor4d51FNGQTpMlgvNQ0TRAc0rmnW
         uN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
        b=xswS+uWehQUKrr68SOn05abg4hIVQOsCbiuSvwBk6F1p2mbd2R8txCdYm2p0K3huvV
         cfMrlkfM5WAUiBEBYGdRCESZieYtyH9LOQjRt3YVjb9CO3U0HkSgCUJe093ghih47zZ8
         EDPcJRGf7BQo9poUqQ/N0Q1S+wDkBAiTKhxW8Cwijo2qHVgrRutHKQB/6oPq50r8CY8S
         AOFu0vr2PWIJAftpPGd1tqtsnwalkM7tuyzl2cu72ZJwjsUUZO79dRN4bevMc/F+xI/E
         Atl8ZrfoeBRkQrSRaV0RnsHrsw6yWpkJc7yApV6/raMpZPxlj3sR689h4a3L6/25G7G1
         k11w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mf77HWsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a124si2134690ybg.498.2018.01.22.11.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:52:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mf77HWsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi8h-0001XY-RP
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:52:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4k-0007Ae-QI
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4j-00069C-VP
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 14:48:14 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:45792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4j-00068s-Pb; Mon, 22 Jan 2018 14:48:13 -0500
Received: by mail-pf0-x243.google.com with SMTP id a88so7871877pfe.12;
	Mon, 22 Jan 2018 11:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
	b=mf77HWsBGE78JUe5DbNg0lPUnrh9ZNlhV2cEpMwy9z7FTNCo3weVkpDsUKqjw1SU/f
	BnztjK5E3EfePCF13VBtAp6DftimM1KkpE5DPafkQS+r7sV/67+bYNRLvTF813GnZ4RA
	EQMpwlJQUoXaPASxzU4niVL8qg8id1iuHbtaXJd9JqL8/tbcWJ7xF1A5yD9fmN1BwEz9
	46r1Qrl2DtPa3yS4H1PBg2Wi1+GYInK/rkEkDyifLlLkC96U2uZO04Ynos1GotHHV3NV
	mjSlPdEgu4lFo+GePmniSaMsuTvC9t2XhXZ7qJOkK7ssuySbiPOIZSKUunzJXM1nOYtv
	me3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ziPNeaNVZJqh7F/X7tlD2WjijnRpnQIxmXMcOPgStBE=;
	b=hsrawQUcCUdBKcKb6O1P/nY1NHuqhbyZ1ASeB3Phx4z72Yonlvbdk35ESouMScNWwF
	wAtTnnF0jeXdnvvhRwkwfA5cNRIlk2XPyG+Wg+dUxOj2qxLKgylIn4dkLtjSPCmS5L0F
	XyyZWOqgShiYevO3bIhtbxGKB7u0nsEdWwTka7TE+puwJi6Ci4XR5bMIUo7ktZeFEOs0
	SiicoerKXjoa2m2bE83TjuOEH00RjQvDkMR32X4U1sm75J3fLIe65MmwTcFsbbfVR2cA
	EirkkNg2e4hGm01F5YtVv0uLrivslv1qZldTtR9ntMIXJKHA4yoKpAoK2FJdAG7wLNEp
	CRsg==
X-Gm-Message-State: AKwxytdq3FlbApSIO+njQynjAMVZKevJk5UkRdBIy4KHOyyTKZize3l6
	E+ci2v29w0Ivp+oWRcLey268BEjz
X-Received: by 10.99.125.78 with SMTP id m14mr7773814pgn.383.1516650492505;
	Mon, 22 Jan 2018 11:48:12 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	v186sm1497364pfb.5.2018.01.22.11.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:48:11 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:48 -0800
Message-Id: <227c152baf1df5dbc1218279c6d3c542dde5b4c3.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PATCH v7 8/9] xlnx-zynqmp-pmu: Connect the IPI device
 to the PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qG7uVqh4nXXj

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
V4:
 - Move the IPI to the machine instead of the SoC

 hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 7312bfe23e..999a5657cf 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "boot.h"
 
+#include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/intc/xlnx-pmu-iomod-intc.h"
 
 /* Define the PMU device */
@@ -38,6 +39,15 @@
 
 #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
 
+#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
+
+static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
+};
+static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
+    19, 20, 21, 22,
+};
+
 typedef struct XlnxZynqMPPMUSoCState {
     /*< private >*/
     DeviceState parent_obj;
@@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
+    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
+    qemu_irq irq[32];
+    int i;
 
     /* Create the ROM */
     memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
@@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
                               &error_abort);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
 
+    for (i = 0; i < 32; i++) {
+        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
+    }
+
+    /* Create and connect the IPI device */
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
+        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
+    }
+
+    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
+    }
+
     /* Load the kernel */
     microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
-- 
2.14.1

