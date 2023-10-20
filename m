Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1175971ejb;
        Fri, 20 Oct 2023 05:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG+kzBBaADKANPBpVjRVKO0nE5LIxYuXsTpxhFcNPUPWFyn59vFV6RPA6U+BD1drwuxBka
X-Received: by 2002:a05:6214:501b:b0:66d:81bb:5234 with SMTP id jo27-20020a056214501b00b0066d81bb5234mr2395450qvb.11.1697804277947;
        Fri, 20 Oct 2023 05:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697804277; cv=none;
        d=google.com; s=arc-20160816;
        b=f5uZGDr6jYs6weNDeHQAxEyjKjdVp3+ez6yyzvyCoOeb/vnllooD0FhsrQO3zMA1h0
         Yo92bRzWBoa8VWC9iZFnY2T6+ERitz/fHZ5UQHKsrbsuTputz1IT/B+uZBznLYf4N6Bg
         sA79INGJVDdypPb3fuE2QdWbmh4IkGtsJckssgWxiaZLFdikDJE04XLLBKw/aeJMsg+f
         l+uUeQDGvIZS0IbQQBZaS95GnE9NXa8ntR5wqSvyDA4wyGqh2OiZWNqOuzFTeTSwz8KV
         NsgY2D9Z51Mwr46yTDhVCDHv+TCm+yROzWreDVKBvdyDe4stQ8T99xOgTkTfFtIrkzxX
         vZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RTaZB4aPx6HNBLmLCAMu5ymRKKq6c9/CTZq1K5Zepho=;
        fh=uphRHM8ca2tcr1D4fBCDsXgV8KB96ulu0DhY74zLvJ4=;
        b=t3aaluMJy7gUJTDaBvVU/pZ/hFXxMoun22bBE6E/r22VpQ5y7tT6Plbiq/NwpXccmB
         6qMGR2hCkTN2ggc/iKeG25TzI4g6Rbym+f2fxa9KRBH8I0UUyZX9g3WtBO0uhNlDnoZg
         KHZB+AIa3ROhVKK3U+O+NUSQBS3ItJLCIIWtosTmR6IvMqR/UY3ynQ8Uq5P0x4wjWf22
         NY9doEn8xbDhrAJ0Z411yUMCtfxvb60ZNHKPPKlSEEpzAbKOkF0mIWufGu5WZbbzR+6d
         fU2vIhc2jrCvPlO7LVkVXwsVNLaAoeV4LaAwzxJ59lE+DH6zUKg9cH3luBbrP4C8msp/
         h5nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eZFtjR8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id es16-20020a056214193000b0065af6e81f13si1221995qvb.121.2023.10.20.05.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 05:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eZFtjR8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtoRk-0005wc-6d; Fri, 20 Oct 2023 08:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtoRg-0005nN-V4
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtoRf-0007Cu-4I
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697804258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTaZB4aPx6HNBLmLCAMu5ymRKKq6c9/CTZq1K5Zepho=;
 b=eZFtjR8dqdalAXF0MgqYnqLUU8A21+rEz7ydM8n2eh5/zYXWCMic8u5c9HKTsnNss7Z/O9
 Q3NaQyKmu1hFB0JixHRUs3GSwRl9XWqEqoLQQ7rwVxHuAbuCksTWe7kPVpbPc90quWk6ra
 BgtRQ6kSu7uPjwei1zg0IJsJeeYxqUE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-tUp8pVSHMYidlFxzwt2UbQ-1; Fri, 20 Oct 2023 08:17:20 -0400
X-MC-Unique: tUp8pVSHMYidlFxzwt2UbQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-65b08994e15so12790346d6.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 05:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697804240; x=1698409040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RTaZB4aPx6HNBLmLCAMu5ymRKKq6c9/CTZq1K5Zepho=;
 b=eN1CcivFRrYDeWf4vrpzQH0c5EufQPGkBmmvlPfySJ7xGJMogys9mlQ+wNC9jfT00h
 9YGLszeQYagMhAfFbTgvA0PgMwmaG1+6e/y+WK0BG2CT7dVEOb1jXZuKr1R1tc02XvQu
 qU2g1eCLw/0U7Pjk2LZLhCF+/QIZydI0aUA+l/T6tJ+/rPywhujGvTB6L97/2k1/TGK7
 +/TpgC4riDT0MHKMad3LnXWCg55ZfFn5FeH4UieBw+I7HuUgKORcrBRPdwCtKitOpDrQ
 BqFfNQtwCilUZsDyW05OpUPVBIHFF5clGnR0NeyXtEpp1kMk4KMv06jX+pJtpPez6jh6
 xQFA==
X-Gm-Message-State: AOJu0YwRXO4IhB7Tmag0/Q3lGD+xsMxWap2apd+wumF6CLHD5IW+q3ZG
 pb6wuW1WU1oLL4IIz6ffy1JdcBY6FFxt+L84TAZjQHvbMyhB1tlHK7KC4cC0bBtFpgq9M+kRx+5
 UOC/8xdYe4PqB
X-Received: by 2002:ad4:4d43:0:b0:656:500e:7b64 with SMTP id
 m3-20020ad44d43000000b00656500e7b64mr6093827qvm.16.1697804240452; 
 Fri, 20 Oct 2023 05:17:20 -0700 (PDT)
X-Received: by 2002:ad4:4d43:0:b0:656:500e:7b64 with SMTP id
 m3-20020ad44d43000000b00656500e7b64mr6093788qvm.16.1697804240081; 
 Fri, 20 Oct 2023 05:17:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 pm10-20020ad446ca000000b0066d1f118b7esm643053qvb.1.2023.10.20.05.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 05:17:18 -0700 (PDT)
Message-ID: <50ddc7e8-e28a-428f-a2be-0e5a1d2f7038@redhat.com>
Date: Fri, 20 Oct 2023 14:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
References: <20231019134651.842175-1-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SkV8fACMq2qp

On 10/19/23 15:45, Eric Auger wrote:
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
> https://github.com/eauger/qemu/tree/iommu_geometry-v4

Applied to vfio-next.

Thanks,

C.


> 
> History:
> v3 -> v4:
> - removed nr_iovas (Alex) and droppped last patch (Alex)
> - Collected Michael's R-b, Peter's R-b and Yanghang's T-b
> 
> v2 -> v3:
> - rebase on top of vfio-next (including iommufd prereq)
> - take into account IOVA range info capability may not be offered by
>    old kernel and use nr_iovas = -1 to encode that [Alex]
> - use GList * everywhere instead of arrays (in the range_inverse_array)
>    with the benefice it sorts ranges retrieved from the kernel which are
>    not garanteed to be sorted. Rework the tests accordingly [Alex]
> - Make sure resv_regions GList is build before the probe() [Jean]
>    per device list is first populated with prop resv regions on
>    IOMMUDevice creation and then rebuilt on set_iova()
> - Add a warning if set_iova builds a valid list after probe was
>    called [Jean]
> - Build host windows on top of IOVA valid ranges if this info can
>    be retrieved from the kernel. As many windows are created as
>    valid ranges
> v1 -> v2:
> - Remove "[PATCH 12/13] virtio-iommu: Resize memory region according
>    to the max iova info" which causes way too much trouble: trigger
>    a coredump in vhost, causes duplication of IOMMU notifiers causing
>    EEXIST vfio_dma_map errors, ... This looks like a bad usage of the
>    memory API so I prefer removing this from this series. So I was
>    also obliged to remove the vfio_find_hostwin() check in the case
>    of an IOMMU.
> - Let range_inverse_array() take low/high args instead of hardcoding
>    0, UINT64_MAX which both complexifies the algo and the tests.
> - Move range function description in header.
> - Check that if set_iova_ranges is called several times, new resv
>    regions are included in previous ones
> 
> 
> Eric Auger (12):
>    memory: Let ReservedRegion use Range
>    memory: Introduce memory_region_iommu_set_iova_ranges
>    vfio: Collect container iova range info
>    virtio-iommu: Rename reserved_regions into prop_resv_regions
>    range: Make range_compare() public
>    util/reserved-region: Add new ReservedRegion helpers
>    virtio-iommu: Introduce per IOMMUDevice reserved regions
>    range: Introduce range_inverse_array()
>    virtio-iommu: Record whether a probe request has been issued
>    virtio-iommu: Implement set_iova_ranges() callback
>    virtio-iommu: Consolidate host reserved regions and property set ones
>    test: Add some tests for range and resv-mem helpers
> 
>   include/exec/memory.h            |  34 +++-
>   include/hw/vfio/vfio-common.h    |   1 +
>   include/hw/virtio/virtio-iommu.h |   7 +-
>   include/qemu/range.h             |  14 ++
>   include/qemu/reserved-region.h   |  32 ++++
>   hw/core/qdev-properties-system.c |   9 +-
>   hw/vfio/common.c                 |   9 +
>   hw/vfio/container.c              |  42 +++-
>   hw/virtio/virtio-iommu-pci.c     |   8 +-
>   hw/virtio/virtio-iommu.c         | 155 +++++++++++++--
>   system/memory.c                  |  13 ++
>   tests/unit/test-resv-mem.c       | 318 +++++++++++++++++++++++++++++++
>   util/range.c                     |  61 +++++-
>   util/reserved-region.c           |  91 +++++++++
>   hw/virtio/trace-events           |   1 +
>   tests/unit/meson.build           |   1 +
>   util/meson.build                 |   1 +
>   17 files changed, 764 insertions(+), 33 deletions(-)
>   create mode 100644 include/qemu/reserved-region.h
>   create mode 100644 tests/unit/test-resv-mem.c
>   create mode 100644 util/reserved-region.c
> 

