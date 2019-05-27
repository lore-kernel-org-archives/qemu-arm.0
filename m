Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6317294wrg;
        Mon, 27 May 2019 04:55:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7NUdxbGZjnKH0/gR3mOkcTpmSNBA6HBEQqT4VYorTX02HiGjZZM2qdX1nulNKw/VVx6ch
X-Received: by 2002:a37:8e83:: with SMTP id q125mr58135381qkd.255.1558958115906;
        Mon, 27 May 2019 04:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958115; cv=none;
        d=google.com; s=arc-20160816;
        b=MhUXy9FxYT8vwWa9yH2hnwkdPtE8Jrm64qUSqo/in9tOE6imaV7hY5/rNOIe9mx942
         seQL28BxmlIePbyCK/m/vOv1VI6iQpeEboYOR6hEts17S4mepdoghDG+T4DiaoGXtr+w
         5ZNvRLLLzlOpepbrXTlV6Za4Dr+mETmmCulw/WnsyOWWO36+quNme1oQstipWm3pC2+w
         YEWg5qmNWdBfCFOlFLBOI1wqF3MqsSXXoTLozVZFucLstBtktxWbjCI6/soUKTJ+OArg
         YKthZ7Oh60B7Cd277nZmbZXPtSXJEeDY80NvDFDeagStEUOVkM40zLssUJxDAv7OIhsT
         E+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PEOxlRwZV7MoqlvJTeKWyK3CgLB/QBz0xShKIcqnYu0=;
        b=xbbW/Q3+MmS6p5LMuRktMtrK4erzRtzPPFq40udDuAl6tqFpAc3UANZNcI8QJ53quC
         TdZM5k3QuuNas93ou+x78ItRRb8Z2U9bGVUOnLFvYY7lrDdwHbJBYYKb6dbiymCX2mvJ
         gdyLNeabQnikdtV6sImpw9FDWJYaOoVq5HW2dIk3cDpNNGc+tt9/pEMxIX1+/73FoIgb
         iAO2Y+Fh6+LK+C0x7TtPBgqP9n8nhyXhbg5XtUlc0NZDQ48hcoIZBJrGZMSqs6nFd6lC
         Go+XBK30+/tVlfs00SzGrDSP87ZuHpmIPNSxCN2rsjohSJpSpAM5vtUNtNpr6dtbMeGq
         V83A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f53si1804751qvf.190.2019.05.27.04.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEDj-0004Gg-9Z
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:55:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE31-00045s-Eh
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE30-00046L-DP
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE30-00045p-6r; Mon, 27 May 2019 07:44:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79EA546202;
	Mon, 27 May 2019 11:44:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF7E5D962;
	Mon, 27 May 2019 11:44:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:51 +0200
Message-Id: <20190527114203.2762-16-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 27 May 2019 11:44:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 15/27] hw/arm/smmuv3: Fill the IOTLBEntry leaf
 field on NH_VA invalidation
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vstTqkB/uPSQ

Let's propagate the leaf attribute throughout the invalidation path.
This hint is used to reduce the scope of the invalidations to the
last level of translation. Not enforcing it induces large performance
penalties in nested mode.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c     | 16 +++++++++-------
 hw/arm/trace-events |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b6eb61304d..f2f3724686 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -792,8 +792,7 @@ epilogue:
  */
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
-                               int asid,
-                               dma_addr_t iova)
+                               int asid, dma_addr_t iova, bool leaf)
 {
     SMMUDevice *sdev =3D container_of(mr, SMMUDevice, iommu);
     SMMUEventInfo event =3D {};
@@ -823,12 +822,14 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
r,
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
     entry.arch_id =3D asid;
+    entry.leaf =3D leaf;
=20
     memory_region_iotlb_notify_one(n, &entry);
 }
=20
 /* invalidate an asid/iova tuple in all mr's */
-static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t=
 iova)
+static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid,
+                                      dma_addr_t iova, bool leaf)
 {
     SMMUDevice *sdev;
=20
@@ -840,7 +841,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, i=
nt asid, dma_addr_t iova)
=20
         IOMMU_NOTIFIER_FOREACH(n, mr) {
             if (n->notifier_flags & IOMMU_NOTIFIER_IOTLB_UNMAP) {
-                smmuv3_notify_iova(mr, n, asid, iova);
+                smmuv3_notify_iova(mr, n, asid, iova, leaf);
             }
         }
     }
@@ -979,9 +980,10 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         {
             dma_addr_t addr =3D CMD_ADDR(&cmd);
             uint16_t vmid =3D CMD_VMID(&cmd);
+            bool leaf =3D CMD_LEAF(&cmd);
=20
-            trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
-            smmuv3_inv_notifiers_iova(bs, -1, addr);
+            trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr, leaf);
+            smmuv3_inv_notifiers_iova(bs, -1, addr, leaf);
             smmu_iotlb_inv_all(bs);
             break;
         }
@@ -993,7 +995,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             bool leaf =3D CMD_LEAF(&cmd);
=20
             trace_smmuv3_cmdq_tlbi_nh_va(vmid, asid, addr, leaf);
-            smmuv3_inv_notifiers_iova(bs, asid, addr);
+            smmuv3_inv_notifiers_iova(bs, asid, addr, leaf);
             smmu_iotlb_inv_iova(bs, asid, addr);
             break;
         }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 0acedcedc6..3809005cba 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -43,7 +43,7 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "streamid =3D %d"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, ui=
nt32_t perc) "Config cache HIT for sid %d (hits=3D%d, misses=3D%d, hit ra=
te=3D%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, u=
int32_t perc) "Config cache MISS for sid %d (hits=3D%d, misses=3D%d, hit =
rate=3D%d)"
 smmuv3_cmdq_tlbi_nh_va(int vmid, int asid, uint64_t addr, bool leaf) "vm=
id =3D%d asid =3D%d addr=3D0x%"PRIx64" leaf=3D%d"
-smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "vmid =3D%d addr=3D0x%"=
PRIx64
+smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr, bool leaf) "vmid =3D%d =
addr=3D0x%"PRIx64" leaf=3D%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=3D%d"
 smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_=
t miss, uint32_t p) "IOTLB cache HIT asid=3D%d addr=3D0x%"PRIx64" hit=3D%=
d miss=3D%d hit rate=3D%d"
--=20
2.20.1

