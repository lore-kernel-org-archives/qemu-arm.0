Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp743845ejb;
        Wed, 6 Mar 2024 12:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPtngp7nDqE8VSm7c4Lv5M0lA1bqOuLEFGQHphYGLODKAvxQsHlEpbj4OC5fXLU8T0vUCHae5IK/KqOilEuQhEF2QzRSaA
X-Google-Smtp-Source: AGHT+IE5vmavBL6TFDkQrVlQL9r+ujkiyhwEhlvaTrk7OVa359nzkNOP4PbYBr4si9NE+b+EfSCK
X-Received: by 2002:ad4:4306:0:b0:68f:6f1b:fa41 with SMTP id c6-20020ad44306000000b0068f6f1bfa41mr5934727qvs.4.1709757310191;
        Wed, 06 Mar 2024 12:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757310; cv=none;
        d=google.com; s=arc-20160816;
        b=OH+4pwFIwUxKbxu/gF7SDS6oRC1d2MUYwpsTT0Ape++od+4Dd38t19fLgiXakoCf/a
         KRELU70l+CmqkZK5SacC/pr1U2A3Ovl1AGn4adEmiltCUKnWaRXu90ig0HQCwIFqZ3o3
         yeFiZPdeCXZDbyNGYkjnLYpVfNAIN2Kbe/N2Sa6IvA+5OGbZb1gbaQSbjFOsKJHR/6dP
         6u6mQmwsLR7KSzyKSkyRyzlj5mo7zckuZocj8dUkIJGSB1+2FadrvY47yPGS1x2Zx74g
         2QkYURSXXkXxifXMYF5G1q/AsHVG6Dl4vRP6vXVJP3dQ3uZYIjKHw7PBLLpOKcYvc/Bn
         /xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G8pf/ay85w+iMb0sdshULxgyxYsK+YqD3nZSpGMyglg=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=Ag03H/GH/6PSv7+RO1l/jrzDen7BQpd5uYm1zjORC518C3DQSWnZSZ2/4eJ//GKqUc
         2E3Rjax8DQJGXUiO2L6yfywyhbDwRW7bU4wvgvHP03189TFKcOpYEEDOrsk0xubvnmDt
         xNo4CuTunwM/JKs3nni4d7Or6KoXRK1/Yu20/3wIg8Cq+0lNGvcBb31MiTbe7e20m6xJ
         l+meEswG1/DIKLpkbSJDALvJzlcJ6uxezLHzTrlWwTrNhO9pycMPNqOj2CNEiPQ67aE9
         J2BhnAzhy+2rEyJPOmAKmzOtxPwmrUpte0Y8utFMkyj4ZTXnMME862s+tSA8koK9uIOl
         GaxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gWMFbZF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu11-20020a056214260b00b0068fe53248a6si15295028qvb.454.2024.03.06.12.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gWMFbZF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhxyB-0004PV-Gr; Wed, 06 Mar 2024 15:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxv-0004GK-4V
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxs-0001oR-Pb
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8pf/ay85w+iMb0sdshULxgyxYsK+YqD3nZSpGMyglg=;
 b=gWMFbZF0FyVJFYSdgXK1b7gat8o6gC6EnxQ3OlgUVE238vqqQ2xlU//Zv3asugOHQdknJS
 xH6n8+lJYgwWk9Qz8/sXFL8D0RZgI2zrJA1nESiB2z+a2FCGNUE1W79hWZLOVYNymJHQQp
 /4a1qJIckC94YFaju72gDfyydjAym+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-6MQ-kGa6OpyHH_UswJVa4Q-1; Wed, 06 Mar 2024 15:34:06 -0500
X-MC-Unique: 6MQ-kGa6OpyHH_UswJVa4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3252A800264;
 Wed,  6 Mar 2024 20:34:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4D9047CB;
 Wed,  6 Mar 2024 20:34:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 3/9] virtio-iommu: Change the default granule to the host
 page size
Date: Wed,  6 Mar 2024 21:32:42 +0100
Message-ID: <20240306203348.65776-4-eric.auger@redhat.com>
In-Reply-To: <20240306203348.65776-1-eric.auger@redhat.com>
References: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 17yEDm0/meWW

We used to set the default granule to 4KB but with VFIO assignment
it makes more sense to use the actual host page size.

Indeed when hotplugging a VFIO device protected by a virtio-iommu
on a 64kB/64kB host/guest config, we current get a qemu crash:

"vfio: DMA mapping failed, unable to continue"

This is due to the hot-attached VFIO device calling
memory_region_iommu_set_page_size_mask() with 64kB granule
whereas the virtio-iommu granule was already frozen to 4KB on
machine init done.

Set the granule property to "host" and introduce a new compat.
The page size mask used before 9.0 was qemu_target_page_mask().
Since the virtio-iommu currently only supports x86_64 and aarch64,
this matched a 4KB granule.

Note that the new default will prevent 4kB guest on 64kB host
because the granule will be set to 64kB which would be larger
than the guest page size. In that situation, the virtio-iommu
driver fails on viommu_domain_finalise() with
"granule 0x10000 larger than system page size 0x1000".

In that case the workaround is to request 4K granule.

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4KB page size guest with virtio-iommu on a 64KB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

---

v4 -> v5
- use low case, mandated by the jason qapi
---
 hw/core/machine.c        | 5 ++++-
 hw/virtio/virtio-iommu.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9ac5d5389a..6bd09d4592 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -30,9 +30,12 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_8_2[] = {};
+GlobalProperty hw_compat_8_2[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "granule", "4k" },
+};
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
 GlobalProperty hw_compat_8_1[] = {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 84d6819d3b..aab97e1527 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1543,7 +1543,7 @@ static Property virtio_iommu_properties[] = {
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
-                             GRANULE_MODE_4K),
+                             GRANULE_MODE_HOST),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

