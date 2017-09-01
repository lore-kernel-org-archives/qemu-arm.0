Received: by 10.223.188.70 with SMTP id a6csp1292411wrh;
        Fri, 1 Sep 2017 10:29:01 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb51tmDaU4Ioyi3CIAsXvGpJ/icrJF/6YSigpGhDFbU90dkWmdvIkglNaVszy7qvPCvfwxPF
X-Received: by 10.200.45.218 with SMTP id q26mr3729348qta.102.1504286941799;
        Fri, 01 Sep 2017 10:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286941; cv=none;
        d=google.com; s=arc-20160816;
        b=GeIRfVIG288p68TPdvUZi4aSoTIwGv+MuycIwlVTkaLhvk/3QRxu8Y1sVqbBwN88B9
         axnS6jpNLCT39WNWqGdepBLx4B8FYNhlDM5WndC3reh4XzNHbEw/tp1iZP0SZfZdtQmI
         LnnJX9Af6KFox7TGmQpDzCkjJNL4Fl9P4Sqbak1l806T5CATncV9c66rEsIfOF3YWYsT
         GqCjBO19uoJGfdAwye5LsWUqwLCyNKEvGNmrXYalAwljQ86oDp+49dQPeQaf/HgSB/ZO
         MAsYstdR4s2b7jq44w9jsjaQsacwHWWLpqzusR/wdxdhW4mle9EvE9tQcHt4GCcEFqmb
         QsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=hEj8LTyXAH7cuy76S3ZUl9b7Yvr1Ph1UfeMkT/zlyO4=;
        b=sy5c3oDgLPN0xlaR+Ezby6cc0wg9aDrlVs1yoxf6cbOG/Cga78pyZUNxbEekx77tal
         kxOHE57frE85umQLWPAKNn7ev6EzPXeTHdy5Tnx8gWZlRCJ0gIRgBTn472uEPEhxrNC4
         6m1o+jHtx3iwj+WqOVGlXv3Os24Km28sM+AyV8E05b6IGGWV2JNZM2jA67GxuVrbn00f
         hkZrar8dZeWcYCJgWCZKDgvOnZJm8vpartdwq2/WecV7HZCxwf0FBeshK9yCLx2wBxZz
         +TNCqftDkB4EKI0GnitACE+b1YoKl3r7Oyv1KbQxgSjnPH+jcYPaedx5UGHTqlvAjuLM
         oSdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t31si630745qth.63.2017.09.01.10.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpkZ-0002lW-Dj
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:28:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfq-0006Xp-I8
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfl-0003uz-Rl
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpfl-0003tT-JA; Fri, 01 Sep 2017 13:24:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D10A461E0;
	Fri,  1 Sep 2017 17:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8D10A461E0
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11A1917100;
	Fri,  1 Sep 2017 17:23:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:18 +0200
Message-Id: <1504286483-23327-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Sep 2017 17:24:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 15/20] hw/arm/sysbus-fdt: Pass the
 VirtMachineState to the node creation functions
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUjMI7Ci8eCX

The VirtMachineState contains some dt phandles that will be used
in some node creation functions. For instance we plan to use the
PCI host controller phandle in the smmu node creation function. So
let's pass the VirtMachineState handle down to the node creation
functions by enhancing the involved datatypes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/sysbus-fdt.c         | 3 +++
 hw/arm/virt.c               | 1 +
 include/hw/arm/sysbus-fdt.h | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index d68e3dc..d92a983 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -36,6 +36,7 @@
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
+#include "hw/arm/virt.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -47,6 +48,7 @@ typedef struct PlatformBusFDTData {
     int irq_start; /* index of the first IRQ usable by platform bus devices */
     const char *pbus_node_name; /* name of the platform bus node */
     PlatformBusDevice *pbus;
+    VirtMachineState *vms;
 } PlatformBusFDTData;
 
 /*
@@ -514,6 +516,7 @@ static void add_all_platform_bus_fdt_nodes(ARMPlatformBusFDTParams *fdt_params)
         .irq_start = irq_start,
         .pbus_node_name = node,
         .pbus = pbus,
+        .vms = fdt_params->vms,
     };
 
     /* Loop through all dynamic sysbus devices and create their node */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39886c1..d7c28b0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1125,6 +1125,7 @@ static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
     fdt_params->system_params = &platform_bus_params;
     fdt_params->binfo = &vms->bootinfo;
     fdt_params->intc = "/intc";
+    fdt_params->vms = vms;
     /*
      * register a machine init done notifier that creates the device tree
      * nodes of the platform bus and its children dynamic sysbus devices
diff --git a/include/hw/arm/sysbus-fdt.h b/include/hw/arm/sysbus-fdt.h
index e15bb81..f5feabc 100644
--- a/include/hw/arm/sysbus-fdt.h
+++ b/include/hw/arm/sysbus-fdt.h
@@ -25,6 +25,7 @@
 #define HW_ARM_SYSBUS_FDT_H
 
 #include "hw/arm/arm.h"
+#include "hw/arm/virt.h"
 #include "qemu-common.h"
 #include "hw/sysbus.h"
 
@@ -48,6 +49,7 @@ typedef struct {
     const ARMPlatformBusSystemParams *system_params;
     struct arm_boot_info *binfo;
     const char *intc; /* parent interrupt controller name */
+    VirtMachineState *vms;
 } ARMPlatformBusFDTParams;
 
 /**
-- 
2.5.5

