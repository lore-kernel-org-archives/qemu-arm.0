Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp361669lfp;
        Fri, 7 Feb 2020 01:35:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpfVWe8I0SNqaaKLico64qCYAFTnSbro443xos9l0YecpUdrl3/iA0PnGlQFwdXih6LepW
X-Received: by 2002:a0c:ea92:: with SMTP id d18mr6026326qvp.201.1581068110327;
        Fri, 07 Feb 2020 01:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581068110; cv=none;
        d=google.com; s=arc-20160816;
        b=PIV7DFLDJALtD5hg2W4MOEhyGZVmHhFdleM09cLhGt7DUUJcHBI5P0cHb+0WLRMJJ0
         2sXni9uaJ5kM4ibckF0gIpkDZitzEnreL6Y/O1+QR7BA9SQNqgKDj8Y3YZdFz7QPlTq6
         G63Yb0WeSKHMgqVI1xvY9Gj5KjZ6kX1JHx89hAnpnbKC5aQaePjMILCDnnh24nJ8GDvz
         vS5bFFxr3nFx3o2AMA2cWQxpF3WdKgYimBwO2Eew3rg45PkYzhaQur6BxUH1+JUydNi/
         J6rIwpeEnBAizWX2um4KrriPIzjgAat5BpdRBSp4R/tXTJtaI11jvDihM0iw5x7I5BpN
         J4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+HXN17UwRDtgUZM4WOBXcwx3yRfG18MHYzPJDbDoe5s=;
        b=pFfinORiHIPHNvS8QFYsdBA18MDKymmKQnSBAmdOOH6+Ln+jsGeIJCsTls2F3Ctoyg
         XaujPeJNL/xWrZEYZeH8yiLi3oawohqbUy01xxEuxr1FZy2n5tvjkNT/V6E7FdsPauWg
         PHj5AXvjkEWU62tc9W6fmKqRfeVAomDwXNpMGBZzAUUEc7z3G+YuXj+zTnK/OUlcvk7+
         +wJHZbERLRCecgXNY7YaD6ssW9Kx1GxzG+zuvTPWyJITomQVKIvJayBazvpn8ccDtuIi
         G0roIYfKUtZLTNbCw5bzV5zok3cRexi420mE0EWTpRevoFhDyYjqi3CD3QKoJOMTnhZa
         GuIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IqunGTPS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145si1048893qkf.352.2020.02.07.01.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 01:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IqunGTPS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j002X-0001DF-Lp
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 04:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j000g-0007Sr-HW
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j000e-0004vc-KR
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40212
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j000c-0004uj-R1
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581067990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HXN17UwRDtgUZM4WOBXcwx3yRfG18MHYzPJDbDoe5s=;
 b=IqunGTPStbDRdtp84vrWp7pw7wLsCmF+LiAxYtRsHHoH3VOHbIFX74VAy+JAQdntRJxH9y
 yYb3rAx33CkTIqDbkgAZNBqIwVkwx9f/YmE4c5Bdkf718aJEOc4+NsFthj4Iph6OFMrIcv
 RPaRAAfe9okj+LCrheG1eOYFEHPrkEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-vuYMSyKaNaSM0nZ3QQazcA-1; Fri, 07 Feb 2020 04:33:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8361414;
 Fri,  7 Feb 2020 09:33:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFFD2790CF;
 Fri,  7 Feb 2020 09:33:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v14 05/11] virtio-iommu: Implement translate
Date: Fri,  7 Feb 2020 10:31:57 +0100
Message-Id: <20200207093203.3788-6-eric.auger@redhat.com>
In-Reply-To: <20200207093203.3788-1-eric.auger@redhat.com>
References: <20200207093203.3788-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: vuYMSyKaNaSM0nZ3QQazcA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-TUID: qyDwbGBopbxD

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v11 -> v12:
- Added Jean's R-b
- s/qemu_log_mask/error_report_once

v10 -> v11:
- take into account the new value struct and use
  g_tree_lookup_extended
- switched to error_report_once

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
 hw/virtio/virtio-iommu.c | 60 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 22162d6583..095aa8b509 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -71,3 +71,4 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=
=3D%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index a2986c8fe8..cb59f17d25 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -473,19 +473,77 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMUInterval interval, *mapping_key;
+    VirtIOIOMMUMapping *mapping_value;
+    VirtIOIOMMU *s =3D sdev->viommu;
+    VirtIOIOMMUEndpoint *ep;
+    bool bypass_allowed;
     uint32_t sid;
+    bool found;
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
+    bypass_allowed =3D virtio_vdev_has_feature(&s->parent_obj,
+                                             VIRTIO_IOMMU_F_BYPASS);
+
     sid =3D virtio_iommu_get_bdf(sdev);
=20
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep) {
+        if (!bypass_allowed) {
+            error_report_once("%s sid=3D%d is not known!!", __func__, sid)=
;
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    if (!ep->domain) {
+        if (!bypass_allowed) {
+            error_report_once("%s %02x:%02x.%01x not attached to any domai=
n",
+                              __func__, PCI_BUS_NUM(sid),
+                              PCI_SLOT(sid), PCI_FUNC(sid));
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    found =3D g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&int=
erval),
+                                   (void **)&mapping_key,
+                                   (void **)&mapping_value);
+    if (!found) {
+        error_report_once("%s no mapping for 0x%"PRIx64" for sid=3D%d",
+                          __func__, addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=
=3D%d",
+                          __func__, addr, flag, mapping_value->flags);
+        goto unlock;
+    }
+    entry.translated_addr =3D addr - mapping_key->low + mapping_value->phy=
s_addr;
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

