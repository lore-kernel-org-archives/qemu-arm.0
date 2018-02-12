Received: by 10.28.71.27 with SMTP id u27csp220312wma;
        Mon, 12 Feb 2018 11:15:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224GOsGAwbhD3xOSfDR9LxHyp4qvH0F3B1jH5ubW0tsyhKVyfxnf/+V2Oj+09FNpIZ8qI8ul
X-Received: by 10.37.106.130 with SMTP id f124mr8928259ybc.445.1518462955715;
        Mon, 12 Feb 2018 11:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462955; cv=none;
        d=google.com; s=arc-20160816;
        b=uym/2+1wJRswpVsM+QymxjjKVKA6DnXRVXNLSSNPEdtVGuZmKH+Dw3yoVcFL0gv76y
         ftfjt5UDCe7o7W2fLTznGK+QtVZQwYfhMG2HHhmtiNTDJZMMwvTGmloAm7OMxlFV2vPI
         nMC4xHcXzud+7+eSTrxbvCs7V3YC0apESRo37j28nrGmE5s8dGQRyr06JFW+AHAqv7Xb
         qCKg9KYWvS3BHn2JHG3Nx7WZqqclIiY6CKH6FTe5/pbas5Ut3QexuSMuvUCOipltLVhU
         KxH/7bg7G5PaNH/EI3PbLvww4L68l/ex36IJEWUJKawz6bn8TWtSjOMs+lVqK+ABrpGr
         NHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LR/TrM0CO7h9Za6HZbgh/fHcg0rshvDiSbIfuxYO0XM=;
        b=m62El784XJzkb1/6bkpUqsFxiZTJQMti3YpSn9745cUKpSPp6Z0hNM0dDtiMlCkCMh
         SYHwJveH0jPmXhMMfllyVPRNaGEz6YVryVR4+mZtHJgupxPUGXbK6Yd3gRkJm0QHKPSa
         Ly9mWkdV7jLwTKvUPRDUcrsVs/pQ+OSfej/zbcc91TQvuA0Fuc76B3NUlJb8SZ8H12To
         A6L+flr1EOc5uZSNha+UYR4EzRo4G/SfrgdKprXjn3iE+GPTJwRaVsAEFUOH0Bo2dEu6
         ext0vj3R/zLMJvLaWIvuZQbfQSJLD6nW0kT/gByoHbRXnWvWCZ3z+M9Ne65piZ+ElHQe
         BrbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a185si1579106ybb.570.2018.02.12.11.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJZz-0006FC-2x
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:15:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKf-0000vT-QF
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKb-0004Oc-U7
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:05 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37844 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKb-0004NZ-Pm; Mon, 12 Feb 2018 14:00:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3369E404084E;
	Mon, 12 Feb 2018 19:00:01 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 912E71008591;
	Mon, 12 Feb 2018 18:59:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:14 +0000
Message-Id: <1518461904-5305-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:01 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 12/22] virtio-iommu: Implement translate
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
X-TUID: asTFZYJULzLh

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
index 7f7ea50..785d1fa 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -51,3 +51,4 @@ virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1986565..8c806dc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -489,19 +489,62 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
1.9.1

