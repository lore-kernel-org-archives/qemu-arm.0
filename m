Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3448927wru;
        Mon, 6 Aug 2018 13:23:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf/7LkVzYhLEO+a7r1bqriz37noH1N3P+VRjHxoRImyGBjm/1qCVpJvdvYn5/movarau73J
X-Received: by 2002:a37:8c46:: with SMTP id o67-v6mr14938283qkd.162.1533586982552;
        Mon, 06 Aug 2018 13:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586982; cv=none;
        d=google.com; s=arc-20160816;
        b=VoBfGwGwHzjJEREIXqePEvpMZt5g5YoRHz1Bs/tc/6vSxHJuKL0IrsyHiegVrP6Htw
         vLxGZDHfgS76+hiT+7fpmlQogSwxeYz6RWfALPxdKzyTTrQSg94o4rI5L9f4zVHmIJUJ
         prsci9f6pnBNLn1l97cwWHw8ei69hxahdvcx++TbfF9c89RHWQEFVbxYJ8OmPHpsjCY6
         qCiceTFZoe0DsStu+1k/qaRDNp+LhW+6W2MD08ELB5JsmTR0Xbs/AhAFsQ+8cDHDdZC0
         4l/9gWVNhXIkmjD4w0j/wuULcAce6cBLjyipEbYw8bUW4n/fztJCU6gs6SVNJ4lIJ+6g
         zttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8tOP5yklbXSzh3ZgrL8OgEmszVG/mgkzBRU6hlelfVE=;
        b=zwgQdv5ejqYpSEl0rQm63c1ERBUcqyzErlU2w9iel3I9/aEJdnBawbW2iY7f+mXKJJ
         YrxEqjYhTZ+K0eDUXspZdtfjlBX94Mq8eBfffGQy4Ic+1KwAA+Ws6+qR7mKQI3BQ6GD3
         yeVB/6abmRFwnbFgxYE94PlT6KD14W0+T3aHLoR4X1i3xfST9tPmQlVNsxnT77JXLgVS
         whNltj9U69k0vadzLYdHUy+tqZxUXS7cXJJ4T/JP5dLjIfYB/A89fJmGtlytuo+qjPMi
         Z74cKrT/W2IGty/83fRIm5vXhwBzK32qBcqzzhy3/KKnIZW7C1LB/mH0mpdxjw1zHER5
         3chw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w8-v6si8530508qvn.229.2018.08.06.13.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm1t-0004KR-TC
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlui-0006b1-Vd
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlue-0006zs-0S
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40562 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlud-0006zE-RG; Mon, 06 Aug 2018 16:15:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D61640241C4;
	Mon,  6 Aug 2018 20:15:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9F16215670D;
	Mon,  6 Aug 2018 20:15:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:40 +0200
Message-Id: <1533586484-5737-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:31 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 12/16] virtio_iommu: Handle reserved regions in
 translation process
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aCso65NXzNrC

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
index 7b77b3b..6a1d214 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -749,6 +749,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     viommu_mapping *mapping;
     viommu_interval interval;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -774,6 +775,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s %02x:%02x.%01x not attached to any domain\n",
-- 
2.5.5

