Received: by 10.28.71.27 with SMTP id u27csp842853wma;
        Fri, 19 Jan 2018 07:03:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBos4hy+IrxYyWfzes2Bq1lkpQQSLfu2TAUcFPVwbdFHBJvYw5nm0Zh9G2cgc6h+fQFtEs0XO
X-Received: by 10.37.231.140 with SMTP id e134mr40596240ybh.329.1516374214818;
        Fri, 19 Jan 2018 07:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374214; cv=none;
        d=google.com; s=arc-20160816;
        b=m887KLHLCMnnAVQSrt3E6F9+Bhkz/rW36pkJYhrGO3n5v39BBTvNy0JwpJ+KQDs6sT
         g16OR50AYQ/D+Ni1vDnLbN6COIuwYK7OAIewjBU+sms5n0g2Mqj/s1CQbtPlJIRStwzr
         wb8yJuBlOxiKcDejqeWwtDKE669vtnnIhN0fgZ9dyDYpgO0YiSMB+yJ4SHdto2TIzVRA
         89AGDmrBnSfKZFltdm/fxCoCN9TZiePuA9OE5x1omJFTxdO4AAXqU0MvHRsgW5B3fIcF
         Ui5Dyv1kWsIGmc4JyVD4fLQ32iaGFiU6tysMTpHS2l1ygRC0Xryqkongefjd6qOFEScH
         1++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vJdCi2RQSbE3trRRNC+iqbAuNx+NeVv/uuabZ/Ct+5U=;
        b=IWYN6Du6SWZITdEPXmCt9kocrtUDuAPKMuVMAMh9MISZlBXQBG3/HVDEd6gPz6edDh
         khc5WuUMGp/n5hN8pdVcewZn3hxM8DEraHfru3S1VC8sw1HzJ/ZkWBFhp1ATwFdQF2/k
         K9oDkWXzTnS6fdfv31ayrmMw4lJ9pyoDcsIfaND143dvVaqmnKDBYLWJwscA1YLFEpBP
         ZgIjoCrdl5Rv2U4Q1nRC8cSUu6Ns2mDUiDMoAh7JheslIyfPm5Iclca+led8RubKNT1n
         uXtQ8D9e0p8iXLGPfgmabB5TvpDJzBFBorlzHoUxF0svitZhsulorXA5lFyfKxL6GUpS
         pMXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i145si2209102ywe.30.2018.01.19.07.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYCc-0006yZ-8C
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:03:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYCL-0006vu-5R
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:03:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYCH-0007Zm-Td
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:03:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYCH-0007YY-Lg; Fri, 19 Jan 2018 10:03:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ECFAC9D2C;
	Fri, 19 Jan 2018 15:03:12 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E58435C1B7;
	Fri, 19 Jan 2018 15:02:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:05 +0000
Message-Id: <1516373355-305-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 19 Jan 2018 15:03:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 12/22] virtio-iommu: Implement translate
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6OGkfCrWpEm4

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- check the device domain is not NULL
- s/printf/error_report
- set flags to IOMMU_NONE in case of all translation faults
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 3ce9b82..873e4fc 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -45,3 +45,4 @@ virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f530eca..c96aacc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -485,19 +485,59 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
     uint32_t sid;
+    viommu_endpoint *ep;
+    viommu_mapping *mapping;
+    viommu_interval interval;
+
+    interval.low = addr;
+    interval.high = addr + 1;
 
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
         .translated_addr = addr,
-        .addr_mask = ~(hwaddr)0,
+        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
         .perm = IOMMU_NONE,
     };
 
     sid = virtio_iommu_get_sid(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep) {
+        error_report("%s sid=%d is not known!!", __func__, sid);
+        goto unlock;
+    }
+
+    if (!ep->domain) {
+        error_report("%s %02x:%02x.%01x not attached to any domain", __func__,
+                     PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        goto unlock;
+    }
+
+    mapping = g_tree_lookup(ep->domain->mappings, (gpointer)(&interval));
+    if (!mapping) {
+        error_report("%s no mapping for 0x%"PRIx64" for sid=%d", __func__,
+                     addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        error_report("Permission error on 0x%"PRIx64"(%d): allowed=%d",
+                     addr, flag, mapping->flags);
+        goto unlock;
+    }
+    entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr;
+    entry.perm = flag;
+    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
 
-- 
1.9.1

