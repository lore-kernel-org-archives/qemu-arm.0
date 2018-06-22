Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp834102wrq;
        Fri, 22 Jun 2018 06:27:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK5J24rsovfWaHCnado2OCPWJJePoP9mKL1+3p8/VlcVygWTmhDn5D6/mnVfpJ8ZtWZhu84
X-Received: by 2002:ac8:179a:: with SMTP id o26-v6mr1330020qtj.411.1529674078496;
        Fri, 22 Jun 2018 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529674078; cv=none;
        d=google.com; s=arc-20160816;
        b=UOIq3ub6nmoJC9z8/NRdeTPWhtUoL49C2JkKwk1349dvFhr0e9RR6bXoD0vk/7wURL
         FnByCbDlE4ouMNnYGmjTdhg6fDKwFZGMYmOXgOWWbmH8mPdTBGVUS1sV3VpVf5c8ReQC
         cZcslESe1niAUEnEezyZ8sK5Zkcddr4LfZjSp/4Z5192riBRLIFNA2COUmg+9oujrGLZ
         qh9eomFq4hPJUJuS7rT0EJz8GOtQrlUd+OBipE7VCTXyOzH4uaJ5f74QtPG3FRozNO81
         wkQEHUSXiLd4btS+1O0lW4Kdl1TG5ZoMoZiZOvGAf771dJIEHF8EimjpVQVAc5aXksHv
         fYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LiWGv8sRLbafeoa7dYxwbMt0FdD3H97SZK4Ubjwhkps=;
        b=ZZrJksbrQDhWYTY3iWVTOSvFpIexnhM1Z4NO39kpCPxjgFmXY390HzbgGj4gb0hkjL
         B3A1djHL/S2di272wpTPpP0UdfNN88KJOJUBO6brIjRdMvWie7SZ6FEgzE02vAub+MoW
         0iwvhtmcr2XYjzTEgjlSPtr9k9jNCa3KYz8GO0CMGkhLYTTxzU53H/BLtuAyUwx/UvcU
         vEBczQMBT7rFWD1JKx/kPaByU9bw3UuiWiKUmaRkNq22o/vLUQg7djanu6z5tAmYhOzY
         FEwipzm+XAQMfIPIRaz7AXp5IcCal8otcTQVtDOlEgkkdDMrZJaCWmP8SqeuXI/wgOT8
         pgWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m188-v6si4897911qkd.89.2018.06.22.06.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWM6X-00031Y-Qo
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:27:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWM1i-0007ce-L0
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWM1h-0004tn-IP
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:22:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34580 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWM1e-0004oO-Rh; Fri, 22 Jun 2018 09:22:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A3E381A4EBE;
	Fri, 22 Jun 2018 13:22:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DD542026D6B;
	Fri, 22 Jun 2018 13:22:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Fri, 22 Jun 2018 15:22:45 +0200
Message-Id: <1529673765-16627-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
References: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 13:22:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 13:22:54 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v3 3/3] hw/arm/virt: Silence dtc /memory warning
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jykdPaOayuxd

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
index 7c9a4b8..7773b34 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -201,13 +201,8 @@ static void create_fdt(VirtMachineState *vms)
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

