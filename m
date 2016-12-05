Received: by 10.25.159.131 with SMTP id i125csp1771740lfe;
        Mon, 5 Dec 2016 13:47:12 -0800 (PST)
X-Received: by 10.55.48.72 with SMTP id w69mr58848492qkw.320.1480974432871;
        Mon, 05 Dec 2016 13:47:12 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 60si9910086qtc.74.2016.12.05.13.47.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9FE061BA0;
	Mon,  5 Dec 2016 21:47:11 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKX019596;
	Mon, 5 Dec 2016 16:47:08 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 03/15] arm/arm64: ITS skeleton
Date: Mon,  5 Dec 2016 22:46:34 +0100
Message-Id: <1480974406-29345-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 05 Dec 2016 21:47:12 +0000 (UTC)
X-TUID: Nedmzz3tzJus

At the moment we just detect the presence of ITS as part of the
GICv3 init routine and initialize its base address.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/Makefile.common        |  1 +
 lib/arm/asm/gic-v3-its.h   | 22 ++++++++++++++++++++++
 lib/arm/asm/gic.h          |  1 +
 lib/arm/gic-v3-its.c       |  9 +++++++++
 lib/arm/gic.c              | 30 +++++++++++++++++++++++++-----
 lib/arm64/asm/gic-v3-its.h |  1 +
 6 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm/gic-v3-its.c
 create mode 100644 lib/arm64/asm/gic-v3-its.h

diff --git a/arm/Makefile.common b/arm/Makefile.common
index 6c0898f..070f349 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -47,6 +47,7 @@ cflatobjs += lib/arm/bitops.o
 cflatobjs += lib/arm/psci.o
 cflatobjs += lib/arm/smp.o
 cflatobjs += lib/arm/gic.o lib/arm/gic-v2.o lib/arm/gic-v3.o
+cflatobjs += lib/arm/gic-v3-its.o
 
 libeabi = lib/arm/libeabi.a
 eabiobjs = lib/arm/eabi_compat.o
diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
new file mode 100644
index 0000000..2044565
--- /dev/null
+++ b/lib/arm/asm/gic-v3-its.h
@@ -0,0 +1,22 @@
+/*
+ * All ITS* defines are lifted from include/linux/irqchip/arm-gic-v3.h
+ *
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#ifndef _ASMARM_GIC_V3_ITS_H_
+#define _ASMARM_GIC_V3_ITS_H_
+
+#ifndef __ASSEMBLY__
+
+struct its_data {
+	void *base;
+};
+
+extern struct its_data its_data;
+
+#define gicv3_its_base()		(its_data.base)
+
+#endif /* !__ASSEMBLY__ */
+#endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index ea5fde9..73d4502 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -30,6 +30,7 @@
 
 #include <asm/gic-v2.h>
 #include <asm/gic-v3.h>
+#include <asm/gic-v3-its.h>
 
 #ifndef __ASSEMBLY__
 #include <asm/cpumask.h>
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
new file mode 100644
index 0000000..e382b80
--- /dev/null
+++ b/lib/arm/gic-v3-its.c
@@ -0,0 +1,9 @@
+/*
+ * Copyright (C) 2016, Red Hat Inc, Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <asm/gic.h>
+
+struct its_data its_data;
+
diff --git a/lib/arm/gic.c b/lib/arm/gic.c
index 957a146..e551abd 100644
--- a/lib/arm/gic.c
+++ b/lib/arm/gic.c
@@ -6,6 +6,7 @@
 #include <devicetree.h>
 #include <asm/gic.h>
 #include <asm/io.h>
+#include <asm/gic-v3-its.h>
 
 struct gic_common_ops *gic_common_ops;
 
@@ -17,12 +18,14 @@ struct gicv3_data gicv3_data;
  * Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
  */
 static bool
-gic_get_dt_bases(const char *compatible, void **base1, void **base2)
+gic_get_dt_bases(const char *compatible, void **base1, void **base2,
+		 void **base3)
 {
 	struct dt_pbus_reg reg;
-	struct dt_device gic;
+	struct dt_device gic, its;
 	struct dt_bus bus;
-	int node, ret;
+	int node, subnode, ret, len;
+	const void *fdt = dt_fdt();
 
 	dt_bus_init_defaults(&bus);
 	dt_device_init(&gic, &bus, NULL);
@@ -43,19 +46,36 @@ gic_get_dt_bases(const char *compatible, void **base1, void **base2)
 	assert(ret == 0);
 	*base2 = ioremap(reg.addr, reg.size);
 
+	if (base3 && !strcmp(compatible, "arm,gic-v3")) {
+		dt_for_each_subnode(node, subnode) {
+			const struct fdt_property *prop;
+
+			prop = fdt_get_property(fdt, subnode,
+						"compatible", &len);
+			if (!strcmp((char *)prop->data, "arm,gic-v3-its")) {
+				dt_device_bind_node(&its, subnode);
+				ret = dt_pbus_translate(&its, 0, &reg);
+				assert(ret == 0);
+				*base3 = ioremap(reg.addr, reg.size);
+				break;
+			}
+		}
+
+	}
+
 	return true;
 }
 
 int gicv2_init(void)
 {
 	return gic_get_dt_bases("arm,cortex-a15-gic",
-			&gicv2_data.dist_base, &gicv2_data.cpu_base);
+			&gicv2_data.dist_base, &gicv2_data.cpu_base, NULL);
 }
 
 int gicv3_init(void)
 {
 	return gic_get_dt_bases("arm,gic-v3", &gicv3_data.dist_base,
-			&gicv3_data.redist_base[0]);
+			&gicv3_data.redist_base[0], &its_data.base);
 }
 
 int gic_init(void)
diff --git a/lib/arm64/asm/gic-v3-its.h b/lib/arm64/asm/gic-v3-its.h
new file mode 100644
index 0000000..083cba4
--- /dev/null
+++ b/lib/arm64/asm/gic-v3-its.h
@@ -0,0 +1 @@
+#include "../../arm/asm/gic-v3-its.h"
-- 
2.5.5
