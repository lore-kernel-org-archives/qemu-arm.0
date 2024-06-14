Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp102570ejb;
        Fri, 14 Jun 2024 00:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqz2eOPiXPTnPz3xyZvB+jRAIhm7BURur7UeJ4FlWj31GdDRr0hsnQCLa8g0qyRQ1Ln3UFcHhDs5ji0G20JxODYgSxCm0x
X-Google-Smtp-Source: AGHT+IEtrd4Zzk9Gnnb3gz6RNBsyjqU4BgChCBB6aXIUJYxbdcza2pb1qKGVlCeA/deOElm2uPT9
X-Received: by 2002:a05:620a:244f:b0:795:575c:5bc2 with SMTP id af79cd13be357-798d26afac0mr192423585a.67.1718351793732;
        Fri, 14 Jun 2024 00:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718351793; cv=none;
        d=google.com; s=arc-20160816;
        b=yGjw0gKfOxaEpjgDKystLCS13gwwyqK31vvOuoFWTVnBEGC4eLpYOOOADobhus7e9g
         GoyUL7or5CkMl+H5eBdPWUCbadL8xDVsds/3UldVStrwlwErfezULKLmuF/pO7rD2zRC
         9vb8qTGB8a72BYC6PAQwAKPsmMfXxIB4tTyk/TZPkXqdSf2MUgoTPrYXwO5ZUeZ9Cf/R
         YH6AE2X/wo6dnPkFvJXp2Z9def1ZU6pLHpt5qoylgYnfudg8UiLUvVZ6OTPMoqmVPCdi
         JE/B0K9OMa9G72rAcPKCaVxKwyGd9+Y3dnN3VoEjGIKoAc1m9U8IHzoHasQwOGLPZHxW
         dFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gqBRG+wW+5VhbP/NWpa9NbzE0goGCigFoBLsRnZnWDE=;
        fh=AQGa56iBTrov6VsvQyoriYJkWLa2HOEM7JUtDV5f3kI=;
        b=o8sg23pjhpu2y/2YYu3/KXZfQzC0LNOmFmwxquAlYlQVCZRMb5KyyqN3YSm/ahgtVd
         d12qHwVDadNgNWJANAZ19tr4JuWcwMKkalLps18au0yktEh84ZzZPeidnwdiPNXbPk4p
         6L3CPT3CQQ/Cr8wjMV3u7yF+Jfu8PUx9g7B8WY4H8Gyl7f4HnuKxv1MPqkF92HRsNzRD
         eJ3I3KOZIl7p3TnosKpZRI0g+/xzznquhXq3w+xqm0nAL/0X2w2kxCKsfxnk0kTr/huE
         E1AX7REDHvlF8V1coWMIyW+gfODyhefKgm+xl4OT+pv1kWtWLCIWBt/SOhSeLCulLQVH
         ybiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FoDD7wA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab9f978fsi316194085a.237.2024.06.14.00.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FoDD7wA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1nG-0004Lm-MO; Fri, 14 Jun 2024 03:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI1nF-0004La-T8
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI1nE-0005yF-0d
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718351775;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqBRG+wW+5VhbP/NWpa9NbzE0goGCigFoBLsRnZnWDE=;
 b=FoDD7wA+B2M9/0BCXToDzWNzC7Dn0HWBiM2rusaCPEK2ySCfRcsuKIbeaHYktTRQzpfSqz
 /UjZVGAqXwV6Wh75OA6L0a5D3cmguz0euvhQW8GOgjzbm0G0NnCaTPEwfrBXIcLrCekdru
 VF2MG/XLWDsuj3dF+/rgHM4oAATkQCU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-nSUJOsc-MvSN58Sg6_s5fA-1; Fri, 14 Jun 2024 03:56:14 -0400
X-MC-Unique: nSUJOsc-MvSN58Sg6_s5fA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4229a964745so11735055e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2024 00:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718351773; x=1718956573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqBRG+wW+5VhbP/NWpa9NbzE0goGCigFoBLsRnZnWDE=;
 b=VpNfaK+qaWffypmjAgf6Z8O3X5uiF8NpSPmKSnIV8yRzI1uO79t6GcXpFqGaZqzofz
 JV3HWjEgpJpT+ddcxMRdDvcA2mMLEYUhmESp/kOH46UmcggSTorXrDvJlTTTQE5D5Uuz
 zzE738I8itqWdfOic7WreChyCqOg0pAgKUwib+j69Ahr+GwA/5mP77Vmdk7PDCERYhl4
 vn4MwsgMnVQxPe6HTg2Bsu+knVhTRhiSITUin1XYafDra3OtDrpH0WHMGPfzNJUXHACI
 QtRDPp4gfDByULW20bY7q9JgGeZK3gOekFtIqJZT5OtHkrH3BxpEh1LSJlfHX99zsfd4
 /qXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjyQvARaUl8ZkH/2Z2CkbKQ+IoLNAn72MZnpxklrkEAWWUuHO/9DnRLJ1+/Hy3DfQ4uzm2+HirCSDiucUxJBycaeBw
X-Gm-Message-State: AOJu0YyiDTN5Y9+W8cRchlzbAZtIvoJYT/WEgt/6FnKwKdDgZFfS3WIJ
 9BXiRLt/cJlFuoqUA5yTMlWp7w90hPfXbIktaG0YiZAMk4k0t6mWCNwXcb30F1/XykSd966zYy/
 ZNDi+GNrVMWwdKK6h2dc5y/z4Pa+mYwaTpeb04U1cZhKoMbRoSw==
X-Received: by 2002:a05:600c:35c1:b0:422:4fcd:d4b9 with SMTP id
 5b1f17b1804b1-42305e710d0mr7768895e9.29.1718351772808; 
 Fri, 14 Jun 2024 00:56:12 -0700 (PDT)
X-Received: by 2002:a05:600c:35c1:b0:422:4fcd:d4b9 with SMTP id
 5b1f17b1804b1-42305e710d0mr7768725e9.29.1718351772407; 
 Fri, 14 Jun 2024 00:56:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602ee95sm51293605e9.13.2024.06.14.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 00:56:11 -0700 (PDT)
Message-ID: <c66c9f2a-2259-4f2f-afb7-3fad718cc8f2@redhat.com>
Date: Fri, 14 Jun 2024 09:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] virtio-iommu: Compute host reserved regions
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
 <20240613092359.847145-5-eric.auger@redhat.com>
 <SJ0PR11MB6744A08077F63B0E4535D97292C12@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <107a70a8-b75f-48bb-8df2-7d779b7e889a@redhat.com>
 <SJ0PR11MB67442EC0B322352072F228B392C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67442EC0B322352072F228B392C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4N+YRKrIKKt1



On 6/14/24 05:05, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: Re: [PATCH v3 4/7] virtio-iommu: Compute host reserved regions
>>
>>
>>
>> On 6/13/24 12:00, Duan, Zhenzhong wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Subject: [PATCH v3 4/7] virtio-iommu: Compute host reserved regions
>>>>
>>>> Compute the host reserved regions in virtio_iommu_set_iommu_device().
>>>> The usable IOVA regions are retrieved from the HOSTIOMMUDevice.
>>>> The virtio_iommu_set_host_iova_ranges() helper turns usable regions
>>>> into complementary reserved regions while testing the inclusion
>>>> into existing ones. virtio_iommu_set_host_iova_ranges() reuse the
>>>> implementation of virtio_iommu_set_iova_ranges() which will be
>>>> removed in subsequent patches. rebuild_resv_regions() is just moved.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> - added g_assert(!sdev->probe_done)
>>>> ---
>>>> hw/virtio/virtio-iommu.c | 146 ++++++++++++++++++++++++++++++----
>> ----
>>>> -
>>>> 1 file changed, 112 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>>> index db842555c8..04474ebd74 100644
>>>> --- a/hw/virtio/virtio-iommu.c
>>>> +++ b/hw/virtio/virtio-iommu.c
>>>> @@ -498,12 +498,109 @@ get_host_iommu_device(VirtIOIOMMU
>>>> *viommu, PCIBus *bus, int devfn) {
>>>>     return g_hash_table_lookup(viommu->host_iommu_devices, &key);
>>>> }
>>>>
>>>> +/**
>>>> + * rebuild_resv_regions: rebuild resv regions with both the
>>>> + * info of host resv ranges and property set resv ranges
>>>> + */
>>>> +static int rebuild_resv_regions(IOMMUDevice *sdev)
>>>> +{
>>>> +    GList *l;
>>>> +    int i = 0;
>>>> +
>>>> +    /* free the existing list and rebuild it from scratch */
>>>> +    g_list_free_full(sdev->resv_regions, g_free);
>>>> +    sdev->resv_regions = NULL;
>>>> +
>>>> +    /* First add host reserved regions if any, all tagged as RESERVED */
>>>> +    for (l = sdev->host_resv_ranges; l; l = l->next) {
>>>> +        ReservedRegion *reg = g_new0(ReservedRegion, 1);
>>>> +        Range *r = (Range *)l->data;
>>>> +
>>>> +        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
>>>> +        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
>>>> +        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions,
>> reg);
>>>> +        trace_virtio_iommu_host_resv_regions(sdev-
>>>>> iommu_mr.parent_obj.name, i,
>>>> +                                             range_lob(&reg->range),
>>>> +                                             range_upb(&reg->range));
>>>> +        i++;
>>>> +    }
>>>> +    /*
>>>> +     * then add higher priority reserved regions set by the machine
>>>> +     * through properties
>>>> +     */
>>>> +    add_prop_resv_regions(sdev);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus
>>>> *bus,
>>>> +                                             int devfn, GList *iova_ranges,
>>>> +                                             Error **errp)
>>>> +{
>>>> +    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
>>> Here the bus/devfn parameters are real device BDF not aliased one,
>>> But used to index s->as_by_busptr which expect aliased bus/devfn.
>>>
>>> Do we need a translation of bus/devfn?
>> Hum that's a good point actually. I need to further study that. that's
>> not easy to translate, is it?
> Yes, may need a path to call into pci_device_get_iommu_bus_devfn().
> Maybe a new HostIOMMUDevice callback.
>
>> Now I am not totally sure why we don't use the alias as well for
>> HostIOMMUDevices or at least store the aliased bdf.
> Because we need to store HostIOMMUDevice in vIOMMU in real bdf granularity,
> Not aliased bdf granularity. Virtual vtd calls VFIO device uAPI on real device not
> the aliased device, i.e., VFIO_DEVICE_[ATTACH|DETACH]_IOMMUFD_PT.
>
> I also have a question, could we define host_resv_ranges in VirtioHostIOMMUDevice
> to avoid translation?
well reserved iova regions are rather associated to iommu groups
(associated to the concept of alias bdfs), no? Also potentially emulated
devices could expose some.

Eric
>
> Thanks
> Zhenzhong
>
>> Thanks
>>
>> Eric
>>> Thanks
>>> Zhenzhong
>>>
>>>> +    IOMMUDevice *sdev;
>>>> +    GList *current_ranges;
>>>> +    GList *l, *tmp, *new_ranges = NULL;
>>>> +    int ret = -EINVAL;
>>>> +
>>>> +    if (!sbus) {
>>>> +        error_report("%s no sbus", __func__);
>>>> +    }
>>>> +
>>>> +    sdev = sbus->pbdev[devfn];
>>>> +
>>>> +    current_ranges = sdev->host_resv_ranges;
>>>> +
>>>> +    g_assert(!sdev->probe_done);
>>>> +
>>>> +    /* check that each new resv region is included in an existing one */
>>>> +    if (sdev->host_resv_ranges) {
>>>> +        range_inverse_array(iova_ranges,
>>>> +                            &new_ranges,
>>>> +                            0, UINT64_MAX);
>>>> +
>>>> +        for (tmp = new_ranges; tmp; tmp = tmp->next) {
>>>> +            Range *newr = (Range *)tmp->data;
>>>> +            bool included = false;
>>>> +
>>>> +            for (l = current_ranges; l; l = l->next) {
>>>> +                Range * r = (Range *)l->data;
>>>> +
>>>> +                if (range_contains_range(r, newr)) {
>>>> +                    included = true;
>>>> +                    break;
>>>> +                }
>>>> +            }
>>>> +            if (!included) {
>>>> +                goto error;
>>>> +            }
>>>> +        }
>>>> +        /* all new reserved ranges are included in existing ones */
>>>> +        ret = 0;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    range_inverse_array(iova_ranges,
>>>> +                        &sdev->host_resv_ranges,
>>>> +                        0, UINT64_MAX);
>>>> +    rebuild_resv_regions(sdev);
>>>> +
>>>> +    return 0;
>>>> +error:
>>>> +    error_setg(errp, "%s Conflicting host reserved ranges set!",
>>>> +               __func__);
>>>> +out:
>>>> +    g_list_free_full(new_ranges, g_free);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque,
>>>> int devfn,
>>>>                                           HostIOMMUDevice *hiod, Error **errp)
>>>> {
>>>>     VirtIOIOMMU *viommu = opaque;
>>>>     VirtioHostIOMMUDevice *vhiod;
>>>> +    HostIOMMUDeviceClass *hiodc =
>>>> HOST_IOMMU_DEVICE_GET_CLASS(hiod);
>>>>     struct hiod_key *new_key;
>>>> +    GList *host_iova_ranges = NULL;
>>>>
>>>>     assert(hiod);
>>>>
>>>> @@ -513,6 +610,20 @@ static bool
>>>> virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>>>>         return false;
>>>>     }
>>>>
>>>> +    if (hiodc->get_iova_ranges) {
>>>> +        int ret;
>>>> +        host_iova_ranges = hiodc->get_iova_ranges(hiod, errp);
>>>> +        if (!host_iova_ranges) {
>>>> +            return true; /* some old kernels may not support that capability
>> */
>>>> +        }
>>>> +        ret = virtio_iommu_set_host_iova_ranges(viommu, bus, devfn,
>>>> +                                                host_iova_ranges, errp);
>>>> +        if (ret) {
>>>> +            g_list_free_full(host_iova_ranges, g_free);
>>>> +            return false;
>>>> +        }
>>>> +    }
>>>> +
>>>>     vhiod = g_malloc0(sizeof(VirtioHostIOMMUDevice));
>>>>     vhiod->bus = bus;
>>>>     vhiod->devfn = (uint8_t)devfn;
>>>> @@ -525,6 +636,7 @@ static bool
>>>> virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>>>>
>>>>     object_ref(hiod);
>>>>     g_hash_table_insert(viommu->host_iommu_devices, new_key, vhiod);
>>>> +    g_list_free_full(host_iova_ranges, g_free);
>>>>
>>>>     return true;
>>>> }
>>>> @@ -1246,40 +1358,6 @@ static int
>>>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>>>     return 0;
>>>> }
>>>>
>>>> -/**
>>>> - * rebuild_resv_regions: rebuild resv regions with both the
>>>> - * info of host resv ranges and property set resv ranges
>>>> - */
>>>> -static int rebuild_resv_regions(IOMMUDevice *sdev)
>>>> -{
>>>> -    GList *l;
>>>> -    int i = 0;
>>>> -
>>>> -    /* free the existing list and rebuild it from scratch */
>>>> -    g_list_free_full(sdev->resv_regions, g_free);
>>>> -    sdev->resv_regions = NULL;
>>>> -
>>>> -    /* First add host reserved regions if any, all tagged as RESERVED */
>>>> -    for (l = sdev->host_resv_ranges; l; l = l->next) {
>>>> -        ReservedRegion *reg = g_new0(ReservedRegion, 1);
>>>> -        Range *r = (Range *)l->data;
>>>> -
>>>> -        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
>>>> -        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
>>>> -        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions,
>> reg);
>>>> -        trace_virtio_iommu_host_resv_regions(sdev-
>>>>> iommu_mr.parent_obj.name, i,
>>>> -                                             range_lob(&reg->range),
>>>> -                                             range_upb(&reg->range));
>>>> -        i++;
>>>> -    }
>>>> -    /*
>>>> -     * then add higher priority reserved regions set by the machine
>>>> -     * through properties
>>>> -     */
>>>> -    add_prop_resv_regions(sdev);
>>>> -    return 0;
>>>> -}
>>>> -
>>>> /**
>>>>  * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
>>>>  *
>>>> --
>>>> 2.41.0

