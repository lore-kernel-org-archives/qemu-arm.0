Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1914750lfp;
        Fri, 14 Feb 2020 05:32:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhFfZCAv4AAcn3Qxix/+ydm9twQd1klO7ZvJUpqOFta/VYabBtRkg0swBsRu8yDajOvodM
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr2167595qvb.80.1581687145978;
        Fri, 14 Feb 2020 05:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581687145; cv=none;
        d=google.com; s=arc-20160816;
        b=x0GFGbIzSlEHqfj5TZQTgy77P3RUr1o4sv6h2a0TQPGr4HtGZKO3Tvaq9ipUXBWSKO
         zqI6YCOsFN6yKKF0E/dnB/e2wVxnWA2WiFltGfvv7V0eE40qcm+2QVf5+pkJd3b+hZ8o
         SGY2QIhj1u1bwL6vyrybaR4hLxXJF/BaRxO8VdGomI1715vojroKWz3FZeF51egO2J57
         QEcSzu95pWsEthC5+NvEUK3seyYWHenXUHpTFQC0cXZ1C4Pu8HmPnnhyEMQktBcnaqi/
         RngZoV6VGQ25x40KP01/dqyLP26R2K8cnu/9L7i+rUZJYKcCy4X/lF32Z8qsUy5MnciZ
         kYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+AHmGJwOmpJRCQlSbnae4XHqGpIzunQCrq4ckbqRz6E=;
        b=yt1SCgzWfZQfDiql63XmvL3gkMi2O8HsDU6nXmsHHZx6dtcprNkP507W9IYGc7mY0s
         uCfwLwVITlZ26/8tQTSow3qOT8Biiogq7ay69VsQx7cGSJsSajt4sDuDM1YEGwf7AmAA
         IoVoc7M0oL0SHklr3PGGatlIdxWmOCObFidm0O5n808eAb7SV7cobeZmJPHXJ5fBjuna
         ML3Ysh152sEM2+P6eVGqMEfBUkNEMEBsIpOJXUmvS55ZDv0g1ygVtDyQouqsFCdxakBG
         5UO4w1jhjpaaBTN6CqKCTMjrfOupqGo12Fz+RjueXGsDKCw1EfAwjrSlz6o2NnDbACJ5
         5z9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=InyMsthH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si2597950qvx.193.2020.02.14.05.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=InyMsthH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b4z-00062P-9h
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b1t-00027Y-BW
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b1s-0000lK-2q
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b1r-0000j3-TF
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+AHmGJwOmpJRCQlSbnae4XHqGpIzunQCrq4ckbqRz6E=;
 b=InyMsthH9UNAL0dAUFstZ1rX0pQK/MJRI3LVz0B4FPgLQPed1ACa4O0OzpJ3KnkVKhrw/F
 q1LQ0cT1/eC3ssJ/hwt5TqDjgSm/jjPJmY+fq4JnxkExf5kmCisjYeveyoF1KZ4ZWbyV6d
 aR89+T8oMy4Zq2dO/GQeT71E2UhTOtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-S4Hk2gloO1SRh8gRVYrrdw-1; Fri, 14 Feb 2020 08:29:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EBB413E2;
 Fri, 14 Feb 2020 13:29:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 846F75DA7D;
 Fri, 14 Feb 2020 13:28:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 06/10] virtio-iommu: Implement fault reporting
Date: Fri, 14 Feb 2020 14:27:41 +0100
Message-Id: <20200214132745.23392-7-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: S4Hk2gloO1SRh8gRVYrrdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 725dT2/AE3Dp

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---
v13 -> v14:
- remove loop
- add Peter's R-b

v12 -> v13:
- return on virtio_error()

v11 -> v12:
- reporting the addr associated with the fault and set the
  VIRTIO_IOMMU_FAULT_F_ADDRESS flag.
- added cpu_to_le<n>

v10 -> v11:
- change a virtio_error into an error_report_once
  (no buffer available for output faults)
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 70 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 095aa8b509..e83500bee9 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -72,3 +72,4 @@ virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=
=3D%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoin=
t, uint64_t addr) "FAULT reason=3D%d flags=3D%d endpoint=3D%d address =3D0x=
%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 59e9cd3d9a..8509f64004 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -468,6 +468,48 @@ out:
     }
 }
=20
+static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
+                                      int flags, uint32_t endpoint,
+                                      uint64_t address)
+{
+    VirtIODevice *vdev =3D &viommu->parent_obj;
+    VirtQueue *vq =3D viommu->event_vq;
+    struct virtio_iommu_fault fault;
+    VirtQueueElement *elem;
+    size_t sz;
+
+    memset(&fault, 0, sizeof(fault));
+    fault.reason =3D reason;
+    fault.flags =3D cpu_to_le32(flags);
+    fault.endpoint =3D cpu_to_le32(endpoint);
+    fault.address =3D cpu_to_le64(address);
+
+    elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
+
+    if (!elem) {
+        error_report_once(
+            "no buffer available in event queue to report event");
+        return;
+    }
+
+    if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
+        virtio_error(vdev, "error buffer of wrong size");
+        virtqueue_detach_element(vq, elem, 0);
+        g_free(elem);
+        return;
+    }
+
+    sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &fault, sizeof(fault));
+    assert(sz =3D=3D sizeof(fault));
+
+    trace_virtio_iommu_report_fault(reason, flags, endpoint, address);
+    virtqueue_push(vq, elem, sz);
+    virtio_notify(vdev, vq);
+    g_free(elem);
+
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr =
addr,
                                             IOMMUAccessFlags flag,
                                             int iommu_idx)
@@ -476,9 +518,10 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemor=
yRegion *mr, hwaddr addr,
     VirtIOIOMMUInterval interval, *mapping_key;
     VirtIOIOMMUMapping *mapping_value;
     VirtIOIOMMU *s =3D sdev->viommu;
+    bool read_fault, write_fault;
     VirtIOIOMMUEndpoint *ep;
+    uint32_t sid, flags;
     bool bypass_allowed;
-    uint32_t sid;
     bool found;
=20
     interval.low =3D addr;
@@ -504,6 +547,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
     if (!ep) {
         if (!bypass_allowed) {
             error_report_once("%s sid=3D%d is not known!!", __func__, sid)=
;
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                      VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                      sid, addr);
         } else {
             entry.perm =3D flag;
         }
@@ -515,6 +561,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
             error_report_once("%s %02x:%02x.%01x not attached to any domai=
n",
                               __func__, PCI_BUS_NUM(sid),
                               PCI_SLOT(sid), PCI_FUNC(sid));
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                      VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                      sid, addr);
         } else {
             entry.perm =3D flag;
         }
@@ -527,15 +576,26 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
     if (!found) {
         error_report_once("%s no mapping for 0x%"PRIx64" for sid=3D%d",
                           __func__, addr, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                  sid, addr);
         goto unlock;
     }
=20
-    if (((flag & IOMMU_RO) &&
-            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
-        ((flag & IOMMU_WO) &&
-            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+    read_fault =3D (flag & IOMMU_RO) &&
+                    !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ);
+    write_fault =3D (flag & IOMMU_WO) &&
+                    !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE);
+
+    flags =3D read_fault ? VIRTIO_IOMMU_FAULT_F_READ : 0;
+    flags |=3D write_fault ? VIRTIO_IOMMU_FAULT_F_WRITE : 0;
+    if (flags) {
         error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=
=3D%d",
                           __func__, addr, flag, mapping_value->flags);
+        flags |=3D VIRTIO_IOMMU_FAULT_F_ADDRESS;
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  flags | VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                  sid, addr);
         goto unlock;
     }
     entry.translated_addr =3D addr - mapping_key->low + mapping_value->phy=
s_addr;
--=20
2.20.1

