Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2882077wrd;
        Fri, 21 Sep 2018 01:56:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYCJ+rronwFv/8sHxvirV/m+WXdwkPyFSsa3idDIZlc7PuZ/ymtEcMZfsXNesSpSjgvsPgE
X-Received: by 2002:ac8:f68:: with SMTP id l37-v6mr31116665qtk.158.1537520175152;
        Fri, 21 Sep 2018 01:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537520175; cv=none;
        d=google.com; s=arc-20160816;
        b=lITh1f7KA2dDnrQo18+NWlWhavmJzJs/GOXQ8oYQrnxIhv0Clu+5IAnRyWGan8OAJr
         QzQ3ivk+hSOVo0+rbuS2+AYJdHrYouOuoCoMzVcALAR5pg+6mjXawHTSMla8K5lC/N0a
         j8nwoizRWL/oDKIYrOVFNEm1zzHpxCejGoReAWzUnjQzoMG3qAMn6M48Ea6ju/SshxGm
         xERWtK96MfkH5yOKqGSWBrS9f/hgM/FnVL5nqAksZZQs8EUT2NWK/t0utEAEJX+9QA/+
         uN2iGu+nRu/mZaLnl1Zpc+boXzBCgEfmLgffk770NKbpSVRzYx0a1K3up5v/rwOOIKBR
         mvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=G6YrRRb6an988tL9rXJFG85c9emii+HFHL/tt8q4TGI=;
        b=0rY7z+DT2ywvQ5pBlWs3H03hEJxNy8OXex0lCUG3RswMZY9pt5qoJQ1Vlvq3NXqZFz
         RosfWjTvhyfy1sSSnfrtH33Z35/YaMtNBtAijmT7QjOnaSIvamB6hFY83ClUPQ2XkJBy
         2y7+BAmCz2iRoFaPzIVsFzm27dTtAfpB/LNqmta/33XgEt5Odn5UdCGEJkxfImrnhoD3
         g4beFqY0yNoaLHpBj/zQhsyWxbjIVddELJ6IPG5yEfFHYj078HX2yNsj5PoqF/wuSvPa
         bWR4Bk4+F1qSQ+qAaDrSUDatapvIzeIikIiVVGO+6Uyzx+NKeZEjPkapqp4S/x+34DaL
         TmVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1-v6si2361975qkc.287.2018.09.21.01.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3HEU-0005Cp-KT
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:56:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gh1-0005tQ-A6
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gh0-0007kF-G4
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:21:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Ggy-0007b9-FM; Fri, 21 Sep 2018 04:21:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1E408830C;
	Fri, 21 Sep 2018 08:21:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5090C7D665;
	Fri, 21 Sep 2018 08:21:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:16 +0200
Message-Id: <20180921081819.9203-26-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 21 Sep 2018 08:21:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 25/28] memory: Introduce IOMMU Memory Region
 inject_faults API
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDes37GWibIf

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++++
 memory.c              | 12 ++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f54c39b248..45bcca2081 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -391,6 +391,20 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
+
+#ifdef CONFIG_LINUX
+    /* Inject @count faults into the IOMMU memory region
+     *
+     * Optional method: if this method is not provided, then
+     * memory_region_injection_faults() will return -ENOENT
+     *
+     * @iommu: the IOMMU memory region to inject the faults in
+     * @count: number of faults to inject
+     * @buf: fault buffer
+     */
+    int (*inject_faults)(IOMMUMemoryRegion *iommu, int count,
+                         struct iommu_fault *buf);
+#endif
 } IOMMUMemoryRegionClass;
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1203,6 +1217,18 @@ int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
 
+#ifdef CONFIG_LINUX
+/**
+ * memory_region_inject_faults : inject @count faults stored in @buf
+ *
+ * @iommu_mr: the IOMMU memory region
+ * @count: number of faults to be injected
+ * @buf: buffer containing the faults
+ */
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf);
+#endif
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index 2c320bc14b..6ba8d31773 100644
--- a/memory.c
+++ b/memory.c
@@ -1976,6 +1976,18 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
 
+#ifdef CONFIG_LINUX
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+    if (!imrc->inject_faults) {
+        return -ENOENT;
+    }
+    return imrc->inject_faults(iommu_mr, count, buf);
+}
+#endif
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
-- 
2.17.1

