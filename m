Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp577959wrw;
        Fri, 9 Nov 2018 03:42:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5cqXii8Zq1HndRyKEvT/s9xQKLdTPwYjpLTrQlPYgK/44dnlb0JtAk49kE3BzF8dmmBHsaa
X-Received: by 2002:ac8:4359:: with SMTP id a25mr8371736qtn.361.1541763779347;
        Fri, 09 Nov 2018 03:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763779; cv=none;
        d=google.com; s=arc-20160816;
        b=t7K2cYRMgUR+e/SJRRyvoimUzn8xTNgMgmQ0Zg7cnNl7Srutqf5NWksjN4Ma2z604Z
         qUXAk3kx8/6T+HIPwNgCAim1BaVncgbP8TCJDX1feRyd37RsWqUKWGLyscLeGwU78vA9
         VdxJsPHoy8zDnM+nwJN4jBGdL1bjkrcIhUz1QZ5y3rD/g+Cd1tx5ptuqHAxQnr57ODjA
         X+ubUGVDxQbWcWdddmkKOqk7uLxGVpdefI0uGoKkg3i0iR0yiqVQhLZhU+eKKQaDXIU8
         IUTzHCu69ntUmks67RpGMq4CgJBURyYEFOx45tenznZFZDXXaJ0atDWfp+lKJqISqldT
         zUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=j4smEw50LlMC8dUfuxBt8vLxFDesaEE1b8VkWWmxzik=;
        b=AOdSKgrFLslHQeqNCQ9SRuqudO5Zcx3aMmn9zGQasMBkrjIUx66ZcCOvusK4VJm6GN
         C/iAVX4XdL0sZkRysdFWjWBND642I0hkx/8UXosrmb1Qhfv/3Q92L0QYvhzRoabEvIAx
         lP9NmfWg7KZujxSPxKB4w2Lw5H8GZuVUPdxWQ2ObzWVprvOnTdzFoAiCnvPWMMiSPgtp
         Jx6A66FGhvAb4VzznZYuYK06NUTGKFAskFpkVP9d/lvKm2mNhRsEw1yhX4gTotgjaBSv
         WJ03/v4GmFAs7dvrVpZ1PKIDVXbFuwGy4Fb8YT+LICkNx3Qfcuu1vaST9M4eBIVrwQsy
         M4sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si1744575qvd.6.2018.11.09.03.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL5Bi-0003Wg-P9
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:42:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL500-0006hC-VX
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zz-0000no-IB
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zz-0000jV-5k; Fri, 09 Nov 2018 06:30:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64AD4C0669B0;
	Fri,  9 Nov 2018 11:30:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 267AF5C219;
	Fri,  9 Nov 2018 11:30:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:48 +0100
Message-Id: <20181109112957.10067-10-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Nov 2018 11:30:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 09/18] virtio-iommu: Implement translate
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZrgnPPyT1FG

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- implemented bypass-mode

v5 -> v6:
- replace error_report by qemu_log_mask

v4 -> v5:
- check the device domain is not NULL
- s/printf/error_report
- set flags to IOMMU_NONE in case of all translation faults
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 57 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index b3c5c2604e..1f0e143b55 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -68,3 +68,4 @@ virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1a1ed4d3d3..281d6d69c9 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -480,19 +480,74 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
     uint32_t sid;
+    viommu_endpoint *ep;
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    bool bypass_allowed;
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
 
+    bypass_allowed = virtio_has_feature(s->acked_features,
+                                        VIRTIO_IOMMU_F_BYPASS);
+
     sid = virtio_iommu_get_sid(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep) {
+        if (!bypass_allowed) {
+            error_report("%s sid=%d is not known!!", __func__, sid);
+        } else {
+            entry.perm = flag;
+        }
+        goto unlock;
+    }
+
+    if (!ep->domain) {
+        if (!bypass_allowed) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s %02x:%02x.%01x not attached to any domain\n",
+                          __func__, PCI_BUS_NUM(sid), PCI_SLOT(sid), PCI_FUNC(sid));
+        } else {
+            entry.perm = flag;
+        }
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
2.17.2

