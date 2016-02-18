Received: by 10.25.208.211 with SMTP id h202csp736859lfg;
        Thu, 18 Feb 2016 09:45:57 -0800 (PST)
X-Received: by 10.28.97.136 with SMTP id v130mr4527132wmb.20.1455817556788;
        Thu, 18 Feb 2016 09:45:56 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com. [2a00:1450:400c:c09::22f])
        by mx.google.com with ESMTPS id d95si6732273wma.48.2016.02.18.09.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) client-ip=2a00:1450:400c:c09::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22f.google.com with SMTP id g62so40169829wme.1
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=2qXCg2jgKQle8ICuFFR4Qf3Xp/liywVsUEm3WNnmO9A=;
        b=K5PFYmY7oSM3XKp/b29z/vgvRmuD64LSj2XaGzfdU5VeISZriaeA2kaet/g8qFe9IZ
         PrYCSj//88yWf5SI+iBV2LRJgQHiNFqviSgwWmNXOOnmUIJVQIYGz5VgEaRzBMIGdPQ1
         l6VZGvJ1i30xZ/aVylRf034JTT66c75faHpn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=2qXCg2jgKQle8ICuFFR4Qf3Xp/liywVsUEm3WNnmO9A=;
        b=P6XJ/jeoFwcfTSviGJZTVZ0Rtn5ZuxeSSuUSuvEdmp4GNOepBbSYtM0aOFGh1wKmuI
         EUmoufQqdrAn7sdkZxDonnGv1Tb5SrxerY61lb2ejt9Mx/5gkHhcxou8nwA4hjwDKgoT
         H+GWs1Lvs/fNG2WvKygMBGxOhH0REGtTDJO04ynJwcfhqI59oe+xImitOJoCg+ndUR/j
         YYQJ0JuE6a3VsaPu12TytGLvIpDYZoUOa9qFriBJ7ggJZw38/f9J05h1ndeYQ3qO3HUn
         kcigQGbiudOQV9UqgikhslKSWzYLLOwnP1VTF9j9ICwOSELP8ULabwcCk1dfRQ9a2Toc
         A7XA==
X-Gm-Message-State: AG10YORfQa3kyFYKkWqRSVxmJkiQEVZcqnjTorPXc8cxLkVTxo4Ql4ihSYZ8piRiowvnFPWwRiw=
X-Received: by 10.194.250.35 with SMTP id yz3mr9706956wjc.173.1455817556610;
        Thu, 18 Feb 2016 09:45:56 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.45.54
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:54 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.williamson@redhat.com,
	david@gibson.dropbear.id.au
Cc: christoffer.dall@linaro.org,
	suravee.suthikulpanit@amd.com,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	thomas.lendacky@amd.com
Subject: [PATCH v7 1/8] hw/vfio/platform: amd-xgbe device
Date: Thu, 18 Feb 2016 17:45:39 +0000
Message-Id: <1455817546-6564-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: avx23mvMZUgy

This patch introduces the amd-xgbe VFIO platform device. It
allows the guest to do passthrough on a device exposing an
"amd,xgbe-seattle-v1a" compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

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
1.8.3.2
