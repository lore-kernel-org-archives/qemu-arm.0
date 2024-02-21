Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2164228ejb;
        Wed, 21 Feb 2024 13:00:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp9F7aHGc/sGNaKV/REUlI0tAzRdRjxrEeuKdFQRVX2FIXStXuIjfMnuYdWMzeof5fMPjlo1DRdJAnZUdfqZapqu7QR9Lz
X-Google-Smtp-Source: AGHT+IHppNxFRlNzR3U5ZgGyjQ4+Xx9si0Eo45rvVbn643ysR8J03CX3zNPFvQMjYS1BZ4O80zGO
X-Received: by 2002:a05:6102:30b1:b0:470:6bfc:b9af with SMTP id y17-20020a05610230b100b004706bfcb9afmr5953069vsd.2.1708549232128;
        Wed, 21 Feb 2024 13:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708549232; cv=none;
        d=google.com; s=arc-20160816;
        b=BCeNTmYUiM+t07ELvrSVKA7eNAK/7Q0R1XBd5DNe6T94glO3+OaVUlqzvur9siQ4HA
         Y3X7Rbt/ybAO3kT5kxQFm2vTwi2sZtQdWWEXHxRh3lt8cpAeP3cXzzZpQp2Gm+fSOAGc
         g70QhlMkfTYbpORlD6W6Lj7AlzM5FfgqSdl0XJGIfs1jvEisBgIIZaqIWhfKw86a6r+9
         81f7IvGbzkQAJmulqbkBu4LlUDJCecL9kXBiug1Th4UrrxfrF9svDVJAPr2X9iNMx3ET
         Ok9kfx0L15xXyQY5aqWK631MAqp+VT/c/ty+WdANlumEMqfHP/UHi/f2O/fp2fWEc0H3
         q/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e9KBBuGHB08NJ+ZIcJCgJrqBaD7JtOUqxzBEKSWmsBs=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=IJZ5SXlBpZir2iZ4MbdvNnDyXYW4E7ZuwxlMcVv5WwpfHbUTsjSk/5yuxrnAhIp0Hz
         DrytZABK3DyHxMvZYzSaVpOh/Y3k5opzRjRSnByPEtA9unrWANmPDvhMHhH5wB7ouhzT
         tPddVd+4nSvvEhelVUYB73pvQ7G+vV8qc+pBUafO1vnIFLkCT5Rh2lk/u2hqshl2yDfo
         7yPQyPrkKBdbYqD9PgYoejGunh8t15HrJcW5htNXoAbzOIJrPSE1fcf45HidjW7wap5/
         wxyVWUEW4v0jHbxroqSeiSJIdyM32BhMXv6otEPBNgKQ+/Eat9pl2ONJv4cPvKuZcAWV
         3WQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cb8b6J/Y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a056102395600b0046d317a3413si1431035vsu.497.2024.02.21.13.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cb8b6J/Y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rctgz-00012S-IF; Wed, 21 Feb 2024 15:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgy-00011y-2b
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgw-0005os-JT
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708549185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9KBBuGHB08NJ+ZIcJCgJrqBaD7JtOUqxzBEKSWmsBs=;
 b=cb8b6J/YjNN+RnUsLhPGvT0vhPzRJKDItFyuQTILWuVZhDUB35AS/fX6QUpC+ffYf1zl6/
 RaxZEtY+xCYiHGskpC5zgtkwO5BlOEqN4c5qN1U3kfBLL4PRp7BZFahl6LD54yV9zGIXPR
 /PIoX0yNRNTOhVVjs1WFM+N64L+ujZ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-hAKhyTIjNCmc5yoEK-pgJg-1; Wed, 21 Feb 2024 15:59:42 -0500
X-MC-Unique: hAKhyTIjNCmc5yoEK-pgJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E635985A589;
 Wed, 21 Feb 2024 20:59:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA8122BE;
 Wed, 21 Feb 2024 20:59:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v3 3/3] virtio-iommu: Change the default granule to the host
 page size
Date: Wed, 21 Feb 2024 21:58:28 +0100
Message-ID: <20240221205926.40066-4-eric.auger@redhat.com>
In-Reply-To: <20240221205926.40066-1-eric.auger@redhat.com>
References: <20240221205926.40066-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uGftlW6UU1Zv

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
index 1eded09134..0a6e2e6c9f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1554,7 +1554,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
     DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
-                             GRANULE_MODE_4K),
+                             GRANULE_MODE_HOST),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

