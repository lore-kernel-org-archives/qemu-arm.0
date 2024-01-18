Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp157933ejg;
        Thu, 18 Jan 2024 01:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkRrsBt9YY5XSYGbqiq0InCCVOdufB+BPGAecG4qqj/BDfILIpUGO5vE8p6rmMsVW0Y6U3
X-Received: by 2002:a05:6214:2262:b0:681:7814:fafe with SMTP id gs2-20020a056214226200b006817814fafemr568627qvb.118.1705571071609;
        Thu, 18 Jan 2024 01:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705571071; cv=none;
        d=google.com; s=arc-20160816;
        b=EGnMGmcJjWuOabXLcPFestVWgGpqCZdxgW7TiVq7vG9d1Vk77TsFdjYfQySRIuW2UJ
         vpfs8vCI/HiA7gRDm2qGADfsZlplTJALfk5/XBD4QcnEnWSA40Xu4G+JVsoAftUB/9gb
         FMoJcM/G0XgSplPQnRjIpQKjPeCFLw+HpW9RG/ahayedrOQDGWSfz0O5AeqcR9j00jJj
         iCFl/ZvMqimrQIHpwtGyjnlyyqAPmRylh3QaQvN+OUzpLScZw8aX/5EclWmZgZDGSCkD
         ls4vpn1IbqAIpzmBy8DkxTsx9LeLStf7Ssw4hFHZyWr5pxKDQzR+AexPW19iosrHIytM
         Gdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L1eWFuvbPN2XWYlwmX84RL9N5C6TGdAt+GZgn+IeD54=;
        fh=sc/f/APP3mEL+ybYg3pf4tL4i47+6j9QJKOr14qmIUU=;
        b=MyuhvmZT8o9tUZtsNO/7QRz28U9+HF/zxi3bZfKIycWBWnOYUWCYZFRBj+XYcB33fz
         4ENypzW5rejfLTsxNmI4xqNBicgNJZikt4Bc/a6R49ASqsSWXooBi77+juHsis1SiDkT
         BXi6VTGhs0QvSXwbCJUidU5T5SqSI1/PxtR894/TAg2OKEKt2mv1kz4mhgPQUhxLD1rP
         S/PuhM349SyomMLl5gzuTkyQgmLjwe76UUyGRy1eyO/y45K24zX0jSHD+hZG2gczSz/8
         BoUFc8QFuCjZDZNr2VUN5dgfw9JhVBAYsJG5V4iJKIIThshW1QskH11Ky7ppu2Wi29Zk
         vmLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8rZUovY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020a0c8b81000000b00681955e64bcsi438157qva.604.2024.01.18.01.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 01:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8rZUovY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQOwY-0004Yo-W4; Thu, 18 Jan 2024 04:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQOwX-0004Yf-US
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 04:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQOwS-0002Hu-6o
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 04:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705571047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1eWFuvbPN2XWYlwmX84RL9N5C6TGdAt+GZgn+IeD54=;
 b=U8rZUovY7b00hbQoLMTK5p02FfyO7Uib1FYoSeGrPVehiZUI2AYu9IX7QWyM/5AQ/h031O
 WDTW9q0TQ3dnqZI23qds4y9svNHzkObhplesVfNa1zjlE2NKkFoq2vJ9FIG3nPA4kXx6WX
 6pGYiiFiuD/QsWvswEuEpw0parEHbTw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-ibQkwOA5MpW6ksk-V1sDSQ-1; Thu, 18 Jan 2024 04:44:01 -0500
X-MC-Unique: ibQkwOA5MpW6ksk-V1sDSQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78335ae3fa8so1065447385a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jan 2024 01:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705571041; x=1706175841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L1eWFuvbPN2XWYlwmX84RL9N5C6TGdAt+GZgn+IeD54=;
 b=KPgQCz5tpTWTATEUXlWM8gqv+iJlinGpch9Bh21v4K36MCp8qG5QpS6G4uTp7M5V0D
 juPDzZ9qHk6pl78VwVwFo9FLxrpQy5TAv+BCblvlpA2kWUkG6GVn/hPCKEYtUZi4YO7Z
 yu5bnJTRKAbQC9Rhxyf632gEStjlwWQPi/FFY9M33HwYsHWrofde9h3JVYdF/ExYHZnd
 LHXbmCjjdDkwufTXhHynHFo2MCW8bW10dsq7eDPDx6NOzm7AmHgeQNj+jaNbIMJu6OiK
 5SWwltWeC2SUTzw6kFu4uK+uTfY64f95l7S8umhW1/S7KCoxoUR1u4uhRtKO9BXxT1U3
 /nLQ==
X-Gm-Message-State: AOJu0Yw28+rmtgRa2IiJ3SX0bqMS3AYQsY3A3Kojw7PBfUMX6kJPik0c
 zd/mW4b0Zy/+3UPKfT+gAkH5+E2714Xd8/x+CZfMzoQi284LPCBnzYzSN4xR9tYuLMlYg9ElU0P
 afUGlGh+rOTxTk/pQlHyWc/BXgZVpdXhVukhs/uWz6W4NjsBEOQ==
X-Received: by 2002:a37:ac0c:0:b0:783:3f20:4120 with SMTP id
 e12-20020a37ac0c000000b007833f204120mr456850qkm.86.1705571041199; 
 Thu, 18 Jan 2024 01:44:01 -0800 (PST)
X-Received: by 2002:a37:ac0c:0:b0:783:3f20:4120 with SMTP id
 e12-20020a37ac0c000000b007833f204120mr456841qkm.86.1705571040965; 
 Thu, 18 Jan 2024 01:44:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ae9e50f000000b007837a9b3590sm463258qkf.65.2024.01.18.01.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 01:43:59 -0800 (PST)
Message-ID: <7bc955a1-f58d-43b1-8e95-c452bb11f208@redhat.com>
Date: Thu, 18 Jan 2024 10:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for
 hotplugged devices
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "clg@redhat.com" <clg@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
 <SJ0PR11MB6744C50921CC63221A93C75492712@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744C50921CC63221A93C75492712@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uI7QnPBIrTB0

Hi Zhenzhong,
On 1/18/24 08:10, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Cc: mst@redhat.com; clg@redhat.com
>> Subject: [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling
>> for hotplugged devices
>>
>> In [1] we attempted to fix a case where a VFIO-PCI device protected
>> with a virtio-iommu was assigned to an x86 guest. On x86 the physical
>> IOMMU may have an address width (gaw) of 39 or 48 bits whereas the
>> virtio-iommu used to expose a 64b address space by default.
>> Hence the guest was trying to use the full 64b space and we hit
>> DMA MAP failures. To work around this issue we managed to pass
>> usable IOVA regions (excluding the out of range space) from VFIO
>> to the virtio-iommu device. This was made feasible by introducing
>> a new IOMMU Memory Region callback dubbed iommu_set_iova_regions().
>> This latter gets called when the IOMMU MR is enabled which
>> causes the vfio_listener_region_add() to be called.
>>
>> However with VFIO-PCI hotplug, this technique fails due to the
>> race between the call to the callback in the add memory listener
>> and the virtio-iommu probe request. Indeed the probe request gets
>> called before the attach to the domain. So in that case the usable
>> regions are communicated after the probe request and fail to be
>> conveyed to the guest. To be honest the problem was hinted by
>> Jean-Philippe in [1] and I should have been more careful at
>> listening to him and testing with hotplug :-(
> It looks the global virtio_iommu_config.bypass is never cleared in guest.
> When guest virtio_iommu driver enable IOMMU, should it clear this
> bypass attribute?
> If it could be cleared in viommu_probe(), then qemu will call
> virtio_iommu_set_config() then virtio_iommu_switch_address_space_all()
> to enable IOMMU MR. Then both coldplugged and hotplugged devices will work.

this field is iommu wide while the probe applies on a one device.In
general I would prefer not to be dependent on the MR enablement. We know
that the device is likely to be protected and we can collect its
requirements beforehand.
>
> Intel iommu has a similar bit in register GCMD_REG.TE, when guest
> intel_iommu driver probe set it, on qemu side, vtd_address_space_refresh_all()
> is called to enable IOMMU MRs.
interesting.

Would be curious to get Jean Philippe's pov.
>
>> For coldplugged device the technique works because we make sure all
>> the IOMMU MR are enabled once on the machine init done: 94df5b2180
>> ("virtio-iommu: Fix 64kB host page size VFIO device assignment")
>> for granule freeze. But I would be keen to get rid of this trick.
>>
>> Using an IOMMU MR Ops is unpractical because this relies on the IOMMU
>> MR to have been enabled and the corresponding vfio_listener_region_add()
>> to be executed. Instead this series proposes to replace the usage of this
>> API by the recently introduced PCIIOMMUOps: ba7d12eb8c  ("hw/pci:
>> modify
>> pci_setup_iommu() to set PCIIOMMUOps"). That way, the callback can be
>> called earlier, once the usable IOVA regions have been collected by
>> VFIO, without the need for the IOMMU MR to be enabled.
>>
>> This looks cleaner. In the short term this may also be used for
>> passing the page size mask, which would allow to get rid of the
>> hacky transient IOMMU MR enablement mentionned above.
>>
>> [1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
>>    https://lore.kernel.org/all/20231019134651.842175-1-
>> eric.auger@redhat.com/
>>
>> [2] https://lore.kernel.org/all/20230929161547.GB2957297@myrica/
>>
>> Extra Notes:
>> With that series, the reserved memory regions are communicated on time
>> so that the virtio-iommu probe request grabs them. However this is not
>> sufficient. In some cases (my case), I still see some DMA MAP failures
>> and the guest keeps on using IOVA ranges outside the geometry of the
>> physical IOMMU. This is due to the fact the VFIO-PCI device is in the
>> same iommu group as the pcie root port. Normally the kernel
>> iova_reserve_iommu_regions (dma-iommu.c) is supposed to call
>> reserve_iova()
>> for each reserved IOVA, which carves them out of the allocator. When
>> iommu_dma_init_domain() gets called for the hotplugged vfio-pci device
>> the iova domain is already allocated and set and we don't call
>> iova_reserve_iommu_regions() again for the vfio-pci device. So its
>> corresponding reserved regions are not properly taken into account.
> I suspect there is same issue with coldplugged devices. If those devices
> are in same group, get iova_reserve_iommu_regions() is only called
> for first device. But other devices's reserved regions are missed.

Correct
>
> Curious how you make passthrough device and pcie root port under same
> group.
> When I start a x86 guest with passthrough device, I see passthrough
> device and pcie root port are in different group.
>
> -[0000:00]-+-00.0
>            +-01.0
>            +-02.0
>            +-03.0-[01]----00.0
>
> /sys/kernel/iommu_groups/3/devices:
> 0000:00:03.0
> /sys/kernel/iommu_groups/7/devices:
> 0000:01:00.0
>
> My qemu cmdline:
> -device pcie-root-port,id=root0,slot=0
> -device vfio-pci,host=6f:01.0,id=vfio0,bus=root0

I just replayed the scenario:
- if you have a coldplugged vfio-pci device, the pci root port and the
passthroughed device end up in different iommu groups. On my end I use
ioh3420 but you confirmed that's the same for the generic pcie-root-port
- however if you hotplug the vfio-pci device that's a different story:
they end up in the same group. Don't ask me why. I tried with
both virtio-iommu and intel iommu and I end up with the same topology.
That looks really weird to me.

I initially thought this was an ACS issue but I am now puzzled.

Thanks!

Eric
>
> Thanks
> Zhenzhong
>
>> This is not trivial to fix because theoretically the 1st attached
>> devices could already have allocated IOVAs within the reserved regions
>> of the second device. Also we are somehow hijacking the reserved
>> memory regions to model the geometry of the physical IOMMU so not sure
>> any attempt to fix that upstream will be accepted. At the moment one
>> solution is to make sure assigned devices end up in singleton group.
>> Another solution is to work on a different approach where the gaw
>> can be passed as an option to the virtio-iommu device, similarly at
>> what is done with intel iommu.
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/hotplug-resv-rfc
>>
>>
>> Eric Auger (7):
>>  hw/pci: Introduce PCIIOMMUOps::set_host_iova_regions
>>  hw/pci: Introduce pci_device_iommu_bus
>>  vfio/pci: Pass the usable IOVA ranges through PCIIOMMUOps
>>  virtio-iommu: Implement PCIIOMMUOps set_host_resv_regions
>>  virtio-iommu: Remove the implementation of iommu_set_iova_ranges
>>  hw/vfio: Remove memory_region_iommu_set_iova_ranges() call
>>  memory: Remove IOMMU MR iommu_set_iova_range API
>>
>> include/exec/memory.h    |  32 -------
>> include/hw/pci/pci.h     |  16 ++++
>> hw/pci/pci.c             |  16 ++++
>> hw/vfio/common.c         |  10 --
>> hw/vfio/pci.c            |  27 ++++++
>> hw/virtio/virtio-iommu.c | 201 ++++++++++++++++++++-------------------
>> system/memory.c          |  13 ---
>> 7 files changed, 160 insertions(+), 155 deletions(-)
>>
>> --
>> 2.41.0

