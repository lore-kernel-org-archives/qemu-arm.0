Received: by 10.25.44.15 with SMTP id s15csp2623820lfs;
        Sun, 9 Jul 2017 13:55:06 -0700 (PDT)
X-Received: by 10.200.45.241 with SMTP id q46mr690358qta.177.1499633706689;
        Sun, 09 Jul 2017 13:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633706; cv=none;
        d=google.com; s=arc-20160816;
        b=OgeLWEjGVOHsdmSTEy3WxYDiUOxvZHu86J6vx2f1of3TN9SLqt5X72b0dVTUC/J9zL
         7wMeL0DWVDIeU8Oj43K0aQnvaQWznd6awCfKJ4hIBGk4lWw214mbi5kTdz80cfrJd1Rk
         kM97eGAMtR4VGwgwWuI5zG5BUeHOyQc4no5htne+Mi957kxtWrC1/Pm6YoVsSmLgzIQP
         ww8FxS0Viuy1MB9igSOSoAPuLgnZDbPsjKUZy23nRKXJXjY7VH6hyqtXOmsGJ5R6vjMp
         1DDm6yAaZ/HnQYqTZUpcpY6VCcgs8VmI/JSy8iFMdGQJgVcODowYAW+u0pYil1ur+b+6
         3K6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=09Dwd1vquOXHP5v7Y0+FoxFrtdXJt/DCTEbqqxP1OVE=;
        b=a+cY0mwEKyDW9F7hj85y5ZLaYr5umpxg1dEv0H3Z3po+HgHQj2C5u2yT27zyOokOOL
         Dby+O4wdKgKwMsTFngUrUSTBxSeKIvU/2LsV8CEhXNfsYwnx2vg7nERkv50gSOtjEeSA
         DmQb1O2nZxpGN1pMaWTx7W/gWZSBvX8pIdvcKkJsSJ3F92oWenh3j2dA0/V6G+63GlMu
         AVUjXnYVVZp9O3N5Rspdf0oFQmkAwJpf8aVaq9i9yAtBYo1JXfWKC/Y3zSJmFTc1Zlk3
         WfbzSInv8uWOcbTyy62/ardhS5pAo0r70EhkG9B9E+wcBxGHOc5qisqJF7cWp/a5g+K6
         I6cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q24si9107861qtf.256.2017.07.09.13.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJEN-00049V-U4
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCL-0002GM-P8
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCI-00063y-OM
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJCI-00063c-If; Sun, 09 Jul 2017 16:52:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9DA9C049E32;
	Sun,  9 Jul 2017 20:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E9DA9C049E32
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E9DA9C049E32
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F14717DC6;
	Sun,  9 Jul 2017 20:52:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:31 +0200
Message-Id: <1499633493-19865-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 09 Jul 2017 20:52:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 6/8] hw/arm/virt: Add tlbi-on-map property to
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
X-TUID: 0MaiPGla0nA2

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
index 3651e41..9b72e8a 100644
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

