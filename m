Received: by 10.28.71.27 with SMTP id u27csp1207114wma;
        Fri, 9 Feb 2018 09:44:34 -0800 (PST)
X-Google-Smtp-Source: AH8x227xd5B0OzuEFd0SuGy5O7yHi5N3NyP7CKK+sqkjLR58CTdjtfYUPJfKWVPbDHUxltYmu2LK
X-Received: by 10.129.159.140 with SMTP id w134mr2612684ywg.469.1518198274076;
        Fri, 09 Feb 2018 09:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198274; cv=none;
        d=google.com; s=arc-20160816;
        b=QyuKcNsFiCHiAcDzdLS1gH8r4vPEYKOsRfPHBRb8kppI6jnuzDiqswWoXfBMnz3B68
         TslW2qbMVccdnK6q/R4dIMBvLnhFI03qUpAsU0rzJ3T1FydOmG2mT4dbOk7+yVeF1HVJ
         bPY8lkFCdTnGGr0Ey5R489eT7uqzgz3jJmSTjTWWQvW8sUyh5DHY+2xof6ryBsgQouw6
         JX1i9Bgru+bTR0EGYTSG6aj83/rUJQ4kwhtIt1l+h2fikz2Sv9t3G1/7nQnhgMcVma+J
         ZeIXaXXVie0u4MMupBfStgy8situo5wBU5uJhPctbCDGn+gJvyfwxThsHQA8m5A2yi7f
         XG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=br2eQ3MwnECrTHp5a9t2LZkZrI6gbCfQDlW9oaQjT68=;
        b=mUkEwYM/Ptxpo/TRRzf3LDv1FRml0AvBn4CeZHlNIhbYCKZuULhzN/UM8Uta8R7U4I
         dnzt7vYpnsW1Q7CumBbEWx9V1A0POuNmLPbYEp7iNOxZ1qG/iaVJc93XDnFlHgflA0Zy
         2SGEv1Gmp1fkB26hJUWBGhoOw0K1G1AXAc1q4ytq8Ef3jjc602aMEHhr9inooc3vJiCt
         T7yb73l2BQoRTO5no6qxOhnIZQIttzyy1aN4jwbTyNP6ATaVNRUPram1SXMCBCPFoWRh
         rblt0Yld/W/IqHhwpPrErOXCCwwHeKiGGks1s+CTyKJr3b3JEgxnUDhqK4l7hu7JNmO3
         rlqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v43si481259ybi.150.2018.02.09.09.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCiv-0006k9-I3
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekAyP-0001XO-7m
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:52:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekAyM-0007hj-6B
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:52:25 -0500
Received: from newton.telenet-ops.be ([195.130.132.45]:48758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekAyL-0007gv-Tl
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:52:22 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
	[IPv6:2a02:1800:120:4::f00:14])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 3zdJwg1xhkzMqtr2
	for <qemu-devel@nongnu.org>; Fri,  9 Feb 2018 16:32:51 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id 8fHm1x03N3XaVaC01fHmhP; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003SB-Qm; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lY-PH; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:36 +0100
Message-Id: <1518189456-2873-6-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 195.130.132.45
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:16 -0500
Subject: [Qemu-devel] [PATCH/RFC 5/5] hw/arm/sysbus-fdt: Enable
 rcar-gen3-gpio dynamic instantiation
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
X-TUID: Iw7xv4yBSekK

Allow the instantiation of a Renesas R-Car Gen3 GPIO controller device
from the QEMU command line:

-device vfio-platform,host=<device>,manufacturer=renesas,model=rcar-gen3-gpio
-device vfio-platform,sysfsdev=<path>,manufacturer=renesas,model=rcar-gen3-gpio

A specialized device tree node is created for the guest, containing
compatible, reg, gpio-controller, and #gpio-cells properties.

Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Question:
  - Why do we need the manufacturer=foo,model=bar syntax? Can't this
    just be extracted from the host DT?

TODO:
  - Copy properties from the host DT, as add_amd_xgbe_fdt_node() does,
  - Make this more generic?
---
 hw/arm/sysbus-fdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index c5d4fd5604c28118..428175f343d9f3b9 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -416,6 +416,52 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+/**
+ * add_rcar_gpio_fdt_node
+ *
+ * Generates a simple node with following properties:
+ * compatible string, regs, #gpio-cells, gpio-controller
+ */
+static int add_rcar_gpio_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    PlatformBusDevice *pbus = data->pbus;
+    void *fdt = data->fdt;
+    const char *parent_node = data->pbus_node_name;
+    int compat_str_len, i;
+    char *nodename;
+    uint32_t *reg_attr;
+    uint64_t mmio_base;
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+
+    compat_str_len = strlen(vdev->compat) + 1;
+    qemu_fdt_setprop(fdt, nodename, "compatible",
+                          vdev->compat, compat_str_len);
+
+    qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "#gpio-cells", 2);
+
+    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
+        reg_attr[2 * i] = cpu_to_be32(mmio_base);
+        reg_attr[2 * i + 1] = cpu_to_be32(
+                                memory_region_size(vdev->regions[i]->mem));
+    }
+    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
+
+    g_free(reg_attr);
+    g_free(nodename);
+    return 0;
+}
+
 /* manufacturer/model matching */
 static bool vfio_platform_match(SysBusDevice *sbdev,
                                 const BindingEntry *entry)
@@ -454,6 +500,7 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd", "xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
+    VFIO_PLATFORM_BINDING("renesas", "rcar-gen3-gpio", add_rcar_gpio_fdt_node),
 #endif
     TYPE_BINDING("", NULL), /* last element */
 };
-- 
2.7.4

