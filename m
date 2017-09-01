Received: by 10.223.188.70 with SMTP id a6csp1287512wrh;
        Fri, 1 Sep 2017 10:24:43 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6ZyQYt/PFm/J6C3JP6fSHSiaiLSXNUQfKxwTsV4A/TZZsPZHu1z9LEDt5VIdpfQjpGjeoN
X-Received: by 10.200.14.72 with SMTP id j8mr4054503qti.340.1504286683645;
        Fri, 01 Sep 2017 10:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286683; cv=none;
        d=google.com; s=arc-20160816;
        b=M7dLu1pfCZgixpH85fD0YlfNNZGcQZCtGljPz4cfRvmDjQkhTUJMi9rm2XPbskMc39
         x6Wd9KFQkggx9szslARr1hGLvJK9lgob6YAU2qKexQ1f/ohF4lvrlg2+qPSmP0tlMS3X
         H4FBng0Kmb45jGRi+XesyNzyU1yOReoZ95fQBfCdXovF3dN3GZf59epfF4aTjHKC9a1B
         +1ZyTSCFnHDSQl8+y/zLuZ+ox/KBx8rzR66fUeWEXCRfmhQJRRLZ7ZjxxTAmfXS/WceO
         mhDP2lJYt/PKYVG1B0cnaaK6TW9rOOcj/DHCxwLN/qkDOAycNaV3fL3yqaOJxb9b9Iou
         SK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=rpEwQAWY1oNmxz5kFBSWucuVTVsYHXBr2U4DTOd6g9M=;
        b=Cf3RzzR9ZDNhd4cS83MEOCegXSRG4WyTalenwvTRkZCUf8csC5y45ZRyKJl5RncFRh
         cZk/eaEjrF/ByNNC8GxJUsqL01BAqwe30XCJcpVhtIqlOM+usvvUAgxvi667fags/F19
         iqPuynavrrjw61A/mLk6Yr3LoADqrZe/Jp6VS70Ff2DA9XIn4gKu/eVTRMjT+om15Rbf
         TR0TIr8zAQlORvhXpliMHQj3i5pgOySjTGT9o7hFdkZ7QYfyJIPFzyhvBmzBM7XKOUZw
         gXBpCKIlAErBQG+LTvdET9a0RiIC96CWaCZ4ljSMY1dfrNH4cU6nFhAMlwTOiuOOh8y8
         EuZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si616458qtf.226.2017.09.01.10.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpgP-00070V-Am
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdu-0004re-Je
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdq-00027O-LZ
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpdq-00026b-5L; Fri, 01 Sep 2017 13:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D22520B17;
	Fri,  1 Sep 2017 17:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2D22520B17
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E13762929;
	Fri,  1 Sep 2017 17:21:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:06 +0200
Message-Id: <1504286483-23327-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Sep 2017 17:22:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 03/20] hw/arm/smmu-common:
 smmu_read/write_sysmem
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
X-TUID: gzjtTuTNxoUg

Those two functions will be used to access configuration
data (STE, CD) and page table entries in guest RAM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3e67992..2a94547 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -30,6 +30,43 @@
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
 
+inline MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf, dma_addr_t len,
+                                    bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        *(uint32_t *)buf = ldl_le_phys(&address_space_memory, addr);
+        break;
+    case 8:
+        *(uint64_t *)buf = ldq_le_phys(&address_space_memory, addr);
+        break;
+    default:
+        return address_space_rw(&address_space_memory, addr,
+                                attrs, buf, len, false);
+    }
+    return MEMTX_OK;
+}
+
+inline void
+smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        stl_le_phys(&address_space_memory, addr, *(uint32_t *)buf);
+        break;
+    case 8:
+        stq_le_phys(&address_space_memory, addr, *(uint64_t *)buf);
+        break;
+    default:
+        address_space_rw(&address_space_memory, addr,
+                         attrs, buf, len, true);
+    }
+}
+
 /******************/
 /* Infrastructure */
 /******************/
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 20f3fe6..a5999b0 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -111,4 +111,9 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
     return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
 }
+
+MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf,
+                             dma_addr_t len, bool secure);
+void smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

