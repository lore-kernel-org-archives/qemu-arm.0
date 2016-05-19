Received: by 10.25.208.137 with SMTP id h131csp3300043lfg;
        Thu, 19 May 2016 15:58:53 -0700 (PDT)
X-Received: by 10.140.156.195 with SMTP id c186mr1382206qhc.58.1463698733005;
        Thu, 19 May 2016 15:58:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d184si15068657qke.40.2016.05.19.15.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Wu4-0003ui-EE
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpr-0008NK-8i
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpo-0007GZ-Tq
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:30 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpl-0007Fi-De; Thu, 19 May 2016 18:54:25 -0400
Received: by mail-wm0-x243.google.com with SMTP id n129so24860646wmn.1;
	Thu, 19 May 2016 15:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3a0GDCxOVF9E4rTvdUj+XonEggFOAlauUOBOCtNWntM=;
	b=RR36N4rqLrK45+EEaNVvbMR7VS45/vGoKMizYaXktPMGcniAmFl0cM81jSyHaIK8Tz
	bq52Gf46sXAvhxKNJZ8QJI9z0viIlL9lhUGooq8+yb60lktaJZTb4Sn/8S5Ll8oeUWKo
	b7AqQa0MWYC4xMOax1wvW+qZShxuAW24NW6HAxC5E/diLpegAZH7lLXQHfIkzgj37pNF
	lYVZ0XpvMuUUPriJUUK3FrRz8R3UZ+b9nTME8w+tuWWhQLeUxS0MfMVuLx5eefa7d1Rz
	IbdWDNnkYRwx4e+kb3q/AZWWodhoaLkS5iBgxeb9AJ9+SoYAyeM2/wR3aE6sYOL3hr4T
	Xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3a0GDCxOVF9E4rTvdUj+XonEggFOAlauUOBOCtNWntM=;
	b=D5XqZLCjC1mLfEuN6jq78YyyeZ9JAhLWlYSNqxV6yw3F83QvQLt+FvEdMXwHxVtgka
	EmtVEKq7tVXqu7Tb3MfQZzUuZxzSSbtyyG6d6b83Z8UqT6IBcXPEJKSWT6LaSKwLdj7Z
	z7IW8LKrsdRj6y356Jf1oq9N5w6DIczLFwAlcgvLRcJ3y0JpmzMzAPC6y5DtRFtMQKwq
	ndMjrkxFqp8tdzjEYYnIaCqyD/CdRB0Q0QZudsEdl+xTsXG8d85c132u3BUxzXvXv+sn
	NAgCDdt65AnxABEqa0iL3DsjxGziwaStgSwepCU3aNSApnBs8ekQmL0dXN4lOSEW0IBY
	1bAw==
X-Gm-Message-State: AOPr4FWpoz6//5eYm+kcLY7sEXs01QQCQKSt9DZwp0ZU8dPg0fPdZOcIp2zl5TXKgwTWrA==
X-Received: by 10.28.5.140 with SMTP id 134mr151359wmf.80.1463698464325;
	Thu, 19 May 2016 15:54:24 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	jr8sm16728557wjb.15.2016.05.19.15.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:23 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:16 +0200
Message-Id: <1463698459-31312-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-arm] [PATCH v1 2/5] xlnx-zynqmp: Break out RPU setup into a
 separate function
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
X-TUID: vzewaGh8GXDt

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Break out RPU setup into a separate function. This is in
preparation for making the RPU optional.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 53 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 965a250..250ecc4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -83,6 +83,36 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
     return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
 }
 
+static void xlnx_zynqmp_setup_rpu(XlnxZynqMPState *s, const char *boot_cpu,
+                                  Error **errp)
+{
+    Error *err = NULL;
+    int i;
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
+        char *name;
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
@@ -260,28 +290,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
-    }
+    xlnx_zynqmp_setup_rpu(s, boot_cpu, errp);
 
     if (!s->boot_cpu_ptr) {
         error_setg(errp, "ZynqMP Boot cpu %s not found", boot_cpu);
-- 
2.5.0

