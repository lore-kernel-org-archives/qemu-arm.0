Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp743546ejb;
        Wed, 6 Mar 2024 12:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVi8IZOrOhQ7UKo0Ke9otT4v+Z9V0Kh9vEoIew/vJknGiBxk9QTxZ2RbRelwL38ywC9+Ya8iZUv3lyDOzN1yN74u1YxkIFz
X-Google-Smtp-Source: AGHT+IF5y6dkuQorfCt9muhTOwy9zbTThN8rohElZUutcTKQeF9puJroIN/fxrOIiNwFLbQ2ld4K
X-Received: by 2002:a05:620a:7f6:b0:788:2745:cdc8 with SMTP id k22-20020a05620a07f600b007882745cdc8mr6097314qkk.69.1709757267056;
        Wed, 06 Mar 2024 12:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757267; cv=none;
        d=google.com; s=arc-20160816;
        b=kPcDOUH2r32qxME0C9otbcsimP70n1iybG8N4WspZLuH1+CJUmCNqhbo/hB2SxT/zT
         yrlmpLGrrvgvH2aI0nZIJdKcvTaWs9SPEJkK0TpEI0/LAqg3kM00TgbdJ2BINQMbNSB5
         O3e0jglvXwYol3YmldIV9erahkO/eucc3MzQuu44QixODbKybvgUUJfxLG2hxAizEgwC
         SCr/yLa2RpUwUVHKKtYcLPf0FiDkh3T95ye4hxSDPpyjZrzA/hkgXY8Llc2aNOP7UpTO
         jF62mhVxPM2OuNCRQQXEk7rsCbZODQWNDztXDJ5tDFPET/YDnKAoVYcCUb4kIRXXjRo3
         vsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=E1H6p/sNzqNQ9c2q9TA9R9BfO5OvideIBffXBx5RiDI=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=IAmTV7XLOXtgyfMaHosA8sqwkOiRj3CpH2wSeAlnAKJSrdgjvhq2avePFtRcgxDMdT
         S2qNuMYE/Us6jlKVkvMUc932Td7DuKs7IL1iPrm6NhWHbdkk5YG2r+2zdCjxmyC4WdTd
         xORklpJwxmR8i+O6clar5XTgofX17P0+wPbRo11YaTpSNLnbpB8/inQNWmCBQC80brH2
         m5JKoOOM+2rMyMf/oJKWha0bjOZpEGNPm5ieiYFt6rf+E3O7GjZ1kHO6dIoiajZtpPYb
         HYkGHgQ4s8Tg0ZaitRkBgZXU8aVJk/Rq/l0wtgpobDemB8DXtmjN7MFpLNxasmW152Sw
         dYKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EtXYnP4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a10a400b007882a0c18fbsi7194949qkk.385.2024.03.06.12.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EtXYnP4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhxxo-0004F3-11; Wed, 06 Mar 2024 15:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxi-0004Ds-D5
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxg-0001ms-Nn
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E1H6p/sNzqNQ9c2q9TA9R9BfO5OvideIBffXBx5RiDI=;
 b=EtXYnP4DIxFWMjLFUXG9z9oJXN1jTsuvlB52UT9H1iPW7Y+DReiJ8+OIjvtfm5On5tCDTW
 +E2pLIEzLve4MrkGMFQy1f80zJqTR/1W7Arl+UFqh1lNkvEzl+USHGGRPmCOTnIHNlEWWf
 PaGMsVf9s6EhDg3ik8qwTkPfWFKLVfc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-xaJ3RYrAOSGO5jcqmJIkNA-1; Wed,
 06 Mar 2024 15:33:55 -0500
X-MC-Unique: xaJ3RYrAOSGO5jcqmJIkNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 049493800083;
 Wed,  6 Mar 2024 20:33:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6054037FC;
 Wed,  6 Mar 2024 20:33:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 0/9] VIRTIO-IOMMU: Introduce aw-bits and granule options
Date: Wed,  6 Mar 2024 21:32:39 +0100
Message-ID: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
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
X-TUID: /M10KQQTNEYE

This is a respin of
[1] [PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
(https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/)

which now also integrates

[PATCH v6 0/3] VIRTIO-IOMMU: Set default granule to host page size
(https://lore.kernel.org/all/20240227165730.14099-1-eric.auger@redhat.com/)

The introduction of those 2 new options and their new default values
fix bugs when assigning VFIO devices protected by a virtio-iommu.

patches 1 - 4: intro of the granule property, collected reviews
- we used to set the default granule to 4k. This causes failures
  when hotplugging a VFIO device on a 64kB/64kB host/guest config:
  "vfio: DMA mapping failed, unable to continue". When the device
  is hotplugged the granule is already frozen to 4k wheras 64k is
  needed. This series introduces a new granule option which is set
  by default to the host page size.

patches 5 - 9: intro of the aw-bits property, needs further review
- we used to set the input address width to 64b. This causes
  failures with some assigned devices where the guest driver
  tries to use the full 64b input range whereas the physical IOMMU
  supports less bits (39/48 gaw for instance on VTD). New default
  usually match the host HW capability.

For more details please see the cover letter of [1] and [2].

This series can be found at:
https://github.com/eauger/qemu/tree/granule_aw_bits_v7

History:
v6 -> v7:
- Made property static in virt and pc_q35. Fix qtest 32 limit.

Eric Auger (9):
  qdev: Add a granule_mode property
  virtio-iommu: Add a granule property
  virtio-iommu: Change the default granule to the host page size
  qemu-options.hx: Document the virtio-iommu-pci granule option
  virtio-iommu: Trace domain range limits as unsigned int
  virtio-iommu: Add an option to define the input range width
  hw/i386/q35: Set virtio-iommu aw-bits default value to 39
  hw/arm/virt: Set virtio-iommu aw-bits default value to 48
  qemu-options.hx: Document the virtio-iommu-pci aw-bits option

 qapi/virtio.json                    | 18 +++++++++++++++
 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    |  3 +++
 hw/arm/virt.c                       | 17 ++++++++++++++
 hw/core/machine.c                   |  6 ++++-
 hw/core/qdev-properties-system.c    | 14 ++++++++++++
 hw/i386/pc_q35.c                    |  9 ++++++++
 hw/virtio/virtio-iommu.c            | 35 +++++++++++++++++++++++++----
 tests/qtest/virtio-iommu-test.c     |  2 +-
 hw/virtio/trace-events              |  2 +-
 qemu-options.hx                     | 11 +++++++++
 11 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.41.0

