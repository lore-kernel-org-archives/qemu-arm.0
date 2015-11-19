Received: by 10.182.158.201 with SMTP id ww9csp2021950obb;
        Thu, 19 Nov 2015 07:24:49 -0800 (PST)
X-Received: by 10.31.49.130 with SMTP id x124mr5147792vkx.146.1447946687694;
        Thu, 19 Nov 2015 07:24:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si4472153vkv.135.2015.11.19.07.24.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 07:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR4p-0007cl-9S
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:24:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2R-0003J8-GC
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2O-0000hK-St
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:19 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2O-0000h4-Jm
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:16 -0500
Received: by wmww144 with SMTP id w144so242967466wmw.1
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SnxpkTtIJED9Yv+yY9DDWEyLR7oOf82jsU1eJ3ek/To=;
	b=G0cPvCP/+RsDqvBO97NE5RVloTeaId6QTjbJzcCXObU70LzsYBRV8GZVqgTtjf2h9P
	mCHW/ikdNGbfWWvJjKGID2k2UOkiHsZlhGcRXBHiymdRoMcP3A/NfPctVk7XHHlCDCFY
	0ArYEZ9eFUwhUw3XgJv+h7LCeVuLAp1mpxJdJ8a8bc/buxO++8fZiGgq3ZBPzNlLZ09e
	KjLV+4QWjzFk2VUSZnsLQUeWsnO9z3cjXn8tog8PyUY9lUsEfH++tD2gGUHwAb8B2UfT
	H/+x3u68NIaklwhLIgsCusiQrgF5M9h4j+j6LYBTIfXSciKxWgKpUM2uGGEt7IUvcf+L
	u5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SnxpkTtIJED9Yv+yY9DDWEyLR7oOf82jsU1eJ3ek/To=;
	b=HGpDFEOSwasQTM+wH59QpmsNpNv5WPTc8J4bWr6HEI3Ik1ymlU/1VCVknVrX7+mwsC
	9Dj8XA+nQuwGHkv3MFfO4N03xvdNV7Gu52DyMCPlBO8LFSLZji5Wbfd7mhQSxTSczqvl
	oyhmFAvYvP+j26bEr3YIaILID6h+wafdPBpqO7Hhcvdd3v/6ESMDkI1aPFaqeWDUpJPN
	aR1j982PS5zSqwXCvVpMVMfFbcWFpeCf9In+w3Sx1zpXnQ2K+gE4yGr2TH2pySyaDPB1
	67Ky53RB1wd4mxuOOby3Z7x28MRgnkVlybNpYkk6amZWrZ6Kg+o/30yhtUGuJdU+saGB
	Tyjg==
X-Gm-Message-State: ALoCoQmd1vNKKYbvkc4OPSH7ltcMarjlOAmjJ7edWYd25K7jcmujDZc2TRiOhn8PzxbKMeH7IQU/
X-Received: by 10.28.194.135 with SMTP id s129mr15722777wmf.38.1447946535993; 
	Thu, 19 Nov 2015 07:22:15 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.14
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:15 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:03 +0000
Message-Id: <1447946528-1533-2-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 1/6] hw/vfio/platform: amd-xgbe device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VS86x7G4wwtj

This patch introduces the amd-xgbe VFIO platform device. It
allows the guest to do passthrough on a device exposing an
"amd,xgbe-seattle-v1a" compat string.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
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

