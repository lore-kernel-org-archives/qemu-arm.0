Received: by 10.28.173.206 with SMTP id w197csp6874827wme;
        Thu, 18 Jan 2018 10:48:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBot/9F0fISXY4AJO8Cf4ZdIkBOEq/aU/zvbaXX968XsPVNCaasls5A7zr0a314NAx8tzeSFk
X-Received: by 10.129.128.67 with SMTP id q64mr1825833ywf.200.1516301315505;
        Thu, 18 Jan 2018 10:48:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301315; cv=none;
        d=google.com; s=arc-20160816;
        b=ViEgBbZlp40lRHoMuEc27hklB3t2ZQ2gmq5FjgB7vmoHSI5ZR5BqljcVyhGoamC8LC
         +LRqNfERe/S2oO3MmBwc7zEafAHKIW6kqZ8yzn8YIxh0y+8K4dyeHQc/c771aNm8Hxxp
         dXh5kUUHmOqgeKDfbuY05CZirNwdRdckOxqis4Nsk8VClJm8TYOWJWah+/5xg2LcytFt
         8fIfCeJoEBo1TmikxBNCnDXYoWhSAuNULh00A7S3jV4LgFbLe8nXEztw8ZSmrzZSgrA8
         r7B5as4RAplYHQyPrDLFota2j+vLI0HvICnuvRd23NNCGFasXStBtIQ65/tw5UOedS9p
         h7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
        b=vA7L76tpU6nqYRhMlFn5FpBloNYYoICIPijL/N4L3zKyfSMIMZXPCD5xR2qIcY7ti0
         Uh7VEaZ59u75SP4l4vNz5cZYfQIK+nVSji1k3Gp/j6uLooNnF21vTTZRpwAifc3rybIz
         u68Sd/dLEImzXqQQ772WihKXhk30hzzZEH/zPPBnM7YGTXfZaDa///tp7XsXyE2rTgJX
         XuqSpcwlF/94oh4nR81sFccODPQx7kk86JA9ksv1rcohNWlfi3KoWu20Mms+l7ybK77a
         +S+PILxK9pTJR5u0EDo2iuB7BRmLnPTiqdp+d4Fg07H/4X3uVKkK/zUU2KiXTk7BCsk5
         /6lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=opRc/PNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si1849297ywa.330.2018.01.18.10.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:48:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=opRc/PNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFEo-0003lO-Pq
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:48:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8n-0007Wy-P3
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF8m-0002uI-KC
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:42:21 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8m-0002tK-EO; Thu, 18 Jan 2018 13:42:20 -0500
Received: by mail-pg0-x244.google.com with SMTP id r19so9226053pgn.1;
	Thu, 18 Jan 2018 10:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
	b=opRc/PNxQc0MWY9CU0B/i9E3fl6fkqfI/F96KwOjevhyvpJ55w7VnX9iuyfaqivpFq
	eAJMr9T/wAdTXWH68hY8O+J7nwQ8FSB4MeXQdPOqehFF90llrcl0Pf7hkZsn71v9YupX
	ZgAzkUH4Egl9ijIFWIyB8FwB8CpSdTW9W1uB9e4sBQquhVlRX6VGEYfXHGJ5wqh66EIN
	H2llbcH7KOMv5iEIaOvp0Jq8F1NxoJj+NCDUbfiHHKFK0YTXHGUtPrIQGV0pLK+Z8Z8K
	L+tl1UwdwTghoLMgAFMW5ujndKFYu5COa26qEa78QGDGUNowffOev2sc3eukhJ19QpVL
	+ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=4PD0rX+ehRqeGVEgZCEmzpG5PrlM5EKNAZ23K4vpNvQ=;
	b=qQajT6KTXIchRVGRpK3qKzf5B/H/jYA2HwvKe8yjqxLZ4keQdTA3vQjRi7fqxF7kWA
	5RCuwdu2PHmDbsdOeVFNyFqbA3FU5MwdaY7ysOCLK+5dNbsuOPK7gyMF2oWJs35zBxaX
	2HxeOPGETg4i9YU3UpubEmCEYgLJ22Mhj2NcNsw/gYRAfrQfNP+YLdp+lVam7W+wv2Ak
	dvDuh+yMhuV/8kN72HewPPelkjVi5y8thrKstNJMIRD5wkFo6o1T8xeHNYCVv4UZlmgU
	+s1tMU6WbJW9AaJqDg2geUDqwhMRFkoZxJFlmKMs15ri765Z+G0zlI0ZDsxSvGGTusLo
	XYpg==
X-Gm-Message-State: AKwxytc/Qa7wCv/7QDvN8NgnNYWadxYkrtqQubV4uEX0m9ra/+vurQrQ
	tRpvL6IswqydPfc+5fl/lIN0GOMG74k=
X-Received: by 10.98.73.76 with SMTP id w73mr19994486pfa.61.1516300939137;
	Thu, 18 Jan 2018 10:42:19 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	s3sm12715091pgo.80.2018.01.18.10.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:18 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:37:53 -0800
Message-Id: <2e485623ed9b03113e937c9687553bb2cad22515.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v6 2/9] xlnx-zynqmp-pmu: Initial commit of the
 ZynqMP PMU
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
X-TUID: Hrj5Qnf9jCCf

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

