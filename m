Received: by 10.223.188.70 with SMTP id a6csp1298797wrh;
        Fri, 1 Sep 2017 10:34:30 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6lj3dT4cIFw8+u5lhYhLKgKrZG0NXZwlOhQfFKiHO6lRURo4Cm5ltlQJG/8qEcdi7q92hW
X-Received: by 10.55.74.131 with SMTP id x125mr3437346qka.207.1504287270205;
        Fri, 01 Sep 2017 10:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287270; cv=none;
        d=google.com; s=arc-20160816;
        b=LXVe3N4+wJ6PXmhGgdbYrlNHW28nFWXzY5ZSD+vcvFE74ZwaS7h7DkRhkG3hCT9hv8
         sGisj1g8pj4NJpKubOL/6Lq0cfFkCYLWdfIrTshhnWVnTsbxZDVduEMN9StEveRbJ0pK
         3ckFtwawSMajSCYuL3L3zSvGxyNRtlSb7qH5jGWE0CbTmq8DiYemPonrJfYxabdi6oNp
         b/UrH9nqvLe5rWHKHruRkRaD0jxKAc1uxCx5TPEvBXSTG+O6TgMHDiMoIz+B4CBx98iZ
         /qcO3jE1AaoUUPEtxy8yxsxAa3STW1uwvVqWqIoSgAQGqqodN8b0BY2oCbYojVSypzbC
         UZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=51IjzWyFbI0IyIdlHmK3k/9x/Sv4PEnCe4MeTybupzo=;
        b=KAwjxiT0GqUqjqXWgb74DP6H0nFBeGBm2UF6SwaXVzQaUWh2ZXA2JOa9mLIfWpWgC8
         eI9n6PLh6HboFW1ySKSWx3GR8oFE8HmQaxlgnCDDa0MgeKctctIP1k3drsOAYYz8Bh4B
         AIVhNJZzcPpTHb37Diwd/5VqgqHlwsSjyM18DJhB3Uqz2j2oeaHI5OqTnukX4Ivmae44
         734uzN/14xwCUKhaV4iCs6rDjBCiBY1vayuj4+FWUF4tq2Vpo6bYinLDviN0kkfwaa/F
         0if5rv1ryuH9ljP821Tv3ucxTwdXzIM0O1o4J0PMxjD1TnwCE1MQzB2/teqWmlcIpqC9
         R8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f54si649985qtk.204.2017.09.01.10.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpps-0008TD-24
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:34:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfe-0006Me-Hp
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfc-0003nk-UH
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpfc-0003nS-Nr; Fri, 01 Sep 2017 13:23:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD28B356CE;
	Fri,  1 Sep 2017 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AD28B356CE
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FCFA52FA0;
	Fri,  1 Sep 2017 17:23:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:17 +0200
Message-Id: <1504286483-23327-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Sep 2017 17:23:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 14/20] hw/arm/virt: Store the PCI host
 controller dt phandle
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
X-TUID: tB+dlEREjE/r

Let's allocate a phandle for the PCI host controller dt
node and store this latter in the Virt Machine State. This
will simplify fdt operations when we bind smmu and PCI host
controller.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 5 ++++-
 include/hw/arm/virt.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6b7a0fe..39886c1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -991,7 +991,7 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1100,8 +1100,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
                                      2, base_mmio, 2, size_mmio);
     }
 
+    vms->pcihost_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->pcihost_phandle);
 
     g_free(nodename);
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..ae2bf2c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -105,6 +105,7 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t pcihost_phandle;
     int psci_conduit;
 } VirtMachineState;
 
-- 
2.5.5

