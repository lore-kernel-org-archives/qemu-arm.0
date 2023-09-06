Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2540909ejb;
        Tue, 5 Sep 2023 23:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlwDxPg35UQ3bmybMt0HSw2+gRKvwRsH93l6vkqXVn+pGN3w2x8P0qADfkeEflBK1dIKyW
X-Received: by 2002:a05:620a:2592:b0:76c:ba61:f8b with SMTP id x18-20020a05620a259200b0076cba610f8bmr16408058qko.23.1693982440182;
        Tue, 05 Sep 2023 23:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693982440; cv=none;
        d=google.com; s=arc-20160816;
        b=CG7mjTp9jXu3NMq1B+JsiiFbd7giwlJ/psGUWBpVXQXly7rc3h6+lGuOenjzEaQtjB
         PdE113eJYic1BEs4zXorvhU1IWyqXL9MpEQJ5Ue5yosG3OnMtJE3+3LL/dPjerWDdefe
         UcO8fUErYcAv5K8eNFA+mT6ZthwKjJ6SHUIq4tGv0B7Dxhol3X/q8XtxclaxzL+6DUkL
         I6o1fvuabPaoZ9VtFvUJWVMODMNhMekjMdiOfaTZwUvWOcSP7pVgLG29MLXJkea0elsS
         c7LgaDRVveW3C0C6ukzyVkS807TyAH7WIDrIxyslHo5bIpxHvIshES2y4WFGtPtRTV0I
         RpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VWp1WBgxxC0M2B0L2AakfIxxKdTjnUzirVKKkUNtu60=;
        fh=TQ+KLaSdCJR+FnGUoED6wjJWS9ddGc6jnYmTrrAIVVA=;
        b=jJ40HH7F+Bq9AaFUFXwRBjPm9XAQ7OrZsIKs/Co/NGxrTe/jOiay4TLEOvZAsBAPPS
         COqACMVLifHMB2YhjABm3qP76tT91YM5hZIogjr8m8Y2GCqXlXkvcpn8UREABj4F70Ey
         phI3HKArxb3yzWjKJjGnKjIxWFKlWOuVfExObF5vSB86FGqe5u9FMWCP3LUI8BariuxW
         l8jUBr89HtBuFeMwKFw6G2qtF/uyeM4yEKuvi1ZBPYs8ETyCq18R621CZU/lIPS8Br59
         M+8xYkZB90u8TW9WMv6Ol32+qQmXfQJYzKC5llQggVwvN3THDDXC4D5327mmxWBTpZkq
         8nwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXKx+4Yy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a05620a425200b0076c87073a06si9597502qko.629.2023.09.05.23.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 23:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXKx+4Yy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdmDF-0003xn-P4; Wed, 06 Sep 2023 02:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdmD9-0003xK-Dj
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 02:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdmD6-0001s5-3q
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 02:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693982419;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWp1WBgxxC0M2B0L2AakfIxxKdTjnUzirVKKkUNtu60=;
 b=aXKx+4Yy662GCEG9hU7TI77q2th0pscqmGuG4lEjy0T4TLK+HCmTUI5cIGufUJMpR5bDKh
 G/pF7rZ72PV9XGeCriEMHG9fd5MDGJmI83afGVVP/xcpCifjqUkLKLHz/qLz44vKVCFMfD
 L9AofkuilT3ndl7u5+TWuQ9tX8KuG9k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-fjk-Ej9dP561J8dHC7WIGw-1; Wed, 06 Sep 2023 02:40:17 -0400
X-MC-Unique: fjk-Ej9dP561J8dHC7WIGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fef5403093so2682085e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 23:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693982417; x=1694587217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWp1WBgxxC0M2B0L2AakfIxxKdTjnUzirVKKkUNtu60=;
 b=L8lW3wNTFTs4WTdfkHGSTfLtIzM0pDliTKMUtBlD2M4qZDTY8ZdZZhLO9yQAzvlnnt
 VW6E+LC1d8q+kiHkj1pF3EZwbtIucm1XsTpy17genJRCsTlnVKq+U/Dgmu1h+R2YYsci
 txOnWbKBP7aCJT7TtYNZrwIV6XBgyaIMDQt4yI7NJ1Xmh7sVryv9TlDyoQuHfGa9b83B
 uNnqsCCNEZrz9poxNs0xn31QguLuV2uuWEPOh3wqgPUWuIeCmvTIRjv3jgdyhFQxIRae
 R8O7NiNtiSKlnM5AOGCFiLHb2xJqyq6ZkbFhe42ftp01h6OXK/OyePxzJPJ133hSEz+z
 65EA==
X-Gm-Message-State: AOJu0YyZgFrQBVS435xrPiTu96nhJH7blhU7p7yqzJ1jA+NVdtHFdJ8S
 V9jR/aYL+TZ0fQQybUOakAtAqtgzs7sU6Bzb0MUpwtheK6cThSO4gNFtMtZ4yyLV09O6b2mWXyY
 5eJt1Z+0VXM6S
X-Received: by 2002:a05:600c:4f91:b0:401:bd94:f45b with SMTP id
 n17-20020a05600c4f9100b00401bd94f45bmr1610169wmq.4.1693982416899; 
 Tue, 05 Sep 2023 23:40:16 -0700 (PDT)
X-Received: by 2002:a05:600c:4f91:b0:401:bd94:f45b with SMTP id
 n17-20020a05600c4f9100b00401bd94f45bmr1610148wmq.4.1693982416538; 
 Tue, 05 Sep 2023 23:40:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003fe26244858sm22007296wmi.46.2023.09.05.23.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 23:40:15 -0700 (PDT)
Message-ID: <157e137d-d5a5-8091-412a-da13c0e7f7b0@redhat.com>
Date: Wed, 6 Sep 2023 08:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230905115558.590ea2e5.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230905115558.590ea2e5.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tqvl+KpCRE4V

Hi Alex,

On 9/5/23 19:55, Alex Williamson wrote:
> On Mon,  4 Sep 2023 10:03:43 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> On x86, when assigning VFIO-PCI devices protected with virtio-iommu
>> we encounter the case where the guest tries to map IOVAs beyond 48b
>> whereas the physical VTD IOMMU only supports 48b. This ends up with
>> VFIO_MAP_DMA failures at qemu level because at kernel level,
>> vfio_iommu_iova_dma_valid() check returns false on vfio_map_do_map().
>>
>> This is due to the fact the virtio-iommu currently unconditionally
>> exposes an IOVA range of 64b through its config input range fields.
>>
>> This series removes this assumption by retrieving the usable IOVA
>> regions through the VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE UAPI when
>> a VFIO device is attached. This info is communicated to the
>> virtio-iommu memory region, transformed into the inversed info, ie.
>> the host reserved IOVA regions. Then those latter are combined with the
>> reserved IOVA regions set though the virtio-iommu reserved-regions
>> property. That way, the guest virtio-iommu driver, unchanged, is
>> able to probe the whole set of reserved regions and prevent any IOVA
>> belonging to those ranges from beeing used, achieving the original goal.
> Hi Eric,
>
> I don't quite follow this relative to device hotplug.  Are we
> manipulating a per-device memory region which is created at device add
> time?  Is that memory region actually shared in some cases, for instance
> if we have a PCIe-to-PCI bridge aliasing devices on the conventional
> side?  Thanks,
I agree this deserves more attention and testing in the case of hotplug
and aliasing. Wrt PCIe to PCI bridge, virtio-iommu and smmu are known to
be broken with this latter due to lack of kernel support (issue with
group probing, but this might change in the future) so this is not a
currently supported feature, as opposed to virtual intel iommu. Here I
was mostly assuming one device per container and per IOMMU MR but maybe
I have to detect & forbid more complex scenari.

Thanks

Eric
> Alex
>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/virtio-iommu_geometry_v1
>>
>> Eric Auger (13):
>>   memory: Let ReservedRegion use Range
>>   memory: Introduce memory_region_iommu_set_iova_ranges
>>   vfio: Collect container iova range info
>>   virtio-iommu: Rename reserved_regions into prop_resv_regions
>>   virtio-iommu: Introduce per IOMMUDevice reserved regions
>>   range: Introduce range_inverse_array()
>>   virtio-iommu: Implement set_iova_ranges() callback
>>   range: Make range_compare() public
>>   util/reserved-region: Add new ReservedRegion helpers
>>   virtio-iommu: Consolidate host reserved regions and property set ones
>>   test: Add some tests for range and resv-mem helpers
>>   virtio-iommu: Resize memory region according to the max iova info
>>   vfio: Remove 64-bit IOVA address space assumption
>>
>>  include/exec/memory.h            |  30 ++++-
>>  include/hw/vfio/vfio-common.h    |   2 +
>>  include/hw/virtio/virtio-iommu.h |   7 +-
>>  include/qemu/range.h             |   9 ++
>>  include/qemu/reserved-region.h   |  32 +++++
>>  hw/core/qdev-properties-system.c |   9 +-
>>  hw/vfio/common.c                 |  70 ++++++++---
>>  hw/virtio/virtio-iommu-pci.c     |   8 +-
>>  hw/virtio/virtio-iommu.c         |  85 +++++++++++--
>>  softmmu/memory.c                 |  15 +++
>>  tests/unit/test-resv-mem.c       | 198 +++++++++++++++++++++++++++++++
>>  util/range.c                     |  41 ++++++-
>>  util/reserved-region.c           |  94 +++++++++++++++
>>  hw/virtio/trace-events           |   1 +
>>  tests/unit/meson.build           |   1 +
>>  util/meson.build                 |   1 +
>>  16 files changed, 562 insertions(+), 41 deletions(-)
>>  create mode 100644 include/qemu/reserved-region.h
>>  create mode 100644 tests/unit/test-resv-mem.c
>>  create mode 100644 util/reserved-region.c
>>

