Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp727547lfc;
        Fri, 22 Nov 2019 10:38:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7T0Ow7cpIbjg0G1nCs+H3v1HLihEed2epZnTy79RTTCDuOrLVSh7FQLY3KNNIsbafT5xE
X-Received: by 2002:a17:906:ccc6:: with SMTP id ot6mr23824918ejb.137.1574447888933;
        Fri, 22 Nov 2019 10:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574447888; cv=none;
        d=google.com; s=arc-20160816;
        b=sFihhbEp+nLAhoESVn4UbL6uoaXw5G8IrNqYB9UKOz5wJQCT+6AkxtuzjJy58CWn7W
         AyL68WN4fJXHQEeOldzBFrp3F+9dOSgBQcHRCCLj9PK1GlcAYTJrbjPvzLEooTqV/SZ1
         fGYgKl7LCd7KMsCV1F8PMtmyVjAzydcLZRP/vd/ZtY256J9jUNtdvAV5g+aJvUrQL1+i
         1GUiMswomnR5orIl/ZMe+EkE+z7PG7uw3Swuz4px8RXKRV0mvqZh5GUq26I3kiUeWHSm
         O5JU4MuDoslOpdHvlkn1ll09VXH5imh3tWxd09CItWkrxKsTtzWP/i13LDPE2u+VB7IR
         rqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vfMeaOXX+t023+1hBgHOnvRfnhFC18bmrnLW83129pU=;
        b=DjEn0fU2QY41te70A8xX0fE7NDt6D/Ab0iKAa0YxfOhjmuqIhHXCHkrNX81LWBdPtT
         rbIjHn6ZE+mQSNbYcMiWxiF2bRpEjYJWLPsJzKx84Nmb03UeDf55XvLjgyMMRaeJ1cL8
         OViCPcaJu+h8v5crzx93ujKKakXKOtXdZtbvMingEtO4lmXqSOY97L1uAvfZ2iB1tY4j
         4wFIbW1ctr5hPkfUwVY2I2JbO8gslY4wQ03AW3TPz+hfZsC7TRn/M99TRfpK8jpqCbwH
         8OMw3FCjKHRmoPpBbWw0tHdIuYi6pC9Bjg9gLK85N7Lcg6pIzrNdasLelqc7KlAcovnt
         BdLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gGPmrIkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si5973002edc.426.2019.11.22.10.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gGPmrIkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYDol-0007z2-FQ
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDi0-0000Ag-So
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDhz-0000G9-Gv
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30819
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDhz-0000Ft-Bl
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfMeaOXX+t023+1hBgHOnvRfnhFC18bmrnLW83129pU=;
 b=gGPmrIkfzcPW17qzXpGpuLfEJjCC+pCR8cPTeu7LUvRrJ9v7O2DdCzcukdhfoic5asj3K9
 mtGcoVqVmP0G1f+sdOq4E/uiQ8/qVDwJnyC6bH+NDtlOaiCXJEKsynuHIE8BgDQeBWGVP+
 060Btvx1uBevj3E3C83qXqjlRXAzpFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-XL5rKNVFOauGOs0KvYm3Ig-1; Fri, 22 Nov 2019 13:31:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43D6800054;
 Fri, 22 Nov 2019 18:31:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D92D6E712;
 Fri, 22 Nov 2019 18:30:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Date: Fri, 22 Nov 2019 19:29:31 +0100
Message-Id: <20191122182943.4656-9-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XL5rKNVFOauGOs0KvYm3Ig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: kevin.tian@intel.com, peterx@redhat.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNZHrLkEbEY2

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

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
 hw/virtio/virtio-iommu.c | 63 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f25359cee2..de7cbb3c8f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -72,3 +72,4 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=
=3D%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f0a56833a2..a83666557b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -412,19 +412,80 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    viommu_interval interval, *mapping_key;
+    viommu_mapping *mapping_value;
+    VirtIOIOMMU *s =3D sdev->viommu;
+    viommu_endpoint *ep;
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s %02x:%02x.%01x not attached to any domain\n"=
,
+                          __func__, PCI_BUS_NUM(sid),
+                          PCI_SLOT(sid), PCI_FUNC(sid));
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
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s no mapping for 0x%"PRIx64" for sid=3D%d\n",
+                      __func__, addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Permission error on 0x%"PRIx64"(%d): allowed=3D%d\n=
",
+                      addr, flag, mapping_value->flags);
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

