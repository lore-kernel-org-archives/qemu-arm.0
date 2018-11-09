Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp577390wrw;
        Fri, 9 Nov 2018 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5fiiY0BZocHv+dqOkaFKkMA3CBsKjBXPKIQ7zR9K3ShmaLtxNc934an1hZw2b0rq14WV6wX
X-Received: by 2002:a37:62d3:: with SMTP id w202mr7716355qkb.357.1541763741338;
        Fri, 09 Nov 2018 03:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763741; cv=none;
        d=google.com; s=arc-20160816;
        b=b5mK+L/vKPmn61p9qjDfrtsWz488WT8EBWV9wt7TGi1O+vWZ+7nS1RtHRS8ylI0nNI
         OlCWLj4KQU4Df7s2w/4qx5FEcLXKf5wxnu6wuH+kxOryZ9+FCnorxMFkTbMeL0fjoeaV
         Wq+Z2FKe/SDuZHddloBwGd0L+XaWAxh3a9PWrOwFabqsRHGqw6f7oy7CXOcQKZWGo9Zv
         2Y+NCd/EenrQd21F/aNxzYQKktNiQYJlc7phC5SOMBpk+CpMxRFvbpz+jObf9iQqRrO0
         oUKeSYAkFxmS4sm/GJP/izhc8cp15YwMgAgbYgCsIkb4fVh5wSec7Px3VjGxZ7Li6UvM
         ot3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=12zQwPJtw/H+EhJ8drDT4I+jFyJN431DPD3NLbtMov8=;
        b=tK7CTHdcCzOUk5+l9fP/oLdvqq3q2uSAmOm+5uKA+eNJdKvz3wG8c7zh0FVAl0whCY
         Tox+n7uUbYMEQKHOkAR2BGV2xHIYI04AAMyGNjV6txDPBKhH4U9oH/L+1Cg2trHiDilO
         hSdBcoIJLOXV8yaou99r0Bd8j7QcvnvmNIINyfZGRMxvCneunmOW1Tb1pJwrd8TFqKYt
         C6X0VUsxQCKe4LqnmCOENiJKh/W7m3vHSu42CMOqUMm4tMi4yKqLiqqnXsv8vO1blz0P
         PWW2mS69PngfV2lgKX7O5fmCmqyKWe0It4J/jDT4a9NDDhpCmnsCTybohME1XsLBdBOh
         LkHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4-v6si5478746qkf.24.2018.11.09.03.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL5B6-00023z-Sd
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:42:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50I-0006y5-9K
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50G-0001xt-CR
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL509-0001Th-GV; Fri, 09 Nov 2018 06:31:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3128300238D;
	Fri,  9 Nov 2018 11:31:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 553F85C22F;
	Fri,  9 Nov 2018 11:30:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:52 +0100
Message-Id: <20181109112957.10067-14-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 09 Nov 2018 11:31:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v8 13/18] virtio_iommu: Handle reserved regions
 in translation process
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8G0ZK9QXwQQp

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e5ab3db834..c88aecf18f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -743,6 +743,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     viommu_interval interval;
     bool bypass_allowed;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -775,6 +776,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto unlock;
     }
 
+    reg = g_tree_lookup(ep->reserved_regions, (gpointer)(&interval));
+    if (reg) {
+        switch (reg->subtype) {
+        case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+            entry.perm = flag;
+            break;
+        case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+        default:
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                      0, sid, addr);
+            break;
+        }
+        goto unlock;
+    }
+
     if (!ep->domain) {
         if (!bypass_allowed) {
             qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.17.2

