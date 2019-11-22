Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp728789lfc;
        Fri, 22 Nov 2019 10:39:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRelQ9PngwTDvG5vVBVt8JwyReOWHheTTxwo978FtV5molPvgmdNY7li7lmXzkeyGHW9B5
X-Received: by 2002:a50:930c:: with SMTP id m12mr2880645eda.132.1574447955630;
        Fri, 22 Nov 2019 10:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574447955; cv=none;
        d=google.com; s=arc-20160816;
        b=YDKPzho5fzGuwuCBjbdOADIzmauGJ+4AFDD9549I33bckD9Nc5Wisi0x0ZmFoFDUiQ
         oNlJ4pHB+kmHLwbmJ2KDQm9S9e3ihn30EF7/8LOID5nvirzhiFVAbzB7ifMwLn5FbMcX
         Dy1R6ziKI35D6Dnztm8kYpml3oa5SaDnuI4SZKDz6FXgmW071dP+aYNDu/kYwU3qFO/c
         7bs8020ovdeT/LiTmUGoEcC52oO5EBBOxSbXpffofvXmM+Lc8hWrZFK+wX0jc6JPSp4B
         Qk9F2S2DlEYtWuM9kwnZwChp9znAYpfBuQoMh9YXOjfOEeJo5r6wshUrXMrG5I4jVs6R
         8JCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WpyPPjF7SQVxRQMHFwtWy7FSdjEZV1XI5I2O4de8PUE=;
        b=F/D3skBkwBZLi3JiC2u1vHYgLdAHYxIgdFCc/RnRiqxnBg5Act2S48XymMhe3/1vu3
         e4RLjIiZYG1A4BnRxYj1OWjDCIwT3bTxGfFMJxtwyDFuNYqr7oluTHgUW38fv8wsOJvm
         C+8zEbLTkYTTETi1miTlceAmTIwGoHoxV3U7w393lXCLZF8jTcDf2eMaBPfHxO5zNiyC
         /wLjXAg7z8pCaItinExRJf11ZlzrwCYjm9zkctnI4S5lPv9ElEikSb3/GAmyZrHoLrpg
         QtbGIzKx0kgm/eDgOMEBKEFBYT4ncg7hi2NTC/NauvuCxNBygQ2JLkXIFQO5P18wg+5e
         U1iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CjN2VUq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23si6368111eda.167.2019.11.22.10.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CjN2VUq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYDpp-0000R8-UR
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDhi-0008Ci-2s
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:30:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDhg-00009P-HJ
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:30:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60273
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDhg-00009G-DV
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpyPPjF7SQVxRQMHFwtWy7FSdjEZV1XI5I2O4de8PUE=;
 b=CjN2VUq3ooDp4NU269bAILb7SW1hjTLLnRVT1qPNyZoCW/PI5eCPjfrgAR/B1lCDBCtrv1
 sBQaa22OhhK8IDJFlG8mVNq0jmNxStfNK7izB6akjwZIPHJI85wcmEXpPjpKQqyEOQa4UO
 aA42fx6SB5Jm+NLJgnyUDxqqJfEVvN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-98oLz2D9POWh_i9Xz6gRTQ-1; Fri, 22 Nov 2019 13:30:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB45E109D0AC;
 Fri, 22 Nov 2019 18:30:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DACE46E712;
 Fri, 22 Nov 2019 18:30:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 05/20] virtio-iommu: Endpoint and domains structs
 and helpers
Date: Fri, 22 Nov 2019 19:29:28 +0100
Message-Id: <20191122182943.4656-6-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 98oLz2D9POWh_i9Xz6gRTQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kevin.tian@intel.com, peterx@redhat.com, tnowicki@marvell.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gadC0kwhxPy

This patch introduce domain and endpoint internal
datatypes. Both are stored in RB trees. The domain
owns a list of endpoints attached to it.

Helpers to get/put end points and domains are introduced.
get() helpers will become static in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v10 -> v11:
- fixed interval_cmp (<=3D -> < and >=3D -> >)
- removed unused viommu field from endpoint
- removed Bharat's R-b

v9 -> v10:
- added Bharat's R-b

v6 -> v7:
- on virtio_iommu_find_add_as the bus number computation may
  not be finalized yet so we cannot register the EPs at that time.
  Hence, let's remove the get_endpoint and also do not use the
  bus number for building the memory region name string (only
  used for debug though).

v4 -> v5:
- initialize as->endpoint_list

v3 -> v4:
- new separate patch
---
 hw/virtio/trace-events   |   4 ++
 hw/virtio/virtio-iommu.c | 117 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index b32169d56c..a373bdebb3 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -67,3 +67,7 @@ virtio_iommu_map(uint32_t domain_id, uint64_t virt_start,=
 uint64_t virt_end, uin
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_=
end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int =
flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
+virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=3D%d"
+virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
+virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
+virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2d7b1752b7..235bde2203 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -32,15 +32,116 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
=20
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
=20
+typedef struct viommu_domain {
+    uint32_t id;
+    GTree *mappings;
+    QLIST_HEAD(, viommu_endpoint) endpoint_list;
+} viommu_domain;
+
+typedef struct viommu_endpoint {
+    uint32_t id;
+    viommu_domain *domain;
+    QLIST_ENTRY(viommu_endpoint) next;
+} viommu_endpoint;
+
+typedef struct viommu_interval {
+    uint64_t low;
+    uint64_t high;
+} viommu_interval;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
 }
=20
+static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_d=
ata)
+{
+    viommu_interval *inta =3D (viommu_interval *)a;
+    viommu_interval *intb =3D (viommu_interval *)b;
+
+    if (inta->high < intb->low) {
+        return -1;
+    } else if (intb->high < inta->low) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
+{
+    QLIST_REMOVE(ep, next);
+    ep->domain =3D NULL;
+}
+
+viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)=
;
+viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
+{
+    viommu_endpoint *ep;
+
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
+    if (ep) {
+        return ep;
+    }
+    ep =3D g_malloc0(sizeof(*ep));
+    ep->id =3D ep_id;
+    trace_virtio_iommu_get_endpoint(ep_id);
+    g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
+    return ep;
+}
+
+static void virtio_iommu_put_endpoint(gpointer data)
+{
+    viommu_endpoint *ep =3D (viommu_endpoint *)data;
+
+    if (ep->domain) {
+        virtio_iommu_detach_endpoint_from_domain(ep);
+        g_tree_unref(ep->domain->mappings);
+    }
+
+    trace_virtio_iommu_put_endpoint(ep->id);
+    g_free(ep);
+}
+
+viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)=
;
+viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
+{
+    viommu_domain *domain;
+
+    domain =3D g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
+    if (domain) {
+        return domain;
+    }
+    domain =3D g_malloc0(sizeof(*domain));
+    domain->id =3D domain_id;
+    domain->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                   NULL, (GDestroyNotify)g_free,
+                                   (GDestroyNotify)g_free);
+    g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
+    QLIST_INIT(&domain->endpoint_list);
+    trace_virtio_iommu_get_domain(domain_id);
+    return domain;
+}
+
+static void virtio_iommu_put_domain(gpointer data)
+{
+    viommu_domain *domain =3D (viommu_domain *)data;
+    viommu_endpoint *iter, *tmp;
+
+    QLIST_FOREACH_SAFE(iter, &domain->endpoint_list, next, tmp) {
+        virtio_iommu_detach_endpoint_from_domain(iter);
+    }
+    g_tree_destroy(domain->mappings);
+    trace_virtio_iommu_put_domain(domain->id);
+    g_free(domain);
+}
+
 static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
                                               int devfn)
 {
@@ -293,6 +394,13 @@ static const VMStateDescription vmstate_virtio_iommu_d=
evice =3D {
     .unmigratable =3D 1,
 };
=20
+static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    uint ua =3D GPOINTER_TO_UINT(a);
+    uint ub =3D GPOINTER_TO_UINT(b);
+    return (ua > ub) - (ua < ub);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
@@ -328,11 +436,20 @@ static void virtio_iommu_device_realize(DeviceState *=
dev, Error **errp)
     } else {
         error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
     }
+
+    s->domains =3D g_tree_new_full((GCompareDataFunc)int_cmp,
+                                 NULL, NULL, virtio_iommu_put_domain);
+    s->endpoints =3D g_tree_new_full((GCompareDataFunc)int_cmp,
+                                   NULL, NULL, virtio_iommu_put_endpoint);
 }
=20
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
+    VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
+
+    g_tree_destroy(s->domains);
+    g_tree_destroy(s->endpoints);
=20
     virtio_cleanup(vdev);
 }
--=20
2.20.1

