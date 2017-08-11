Received: by 10.25.221.202 with SMTP id w71csp967899lfi;
        Fri, 11 Aug 2017 07:36:24 -0700 (PDT)
X-Received: by 10.55.97.13 with SMTP id v13mr20781006qkb.107.1502462184651;
        Fri, 11 Aug 2017 07:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462184; cv=none;
        d=google.com; s=arc-20160816;
        b=BMXvfmziLRe+08JC6++BOQq/MDBY2awDfKUlvl0+K39prcOGuzdB3bLpwzoXvF+w1v
         snWdVBzBV1Cpr3AzPKlATtjVYCLL4Q9I9KfMYyu1LbTLrMaZ6E3mLefDS3x+WkdLmhB3
         WxrD3OtaSSRaC6+jw1K0cWVio28kZ1Lwxi5ljRm/6S9Jz+bx1YXGSLuf8BdoNEFsUh0M
         mwIWuKGp0Gh8+1OBw7PxYK8nTnXo2k4e3y1CYoS5zWliZMmWo6kB7ZrRULjyVJyCiy8r
         +AbpVFgsyH2ynG/BT5GtXVlpZwmntN2rEuwTlB4v5wFMyQA08p/vMtFQiC6a0obaDgyT
         5J+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=noEutT83meBjVq/vnTmkWselJY02SaX8Dw5IKOJOksA=;
        b=lOfXt4bbMmTZvBCo9AfJdAk03srRw64GR3YZNpbDU2RhAOdgXEhvARFFMqPMByrNYV
         ZyxPwnt8XKUiBTlATJzpyQ7UJsQ9qqR3ljbgy0Z+m9xl3Ll8Sku0MwNVzPeEw118XyXA
         CSI9U1RwQZKDCbnK1e1lE0BXjFma8YrvTI3VZfwLXD5W2qIx203uP9vuyc9cetIyKxbu
         rhmsv+Q9rHJSkk4rn7I/Rq32+FPBBdtlp/h45s9MNwFUdRy0d6eKx24fFJ/U//yHHeGq
         MisOLSYDjr3A2iV7ORRdFjlXJked8w3oLW48ZGmlm9rnYyMbaTUiqO3j29ufC3ekZ+xZ
         s+VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si866000qkb.152.2017.08.11.07.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB2z-00030Z-T6
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:36:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAs0-00015J-66
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgArw-0002WG-1W
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:25:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dgArv-0002W6-R4; Fri, 11 Aug 2017 10:24:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4ECFFFCB8;
	Fri, 11 Aug 2017 14:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B4ECFFFCB8
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-162.ams2.redhat.com
	[10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EB9DA01F2;
	Fri, 11 Aug 2017 14:24:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Fri, 11 Aug 2017 16:22:31 +0200
Message-Id: <1502461354-11327-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 11 Aug 2017 14:24:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v6 6/9] hw/arm/virt: Add tlbi-on-map property to
 the smmuv3 node
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
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WfnylmQlnfGO

For VFIO integration we need to update physical IOMMU mappings
each time the guest updates the vIOMMU translation structures.
For that, we rely on a special smmuv3 option, "tlbi-on-map"
which forces TLB invalidations on map (this mode is similar to
the Intel VTD caching Mode). The smmuv3 driver then sends
SMMU_CMD_TLBI_NH_VA commands, upon which we will update the physical
mappings.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b758173..c2ac8c6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1034,6 +1034,7 @@ static void create_smmu(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cell(vms->fdt, smmu, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(vms->fdt, smmu, "clock-names", "apb_pclk");
     qemu_fdt_setprop(vms->fdt, smmu, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop(vms->fdt, smmu, "tlbi-on-map", NULL, 0);
 
     qemu_fdt_setprop_cell(vms->fdt, smmu, "#iommu-cells", 1);
 
-- 
2.5.5

