Received: by 10.28.71.27 with SMTP id u27csp1204251wma;
        Fri, 9 Feb 2018 09:41:29 -0800 (PST)
X-Google-Smtp-Source: AH8x225vL5K7XgQ14VbQ5tzhVRNWyQee5ClcAI1WLUpMoMxEEjpQbkX2Y5fFQlDfB+ziqL118QdW
X-Received: by 10.37.65.216 with SMTP id o207mr2407964yba.172.1518198089029;
        Fri, 09 Feb 2018 09:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198089; cv=none;
        d=google.com; s=arc-20160816;
        b=byQE0zML669bGcWubE35TIcXlLI63SzU+VjKzqy41EPbMkU8aDO3w744DEhOBC3kdi
         rv8poFOhwaFxBHR7zybGIGeGjIxsts7MV3rGnRAJz4Q83/3Xk+xCKUDST+VbCJXBByhU
         WW+Oo7+i2+jRoIWjpJmUwoeSFB/U4p0gSESpRNqtEAM1oOCu2cg7ZhDee8HI9jOxmu+q
         AOiqzAqk/HG8n8EatCcBXC2qCGjnWPGUNgxr0bz6ohHzfQbTT24aYaEb/zxXWwBJI0xQ
         n6FJ3UN232pJZ3nkZhLngEGa3hKI7SSlZbRmeXfDdh6YrsSB3EY6rM0CUhaIU8kdKqUS
         WRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PNCPAaUfxHTEDQWCqY+VFUmGR+pmOUnTKCGiUD9plh0=;
        b=wVkxsx0J58orMQtCgOnvl0J8YufM3pO5NOM4ViEXtxjO87xcnQD+YjoXD/+LxYOhBj
         Taw/6v1e03lODh1czKNyHEa++hnCS7KFDFou8Oq8eWwJ9LutlYFUPAfU2ZtqDANqXVvy
         pp1D7oO5ZNKfZSSfD/MijjVrC34XX+uSOmIQ8jyFywpy4SGZatp4euqJ+0dmHl186pXb
         UvTgRpMukg8ywG/H2t9lZxIVJiBkfs6xqaw+1GYpN+6nK6nRkwCZ8KREJ71XQeLp8jky
         cBQwvXc50B7p7wyif5Trs2PbcB3ah9mOHUj82UYs6Spzi7p0JCb2Pc6wXDsCoD7ffTHg
         U3tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19si486606ywa.174.2018.02.09.09.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:41:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCfw-0003ZK-Co
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:41:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDa-0007MB-MR
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 11:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDY-0001Ft-DJ
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 11:08:06 -0500
Received: from leibniz.telenet-ops.be ([2a02:1800:110:4::f00:d]:34040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekBDX-0001Es-VG
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 11:08:04 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be
	[IPv6:2a02:1800:120:4::f00:15])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3zdJwl3ZK2zMqgCS
	for <qemu-devel@nongnu.org>; Fri,  9 Feb 2018 16:32:55 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by andre.telenet-ops.be with bizsmtp
	id 8fHm1x02J3XaVaC01fHmfz; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003Rv-Mv; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lF-M2; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:32 +0100
Message-Id: <1518189456-2873-2-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a02:1800:110:4::f00:d
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:16 -0500
Subject: [Qemu-devel] [PATCH/RFC 1/5] vfio/platform: make the vfio-platform
 device non abstract
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZt/aXKQySHg

From: Auger Eric <eric.auger@redhat.com>

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
[geert: Rebase, Set user_creatable=true]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/vfio/platform.c              | 20 ++++++++++++++++++--
 include/hw/vfio/vfio-platform.h |  2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 0d4bc0aae8891435..32bed1974e23c569 100644
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
     vbasedev->dev = dev;
@@ -681,6 +694,8 @@ static const VMStateDescription vfio_platform_vmstate = {
 static Property vfio_platform_dev_properties[] = {
     DEFINE_PROP_STRING("host", VFIOPlatformDevice, vbasedev.name),
     DEFINE_PROP_STRING("sysfsdev", VFIOPlatformDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
+    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPlatformDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_UINT32("mmap-timeout-ms", VFIOPlatformDevice,
                        mmap_timeout, 1100),
@@ -699,6 +714,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
     dc->desc = "VFIO-based platform device assignment";
     sbc->connect_irq_notifier = vfio_start_irqfd_injection;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    /* Supported by TYPE_VIRT_MACHINE */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_platform_dev_info = {
@@ -707,7 +724,6 @@ static const TypeInfo vfio_platform_dev_info = {
     .instance_size = sizeof(VFIOPlatformDevice),
     .class_init = vfio_platform_class_init,
     .class_size = sizeof(VFIOPlatformDeviceClass),
-    .abstract   = true,
 };
 
 static void register_vfio_platform_dev_type(void)
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 9baaa2db09b84f3e..31b9a9800f7d9d00 100644
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
2.7.4

