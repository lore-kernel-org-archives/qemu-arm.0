Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1599254lfp;
        Thu, 7 Oct 2021 09:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwosdI340+UbDWfOYaPBxKy0cIiGDNvFkr4qOxGJeby3I3DNqHBpXgH8IM1UVhnGsPFIR5T
X-Received: by 2002:a0c:fc43:: with SMTP id w3mr5206053qvp.46.1633625965384;
        Thu, 07 Oct 2021 09:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633625965; cv=none;
        d=google.com; s=arc-20160816;
        b=a04JI9iBlvlMjywX+OIh37Ez6ckcQXs4z1B5sc96OYCwqy0c5QAVG55HhKJnMGfJzv
         QiF3j+KriMv3GbUi3/TNBpuHageXrhtmSzFVf0R1tyAi96mSPQpnSr/6RwuZOmMCgjfB
         QIAfhVYaPfJ/D1vsL8IaIbvfBVFNutVYUZZLMq5ZE81GvkweIQplLcfNJzkYfsR6wkAl
         53ujt2Yu1AlGcmUHUsX6NBAy/tBp5c09Thfq5NH467Drzl359cRLipwc6UkdUHGiD9E+
         sGIYHWMgXMXISdIcp4V48lKcHR06ZK/p6HakD046dCDEZst/XptT3p7cDMUnVMuxwaSL
         3Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JwZTI2SvUWmWfa0LGOrbnedXPrkPps9Aj2Gc7n24qxU=;
        b=iJAhKrbqoVx0IZ2o3IOijF95JTzjHpZR5IlLl1WqPldkCuywyZAACzBlj3X/2EYPEb
         NjUP5YEFrL6+sDCVEbQgqL86pRL5k7KY8mdJKLZGZ8tWhiLiWj8B0wpkNGcsT1U5bY8w
         NioxFQlxY31MZckfZ7PnGBAR7750GUDjRCtMYv76axttj1m1kezrjv1Q5dzDZpEdIXLo
         8gj35xDuLwVNOyTKBOA82A0aWEizOzNLRXbuU+SSas0fCIEclc5p1E+agnDalbslEEjW
         qrkDKJuy/0QmwykBIkEbDCfWGMtvxBaPh5G0aJu8pBw1N2JgDDX/peUPAMv3AcePGGYB
         N3Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PxzIAcMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si10738qkc.248.2021.10.07.09.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 09:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PxzIAcMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYWjs-0006gT-QG
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 12:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYWjf-0006gD-Vd
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 12:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYWjc-0003Yb-5u
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 12:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633625947;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwZTI2SvUWmWfa0LGOrbnedXPrkPps9Aj2Gc7n24qxU=;
 b=PxzIAcMQrXjVFLOTJLMjGptkncMUJbA/Yd+eQZVRiCXwD2TRWyhKigS9nP51lYFfYwB7Wf
 J4cK6xvHwfeYZwxG6wAZWpU1Qbd0d33D8/rCTXA5zMQbBkKCCajS5VF3F+NGAyj1r9UEKv
 tUL2Wt7HcvM+GJkQFSbHbt4TaqS1TrU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-TPPeQB1YPXmyENUpS4nJUA-1; Thu, 07 Oct 2021 12:59:04 -0400
X-MC-Unique: TPPeQB1YPXmyENUpS4nJUA-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so4441730wrc.22
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 09:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=JwZTI2SvUWmWfa0LGOrbnedXPrkPps9Aj2Gc7n24qxU=;
 b=fbVQgFS4X4s0Spkd2QalIRSC6i7/W95dBgxZNPQih86cXuCAcJlP8oYZuu6AfJk+Vh
 rIJ5s2nbfFigF3DImLAcxLfN7davCBFuS5JV2Zoomba9N0aiESwqwRKwgu8DT8AIiEci
 VYsFdRhTiYg+XdzoWSnO6jqE4VZWu+YWpn+vPIlCS7lVJjegFQhhNOfPvPP25ZciTONI
 ysm6s/D68ja8yFb/Ivxj8v1J7tiIiEs+SXLE+0EsfTiIy5uJmAZw1fwRnsJTMOX0X0x8
 EH/Nidee9ezS6Fz3Tn5E3+X4NCxGsrYT2UfHmq4zO+szNTD9oJWv0pSgKPqJ807/et83
 uB7A==
X-Gm-Message-State: AOAM530aFfFuQDr7NXngpBnLRxpxiZhxfmSnm2ktY51pCHuWK4S5Qbfx
 atcBAIcgJynFrb7ap5BpDSYCU3Mg7nQ/IiviZS9oSD23NrTNIJcwgU6QdnZIRzZ+I0/nDQf3vZX
 JGuHnjtu3eRib
X-Received: by 2002:adf:c992:: with SMTP id f18mr7110546wrh.138.1633625942976; 
 Thu, 07 Oct 2021 09:59:02 -0700 (PDT)
X-Received: by 2002:adf:c992:: with SMTP id f18mr7110493wrh.138.1633625942658; 
 Thu, 07 Oct 2021 09:59:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id s14sm156041wro.76.2021.10.07.09.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 09:59:01 -0700 (PDT)
Subject: Re: [RFC v9 15/29] vfio: Set up nested stage mappings
To: Kunkun Jiang <jiangkunkun@huawei.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com
References: <20210411120912.15770-1-eric.auger@redhat.com>
 <20210411120912.15770-16-eric.auger@redhat.com>
 <cea9fd63-18d6-32c5-bed0-d8783af654ce@huawei.com>
 <a844b9fa-40e9-6443-b359-60ca7d9661aa@redhat.com>
 <b5df27a2-5f94-46fd-2c9b-8590fdb8b0a8@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7cc527b8-7a78-fc95-be5d-f9e93172339e@redhat.com>
Date: Thu, 7 Oct 2021 18:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b5df27a2-5f94-46fd-2c9b-8590fdb8b0a8@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 chenxiang66@hisilicon.com, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, vdumpa@nvidia.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 jean-philippe@linaro.org, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VDgwysQFeJoh

Hi Kunkun,

On 4/14/21 3:45 AM, Kunkun Jiang wrote:
> On 2021/4/13 20:57, Auger Eric wrote:
>> Hi Kunkun,
>>
>> On 4/13/21 2:10 PM, Kunkun Jiang wrote:
>>> Hi Eric,
>>>
>>> On 2021/4/11 20:08, Eric Auger wrote:
>>>> In nested mode, legacy vfio_iommu_map_notify cannot be used as
>>>> there is no "caching" mode and we do not trap on map.
>>>>
>>>> On Intel, vfio_iommu_map_notify was used to DMA map the RAM
>>>> through the host single stage.
>>>>
>>>> With nested mode, we need to setup the stage 2 and the stage 1
>>>> separately. This patch introduces a prereg_listener to setup
>>>> the stage 2 mapping.
>>>>
>>>> The stage 1 mapping, owned by the guest, is passed to the host
>>>> when the guest invalidates the stage 1 configuration, through
>>>> a dedicated PCIPASIDOps callback. Guest IOTLB invalidations
>>>> are cascaded downto the host through another IOMMU MR UNMAP
>>>> notifier.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> v7 -> v8:
>>>> - properly handle new IOMMUTLBEntry fields and especially
>>>>     propagate DOMAIN and PASID based invalidations
>>>>
>>>> v6 -> v7:
>>>> - remove PASID based invalidation
>>>>
>>>> v5 -> v6:
>>>> - add error_report_err()
>>>> - remove the abort in case of nested stage case
>>>>
>>>> v4 -> v5:
>>>> - use VFIO_IOMMU_SET_PASID_TABLE
>>>> - use PCIPASIDOps for config notification
>>>>
>>>> v3 -> v4:
>>>> - use iommu_inv_pasid_info for ASID invalidation
>>>>
>>>> v2 -> v3:
>>>> - use VFIO_IOMMU_ATTACH_PASID_TABLE
>>>> - new user API
>>>> - handle leaf
>>>>
>>>> v1 -> v2:
>>>> - adapt to uapi changes
>>>> - pass the asid
>>>> - pass IOMMU_NOTIFIER_S1_CFG when initializing the config notifier
>>>> ---
>>>>    hw/vfio/common.c     | 139
>>>> +++++++++++++++++++++++++++++++++++++++++--
>>>>    hw/vfio/pci.c        |  21 +++++++
>>>>    hw/vfio/trace-events |   2 +
>>>>    3 files changed, 157 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 0cd7ef2139..e369d451e7 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -595,6 +595,73 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry
>>>> *iotlb, void **vaddr,
>>>>        return true;
>>>>    }
>>>>    +/* Propagate a guest IOTLB invalidation to the host (nested
>>>> mode) */
>>>> +static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry
>>>> *iotlb)
>>>> +{
>>>> +    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
>>>> +    struct vfio_iommu_type1_cache_invalidate ustruct = {};
>>>> +    VFIOContainer *container = giommu->container;
>>>> +    int ret;
>>>> +
>>>> +    assert(iotlb->perm == IOMMU_NONE);
>>>> +
>>>> +    ustruct.argsz = sizeof(ustruct);
>>>> +    ustruct.flags = 0;
>>>> +    ustruct.info.argsz = sizeof(struct iommu_cache_invalidate_info);
>>>> +    ustruct.info.version = IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
>>>> +    ustruct.info.cache = IOMMU_CACHE_INV_TYPE_IOTLB;
>>>> +
>>>> +    switch (iotlb->granularity) {
>>>> +    case IOMMU_INV_GRAN_DOMAIN:
>>>> +        ustruct.info.granularity = IOMMU_INV_GRANU_DOMAIN;
>>>> +        break;
>>>> +    case IOMMU_INV_GRAN_PASID:
>>>> +    {
>>>> +        struct iommu_inv_pasid_info *pasid_info;
>>>> +        int archid = -1;
>>>> +
>>>> +        pasid_info = &ustruct.info.granu.pasid_info;
>>>> +        ustruct.info.granularity = IOMMU_INV_GRANU_PASID;
>>>> +        if (iotlb->flags & IOMMU_INV_FLAGS_ARCHID) {
>>>> +            pasid_info->flags |= IOMMU_INV_ADDR_FLAGS_ARCHID;
>>>> +            archid = iotlb->arch_id;
>>>> +        }
>>>> +        pasid_info->archid = archid;
>>>> +        trace_vfio_iommu_asid_inv_iotlb(archid);
>>>> +        break;
>>>> +    }
>>>> +    case IOMMU_INV_GRAN_ADDR:
>>>> +    {
>>>> +        hwaddr start = iotlb->iova + giommu->iommu_offset;
>>>> +        struct iommu_inv_addr_info *addr_info;
>>>> +        size_t size = iotlb->addr_mask + 1;
>>>> +        int archid = -1;
>>>> +
>>>> +        addr_info = &ustruct.info.granu.addr_info;
>>>> +        ustruct.info.granularity = IOMMU_INV_GRANU_ADDR;
>>>> +        if (iotlb->leaf) {
>>>> +            addr_info->flags |= IOMMU_INV_ADDR_FLAGS_LEAF;
>>>> +        }
>>>> +        if (iotlb->flags & IOMMU_INV_FLAGS_ARCHID) {
>>>> +            addr_info->flags |= IOMMU_INV_ADDR_FLAGS_ARCHID;
>>>> +            archid = iotlb->arch_id;
>>>> +        }
>>>> +        addr_info->archid = archid;
>>>> +        addr_info->addr = start;
>>>> +        addr_info->granule_size = size;
>>>> +        addr_info->nb_granules = 1;
>>>> +        trace_vfio_iommu_addr_inv_iotlb(archid, start, size,
>>>> +                                        1, iotlb->leaf);
>>>> +        break;
>>>> +    }
>>> Should we pass a size to  host kernel here, even if vSMMU doesn't
>>> support
>>> RIL or guest kernel doesn't use RIL?
>>>
>>> It will cause TLBI issue in  this scenario: Guest kernel issues a
>>> TLBI cmd
>>> without "range" (tg = 0) to invalidate a 2M huge page. Then qemu passed
>>> the iova and size (4K) to host kernel. Finally, host kernel issues a
>>> TLBI cmd
>>> with "range" (4K) which can not invalidate the TLB entry of 2M huge
>>> page.
>>> (pSMMU supports RIL)
>> In that case the guest will loop over all 4K images belonging to the 2M
>> huge page and invalidate each of them. This should turn into qemu
>> notifications for each 4kB page, no? This is totally inefficient, hence
> The guest will not loop over all 4K images belonging to the 2M huge page.
> The iommu_iotlb_gather->pgsize will be 2M, if a page is 2M huge page. The
> gather->pgsize will be passed to __arm_smmu_tlb_inv_range as "granule":
>
> iommu_iotlb_gather_add_page
>     iommu_iotlb_sync
>         domain->ops->iotlb_sync
>             arm_smmu_iotlb_sync
>                 arm_smmu_tlb_inv_range_domain
>                     __arm_smmu_tlb_inv_range
>
> In the above mentioned scenario, guest kernel will issue a TLBI cmd
> only with
> "iova" (tg = 0).

I am currently respinning the SMMU part (the rest depends on
/dev/iommu). While thinking more about this issue you reported a long
time ago (sorry), I think a guest not using RIL is problematic wrt vSMMU
integration. Your case would not work with vhost either because when you
notify vhost you need to pass an invalidation range. In this specific
case there is none passed by the guest as the INVAL CMD just contains an
iova and that's it. Hope I do not miss anything. And I cannot guess the
range size. I only have the granule size from the CD and the IOVA. So
how can I properly invalidate in the vhost case beside upgrading the API
and pass the info telling the addr range is not set and invalidate the
whole vhost cache in that case.

So I would be inclined to support a RIL only guest for nested and
globally with vhost. I can't ignore your argument that the detection of
non interoperability comes late, with the first inval with TG=0. But I
think the SMMU spec without RIL just is *not* virtualization compatible
and this was first reported in Aug 2017
(https://lkml.org/lkml/2017/8/11/428), yeah so much time spent on this
without outcome :-(. Given the nested feature timeframe, now with this
/dev/iommu redesign, can't you consider that using a guest kernel >=
5.7, featuring RIL now is acceptable.

Thanks

Eric
>
> Thanks,
> Kunkun Jiang
>> the support of RIL on guest side and QEMU device.
>>
>> What do I miss?
>>
>> Thanks
>>
>> Eric
>>> Thanks,
>>> Kunkun Jiang
>>>> +    }
>>>> +
>>>> +    ret = ioctl(container->fd, VFIO_IOMMU_CACHE_INVALIDATE,
>>>> &ustruct);
>>>> +    if (ret) {
>>>> +        error_report("%p: failed to invalidate CACHE (%d)",
>>>> container, ret);
>>>> +    }
>>>> +}
>>>> +
>>>>    static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry
>>>> *iotlb)
>>>>    {
>>>>        VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
>>>> @@ -776,6 +843,35 @@ static void
>>>> vfio_dma_unmap_ram_section(VFIOContainer *container,
>>>>        }
>>>>    }
>>>>    +static void vfio_prereg_listener_region_add(MemoryListener
>>>> *listener,
>>>> +                                            MemoryRegionSection
>>>> *section)
>>>> +{
>>>> +    VFIOContainer *container =
>>>> +        container_of(listener, VFIOContainer, prereg_listener);
>>>> +    Error *err = NULL;
>>>> +
>>>> +    if (!memory_region_is_ram(section->mr)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    vfio_dma_map_ram_section(container, section, &err);
>>>> +    if (err) {
>>>> +        error_report_err(err);
>>>> +    }
>>>> +}
>>>> +static void vfio_prereg_listener_region_del(MemoryListener *listener,
>>>> +                                     MemoryRegionSection *section)
>>>> +{
>>>> +    VFIOContainer *container =
>>>> +        container_of(listener, VFIOContainer, prereg_listener);
>>>> +
>>>> +    if (!memory_region_is_ram(section->mr)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    vfio_dma_unmap_ram_section(container, section);
>>>> +}
>>>> +
>>>>    static void vfio_listener_region_add(MemoryListener *listener,
>>>>                                         MemoryRegionSection *section)
>>>>    {
>>>> @@ -879,9 +975,10 @@ static void
>>>> vfio_listener_region_add(MemoryListener *listener,
>>>>        memory_region_ref(section->mr);
>>>>          if (memory_region_is_iommu(section->mr)) {
>>>> +        IOMMUNotify notify;
>>>>            VFIOGuestIOMMU *giommu;
>>>>            IOMMUMemoryRegion *iommu_mr =
>>>> IOMMU_MEMORY_REGION(section->mr);
>>>> -        int iommu_idx;
>>>> +        int iommu_idx, flags;
>>>>              trace_vfio_listener_region_add_iommu(iova, end);
>>>>            /*
>>>> @@ -900,8 +997,18 @@ static void
>>>> vfio_listener_region_add(MemoryListener *listener,
>>>>            llend = int128_sub(llend, int128_one());
>>>>            iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>>>>                                                         
>>>> MEMTXATTRS_UNSPECIFIED);
>>>> -        iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
>>>> -                            IOMMU_NOTIFIER_IOTLB_EVENTS,
>>>> +
>>>> +        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
>>>> +            /* IOTLB unmap notifier to propagate guest IOTLB
>>>> invalidations */
>>>> +            flags = IOMMU_NOTIFIER_UNMAP;
>>>> +            notify = vfio_iommu_unmap_notify;
>>>> +        } else {
>>>> +            /* MAP/UNMAP IOTLB notifier */
>>>> +            flags = IOMMU_NOTIFIER_IOTLB_EVENTS;
>>>> +            notify = vfio_iommu_map_notify;
>>>> +        }
>>>> +
>>>> +        iommu_notifier_init(&giommu->n, notify, flags,
>>>>                                section->offset_within_region,
>>>>                                int128_get64(llend),
>>>>                                iommu_idx);
>>>> @@ -921,7 +1028,9 @@ static void
>>>> vfio_listener_region_add(MemoryListener *listener,
>>>>                goto fail;
>>>>            }
>>>>            QLIST_INSERT_HEAD(&container->giommu_list, giommu,
>>>> giommu_next);
>>>> -        memory_region_iommu_replay(giommu->iommu, &giommu->n);
>>>> +        if (flags & IOMMU_NOTIFIER_MAP) {
>>>> +            memory_region_iommu_replay(giommu->iommu, &giommu->n);
>>>> +        }
>>>>              return;
>>>>        }
>>>> @@ -1205,10 +1314,16 @@ static const MemoryListener
>>>> vfio_memory_listener = {
>>>>        .log_sync = vfio_listener_log_sync,
>>>>    };
>>>>    +static MemoryListener vfio_memory_prereg_listener = {
>>>> +    .region_add = vfio_prereg_listener_region_add,
>>>> +    .region_del = vfio_prereg_listener_region_del,
>>>> +};
>>>> +
>>>>    static void vfio_listener_release(VFIOContainer *container)
>>>>    {
>>>>        memory_listener_unregister(&container->listener);
>>>> -    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>>>> +    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU ||
>>>> +        container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
>>>>            memory_listener_unregister(&container->prereg_listener);
>>>>        }
>>>>    }
>>>> @@ -1858,6 +1973,20 @@ static int vfio_connect_container(VFIOGroup
>>>> *group, AddressSpace *as,
>>>>                vfio_get_iommu_info_migration(container, info);
>>>>            }
>>>>            g_free(info);
>>>> +
>>>> +        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
>>>> +            container->prereg_listener = vfio_memory_prereg_listener;
>>>> +            memory_listener_register(&container->prereg_listener,
>>>> +                                     &address_space_memory);
>>>> +            if (container->error) {
>>>> +               
>>>> memory_listener_unregister(&container->prereg_listener);
>>>> +                ret = -1;
>>>> +                error_propagate_prepend(errp, container->error,
>>>> +                                    "RAM memory listener
>>>> initialization failed "
>>>> +                                    "for container");
>>>> +                goto free_container_exit;
>>>> +            }
>>>> +        }
>>>>            break;
>>>>        }
>>>>        case VFIO_SPAPR_TCE_v2_IOMMU:
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 5c65aa0a98..cad7deec71 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -2773,6 +2773,25 @@ static void
>>>> vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>>>>        vdev->req_enabled = false;
>>>>    }
>>>>    +static int vfio_iommu_set_pasid_table(PCIBus *bus, int32_t devfn,
>>>> +                                      IOMMUConfig *config)
>>>> +{
>>>> +    PCIDevice *pdev = bus->devices[devfn];
>>>> +    VFIOPCIDevice *vdev = DO_UPCAST(VFIOPCIDevice, pdev, pdev);
>>>> +    VFIOContainer *container = vdev->vbasedev.group->container;
>>>> +    struct vfio_iommu_type1_set_pasid_table info;
>>>> +
>>>> +    info.argsz = sizeof(info);
>>>> +    info.flags = VFIO_PASID_TABLE_FLAG_SET;
>>>> +    memcpy(&info.config, &config->pasid_cfg,
>>>> sizeof(config->pasid_cfg));
>>>> +
>>>> +    return ioctl(container->fd, VFIO_IOMMU_SET_PASID_TABLE, &info);
>>>> +}
>>>> +
>>>> +static PCIPASIDOps vfio_pci_pasid_ops = {
>>>> +    .set_pasid_table = vfio_iommu_set_pasid_table,
>>>> +};
>>>> +
>>>>    static void vfio_realize(PCIDevice *pdev, Error **errp)
>>>>    {
>>>>        VFIOPCIDevice *vdev = VFIO_PCI(pdev);
>>>> @@ -3084,6 +3103,8 @@ static void vfio_realize(PCIDevice *pdev, Error
>>>> **errp)
>>>>        vfio_register_req_notifier(vdev);
>>>>        vfio_setup_resetfn_quirk(vdev);
>>>>    +    pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
>>>> +
>>>>        return;
>>>>      out_deregister:
>>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>>> index 936d29d150..43696afc15 100644
>>>> --- a/hw/vfio/trace-events
>>>> +++ b/hw/vfio/trace-events
>>>> @@ -120,6 +120,8 @@ vfio_region_sparse_mmap_header(const char *name,
>>>> int index, int nr_areas) "Devic
>>>>    vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned
>>>> long end) "sparse entry %d [0x%lx - 0x%lx]"
>>>>    vfio_get_dev_region(const char *name, int index, uint32_t type,
>>>> uint32_t subtype) "%s index %d, %08x/%0x8"
>>>>    vfio_dma_unmap_overflow_workaround(void) ""
>>>> +vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size,
>>>> uint64_t nb_granules, bool leaf) "nested IOTLB invalidate asid=%d,
>>>> addr=0x%"PRIx64" granule_size=0x%"PRIx64" nb_granules=0x%"PRIx64"
>>>> leaf=%d"
>>>> +vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=%d"
>>>>      # platform.c
>>>>    vfio_platform_base_device_init(char *name, int groupid) "%s belongs
>>>> to group #%d"
>>>
>>>
>> .
>
>

