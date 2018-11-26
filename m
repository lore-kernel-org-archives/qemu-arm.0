Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5743795wrt;
        Mon, 26 Nov 2018 07:47:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WIiCa5NZEGbCxSMtVmYuaeYbe/PToZ7MZfHIwiJN3mnmdDnTCXiHc1/SIiN92oq2ErQjDs
X-Received: by 2002:a25:1b42:: with SMTP id b63-v6mr23251884ybb.98.1543247222565;
        Mon, 26 Nov 2018 07:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543247222; cv=none;
        d=google.com; s=arc-20160816;
        b=NZ0lzlkQUdNZb0j3scDMIecW5M3HOJsGMlEGzwdPhagedZzIbD10195jCiXK9tyBEb
         wT0UHeg3ilFwna3kvxcBr+tqHKEncJx3O0aXc7oSms2Q44G1COY3SXOPpG5HrrH7yvkB
         9VpvAkMevvuJFmIZHeQHB0uzyYY6zuo+QL2Dspim4WMR0T4FtVghPn12uX569WTu1TVx
         VYuJuYdNzad2wE/Fzlr82HclL/FZs/ZWszW77X+Q+jFI+aKuN/HGk0X7piiQ1+zGLC/O
         LA7HVac2i83r8lWAxtT3qXudz+gucGGCxKcJJ7I6qAgYPpUSNhV8PGmzkxCxA6yDFuMD
         VefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=/ZtGiwf3zYU7WB5SnmKiUbBEbCjP5FmAYkrZi+BjYHI=;
        b=BPvOAYl+5HNQMfmu2JaF0BJF3UcCUDoGtiNVSqU0xwqbWf5xNCNJuE/g35zeQ3ZgUa
         DMlQoCN5INiulPKYQJ/9QZE1sGgdwLtJxckId0rZ9tEB9uGTFOiVSVsPWOvuF3ZxcZzG
         fPjuPNLU0F6SEhHAhIhRBRgeabzXoVtR7YLLyvsbwJKxgUZkmtg/m5p5DMXfo5/PDslo
         IGLwbzPzapsXNBRq8c7H7rr4fzyJ8rLZ43b3bFXIPPuhlyEDFxSYsLjrlFshvHZeFVRJ
         EdJ6eY9XKB3dHSE9l/4NVqnHglTNdCiL9c2YTm9QUphRcJqPl/yvHcH9zk1t/AomoK0d
         Q4Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15-v6si582485ybe.222.2018.11.26.07.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 07:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJ6E-0005BY-2F
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 10:47:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRJ62-0005BP-2g
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRJ5y-0000oC-1S
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:46:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58922)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gRJ5x-0000nh-SU; Mon, 26 Nov 2018 10:46:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A6513001E4A;
	Mon, 26 Nov 2018 15:46:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44947608DA;
	Mon, 26 Nov 2018 15:46:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Mon, 26 Nov 2018 16:46:16 +0100
Message-Id: <20181126154616.18173-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 26 Nov 2018 15:46:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3 ACPI
 integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRIUIAQpwwQQ

The AcpiIortSmmu3 misses 2 32b fields corresponding to the
proximity domain and the device id mapping index.

Also let's report IO-coherent access is supported for
translation table walks, descriptor fetches and queues by
setting the COHACC override flag. Without that, we observe
wrong command opcodes. The DT description also advertises
the dma coherency.

Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c    | 1 +
 include/hw/acpi/acpi-defs.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..aa177ba64d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
+        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
         smmu->event_gsiv = cpu_to_le32(irq);
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..c3ee1f517b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -628,6 +628,12 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+enum {
+    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
+    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
+    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
+};
+
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
     uint64_t base_address;
@@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
     uint32_t pri_gsiv;
     uint32_t gerr_gsiv;
     uint32_t sync_gsiv;
+    uint32_t pxm;
+    uint32_t id_mapping_index;
     AcpiIortIdMapping id_mapping_array[0];
 } QEMU_PACKED;
 typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
-- 
2.17.2

