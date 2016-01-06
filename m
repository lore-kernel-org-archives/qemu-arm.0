Received: by 10.182.158.201 with SMTP id ww9csp9755obb;
        Wed, 6 Jan 2016 07:13:28 -0800 (PST)
X-Received: by 10.194.109.194 with SMTP id hu2mr104995313wjb.134.1452093208869;
        Wed, 06 Jan 2016 07:13:28 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id q200si13111319wmg.67.2016.01.06.07.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id b14so79911851wmb.1
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=NCchTJCOH5WFRH5z9+Rfzb3rdqrNesU0tmG+a3NqWvM=;
        b=iSIsflJunSb4ZuMszTR6UzxDBvfDfk8GoBC2lb04ZVYtHyiC+J7/B3w5Vst0E8aP37
         biRrqsmQR7OJz65TP24/NswhkofcknKiAscJmRxd3Iq0LeP/3N9da6CJav3s+g04svr5
         VnShDLO8ivnd5EtR6/UfWR4qAI2lONfS87BCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=NCchTJCOH5WFRH5z9+Rfzb3rdqrNesU0tmG+a3NqWvM=;
        b=IihOINm5BDE2o8IN8+mSl+IqL5usu3jnrXIk6+EUBR8SSsShW+LmWnke5M4mtWtbFA
         kdeydIGBwBNfcZt40782fI3lh3WeRR3T0ZXoUfsnLApf6ASxJMrrsqnOFUOu6csNlK5r
         uQ65JKKK0VCXRxtYMAUCUBbRs7ZfG3qNWLXfqo4PzVaFBOjdObTsc4CCkRUmwgYJD/oJ
         6uaPtN3J0wIqvHHCzYdT9ZnF5ilW/TAgDydWm4nSlfsfJBen13xy/fpMn5nrXQAE/T0D
         e53uLvE19Biuz5fppG2pyDRiSNb6ZGV73nmKbGlG4NybgR+D3ileKSHVI0lK/EMl42lz
         T78Q==
X-Gm-Message-State: ALoCoQlMDIC9nHMLXYx4o/NE5CuSZxoh+qEju9IIVF2IO6Bz8ap/KiMSaBMmhS3yJESNnSazRixgUzX4Io1E8BQ9Ec/HxO4/Fg==
X-Received: by 10.28.63.200 with SMTP id m191mr11316977wma.67.1452093208578;
        Wed, 06 Jan 2016 07:13:28 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:26 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v2 1/7] hw/vfio/platform: amd-xgbe device
Date: Wed,  6 Jan 2016 15:13:19 +0000
Message-Id: <1452093205-30167-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q5E9ERcnvlgz

This patch introduces the amd-xgbe VFIO platform device. It
allows the guest to do passthrough on a device exposing an
"amd,xgbe-seattle-v1a" compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Alex Benné<alex.bennee@linaro.org>

---
RFC -> v1:
- add Alex' R-b
---
 hw/vfio/Makefile.objs           |  1 +
 hw/vfio/amd-xgbe.c              | 55 +++++++++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-amd-xgbe.h | 51 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 hw/vfio/amd-xgbe.c
 create mode 100644 include/hw/vfio/vfio-amd-xgbe.h

diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
index d324863..ceddbb8 100644
--- a/hw/vfio/Makefile.objs
+++ b/hw/vfio/Makefile.objs
@@ -3,4 +3,5 @@ obj-$(CONFIG_SOFTMMU) += common.o
 obj-$(CONFIG_PCI) += pci.o pci-quirks.o
 obj-$(CONFIG_SOFTMMU) += platform.o
 obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
+obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
 endif
diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
new file mode 100644
index 0000000..53451eb
--- /dev/null
+++ b/hw/vfio/amd-xgbe.c
@@ -0,0 +1,55 @@
+/*
+ * AMD XGBE VFIO device
+ *
+ * Copyright Linaro Limited, 2015
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include "hw/vfio/vfio-amd-xgbe.h"
+
+static void amd_xgbe_realize(DeviceState *dev, Error **errp)
+{
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
+    VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
+
+    vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
+
+    k->parent_realize(dev, errp);
+}
+
+static const VMStateDescription vfio_platform_amd_xgbe_vmstate = {
+    .name = TYPE_VFIO_AMD_XGBE,
+    .unmigratable = 1,
+};
+
+static void vfio_amd_xgbe_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VFIOAmdXgbeDeviceClass *vcxc =
+        VFIO_AMD_XGBE_DEVICE_CLASS(klass);
+    vcxc->parent_realize = dc->realize;
+    dc->realize = amd_xgbe_realize;
+    dc->desc = "VFIO AMD XGBE";
+    dc->vmsd = &vfio_platform_amd_xgbe_vmstate;
+}
+
+static const TypeInfo vfio_amd_xgbe_dev_info = {
+    .name = TYPE_VFIO_AMD_XGBE,
+    .parent = TYPE_VFIO_PLATFORM,
+    .instance_size = sizeof(VFIOAmdXgbeDevice),
+    .class_init = vfio_amd_xgbe_class_init,
+    .class_size = sizeof(VFIOAmdXgbeDeviceClass),
+};
+
+static void register_amd_xgbe_dev_type(void)
+{
+    type_register_static(&vfio_amd_xgbe_dev_info);
+}
+
+type_init(register_amd_xgbe_dev_type)
diff --git a/include/hw/vfio/vfio-amd-xgbe.h b/include/hw/vfio/vfio-amd-xgbe.h
new file mode 100644
index 0000000..9fff65e
--- /dev/null
+++ b/include/hw/vfio/vfio-amd-xgbe.h
@@ -0,0 +1,51 @@
+/*
+ * VFIO AMD XGBE device
+ *
+ * Copyright Linaro Limited, 2015
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HW_VFIO_VFIO_AMD_XGBE_H
+#define HW_VFIO_VFIO_AMD_XGBE_H
+
+#include "hw/vfio/vfio-platform.h"
+
+#define TYPE_VFIO_AMD_XGBE "vfio-amd-xgbe"
+
+/**
+ * This device exposes:
+ * - 5 MMIO regions: MAC, PCS, SerDes Rx/Tx regs,
+     SerDes Integration Registers 1/2 & 2/2
+ * - 2 level sensitive IRQs and optional DMA channel IRQs
+ */
+struct VFIOAmdXgbeDevice {
+    VFIOPlatformDevice vdev;
+};
+
+typedef struct VFIOAmdXgbeDevice VFIOAmdXgbeDevice;
+
+struct VFIOAmdXgbeDeviceClass {
+    /*< private >*/
+    VFIOPlatformDeviceClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+};
+
+typedef struct VFIOAmdXgbeDeviceClass VFIOAmdXgbeDeviceClass;
+
+#define VFIO_AMD_XGBE_DEVICE(obj) \
+     OBJECT_CHECK(VFIOAmdXgbeDevice, (obj), TYPE_VFIO_AMD_XGBE)
+#define VFIO_AMD_XGBE_DEVICE_CLASS(klass) \
+     OBJECT_CLASS_CHECK(VFIOAmdXgbeDeviceClass, (klass), \
+                        TYPE_VFIO_AMD_XGBE)
+#define VFIO_AMD_XGBE_DEVICE_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(VFIOAmdXgbeDeviceClass, (obj), \
+                      TYPE_VFIO_AMD_XGBE)
+
+#endif
-- 
1.9.1
