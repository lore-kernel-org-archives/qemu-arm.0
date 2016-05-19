Received: by 10.25.208.137 with SMTP id h131csp3300074lfg;
        Thu, 19 May 2016 15:58:57 -0700 (PDT)
X-Received: by 10.140.31.130 with SMTP id f2mr16492330qgf.69.1463698737239;
        Thu, 19 May 2016 15:58:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si15018150qkv.204.2016.05.19.15.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Wu8-00040j-Kq
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wq1-000067-Jj
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpz-0007IS-Dg
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:40 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpm-0007Fu-D9; Thu, 19 May 2016 18:54:26 -0400
Received: by mail-wm0-x244.google.com with SMTP id s63so10274890wme.2;
	Thu, 19 May 2016 15:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zFnkE3dN6rw5G4hQBrZz5iM3il3HrY+jjDEA6JqrQpY=;
	b=daVARecE7rjrKXKPtqhSszr8zo0lKudMkGlQnsKutlBnL/4+uOGNkeTSmlz96qaZNL
	Flg36vgnn1v/vD/3D2/ncu11lMeFM4LGLVEG3wxbrSWwVpI0thxfp0lhbxUuTGpS7QwA
	xAi40TdQ7KiSBu1NjIigzZCUohFsqa8CxD9D/5wjiayPFYKg7VRlQQXECMSl5fF0Wbjg
	ODZkJnwNj3QquEIyEob9bJ6q3VZwNw9wS6Yz+I51g3OJ1QAgVK9thvHCG9oAPyB0AOln
	9RBcRGg10c4wLZIGPwGFc+0qYOH7RlDrcEVa/hciAuCwwMMsT/bponpQbUEY1aH693h9
	iNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zFnkE3dN6rw5G4hQBrZz5iM3il3HrY+jjDEA6JqrQpY=;
	b=lpfw1Mbr083ntZEXuASmGUFVxV5R6VijEjBn3jDv+s8Ll0+B51E16Fofar+EY3eLpV
	r/4XYxgLfrglMMDBXmGmudp0mk6OkPFOfa1FRkFpMA6WQrzmm6jdAl0DCehbYxCdPYzS
	xn5L5xbJwaZsNFSUPk4G1SoPtUvBExX6QJq0K/UMOA0z7LZLG+vdSVJ/7UBRvm0mGrBb
	CqHFPEWdjbwjS9hY5JqY7Z8CwSQD0yZNTdhPc792CiHbZnBcEJZE0GkkjL8sX8m1hNZ/
	6EHtsrweNFrR0GzpYkaGQjWGyIob2406qHaBMg6vz5BTB3F4l+SdgQhuCeYj6cebN6BL
	FdaQ==
X-Gm-Message-State: AOPr4FXfhlRDfozJkuQeJkgQpaPA6sTlxnTczIg37p6+xpWzkQSOtc6GKGxZpGiCmbnriA==
X-Received: by 10.194.122.199 with SMTP id lu7mr17097828wjb.40.1463698465768; 
	Thu, 19 May 2016 15:54:25 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	iv1sm16666344wjb.34.2016.05.19.15.54.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:25 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:17 +0200
Message-Id: <1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-arm] [PATCH v1 3/5] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Y7Uh9SV04C/

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The way we currently model the RPU subsystem is of quite
limited use. In addition to that, it causes problems for
KVM and for GDB debugging.

Make the RPU optional by adding a has_rpu property and
default to having it disabled.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 50 +++++++++++++++++++++++++++++++++++++-------
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 250ecc4..c180206 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -83,6 +83,40 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
     return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
 }
 
+static bool xlnx_zynqmp_get_has_rpu(Object *obj, Error **errp)
+{
+    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
+
+    return s->has_rpu;
+}
+
+static void xlnx_zynqmp_set_has_rpu(Object *obj, bool value, Error **errp)
+{
+    XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
+    int i;
+
+    if (s->has_rpu == value) {
+        /* Nothing to do.  */
+        return;
+    }
+
+    /* We don't support clearing the flag.  */
+    if (s->has_rpu) {
+        error_setg(errp, "has_rpu is already set to %u",
+                   s->has_rpu);
+        return;
+    }
+
+    /* Create the Cortex R5s.  */
+    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
+        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
+                          "cortex-r5-" TYPE_ARM_CPU);
+        object_property_add_child(obj, "rpu-cpu[*]", OBJECT(&s->rpu_cpu[i]),
+                                  &error_abort);
+    }
+    s->has_rpu = value;
+}
+
 static void xlnx_zynqmp_setup_rpu(XlnxZynqMPState *s, const char *boot_cpu,
                                   Error **errp)
 {
@@ -118,6 +152,11 @@ static void xlnx_zynqmp_init(Object *obj)
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
 
+    object_property_add_bool(obj, "has_rpu",
+                             xlnx_zynqmp_get_has_rpu,
+                             xlnx_zynqmp_set_has_rpu,
+                             &error_abort);
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
         object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
                           "cortex-a53-" TYPE_ARM_CPU);
@@ -125,13 +164,6 @@ static void xlnx_zynqmp_init(Object *obj)
                                   &error_abort);
     }
 
-    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
-        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
-                          "cortex-r5-" TYPE_ARM_CPU);
-        object_property_add_child(obj, "rpu-cpu[*]", OBJECT(&s->rpu_cpu[i]),
-                                  &error_abort);
-    }
-
     object_property_add_link(obj, "ddr-ram", TYPE_MEMORY_REGION,
                              (Object **)&s->ddr_ram,
                              qdev_prop_allow_set_link_before_realize,
@@ -290,7 +322,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 1, irq);
     }
 
-    xlnx_zynqmp_setup_rpu(s, boot_cpu, errp);
+    if (s->has_rpu) {
+        xlnx_zynqmp_setup_rpu(s, boot_cpu, errp);
+    }
 
     if (!s->boot_cpu_ptr) {
         error_setg(errp, "ZynqMP Boot cpu %s not found", boot_cpu);
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 38d4c8c..68f6eb0 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -87,6 +87,8 @@ typedef struct XlnxZynqMPState {
 
     /* Has the ARM Security extensions?  */
     bool secure;
+    /* Has the RPU subsystem?  */
+    bool has_rpu;
 }  XlnxZynqMPState;
 
 #define XLNX_ZYNQMP_H
-- 
2.5.0

