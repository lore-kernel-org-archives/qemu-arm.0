Received: by 10.25.221.202 with SMTP id w71csp975243lfi;
        Fri, 11 Aug 2017 07:42:45 -0700 (PDT)
X-Received: by 10.200.49.7 with SMTP id g7mr22009241qtb.118.1502462565385;
        Fri, 11 Aug 2017 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462565; cv=none;
        d=google.com; s=arc-20160816;
        b=UVKv2JMNF7C2HXeb40VQwNv83oWxYeJnt6MCvbMVMFVlmIYYrRMss89F7vbpuTVo9g
         5eOqpGN6Va9yAdqXZffNmbPjWqpLuHzsQmMNOEKZ9V2ZtbmKbSZQ1cy9FdFGJ3kG/btq
         JgypGCfqbXityfLCymRGskfVTwzkW+CBKwGjPWF2gNbq7s9hMYMC/BTcbfn8OaWMiymE
         LmiPe51yvrx1FjbVxbiveAO4SsMEBLvriq4N3fEMf1DdgVfWjCCdfUlOpNPuITD8cIOa
         yMnoHmI83Pg6atkwjiU5Swv/YTWCT+cMZavTEvmsIBr7OuS1JvjRd/lj2ThOfZaVTNuE
         Sl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=fApoiTiiG+5qAxq5ckpj5ZIQCCQFMgVF8BB0zYxBqPQ=;
        b=jEOD+0OHQU8f1HE9iCORISH6xCNqEsgvTys/4nh6iIDuNxZFtHmSfW/oz0hQFASDer
         kwHBX1x9yYg00QvvCD/UU4SqvFy6Qhr5yhUphMR8so/1RgcoO4yz19nnAO/mnKuJe9ai
         k09SVulms8WA41X1mgfrFHo+AIRP6FmTkXmnGHvZ/YvlelurZNpYQBvkssDCITAQXtVg
         p5UBYPVCjG6/1g97R+rs31Pn0De0+sOO4cGVGSi8dVXcFxIPCjKULbVVedtAV8ct17O6
         actVzr9Q4faF9YJEBvdTdTj72J0W5EhdM2awjnkytg3zokpW0IfjrDCPy+gGDjDf7uKO
         G+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r21si878982qte.305.2017.08.11.07.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB98-0007yA-ES
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:42:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAsz-00021E-Cm
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAsy-0003Mq-Ah
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:26:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dgAss-0003G8-Bj; Fri, 11 Aug 2017 10:25:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F194E6B34A;
	Fri, 11 Aug 2017 14:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F194E6B34A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-162.ams2.redhat.com
	[10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AC3AA21A6;
	Fri, 11 Aug 2017 14:25:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Fri, 11 Aug 2017 16:22:34 +0200
Message-Id: <1502461354-11327-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 11 Aug 2017 14:25:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v6 9/9] hw/arm/virt-acpi-build: Use the
 ACPI_IORT_SMMU_V3_CACHING_MODE model
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgyoGiT5eOo4

To allow VFIO use case, let's set the smmu model to
ACPI_IORT_SMMU_V3_CACHING_MODE.

An important notice is this model is not standardized in the
ACPI IORT as this work is a proof of concept.

We also set the COHACC override flag which seems to be mandated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ac2cd3e..9103117 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -437,6 +437,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
+		smmu->model = 0x3; /* ACPI_IORT_SMMU_V3_CACHING_MODE */
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
@@ -444,6 +445,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
         smmu->sync_gsiv = cpu_to_le32(irq + 3);
+        smmu->flags = 0x1; /* COHACC Override */
 
         /* Identity RID mapping covering the whole input RID range */
         idmap = &smmu->id_mapping_array[0];
-- 
2.5.5

