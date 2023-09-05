Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1879255ejb;
        Tue, 5 Sep 2023 02:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZCzMPCA/p3Co9Z/uUIUTPNN31ozonN1PkDrx1auI91sUhW4kcIoJ8I3XlR7XroDxh1WTl
X-Received: by 2002:a05:622a:287:b0:410:2e51:d1e3 with SMTP id z7-20020a05622a028700b004102e51d1e3mr13959805qtw.11.1693907431288;
        Tue, 05 Sep 2023 02:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693907431; cv=none;
        d=google.com; s=arc-20160816;
        b=iBcAIGqpExQJGfMWcfArQf51KJ7LkJu2CFkf/qVNR6rl069G73qvJUy5AArbtbK5Sk
         Rc+Q2RhIMc7rtlTxHCNRVIis+RbUgDfRuJfi9rn8eXcXaALT8UFflCpBlyvZ3b6tK0P7
         igER+DUwRbgVKpX+477Qh7x+wmdltdzet91Sn0QcZKRUFwIqLEsBGY3RCT1sY1Smr6bP
         AY1vc9KGVMrS4NjpK0lfwEniI77Ajh8drbQxy8i0fhloXVgObGjBuWRf7G5iPzgTBo8V
         GFStQTXZ42du5+zsrSiTTZyrxx2jGdH4Tr3jPQYJQ/HFq5CQ+tE1M1V9rlvdSyJtUgH6
         Wi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IIyPiU3SGizoQEzrYTb1AqPw/vH1eVycuDo31fRpA9Y=;
        fh=fr1XQCbR+xrcibst/AGV7WJlE5gc9Cl+qh4ABPKBwVA=;
        b=bpSer8o8pdcO6u+BsrW0u/z51aC1sEUcXEYZgYPbO05lOBpbEe4s/IyfExfd0hMkFn
         LCK+38rFx5Ym/pn8huHY2mmLiytKD4ZCNofwOnurkd+zGYzyDSdJOnRsB6/il+PSX9oS
         AdXXL4bOMelWd1iB7CiW9G5ZycgJA2kYS6+8sXXpkO3daMzm0h5ay74HGglDWpMCWe9Z
         TGUrROG9Tp07og1kG59pxcywbjEPrpS8qf+abSmwO2N0TDciqJikjG6pa6kEKj9ifXus
         bCI4aEr0KT5Mvw4TS4gtVYdSA2ZOBJNGT6ObZ0y/bpE7bLsl7c/ZO93X/NLR3CIQLSaq
         phjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0qjYqtD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05622a064700b004109a75a018si7856892qtb.509.2023.09.05.02.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 02:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0qjYqtD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdShU-00075o-8u; Tue, 05 Sep 2023 05:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdShS-00075N-BJ
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 05:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdShO-0003Fr-14
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 05:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693907416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIyPiU3SGizoQEzrYTb1AqPw/vH1eVycuDo31fRpA9Y=;
 b=S0qjYqtDPB9o+KqLohxrvW07rUI/Q1Wr2Jvs76h+nQF6aGPWp/sSTnNWg6Ur6PMn75dhF6
 4LHc5ii+Kc1DHHU9yWTfHisVPY/rEKbDXuj+YEsA5FjzbmrCX5+n7Yqs717Qp30afNER9C
 L37PvlRo+hS1j9xzA5ekqPK8bz3cUd0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-UY1nb2j2NJmbm3linTZCfQ-1; Tue, 05 Sep 2023 05:50:15 -0400
X-MC-Unique: UY1nb2j2NJmbm3linTZCfQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31c5adb698aso1164192f8f.2
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 02:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693907414; x=1694512214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIyPiU3SGizoQEzrYTb1AqPw/vH1eVycuDo31fRpA9Y=;
 b=EH3STikrRObEQAKvueClmweEM0CKaQwy0u8HqJpn5HqYQExv1ab3SkUhbkcYszd0gq
 AC1vU3oHhFChNWeWCyWu9vYsUMmk9iQi3YMhuVMzHQnHi0DsY1Mv1rHJu1+6lhvrBqD+
 jGS/cnK5bgU8+156n0HsIFXxNFLq+SA+Gvooh5QRww9RDwvDyxEXGmQT+M1y+pGUxCri
 a2rKuCNHS3kflGcPFla2yagGtNRWdK9J00A79VAMKbhUT2W9W4WkbZZualOrnOCQ3Ykh
 gtpaNiKCM+t2fXcowpxmOCyKk5aQSIFNmSsmL2QT1PBvUC1PfQDqd5fBhJWoocyzyNJU
 lBeA==
X-Gm-Message-State: AOJu0YyDbdJVJA+G+uFga1l/r+nR1aX6/jvMrpUlEW4xdkjoi0rUL8P3
 Bar8TIZK+xaaATGjkldjqq6DxrXSgi7coc/b/RFziurU/CaFP5YYVynjdVkB9m6xFboe7aNYpKu
 GP21NoS/yughD
X-Received: by 2002:a5d:6690:0:b0:317:3deb:a899 with SMTP id
 l16-20020a5d6690000000b003173deba899mr9179636wru.1.1693907414200; 
 Tue, 05 Sep 2023 02:50:14 -0700 (PDT)
X-Received: by 2002:a5d:6690:0:b0:317:3deb:a899 with SMTP id
 l16-20020a5d6690000000b003173deba899mr9179622wru.1.1693907413886; 
 Tue, 05 Sep 2023 02:50:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d4f89000000b0031c5b380291sm17027815wru.110.2023.09.05.02.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 02:50:12 -0700 (PDT)
Message-ID: <5757bc33-fd76-345d-ca28-1aa382472b84@redhat.com>
Date: Tue, 5 Sep 2023 11:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: YangHang Liu <yanghliu@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, jean-philippe@linaro.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <CAGYh1E9+odNLWuuPQdb4RqcSh-uDHW0DiVCKVJH=oA56BqqPtw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAGYh1E9+odNLWuuPQdb4RqcSh-uDHW0DiVCKVJH=oA56BqqPtw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GDQQhaEgXxgn

Hi,

On 9/5/23 10:22, YangHang Liu wrote:
> I have runned the following two tests, but both tests failed:
> [1] start a VM with virtio-iommu + 2 ice PFs only via qemu-kvm 8.1.5
> Test result : the qemu-kvm keeps throwing the error:  VFIO_MAP_DMA
> failed: File exists. vfio_dma_map(0x56443d20fbe0, 0xffffe000, 0x1000,
> 0x7fb545709000) = -17 (File exists)
> [2] start a VM with virtio-iommu + 2 ice PFs via libvirt-9.5 + qemu-kvm 8.1.5
> Test result: the qemu-kvm core dump with
> ERROR:../qom/object.c:1198:object_unref: assertion failed: (obj->ref >
> 0). Bail out! ERROR:../qom/object.c:1198:object_unref: assertion
> failed: (obj->ref > 0)
This latter issue is introduced by patch
[PATCH 12/13] virtio-iommu: Resize memory region according to the max
iova info
and especially the call to

memory_region_set_size(&mr->parent_obj, max_iova + 1);

I don't really get why at the moment but I will investigate ... Eric

>
> After removing the 2 PF from the VM, both tests passed.
>
> Tested-by: Yanghang Liu <yanghliu@redhat.com>
>
> Best Regards,
> YangHang Liu
>
>
> On Mon, Sep 4, 2023 at 4:08 PM Eric Auger <eric.auger@redhat.com> wrote:
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
>>
>> Best Regards
>>
>> Eric
>>
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
>> --
>> 2.41.0
>>
>>

