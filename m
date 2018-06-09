Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2089465wrq;
        Sat, 9 Jun 2018 07:23:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKu4tvVEUx1Mp25GsNWx69bYAQBLnkjbRYHIyE+OyL+ku0KR4Wts1K/syWBXqfmNgAcCQ1I
X-Received: by 2002:ac8:6705:: with SMTP id e5-v6mr9722409qtp.79.1528554232749;
        Sat, 09 Jun 2018 07:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528554232; cv=none;
        d=google.com; s=arc-20160816;
        b=QBJC31MX+Bue+QERTyOO//JMIDbhbiRxsC8iCpmbdHa/vqpvntuMqUlkD1KmdHDE8A
         I7KU/H0QeDNkJgWZSxF1qcCNEwlM12beW4tyPSjMZRGkOgXGLP4s3a3wIS0medhy2mZb
         o7fzAFOAJ0byHwO2VwV8yiDI+E+tQFlmfj4sOnD9Lc+0MFzs9cHJ3EwBrzmTD7eIGJAm
         JT5SrBxwBa5LfUFbEuOoUkiDyGBAE5t3l30+snm3uJu1JoI3mnuEjfPx1qgckkYu3nBN
         k9JBSZdws7C9EBBaS0Ea55KLFM0wM0gqFNL8MNHhNicLXa579T+iW13o+egMaSgesctz
         +KVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=y+27weiqZ85HrDzVbt+wnVyiW17oVFqlrof9F6xh7G8=;
        b=cbXcwwPrbf7Aj+qnqzdQhj67RAp28npExgXesIqN2ovpuL2rcqDgsmM7en0gx0nORs
         NRJNhomTItc2v8b6ka8Bb4+b7v9Gh1IAX77rkLJEj0LCPDu1sP5F0NaPpFAVrN8nfgSx
         9aIPJjJiFt2dCm2iZOrjr/Sc9aLDBqrd0k8w9oAfEPd7ea1pIy+l6pH6twiOhIJPMOgr
         Md1naWHWxUvdSwfw7mxVS4d/EfygqsvlC3LDS+LsaLxd64VH3EQaCaJVRvxUgZ+si8++
         6iutY2MZ1ehK7lePZ0aCM39L9nFo+PgyVxzfbS8I/GdNzpHMwi/H59kYVit8vGxrtkAa
         2vBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55-v6si8171103qts.128.2018.06.09.07.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jun 2018 07:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRemW-0007q9-7f
	for alex.bennee@linaro.org; Sat, 09 Jun 2018 10:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem4-0007e5-UB
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem1-0004MZ-Rr
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57024 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fRem1-0004LK-LT; Sat, 09 Jun 2018 10:23:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89B67818BAF3;
	Sat,  9 Jun 2018 14:23:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78491217B409;
	Sat,  9 Jun 2018 14:23:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  9 Jun 2018 16:23:12 +0200
Message-Id: <1528554193-27270-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 09 Jun 2018 14:23:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 09 Jun 2018 14:23:19 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/virt: Silence dtc /intc warnings
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
X-TUID: +8mS6VC49OGy

When running dtc on the guest /proc/device-tree we get the
following warnings: "Warning (unit_address_vs_reg): Node <name>
has a reg or ranges property, but no unit name", with name:
/intc, /intc/its, /intc/v2m.

Nodes should have a name in the form <name>[@<unit-address>] where
unit-address is the primary address used to access the device, listed
in the node's reg property. This fix seems to make dtc happy.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/virt.c | 59 +++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 11b9f59..b1e9a6b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -368,66 +368,81 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
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
-        qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                 "arm,gic-v3");
-        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                      2, vms->memmap[VIRT_GIC_DIST].base,
                                      2, vms->memmap[VIRT_GIC_DIST].size,
                                      2, vms->memmap[VIRT_GIC_REDIST].base,
                                      2, vms->memmap[VIRT_GIC_REDIST].size);
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

