Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2164175ejb;
        Wed, 21 Feb 2024 13:00:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBF8GzYay9gB/bWgGeRZhVP2GP+tiUEtzlIvKcngbRAI1zzOWPguJb31oO+6Y+1eYf/fhSdGONyP7tnH8io7M8BQTHi131
X-Google-Smtp-Source: AGHT+IF6fk8K+rZY6RfWvMBW70yEiiZl3HpPNGtG9NgLhf+Fs76PRxfCZrA3N429CoRP6lk35F/Y
X-Received: by 2002:a05:6102:951:b0:470:76ea:c7d9 with SMTP id a17-20020a056102095100b0047076eac7d9mr5232840vsi.15.1708549226877;
        Wed, 21 Feb 2024 13:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708549226; cv=none;
        d=google.com; s=arc-20160816;
        b=jV4GuqPG11TJmpvZIiX2Dosuz28F0fzplgFkYtPw3g2R8k5BCKn7T8IhSOXLaybIBt
         r8bdS5XqSrXscu788sNx03F3qgzfqFR9s0jmX7IrUr7WM5AD+S5/T8d2iKDTMhQU8GSE
         ByZsWWBN3v2b6lEm253sZPNdbugWZkZ6ujMI1QINjf1huC4b4VpkR91rqQEawmLZC+qo
         uhHOhPANnYw6+FGfrBNjM4CYvzC4ObqFvQwHCfpWT4q9/eV7mK70HeZZwXwvzd93fQFC
         VEY5wFF8I62iY1Gzaj/1tNYCzv/VTRh/Gqv1iJiyROpXMAAd6UcK6+5nM7Ir60skUTSL
         XtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NdbAglMEp6apZkI73sm61ThlRrgopBdcdsCQVathT14=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=LqB4d+4cpPKGyJ64fW/JZlqPSUg8R4MjKcfa0qUsMeBNc7Ue9GzXNSBWz4DdPhykH9
         8xiZKLqvPOZgZzFYlPb406b/65HSsgKMxAD1dDZcTOMMLDHjhAFZLLOFAUOlW6gflpDC
         i6n2eRBXmKzojYepcAjvi+Zel/4Vddt35bG/rLHoG1EEuXQ0YXpjpMhQw4llamrE1cQz
         3b/pLvs3ihsGVywsl1DHTRnajGYM1Tp/sR6yD71YzH3R5jMBGfgEYEFHU7C+odHDO8kN
         DqYLZYk71tuwCJk6yU+fDeJog5nWZSOa5LMcNbZHAHCwtfW+joFziVdHthmhDVHpGO3Z
         hfKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C+20laCL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a056102148600b0046b23b2ada3si1286542vsv.132.2024.02.21.13.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:00:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C+20laCL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rctgq-0000qL-43; Wed, 21 Feb 2024 15:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgn-0000q5-3v
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rctgk-0005nY-Ks
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 15:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708549173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NdbAglMEp6apZkI73sm61ThlRrgopBdcdsCQVathT14=;
 b=C+20laCLFiCHiYF5Yh+fYnYzQRPbdG5rc/qhc5RHtJEy/retJm/lvtL/7pwvP3SE8EPoGR
 irZ1er7kFnsAbqKxCWy7widY7D6Adi5QXmuHkytTRKLZBazF5X8rWNIQnveFu+mWStRzFQ
 /nWBtVfW142gztTW3q8emw8Aaqb5ZIs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376--1emY2reMSalFSIIC4we6g-1; Wed,
 21 Feb 2024 15:59:31 -0500
X-MC-Unique: -1emY2reMSalFSIIC4we6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 580E91C05AC4;
 Wed, 21 Feb 2024 20:59:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B5E014F0;
 Wed, 21 Feb 2024 20:59:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v3 0/3] VIRTIO-IOMMU: Set default granule to host page size
Date: Wed, 21 Feb 2024 21:58:25 +0100
Message-ID: <20240221205926.40066-1-eric.auger@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: EI0a3BK+m+7E

We used to set the default granule to 4KB but with VFIO assignment
it makes more sense to use the actual host page size.

Indeed when hotplugging a VFIO device protected by a virtio-iommu
on a 64kB/64kB host/guest config, we current get a qemu crash:

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

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4KB page size guest with virtio-iommu on a 64KB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

This series can be found at:
https://github.com/eauger/qemu/tree/granule-v1

Previous version:
[PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default page_size_mask
https://lore.kernel.org/all/20240117132039.332273-1-eric.auger@redhat.com/

Applied on top of
[PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/

History:
v2 -> v3
- introduce a dedicated granule option to handle the compat

Eric Auger (3):
  qdev: Add a granule_mode property
  virtio-iommu: Add a granule property
  virtio-iommu: Change the default granule to the host page size

 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    | 11 ++++++++++
 hw/core/machine.c                   |  1 +
 hw/core/qdev-properties-system.c    | 15 +++++++++++++
 hw/virtio/virtio-iommu.c            | 34 ++++++++++++++++++++++++++---
 qemu-options.hx                     |  3 +++
 6 files changed, 64 insertions(+), 3 deletions(-)

-- 
2.41.0

