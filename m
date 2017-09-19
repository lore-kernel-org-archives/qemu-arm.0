Received: by 10.223.172.38 with SMTP id v35csp4644758wrc;
        Tue, 19 Sep 2017 00:53:23 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB5nr2TMhVl9c+wxQTR1LbAH4sL/hCYWXJV/a7ZWM+wc9G2D14zFcG93l6L6OrP5D6ui8Dm
X-Received: by 10.200.8.166 with SMTP id v35mr767425qth.306.1505807603360;
        Tue, 19 Sep 2017 00:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807603; cv=none;
        d=google.com; s=arc-20160816;
        b=cvOih4sPqyAOCk1TZO4UG4tJ4CW1GbItOmqJW2kQp3HD0+9KPfjY8bkI+zfbU1S3qs
         0bUMXPPJDX0vUqMqDbbcGQnSAohACc/fvC2nlVJqr6IW+4F4BDpCYkgqg2FAu2A/HXSu
         Sahd+mDy09Iewz7RRuSxSD8XUAIumgh9tStLP52MhUwehVexNFoYTTuVmTqyXOSX1BX7
         AKxZBEsidpCKINYvDlNBEbZC8ry7Jn/DHjLxYU9rk1ooYRCblCBVrcouIZHhkFvBAAPh
         dorxhEzfK9d6IpnGMXg2quBe4mf2p+PFleT2FUoWkZNhLpW8utWtcFYuyew2Cm57akVp
         fwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=r74hpeKNSfKFXFXO8NROwLJ0N1LdtHny0uvpyHfIhpE=;
        b=eWB79in+2ngsqz7ODqhL9HigfgcfpXpGLeaBZ9OIyAT35Tq0fN7OvosHk1tvJt5oUZ
         PknfNOwqHQHgXnW7D50UdA0G9nE9qlWnJfdVDxxsE/sLo4dN3AGAjyE5tx6b//30zeHj
         GLzuUGRshjIk54pRJrTMIi4scwdansQUTxzYxiVnuZiIjb8wwiWIMpHxXDWGN80hSYNB
         Ui4QUYzrZZyx0H12l/WArCAwvV9662LanEN6g/UzJUY0bja7flIXKWCyvsmdYIgGKXqp
         VfcZEfCuebO8sHUloeq5UqvJffv757Ec599hnkCsF3QZM/AfHQ8MFkWE2ILXjp61mtM8
         IRWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si8676907qkh.522.2017.09.19.00.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDLN-0003du-4k
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDHD-0000Ya-8P
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDH9-0001Di-2s
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:49:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDH6-0001CS-IL; Tue, 19 Sep 2017 03:48:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F36C7EA90;
	Tue, 19 Sep 2017 07:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6F36C7EA90
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E58496134B;
	Tue, 19 Sep 2017 07:48:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:41 +0200
Message-Id: <1505807208-9063-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 19 Sep 2017 07:48:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 09/16] virtio-iommu: Implement translate
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uinieu1TlHaI

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index da298c1..9010fbd 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -45,3 +45,4 @@ virtio_iommu_put_as(uint32_t asid) "Free asid=%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6f1a7d1..db46a91 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -496,19 +496,54 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
     uint32_t sid;
+    viommu_dev *dev;
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
-        .perm = IOMMU_NONE,
+        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
+        .perm = flag,
     };
 
     sid = virtio_iommu_get_sid(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
+    if (!dev) {
+        /* device cannot be attached to another as */
+        printf("%s sid=%d is not known!!\n", __func__, sid);
+        goto unlock;
+    }
+
+    mapping = g_tree_lookup(dev->as->mappings, (gpointer)(&interval));
+    if (!mapping) {
+        printf("%s no mapping for 0x%"PRIx64" for sid=%d\n", __func__,
+               addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        error_report("Permission error on 0x%"PRIx64"(%d): allowed=%d",
+                     addr, flag, mapping->flags);
+        entry.perm = IOMMU_NONE;
+        goto unlock;
+    }
+    entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr,
+    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
 
-- 
2.5.5

