Received: by 10.28.71.27 with SMTP id u27csp1201396wma;
        Fri, 9 Feb 2018 09:38:21 -0800 (PST)
X-Google-Smtp-Source: AH8x226W/KSdLlZ/p8hq1BDdXUswIjA89K7ziwG3tzjC4YX0Ov0ormBr+27Wc2p2OFjZzB1Endgw
X-Received: by 10.37.51.196 with SMTP id z187mr2329744ybz.98.1518197901160;
        Fri, 09 Feb 2018 09:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518197901; cv=none;
        d=google.com; s=arc-20160816;
        b=TsL8phwJNy7C5/hy57j4AUU6vjbDC8BubqwQCsTUicJekngfjJl3hTtIdyeF0jAhf2
         8hm+lMcWYiYZe5XhMGV60nr1l2EEHuiE5OhZtHVaN1+uDOJRbZ0ETsDIXZy8eDA5Xk/7
         g9BDszE/Yu8/I/nPWX2MvjgiugeMCMOd+3bEMZgZ//9NlHu4CB012vXoQJixnIO64Cak
         W+G7c4apW1waH0zRSFDww40ZIDaFsBEC18xA989a3tnwRcnlWOLEQrEn16aO224r+k4J
         I5cyPNWTjYzK6HblKcAdOTBSowfSRMvP2Daq6K6ErKtSU8YeBaPWa8ZGs2Ql3v1ipWTf
         KWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oDDAQ66+5Kv7IamjrZwKXgLKcZu5RcfiVmi5X+suj/c=;
        b=aShaxRrjjJW6P27MKfnkLgN4g5bkPxbKaaHe30fzKfJBkU08x0pXrylYF4G8bJ40wY
         cb6Wy9g3PnANHgjV7kmahtMYL8firERhN+qOL/Rb9YPvyXZ8kDIDgUFeCl7hAMZHC0hT
         +QBETfeSdEp3wZXfD+YZhbc6FcRdfVWMynsPFqi1YSIJAh6qQ3pyd+s5ymCAFNv1nrKb
         H9ADuJGFv0VA+xkSFYdpl2qw+luuVop+80rUxNZvHY1FA9EIf+uWNc9Ki5Op4hiKXH7D
         FpDuUwxFH4MfPhnevJ+MmEgEG/z/ahejHVuxV33WNbk43SK3bGNBLigw5UOR5qqshlDW
         SJ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q135si487174ybq.496.2018.02.09.09.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCcu-0001bK-HF
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:38:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDa-0007M1-60
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDW-0001EU-SL
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:06 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:55066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekBDW-0001DJ-Jv
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:02 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
	[IPv6:2a02:1800:110:4::f00:19])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3zdJwl2CmqzMqg5d
	for <qemu-arm@nongnu.org>; Fri,  9 Feb 2018 16:32:55 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by laurent.telenet-ops.be with bizsmtp
	id 8fHm1x02Y3XaVaC01fHmCl; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003Rz-OW; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lK-Mj; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:33 +0100
Message-Id: <1518189456-2873-3-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 195.130.137.77
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:06 -0500
Subject: [Qemu-arm] [PATCH/RFC 2/5] hw/arm/sysbus-fdt: Allow device matching
 with compat string
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yWuxiti8XuPx

From: Auger Eric <eric.auger@redhat.com>

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
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/arm/sysbus-fdt.c | 61 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index d68e3dcdbd260895..c5d4fd5604c28118 100644
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
 
@@ -413,15 +416,46 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
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
+#define VFIO_PLATFORM_BINDING(manuf, model, add_fn) \
+    {TYPE_VFIO_PLATFORM, (manuf), (model), (add_fn), vfio_platform_match}
+
 #endif /* CONFIG_LINUX */
 
-/* list of supported dynamic sysbus devices */
-static const NodeCreationPair add_fdt_node_functions[] = {
+/* Device type based matching */
+static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
+{
+    return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
+}
+
+#define TYPE_BINDING(type, add_fn) {(type), NULL, NULL, (add_fn), type_match}
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
+    TYPE_BINDING("", NULL), /* last element */
 };
 
 /* Generic Code */
@@ -440,10 +474,11 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
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
2.7.4

