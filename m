Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4644379ejc;
        Wed, 18 Oct 2023 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBvCojY39JHMN9fo5DWijtKrAA938sUS7Nai/XmCFgi8o2Bcx7STEnr7ztnm2i6BWmAbRw
X-Received: by 2002:ac8:5a8a:0:b0:417:95e7:a2f7 with SMTP id c10-20020ac85a8a000000b0041795e7a2f7mr6389623qtc.19.1697636298699;
        Wed, 18 Oct 2023 06:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636298; cv=none;
        d=google.com; s=arc-20160816;
        b=WeVEqkcCflZnBsWDrTEb0nW+jkm3zrvOM2sDdLmyynkDdAk+fdU0ubX/jGxAOR6G82
         pwtxEqjjvsBL6pqlz1/mUWRMM3S+tIfHjuQklT9HaGOTGTC5Lz0jIeKLcKBIVWssHSic
         ok1Wh+db0/tKiMnrmQfNrfddsRqbpPxo0ZK6RufTQ/xEwTL5Id4ttkqIaG01sHdCCOsf
         H3bimuRf6gi7m4tOLPN0ABelR6vH3HyxwoeLD2ocUj3qpefyLzwbQ5kaD4OEJ6sCCDaM
         gbOCGN8eS4/2mK8xldBkX9Cc8CiydbZU8gPQlPV0Nc/j7K98oR2oa4OqKHjimWqK0xtW
         A4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zMDcZMZnclUHY4/QlbNcyySn6eFDKQLV8RGIW4pDFzY=;
        fh=320xXaJBhFW3Pw6CLKjnKZsQCFYMQnMNI4MtZAgneNY=;
        b=B9hjOjFTI9dN/ijKl6gpr3PLHGCibrGaIjkYg53LKwsW53SS5EqS8kF/ksTGNxLuyZ
         wFa9YZWvQ6D6efR74/jY5rY858tCWhtwKRnz+7M6Y1TfwGX7xpgnoWZdTMmXoiiTgdyW
         nuMDawRRQ++3UZDxL3K9Wsnbc0CaZXUdxDlnIKpmMPOL5DI85wtj6yq46wwRGLv/1IRY
         EmBqU0hFObNxmJraz6kcePTtBwU9Ds24fO0XzPsxzbygHJa1frhX37b1TiEXp663HnPf
         ypI52+ichWrXKrCLPeUUOCvhUI4UJDrw8roNdXJovCHafGXh6xNo6LtY/soEPupSwtvq
         vJSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBI26MA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac85bc2000000b0041814373040si2866290qtb.49.2023.10.18.06.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBI26MA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6kZ-0007G2-GK; Wed, 18 Oct 2023 09:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qt6kQ-00079H-KW
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qt6kO-00064A-Ht
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zMDcZMZnclUHY4/QlbNcyySn6eFDKQLV8RGIW4pDFzY=;
 b=hBI26MA7WBBE1rgYlgVcHmObF/wpXgsoNEFBlFyqIYmimjsAXyY+sgN8j30KKIWOVDAgpw
 3KZKZKI490xlPhAwWwAyFuTthiF6mRomni5NS9Azd0U/U1P40rkQGnCfbj3UR8MYQKBmUU
 YeF11MSnmB7oAVHKMhMyxaHuHpZrbVs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Di6Xl8DaMwmBctiqLQFJdA-1; Wed, 18 Oct 2023 09:37:55 -0400
X-MC-Unique: Di6Xl8DaMwmBctiqLQFJdA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so43038995e9.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697636274; x=1698241074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMDcZMZnclUHY4/QlbNcyySn6eFDKQLV8RGIW4pDFzY=;
 b=c/woek0ndK+wGSRc68CfnQYYNvsLIBWonxzTyybWC4w4ZE5nyW+gusVCyfcfRtgHb6
 7fvAUhtm7QnFThbyF3nmSGc5bdYPfLMmqls6VWkzVgn+wGKHDs+JXVUhe4fjP7AC3y29
 jP4YGbSdM8dsB97xYZgiwinnRfC9nkYAZhGC10CVZDEdOKEP2C5VxPzDfxW7LY3At3R5
 TZpJTBQMtxslnrFZ894V4ljoBj12Fm/CT0g8Whx2cxoAOs/J8q4RnKKAFFOxiZg420K7
 c75D6ayjq05ltWtH38EMaVT2Qt1TkECxKVreCtjjbJrp0wJkD6E0mlezA58LDJyFm7wT
 iNIQ==
X-Gm-Message-State: AOJu0Yw5AzBq65ZRS+9V3dtDdxFOZ7YkUUc3F6MSf5N71DTiiO+cDDeg
 v3ZxTVo5P9a5W8ypm5jvQvx9ntmBOTrcHG2zAZV13jc0OKFzc7T/CzYLbrSH0GCVFrYK/f6TdbX
 uslEupk2lDJ7d
X-Received: by 2002:a05:600c:3114:b0:408:2686:e1cb with SMTP id
 g20-20020a05600c311400b004082686e1cbmr3287162wmo.23.1697636273994; 
 Wed, 18 Oct 2023 06:37:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3114:b0:408:2686:e1cb with SMTP id
 g20-20020a05600c311400b004082686e1cbmr3287138wmo.23.1697636273594; 
 Wed, 18 Oct 2023 06:37:53 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:2037:f34:d61b:7da0:a7be])
 by smtp.gmail.com with ESMTPSA id
 j6-20020adff006000000b003198a9d758dsm2139973wro.78.2023.10.18.06.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 06:37:53 -0700 (PDT)
Date: Wed, 18 Oct 2023 09:37:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
Message-ID: <20231018093723-mutt-send-email-mst@kernel.org>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
X-TUID: zVmYJHGDf8WM

On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
> This applies on top of vfio-next:
> https://github.com/legoater/qemu/, vfio-next branch

virtio things make sense

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

let me know how you want to merge all this.



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
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/vfio-next-iommu_geometry-v3
> 
> History:
> v2 -> v3:
> - rebase on top of vfio-next (including iommufd prereq)
> - take into account IOVA range info capability may not be offered by
>   old kernel and use nr_iovas = -1 to encode that [Alex]
> - use GList * everywhere instead of arrays (in the range_inverse_array)
>   with the benefice it sorts ranges retrieved from the kernel which are
>   not garanteed to be sorted. Rework the tests accordingly [Alex]
> - Make sure resv_regions GList is build before the probe() [Jean]
>   per device list is first populated with prop resv regions on
>   IOMMUDevice creation and then rebuilt on set_iova()
> - Add a warning if set_iova builds a valid list after probe was
>   called [Jean]
> - Build host windows on top of IOVA valid ranges if this info can
>   be retrieved from the kernel. As many windows are created as
>   valid ranges
> v1 -> v2:
> - Remove "[PATCH 12/13] virtio-iommu: Resize memory region according
>   to the max iova info" which causes way too much trouble: trigger
>   a coredump in vhost, causes duplication of IOMMU notifiers causing
>   EEXIST vfio_dma_map errors, ... This looks like a bad usage of the
>   memory API so I prefer removing this from this series. So I was
>   also obliged to remove the vfio_find_hostwin() check in the case
>   of an IOMMU.
> - Let range_inverse_array() take low/high args instead of hardcoding
>   0, UINT64_MAX which both complexifies the algo and the tests.
> - Move range function description in header.
> - Check that if set_iova_ranges is called several times, new resv
>   regions are included in previous ones
> 
> Eric Auger (13):
>   memory: Let ReservedRegion use Range
>   memory: Introduce memory_region_iommu_set_iova_ranges
>   vfio: Collect container iova range info
>   virtio-iommu: Rename reserved_regions into prop_resv_regions
>   range: Make range_compare() public
>   util/reserved-region: Add new ReservedRegion helpers
>   virtio-iommu: Introduce per IOMMUDevice reserved regions
>   range: Introduce range_inverse_array()
>   virtio-iommu: Record whether a probe request has been issued
>   virtio-iommu: Implement set_iova_ranges() callback
>   virtio-iommu: Consolidate host reserved regions and property set ones
>   test: Add some tests for range and resv-mem helpers
>   vfio: Remove 64-bit IOVA address space assumption
> 
>  include/exec/memory.h            |  34 +++-
>  include/hw/vfio/vfio-common.h    |   2 +
>  include/hw/virtio/virtio-iommu.h |   7 +-
>  include/qemu/range.h             |  14 ++
>  include/qemu/reserved-region.h   |  32 ++++
>  hw/core/qdev-properties-system.c |   9 +-
>  hw/vfio/common.c                 |  23 ++-
>  hw/vfio/container.c              |  67 ++++++-
>  hw/virtio/virtio-iommu-pci.c     |   8 +-
>  hw/virtio/virtio-iommu.c         | 155 +++++++++++++--
>  system/memory.c                  |  13 ++
>  tests/unit/test-resv-mem.c       | 318 +++++++++++++++++++++++++++++++
>  util/range.c                     |  61 +++++-
>  util/reserved-region.c           |  91 +++++++++
>  hw/virtio/trace-events           |   1 +
>  tests/unit/meson.build           |   1 +
>  util/meson.build                 |   1 +
>  17 files changed, 791 insertions(+), 46 deletions(-)
>  create mode 100644 include/qemu/reserved-region.h
>  create mode 100644 tests/unit/test-resv-mem.c
>  create mode 100644 util/reserved-region.c
> 
> -- 
> 2.41.0

