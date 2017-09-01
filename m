Received: by 10.223.188.70 with SMTP id a6csp1296904wrh;
        Fri, 1 Sep 2017 10:32:50 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4qjp7DS7KJilPsQSW+yxiGxFqE0Gbq7fZXAW87q+Sd78384GI5wLbyrSqga/aXxzOG/bW/
X-Received: by 10.55.180.199 with SMTP id d190mr3774687qkf.87.1504287169977;
        Fri, 01 Sep 2017 10:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287169; cv=none;
        d=google.com; s=arc-20160816;
        b=UJ2zoIfpXTaJj4Dtnd3KNB+NupQJCAF+w64VKYxVk3ZKxXFUNd37n3nfoEjf2Kc+Yo
         s6/HTd6i5AMB8M3O99SJcOMyZ1vfsq4INOkf71m3W2aKCUSqDFgb5RSCO7n2QJIHQ6wH
         2bfXtUglDoSYTuVZYG/qQ42aI86z3NCoUPCl80BWNRD2OwZ61SNF5kmoPC8z9z9AM3qq
         GBjJnoh5nHOdMwL9iwZa+dhqleh/j8mPQMuCLeCyVjKeMsjO7+7/QjJcpKC8Dsb8vM3E
         7nmC+dq6X9mUm1+pWms9KldywLWfJs/NFCT8AhCyYpYJ3pI23te1RfxmkO87DshoS2I1
         4HCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=u3FzTccTCp2o2qYV8HVn+j5WMIyow0+mkQTfcuXsyOw=;
        b=Abdfe2Rh4nFAJTRhdVFk51eqjs+jCCiLfwhZTWxR00Us+xts1uqHBhfxDTH05xDhgs
         W7r+XJb+XLQbC13rzrMkuaL7Q07gxuR8V0kvvn7mNXiDXqEJsbW2m4lzg483VGAo1rEk
         NJP5EpBiE+OOrY4+aMBAi1N26w/AjD31Spw5iYiiZFaXwiMwLfD76G4efLDc/Ow7kRRz
         KaljMG7OXjHxYoWoHbrEXl4kp07myrq8Z/EBQaZaXF860jFtF4jUSbdet61ReQLbpAvM
         GN8NOJs9kPhQaP+nU6+1FtA1ct17PUB/3tgAnecsMYwN2pBwGvXGbT65zHwdA9blyaXk
         XSNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b58si676836qtc.127.2017.09.01.10.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpoF-0006dE-ON
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfe-0006N5-Qp
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:23:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpfd-0003oc-SN
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 13:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpfT-0003gH-Sh; Fri, 01 Sep 2017 13:23:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9EC8C047B88;
	Fri,  1 Sep 2017 17:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D9EC8C047B88
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA80627DE;
	Fri,  1 Sep 2017 17:23:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:16 +0200
Message-Id: <1504286483-23327-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 01 Sep 2017 17:23:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 13/20] hw/arm/smmuv3: Implement IOMMU memory
 region replay callback
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
	christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9NS6cuFDzbr2

memory_region_iommu_replay() is used for VFIO integration.

However its default implementation is not adapted to SMMUv3
IOMMU memory region. Indeed the input address range is too
huge and its execution is too slow as it calls the translate()
callback on each granule.

Let's implement the replay callback which hierarchically walk
over the page table structure and notify only the segments
that are populated with valid entries.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |  1 +
 2 files changed, 37 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8e7d10d..c43bd93 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry *entry, void *private)
     return 0;
 }
 
+/* Unmap the whole notifier's range */
+static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
+{
+    IOMMUTLBEntry entry;
+    hwaddr size = n->end - n->start + 1;
+
+    entry.target_as = &address_space_memory;
+    entry.iova = n->start & ~(size - 1);
+    entry.perm = IOMMU_NONE;
+    entry.addr_mask = size - 1;
+
+    memory_region_notify_one(n, &entry);
+}
+
+static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    SMMUTransCfg cfg = {};
+    int ret;
+
+    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
+    smmuv3_unmap_notifier_range(n);
+
+    ret = smmuv3_decode_config(mr, &cfg);
+    if (ret) {
+        error_report("%s error decoding the configuration for iommu mr=%s",
+                     __func__, mr->parent_obj.name);
+    }
+
+    if (cfg.disabled || cfg.bypassed) {
+        return;
+    }
+    /* walk the page tables and replay valid entries */
+    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
+                   smmuv3_notify_entry, n);
+}
 static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
                                      uint64_t iova, size_t size)
 {
@@ -1095,6 +1130,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
+    imrc->replay = smmuv3_replay;
 }
 
 static const TypeInfo smmuv3_type_info = {
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 4ac264d..15f84d6 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, ui
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_replay_mr(const char *name) "iommu mr=%s"
+smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end) "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
 smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
 smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
-- 
2.5.5

