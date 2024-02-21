Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2164546ejb;
        Wed, 21 Feb 2024 13:01:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUG2eU5KNgXFOt3d5O8t+hZtDjR8RWIV4DwdeaP701hOiihuclCa99Bs7fYFS8+Ykjk2Rnn4X/fTa8Q+A46tuqm4xAznb9V
X-Google-Smtp-Source: AGHT+IHLuU8ATlJvpYDYGYr5vB02BwJ0kHqm0m6Xw0j/t7Zy1LYUrnLDBKAoIwR7+U8fI8byvxXs
X-Received: by 2002:a0c:f510:0:b0:68f:969:ba3a with SMTP id j16-20020a0cf510000000b0068f0969ba3amr20923073qvm.54.1708549261909;
        Wed, 21 Feb 2024 13:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708549261; cv=none;
        d=google.com; s=arc-20160816;
        b=Ts8dPYnxKn/bldkih6MYMt8kZgfRsBJQe5rarltpFT8+gXVDTmsa+95v6h1e9/CVyt
         5VzWHYlBY7IiNwm9XOJz5rBRapNIm245/BTLMGlz1j5zzRr+0iuj0E1eRF/8mcfI/EK6
         ozyhdobBvr0LyjhUVeow6YokocGlnDcBBoeToz6wM0csdPEc5qJE8Rzn6fkwJaCs38EN
         mLKlYhbzNbbm+7rMN0u0WnxWinhRElvvFoHY1tH9N61nvNvFEbfMg2SYZFx77wqConeM
         EQhMsrxKSSqN0Z+NT2Mq7ZEGYEhHcAI9FpbtnVxQcp5aCTxvsNSwcKDZwVNF6Ejlup/q
         tl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/htpsK4RQi0FAuTma8gr+88eSD8QbIFBtEt7Y+D+K5o=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=vcI6UmGSR3jOzLeGA09wg4lfnh/xtiLjSk8LItQyb1RoDvpu8qi9goUvxanElcooDC
         eNQ+xh9aZv4wZA1/LEWrAttHvWg+ij039JgCCndbKxQ6cCZmIsEg7eQECSVxvum1N+CL
         AFxckmZm+ImYHGPKR/LpZI0fkntesX84of9W2uu5t/IEgZB9ZjGw68yUfXYxthqy//y1
         0MXzA3VOwfMLkiDSbPTDPp3l+xHBrSyVjwFgHqA3oRxxN7stYykQrORwx6j3MmQY0MEH
         nhqGiAOhBuLirhHfbram+4NyKsQXXd0QQV3p5c7uMY+VwtC1RkvN/RTpO+8dnkmmbEPm
         kJdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqJ87Paj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs1-20020a056214226100b0068d0c6f5766si11687437qvb.515.2024.02.21.13.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:01:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqJ87Paj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctgt-0000z5-Li; Wed, 21 Feb 2024 15:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgq-0000qw-8Z
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgo-0005np-9O
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708549176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/htpsK4RQi0FAuTma8gr+88eSD8QbIFBtEt7Y+D+K5o=;
 b=LqJ87PajEYoZFoXbq4FbKiAmM76yZhI3GSXPphRpKL0kTb55nB74ITNR0f39MnMdkNn2cq
 /lq7u608BgGnNdsnx/bO1KGxmmwndWvIikKerf9QCSM1aEJGJyt4+uBRwO22xxP93AbosP
 YM7+EdZsgld8B0YWtTtIoqPGkTucAG0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-O2HA6iWvOTiZJPGrupd8pQ-1; Wed,
 21 Feb 2024 15:59:35 -0500
X-MC-Unique: O2HA6iWvOTiZJPGrupd8pQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB9783C025B9;
 Wed, 21 Feb 2024 20:59:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB4D2864;
 Wed, 21 Feb 2024 20:59:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v3 1/3] qdev: Add a granule_mode property
Date: Wed, 21 Feb 2024 21:58:26 +0100
Message-ID: <20240221205926.40066-2-eric.auger@redhat.com>
In-Reply-To: <20240221205926.40066-1-eric.auger@redhat.com>
References: <20240221205926.40066-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o5MjKzQ1b1ib

Introduce a new enum type property allowing to set an
IOMMU granule. Values are 4K, 16K, 64K and host. This
latter indicates the vIOMMU granule will matches the
host page size.

A subsequent patch will add such a property to the
virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    | 11 +++++++++++
 hw/core/qdev-properties-system.c    | 15 +++++++++++++++
 hw/virtio/virtio-iommu.c            | 10 ++++++++++
 4 files changed, 39 insertions(+)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 06c359c190..626be87dd3 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -8,6 +8,7 @@ extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_reserved_region;
 extern const PropertyInfo qdev_prop_multifd_compression;
 extern const PropertyInfo qdev_prop_mig_mode;
+extern const PropertyInfo qdev_prop_granule_mode;
 extern const PropertyInfo qdev_prop_losttickpolicy;
 extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
@@ -47,6 +48,8 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
 #define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
                        MigMode)
+#define DEFINE_PROP_GRANULE_MODE(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_granule_mode, GranuleMode)
 #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
                         LostTickPolicy)
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 5fbe4677c2..a82c4fa471 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -31,6 +31,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
 
 #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
 
+typedef enum GranuleMode {
+    GRANULE_MODE_4K,
+    GRANULE_MODE_16K,
+    GRANULE_MODE_64K,
+    GRANULE_MODE_HOST,
+    GRANULE_MODE__MAX,
+} GranuleMode;
+
+extern const QEnumLookup GranuleMode_lookup;
+
 typedef struct IOMMUDevice {
     void         *viommu;
     PCIBus       *bus;
@@ -67,6 +77,7 @@ struct VirtIOIOMMU {
     Notifier machine_done;
     bool granule_frozen;
     uint8_t aw_bits;
+    GranuleMode granule_mode;
 };
 
 #endif
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 1a396521d5..3a0b36a7a7 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -34,6 +34,7 @@
 #include "net/net.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/i386/x86.h"
 #include "util/block-helpers.h"
 
@@ -679,6 +680,20 @@ const PropertyInfo qdev_prop_mig_mode = {
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
+/* --- GranuleMode --- */
+
+QEMU_BUILD_BUG_ON(sizeof(GranuleMode) != sizeof(int));
+
+const PropertyInfo qdev_prop_granule_mode = {
+    .name = "GranuleMode",
+    .description = "granule_mode values, "
+                   "4K, 16K, 64K, host",
+    .enum_table = &GranuleMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
+
 /* --- Reserved Region --- */
 
 /*
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2ec5ef3cd1..2ce5839c60 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -44,6 +44,16 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+const QEnumLookup GranuleMode_lookup = {
+    .array = (const char *const[]) {
+        [GRANULE_MODE_4K]  = "4K",
+        [GRANULE_MODE_16K] = "16K",
+        [GRANULE_MODE_64K] = "64K",
+        [GRANULE_MODE_HOST] = "host",
+    },
+    .size = GRANULE_MODE__MAX
+};
+
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
     bool bypass;
-- 
2.41.0

