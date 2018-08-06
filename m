Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3449916wru;
        Mon, 6 Aug 2018 13:24:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpco+f4U3m7SapY0xCoVZ7zRv+Q3lrDZsw//vIPDNTe+Lb7ywUbFPQT2l2NKXPmotOyzANfE
X-Received: by 2002:ae9:eb91:: with SMTP id b139-v6mr15341160qkg.9.1533587062141;
        Mon, 06 Aug 2018 13:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587062; cv=none;
        d=google.com; s=arc-20160816;
        b=SIRAm2/H0fNm5Shd+tQ+qz4iN3xPT6s/LUoB8gpO3HjTezVnRmML//vjsKxqfT3JvA
         j/j89upNJpeSqSoNAhDPj4zhdVs2wAzvS5l1nsnYAgmD5EBqAlszY8ef3nC4i3zKa9XP
         6NtauFKR2DWLn9g/paSh9Q7dvOxUVJ4xjoovukXJN1qcoX3TULdO4CJN3tyTVBY7DkRh
         S+MlrH8ve1tonvalpo3rAQV5a0rJA9mIIe1q8QixJB9Mxgeac8TeqkA2pXSEpI+leDEt
         w5WYrb/bszvOq1qy+B+X2zpV/ZDj85hUVmW7WQdO/f7J7l9Q3ukt8pi23GPmxneTgz6Z
         N0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=idj2pqYb4MCgz4ypypk9S999b2DFKKByZTbmxDqQr+o=;
        b=voRK7/0RUrU7dnpvwHid4f7zcQzBJJV+m42WYAJPZXbhG6r56Hdou/hwv+CKpp7XF5
         9TZ3AHd4G8GGB4V/7azbGPIXpqqqOATaXoSxwJT8dCM90Bzksb3vhHQqrBvvtJh7Acmu
         2j+TSpiScZmJGoc7kn0jBM0CCxPDh6TraWH9+yiO4869L2fu96dJJj++L2vuViNRV1bX
         le6eAAdjjr7ph4gGWd5DALFvsCMOzU/eCV5tfv1Gigg4L7W3J3bsAReC2dhTl9WK7trC
         x5IZzPnVki5TK8wfD0YPHCsQQT/UPmMwRM7oXJeW4Bp3ZGp3djnVmWw58MwVJvI5u8q7
         CjHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o49-v6si2447364qtk.150.2018.08.06.13.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm3B-0004wB-K1
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluZ-0006OZ-AR
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluW-0006nd-JX
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40530 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluQ-0006ke-Q5; Mon, 06 Aug 2018 16:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E19140241C4;
	Mon,  6 Aug 2018 20:15:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD3A1215670D;
	Mon,  6 Aug 2018 20:15:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:36 +0200
Message-Id: <1533586484-5737-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v7 08/16] virtio-iommu: Implement translate
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
Cc: wei@redhat.com, kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ez7t6zixjqAw

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- replace error_report by qemu_log_mask

v4 -> v5:
- check the device domain is not NULL
- s/printf/error_report
- set flags to IOMMU_NONE in case of all translation faults
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 926c50b..4041af6 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -66,3 +66,4 @@ virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f3a6799..6f44d15 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -489,19 +489,62 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             int iommu_idx)
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
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s %02x:%02x.%01x not attached to any domain\n",
+                      __func__, PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        goto unlock;
+    }
+
+    mapping = g_tree_lookup(ep->domain->mappings, (gpointer)(&interval));
+    if (!mapping) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s no mapping for 0x%"PRIx64" for sid=%d\n",
+                      __func__, addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Permission error on 0x%"PRIx64"(%d): allowed=%d\n",
+                      addr, flag, mapping->flags);
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
2.5.5

