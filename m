Received: by 10.28.71.27 with SMTP id u27csp228433wma;
        Mon, 12 Feb 2018 11:25:16 -0800 (PST)
X-Google-Smtp-Source: AH8x227rHg2kC6BQSTzzIM8ZMAUjUPEdAAPSUBsYm0IP3b8PUrDm34IZgCpSg7ZHqUUVJGe5W1Oe
X-Received: by 10.129.104.69 with SMTP id d66mr8511159ywc.143.1518463516319;
        Mon, 12 Feb 2018 11:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518463516; cv=none;
        d=google.com; s=arc-20160816;
        b=0F9nq9eWzVJ3MwBTfYCsAXHdKiC8coodALVssQfGEXJqT3SrGMTbMgMi+mQPbOrU9B
         eekQ+zbh4NrJD4gtMSCp0n6eAMrWxvUx7yf9h+PqY3+JGXjos+su8x46yX/pDpD2CpP5
         i+CDnet1M7d3sD5n5VVQJ2MwkFmF1u/qCwZMEEz+ajGQNtPWKFeh4I9xdXcPijbjiZhq
         Y6UPQLhjKo8bSwFTRE63Er2q5txmlUQfamvffajzWW11WIEb5KrRypQrku3HhLxWTYtp
         3hEJ9+b5AY6tSBSKplzdJNFqBKT3njOJG92t8UAAXMHDEk0n72cpD8AvDXkuIWMKKoc5
         3hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FgZwir/bmMOJRZQ+hEtz97dtMPR1PuhGZLTo7K+43h4=;
        b=Wt+fs3UduFVqjtD9dDd+e611No3+KxrULG6SsnsSpb1eNwIAPf26CQo25KdnugLaTQ
         +OmiGzyH4hYFOzAXwStWcJh7bsMwXp2eMN1A7jGORjmMOSdHCgMrpPqMBDA2/X5uo5wV
         7T0F7n6KYhO2Iqvku6V3JgDzTGGv98P8N6UXFajh8UIbkK6Knx379l2i6RZeJfGq22V4
         K/6Y7gkq8B7mM/A0vuMcQq3Ono3kDFG4X03Jhge+fFngJxEFo/sn9PPd3ld28uyC32Ul
         bK9CfnJVQuC/8iP25M3M/5UW4e3F7Tj32tUlV8CpOR5bvVIOL2njp23s70/190ezNLB0
         hbfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a185si1147108ywf.697.2018.02.12.11.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJj1-0006aq-NQ
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:25:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJL5-0001Nc-LW
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJL4-0005LG-Jh
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:31 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37564 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJL4-0005KP-E0; Mon, 12 Feb 2018 14:00:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8676EB6EB;
	Mon, 12 Feb 2018 19:00:29 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 323771251C60;
	Mon, 12 Feb 2018 19:00:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:18 +0000
Message-Id: <1518461904-5305-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 12 Feb 2018 19:00:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 12 Feb 2018 19:00:29 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 16/22] virtio_iommu: Handle reserved regions in
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w202koAayKib

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
index 010e8e0..a8fabef 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -752,6 +752,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     viommu_mapping *mapping;
     viommu_interval interval;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -777,6 +778,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
1.9.1

