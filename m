Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5429707wrq;
        Tue, 26 Jun 2018 13:22:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe+G+LdyGzeN/HHsAdvQNjia++M82i7Ad1n3/NfVN+554yEjd+qwsONO979DkvtXPQKSRyq
X-Received: by 2002:ac8:16ee:: with SMTP id y43-v6mr2987381qtk.148.1530044538059;
        Tue, 26 Jun 2018 13:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530044538; cv=none;
        d=google.com; s=arc-20160816;
        b=br01hqRlxCamUCrTgvX10HvLeAspqfsRPH5k+iqz3byGh643DTY4VszMsHkgIygcjj
         noO/nrPIMrDc2zo7lhL3bskXiPVE6qcCUAyntddOc5Exu3uOU3lbHHgEDzNXH9rOfaQZ
         +9tuOP83mDdehdJ5e4ddsut1um606vWTMB+b7cJFS0iuG0ExIsr2PAXUYpR358xImx6G
         pAETDyFEbX1Rk/0ihJLSDIeWQn3ZPBKdzerbY6j5s9Mi6zWJnexivAehvrZcgKbo5fl3
         aU62E+RtCRmDJ1KZQvTHZmESd8Pg+7Brhb1brJVqly9X7tGZwm4ZOhf4WNwkrB8x5HIh
         vLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kgHeyLyEDExRqp1+utygRNnQTX2O88tRrKm4jlkx1UM=;
        b=or9QwPdjUmlHdiTbhYsNfzXdusAsrFWR9qnA3Uw3kYivgMdthCz7MGO67hPLFGysqj
         BHTElKzNOGdP7p3o9JyQlu2k87RcCIWoe+j1lsvmooZSXkD6SEPcTag3uPNtOtvIC2V5
         RVTX+fH122VNdPlkK46du4way7KQjZPkqs8zgYfTwxBHZFZ87ijQPXhIuzCXsA3/G+Z1
         EwjVGh3AoCqix4PnjM24FB87easSO7/v/X2mJERZAPPXNqJ5thU0yA1pfVKlMER4NQxL
         v2VfMu4eRMH+uuEnJE3Bs3L5aU3xGogJdgkgOp1iq0LGtIWuwWagUXY8XWUH4KBjLKwN
         2P+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f32-v6si387089qva.48.2018.06.26.13.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 13:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXuTh-00089o-9f
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 16:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT9-0007w3-C7
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT7-0006zv-Vh
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38958 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fXuT7-0006zd-Pw; Tue, 26 Jun 2018 16:21:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E9EF7020E;
	Tue, 26 Jun 2018 20:21:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28FF01117643;
	Tue, 26 Jun 2018 20:21:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Tue, 26 Jun 2018 22:21:31 +0200
Message-Id: <1530044492-24921-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
References: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 20:21:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 20:21:41 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 2/3] hw/arm/virt: Silence dtc /intc warnings
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TFXRCVmW+x/t

When running dtc on the guest /proc/device-tree we get the
following warnings: "Warning (unit_address_vs_reg): Node <name>
has a reg or ranges property, but no unit name", with name:
/intc, /intc/its, /intc/v2m.

Nodes should have a name in the form <name>[@<unit-address>] where
unit-address is the primary address used to access the device, listed
in the node's reg property. This fix seems to make dtc happy.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 63 ++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 742f68a..6cce282 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -369,58 +369,72 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
 {
+    char *nodename;
+
     vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    qemu_fdt_add_subnode(vms->fdt, "/intc/its");
-    qemu_fdt_setprop_string(vms->fdt, "/intc/its", "compatible",
+    nodename = g_strdup_printf("/intc/its@%" PRIx64,
+                               vms->memmap[VIRT_GIC_ITS].base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
-    qemu_fdt_setprop(vms->fdt, "/intc/its", "msi-controller", NULL, 0);
-    qemu_fdt_setprop_sized_cells(vms->fdt, "/intc/its", "reg",
+    qemu_fdt_setprop(vms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
-    qemu_fdt_setprop_cell(vms->fdt, "/intc/its", "phandle", vms->msi_phandle);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->msi_phandle);
+    g_free(nodename);
 }
 
 static void fdt_add_v2m_gic_node(VirtMachineState *vms)
 {
+    char *nodename;
+
+    nodename = g_strdup_printf("/intc/v2m@%" PRIx64,
+                               vms->memmap[VIRT_GIC_V2M].base);
     vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    qemu_fdt_add_subnode(vms->fdt, "/intc/v2m");
-    qemu_fdt_setprop_string(vms->fdt, "/intc/v2m", "compatible",
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                             "arm,gic-v2m-frame");
-    qemu_fdt_setprop(vms->fdt, "/intc/v2m", "msi-controller", NULL, 0);
-    qemu_fdt_setprop_sized_cells(vms->fdt, "/intc/v2m", "reg",
+    qemu_fdt_setprop(vms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_V2M].base,
                                  2, vms->memmap[VIRT_GIC_V2M].size);
-    qemu_fdt_setprop_cell(vms->fdt, "/intc/v2m", "phandle", vms->msi_phandle);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->msi_phandle);
+    g_free(nodename);
 }
 
 static void fdt_add_gic_node(VirtMachineState *vms)
 {
+    char *nodename;
+
     vms->gic_phandle = qemu_fdt_alloc_phandle(vms->fdt);
     qemu_fdt_setprop_cell(vms->fdt, "/", "interrupt-parent", vms->gic_phandle);
 
-    qemu_fdt_add_subnode(vms->fdt, "/intc");
-    qemu_fdt_setprop_cell(vms->fdt, "/intc", "#interrupt-cells", 3);
-    qemu_fdt_setprop(vms->fdt, "/intc", "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(vms->fdt, "/intc", "#address-cells", 0x2);
-    qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
-    qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
+    nodename = g_strdup_printf("/intc@%" PRIx64,
+                               vms->memmap[VIRT_GIC_DIST].base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop(vms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(vms->fdt, nodename, "ranges", NULL, 0);
     if (vms->gic_version == 3) {
         int nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
-        qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                 "arm,gic-v3");
 
-        qemu_fdt_setprop_cell(vms->fdt, "/intc",
+        qemu_fdt_setprop_cell(vms->fdt, nodename,
                               "#redistributor-regions", nb_redist_regions);
 
         if (nb_redist_regions == 1) {
-            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                          2, vms->memmap[VIRT_GIC_DIST].base,
                                          2, vms->memmap[VIRT_GIC_DIST].size,
                                          2, vms->memmap[VIRT_GIC_REDIST].base,
                                          2, vms->memmap[VIRT_GIC_REDIST].size);
         } else {
-            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                          2, vms->memmap[VIRT_GIC_DIST].base,
                                          2, vms->memmap[VIRT_GIC_DIST].size,
                                          2, vms->memmap[VIRT_GIC_REDIST].base,
@@ -430,22 +444,23 @@ static void fdt_add_gic_node(VirtMachineState *vms)
         }
 
         if (vms->virt) {
-            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     } else {
         /* 'cortex-a15-gic' means 'GIC v2' */
-        qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                 "arm,cortex-a15-gic");
-        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                       2, vms->memmap[VIRT_GIC_DIST].base,
                                       2, vms->memmap[VIRT_GIC_DIST].size,
                                       2, vms->memmap[VIRT_GIC_CPU].base,
                                       2, vms->memmap[VIRT_GIC_CPU].size);
     }
 
-    qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_phandle);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->gic_phandle);
+    g_free(nodename);
 }
 
 static void fdt_add_pmu_nodes(const VirtMachineState *vms)
-- 
2.5.5

