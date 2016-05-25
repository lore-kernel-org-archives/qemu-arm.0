Received: by 10.25.30.65 with SMTP id e62csp1238228lfe;
        Wed, 25 May 2016 04:03:51 -0700 (PDT)
X-Received: by 10.55.214.18 with SMTP id t18mr2795041qki.202.1464174231366;
        Wed, 25 May 2016 04:03:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w70si7259967qkw.219.2016.05.25.04.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5WbO-0004HF-Ke
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQi-00033X-Di
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQg-0000zi-6P
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:52:47 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5WQf-0000yj-Rv; Wed, 25 May 2016 06:52:46 -0400
Received: by mail-wm0-x241.google.com with SMTP id n129so14183562wmn.1;
	Wed, 25 May 2016 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BcFZ2X4pMjIGw/F8AvgIwxrOKlnfrqFBcIGgJlnY6d0=;
	b=I4DC/qFt1J7bFRsfolwnpwrUCyHkDNJjNlJfDISpBP5x1DFvkNuC1RRaawx4kmePPz
	9wekNkRFnAMATXAuhHV4PajWx1WQdugKBA6OUpi/usm/fmXTj/AvivxdCdKYivU/rvdr
	q39JhR77FIjT10C10Wb0iEpnvu0FYgRzH8Guk5/zWsRlN4pgEBqLqxuSREL3/IMCoJQE
	VCxA6F1tH56F6PnRXYKLKAFG3dUVSFPnrIWbaS0j9JAXrGarfd7tAB0gKLnxLgvtS4zO
	sPj/+gicFO2XTJ2J9hb5gw3sxDgh+WpuCKnQf19UDKElSHv4K79jFTkxYvEk/jtOeHWb
	8cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BcFZ2X4pMjIGw/F8AvgIwxrOKlnfrqFBcIGgJlnY6d0=;
	b=aYnnm9u9X05n8P6FAbjNEvjVZiKx8IPGqejtnXBDZxfgpVuZIgoDte0lV8R7T39eq+
	fTcBMktv60I5oZ3B0WOvWeOVslwdudbayhsrEcTx5FKePBq3dxDVFoUTXuAT+pyJ9z/V
	9ee4VVy55H7nepdtTYG7m7dMX5NqyP4gRf8zubMUr+vKYSfBJqwUpsSLBenfwnycHLIH
	RGnk/jfzrdkTThw54lqOjpcHemgoAooU07eM4OVs4w29SVNWwk41bjzwto6np7uv5cfQ
	WheUypcxKUbhHPTh3WZxcbdRs//5iMK6D+X4AdiBWffvjerirgGX5lbmUWvtz9xiOqpx
	BQng==
X-Gm-Message-State: ALyK8tLwwr2FZ/FWMDe/nWa3sobMDgLgmSXQjFiFTO7NludkwSpmPI8JXtwoSSQ8FZS7kQ==
X-Received: by 10.194.107.6 with SMTP id gy6mr3181936wjb.20.1464173565086;
	Wed, 25 May 2016 03:52:45 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	ib1sm8074132wjb.48.2016.05.25.03.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 03:52:43 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 12:52:33 +0200
Message-Id: <1464173555-12800-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-devel] [PATCH v2 2/4] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1ZRuoAy7hA6

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The way we currently model the RPU subsystem is of quite
limited use. In addition to that, it causes problems for
KVM and for GDB debugging.

Make the RPU optional by adding a has_rpu property and
default to having it disabled.

This changes the default setup from having the RPU to not
longer having it.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 62 +++++++++++++++++++++++++++-----------------
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 965a250..3a8af6a 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -83,6 +83,41 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
     return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
 }
 
+static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
+                                   Error **errp)
+{
+    Error *err = NULL;
+    int i;
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
+        char *name;
+
+        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
+                          "cortex-r5-" TYPE_ARM_CPU);
+        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
+                                  OBJECT(&s->rpu_cpu[i]), &error_abort);
+
+        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
+        if (strcmp(name, boot_cpu)) {
+            /* Secondary CPUs start in PSCI powered-down state */
+            object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true,
+                                     "start-powered-off", &error_abort);
+        } else {
+            s->boot_cpu_ptr = &s->rpu_cpu[i];
+        }
+        g_free(name);
+
+        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
+                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
@@ -95,13 +130,6 @@ static void xlnx_zynqmp_init(Object *obj)
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
@@ -260,23 +288,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 1, irq);
     }
 
-    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
-        char *name;
-
-        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
-        if (strcmp(name, boot_cpu)) {
-            /* Secondary CPUs start in PSCI powered-down state */
-            object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true,
-                                     "start-powered-off", &error_abort);
-        } else {
-            s->boot_cpu_ptr = &s->rpu_cpu[i];
-        }
-        g_free(name);
-
-        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
-                                 &error_abort);
-        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "realized",
-                                 &err);
+    if (s->has_rpu) {
+        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
         if (err) {
             error_propagate(errp, err);
             return;
@@ -373,6 +386,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
+    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
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

