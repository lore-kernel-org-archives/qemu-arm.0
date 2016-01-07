Received: by 10.182.158.201 with SMTP id ww9csp659306obb;
        Thu, 7 Jan 2016 07:50:27 -0800 (PST)
X-Received: by 10.28.51.141 with SMTP id z135mr16769392wmz.85.1452181825571;
        Thu, 07 Jan 2016 07:50:25 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com. [2a00:1450:400c:c09::22f])
        by mx.google.com with ESMTPS id e10si20575538wmi.83.2016.01.07.07.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) client-ip=2a00:1450:400c:c09::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22f.google.com with SMTP id f206so102495922wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=NCchTJCOH5WFRH5z9+Rfzb3rdqrNesU0tmG+a3NqWvM=;
        b=HEoVPpCYQkVkBX13D2A4lIgDo0tZOs4Z5EBpA2TfTcWOH4COJS9evxauZYUbTUrltM
         z2U12DCSE/zTs21Mw2ddiE9PAScuI78L3V2J/0LkzyZzPVMrqBHhbjonpEp9A2u8ck7Y
         vtu1bX1SZdWFp/xdKMz0gVCMNABrGvHfh3DKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=NCchTJCOH5WFRH5z9+Rfzb3rdqrNesU0tmG+a3NqWvM=;
        b=UTAe8fPEWViZvo6tzGKYLPikNZgC4BAuT9GmBOveAmkNvEp4opj+PgZQS2RW2WHwqN
         nCYCrjVnlTTWbO8eYiFyXQ2JGjnHbAoiCPBjmqdDlqCIa0939FmrhTA27VuznWoHaoS/
         x3BJ4xn/H7efOLqfVITM9t2+15sv9VagCvKrMbhfXVHwEceBgLuzQkId7Fxfunu+D+qL
         shMTCj2iFJhoXAmZI4lAuWgTSZ6K9G4pYYt88g97ZVIsOYgcg3qOc0ySpqxo5coOVMYs
         zXuswvisEB0Eatio/in3y9BZI2PvN3aINZkji3FSF0UJu8LJoWtUO4S+VVzhD9/fYKuo
         6Rlg==
X-Gm-Message-State: ALoCoQm1ZBIzHLnWzP5/69d6zvkPxgzWggEZ43QTnwPeP8d9eQqdRBBgNZYdRD9Bhsn6+ZLY5qrnNKCWIK+pZi3nPxAcCVObtg==
X-Received: by 10.28.107.152 with SMTP id a24mr11022467wmi.101.1452181825270;
        Thu, 07 Jan 2016 07:50:25 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:23 -0800 (PST)
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
Subject: [PATCH v3 1/8] hw/vfio/platform: amd-xgbe device
Date: Thu,  7 Jan 2016 15:50:08 +0000
Message-Id: <1452181815-1948-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c0ZTCVHCo/Xf

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
