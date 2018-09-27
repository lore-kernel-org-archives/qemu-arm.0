Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1866659wrt;
        Thu, 27 Sep 2018 04:55:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62rP84jBwvlbaBoDVVoMRm3ogjrDJ0Rf4XJXVXm7N/4qZ1tGTQ8wnFEnvRqbuliDMUZne4H
X-Received: by 2002:a0c:a444:: with SMTP id w62-v6mr7801894qvw.53.1538049319929;
        Thu, 27 Sep 2018 04:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538049319; cv=none;
        d=google.com; s=arc-20160816;
        b=SE4iV2zOXncs/cf75/2h1ZbD9rSVA8dywYfIszJtLAbA9fKYetXDiZ/0X8OJkmEWmW
         T/aqFr6HDn0ZiolHz+bqpZpqK/rStQRUQZzNxelNeXnzpMhfYwM4KGFKjVeD1Wb96ZkV
         x5Aw9fy6wuNye2zFpXJJOheP563GBJYqbVOu2F1hwaJKNuTeTjAbX3XvIMyNj9zvq4yl
         RHqmqo3MXt7DQ9JmOfkYdOycjc/td/fBpY5rhVJCMETZqII3T8A7JVWBkfx8A/d1PY+4
         42AdigE9dHRWYldRpASOsPgWY9ppotRoxV6yUjFSkubTpndlekTSzSjM3KMTGubrHrL+
         97Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=dK+g0xb99QAsWJDFl8c/U90Vw94DVIGa7+oj2x2WOoE=;
        b=Y7wnuvb+uqQfe1bDtB5mZ0i3KJ3EUWehrhGKyTFWpBwRPLWZsvGxsYyZETtEDFMB/D
         7DZKEwR9Z/1HHCANjyKaAjsVgq0H5NtPemkyuZPTpukP+BR/FukQffd5L+eRsdFaN1K3
         CwZMeUdWfgF1MRudvH9TI2j8i7UJnL8YUVcL59FtlGBbtOKbpC/D6supNF7/PO1gHU7q
         k/Y45GZLDjPtWCYQ4xFFZjz46Ng6vjSMP6hXLgLS4iB084pFRGWRBmWJEFRWFbNSQF9+
         fM0amS4W5pTn0wwVlHYLNc0L2+qi3huOlcbs619VMqTHfhHfK7gvBTPhtkiIzIsrNOxZ
         rSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z15-v6si1331174qvk.98.2018.09.27.04.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 04:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5Ut5-0004oz-EX
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 07:55:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Usq-0004jJ-TJ
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Usn-0000v9-LT
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:04 -0400
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13]:40474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g5Usn-0000tw-8K
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 07:55:01 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by baptiste.telenet-ops.be with bizsmtp
	id gbux1y00V3XaVaC01buxVY; Thu, 27 Sep 2018 13:54:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0001ck-5e; Thu, 27 Sep 2018 13:54:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0008CQ-4X; Thu, 27 Sep 2018 13:54:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 27 Sep 2018 13:54:52 +0200
Message-Id: <20180927115454.31471-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180927115454.31471-1-geert+renesas@glider.be>
References: <20180927115454.31471-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:13
Subject: [Qemu-arm] [PATCH qemu v5 1/3] vfio/platform: Make the
 vfio-platform device non-abstract
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /KojILW1AXjW

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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
---
v5:
  - Fix path leak on error,
  - Add Reviewed-by, Tested-by,

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
 hw/vfio/platform.c              | 25 ++++++++++++++++++++++++-
 include/hw/vfio/vfio-platform.h |  3 ++-
 4 files changed, 28 insertions(+), 2 deletions(-)

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
index 57c4a0ee2b58da70..64c1af653d145cc0 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -655,6 +655,28 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
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
+            g_free(path);
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
@@ -700,6 +722,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
     dc->desc = "VFIO-based platform device assignment";
     sbc->connect_irq_notifier = vfio_start_irqfd_injection;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    /* Supported by TYPE_VIRT_MACHINE */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_platform_dev_info = {
@@ -708,7 +732,6 @@ static const TypeInfo vfio_platform_dev_info = {
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

