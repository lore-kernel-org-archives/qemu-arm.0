Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp413094ejf;
        Thu, 22 Feb 2024 23:45:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8hBhKtZ6kpqFHsyCHsvlVnnzF7Sd02ILUOy0Mci4ElHk4duTaDqxrQdVGQrO/NAreoYCldiKwnQnRpDpC+yLYO+zOnFta
X-Google-Smtp-Source: AGHT+IGGyeZEFRQsEltbkptQZiXgdEnkUB8TonphqFeGRUl5nh5cnsxwkmRTjd6KrOVe/lBFfa70
X-Received: by 2002:a05:6214:5002:b0:68f:6f52:e7bf with SMTP id jo2-20020a056214500200b0068f6f52e7bfmr1658436qvb.56.1708674352367;
        Thu, 22 Feb 2024 23:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708674352; cv=none;
        d=google.com; s=arc-20160816;
        b=HggrI7rN4fv/AsFNDA3BjJIVlO66YTqfokpia1UqkdGW/9H+8vEZQtNLLVIn+aNglm
         xgttP5ju1FUNTPV77AGp6wtD3hQ8OKyEAmbbS3rHWdCwiByKAMpkKxCiV92MeHg/EHC6
         2cBUQ/62g/SffK+CXm0o1KRA3nUHtJmOfKE4lD2iCADYe7kFm51QRUQxn4mUmJhc6b75
         B1l6W20LhLii4OSpTymefno5amfhFpNJFbYSt2e0DZlICcf4EQPlW0TdWDMcAuHl7TWi
         IFruam2E2v8DPOVTvIrbOqoycRu95jMfvEq05XL2yvCq5jYT2w8ZhW4Jc/bokSMNKT4q
         WtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8uru99xdQqym/mh+Qt6ExdZHvHo5pl6XCbRPEYP6mAg=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=cNQaaJYCTXLmKTn96KXX4vyH5mzM3Tlkpgxs+5MdDVrybHy37nMU4bBOpAwxLJ2r6f
         RLVdm1vPY0F47plnsB2dWOEAv+mT3CF83q4yfOxUX2V9OefLE0AE0orE+aguCS3ESTzA
         aMyaGhysBbiqzU5gvWBuG9rl0D/QHGieST2M8VGGpqd7tpEAYPQEpHXW1af4hfrsz8bq
         sY7OHhzwYAD5AkGFS3GH18ubrOqU36eYja7BMeifsl4wWkdGa2JiSqC13WUBCTTuvU9V
         qggYfWUo+oE+4e13UtyijxP6TeAdaT7om85sb54Liqf2CcCdRNmj0twm6kc/byJrUKRg
         gvxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Utp3klRt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a0562140c8e00b0068d14ecdfacsi15290830qvr.66.2024.02.22.23.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 23:45:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Utp3klRt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQFG-0001JY-5a; Fri, 23 Feb 2024 02:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQFE-0001Fz-Q6
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQFD-0004xs-7A
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708674318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uru99xdQqym/mh+Qt6ExdZHvHo5pl6XCbRPEYP6mAg=;
 b=Utp3klRtTIKrDK8ZtLT/IWMKt40zJATd4/gaP5n4rS8gZS+ZQX4tGRzBDXY2d5K/jVQpwd
 W0CKI4/iSnpY34yVz8ztnZ8biKZVpVVxPuJa6iFM821VTDoI/WwUmnM5ZyP1cktllHXEkc
 1sVuMws0MYy5JVhIWEovPl9xXXUOgps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-HXblH-AUOj6xoYO9rT8nbw-1; Fri, 23 Feb 2024 02:45:15 -0500
X-MC-Unique: HXblH-AUOj6xoYO9rT8nbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF2783B82C;
 Fri, 23 Feb 2024 07:45:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB0D40D1B6E;
 Fri, 23 Feb 2024 07:45:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v4 3/3] virtio-iommu: Change the default granule to the host
 page size
Date: Fri, 23 Feb 2024 08:27:25 +0100
Message-ID: <20240223074459.63422-4-eric.auger@redhat.com>
In-Reply-To: <20240223074459.63422-1-eric.auger@redhat.com>
References: <20240223074459.63422-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: u4AORE50r2RK

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
---
 hw/core/machine.c        | 1 +
 hw/virtio/virtio-iommu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 70ac96954c..38851df4b8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@
 
 GlobalProperty hw_compat_8_2[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
+    { TYPE_VIRTIO_IOMMU_PCI, "granule", "4K" },
 };
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0461b87ef2..e9e44a8ad8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1558,7 +1558,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
     DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
-                             GRANULE_MODE_4K),
+                             GRANULE_MODE_HOST),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

