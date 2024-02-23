Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp412940ejf;
        Thu, 22 Feb 2024 23:45:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYyvQDbR1INRtsGIAEKX4zxSRd0wyxBia/DReiY75maq/+CG4eDPNVNPJuzcnMdBahxcl1aqD3EWTuT55Aqlsn+vTQnk4Y
X-Google-Smtp-Source: AGHT+IHYZ30E3OlOHaw6TvOyMIu7cRM3S9dZl2gV2dBr6IgOlhNZvRNs/SY/hpokfyCjbL3gieSa
X-Received: by 2002:a05:620a:570a:b0:787:b62e:52a5 with SMTP id wi10-20020a05620a570a00b00787b62e52a5mr332381qkn.13.1708674327495;
        Thu, 22 Feb 2024 23:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708674327; cv=none;
        d=google.com; s=arc-20160816;
        b=G+uf9NobIQ/zzAvS7DKKw+cHfl9lMMIcG/7JjV5r8kEP3tKXw0SuwUoKY2SvJh6E/m
         OkKdB96PEV5Lm1AjYoBEWhAcIiGq9OcN2IOUZ5O/eijpnrL4P4sYKEGQ82G0wH4wjTRJ
         2NUr8Uv5Gk39bE1D2p6YVkx7b9u7B1u8QkZ2whdPXWGb2XJmzoemdXtYBL00pYqiIwVZ
         U+FXT1hvFsWZRCF9hjLQgriKJft5SuvrnTCoxWZpOhwEFZl0EBclC2IwDvDcYqVUvXO2
         5iovUmJWDe1vGgdbrSpFU79n7NK6wKUhvFmsjYMNkXD/0OjcKOvcR81vFAyVqi+6g55Y
         Hr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zRYLunAOikJyU8BvGCpMGX9MHgMaFjOhFKeLKz55XSg=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=v9BZD/FzZWHcx9qMmB272HvE044iE59q6xX8rSH8Ge3ueep/hdxTVS/k93UwoMi2rT
         90ir5DI9hdb6z+yWgrPUCn3Wtp/tKxEJ8MMB0O5NDhhghuqPyBsdPN3/pV4u4/9QG+1L
         e3Gx3ayqX9WlaiNS0LPhuN6OuuzOwNCFJNyy6j3hD/s0jAZvELcoPXQmdtDIGCSWQFy1
         n9SRvpW6fEOxt80+NAv2I+6zeUMzhGFduy9d4XlEdh1J/3gzC9qqqHH168BRdb9ZG6vC
         T/E4YvvsMIzwRXZlZnmHsBLPjKO7uGDDBR5uZKROkgoc9qF1ibUiBJTaxhZcEkxkbERN
         gGCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMwp3s5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a245100b00785d710f4e5si10847521qkn.349.2024.02.22.23.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 23:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMwp3s5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdQFC-00019Y-Qs; Fri, 23 Feb 2024 02:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQFB-00017G-5J
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rdQF7-0004wi-G2
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 02:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708674309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zRYLunAOikJyU8BvGCpMGX9MHgMaFjOhFKeLKz55XSg=;
 b=IMwp3s5VRn+mjDe4tPy5XeHSByXYsAaypUKQBi05pLTeEvaIB3ezw49X8sZ6CmqRXcU8/4
 kHpy7WIhfyqN619T5czbOBWLqesG4KplQ4SXHlh28hm/eh+jXItwOLmYc5I1LQbea4+uhF
 Mzj/AJ7PyXsxb1btsUoE2qGPR/S7xmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-58KWq9DUMbCbCQ2mxOQJrQ-1; Fri, 23 Feb 2024 02:45:05 -0500
X-MC-Unique: 58KWq9DUMbCbCQ2mxOQJrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D67DA83B825;
 Fri, 23 Feb 2024 07:45:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A84D40D1B67;
 Fri, 23 Feb 2024 07:45:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v4 0/3] VIRTIO-IOMMU: Set default granule to host page size
Date: Fri, 23 Feb 2024 08:27:22 +0100
Message-ID: <20240223074459.63422-1-eric.auger@redhat.com>
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
X-TUID: 1ERsPk4VUPFl

We used to set the default granule to 4KB but with VFIO assignment
it makes more sense to use the actual host page size.

Indeed when hotplugging a VFIO device protected by a virtio-iommu
on a 64kB/64kB host/guest config, we currently get a qemu crash:

"vfio: DMA mapping failed, unable to continue"

This is due to the hot-attached VFIO device calling
memory_region_iommu_set_page_size_mask() with 64kB granule
whereas the virtio-iommu granule was already frozen to 4KB on
machine init done.

Introduce a new granule property and set this latter to "host"
and introduce a new compat.

Note that the new default will prevent 4kB guest on 64kB host
because the granule will be set to 64kB which would be larger
than the guest page size. In that situation, the virtio-iommu
driver fails on viommu_domain_finalise() with
"granule 0x10000 larger than system page size 0x1000".

In that case 4K granule should be used.

To summarize, before the series, the support matrix (credit
to Jean-Philippe Brucker) was:

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | N
  64k | 4k    | Y          | N
  4k  | 64k   | Y          | Y

After the series:

 Host | Guest | virtio-net | IGB passthrough
  4k  | 4k    | Y          | Y
  64k | 64k   | Y          | Y
  64k | 4k    | 4K         | N
  4k  | 64k   | Y          | Y

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4KB page size guest with virtio-iommu on a 64KB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

This series can be found at:
https://github.com/eauger/qemu/tree/granule-v2

Applied on top of
[PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/

History:
v3 -> v4:
- Add 8K granule (Richard)

v2 -> v3
- introduce a dedicated granule option to handle the compat

Eric Auger (3):
  qdev: Add a granule_mode property
  virtio-iommu: Add a granule property
  virtio-iommu: Change the default granule to the host page size

 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    | 12 +++++++++
 hw/core/machine.c                   |  1 +
 hw/core/qdev-properties-system.c    | 15 ++++++++++++
 hw/virtio/virtio-iommu.c            | 38 ++++++++++++++++++++++++++---
 qemu-options.hx                     |  3 +++
 6 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.41.0

