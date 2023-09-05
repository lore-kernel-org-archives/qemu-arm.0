Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2178895ejb;
        Tue, 5 Sep 2023 10:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2K4AU9NALKPpG9RnluwhDTebP1O2iDknWW1qEzUgjdvqOMempqdz8p2HlYc5/zZmgSSPa
X-Received: by 2002:a0c:df90:0:b0:653:589b:9d09 with SMTP id w16-20020a0cdf90000000b00653589b9d09mr13853704qvl.49.1693936581649;
        Tue, 05 Sep 2023 10:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693936581; cv=none;
        d=google.com; s=arc-20160816;
        b=zdJ2cXMZDAZn167K6+pwcXhJBwl/qSawMg/U/B8khu9OK6apqBHem26WAr+PG4+c2f
         gPCpwDU1zBrKoQQP18zSCItsiJgieU2efjRpRsReF3ru9JC5/aEBXgszYRxLHe8HlI34
         Ys3ZrBIQY0VEIz2z6QJhgMkqITZqF8I/o+4ndZchtm2Q5G7FNWa+ydAs1AOCTItqDU7o
         ZkZ+MuO5s9cJBed0Nak5sugTjBjmlfRMqK7fvz5+571g/p3DvXALopyVMdvp3FQomwtL
         IAFN6oSYHJ96vntzng/zVJiciAiYLxznDXE5fqwSKTgNJKQKBYHoCIDv4JfG5Zu4v8T1
         Bhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=IwO1Nf1MzjDI88RLD+/BrPu4iL3TSpccicgjR8SzUmw=;
        fh=Itbbu/PWL12vfUV9pSMfONMQCKVHOxT0l/2dhHgmw7U=;
        b=HW/5BhnH3WSFn/8cB4ye0x14SXCV649BFljIFrFtY0P+bRsw9GmVDX6au8/w9FPKQZ
         VWaP1WRLLVDw2pY/RzQxnQO4RcrZiJaR8S0cJ2uRair5maY1bedEY5GXs77ibYiGZSNb
         Amov8zeWo95rcQ/HW9cO1YvoXpeTj+B+uZkSIkLIg1/QiWRiW121J62+XH6Y8FToU1E+
         4+fWvyDi1NH585EgteQozmx7xhBN0hM6RFquCvQEpew73q/TCDpu2zAc1Fa2r9PSiUCD
         PSR/CHWATJUm7TjFxAin2Wp0TqNUSSjOF2hqpzv8MVpqdWNjLvXXzcvSDvNr89Dlz3c5
         17JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhjyIbMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a0cf208000000b0065571e0430csi3956084qvk.262.2023.09.05.10.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 10:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhjyIbMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdaHY-0008Vf-TD; Tue, 05 Sep 2023 13:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qdaHY-0008VI-2B
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 13:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qdaHV-0007qj-8p
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 13:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693936563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwO1Nf1MzjDI88RLD+/BrPu4iL3TSpccicgjR8SzUmw=;
 b=fhjyIbMBxICv8WuICzqtJq00xgXo4y2owiPYUobGpmMkzFBTXnbkAb4liNJz5ozD/iDBoH
 wPGWS7H22daoo8vEHbwl/WrYIwzHjhdqDRYjfxjA2BIzRLRO0E0P4B9egii3ea/iM0bi60
 flxl89nyg5tKs/Td5kWTePU0FSe920Y=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-W83k3--AMzGtQ1J0PUiApQ-1; Tue, 05 Sep 2023 13:56:01 -0400
X-MC-Unique: W83k3--AMzGtQ1J0PUiApQ-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7916aa85aa2so211464939f.2
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 10:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693936561; x=1694541361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwO1Nf1MzjDI88RLD+/BrPu4iL3TSpccicgjR8SzUmw=;
 b=avIc/WGcedsunNpYloeyz/Ns4JK8MnAHSDU2jM6DAqUcaPOEYp7zR6/8200iqKWlTw
 aTgr5nEjpcCw6uIV4JCfY5LWcu288LyNh+llWxfbWycuwU+XO5Hh0q4/HxxAQX8Y8uNj
 7QRtBOysnMABbzFu8x9uBUPnhP5YF2yxkEweiSKlpYMwxKJzlYa768wKotOA8lyA6I7x
 Vt46XrGTIr8gia3G/R+PWmyB0QR7rkYcOAV2ituCg9IncdtBt964UNML1UhXC9wawPzI
 DyiJZWjxn4xoOaXIoB8W6YZiuFDZGEEeSMic/MZ8tZ9M9lG7wABFMKPXmZOplbJ0l1/n
 pjjA==
X-Gm-Message-State: AOJu0Yxt0Ypqm6S3PTIyWNvLSJ65pG5nPSDD8K9R2/bqkV4Cd7XxPdXY
 KDJrv72jrtT140hYuJgdL0ou8+RaQRgMYqCV9BjNIG945XoXlpbTd1Wsw4JBVWK/Nh+qm8PyOVM
 40jI6cMj7qi6r
X-Received: by 2002:a92:cc4a:0:b0:343:c8b1:b7f0 with SMTP id
 t10-20020a92cc4a000000b00343c8b1b7f0mr14945783ilq.23.1693936561094; 
 Tue, 05 Sep 2023 10:56:01 -0700 (PDT)
X-Received: by 2002:a92:cc4a:0:b0:343:c8b1:b7f0 with SMTP id
 t10-20020a92cc4a000000b00343c8b1b7f0mr14945761ilq.23.1693936560819; 
 Tue, 05 Sep 2023 10:56:00 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 j6-20020a02cb06000000b0042b69cca627sm4142121jap.137.2023.09.05.10.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:56:00 -0700 (PDT)
Date: Tue, 5 Sep 2023 11:55:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
Message-ID: <20230905115558.590ea2e5.alex.williamson@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v52FqwefKVLo

On Mon,  4 Sep 2023 10:03:43 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> On x86, when assigning VFIO-PCI devices protected with virtio-iommu
> we encounter the case where the guest tries to map IOVAs beyond 48b
> whereas the physical VTD IOMMU only supports 48b. This ends up with
> VFIO_MAP_DMA failures at qemu level because at kernel level,
> vfio_iommu_iova_dma_valid() check returns false on vfio_map_do_map().
> 
> This is due to the fact the virtio-iommu currently unconditionally
> exposes an IOVA range of 64b through its config input range fields.
> 
> This series removes this assumption by retrieving the usable IOVA
> regions through the VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE UAPI when
> a VFIO device is attached. This info is communicated to the
> virtio-iommu memory region, transformed into the inversed info, ie.
> the host reserved IOVA regions. Then those latter are combined with the
> reserved IOVA regions set though the virtio-iommu reserved-regions
> property. That way, the guest virtio-iommu driver, unchanged, is
> able to probe the whole set of reserved regions and prevent any IOVA
> belonging to those ranges from beeing used, achieving the original goal.

Hi Eric,

I don't quite follow this relative to device hotplug.  Are we
manipulating a per-device memory region which is created at device add
time?  Is that memory region actually shared in some cases, for instance
if we have a PCIe-to-PCI bridge aliasing devices on the conventional
side?  Thanks,

Alex

> This series can be found at:
> https://github.com/eauger/qemu/tree/virtio-iommu_geometry_v1
> 
> Eric Auger (13):
>   memory: Let ReservedRegion use Range
>   memory: Introduce memory_region_iommu_set_iova_ranges
>   vfio: Collect container iova range info
>   virtio-iommu: Rename reserved_regions into prop_resv_regions
>   virtio-iommu: Introduce per IOMMUDevice reserved regions
>   range: Introduce range_inverse_array()
>   virtio-iommu: Implement set_iova_ranges() callback
>   range: Make range_compare() public
>   util/reserved-region: Add new ReservedRegion helpers
>   virtio-iommu: Consolidate host reserved regions and property set ones
>   test: Add some tests for range and resv-mem helpers
>   virtio-iommu: Resize memory region according to the max iova info
>   vfio: Remove 64-bit IOVA address space assumption
> 
>  include/exec/memory.h            |  30 ++++-
>  include/hw/vfio/vfio-common.h    |   2 +
>  include/hw/virtio/virtio-iommu.h |   7 +-
>  include/qemu/range.h             |   9 ++
>  include/qemu/reserved-region.h   |  32 +++++
>  hw/core/qdev-properties-system.c |   9 +-
>  hw/vfio/common.c                 |  70 ++++++++---
>  hw/virtio/virtio-iommu-pci.c     |   8 +-
>  hw/virtio/virtio-iommu.c         |  85 +++++++++++--
>  softmmu/memory.c                 |  15 +++
>  tests/unit/test-resv-mem.c       | 198 +++++++++++++++++++++++++++++++
>  util/range.c                     |  41 ++++++-
>  util/reserved-region.c           |  94 +++++++++++++++
>  hw/virtio/trace-events           |   1 +
>  tests/unit/meson.build           |   1 +
>  util/meson.build                 |   1 +
>  16 files changed, 562 insertions(+), 41 deletions(-)
>  create mode 100644 include/qemu/reserved-region.h
>  create mode 100644 tests/unit/test-resv-mem.c
>  create mode 100644 util/reserved-region.c
> 

