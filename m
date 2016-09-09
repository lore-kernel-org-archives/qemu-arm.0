Received: by 10.80.163.71 with SMTP id 65csp212598edn;
        Fri, 9 Sep 2016 10:33:31 -0700 (PDT)
X-Received: by 10.55.121.67 with SMTP id u64mr5394705qkc.114.1473442411348;
        Fri, 09 Sep 2016 10:33:31 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q86si2728492qkl.133.2016.09.09.10.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPgA-00034R-OB
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:33:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdz-0001cB-Je
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 13:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdy-0005S9-ER
	for qemu-devel@nongnu.org; Fri, 09 Sep 2016 13:31:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPdt-0005RF-Vx; Fri, 09 Sep 2016 13:31:10 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86E5161E53;
	Fri,  9 Sep 2016 17:31:09 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQu024546; Fri, 9 Sep 2016 13:31:06 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:35 +0200
Message-Id: <1473442237-3746-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 09 Sep 2016 17:31:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 6/8] arm/virt: Add ITS to the virt board
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q/8E4TJnjvII

From: Pavel Fedin <p.fedin@samsung.com>

If supported by the configuration, ITS will be added automatically.

This patch also renames v2m_phandle to msi_phandle because it's now used
by both MSI implementations.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

--

v3 -> v4:
- added Peter's R-b
---
 hw/arm/virt.c | 47 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a..c5f65dd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,7 +76,7 @@ typedef struct VirtBoardInfo {
     int fdt_size;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
-    uint32_t v2m_phandle;
+    uint32_t msi_phandle;
     bool using_psci;
 } VirtBoardInfo;
 
@@ -423,9 +423,22 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
     }
 }
 
+static void fdt_add_its_gic_node(VirtBoardInfo *vbi)
+{
+    vbi->msi_phandle = qemu_fdt_alloc_phandle(vbi->fdt);
+    qemu_fdt_add_subnode(vbi->fdt, "/intc/its");
+    qemu_fdt_setprop_string(vbi->fdt, "/intc/its", "compatible",
+                            "arm,gic-v3-its");
+    qemu_fdt_setprop(vbi->fdt, "/intc/its", "msi-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(vbi->fdt, "/intc/its", "reg",
+                                 2, vbi->memmap[VIRT_GIC_ITS].base,
+                                 2, vbi->memmap[VIRT_GIC_ITS].size);
+    qemu_fdt_setprop_cell(vbi->fdt, "/intc/its", "phandle", vbi->msi_phandle);
+}
+
 static void fdt_add_v2m_gic_node(VirtBoardInfo *vbi)
 {
-    vbi->v2m_phandle = qemu_fdt_alloc_phandle(vbi->fdt);
+    vbi->msi_phandle = qemu_fdt_alloc_phandle(vbi->fdt);
     qemu_fdt_add_subnode(vbi->fdt, "/intc/v2m");
     qemu_fdt_setprop_string(vbi->fdt, "/intc/v2m", "compatible",
                             "arm,gic-v2m-frame");
@@ -433,7 +446,7 @@ static void fdt_add_v2m_gic_node(VirtBoardInfo *vbi)
     qemu_fdt_setprop_sized_cells(vbi->fdt, "/intc/v2m", "reg",
                                  2, vbi->memmap[VIRT_GIC_V2M].base,
                                  2, vbi->memmap[VIRT_GIC_V2M].size);
-    qemu_fdt_setprop_cell(vbi->fdt, "/intc/v2m", "phandle", vbi->v2m_phandle);
+    qemu_fdt_setprop_cell(vbi->fdt, "/intc/v2m", "phandle", vbi->msi_phandle);
 }
 
 static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
@@ -500,6 +513,26 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
     }
 }
 
+static void create_its(VirtBoardInfo *vbi, DeviceState *gicdev)
+{
+    const char *itsclass = its_class_name();
+    DeviceState *dev;
+
+    if (!itsclass) {
+        /* Do nothing if not supported */
+        return;
+    }
+
+    dev = qdev_create(NULL, itsclass);
+
+    object_property_set_link(OBJECT(dev), OBJECT(gicdev), "parent-gicv3",
+                             &error_abort);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vbi->memmap[VIRT_GIC_ITS].base);
+
+    fdt_add_its_gic_node(vbi);
+}
+
 static void create_v2m(VirtBoardInfo *vbi, qemu_irq *pic)
 {
     int i;
@@ -583,7 +616,9 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
 
     fdt_add_gic_node(vbi, type);
 
-    if (type == 2) {
+    if (type == 3) {
+        create_its(vbi, gicdev);
+    } else {
         create_v2m(vbi, pic);
     }
 }
@@ -1025,9 +1060,9 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
                            nr_pcie_buses - 1);
     qemu_fdt_setprop(vbi->fdt, nodename, "dma-coherent", NULL, 0);
 
-    if (vbi->v2m_phandle) {
+    if (vbi->msi_phandle) {
         qemu_fdt_setprop_cells(vbi->fdt, nodename, "msi-parent",
-                               vbi->v2m_phandle);
+                               vbi->msi_phandle);
     }
 
     qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
-- 
2.5.5

