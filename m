Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp832162wrd;
        Thu, 13 Sep 2018 08:48:16 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbc0mYUSBSRXgVfYDeZzDO8ydiD1fThErU/pol9pgCJUBompK7g60s0QbPaoofyuZsBLl4z
X-Received: by 2002:a0c:d03a:: with SMTP id u55-v6mr5807723qvg.245.1536853696067;
        Thu, 13 Sep 2018 08:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536853696; cv=none;
        d=google.com; s=arc-20160816;
        b=YTcXU7iqFWj7brr1ISEVIp/QGIYxeh5/5E7yB5W6L5mQD95JkOAsFOlepXjqoYPHpO
         SdFCL57doQo0MFLfOr6CdXTA1wg8FoQEEtzen3peQy3NkY5SpDZnCuipFv5jk/hSfwOg
         rXb5qGVz5gXgT1JJzUfAKWQg+O8L/bhwtjyRgqzjc3heUw07DLq89I+kVjd+ZQ2hwahQ
         dH5KVFbOyGdpM+Jej342kvNPNydr26M3uWjhfL83OEreNwFXsuyhRlOqEQHNOmGqFXup
         eGD5NN7dOcWFSNT36yeVf1LUuUZhGeiRzkXYGait+4QDz+WC1B++EQhBEFbsXZF8B5iE
         9+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=7q4nCJegYAdgwtalYcuCFnXA3QSM0Sdx1DmGmT4aR2Y=;
        b=LCFIu3ceuD98ktnqsCegQZeyAANV2K8QnWVY/AJJcr8Vt7NlSqtD+0QAv9oBGRpHWD
         b2+9K7ZT9upII055OU1rHw2LAwsO+Qt0+kVmSFylDcPVfKVzHRt+/EgNAa3aVau4XFcE
         A1Y+gukJid8T5suil0fQR4Ci1h7Z0znA/HQ8QRP0Tzok6RIFo/cFq20xA8yEFdawqyUV
         9fZlybALyLmuogXt6IwtZK9Je3rPRpz8LBO0EdIq45FQ1KwkcslyzWCEz32h6ZjBqiQg
         DTNw/Ihwxi2nNO2I2yEdcsYKH/qZxiBzQLvmaHL7OLoD6HZbOUQ+QtKLMkXoBNyoZx4a
         dObQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q53-v6si787879qvj.65.2018.09.13.08.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 08:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0Tqp-000081-Fv
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 11:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To3-00079K-LZ
	for qemu-devel@nongnu.org; Thu, 13 Sep 2018 11:45:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To2-0002wa-AF
	for qemu-devel@nongnu.org; Thu, 13 Sep 2018 11:45:23 -0400
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18]:50194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g0To2-0002jk-1E
	for qemu-devel@nongnu.org; Thu, 13 Sep 2018 11:45:22 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by michel.telenet-ops.be with bizsmtp
	id b3l51y00Z3XaVaC063l5FY; Thu, 13 Sep 2018 17:45:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-00018L-83; Thu, 13 Sep 2018 17:45:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-0006Ev-6g; Thu, 13 Sep 2018 17:45:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 13 Sep 2018 17:44:56 +0200
Message-Id: <20180913154458.23939-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180913154458.23939-1-geert+renesas@glider.be>
References: <20180913154458.23939-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:18
Subject: [Qemu-devel] [PATCH v4 1/3] vfio/platform: Make the vfio-platform
 device non-abstract
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Myb9np8CcEYs

From: Auger Eric <eric.auger@redhat.com>

Up to now the vfio-platform device has been abstract and could not be
instantiated.  The integration of a new vfio platform device required
creating a dummy derived device which only set the compatible string.

Following the few vfio-platform device integrations we have seen the
actual requested adaptation happens on device tree node creation
(sysbus-fdt).

Hence remove the abstract setting, and read the list of compatible
values from sysfs if not set by a derived device.

Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
compatible values, as there can now be more than one.

Note that sysbus-fdt does not support the instantiation of the
vfio-platform device yet.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
[geert: Rebase, set user_creatable=true, use compatible values in sysfs
	instead of user-supplied manufacturer/model options, reword]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Propagate g_file_get_contents() errors through errp,

v3:
  - Read all compatible values from sysfs instead of using user-supplied
    manufacturer and model options,
  - Reword patch description,
  - Drop RFC state,

v2:
  - No changes,

v1:
  - Rebase, Set user_creatable=true,

v0:
  - Original version from Eric.
---
 hw/vfio/amd-xgbe.c              |  1 +
 hw/vfio/calxeda-xgmac.c         |  1 +
 hw/vfio/platform.c              | 24 +++++++++++++++++++++++-
 include/hw/vfio/vfio-platform.h |  3 ++-
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
index 0c4ec4ba25170366..ee64a3b4a2e45bf5 100644
--- a/hw/vfio/amd-xgbe.c
+++ b/hw/vfio/amd-xgbe.c
@@ -20,6 +20,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error **errp)
     VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
 
     vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
+    vdev->num_compat = 1;
 
     k->parent_realize(dev, errp);
 }
diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
index 24cee6d06512c1b6..e7767c4b021be566 100644
--- a/hw/vfio/calxeda-xgmac.c
+++ b/hw/vfio/calxeda-xgmac.c
@@ -20,6 +20,7 @@ static void calxeda_xgmac_realize(DeviceState *dev, Error **errp)
     VFIOCalxedaXgmacDeviceClass *k = VFIO_CALXEDA_XGMAC_DEVICE_GET_CLASS(dev);
 
     vdev->compat = g_strdup("calxeda,hb-xgmac");
+    vdev->num_compat = 1;
 
     k->parent_realize(dev, errp);
 }
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 57c4a0ee2b58da70..894333c602eb6fd2 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -655,6 +655,27 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
         goto out;
     }
 
+    if (!vdev->compat) {
+        GError *gerr = NULL;
+        gchar *contents;
+        gsize length;
+        char *path;
+
+        path = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
+        if (!g_file_get_contents(path, &contents, &length, &gerr)) {
+            error_setg(errp, "%s", gerr->message);
+            g_error_free(gerr);
+            return;
+        }
+        g_free(path);
+        vdev->compat = contents;
+        for (vdev->num_compat = 0; length; vdev->num_compat++) {
+            size_t skip = strlen(contents) + 1;
+            contents += skip;
+            length -= skip;
+        }
+    }
+
     for (i = 0; i < vbasedev->num_regions; i++) {
         if (vfio_region_mmap(vdev->regions[i])) {
             error_report("%s mmap unsupported. Performance may be slow",
@@ -700,6 +721,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
     dc->desc = "VFIO-based platform device assignment";
     sbc->connect_irq_notifier = vfio_start_irqfd_injection;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    /* Supported by TYPE_VIRT_MACHINE */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_platform_dev_info = {
@@ -708,7 +731,6 @@ static const TypeInfo vfio_platform_dev_info = {
     .instance_size = sizeof(VFIOPlatformDevice),
     .class_init = vfio_platform_class_init,
     .class_size = sizeof(VFIOPlatformDeviceClass),
-    .abstract   = true,
 };
 
 static void register_vfio_platform_dev_type(void)
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 9baaa2db09b84f3e..0ee10b1d71ed2503 100644
--- a/include/hw/vfio/vfio-platform.h
+++ b/include/hw/vfio/vfio-platform.h
@@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
     QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
     /* queue of pending IRQs */
     QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
-    char *compat; /* compatibility string */
+    char *compat; /* DT compatible values, separated by NUL */
+    unsigned int num_compat; /* number of compatible values */
     uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
     QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
     QemuMutex intp_mutex; /* protect the intp_list IRQ state */
-- 
2.17.1

