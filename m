Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1916470lfp;
        Fri, 14 Feb 2020 05:34:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyt0pT5yKGHv+1HQpPLvqlW1lTnx7xlKdZ5wUaxi7uBwZIFdETVb+nogiPY811N6Sz0+ctR
X-Received: by 2002:a0c:fa43:: with SMTP id k3mr2075193qvo.229.1581687239986;
        Fri, 14 Feb 2020 05:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581687239; cv=none;
        d=google.com; s=arc-20160816;
        b=xijFIs1Fkl/wknuIu26z8nMzBeUHK/I5HlLwVOSB+B8ZGii1ey9UkfEtv31FeEETR8
         Ssz7Xz33jfT7cxkPs1BW7PAigEaWuS5lhYG8DBol1hrg0NAdOeNubv6x119EW7W9VrqH
         rCgAYaWFxE4zxOv2Z6XpQacS9tKppPgDTO5A5ui8nJXxLZS6biJX6YZrJqrgYQBQz6hx
         vgV2f/ri8DiIG8GhIz/XCp2rmOrPsrQpW5sNSGWw+/xjwXG9z3gxFElvmqFlQ72AFYGl
         JGORihkn9RkWCMhqNkcBIb025L8IaRZkisXwFWrjcKjy8rCk3XkegYOt5uMxkxEQureL
         2KSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fKb/k/H6t86c+BChvVQp4PRkxyDaZan+CeZGDVdZXdc=;
        b=LaN/HH2lcTv1VphUln9SgqO8HcHmcoiy/zZ8+gjnZ+pbrbVlB3FcNpvnHk1iJq9Jbh
         UCRIyJS61FQ21vky51bfg0vkdYN0FgRRzEagnnGM4WmxioLmzG5bCQO9W40Ee+Q31oKt
         SHPjLCYOxvibGcQQM2nEo1Cpw1wGDNPFVV9+ybkIeGabn/8XZ5XuRtHJc8ZuzYftOd5p
         N/eOPM53PaLX5RBTfbskqP9p7L/OJHsFsJmS6gG/62ONzDinkNqEKUP/NRbF/opaESez
         NPR6W+DnZh9LGc+pxz4TAtbRPdL+lelOd7QHSKGFKKmyKBn9BIiHNF+ozuJPR6z8JvId
         CWFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bzJiI/Gh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y82si3113816qkb.103.2020.02.14.05.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bzJiI/Gh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b6V-00012S-9f
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b21-0002Ts-7Z
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b1z-0001gF-Vy
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20724
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b1z-0001cS-RT
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKb/k/H6t86c+BChvVQp4PRkxyDaZan+CeZGDVdZXdc=;
 b=bzJiI/GhtFd2uKCyQEKycsMRfvFsFdq6aWaaX3SyCgwvoRDV0zLg1KcYraUUMXVQqgX0Mn
 bYLThSfj+dOvoZm/OlG4lTCFDOdvszOB5eDrXrLYMgI1ibNC84dx/anwXIAKw/0NkeTLZA
 vwyv/car9zF0eVRHdr8u7SJcDIQc+dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-Rf3VF2uKMaKTomoKTmcCTg-1; Fri, 14 Feb 2020 08:29:18 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE3A13E2;
 Fri, 14 Feb 2020 13:29:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422795DA7D;
 Fri, 14 Feb 2020 13:29:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 07/10] virtio-iommu: Support migration
Date: Fri, 14 Feb 2020 14:27:42 +0100
Message-Id: <20200214132745.23392-8-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Rf3VF2uKMaKTomoKTmcCTg-1
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
X-TUID: uF3Hy8e7JA2u

Add Migration support. We rely on recently added gtree and qlist
migration. We only migrate the domain gtree. The endpoint gtree
is re-constructed in a post-load operation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---

v15 -> v16:
- added Juan's R-b

v11 -> v12:
- do not migrate the endpoint gtree but reconstruct it from the
  domain gtree (Peter's suggestion)
- add MIG_PRI_IOMMU
---
 hw/virtio/virtio-iommu.c | 109 +++++++++++++++++++++++++++++++++++----
 1 file changed, 99 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8509f64004..4cee8083bc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -643,16 +643,6 @@ static uint64_t virtio_iommu_get_features(VirtIODevice=
 *vdev, uint64_t f,
     return f;
 }
=20
-/*
- * Migration is not yet supported: most of the state consists
- * of balanced binary trees which are not yet ready for getting
- * migrated
- */
-static const VMStateDescription vmstate_virtio_iommu_device =3D {
-    .name =3D "virtio-iommu-device",
-    .unmigratable =3D 1,
-};
-
 static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
 {
     guint ua =3D GPOINTER_TO_UINT(a);
@@ -736,9 +726,108 @@ static void virtio_iommu_instance_init(Object *obj)
 {
 }
=20
+#define VMSTATE_INTERVAL                               \
+{                                                      \
+    .name =3D "interval",                                \
+    .version_id =3D 1,                                   \
+    .minimum_version_id =3D 1,                           \
+    .fields =3D (VMStateField[]) {                       \
+        VMSTATE_UINT64(low, VirtIOIOMMUInterval),      \
+        VMSTATE_UINT64(high, VirtIOIOMMUInterval),     \
+        VMSTATE_END_OF_LIST()                          \
+    }                                                  \
+}
+
+#define VMSTATE_MAPPING                               \
+{                                                     \
+    .name =3D "mapping",                                \
+    .version_id =3D 1,                                  \
+    .minimum_version_id =3D 1,                          \
+    .fields =3D (VMStateField[]) {                      \
+        VMSTATE_UINT64(phys_addr, VirtIOIOMMUMapping),\
+        VMSTATE_UINT32(flags, VirtIOIOMMUMapping),    \
+        VMSTATE_END_OF_LIST()                         \
+    },                                                \
+}
+
+static const VMStateDescription vmstate_interval_mapping[2] =3D {
+    VMSTATE_MAPPING,   /* value */
+    VMSTATE_INTERVAL   /* key   */
+};
+
+static int domain_preload(void *opaque)
+{
+    VirtIOIOMMUDomain *domain =3D opaque;
+
+    domain->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                       NULL, g_free, g_free);
+    return 0;
+}
+
+static const VMStateDescription vmstate_endpoint =3D {
+    .name =3D "endpoint",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(id, VirtIOIOMMUEndpoint),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_domain =3D {
+    .name =3D "domain",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .pre_load =3D domain_preload,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(id, VirtIOIOMMUDomain),
+        VMSTATE_GTREE_V(mappings, VirtIOIOMMUDomain, 1,
+                        vmstate_interval_mapping,
+                        VirtIOIOMMUInterval, VirtIOIOMMUMapping),
+        VMSTATE_QLIST_V(endpoint_list, VirtIOIOMMUDomain, 1,
+                        vmstate_endpoint, VirtIOIOMMUEndpoint, next),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static gboolean reconstruct_endpoints(gpointer key, gpointer value,
+                                      gpointer data)
+{
+    VirtIOIOMMU *s =3D (VirtIOIOMMU *)data;
+    VirtIOIOMMUDomain *d =3D (VirtIOIOMMUDomain *)value;
+    VirtIOIOMMUEndpoint *iter;
+
+    QLIST_FOREACH(iter, &d->endpoint_list, next) {
+        iter->domain =3D d;
+        g_tree_insert(s->endpoints, GUINT_TO_POINTER(iter->id), iter);
+    }
+    return false; /* continue the domain traversal */
+}
+
+static int iommu_post_load(void *opaque, int version_id)
+{
+    VirtIOIOMMU *s =3D opaque;
+
+    g_tree_foreach(s->domains, reconstruct_endpoints, s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_virtio_iommu_device =3D {
+    .name =3D "virtio-iommu-device",
+    .minimum_version_id =3D 1,
+    .version_id =3D 1,
+    .post_load =3D iommu_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 1,
+                                   &vmstate_domain, VirtIOIOMMUDomain),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_virtio_iommu =3D {
     .name =3D "virtio-iommu",
     .minimum_version_id =3D 1,
+    .priority =3D MIG_PRI_IOMMU,
     .version_id =3D 1,
     .fields =3D (VMStateField[]) {
         VMSTATE_VIRTIO_DEVICE,
--=20
2.20.1

