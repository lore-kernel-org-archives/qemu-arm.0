Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2163974ejb;
        Wed, 21 Feb 2024 13:00:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSfj4/Qt0S3Zdqqa/42laqWtYFfPzj8ed8thK31SJlve2Bdt+DMv133sqNQ/SzTAZl88owdLd0UbFBV9XUUsn7/2wVQRq/
X-Google-Smtp-Source: AGHT+IEt/4Fqokk9eiExYtyb6x349rG1CC497SZca8cdKlubasSm6nLWGRBBYBCPPEpcHKsmlWmU
X-Received: by 2002:a05:6830:1d4e:b0:6e4:6d07:a77f with SMTP id p14-20020a0568301d4e00b006e46d07a77fmr1633101oth.3.1708549204906;
        Wed, 21 Feb 2024 13:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708549204; cv=none;
        d=google.com; s=arc-20160816;
        b=BV355YfbwkDQXAHUUMQJsViORX3FRf4Pl54uzNYogca3h6j7nRQASI0R24qZ/Tjbo7
         p/Ha4lTgTxqoe4SF2p7FLvY3yoggHsCH4xG5YuwfgkVYfVPP6d2lCFWlfjHWzuW+Zay9
         oLFiGSXIAmh1xMyI2+Hu971qlMly8aPjotmBw0uhtfCz/JfljaZNUqS5ilUe99GATQIm
         K7xHxLSjzJM8nktG+FGSOHCsVwjvfbS2mJeq5Q/PyXLupSQEN2+s1bhIYbt9CwPdXj+5
         5P32ppGQ3hDw8Oujooke+NZ592XqQ8gVo+kYjMjqOaZvuGt7vMBCmYkI4BiryRu6nMVl
         0wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8Bd64Wqc1HxXRR3Vwr/SMouizWqXrPMccDPHEvcIzjY=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=B6IQ74VdFyZMceVTYqY9OyV2orqzc7D8ZGheBprZgxpmtsvEgl90id9QcYKl715yDg
         wnoOG+Ys/Jgl9otuXqdPr3wSUYm0twDv/hXCkgUD+sVSzklyFSGpBhppxFFNue1IeXpT
         CCwl39WVZqiFtqOtj6M3vdqAEn7AeCN3wxM/T3Ri6Q7Aw8gHXy4KkWI8yFEW2tsSDGRM
         YmUWJA/IVcv/aIzimwgFJLNK+b8V0lNJLAGWzMcjiyBfjCBQ2L8KjCsrnoWKpe1aJSgi
         AWOIjzSmuXs28++Ef+0ds0a8NNaZGVgCXQz4bO6W87eLVkeln3+GchYBJ1re86xLJTi/
         TGrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WxiCe5M8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05622a121000b0042c4f58fce4si13084760qtx.48.2024.02.21.13.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WxiCe5M8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rctgw-00011R-NB; Wed, 21 Feb 2024 15:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgv-00010t-5V
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgt-0005oY-Af
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708549182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Bd64Wqc1HxXRR3Vwr/SMouizWqXrPMccDPHEvcIzjY=;
 b=WxiCe5M8gCZWMo1DEs5MGAMuVyNonYEwahNteAsUcUqd0cuiqHrgIDz3pSXboQ065LPuMd
 txA7oaEh0xNrRT9Fbj2llvNXoiBdletieOMd5Gpjw4YxBrtgjogmiHjmo02LL1KmnBYSvh
 XFmX3HBtlT2zI7OeH4K+TY1S4oWFfNM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-CgDzOmHKMR2BUYDAmJWzqg-1; Wed,
 21 Feb 2024 15:59:38 -0500
X-MC-Unique: CgDzOmHKMR2BUYDAmJWzqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A1A3811F27;
 Wed, 21 Feb 2024 20:59:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFC02617;
 Wed, 21 Feb 2024 20:59:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v3 2/3] virtio-iommu: Add a granule property
Date: Wed, 21 Feb 2024 21:58:27 +0100
Message-ID: <20240221205926.40066-3-eric.auger@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yEvsMYNfpRaO

This allows to choose which granule will be used by
default by the virtio-iommu. Current default is 4K.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 24 +++++++++++++++++++++---
 qemu-options.hx          |  3 +++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2ce5839c60..1eded09134 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1125,8 +1125,8 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
 }
 
 /*
- * The default mask (TARGET_PAGE_MASK) is the smallest supported guest granule,
- * for example 0xfffffffffffff000. When an assigned device has page size
+ * The default mask depends on the "granule" property. For example, with
+ * 4K granule, it is ~0xFFF. When an assigned device has page size
  * restrictions due to the hardware IOMMU configuration, apply this restriction
  * to the mask.
  */
@@ -1323,7 +1323,23 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      * in vfio realize
      */
     s->config.bypass = s->boot_bypass;
-    s->config.page_size_mask = qemu_target_page_mask();
+
+    switch (s->granule_mode) {
+    case GRANULE_MODE_4K:
+        s->config.page_size_mask = ~0xFFF;
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
@@ -1537,6 +1553,8 @@ static Property virtio_iommu_properties[] = {
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
+    DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
+                             GRANULE_MODE_4K),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/qemu-options.hx b/qemu-options.hx
index a98bc7bd60..6ae27c2cff 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1179,6 +1179,9 @@ SRST
     ``aw-bits=val`` (val between 32 and 64, default depends on machine)
         This decides the address width of IOVA address space. It defaults
         to 39 bits on q35 machines and 48 bits on ARM virt machines.
+    ``granule=val`` (possible values are 4K, 16K, 64K and host)
+        This decides the default granule to be be exposed by the
+        virtio-iommu. If host, the granule is the same as the host page size.
 
 ERST
 
-- 
2.41.0

