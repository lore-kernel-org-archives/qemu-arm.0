Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp128135ejb;
        Fri, 14 Jun 2024 02:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+DR4VfinX2yCJsccfPjwwO/7sf4gztuEXsDjNvgFaa0vpWvqqwjDv7ROAUtJog7mgID9cDUu23UuJzmP3Mur0am0YlBk0
X-Google-Smtp-Source: AGHT+IHUf4qBmMoygmpTeWDEZlej4S2cpv1bJFErl5UDZ4A0LpYQ40ADKpyDnmb0/S+7IUg9O9Dm
X-Received: by 2002:a0c:ea85:0:b0:6b0:7b24:56f0 with SMTP id 6a1803df08f44-6b2af245b6fmr43480716d6.6.1718355650958;
        Fri, 14 Jun 2024 02:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718355650; cv=none;
        d=google.com; s=arc-20160816;
        b=H+3LSOZBqlzYWn/cZIWr6DN9uiz1E0M5d1fapLI7cB4hyHozCiz5t+s5ZVUxs+38uO
         EcC29eJh/r+f99R8Y6mFJUHTmmXsmVovsuWaINiFj5zdmjLqfwUAvu9Y4fK5IvGmUJwq
         mtAblKv4UjWLnLi1uVxSlO2wsdQtjOqkUUKZOGWE8azrkqlAHaCNt+NHns7Pp0kaZUTT
         0FrmHU+RZhMu0s61vAm1W5Q7Vx7SgCpjnaupNvhorK5TOq2Yluj87AW72pV+IG+u6K0Y
         O6h2FgdS1taq0Iw2jFBDiDjRuFKl9PuttwO3iVJGHaRxLR4ugTZ8p65Z/oWv4i8jFafd
         Ec6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uFpz4ZTSWrOF7oYjA80r6wLikmp5jJZEBmXIsTGFvJQ=;
        fh=uPO2hVPwp/Oidt3CjF2mtHy8W+JkDwgrHP82WUNceLo=;
        b=Vau5ozr0KOtDwj8Kt66U7DT8GgRV3O9A5ueQ8I8wn/IN69Qj9gN1vePfhMqIS2C50F
         ktm1aERSYCZ4UyHZR4wWxj6UynPZBovN/aKHOMGo83MDXBbmSOyjIr+kklW3tZpaQldw
         a+ijB8KGeCQ/byeZqmz0s9KuZOyP4EwLg4ZhI5U5nfa01hbPXq1qH9kFD27+PA3rfhO8
         gIG+xgEtzf7zvTEtJPB8XKS3kw2+eT7odo/jK7+fdd/Jh8QCkQ6c3QsnDfyccwt5MOXY
         yoKguMNwk3WIM0J0GcLZhaOrUg7vVhsZR9I/Jg8/yeXKyDQbSf22BxHJMzqQaE3r8EO8
         nQyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XaC1SloA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b7cef7si32238366d6.523.2024.06.14.02.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XaC1SloA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI2nd-0001k0-Rb; Fri, 14 Jun 2024 05:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI2nc-0001jZ-05
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI2nZ-0000yV-V4
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718355640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFpz4ZTSWrOF7oYjA80r6wLikmp5jJZEBmXIsTGFvJQ=;
 b=XaC1SloAJWQd8VTgFNVTTilNNWDSxDeWlWU7TxOl07fvbKjboAXpLyV9PYc72ky3PZ5oDm
 j4RRzZVWRH65hB64uESrZ8zSD8Yr+Pgb6Vf/5CZ9/dc4h0pEN3Ih7+8iemtp/jUTXMgbqn
 y0ArdkS+2y/DWTsWDDRg24Oi/JWzgR4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-tENec08XOcOn98KfuwYEMw-1; Fri, 14 Jun 2024 05:00:39 -0400
X-MC-Unique: tENec08XOcOn98KfuwYEMw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7955b3dd742so323508585a.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2024 02:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718355638; x=1718960438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFpz4ZTSWrOF7oYjA80r6wLikmp5jJZEBmXIsTGFvJQ=;
 b=ZwpEP3BO5e1ZfJiDrReM+OHiAWJsMU7Xwv7ROvLWTfP/K9VwIoJee9JwJ67MOkDdc8
 0F/YrAr+qLcw9VcgOjirP840ePAQ7vs05wRMah0SEyppgalhBZ2Z0gtpvGSpBTjJGJAE
 8ANaPFl5tPcQO9AG7ghqfziHbSkqsqO1FHUF0ACDHKLHS7i0E2q+TZbxqs/quKhl3XtS
 CGpi6QLWSBp+rENARV0ZSWXd9dHDa11v3zS9TxxjphZ98rm7ewATaYXFg3fk//r9UhUY
 LBAOgnxEJj1Eys5232zrk4B1kkf8D5K1I61WN/eZ7ExzfrIj/BHUrASIvr3NQpWadQDy
 aXIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNhH/d0TqYcBu0caXLt1vTGPDIsX1mDnAH47lqbmvuOoXlIijZDjH+oA7rSgpvh/x6VZKQLfCxNM2YUfQqlIWPEiM1
X-Gm-Message-State: AOJu0Yw4Qu6eG1YJqVPEQRj6w7rXZfLri8Lk6G1KlR/Opsu7wK3lRBhs
 d1DwgtACzs/NuEKNhKtRpPlL8szdG+Msh24K7S97VExs/zQGs74u0d66vMMnrOm4aTxLfAp9vh4
 EDFpy1xuYFQI9TDodc9G48Be9NN/gWoNXIqwn0X0SOi2qktep6Q==
X-Received: by 2002:a05:620a:1918:b0:795:2391:bc36 with SMTP id
 af79cd13be357-79810103913mr898697685a.21.1718355638272; 
 Fri, 14 Jun 2024 02:00:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1918:b0:795:2391:bc36 with SMTP id
 af79cd13be357-79810103913mr898692485a.21.1718355637779; 
 Fri, 14 Jun 2024 02:00:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441ef3d88b7sm14236441cf.13.2024.06.14.02.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:00:37 -0700 (PDT)
Message-ID: <a937c61f-3d96-49bd-b92a-192a86b0122f@redhat.com>
Date: Fri, 14 Jun 2024 11:00:33 +0200
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
X-TUID: SKT3aO5Bx/zH

Hi Zhenzhong,

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
I would suggest to pass the aliased info through the set_iommu_device()
and store them in the HostIOMMUDevice. I will submit a patch accordingly

Thanks

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

