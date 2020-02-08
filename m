Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1688197lfp;
        Sat, 8 Feb 2020 04:01:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9s0r9tYDPHZH5xsODtvPYPIl4Fc+ZkRrj2ZbOKgHhFBJIp1zQNJ7L96qeensmou3NbMFg
X-Received: by 2002:ac8:1385:: with SMTP id h5mr2503225qtj.59.1581163314729;
        Sat, 08 Feb 2020 04:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581163314; cv=none;
        d=google.com; s=arc-20160816;
        b=G2QBZH4SzihUjYevPKVEPU9JJeUEvIs4bkQCMV+M1eRhx6fZsj+QJGU92RLShzwksl
         Rq6z784L9SwKIad+eXnsvoS5EiGPFxl1BX4UGWsGTgtgarE0sbMPKQg8ovlvkkjIU6WX
         u0hikwNBb4aZQhIdZlHzc/5WJlyl0IpDSRrJtkLzKEEqa7vGyIATwuCWCJnBfKcomNAx
         zTrwvfQJh2vFbuUTHIwyrIcE690SpXX5ObWSZg/WlGc6m4tg05KNsmKLU3fWO/CRh9am
         evPwYTcPWXAPokYnQppKhHNlEXFnigGWo2+YFXMt0Xi3wnfj8P+KbftomrwfTEJZYMy+
         uGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V4GWrAeCymKwV5tUAOGP8P5jt2Z+z4ccE/75bR7D7Cc=;
        b=u/jpJPbIut/eFxBkGijzhWi+61sF9Na/lfoDsfKSGmd7qtJAZQAhUxLL1n7arLcDGi
         LVBlHeo2Np9hY9rok4e1vj1YGMgohotnC6o9qyoyA+ZHtF5I5mC8c+zz28PyZg+rix7P
         WtD15otkPY924ckb8RqpqNJlQ1YXURxJbyC56j/Rfhg6nJCMlXqYzQq3QBc0llVdFzvX
         74NSWTaEiJfsUQ7OPXIakT93CKr3JU5cDO5Yl5LavUro7A4UAEqb72KeKrQAokJIe5Ww
         9Z5RRVn1f6BSQpnz1VXELZNvRcqHIDM9NA4X7l4ZoYO5iMKCG+C7fcjsyUi/ovqpxjp/
         8q2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDKt2Q1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a41si1415197qtk.150.2020.02.08.04.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 04:01:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDKt2Q1u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0Oo6-0006Ky-2H
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 07:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j0One-0006Hw-3X
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:01:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j0Onc-0000Pw-TI
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:01:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j0Onc-0000Pm-Q7
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581163284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4GWrAeCymKwV5tUAOGP8P5jt2Z+z4ccE/75bR7D7Cc=;
 b=dDKt2Q1u88kKyvxofDy/q+9zlHN24Jyd7osX87ZZjNuGez3q23vtjxSTXQGC/6zsT+fXw6
 WqIlGS93u9mT+FkT7rD6qBFux9KguojCsn7zbMvb1h4m21XXsd7ubBSrFc7wtuRSS4KRTb
 SvxUwl7mLctW50rpCW2rRrWixgrwKAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-bKx58OjiMqCOxGf9BV8CTg-1; Sat, 08 Feb 2020 07:01:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EAA3DBA7;
 Sat,  8 Feb 2020 12:01:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9C05C545;
 Sat,  8 Feb 2020 12:01:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v15 5/9] virtio-iommu: Implement translate
Date: Sat,  8 Feb 2020 13:00:18 +0100
Message-Id: <20200208120022.1920-6-eric.auger@redhat.com>
In-Reply-To: <20200208120022.1920-1-eric.auger@redhat.com>
References: <20200208120022.1920-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: bKx58OjiMqCOxGf9BV8CTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MbwBTFNRp9S2

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
index 844d34c270..59e9cd3d9a 100644
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

