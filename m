Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1152749ejb;
        Thu, 7 Mar 2024 05:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVU2taRvnPFxW69syvpb06baW9xPiF/wBSLg7Ptpg09qJYUoYQ0p5q+v6fRsmJ491hnNvswnv87wEvIaVTziX62GvsZDafp
X-Google-Smtp-Source: AGHT+IEtze2n+dZdjkbqR5ykk5+8tbVyLi97hTmJkB/hE2YjxaQLoOA0Slf+N955x58JAfURDwiz
X-Received: by 2002:a05:6102:3590:b0:472:b056:815 with SMTP id h16-20020a056102359000b00472b0560815mr10436063vsu.26.1709819500650;
        Thu, 07 Mar 2024 05:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819500; cv=none;
        d=google.com; s=arc-20160816;
        b=gyhBusCLK29RoKCBoCmkmxPZUu6we1YbbOWfgulJnSdwJYT4EQPmoF0gbUDH87114B
         xlpqWRCQwiOFi4odYfEb5Be9iG9dCdM78ZkE+qhNf9pjem/vfVfue+cuxQ0wT4ZWJK7H
         5GnCUAiemqfN4p+Yro02Ske4ZmawgyfoR3XzZgk2Coh/55cHY+So9ubwzv1naxfn54X5
         1UEk8RqWEaBdpG8WUEZEV5dzP+xCA9ap1X/UM5a8CtlCMJbA52IS0FSLAEusKnFjV+Bc
         eKSYmm+C8nv1gJH1KYDxhQ9I4FhB86mBaGgTMs2u2BmVNfEO6P4dvAY2854oD7uR0jm2
         RgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G8pf/ay85w+iMb0sdshULxgyxYsK+YqD3nZSpGMyglg=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=SZ1W9mByb5FIAr6NdmqI2BR6fcLTcz7g3XRi4O+xRU4CggonNSI0GCM3uDgEo0GjTH
         Gm62yDdwlhMDungf7ADzPYRGCDtnRaNqoB4mm6fv5dte1g8m9ZHsaBcnJBllFxwcZBIL
         WA2iL6GDHXnCqzxrVn84gc1PCySEjrq0QUAXHuAj1lrdAXuvQ+YzYeiCuXOVQifhijqT
         LqzQZDNMPMtOcCRB4GkTN3NDC12YAQpOOp/OsXMc8O+dEjTyZ7kJ3sPRuXfn9j5Z5bTx
         HqPyA7w8du+UiJhmaXoOAQV4ItU2jrXNaiB4I/o0LMVxbDT3e/XapeiZAvCt0PCw/lSX
         +69A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1k2QiH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a056214194c00b0068c55a05ac9si16900884qvk.309.2024.03.07.05.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1k2QiH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riE7G-0006mQ-B5; Thu, 07 Mar 2024 08:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4H-00057T-Dl
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3i-0007Ej-77
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8pf/ay85w+iMb0sdshULxgyxYsK+YqD3nZSpGMyglg=;
 b=A1k2QiH765yH7Sg46YjFc04VV+BmG3nyzMj8Jr4ROWIktFTqfqmsWOV0GgtACnrsm761zK
 19XQXZpZvlyuvkRFBFjtp+9oAtiiJXULH5M6vaeUdGzz6i4xS5bxtMiZtjC2sQ4T93JjGl
 xBGLWMTvBEuxL8fCPeSdPw9IKV/T9s0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-So0lJumZPF6mc655CgQ3zA-1; Thu, 07 Mar 2024 08:45:03 -0500
X-MC-Unique: So0lJumZPF6mc655CgQ3zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584DB8F4768;
 Thu,  7 Mar 2024 13:45:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67D017AA7;
 Thu,  7 Mar 2024 13:44:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 3/9] virtio-iommu: Change the default granule to the host
 page size
Date: Thu,  7 Mar 2024 14:43:04 +0100
Message-ID: <20240307134445.92296-4-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
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
X-TUID: 6MNSHg4Ia6me

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

