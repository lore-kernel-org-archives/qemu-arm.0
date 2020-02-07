Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp361677lfp;
        Fri, 7 Feb 2020 01:35:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8hXomfPZ+FFAxo/CGXKvW5L+VBSWYxtRhS4kwu1+HvalmanrUm70jgPGYnARGx50ewb+S
X-Received: by 2002:ae9:c106:: with SMTP id z6mr6356831qki.6.1581068110773;
        Fri, 07 Feb 2020 01:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581068110; cv=none;
        d=google.com; s=arc-20160816;
        b=aJKv2S9RTVreh7cIYywji9Ao41CjG3i1nS6tdvwAoKHN8DMAC8aLSpYhEzrjCPIsHm
         yilssVs9+PfnNPj8t2/eOUwfz0d/8svGQl1Gb+vGKfYhymB/ISQrIRyeD5KDhXGbYhl+
         AwR3o4ou0UIpHLexzteO9BjB2FVImlVmlJER/htSIDC0usK5FEhdiTWnhPpjMDwkj4hd
         tSJ5y2NdFB3pD9OJJmcVKaM4E6FrMRtUzvliOAwXcpLEEL5AJfA8QKSB+UEMWZn5Fr7w
         F0KRKdTfy9ASdg6cfydFmcqG4E6uvvWWOxOrnt4Ra0lj0G0F2Fzi92aut/SXdG/QM6Sy
         hrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OGefz2EA1HV37NHec9vsdI9g9mOvinUEycSbUngGOYc=;
        b=TwLPOQH5jZF3Lqdo6oe+BQUV8izxorFuVxyBFMtVG0Y8fNWN0Q3l0zonTieBb2c+Co
         nua8k5vx83xK4oBS8GBlS79hGGge6bWm9a1EuPmSQ+TytQ/kPhpiIuOh86b9Y2iY6d33
         eI+3WrjtpcNKQKJCkrpFFO3e2MZ0xPNQNKEbPVsa2rVOPZiKpYeejX5MfaWiHfLWuU7g
         8Isivk/NaLDq1YVfPuMEEeO+UFwp3c1ssCtPOurB6MReTwHfr/43zxHqEPF0DpHOxEYW
         uVhXqHBT+M5GKX86hnBWp0OFl7lPJ8RgM85Hdej0j0WVg1O2xl6b7V43l5HIXUsLY9in
         PpBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HvqGnXsa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si160679qtn.246.2020.02.07.01.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 01:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HvqGnXsa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j002Y-0001Dd-53
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 04:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j001N-0000Fu-6f
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j001L-00052G-SU
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38736
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j001L-000528-OA
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 04:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581068035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGefz2EA1HV37NHec9vsdI9g9mOvinUEycSbUngGOYc=;
 b=HvqGnXsaySwTjss4NLeycMOYDPkoOcOn54CS4hNv/APn9k740aQujprIXbKWgbhVFiDl+J
 MUfZPvTqPYCdwbJBOKs7do2Ww77QA/fLlavlnrIb24dUCsumDv6MM6rI+BbG2KynaKKOhL
 +Way81sVoAYXAQWp9FPtv+Pgj3C0kQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-QELBDTiUMZaY7ZbRN7N9sg-1; Fri, 07 Feb 2020 04:33:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 252B418A6EC0;
 Fri,  7 Feb 2020 09:33:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9414D790CF;
 Fri,  7 Feb 2020 09:33:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v14 10/11] virtio-iommu: Support migration
Date: Fri,  7 Feb 2020 10:32:02 +0100
Message-Id: <20200207093203.3788-11-eric.auger@redhat.com>
In-Reply-To: <20200207093203.3788-1-eric.auger@redhat.com>
References: <20200207093203.3788-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QELBDTiUMZaY7ZbRN7N9sg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: +XmHuY18yHCo

Add Migration support. We rely on recently added gtree and qlist
migration. We only migrate the domain gtree. The endpoint gtree
is re-constructed in a post-load operation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>

---

v11 -> v12:
- do not migrate the endpoint gtree but reconstruct it from the
  domain gtree (Peter's suggestion)
- add MIG_PRI_IOMMU
---
 hw/virtio/virtio-iommu.c | 109 +++++++++++++++++++++++++++++++++++----
 1 file changed, 99 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 997a36e22e..88717c6305 100644
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

