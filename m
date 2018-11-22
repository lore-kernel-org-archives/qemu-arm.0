Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp959006wrt;
        Thu, 22 Nov 2018 09:28:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WQNRUTLFsRz4Q0D2v7kdbHKCocyuiUwhJTbLC3qq+L+m0zk1LBrzJTmeJhW+prBJhMX4qA
X-Received: by 2002:a25:d493:: with SMTP id m141-v6mr10949480ybf.193.1542907681155;
        Thu, 22 Nov 2018 09:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907681; cv=none;
        d=google.com; s=arc-20160816;
        b=PUUNuB9BqNYUMLEMhftqXU/95Ml2PJJwUqUt922kacknQiIlLAMNGX8Qd+GPDgiVoj
         CIaA9xqDniCRhPlpt8ZCZRW1Yrkrh5QWOOA0RNWWyBjDJLno+awUIluWaaeShqgdO12s
         cFsEHoJIy3ivsu3NgC9CJm2vkuRwJrAc+hLZm8xzNnic2GuZtt9I4+VBBu91X+TKVehu
         N6IIJS2zl6BXQsDZjCVDGTG+fppK2MkujbO+MyeMvBMpDeR6SMBtk7QRrLpAZXmwgMd5
         fW+H9jpAR9O9lwEO5YMRDtv6m1p0yU6CQrFc/DurIz1AewVxB8xCp9l+DYn+nhz4MAL8
         T9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=DfDbiSUdP9aPiVBErJFakF2wma33TWkAW2M3bHfAZeA=;
        b=AzHBVy09LkzimT+SvR1jMTWeV0GT2g52Rn7QPW896LntY+BMouuaN5HC8Apkc74cLb
         MUglAFuTX3QimwfG2jB+rEPs3MHP+hTQK1UnmdSZkdDcTRQQGujpchfism4+pwBC5ETK
         ImXB7FOCruhaIT4hLDm03dzRN2le/N6KxEE8VyG56u5ziSrw0r6p/Q1i9EPc6zRhE/SG
         2ygN6lCvdFqseizLblTCtt27L6jJuQIPiNzYruLoQer6ARFr1B6bMIeeGqsU4F/xfws+
         t1Zhys3hD50jg9ajQskSzHv0vlBmk5fUbJkay3/Edv+rlXjOEZ6zD9nRhQhR7qAIFzc3
         2kzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7-v6si12111596ybo.234.2018.11.22.09.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:28:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPslk-00071M-6C
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:28:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsbD-0005WK-26
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:17:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb9-0006hg-Nl
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:17:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsb0-0006Hq-Tz; Thu, 22 Nov 2018 12:16:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF0A110DE3;
	Thu, 22 Nov 2018 17:16:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 894D560920;
	Thu, 22 Nov 2018 17:16:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:34 +0100
Message-Id: <20181122171538.12359-14-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Nov 2018 17:16:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v9 13/17] virtio_iommu: Handle reserved regions
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
X-TUID: wQjHW4XepEAW

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
index 1246dd6bdf..2ec01f3b9e 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -740,6 +740,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     viommu_interval interval;
     bool bypass_allowed;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -772,6 +773,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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

