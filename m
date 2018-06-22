Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp832557wrq;
        Fri, 22 Jun 2018 06:26:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKveXQOhvC62vlyvU3bVNn9berNp3XzqaikWN/x5xifVFwhA+b+LX/+FFpa3ToUqNm+jwlF
X-Received: by 2002:a37:5a43:: with SMTP id o64-v6mr1313524qkb.211.1529673984040;
        Fri, 22 Jun 2018 06:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529673984; cv=none;
        d=google.com; s=arc-20160816;
        b=qh7N2nSJz0+F8SwS6XkDlkMscsKT1Ul2IS5W37M1NrnobQUS8h55qIr+0BUy2wlsUn
         rdxXys4ebjTRLSiIw5b35/dK2ofx61uWquw/FayRipKyUKJybU84QhJiQKBjDgSxSt0r
         DghSLWSpxhkNSUkPTu5HaoMnUXpgqAaQxeXkGUhxGMySL7g8ktFjToIHQC6NyuR200n6
         Gqje7uT09HwvVw6FBT4V9LNAD0W+hfGznyWFau2BMRTR4eZ/vx4LExEzmyLSv+aTADUr
         /FPK6KzfYsIXZuBBH0/m3HV6wHTXZBcq3B1YoaxwEjcis2K3p8Uxb0AxYmP2AWSoqsiC
         +Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1Z5as/5AbPiOETTlY07kOxhMquuPBoWUWPpjAu/pCc8=;
        b=xFEu19y1vkub9gf97tbc29k5fPcx7qVhdqbdMHk2DpH3Z9sdVMumTO3mMJvzqM3rnU
         28lRDmixZz17K2czkYziT13fCzh4bxVWHLbQZIHP3Lp07GhXEtJSoTFcKYkEz+0q8orO
         RpPj4TmJap3D26nPqvZZPxOfCZbhsSqEhn+wqjXsGxkZ1EAS1cwYlekznDv53n/ml55U
         8V1XC9Ud7hVe0AVDt4Wm55tF0XS4Ws2sMn+mjXQJE4agCKjJOLjoR+71BeNT2XfTBMZ+
         OaKjlkEmm3T9EtEKNPYVLh3RCDzsX8jcHOlPVY221ChNb8L6k8AcbpjQ/emoNGr81R9i
         j3zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66-v6si2245095qte.17.2018.06.22.06.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWM51-0001v7-9s
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:26:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWM1f-0007Yx-Cp
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:22:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWM1d-0004mp-LN
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:22:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53958 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWM1d-0004mG-G3; Fri, 22 Jun 2018 09:22:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 145604023336;
	Fri, 22 Jun 2018 13:22:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF1222026D6B;
	Fri, 22 Jun 2018 13:22:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Fri, 22 Jun 2018 15:22:44 +0200
Message-Id: <1529673765-16627-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
References: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 22 Jun 2018 13:22:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 22 Jun 2018 13:22:53 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 2/3] hw/arm/virt: Silence dtc /intc warnings
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
X-TUID: 2bNciDYr74NT

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
 hw/arm/virt.c | 59 +++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 98b99cf..7c9a4b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -366,66 +366,81 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
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

