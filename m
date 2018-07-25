Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp770712wru;
        Wed, 25 Jul 2018 07:34:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddhfl8ZT5nqEtFf+Cye+rHqutp2AKJgrV4ZJSaBCxnrDuAhKuUYSaC87QDaBhP7qhks5gX
X-Received: by 2002:a0c:d842:: with SMTP id i2-v6mr19185898qvj.145.1532529296185;
        Wed, 25 Jul 2018 07:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532529296; cv=none;
        d=google.com; s=arc-20160816;
        b=iWWtkkvWnHVxm6C6rS82ijMu/1I1OtZCSrkJLq5oK8cDmm88LJyr3pKlVC5BBbwQiS
         3BgzweMX+wGYqeZJybwORjxfHKSrQQaZrV4myqymF1aXjt5oBpRmBHXbMiY2CTq6/BjW
         QR75CRigsbWdxt9HkRmz33k+fM6LBZuUmqb60/dsYoi4+LzVEg5cwoaQOhPyv3eoUn/D
         K9/hr/BdDDivDWQsfdQ4OIITPDT4zFk2Szgy0K+IoRubYj8MTSwxRKlbIyxW884x3y5J
         fTi//BwSeTR+cIh7h4AAs/d5b1780jmr8F2tQu3H+sT7qPwpewOfXNHi5a71WU88lkC2
         VC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yYzryZExXqUd9pzxmUD+woOku9qPUhO4S8qAyoPT7bU=;
        b=C8hma2/+PJ8AMSQ3Hqr3CDcULWthfD+jwKUXUaT2e7cGQ5W1A9Li8xTzG7xS+Iu616
         Uf4u0krQvc2V/6iVvsAkWztGJ2TXD4f71q1tyvueBezj7r1rJ0QqBfiC+5x1eLP17x+R
         ZKG84jENi8IEChtoWCoKv2M1/pQ324rBlrSIsH0CaPch3SE5YpYflGjlNMA3NVVJM/xq
         NfGSAA4VCQP+YN0nhePyTlkjHY9mHotHjbpIeDIUhEfZ+QA/CjTRMtq2i/PQYA2ymPlA
         ec5htMBmxl1rZAadZqFMeMBzfgQqvH3GASbBpdeJj7LhinaV4DQBHr/lAq7iQqndfVZT
         2Cpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h30-v6si4416663qtk.132.2018.07.25.07.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 07:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiKsR-0001K1-IC
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 10:34:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKs0-00018M-0T
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 10:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiKrx-000698-1N
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 10:34:28 -0400
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:34214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1fiKrw-00067F-Ni
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 10:34:24 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id F2aJ1y00D3XaVaC012aJ9c; Wed, 25 Jul 2018 16:34:22 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-000522-6n; Wed, 25 Jul 2018 16:34:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiKrq-0002Xp-5a; Wed, 25 Jul 2018 16:34:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 25 Jul 2018 16:34:11 +0200
Message-Id: <20180725143413.9728-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725143413.9728-1-geert+renesas@glider.be>
References: <20180725143413.9728-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:14
Subject: [Qemu-arm] [PATCH v3 2/4] hw/arm/sysbus-fdt: Allow device matching
 with DT compatible value
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
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YnjO8LexRM40

From: Auger Eric <eric.auger@redhat.com>

Up to now we have relied on the device type to identify a device tree
node creation function.  Since we would like the vfio-platform device to
be instantiatable with different compatible strings we introduce the
capability to specialize the node creation depending on actual
compatible value.

NodeCreationPair is renamed into BindingEntry. The struct is enhanced
with compat and match_fn() fields.  We introduce a new matching function
adapted to the vfio-platform generic device.

From now on, the AMD XGBE can be instantiated with either manner, i.e.:

    -device vfio-amd-xgbe,host=e0900000.xgmac

or using the new option line:

    -device vfio-platform,host=e0900000.xgmac

Signed-off-by: Eric Auger <eric.auger@redhat.com>
[geert: Match using compatible values in sysfs instead of user-supplied
	manufacturer/model options, reword]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not tested with amd-xgbe due to lack of hardware.

v3:
  - Match using the compatible values from sysfs instead of using
    user-supplied manufacturer and model options,
  - Reword patch description,
  - Drop RFC state,

v2:
  - No changes,

v1:
  - No changes,

v0:
  - Original version from Eric.
---
 hw/arm/sysbus-fdt.c | 61 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 43d6a7bb48ddc351..0e24c803a1c2c734 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -50,11 +50,13 @@ typedef struct PlatformBusFDTData {
     PlatformBusDevice *pbus;
 } PlatformBusFDTData;
 
-/* struct that associates a device type name and a node creation function */
-typedef struct NodeCreationPair {
+/* struct that allows to match a device and create its FDT node */
+typedef struct BindingEntry {
     const char *typename;
-    int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
-} NodeCreationPair;
+    const char *compat;
+    int  (*add_fn)(SysBusDevice *sbdev, void *opaque);
+    bool (*match_fn)(SysBusDevice *sbdev, const struct BindingEntry *combo);
+} BindingEntry;
 
 /* helpers */
 
@@ -413,6 +415,27 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+/* DT compatible matching */
+static bool vfio_platform_match(SysBusDevice *sbdev,
+                                const BindingEntry *entry)
+{
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    const char *compat;
+    unsigned int n;
+
+    for (n = vdev->num_compat, compat = vdev->compat; n > 0;
+         n--, compat += strlen(compat) + 1) {
+        if (!strcmp(entry->compat, compat)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+#define VFIO_PLATFORM_BINDING(compat, add_fn) \
+    {TYPE_VFIO_PLATFORM, (compat), (add_fn), vfio_platform_match}
+
 #endif /* CONFIG_LINUX */
 
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
@@ -420,14 +443,23 @@ static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
-/* list of supported dynamic sysbus devices */
-static const NodeCreationPair add_fdt_node_functions[] = {
+/* Device type based matching */
+static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
+{
+    return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
+}
+
+#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
+
+/* list of supported dynamic sysbus bindings */
+static const BindingEntry bindings[] = {
 #ifdef CONFIG_LINUX
-    {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
-    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
+    TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
+    TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
+    VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
-    {TYPE_RAMFB_DEVICE, no_fdt_node},
-    {"", NULL}, /* last element */
+    TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING("", NULL), /* last element */
 };
 
 /* Generic Code */
@@ -446,10 +478,11 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
     int i, ret;
 
-    for (i = 0; i < ARRAY_SIZE(add_fdt_node_functions); i++) {
-        if (!strcmp(object_get_typename(OBJECT(sbdev)),
-                    add_fdt_node_functions[i].typename)) {
-            ret = add_fdt_node_functions[i].add_fdt_node_fn(sbdev, opaque);
+    for (i = 0; i < ARRAY_SIZE(bindings); i++) {
+        const BindingEntry *iter = &bindings[i];
+
+        if (iter->match_fn(sbdev, iter)) {
+            ret = iter->add_fn(sbdev, opaque);
             assert(!ret);
             return;
         }
-- 
2.17.1

