Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5429706wrq;
        Tue, 26 Jun 2018 13:22:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfqD61UBzcYbneRLL6afUDQ0sTSKEkkMHoSjH0gwlcvK9o8OhdkzHWMZzxbafUKeatpShqe
X-Received: by 2002:a37:de04:: with SMTP id h4-v6mr2821583qkj.442.1530044538000;
        Tue, 26 Jun 2018 13:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530044537; cv=none;
        d=google.com; s=arc-20160816;
        b=REFqTbIrWhKR/4B4g7BM/qpqrTcb0kVD8z2qX3gmQRxF/Th3CJVasnZhmvGOGtuCor
         Gq5apojNIn9rX9+rLYs91z0KwICiXX0EihOAEX7ViQ1zO52uSyIghqOj2cHTGtLcNXD5
         X74qtyN6Aq9Ey9xAxbc6dYp7JBbnpOAPuJb0MLkj3I9MtvNU2o+BHYVkf2F/14btOcCp
         mKZTSyYVu7HHEEcnem0SMA1khb5bECyRY8GP9rHWdaaNPP3a5+452JCcLwe8jjFZTgwf
         KsukmMuHoQdbpaPTYsNMffzzMZxMQ+0N+gSasIzDbGWqdNaoyVC0Wb38VGlSrtUbnJm4
         dL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=srTRgAdqkl2yh5P1rJtjipq3/vV998p5A8HwdOHCdJA=;
        b=vIjCsAYnMvZ8Q3MySsnc+XqzOE1btPJCAok3a4bs1opyExPYWKan7Bbw+nWeONYlIT
         RUbPDW48/Vrqhc3mTwpp+orluGaYtOCmy9EnhLfWMvcNYxgo9TVOVhBj+Y8n8pDXDMux
         dxaY0zwoLymRHn8qno/OcQgxQnZN+4+/jtLxHqDIY9oofgIYqFVtxzpByiNU9YUn932H
         5htTK5LoraxPNWmBgfLYG5rkfuSWkZCxe6sAZeYLXiohqITrS38+Phw6NFzeJ1z+Ts/1
         OZsTHEIp3B8nlZRzEDlX9wutoRjtttDdeeciMdX1/44u+v0FjboBgn9osWmHvjGbn6hy
         Ruhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26-v6si2273307qtp.167.2018.06.26.13.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 13:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXuTh-0008AG-CJ
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 16:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuTA-0007wK-R0
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT9-00070V-En
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37218 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fXuT9-000704-8r; Tue, 26 Jun 2018 16:21:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF20F406E1D2;
	Tue, 26 Jun 2018 20:21:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD2E1117643;
	Tue, 26 Jun 2018 20:21:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Tue, 26 Jun 2018 22:21:32 +0200
Message-Id: <1530044492-24921-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
References: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 26 Jun 2018 20:21:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 26 Jun 2018 20:21:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 3/3] hw/arm/virt: Silence dtc /memory warning
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
X-TUID: xz2HaZTmNdvT

When running dtc on the guest /proc/device-tree we get the
following warning: Warning (unit_address_vs_reg): Node /memory
has a reg or ranges property, but no unit name".

Let's fix that by adding the unit address to the node name. We also
don't create the /memory node anymore in create_fdt(). We directly
create it in load_dtb. /chosen still needs to be created in create_fdt
as the uart needs it. In case the user provided his own dtb, we nop
all memory nodes found in root and create new one(s).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- only nop root nodes
- remove old comment
---
 hw/arm/boot.c | 41 +++++++++++++++++++++++------------------
 hw/arm/virt.c |  7 +------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e48166..e09201c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -490,11 +490,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as)
 {
     void *fdt = NULL;
-    int size, rc;
+    int size, rc, n = 0;
     uint32_t acells, scells;
     char *nodename;
     unsigned int i;
     hwaddr mem_base, mem_len;
+    char **node_path;
+    Error *err = NULL;
 
     if (binfo->dtb_filename) {
         char *filename;
@@ -546,12 +548,21 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         goto fail;
     }
 
+    /* nop all root nodes matching /memory or /memory@unit-address */
+    node_path = qemu_fdt_node_unit_path(fdt, "memory", &err);
+    if (err) {
+        error_report_err(err);
+        goto fail;
+    }
+    while (node_path[n]) {
+        if (g_str_has_prefix(node_path[n], "/memory")) {
+            qemu_fdt_nop_node(fdt, node_path[n]);
+        }
+        n++;
+    }
+    g_strfreev(node_path);
+
     if (nb_numa_nodes > 0) {
-        /*
-         * Turn the /memory node created before into a NOP node, then create
-         * /memory@addr nodes for all numa nodes respectively.
-         */
-        qemu_fdt_nop_node(fdt, "/memory");
         mem_base = binfo->loader_start;
         for (i = 0; i < nb_numa_nodes; i++) {
             mem_len = numa_info[i].node_mem;
@@ -572,24 +583,18 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
             g_free(nodename);
         }
     } else {
-        Error *err = NULL;
+        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
 
-        rc = fdt_path_offset(fdt, "/memory");
-        if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
-        }
-
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
-        }
-
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
+        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
                                           acells, binfo->loader_start,
                                           scells, binfo->ram_size);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+            fprintf(stderr, "couldn't set %s reg\n", nodename);
             goto fail;
         }
+        g_free(nodename);
     }
 
     rc = fdt_path_offset(fdt, "/chosen");
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6cce282..281ddcd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,13 +204,8 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
 
-    /*
-     * /chosen and /memory nodes must exist for load_dtb
-     * to fill in necessary properties later
-     */
+    /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    qemu_fdt_add_subnode(fdt, "/memory");
-    qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
 
     /* Clock node, for the benefit of the UART. The kernel device tree
      * binding documentation claims the PL011 node clock properties are
-- 
2.5.5

