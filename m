Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3869030lfb;
        Mon, 16 Nov 2020 09:00:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynm2HPLJAc4QvewVoBD76kk8SyI37ILSlD7PZf9V4NzKFsKjPo+HDqWywWjuSbyNJ+aY7p
X-Received: by 2002:a05:6902:4a5:: with SMTP id r5mr17801363ybs.443.1605546010017;
        Mon, 16 Nov 2020 09:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605546010; cv=none;
        d=google.com; s=arc-20160816;
        b=ajC3bjpo+n2B+EdwwXInvvGat16mmEiue9Yhzk50Bu2Vofi/WTTPmOEN8fetJ888Y3
         ZVW/iG2sfIcMwaoaNBzl4/67GceNf9CQ4BLSg88a/ZS9lR7Em+rzmcGOYrsDOZYIcZIo
         jmmUAV31jS7+xSrgRl5yAhAjOttY29YI4CWPyfCFyPeSBBVGDhirbM0bO+hg/MWTye1v
         oSxOW7FcoAWNRMoDGn8jchHA3jPV7FYgLSSwZqtECUMcdftmnEfcas3yNyoJQeY3O7SC
         H3mVcNk4SWRjBJEv6LfHmupVOhMe8X+gDbdnqlTI4bJG4xRtDT2upn4Z3TFL0qA6XpHA
         piaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f5TgfgW+yjicOEVJ2e20qXfjZl0+2hBEsPSZzG/LpbI=;
        b=QGaOiVpJFC5mw6NHiZrx04Wb/yuw+wjU/L987B4JCWk3iGsMBFQXi5smf4T4VLdj05
         hO0Mut2toy8cLwGn3eEjPEslcPdrX3t2MigtWR3KuqVkUHw5V8WjPNtuDwgoZG0dpU04
         ElO3Q1En7Ps/8DT33SiPce5GWeMttkwB5AaUzXLvHsFvBbP2h9PC/ogujig34H+z6X25
         QsfoI0bLNkw3v50tOTNIj2f7UreLivIjKdkDwZ3aj6S1/hJcriEytIpl5DqR0OHraTFn
         U/oi7nE6njDVBre8T5toRe3xpj3dHQAyncBeULZj/kNGBMeXCUhifsEOArvxrOtnPhHo
         7CCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GgAHGCIo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si17541811ybf.462.2020.11.16.09.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 09:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GgAHGCIo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehrM-00088j-Vo
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 12:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehof-0005Qf-IR
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehob-0007qq-6K
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605545836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5TgfgW+yjicOEVJ2e20qXfjZl0+2hBEsPSZzG/LpbI=;
 b=GgAHGCIozov9omlsvh9KRsoE/v66G5KXY8Ey70lNmaZM6xXTYU/HuN9w7lYn2zJjIFg/Ow
 sB5sMGw3aXiLNbqdXGVk18Hh0/vnl349ZY03Y8EGgBuNdS10CE4AlowtSAGtOO3Ucp98rj
 Ax1vmdZqyBgEAqCVLKEPylrSFRdLPM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-4k4QUhKFMZGXKYxzsdqqaQ-1; Mon, 16 Nov 2020 11:57:14 -0500
X-MC-Unique: 4k4QUhKFMZGXKYxzsdqqaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6BC1800D4A;
 Mon, 16 Nov 2020 16:57:11 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-134.ams2.redhat.com
 [10.36.115.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B06495D9CC;
 Mon, 16 Nov 2020 16:56:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
 IOMMUTLBNotificationType
Date: Mon, 16 Nov 2020 17:55:04 +0100
Message-Id: <20201116165506.31315-4-eperezma@redhat.com>
In-Reply-To: <20201116165506.31315-1-eperezma@redhat.com>
References: <20201116165506.31315-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Juan Quintela <quintela@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Thomas Huth <thuth@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6iSaH1q59Xkv

This allows us to differentiate between regular IOMMU map/unmap events
and DEVIOTLB unmap. Doing so, notifiers that only need device IOTLB
invalidations will not receive regular IOMMU unmappings.

Adapt intel and vhost to use it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/exec/memory.h | 7 ++++++-
 hw/i386/intel_iommu.c | 2 +-
 hw/virtio/vhost.c     | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e86b5e92da..521d9901d7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -97,9 +97,14 @@ typedef enum {
     IOMMU_NOTIFIER_UNMAP = 0x1,
     /* Notify entry changes (newly created entries) */
     IOMMU_NOTIFIER_MAP = 0x2,
+    /* Notify changes on device IOTLB entries */
+    IOMMU_NOTIFIER_DEVIOTLB_UNMAP = 0x04,
 } IOMMUNotifierFlag;
 
-#define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_IOTLB_EVENTS (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_DEVIOTLB_EVENTS IOMMU_NOTIFIER_DEVIOTLB_UNMAP
+#define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_IOTLB_EVENTS | \
+                            IOMMU_NOTIFIER_DEVIOTLB_EVENTS)
 
 struct IOMMUNotifier;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 56180b1c43..edc3090f91 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2468,7 +2468,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
         sz = VTD_PAGE_SIZE;
     }
 
-    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.type = IOMMU_NOTIFIER_DEVIOTLB_UNMAP;
     event.entry.target_as = &vtd_dev_as->as;
     event.entry.addr_mask = sz - 1;
     event.entry.iova = addr;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 614ccc2bcb..28c7d78172 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -718,7 +718,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
     iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_UNMAP,
+                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
                         section->offset_within_region,
                         int128_get64(end),
                         iommu_idx);
-- 
2.18.4

