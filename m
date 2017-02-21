Received: by 10.103.98.197 with SMTP id w188csp390841vsb;
        Tue, 21 Feb 2017 05:41:57 -0800 (PST)
X-Received: by 10.55.138.196 with SMTP id m187mr11098684qkd.124.1487684516968;
        Tue, 21 Feb 2017 05:41:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x134si15103150qka.214.2017.02.21.05.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAhY-00033i-G8
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAL0-0006cF-Vm
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 08:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAKz-0003Zq-St
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 08:18:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgAKw-0003YQ-T3; Tue, 21 Feb 2017 08:18:35 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BDD213590;
	Tue, 21 Feb 2017 13:18:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LDIPH8028228; Tue, 21 Feb 2017 08:18:32 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 14:18:20 +0100
Message-Id: <1487683100-16013-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 21 Feb 2017 13:18:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] hw/arm/sysbus-fdt: Allow device matching
 with compat string
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
Cc: okaya@codeaurora.org, pelcan@codeaurora.org, vikrams@codeaurora.org,
	shankerd@codeaurora.org, agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0sreg7jcYFzL

Up to now we have relied on the device type to identify a device tree
node creation function. Since we would like the VFIO-PLATFORM
device to be instantiable with different compatibility strings
we introduce the capability to specialize the node creation depending
on a manufacturer/model combo.

NodeCreationPair is renamed into BindingEntry. The struct is enhanced
with manufacturer, model and match_fn() fields. We introduce a new
matching function adapted to vfio-platform generic device.

From now on, the AMD XGBE can be instantiated with either manner, ie:
-device vfio-amd-xgbe,host=e0900000.xgmac
or new option line:
-device vfio-platform,host=e0900000.xgmac,manufacturer=amd,model=xgbe-seattle-v1a

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/sysbus-fdt.c | 59 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index d68e3dc..a0539e1 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -58,11 +58,14 @@ typedef struct PlatformBusFDTNotifierParams {
     ARMPlatformBusFDTParams *fdt_params;
 } PlatformBusFDTNotifierParams;
 
-/* struct that associates a device type name and a node creation function */
-typedef struct NodeCreationPair {
+/* struct that allows to match a device and create its FDT node */
+typedef struct BindingEntry {
     const char *typename;
-    int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
-} NodeCreationPair;
+    const char *manufacturer;
+    const char *model;
+    int  (*add_fn)(SysBusDevice *sbdev, void *opaque);
+    bool (*match_fn)(SysBusDevice *sbdev, const struct BindingEntry *combo);
+} BindingEntry;
 
 /* helpers */
 
@@ -415,13 +418,42 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
 
 #endif /* CONFIG_LINUX */
 
-/* list of supported dynamic sysbus devices */
-static const NodeCreationPair add_fdt_node_functions[] = {
+/* Device type based matching */
+static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
+{
+    return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
+}
+
+/* manufacturer/model matching */
+static bool vfio_platform_match(SysBusDevice *sbdev,
+                                const BindingEntry *entry)
+{
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+
+    if (strcmp(entry->model, vdev->model)) {
+        return false;
+    }
+
+    if (entry->manufacturer) {
+        if (!vdev->manufacturer) {
+            return false;
+        }
+        return !strcmp(entry->manufacturer, vdev->manufacturer);
+    }
+    return true;
+}
+
+#define TYPE_BINDING(type, add_fn) {(type), NULL, NULL, (add_fn), type_match}
+#define VFIO_PLATFORM_BINDING(manuf, model, add_fn) \
+    {TYPE_VFIO_PLATFORM, (manuf), (model), (add_fn), vfio_platform_match}
+
+/* list of supported dynamic sysbus bindings */
+static const BindingEntry bindings[] = {
 #ifdef CONFIG_LINUX
-    {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
-    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
+    TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
+    TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
+    VFIO_PLATFORM_BINDING("amd", "xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
-    {"", NULL}, /* last element */
 };
 
 /* Generic Code */
@@ -440,10 +472,11 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
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
2.5.5

