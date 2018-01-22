Received: by 10.28.71.27 with SMTP id u27csp3199434wma;
        Mon, 22 Jan 2018 11:51:14 -0800 (PST)
X-Google-Smtp-Source: AH8x227br6Q7OeD00GrhKOXHLxbbJGzbG2bW8N4k5U7JFsRe7wyhRPyWR3GnITnWUFK179bjoH8L
X-Received: by 10.37.66.83 with SMTP id p80mr24261yba.28.1516650674127;
        Mon, 22 Jan 2018 11:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650674; cv=none;
        d=google.com; s=arc-20160816;
        b=kxSL1nTS7HwifH9NdU+TLfoyvroMUyam56EPiSKnInS2xLAoaaN2hHvLMJB1/X92mk
         6C7Ycbbiq/w7MMs5uMC9bTHi+WMiP5GoJMQx3F4S8Nb5AoxOuce3z7exVtSJeFoD9j+5
         niUgIpozXk4l+lEp9bsUOSC9tjKq+kfs2B8kgoNV0gWzfj530NL4t9gNXUxfNNdf8n5s
         Th2HyeTPv3AgPDoFkbM9ofiYPKalKEbbyc8hEIh9nJg80vhlivxkFJIxrAgv7kcnBMMc
         n9zM4qOFQcsRHrciT3VVLKGpkuSaiOZlhuD4kWLo/E/ncu1184faD8t7MTm647VpxIgk
         w3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
        b=gbSBrO+0YmZnH8QkrwPcshRBT3mIn/33dZrmNzxTXkmE5rvviUYyWOKict4BiW/Szd
         xGcVT9M0sULX/243AzC71eYmR658rfroVk8/RHGyxStK2LTGtniGc5B35RM7Fg+jGtO5
         DMANxs0Q+8gH3oqHJaTj6yPz5uop4jO0ajJHtdj07tszOFo7J2rArfGePertVblCsYNR
         Y0HW9wrDrNd66LbSjx8qahUexFIAQ146UBwuSqYo7gCFPPIvNq7wgPqpPX5p0omq0gTf
         hlpcV6qE5hYb9t6yZt3C88MyfgxoXdt+q88A3VWUlM7GM+qCc6ztjwLGpCaV5isu/a2Z
         ZQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R5XaInUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1si2131285ybj.10.2018.01.22.11.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R5XaInUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi7d-00010q-Fn
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:51:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4Q-0006rx-9h
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4O-0005wa-5p
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:47:53 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:38105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4I-0005rd-Nj; Mon, 22 Jan 2018 14:47:46 -0500
Received: by mail-pf0-x241.google.com with SMTP id k19so7886042pfj.5;
	Mon, 22 Jan 2018 11:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
	b=R5XaInUI5AqeShPSD+oXkhR3AdEKoclaQQf2rJ0ZwLZvS3EO7DWe423VkNC7sFIpQd
	VTg8h6lLCu5YlS5X0THYkT5vbJWFfb/SeSDcRbZmA522T6LxV1uLO1Qku/PP1099DraN
	xgpd4iGscnR0IPYK3zNRsMeRZ6wk+l4cCGpY7k73ouyCd2HPLZW83ZITP+4uFIIRLS1i
	HfCisjudDPlXKPD/+GRUkpKyCQe/kEeFjYOqh7WeCipnoim7XTH6aRK6LJsLRm9+9Hw3
	HQo79MzzOx9CI2J7WO+pzMtiQrBPCoaD4wDVW0Qj3eU0txVgOkxPUyKohBJ/0EaFPFxY
	jAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
	b=ActeiUBqdgjYMSnktVlBefUdq3GK51sVruCQvOfa5RgvOSXaKeJOt2jXAHTXHx1KUH
	NpDn9WWb+4x35gqxyIzwrbXgOvwY1BlFfbtymuG/LBRTqNznHKjK0L9jbTptRAwnB3K0
	QxdiKcVTqicLdRy/TVc+qHc5DdA9zH6jyziRcvDZkAkd2bl4FBRMuX7XTa+O5o5ro+xV
	EjaoENh5MGBPVdSGqRcU+DiDhGxFqJ5qFfn4RGpDZck2xaKqcIbZ6wuiJ4PTPeo5EfrB
	2K/OECi3F1SG8I12wZJQzoUjlaJ6ZXyyn5m2EhdRlpcM9lCNmeMEKYcBtxSJk/5PgPpL
	/dcg==
X-Gm-Message-State: AKwxytfvd4ltlENNG2yj3w8LEM1pw0ANk9s8m4cUUy8u9obmI5GQH/Cf
	GnyrYQr8AoeXtg3jjXAYznSN9cVx
X-Received: by 10.99.107.129 with SMTP id g123mr7466528pgc.356.1516650465243; 
	Mon, 22 Jan 2018 11:47:45 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	o25sm32163866pgc.75.2018.01.22.11.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:47:43 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:20 -0800
Message-Id: <b992d4940c36e139e09aafa06996aa3875457a6e.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v7 2/9] xlnx-zynqmp-pmu: Initial commit of the
 ZynqMP PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mVD/JIgsFVfH

The Xilinx ZynqMP SoC has two main processing systems in it. The ARM
processing system (which is already modeled in QEMU) and the MicroBlaze
Power Management Unit (PMU). This is the inital work for adding support
for the PMU.

The PMU susbsystem runs along side the ARM system on hardware, but due
to architecture limitations in QEMU the two instances are seperate for
the time being.

Let's follow the same setup we do with the ARM system, where there is an
SoC device and a ZCU102 board. Although the PMU is less board specific
we are still going to follow the same split as maybe in future we can
connect the PMU device to the ARM ZCU102 board. As the machine will be
fairly small let's keep them both together in one file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

V4:
 - Rename to remove ZCU102 name

 hw/microblaze/xlnx-zynqmp-pmu.c | 83 +++++++++++++++++++++++++++++++++++++++++
 hw/microblaze/Makefile.objs     |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
new file mode 100644
index 0000000000..ac0f78928a
--- /dev/null
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -0,0 +1,83 @@
+/*
+ * Xilinx Zynq MPSoC PMU (Power Management Unit) emulation
+ *
+ * Copyright (C) 2017 Xilinx Inc
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "cpu.h"
+
+/* Define the PMU device */
+
+#define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
+#define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
+                                              TYPE_XLNX_ZYNQMP_PMU_SOC)
+
+typedef struct XlnxZynqMPPMUSoCState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+}  XlnxZynqMPPMUSoCState;
+
+static void xlnx_zynqmp_pmu_soc_init(Object *obj)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = xlnx_zynqmp_pmu_soc_realize;
+}
+
+static const TypeInfo xlnx_zynqmp_pmu_soc_type_info = {
+    .name = TYPE_XLNX_ZYNQMP_PMU_SOC,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPPMUSoCState),
+    .instance_init = xlnx_zynqmp_pmu_soc_init,
+    .class_init = xlnx_zynqmp_pmu_soc_class_init,
+};
+
+static void xlnx_zynqmp_pmu_soc_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_soc_type_info);
+}
+
+type_init(xlnx_zynqmp_pmu_soc_register_types)
+
+/* Define the PMU Machine */
+
+static void xlnx_zynqmp_pmu_init(MachineState *machine)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
+{
+    mc->desc = "Xilinx ZynqMP PMU machine";
+    mc->init = xlnx_zynqmp_pmu_init;
+}
+
+DEFINE_MACHINE("xlnx-zynqmp-pmu", xlnx_zynqmp_pmu_machine_init)
+
diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
index b2517d87fe..ae9fd40de7 100644
--- a/hw/microblaze/Makefile.objs
+++ b/hw/microblaze/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y += petalogix_s3adsp1800_mmu.o
 obj-y += petalogix_ml605_mmu.o
+obj-y += xlnx-zynqmp-pmu.o
 obj-y += boot.o
-- 
2.14.1

