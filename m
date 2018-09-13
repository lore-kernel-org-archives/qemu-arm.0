Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp829401wrd;
        Thu, 13 Sep 2018 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaJYiMHTWFZ1OlpeRAG/+z0rcRBe4FnvD+SYkNIhnMitv8/Wk6StxNz0j4HQHdhKNVlumGF
X-Received: by 2002:a0c:818b:: with SMTP id 11-v6mr5782774qvd.129.1536853532805;
        Thu, 13 Sep 2018 08:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536853532; cv=none;
        d=google.com; s=arc-20160816;
        b=dN2yxK9CCytSl2JEqYlm75p/5uwydtsz9l2mR2/B/TRuIb/d0oYJ7iLbUUhK+rfItz
         VBmgwjkHWyO/VfnDtFAnVmYddlBNrthdL0uSdfn44M2vtbSOnW7H5LYQaxdgqrtPbxmU
         Oi0X5IKZfe+6cxrHzL3TQ82lJ0clcHet8s/XURwOY0o0ueYioaj6oMP0xrFdRUAm/43N
         1nh8jHh1x4m7Am7ENC7KSsjpwfGgGrwacCnCTEf1utz5mvr3jCZ8G4dwMlccDMoNyQzD
         t5DKyjU4mJVEMQfROGHz+gYK6TBSAcFQ1Lt8P6rcGrWL50qPphjUADJJMOEAeRlEDW02
         qiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=RwejpaTpRrwSQHHGPB+8CK1YfPyoXZ2voXPSlxbO7S8=;
        b=zszLc2iR9mBLAqmR03abzVT+xM034ppWwmQywAh3rC0zraLLResqY4bwnnEFUodYCI
         KD2qVcOeQii5OaYBy9Lj0IhDR94xSwCtZJnuuLPJUuvhUWMfCCpo8ENJx16TVd5ULNd/
         XfAFVA9RA+6Gf/pyEO+rPfoRY6QICCWGxf4is4phDwjyJMkDfxezx5tDocNGDuFUy8ds
         pGPMq/XA1lUonRol1MPJP9EAVfrGWrLPK5lde5gx3xu8nSP3TDmVq4CeD2LkledsXt6Z
         Uamq8qxQyXX4a0ytWDw+uDy58O/Gz+zwIPHemttuwWsbqAUQNsOfRNht+UGkl8gk2LVF
         dx0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si464343qvj.191.2018.09.13.08.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Sep 2018 08:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0ToC-00079e-CO
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 11:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0To0-00078y-E9
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g0Tnv-0002sH-LJ
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:19 -0400
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13]:49110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g0Tnq-0002j6-Ph
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 11:45:12 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by baptiste.telenet-ops.be with bizsmtp
	id b3l51y00w3XaVaC013l5qp; Thu, 13 Sep 2018 17:45:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-00018N-8g; Thu, 13 Sep 2018 17:45:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g0Tnl-0006Ex-7c; Thu, 13 Sep 2018 17:45:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 13 Sep 2018 17:44:57 +0200
Message-Id: <20180913154458.23939-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180913154458.23939-1-geert+renesas@glider.be>
References: <20180913154458.23939-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:13
Subject: [Qemu-arm] [PATCH v4 2/3] hw/arm/sysbus-fdt: Allow device matching
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
X-TUID: PAmppu5CTBDl

From: Auger Eric <eric.auger@redhat.com>

Up to now we have relied on the device type to identify a device tree
node creation function.  Since we would like the vfio-platform device to
be instantiatable with different compatible strings we introduce the
capability to specialize the node creation depending on actual
compatible value.

NodeCreationPair is renamed into BindingEntry. The struct is enhanced
with compat and match_fn() fields.  We introduce a new matching function
adapted to the vfio-platform generic device.

Soon, the AMD XGBE can be instantiated with either manner, i.e.:

    -device vfio-amd-xgbe,host=e0900000.xgmac

or using the new option line:

    -device vfio-platform,host=e0900000.xgmac

Signed-off-by: Eric Auger <eric.auger@redhat.com>
[geert: Match using compatible values in sysfs instead of user-supplied
	manufacturer/model options, reword]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Eric Auger <eric.auger@redhat.com>
---
v4:
  - Add Tested-by (with amd-xgbe),
  - s/From now on/Soon/ in patch description,

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

