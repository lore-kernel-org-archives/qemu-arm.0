Received: by 10.28.71.155 with SMTP id m27csp734222wmi;
        Tue, 27 Mar 2018 07:21:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvQEy0rs6wcMMnPF/7TS4ORx6sAPHc8E7pQoa2dteVJ0EkmQjzT2gz8Qp0LTZ1oh9O3OlEb
X-Received: by 2002:a25:c054:: with SMTP id c81-v6mr15279812ybf.39.1522160514828;
        Tue, 27 Mar 2018 07:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160514; cv=none;
        d=google.com; s=arc-20160816;
        b=I9p4rzMUnJq+s59M7pZtVAi5zxmIixE3871Ek6yiP7HMPjTHVpIzIOqhDYLGp0UpqK
         YPpgaGr2aoAvJJ27lgkzK4radEg1mWOm+HQQj9j3VdILi/alSzLCFNo61vV0V1AKMaYD
         tlCMLjTL4vtFpVpF5qsyDbCddg1VKp5I9vsw+O17OO9vL4WHKDJSdL30iPw4vC2mlNZs
         IDs3IbDg4sSWvfQra+OCVhr//Ta+gJDxsXXEVekBvGOjYjbYxe6kaxxwWJXVXdDEtUvx
         lFo5fBMsxImEHJD0k7vPe+A5X/1x8z6mEqI2a6OTmV491dcbp+hxxlmUD6R7vilt843J
         qBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IMk8oUOgde0Ivgzvh5BOeX3ystomfk+8+56O67J2y3A=;
        b=nUBeN3xOFXjK3xbn6/avpgiBEDsMybhsoSrcblSI3dtN9ECUAibSk+MnZfpFUcg0yW
         PcCCDd8L3WS7C7JxO/dtXT9ByIk6ACu+5iMk/GpJxywM3pYVO7wBvHAysSN2iMwSMb6M
         sL0fSlkAzxsWoit7S3c6JdaETXM8z7Wp6CKsgv94xex1J1Zf/jeUMn66YyiQoDTx0CRJ
         AD886MYMHrBPyG1UJNghavpwYRhzV31g04ejfhKzoIPeKfYAlUNbnaAhg39CiGiCLFkf
         VUSATUFPdo1snDpvx7iwXoZNxfN2n3CtfHWzrsMVLtpWOExOM7pWvvMyp4NIv5pLigDX
         4PwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si1521335qtk.363.2018.03.27.07.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pU2-0001m6-CR
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOG-0003AC-4h
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pOF-0006fX-2Z
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48740 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pOE-0006fO-S0; Tue, 27 Mar 2018 10:15:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CBFB40704A4;
	Tue, 27 Mar 2018 14:15:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2016F9E6;
	Tue, 27 Mar 2018 14:15:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:20 +0200
Message-Id: <1522160122-10744-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 27 Mar 2018 14:15:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 27 Mar 2018 14:15:54 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 6/8] hw/arm/virt: Allow GICv3 DT node with multiple
 redistributor regions
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UMKVJRbEcSKP

This patch adds the GICState handle in the virtual machine state and
allows to create a GIC device tree node advertising multiple redistributor
regions.

There is one range per distributor region following the GIC distributor.
Please refer to kernel documentation for further details:
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 32 +++++++++++++++++++++++++++-----
 include/hw/arm/virt.h |  2 ++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0eef6aa..8258f6f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -401,13 +401,34 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
     qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
     if (vms->gic_version == 3) {
+        GICv3State *s = (GICv3State *)vms->gic;
+        uint64_t num_reg_values;
+        uint64_t *regs;
+        int r;
+
         qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
                                 "arm,gic-v3");
-        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
-                                     2, vms->memmap[VIRT_GIC_DIST].base,
-                                     2, vms->memmap[VIRT_GIC_DIST].size,
-                                     2, vms->memmap[VIRT_GIC_REDIST].base,
-                                     2, vms->memmap[VIRT_GIC_REDIST].size);
+
+        num_reg_values =  4 * (s->nb_redist_regions + 1);
+        regs = g_new0(uint64_t, num_reg_values);
+        qemu_fdt_setprop_cell(vms->fdt, "/intc", "#redistributor-regions",
+                              s->nb_redist_regions);
+        regs[0] = 2;
+        regs[1] = vms->memmap[VIRT_GIC_DIST].base;
+        regs[2] = 2;
+        regs[3] = vms->memmap[VIRT_GIC_DIST].size;
+
+        for (r = 1; r <= s->nb_redist_regions; r++) {
+            regs[4 * r] = 2;
+            regs[4 * r  + 1] = s->redist_region[r - 1].base;
+            regs[4 * r  + 2] = 2;
+            /* count redistributors of 2 x 64kB pages */
+            regs[4 * r  + 3] = (uint64_t)s->redist_region[r - 1].count << 17;
+        }
+        qemu_fdt_setprop_sized_cells_from_array(vms->fdt, "/intc", "reg",
+                                                num_reg_values / 2, regs);
+        g_free(regs);
+
         if (vms->virt) {
             qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
@@ -513,6 +534,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
     gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
 
     gicdev = qdev_create(NULL, gictype);
+    vms->gic = (GICState *)gicdev;
     qdev_prop_set_uint32(gicdev, "revision", type);
     qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
     /* Note that the num-irq property counts both internal and external
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ba0c1a4..d168291 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "hw/intc/arm_gic_common.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -92,6 +93,7 @@ typedef struct {
     MachineState parent;
     Notifier machine_done;
     FWCfgState *fw_cfg;
+    GICState *gic;
     bool secure;
     bool highmem;
     bool its;
-- 
2.5.5

