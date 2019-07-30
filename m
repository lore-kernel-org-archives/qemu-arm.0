Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4627788wrv;
        Tue, 30 Jul 2019 10:25:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaZLiiyriJ1O122lj0+ol3IWd0h1FfaC16h0LB/HfN7mebf1g66puUUFY7kb0FQegWh2qe
X-Received: by 2002:a67:e454:: with SMTP id n20mr75959194vsm.34.1564507551141;
        Tue, 30 Jul 2019 10:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564507551; cv=none;
        d=google.com; s=arc-20160816;
        b=sIvaoK4OWQlVy1s3o7TI/MgQTZai5QbdYXdNm/SVNkBw3tR2734xYiOm20CE0FMqAT
         9UYKfuF0TkkLCQQ9q+xH+EQrIWM4QPKAsOWM1j1WJexdlVp3MGHgwIPB3MpheOdzRJkY
         2ZxbuHCArs3u5nEi7HdSselDcMHR3Z9QEEOpe3giPdcOry6u9+T8tNO2dzCEK/gqWZrr
         KtDmzzcHdyHBdZAG5TSICYtOngVfF7OPMKzx2YmRLHn9v0p+KrBP0Ix9jaB5t5CAUUBm
         8ipBDPERGP4nf53UFoI3MZbXHpBZx/oDD9ENcYU5xW+HynUeAKqCbdKCLSCGcCZY1laS
         gL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XwLk/WBW6skkNC7Q2rebxSC7k62oxJlVRzTUcX8JS5U=;
        b=T9jPJSx7igHZh2w8SUTTnzyo7y2AEPG7wK38Qb0GQqZozjEJT4zMU+B6gOpf02UMhs
         1w2Rs4q2WtH0GOLW6PL/gYTHUoe9hWnHopuy5h37gJJjJBJERgOagddx7CwE11pn4rmo
         bU+dnaRhoiAqDAJKdXqVJEPspS/L6BFMow4rnl+xEa6LIGzkRbEc+YcLlumD3PNek+ag
         xd2iq5QmZ3m2c8Uf4nfiTSJx/OTZ/xe/JKj5pXpjM9uOB02xqOd6pJMLSN61fe804B6/
         7/bIQKSG5D+B9O7uhj4YYHg1YjzvywLsQt+AC7igwegs8HDu+rWe5em+nrxmhlGreh20
         OTwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si14507489uan.199.2019.07.30.10.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsVsk-0007FD-MI
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 13:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqF-0001ZS-5N
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqD-0001BE-3M
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:23:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56264)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVqC-0001Aw-SM; Tue, 30 Jul 2019 13:23:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C0B230862BE;
 Tue, 30 Jul 2019 17:23:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2254960BE5;
 Tue, 30 Jul 2019 17:23:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:31 +0200
Message-Id: <20190730172137.23114-10-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 17:23:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.2 v10 09/15] virtio-iommu: Implement
 translate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xTW75vNNCbRA

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
 hw/virtio/virtio-iommu.c | 58 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 25a71b0505..8257065159 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -74,3 +74,4 @@ virtio_iommu_put_domain(uint32_t domain_id) "Free domai=
n=3D%d"
 virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t n=
ext_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new i=
nterval=3D[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t =
next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new=
 interval=3D[0x%"PRIx64",0x%"PRIx64"]"
 virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc =
[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint3=
2_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4706b9da6e..a8de583f9a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -464,19 +464,75 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMe=
moryRegion *mr, hwaddr addr,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s =3D sdev->viommu;
     uint32_t sid;
+    viommu_endpoint *ep;
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    bool bypass_allowed;
+
+    interval.low =3D addr;
+    interval.high =3D addr + 1;
=20
     IOMMUTLBEntry entry =3D {
         .target_as =3D &address_space_memory,
         .iova =3D addr,
         .translated_addr =3D addr,
-        .addr_mask =3D ~(hwaddr)0,
+        .addr_mask =3D (1 << ctz32(s->config.page_size_mask)) - 1,
         .perm =3D IOMMU_NONE,
     };
=20
+    bypass_allowed =3D virtio_has_feature(s->acked_features,
+                                        VIRTIO_IOMMU_F_BYPASS);
+
     sid =3D virtio_iommu_get_sid(sdev);
=20
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep) {
+        if (!bypass_allowed) {
+            error_report("%s sid=3D%d is not known!!", __func__, sid);
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    if (!ep->domain) {
+        if (!bypass_allowed) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s %02x:%02x.%01x not attached to any domain\=
n",
+                          __func__, PCI_BUS_NUM(sid),
+                          PCI_SLOT(sid), PCI_FUNC(sid));
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    mapping =3D g_tree_lookup(ep->domain->mappings, (gpointer)(&interval=
));
+    if (!mapping) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s no mapping for 0x%"PRIx64" for sid=3D%d\n",
+                      __func__, addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ=
)) ||
+        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRIT=
E))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Permission error on 0x%"PRIx64"(%d): allowed=3D%d=
\n",
+                      addr, flag, mapping->flags);
+        goto unlock;
+    }
+    entry.translated_addr =3D addr - mapping->virt_addr + mapping->phys_=
addr;
+    entry.perm =3D flag;
+    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
=20
--=20
2.20.1

