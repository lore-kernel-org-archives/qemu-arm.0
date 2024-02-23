Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp413140ejf;
        Thu, 22 Feb 2024 23:46:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYbNnzXcAyOcVZmHvw2yqI+/607Hi9iUPtYZDIHIn+kYdKBitQ6duD5mpffVSDcaheJ7rS+SLG2r8k9EFZQZ9Oh5hEJnKh
X-Google-Smtp-Source: AGHT+IEgCq1SVtqvh20xZgkJ7PWX9AKXGqvjw4DLONx6qiF2+pEUnXM+EnqSxkKS44NJYKmNLM4/
X-Received: by 2002:a05:620a:2a16:b0:787:b37f:96d7 with SMTP id o22-20020a05620a2a1600b00787b37f96d7mr1010172qkp.13.1708674364713;
        Thu, 22 Feb 2024 23:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708674364; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXpgPC5UmS39WjMnBYVhvQsMaLLUsVeeVfvXe+Va+N6ez1MNh1/+VmGcSGOTH+CaVV
         jAHjZcQ40piIRGxLL1MGc8hHPdWdvLPExUp1ez+bn0vAWcuwrvMxPCUhnmtlnVd/nhOJ
         +BddksLUpDibddt7pxcOC4gU5TZIcCrILdyui22LmGFR3l3BEhrci+iVOCQ32aaTTyLd
         r9Nruph2A3gHTsempGiV/vX90d3ENn2vbpoF7Zcz7dRuPv7tLf0XqzCxjCc3KsHhc3Bv
         +yUf57rB9WrmGxQMQrN2I9P8FkikcLDH/GIbPVlpchjc474SdZDfMFf6ZIKWScnOznm6
         BOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KTWM9Kqbr+5bRD3vjqSa0WSyOt8CpfUimMU2ld0Fpc4=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=mcFneJ6XxfDbrYz51zbqguoc/yFwLj9P44Lox+7+cFMesYPteg5YNF0L6fkw5vxbR4
         n/MzDeQA8OhdmyK1iJHZt/b7Tp5VA+3+gOVyv6LaIfuiX6NhYY103MZIztjw0elmkrk4
         17FahAesHyyYlo3GJMamTHS8Pr/fkgTyR11lvO/dCQVC3ZIpUQVNq7CGzjVHYz/TYvMy
         OBAKD86Aa3os6jwrwcuJ/EfYQcm/zOhvcdgvEi8DfpZLuQHwvaFn481v5uI5kO8b6tna
         sZDVmQuoHpV6gtkY2dgw9D1o0HWKmYATxcBId3D38zLmHuQ8pIPVEl53QDorg2GtijhD
         CEuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrcjpFUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26-20020a05620a041a00b0078770e87359si9086119qkp.160.2024.02.22.23.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 23:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrcjpFUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQFO-0001ZN-6O; Fri, 23 Feb 2024 02:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQFD-0001Bi-Vn
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQFB-0004xT-5i
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708674316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTWM9Kqbr+5bRD3vjqSa0WSyOt8CpfUimMU2ld0Fpc4=;
 b=LrcjpFUBFINQ0TIBwAc0wOltbAcB5trRCdV0qB6S/7tB3GxQ6s0s+9GJTlDasH2DcX4noT
 FUOfDdmXnIXLzGyYP2ZFH7eZL+N1GnLxwtltAx2cpMc12Dw4xBhLc4h9/3x5okLoBT10FI
 Q5Zr2ahEY/iHUiVNO9oOLfn0H/WWHfM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-nwIMgYeJMmWsDJF5pfMuOg-1; Fri,
 23 Feb 2024 02:45:12 -0500
X-MC-Unique: nwIMgYeJMmWsDJF5pfMuOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC3DB3C025B4;
 Fri, 23 Feb 2024 07:45:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5A4B40D1B6A;
 Fri, 23 Feb 2024 07:45:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v4 2/3] virtio-iommu: Add a granule property
Date: Fri, 23 Feb 2024 08:27:24 +0100
Message-ID: <20240223074459.63422-3-eric.auger@redhat.com>
In-Reply-To: <20240223074459.63422-1-eric.auger@redhat.com>
References: <20240223074459.63422-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
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
X-TUID: qiPuN1FiZ63o

This allows to choose which granule will be used by
default by the virtio-iommu. Current page size mask
default is qemu_target_page_mask so this translates
into a 4K granule.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- granule_mode introduction moved to that patch
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 27 ++++++++++++++++++++++++---
 qemu-options.hx                  |  3 +++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index e22327548f..a3e5b35b1e 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -78,6 +78,7 @@ struct VirtIOIOMMU {
     Notifier machine_done;
     bool granule_frozen;
     uint8_t aw_bits;
+    GranuleMode granule_mode;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index a9bdc03d12..0461b87ef2 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1126,8 +1126,8 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
 }
 
 /*
- * The default mask (TARGET_PAGE_MASK) is the smallest supported guest granule,
- * for example 0xfffffffffffff000. When an assigned device has page size
+ * The default mask depends on the "granule" property. For example, with
+ * 4K granule, it is ~0xFFF. When an assigned device has page size
  * restrictions due to the hardware IOMMU configuration, apply this restriction
  * to the mask.
  */
@@ -1324,7 +1324,26 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      * in vfio realize
      */
     s->config.bypass = s->boot_bypass;
-    s->config.page_size_mask = qemu_target_page_mask();
+
+    switch (s->granule_mode) {
+    case GRANULE_MODE_4K:
+        s->config.page_size_mask = ~0xFFF;
+        break;
+    case GRANULE_MODE_8K:
+        s->config.page_size_mask = ~0x1FFF;
+        break;
+    case GRANULE_MODE_16K:
+        s->config.page_size_mask = ~0x3FFF;
+        break;
+    case GRANULE_MODE_64K:
+        s->config.page_size_mask = ~0xFFFF;
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
@@ -1538,6 +1557,8 @@ static Property virtio_iommu_properties[] = {
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
+    DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
+                             GRANULE_MODE_4K),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/qemu-options.hx b/qemu-options.hx
index a98bc7bd60..8bc1e9e4aa 100644
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

