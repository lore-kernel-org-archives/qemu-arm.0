Received: by 10.25.150.194 with SMTP id y185csp1205084lfd;
        Mon, 14 Nov 2016 13:09:01 -0800 (PST)
X-Received: by 10.200.46.234 with SMTP id i39mr7775151qta.167.1479157741036;
        Mon, 14 Nov 2016 13:09:01 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j186si6924980qkf.301.2016.11.14.13.09.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 13:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29EF6811D8;
	Mon, 14 Nov 2016 21:09:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAEL8fjZ014878;
	Mon, 14 Nov 2016 16:08:57 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v6 06/11] arm/arm64: add initial gicv2 support
Date: Mon, 14 Nov 2016 22:08:34 +0100
Message-Id: <1479157719-31021-7-git-send-email-drjones@redhat.com>
In-Reply-To: <1479157719-31021-1-git-send-email-drjones@redhat.com>
References: <1479157719-31021-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 14 Nov 2016 21:09:00 +0000 (UTC)
X-TUID: HvBnPfPLmKtw

Add some gicv2 support. This just adds init and enable
functions, allowing unit tests to start messing with it.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v6: added comments (register offset headers) [Alex]
v5: share/use only the modern register names [Andre]
v4:
 - only take defines from kernel we need now [Andre]
 - moved defines to asm/gic.h so they'll be shared with v3 [drew]
 - simplify enable by not caring if we reinit the distributor [drew]
 - init all GICD_INT_DEF_PRI_X4 registers [Eric]
---
 arm/Makefile.common    |  1 +
 lib/arm/asm/gic-v2.h   | 34 ++++++++++++++++++++++
 lib/arm/asm/gic.h      | 39 ++++++++++++++++++++++++++
 lib/arm/gic.c          | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/arm64/asm/gic-v2.h |  1 +
 lib/arm64/asm/gic.h    |  1 +
 6 files changed, 152 insertions(+)
 create mode 100644 lib/arm/asm/gic-v2.h
 create mode 100644 lib/arm/asm/gic.h
 create mode 100644 lib/arm/gic.c
 create mode 100644 lib/arm64/asm/gic-v2.h
 create mode 100644 lib/arm64/asm/gic.h

diff --git a/arm/Makefile.common b/arm/Makefile.common
index f37b5c2a3de4..6f56015c43c4 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -46,6 +46,7 @@ cflatobjs += lib/arm/mmu.o
 cflatobjs += lib/arm/bitops.o
 cflatobjs += lib/arm/psci.o
 cflatobjs += lib/arm/smp.o
+cflatobjs += lib/arm/gic.o
 
 libeabi = lib/arm/libeabi.a
 eabiobjs = lib/arm/eabi_compat.o
diff --git a/lib/arm/asm/gic-v2.h b/lib/arm/asm/gic-v2.h
new file mode 100644
index 000000000000..c2d5fecd4886
--- /dev/null
+++ b/lib/arm/asm/gic-v2.h
@@ -0,0 +1,34 @@
+/*
+ * All GIC* defines are lifted from include/linux/irqchip/arm-gic.h
+ *
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#ifndef _ASMARM_GIC_V2_H_
+#define _ASMARM_GIC_V2_H_
+
+#ifndef _ASMARM_GIC_H_
+#error Do not directly include <asm/gic-v2.h>. Include <asm/gic.h>
+#endif
+
+#define GICD_ENABLE			0x1
+#define GICC_ENABLE			0x1
+
+#ifndef __ASSEMBLY__
+
+struct gicv2_data {
+	void *dist_base;
+	void *cpu_base;
+	unsigned int irq_nr;
+};
+extern struct gicv2_data gicv2_data;
+
+#define gicv2_dist_base()		(gicv2_data.dist_base)
+#define gicv2_cpu_base()		(gicv2_data.cpu_base)
+
+extern int gicv2_init(void);
+extern void gicv2_enable_defaults(void);
+
+#endif /* !__ASSEMBLY__ */
+#endif /* _ASMARM_GIC_V2_H_ */
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
new file mode 100644
index 000000000000..e3580bd1d42d
--- /dev/null
+++ b/lib/arm/asm/gic.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#ifndef _ASMARM_GIC_H_
+#define _ASMARM_GIC_H_
+
+#include <asm/gic-v2.h>
+
+/* Distributor registers */
+#define GICD_CTLR			0x0000
+#define GICD_TYPER			0x0004
+#define GICD_ISENABLER			0x0100
+#define GICD_IPRIORITYR			0x0400
+
+#define GICD_TYPER_IRQS(typer)		((((typer) & 0x1f) + 1) * 32)
+#define GICD_INT_EN_SET_SGI		0x0000ffff
+#define GICD_INT_DEF_PRI_X4		0xa0a0a0a0
+
+/* CPU interface registers */
+#define GICC_CTLR			0x0000
+#define GICC_PMR			0x0004
+
+#define GICC_INT_PRI_THRESHOLD		0xf0
+
+#ifndef __ASSEMBLY__
+
+/*
+ * gic_init will try to find all known gics, and then
+ * initialize the gic data for the one found.
+ * returns
+ *  0   : no gic was found
+ *  > 0 : the gic version of the gic found
+ */
+extern int gic_init(void);
+
+#endif /* !__ASSEMBLY__ */
+#endif /* _ASMARM_GIC_H_ */
diff --git a/lib/arm/gic.c b/lib/arm/gic.c
new file mode 100644
index 000000000000..d655105e058b
--- /dev/null
+++ b/lib/arm/gic.c
@@ -0,0 +1,76 @@
+/*
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <devicetree.h>
+#include <asm/gic.h>
+#include <asm/io.h>
+
+struct gicv2_data gicv2_data;
+
+/*
+ * Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
+ */
+static bool
+gic_get_dt_bases(const char *compatible, void **base1, void **base2)
+{
+	struct dt_pbus_reg reg;
+	struct dt_device gic;
+	struct dt_bus bus;
+	int node, ret;
+
+	dt_bus_init_defaults(&bus);
+	dt_device_init(&gic, &bus, NULL);
+
+	node = dt_device_find_compatible(&gic, compatible);
+	assert(node >= 0 || node == -FDT_ERR_NOTFOUND);
+
+	if (node == -FDT_ERR_NOTFOUND)
+		return false;
+
+	dt_device_bind_node(&gic, node);
+
+	ret = dt_pbus_translate(&gic, 0, &reg);
+	assert(ret == 0);
+	*base1 = ioremap(reg.addr, reg.size);
+
+	ret = dt_pbus_translate(&gic, 1, &reg);
+	assert(ret == 0);
+	*base2 = ioremap(reg.addr, reg.size);
+
+	return true;
+}
+
+int gicv2_init(void)
+{
+	return gic_get_dt_bases("arm,cortex-a15-gic",
+			&gicv2_data.dist_base, &gicv2_data.cpu_base);
+}
+
+int gic_init(void)
+{
+	if (gicv2_init())
+		return 2;
+	return 0;
+}
+
+void gicv2_enable_defaults(void)
+{
+	void *dist = gicv2_dist_base();
+	void *cpu_base = gicv2_cpu_base();
+	unsigned int i;
+
+	gicv2_data.irq_nr = GICD_TYPER_IRQS(readl(dist + GICD_TYPER));
+	if (gicv2_data.irq_nr > 1020)
+		gicv2_data.irq_nr = 1020;
+
+	for (i = 0; i < gicv2_data.irq_nr; i += 4)
+		writel(GICD_INT_DEF_PRI_X4, dist + GICD_IPRIORITYR + i);
+
+	writel(GICD_INT_EN_SET_SGI, dist + GICD_ISENABLER + 0);
+	writel(GICD_ENABLE, dist + GICD_CTLR);
+
+	writel(GICC_INT_PRI_THRESHOLD, cpu_base + GICC_PMR);
+	writel(GICC_ENABLE, cpu_base + GICC_CTLR);
+}
diff --git a/lib/arm64/asm/gic-v2.h b/lib/arm64/asm/gic-v2.h
new file mode 100644
index 000000000000..52226624a209
--- /dev/null
+++ b/lib/arm64/asm/gic-v2.h
@@ -0,0 +1 @@
+#include "../../arm/asm/gic-v2.h"
diff --git a/lib/arm64/asm/gic.h b/lib/arm64/asm/gic.h
new file mode 100644
index 000000000000..e5eb302a31b4
--- /dev/null
+++ b/lib/arm64/asm/gic.h
@@ -0,0 +1 @@
+#include "../../arm/asm/gic.h"
-- 
2.7.4
