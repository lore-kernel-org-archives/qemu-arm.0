Received: by 10.103.98.197 with SMTP id w188csp391591vsb;
        Tue, 21 Feb 2017 05:43:59 -0800 (PST)
X-Received: by 10.200.43.201 with SMTP id n9mr26289703qtn.243.1487684639697;
        Tue, 21 Feb 2017 05:43:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si15106668qkc.197.2017.02.21.05.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAjX-0005nw-5d
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:43:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAKv-0006W8-FN
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAKu-0003Xc-BV
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:18:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgAKu-0003XE-2q; Tue, 21 Feb 2017 08:18:32 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F5B78047A;
	Tue, 21 Feb 2017 13:18:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LDIPH7028228; Tue, 21 Feb 2017 08:18:29 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 14:18:19 +0100
Message-Id: <1487683100-16013-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Feb 2017 13:18:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] vfio/platform: make the vfio-platform device
 non abstract
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
Cc: okaya@codeaurora.org, pelcan@codeaurora.org, vikrams@codeaurora.org,
	shankerd@codeaurora.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agDP7LDwbEzb

Up to now the vfio-platform device has been abstract and could not be
instantiated. The integration of a new vfio platform device required
to create a dummy derived device which only set the compatibility
string.

Following the few vfio-platform device integration we have seen
the actual requested adaptation happens on device tree node creation
(sysbus-fdt).

So this patch removes the abstract setting and defines 2 new options,
manufacturer and model that are used to build a compatibility string.

This latter will be used to match the device tree node creation
function

sysbus-fdt does not support the instantiation of the vfio-platform
device yet.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/platform.c              | 18 ++++++++++++++++--
 include/hw/vfio/vfio-platform.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index a4663c9..73c0489 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -637,7 +637,20 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
     SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
     VFIODevice *vbasedev = &vdev->vbasedev;
-    int i, ret;
+    int i, ret = -EINVAL;
+
+    if (!vdev->compat) {
+        if (!vdev->model) {
+            error_setg(errp, "no usable compatible string");
+            goto out;
+        }
+        if (!vdev->manufacturer) {
+            vdev->compat = g_strdup(vdev->model);
+        } else {
+            vdev->compat = g_strjoin(",", vdev->manufacturer,
+                                     vdev->model, NULL);
+        }
+    }
 
     vbasedev->type = VFIO_DEVICE_TYPE_PLATFORM;
     vbasedev->ops = &vfio_platform_ops;
@@ -678,6 +691,8 @@ static const VMStateDescription vfio_platform_vmstate = {
 static Property vfio_platform_dev_properties[] = {
     DEFINE_PROP_STRING("host", VFIOPlatformDevice, vbasedev.name),
     DEFINE_PROP_STRING("sysfsdev", VFIOPlatformDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
+    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPlatformDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_UINT32("mmap-timeout-ms", VFIOPlatformDevice,
                        mmap_timeout, 1100),
@@ -704,7 +719,6 @@ static const TypeInfo vfio_platform_dev_info = {
     .instance_size = sizeof(VFIOPlatformDevice),
     .class_init = vfio_platform_class_init,
     .class_size = sizeof(VFIOPlatformDeviceClass),
-    .abstract   = true,
 };
 
 static void register_vfio_platform_dev_type(void)
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 9baaa2db..31b9a98 100644
--- a/include/hw/vfio/vfio-platform.h
+++ b/include/hw/vfio/vfio-platform.h
@@ -55,6 +55,8 @@ typedef struct VFIOPlatformDevice {
     /* queue of pending IRQs */
     QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
     char *compat; /* compatibility string */
+    char *manufacturer; /* manufacturer (1st part of the compatible property) */
+    char *model; /* model (2d part of the compatible property) */
     uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
     QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
     QemuMutex intp_mutex; /* protect the intp_list IRQ state */
-- 
2.5.5

