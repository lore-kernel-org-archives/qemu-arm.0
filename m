Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990819wrv;
        Thu, 11 Jul 2019 10:44:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIXt8SK1aiBFy9LSxXLo7YD77vKrF4y5Zw5nGaRBPqBm6JL/3SBpk2CXotBhrbnXced+WZ
X-Received: by 2002:a50:886a:: with SMTP id c39mr4837940edc.214.1562867092676;
        Thu, 11 Jul 2019 10:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867092; cv=none;
        d=google.com; s=arc-20160816;
        b=XQdnZ2Vc6IGA4v0QAuSH4ZgYr1vxnSJ7oPkPqeHW2iyKL163xNMIvXTxKa67mXF0vi
         BfMSUyFhhGm1WCh61AOLyJs3FECQA1tUTFvoXVxTIGL2aWDETJrdQrjknIrIpPthbwzN
         6M/1qHwCrRuyVDtzM9bmFLIBVesAkZuevxObsmgK0trmP7QnGmtq6rCgobRl6oi6RLx/
         dXI5xSPud8ajHfF6m5ttfUpfqkLJx2ourpYiso4WPMRQJaCccDW7QvFc32yz7sbKtSLp
         sdc0KwU4Oxuyp4HuYO0ujblOrxfngCn1TwMVOzqHkn+XC3vK68h3r9SIGrqgOj86Y3Dp
         Y26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bt+P1ju0FuVk9MaO7VGGMqI5CIstKQA5iBNFrd0MQY4=;
        b=GKZiBaLPqZecIddqf0TT1ouLY8LFsxRR0GUJq2BxZ6RjWbaRwXyw/ervX+QLLKMknD
         0a0m5iZ7B/t29mg2hhymqA/VNUzvL4Qq2EvAdZ2UyBNWbRx1V5ft4n/U2zdyCW/sv3Yy
         sip6yCNScA8VTXpB5+2a6qnHebz2wSYJjAbLWbUIekbvBwQYwx2BV570xJ8ZVhx8eY3Y
         0HVrC5h658M6RcJrEFepIxPOVZp+j3B1/r/BZjKEXE5TcCwyDyBvlDy3AVK1UREo9Q7O
         45oclcz2B81Q72nRN4NmVJ4NwLSdh4ciBJGaH/djiSkN0h/m9jRLCqRCJdIk0Rc27HHO
         ojKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si4243652eda.198.2019.07.11.10.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld7j-0003DY-9y
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39215)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5b-0002RA-QR
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5Z-0006He-G1
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5Z-0006GF-4f; Thu, 11 Jul 2019 13:42:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47F3085540;
 Thu, 11 Jul 2019 17:42:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2B76092E;
 Thu, 11 Jul 2019 17:42:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:30 +0200
Message-Id: <20190711173933.31203-27-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 11 Jul 2019 17:42:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 26/29] hw/arm/smmuv3: Fill the IOTLBEntry leaf
 field on NH_VA invalidation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dz9u0wdM0bps

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
index 8c88923f73..2a6bf78a8e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -797,8 +797,7 @@ epilogue:
  */
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
-                               int asid,
-                               dma_addr_t iova)
+                               int asid, dma_addr_t iova, bool leaf)
 {
     SMMUDevice *sdev =3D container_of(mr, SMMUDevice, iommu);
     SMMUEventInfo event =3D {.inval_ste_allowed =3D true};
@@ -825,12 +824,14 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
r,
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
     entry.arch_id =3D asid;
+    entry.leaf =3D leaf;
=20
     memory_region_notify_one(n, &entry);
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
@@ -841,7 +842,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, i=
nt asid, dma_addr_t iova)
         trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova)=
;
=20
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, iova);
+            smmuv3_notify_iova(mr, n, asid, iova, leaf);
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

