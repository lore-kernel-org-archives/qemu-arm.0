Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2228882lff;
        Thu, 9 Jan 2020 06:54:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTWkvyCZS5x9N/Sbi5UJCRIUIzKuogi+JlBsdEmQx9BVfK3KaMHrOg9GDEI6wFOY+ILVmg
X-Received: by 2002:a17:906:3796:: with SMTP id n22mr10716726ejc.222.1578581683877;
        Thu, 09 Jan 2020 06:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578581683; cv=none;
        d=google.com; s=arc-20160816;
        b=UittwPcFIxMEVhWVnlHU/jfUvaAQHWkgwpoR0kPI/9U5pwgepGSNcy7RxCG3iP3N4R
         Fei9gn/6yA+MkPRo5CLG9OD4UrAxYRue09z24kHwo+IuJLXxolS2BNJEP+js7b/0reka
         3Idmb9g6ROX9LGD7/2sXpTKm3/EnVO+d+vSxnsuRSX1PaAay5IBrHvdwVhJHDSIjegEM
         0lfQVfG4Wf8Yl5Jp7TaQ4kcw/DTsZv1cob/1UnYBOetlzi1VHI32w+JfwM2G7j0jIdfP
         qecUlXouzKIv5x2EPeTcLL5j92zvgg6KijaCo6864IeiENe6RWAP022+plJc234fpc6S
         yu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BwsKgup0PF9AdJUkXvO1e3EUDfI/8GZGVoq6i5tiHOc=;
        b=JQLcdbweOLqiYeZQTd7SMPJVHkXiwsN0V6NJbP8X/qBWxtaW82yRWLnAxcwSqkItwe
         1/h0sLLRt5kmJjm6Q9y6177562xQn9yCpsfLJUt1VtAh/jliNpuqVgXz6B1nkhStaCAB
         sT+orXaUqnMba75dlL9NeQmk7EdxbZ06ZMTUBFN1ORAZaxNSMXDwlp577LaK5OqY2N7w
         BzmbKFCTozP9+5xdCSeDFhhyomc7oFEC+D4si8Q9kUO46ug+Rca7RINsMSi1wpV4l5J8
         3mnfSK8xIlndtSh0fvDsAs7qgn6cb1/lcEw0zu5R6x+Pa+FxI2iUKzqINr3ns1DORBBZ
         W1Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zo3XCs1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si4285592edm.365.2020.01.09.06.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zo3XCs1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipZCs-0005Pi-B5
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 09:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ3v-0000XF-63
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ3t-0004Sz-Lb
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:45:26 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34058
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipZ3t-0004QU-EE
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578581125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwsKgup0PF9AdJUkXvO1e3EUDfI/8GZGVoq6i5tiHOc=;
 b=Zo3XCs1pzSDZvAJH+iw7RjyGKCXAnQ414eQZUbamJborsxjVBGiY/l/lPlU3Nw7SGEOX/4
 zwAS9J/98NlHcEgc0/GqpbN2KTXkq7NFh1xLdZYJS5MHvWT5rokZBUzhpbklghngufdj05
 vhyaRQWNHDFJBjHr38sCcMLUqIJ9fjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-_taMJoTZNseMFAM59GmIOA-1; Thu, 09 Jan 2020 09:45:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0CC18CA240;
 Thu,  9 Jan 2020 14:45:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BBA760C88;
 Thu,  9 Jan 2020 14:45:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v12 12/13] virtio-iommu: Support migration
Date: Thu,  9 Jan 2020 15:43:18 +0100
Message-Id: <20200109144319.15912-13-eric.auger@redhat.com>
In-Reply-To: <20200109144319.15912-1-eric.auger@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _taMJoTZNseMFAM59GmIOA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-TUID: oZHuwfLjOMBM

Add Migration support. We rely on recently added gtree and qlist
migration. We only migrate the domain gtree. The endpoint gtree
is re-constructed in a post-load operation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- do not migrate the endpoint gtree but reconstruct it from the
  domain gtree (Peter's suggestion)
- add MIG_PRI_IOMMU
---
 hw/virtio/virtio-iommu.c | 109 +++++++++++++++++++++++++++++++++++----
 1 file changed, 99 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 09193970ee..b0fde3af6f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -655,16 +655,6 @@ static uint64_t virtio_iommu_get_features(VirtIODevice=
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
@@ -748,9 +738,108 @@ static void virtio_iommu_instance_init(Object *obj)
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

