Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp374983ejb;
        Thu, 19 Oct 2023 02:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4oPUZVVvtvAQP4eUuA+s+smT8mlLSuvy/++bWjZxsbbtAqxU7K8axeCvNoL/nUM0e4aHb
X-Received: by 2002:a05:620a:480e:b0:76f:c24:5450 with SMTP id eb14-20020a05620a480e00b0076f0c245450mr1470521qkb.2.1697706556755;
        Thu, 19 Oct 2023 02:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697706556; cv=none;
        d=google.com; s=arc-20160816;
        b=FI6XWyDyYpAz/Ia1+/9cd8MYB55szigXe8DHgpVhmeh43Q8DF8oy9pTRDzvToAhnZN
         guZ95jD51v6vh7ew7W1JbJ0TbBqMRtXF9Vei7O8nrSONPKbhaV6HAJXEN3xHcyB81GLy
         ZETkB9yQnfnRBqzmgdkQTqvJT2SJzMjkfz+ICvRf6DfSpjpRK+HU9skWUps6iUIp4vbZ
         Tqtlp/oZjTqIYmu7g+As0oeI4FxV9iXSQtXXSWvpM5H39EByI2Dj5Mq2tUoaqDVy6jmS
         ANIYUrDXKY9zG2/XMClPkB6OCj5ZdjdXzudjBwq6mE3sV7ubeYr6JRlYrX1MvEqaFuPf
         STIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=N/z1I0ylIJw50aHzPHcMkmdZpiWFexCXt2jMAaP8v3o=;
        fh=4otowI09ZafAs9NIzitnVZxI1AzZKU54Gz0crtGohCw=;
        b=RweSbVautXxAS9HatPEmlIq4P1mjUmEtwtjcmgtfBeiC4khzskH1FDWSCipYS8eGF4
         98vtoM5d8kcK5oakGM1S3N//nonH6B70dzoFRoBBEsNLA/VY/rtacgWyAVx2W56vLfjx
         MtowiOu0K/dYtBuE5a8RSKfNnv3dRNPAzJlZyZqsT1fGrxD5PnXTE08nTxjJQkJRX/vv
         /UJhHbeZHyNuImZ0UFqoaqqUr/f+eLZADkVndrWFMASV/b6izQDP/Yj91pJHH4BzDnyJ
         YzAAk6pmgjXBJ0+/H37lNZEGdqbVSHEAau905ebGW0XANCx+acHZcYkMshHDpVYaEwaR
         YWPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8gOIt56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u26-20020a05620a085a00b007783026be9esi1183140qku.621.2023.10.19.02.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 02:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8gOIt56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtP1X-0001Mq-GZ; Thu, 19 Oct 2023 05:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtP1W-0001LL-0U
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 05:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtP1U-0000rY-5D
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 05:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697706535;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/z1I0ylIJw50aHzPHcMkmdZpiWFexCXt2jMAaP8v3o=;
 b=g8gOIt56tLRbVS0oZCV8rK9DO+HSP0Y0n0f4r2RUiE3Fh0/lMeIrMSkE8N3wDmZ7ZJ6CaV
 KXrxEZpjMpcLgfLdYxEDTQx4izGw5ZCtywbZb6mXOICewl7sGzmOqZfhdANy5vtjDnn1JP
 XgavbjZFWBaqzWGzIOBXlAIKodJEnqs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-4Bf4eeQiM3C8BIKWH2gh-Q-1; Thu, 19 Oct 2023 05:08:54 -0400
X-MC-Unique: 4Bf4eeQiM3C8BIKWH2gh-Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7788fa5f1b0so232866385a.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 02:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697706533; x=1698311333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/z1I0ylIJw50aHzPHcMkmdZpiWFexCXt2jMAaP8v3o=;
 b=rlVZ7K3Ca8seZY0jFHtzWza1YOhCkbceGMyuA3/PMJmKwWRUCQzw+Bkq1IKOuejqtP
 JoW5OQ5yXur7ojhhhWmbyLSpZWWsi2//QYtU5VulcgQO/ZlJVq07IgGmRQ6aX1udEB5f
 m7dnPY3S4AgR/JHi9WXFcVCGrhmG7HIxDAf1Q31HwAIBmn38KEhZQ/MFMp1eC0b81FF+
 79KErpQLyQbwlT5hRyTW97yeAhdcaIhiR/4KHeB2o+jiCUMi5Pkl3HlhUoquwV+bcf0H
 XSVhC4PaPCreYlLNAMbeLf0rQDb2ui9b7S4SHC9+Y18ZbV7GjyCcNw7JZ2GTwuOTRq3u
 KrVA==
X-Gm-Message-State: AOJu0YyYhrroR/L3Jz06BnhJM2bfnrBJlQW4wWr+r0MarFfVFj8GYBDS
 7aQO8iJihxVJ/c25oOgLRGuY0sc+JOHLPE5g0JF51Lw7AZAQzGBWtXrwOILnZ/+EQbupvrr3WEy
 Nitxfv9mAolWr
X-Received: by 2002:a05:620a:40c7:b0:774:3540:89ee with SMTP id
 g7-20020a05620a40c700b00774354089eemr1688774qko.61.1697706533626; 
 Thu, 19 Oct 2023 02:08:53 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:774:3540:89ee with SMTP id
 g7-20020a05620a40c700b00774354089eemr1688747qko.61.1697706533272; 
 Thu, 19 Oct 2023 02:08:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bl11-20020a05620a1a8b00b00773fe8971bbsm601781qkb.90.2023.10.19.02.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 02:08:52 -0700 (PDT)
Message-ID: <6cdab5cf-fab5-09c7-9740-d7383a845f0e@redhat.com>
Date: Thu, 19 Oct 2023 11:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: YangHang Liu <yanghliu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, zhenzhong.duan@intel.com,
 yi.l.liu@intel.com
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231018093723-mutt-send-email-mst@kernel.org>
 <CAGYh1E_RQOWkDP+rxfTV-AoVekw_SpuOxOVCZ0V7Gj+keZWXLw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAGYh1E_RQOWkDP+rxfTV-AoVekw_SpuOxOVCZ0V7Gj+keZWXLw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-TUID: LVPLPQ1oCZ4I

Hi Yanghang,

On 10/19/23 11:07, YangHang Liu wrote:
> The original issue I found : After starting a VM which has two ice PFs
> and a virtio-iommu device, qemu-kvm and VM guest dmesg throw lots of
> duplicate VFIO_MAP_DMA errors
>
> After testing with Eric's build, the  original issue is gone and the
> Tier1 regression test against ice PF and virtio iommu device gets PASS
> as well.
>
> Tested-by: Yanghang Liu <yanghliu@redhat.com>

Thank you for testing!

Eric
>
>
> On Wed, Oct 18, 2023 at 9:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
>>> This applies on top of vfio-next:
>>> https://github.com/legoater/qemu/, vfio-next branch
>> virtio things make sense
>>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> let me know how you want to merge all this.
>>
>>
>>
>>> On x86, when assigning VFIO-PCI devices protected with virtio-iommu
>>> we encounter the case where the guest tries to map IOVAs beyond 48b
>>> whereas the physical VTD IOMMU only supports 48b. This ends up with
>>> VFIO_MAP_DMA failures at qemu level because at kernel level,
>>> vfio_iommu_iova_dma_valid() check returns false on vfio_map_do_map().
>>>
>>> This is due to the fact the virtio-iommu currently unconditionally
>>> exposes an IOVA range of 64b through its config input range fields.
>>>
>>> This series removes this assumption by retrieving the usable IOVA
>>> regions through the VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE UAPI when
>>> a VFIO device is attached. This info is communicated to the
>>> virtio-iommu memory region, transformed into the inversed info, ie.
>>> the host reserved IOVA regions. Then those latter are combined with the
>>> reserved IOVA regions set though the virtio-iommu reserved-regions
>>> property. That way, the guest virtio-iommu driver, unchanged, is
>>> able to probe the whole set of reserved regions and prevent any IOVA
>>> belonging to those ranges from beeing used, achieving the original goal.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/vfio-next-iommu_geometry-v3
>>>
>>> History:
>>> v2 -> v3:
>>> - rebase on top of vfio-next (including iommufd prereq)
>>> - take into account IOVA range info capability may not be offered by
>>>   old kernel and use nr_iovas = -1 to encode that [Alex]
>>> - use GList * everywhere instead of arrays (in the range_inverse_array)
>>>   with the benefice it sorts ranges retrieved from the kernel which are
>>>   not garanteed to be sorted. Rework the tests accordingly [Alex]
>>> - Make sure resv_regions GList is build before the probe() [Jean]
>>>   per device list is first populated with prop resv regions on
>>>   IOMMUDevice creation and then rebuilt on set_iova()
>>> - Add a warning if set_iova builds a valid list after probe was
>>>   called [Jean]
>>> - Build host windows on top of IOVA valid ranges if this info can
>>>   be retrieved from the kernel. As many windows are created as
>>>   valid ranges
>>> v1 -> v2:
>>> - Remove "[PATCH 12/13] virtio-iommu: Resize memory region according
>>>   to the max iova info" which causes way too much trouble: trigger
>>>   a coredump in vhost, causes duplication of IOMMU notifiers causing
>>>   EEXIST vfio_dma_map errors, ... This looks like a bad usage of the
>>>   memory API so I prefer removing this from this series. So I was
>>>   also obliged to remove the vfio_find_hostwin() check in the case
>>>   of an IOMMU.
>>> - Let range_inverse_array() take low/high args instead of hardcoding
>>>   0, UINT64_MAX which both complexifies the algo and the tests.
>>> - Move range function description in header.
>>> - Check that if set_iova_ranges is called several times, new resv
>>>   regions are included in previous ones
>>>
>>> Eric Auger (13):
>>>   memory: Let ReservedRegion use Range
>>>   memory: Introduce memory_region_iommu_set_iova_ranges
>>>   vfio: Collect container iova range info
>>>   virtio-iommu: Rename reserved_regions into prop_resv_regions
>>>   range: Make range_compare() public
>>>   util/reserved-region: Add new ReservedRegion helpers
>>>   virtio-iommu: Introduce per IOMMUDevice reserved regions
>>>   range: Introduce range_inverse_array()
>>>   virtio-iommu: Record whether a probe request has been issued
>>>   virtio-iommu: Implement set_iova_ranges() callback
>>>   virtio-iommu: Consolidate host reserved regions and property set ones
>>>   test: Add some tests for range and resv-mem helpers
>>>   vfio: Remove 64-bit IOVA address space assumption
>>>
>>>  include/exec/memory.h            |  34 +++-
>>>  include/hw/vfio/vfio-common.h    |   2 +
>>>  include/hw/virtio/virtio-iommu.h |   7 +-
>>>  include/qemu/range.h             |  14 ++
>>>  include/qemu/reserved-region.h   |  32 ++++
>>>  hw/core/qdev-properties-system.c |   9 +-
>>>  hw/vfio/common.c                 |  23 ++-
>>>  hw/vfio/container.c              |  67 ++++++-
>>>  hw/virtio/virtio-iommu-pci.c     |   8 +-
>>>  hw/virtio/virtio-iommu.c         | 155 +++++++++++++--
>>>  system/memory.c                  |  13 ++
>>>  tests/unit/test-resv-mem.c       | 318 +++++++++++++++++++++++++++++++
>>>  util/range.c                     |  61 +++++-
>>>  util/reserved-region.c           |  91 +++++++++
>>>  hw/virtio/trace-events           |   1 +
>>>  tests/unit/meson.build           |   1 +
>>>  util/meson.build                 |   1 +
>>>  17 files changed, 791 insertions(+), 46 deletions(-)
>>>  create mode 100644 include/qemu/reserved-region.h
>>>  create mode 100644 tests/unit/test-resv-mem.c
>>>  create mode 100644 util/reserved-region.c
>>>
>>> --
>>> 2.41.0
>>

