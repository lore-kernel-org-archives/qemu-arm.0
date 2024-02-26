Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2223852ejf;
        Mon, 26 Feb 2024 10:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXV+WFEArqacfSP8FcHu54AC1IyCelWRyCbePOkImW9vSA1AGTCyCp01WVWzp7mBXRVU5TfTRBt60eqFN6DO3miOS1Wnahn
X-Google-Smtp-Source: AGHT+IFjuFWn9jezkST5DNliWy2QtxIGjlxHvOdrF0beoKYANrOZ2WpzwiseXxLE33cVgFpdl2IS
X-Received: by 2002:a05:6808:169e:b0:3c1:50f6:9f93 with SMTP id bb30-20020a056808169e00b003c150f69f93mr8864338oib.11.1708971267177;
        Mon, 26 Feb 2024 10:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708971267; cv=none;
        d=google.com; s=arc-20160816;
        b=Sp7nMGcJTLQ2zHgvlaWMa1vFbv0wmQxX/kCljm2Qd/n7+tAcZIJoJQjeZNUKcMKGm8
         5MEpQTtuxGOfEqUIiNavsncISQuJpjlrJgLnav93MgXvTV0WXdZ7+PQBDTav3gy+fBar
         xji6vaMNYanJktY8nlvpDe/9HZjDd1aNWixjsaazVnyETr+CaOM68T2fsztyiNjGyn1M
         S3e66EegctCFxnV9V6P80Tis0S2HP4ufyfkhcptx5GnF+51hfp62V83oCwduFKRpNFzZ
         9JPQuGZyCLbN/QrG/thqc+u7NKUuPc/Wol8GUipLe45jCiWblJFZN7Wtgnt6Co3hSsBH
         Llgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tLxoFwBniMzzRTmjC94fnXeOryYlKWv3cZzBB1FVazQ=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=lf3H8uwp+ErMWwz2FnWsHGvDC7kP0cliQHK90lQE9nyLFOhvDcyzIdYdjKF2EchtYs
         y4P6beEnBQb9goWJCxrViO+538zp5xJaPWxDvpcm1M5dQ0w+h6OTei9810PUAEmij9Cc
         EqyBK6NN/8IqIrdn+1pbW+2jpu8RZV+QchRmVcZwcb3iNgdk/3Wr6mQZXur/bh4ihC/f
         7yk+XiJbYHGKYe0dqQ/g35VnoWWAu0pu1xbBRJLNE4bpy7aAioJjseI4AegxtoVYxQ27
         e5daljqQ78jBd6gC9psJO24aT+vgV1PLg4jZPyE8JaUH2ls7Rabv0g3NDdupgnfPQA/U
         bTzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f3fUy8YQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ad45761000000b0069019d451basi708477qvx.66.2024.02.26.10.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 10:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f3fUy8YQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1refUY-0005Bj-SW; Mon, 26 Feb 2024 13:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1refUX-0005BS-3H
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1refUV-00059E-Il
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708971253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLxoFwBniMzzRTmjC94fnXeOryYlKWv3cZzBB1FVazQ=;
 b=f3fUy8YQw3jEHlYmXEhinFmC121nR4WPXAnr+/u1t4trpaRtTVGvm/3fzWwq+KvcUBtVyh
 ur9GYbNSlh0FJ+5wDFVNekYvsDNAgREYr797M0tzThTh4dd1ge931cZtuHTIlwDybaWBgW
 IfYSFv4b9EEEkTwtpckZ7Ylm80wLIeg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-htOJg4IUPlShTb5kYYX9Lw-1; Mon,
 26 Feb 2024 13:14:10 -0500
X-MC-Unique: htOJg4IUPlShTb5kYYX9Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41C743C000BC;
 Mon, 26 Feb 2024 18:14:10 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA1340C1020;
 Mon, 26 Feb 2024 18:14:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v5 2/3] virtio-iommu: Add a granule property
Date: Mon, 26 Feb 2024 19:11:11 +0100
Message-ID: <20240226181337.24148-3-eric.auger@redhat.com>
In-Reply-To: <20240226181337.24148-1-eric.auger@redhat.com>
References: <20240226181337.24148-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.014,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XkDGpYC0Dy8R

This allows to choose which granule will be used by
default by the virtio-iommu. Current page size mask
default is qemu_target_page_mask so this translates
into a 4K granule.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- use -(n * KiB) (Phild)

v3 -> v4:
- granule_mode introduction moved to that patch
---
 include/hw/virtio/virtio-iommu.h |  2 ++
 hw/virtio/virtio-iommu.c         | 28 +++++++++++++++++++++++++---
 qemu-options.hx                  |  3 +++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 5fbe4677c2..f2785f7997 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -24,6 +24,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "qapi/qapi-types-virtio.h"
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
 #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
@@ -67,6 +68,7 @@ struct VirtIOIOMMU {
     Notifier machine_done;
     bool granule_frozen;
     uint8_t aw_bits;
+    GranuleMode granule_mode;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2ec5ef3cd1..33e0520bc8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -29,6 +29,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "qemu/reserved-region.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "trace.h"
@@ -1115,8 +1116,8 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
 }
 
 /*
- * The default mask (TARGET_PAGE_MASK) is the smallest supported guest granule,
- * for example 0xfffffffffffff000. When an assigned device has page size
+ * The default mask depends on the "granule" property. For example, with
+ * 4K granule, it is -(4 * KiB). When an assigned device has page size
  * restrictions due to the hardware IOMMU configuration, apply this restriction
  * to the mask.
  */
@@ -1313,7 +1314,26 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      * in vfio realize
      */
     s->config.bypass = s->boot_bypass;
-    s->config.page_size_mask = qemu_target_page_mask();
+
+    switch (s->granule_mode) {
+    case GRANULE_MODE_4K:
+        s->config.page_size_mask = -(4 * KiB);
+        break;
+    case GRANULE_MODE_8K:
+        s->config.page_size_mask = -(8 * KiB);
+        break;
+    case GRANULE_MODE_16K:
+        s->config.page_size_mask = -(16 * KiB);
+        break;
+    case GRANULE_MODE_64K:
+        s->config.page_size_mask = -(64 * KiB);
+        break;
+    case GRANULE_MODE_HOST:
+        s->config.page_size_mask = qemu_real_host_page_mask();
+        break;
+    default:
+        error_setg(errp, "Unsupported granule mode");
+    }
     if (s->aw_bits < 32 || s->aw_bits > 64) {
         error_setg(errp, "aw-bits must be within [32,64]");
     }
@@ -1527,6 +1547,8 @@ static Property virtio_iommu_properties[] = {
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
+    DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
+                             GRANULE_MODE_4K),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 3b670758b0..c7b43b67d5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1179,6 +1179,9 @@ SRST
     ``aw-bits=val`` (val between 32 and 64, default depends on machine)
         This decides the address width of IOVA address space. It defaults
         to 39 bits on q35 machines and 48 bits on ARM virt machines.
+    ``granule=val`` (possible values are 4K, 8K, 16K, 64K and host)
+        This decides the default granule to be be exposed by the
+        virtio-iommu. If host, the granule matches the host page size.
 
 ERST
 
-- 
2.41.0

