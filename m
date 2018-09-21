Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2869394wrd;
        Fri, 21 Sep 2018 01:39:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbNPR7SXLjMwHuHHUq6ElHxANAPNaIt0Sz9Cka10Y9WdEx+PGEf9YbjxOtYjFa/Rh2z03XS
X-Received: by 2002:ac8:7606:: with SMTP id t6-v6mr30659717qtq.153.1537519181156;
        Fri, 21 Sep 2018 01:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519181; cv=none;
        d=google.com; s=arc-20160816;
        b=LWtljVxCt1XvrITqn9lPvzdsaJjLeTJaGPyJc6Ptyk7sPZGAP11CoUR1bkDvwA8WyK
         vDxQ26EnHXSNofvZ1PHxBXauvmknUNH9PY2nDSpmJr0kcWEFFedjdhrT2fM8+gf5vcV2
         R74EomClXaCAsJDLpPujJnZGxXHZ3jFZLVUeunpUsJqImn8eiIzfvS30ZIKRNmTlkGxc
         Yq6+8kId0B+cYeEPrgcWk6bK2hFgYPutGvx6tZg2FK4bjHAgzpmFGJyrvks4UchRvPNx
         rCTRWPMZZMDEJ3U1p45pbalE6xCq2hsbThquHlr5leSOI3wvyVMnvvkC+k+/u7h0qkQI
         PRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=y37JNscRgk4osCnRMDSOU8KRyuLsv8JEXDPpK9XJ3yE=;
        b=Crrzzyj4dtgEDGvyanrc9vbsmOoPy0xzSe5qiASttRhbIAKrfsMJVEGBu50Cs+boai
         OuM23hE+sQg2Ygi7gZw39MYRd9w0OpUA8q2MwPX5mABZhcCZ3ilg+YEBDpcBrXHOQj72
         41gpw5sg0e/PnT1EYB0lpbsiYa7HwEo/gVLBFhILoR6PtMejJrZwjeFmpq1Lf5HD16Tb
         116HuFjUK2aeWIG93315iEPqtQ9RJpdksAOg0Yn5wpEOBs6ZShMcia1wBgSy/As2E9Kv
         5xNzLUmZ/QrL9G/ORz0m2bDW16InGgo7ERWvFP33numm78lr462CTPPeforlo9Dtm0b7
         wSkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6-v6si7911455qvb.143.2018.09.21.01.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GyS-0006EY-L5
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhJ-0006AV-Vf
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhJ-0000MQ-5l
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GhI-0000Hn-UC; Fri, 21 Sep 2018 04:21:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 199A019CF61;
	Fri, 21 Sep 2018 08:21:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3D907D665;
	Fri, 21 Sep 2018 08:21:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:19 +0200
Message-Id: <20180921081819.9203-29-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 21 Sep 2018 08:21:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 28/28] hw/arm/smmuv3: Implement fault injection
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CD1UY5AosDD9

We convert iommu_fault structs received from the kernel
into the data struct used by the emulation code and record
the evnts into the virtual event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Exhaustive mapping remains to be done
---
 hw/arm/smmuv3.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ae27cfdfa0..7ecc6c9669 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1561,6 +1561,81 @@ smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
 }
 
+static inline int
+smmuv3_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                     struct iommu_fault *buf)
+{
+    SMMUDevice *sdev = container_of(iommu_mr, SMMUDevice, iommu);
+    SMMUv3State *s3 = sdev->smmu;
+    uint32_t sid = smmu_get_sid(sdev);
+    int i;
+
+    for (i = 0; i < count; i++) {
+        SMMUEventInfo info = {};
+
+        if (buf[i].type != IOMMU_FAULT_DMA_UNRECOV) {
+            continue;
+        }
+
+       info.sid = sid;
+
+        switch (buf[i].reason) {
+        case IOMMU_FAULT_REASON_UNKNOWN:
+        case IOMMU_FAULT_REASON_INTERNAL:
+            break;
+        case IOMMU_FAULT_REASON_PASID_FETCH:
+            info.type = SMMU_EVT_F_CD_FETCH;
+            break;
+        case IOMMU_FAULT_REASON_DEVICE_CONTEXT_FETCH:
+            info.type = SMMU_EVT_F_STE_FETCH;
+            info.u.f_cd_fetch.addr = buf[i].fetch_addr;
+            break;
+        case IOMMU_FAULT_REASON_BAD_PASID_ENTRY:
+            info.type = SMMU_EVT_C_BAD_CD;
+            /* TODO further fill info.u.c_bad_cd */
+            break;
+        case IOMMU_FAULT_REASON_BAD_DEVICE_CONTEXT_ENTRY:
+            info.type = SMMU_EVT_C_BAD_STE;
+            /* TODO further fill info.u.f_ste_fetch */
+            break;
+        case IOMMU_FAULT_REASON_PASID_INVALID:
+            info.type = SMMU_EVT_C_BAD_SUBSTREAMID;
+            /* TODO further fill info.u.c_bad_substream */
+            break;
+        case IOMMU_FAULT_REASON_SOURCEID_INVALID:
+            info.type = SMMU_EVT_C_BAD_STREAMID;
+            /* TODO further fill info.u.c_bad_streamid */
+            break;
+        case IOMMU_FAULT_REASON_WALK_EABT:
+            info.type = SMMU_EVT_F_WALK_EABT;
+            info.u.f_walk_eabt.addr = buf[i].addr;
+            info.u.f_walk_eabt.addr2 = buf[i].fetch_addr;
+            break;
+        case IOMMU_FAULT_REASON_PTE_FETCH:
+            info.type = SMMU_EVT_F_TRANSLATION;
+            info.u.f_translation.addr = buf[i].addr;
+            break;
+        case IOMMU_FAULT_REASON_PERMISSION:
+            info.type = SMMU_EVT_F_PERMISSION;
+            info.u.f_permission.addr = buf[i].addr;
+            break;
+        case IOMMU_FAULT_REASON_ACCESS:
+            info.type = SMMU_EVT_F_ACCESS;
+            info.u.f_access.addr = buf[i].addr;
+            break;
+        case IOMMU_FAULT_REASON_OOR_ADDRESS:
+            info.type = SMMU_EVT_F_ADDR_SIZE;
+            info.u.f_addr_size.addr = buf[i].addr;
+            break;
+        default:
+            break;
+        }
+
+        smmuv3_record_event(s3, &info);
+    }
+    return 0;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1570,6 +1645,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
     imrc->replay = smmuv3_replay;
+    imrc->inject_faults = smmuv3_inject_faults;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.17.1

