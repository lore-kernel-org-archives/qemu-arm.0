Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp181271ejb;
        Thu, 13 Jun 2024 02:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBvZRD/rheu7xxkTIdWogbUPlP2IIB6xDfuqR/wd8D42o07Kf8rOCzJWF80LH9DnyjMknps7T32Bj6XXbt99CselfDLWid
X-Google-Smtp-Source: AGHT+IEohcwpMT+FM4ZUN+bkmkf+hOrgMsoq34GnAlVvOtnZrokGN9BouX1DMjMWiooFNk5mVCdo
X-Received: by 2002:a0d:ec4d:0:b0:628:c1f0:d8fd with SMTP id 00721157ae682-62fbdca36c8mr32264057b3.52.1718269322532;
        Thu, 13 Jun 2024 02:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718269322; cv=none;
        d=google.com; s=arc-20160816;
        b=XCbGUJTjYoFlXpN323Xm6ycWO/7nIglKAjkRCK1gdsmFonKJZ6Jvu+ybFvHKZ/sUYj
         MJ4laU/54dHHQz9NNV7jFVJcQzvTGJ2Yh7UiID8/FtXi6uzqGOGpfGW+taKaIcPKAJXi
         Fcn129DgwSEZci2JboPx+gqniIgLi0UDkfMFXWbfHL2huz879YPM6M9EVpEJZ75hyftB
         35Z7fEdtEvhNtFw5SgjmAS8BroP55wE+TZqAZNr1YWrF+A2LsS2SWg1xDD9Mzyu3N/i8
         uMZe9rx2Zl6ICoECkfqkdzXnYvAg1Bvy01BmOO2u6JV6pv3nhc3xJ7a5yUU4KRLSF80+
         CNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EJVZfkhG9mnB+EQvHCextvksduin0wd1sdbwyILHm9o=;
        fh=P2R0ctyW/PCPPv4Fb2ZFENBDg5ulCBYI7cbJMSImwcs=;
        b=FS/pUSc9+1Sp5Q8pUYwhrSLtCh59dztMfXVh+8E4M0mLLGix2Ezapbp8l/Rj24h+/q
         pCK3PLg3axowM9SPgOKe/qS9sjhLN838dFL4bfM8ZpXHLj+QmnqKfAJJpNCB0pdHwd7O
         vqO8MmO278sKIQ3IH7QGd91NgubNYh6MK4504WB/gTwQA16yX1CezMFdAJLRb2XIp/zo
         rCvWMsgQRcm/SmAFkl0sKBRJTyuR/B7hVOY39ZiMEd7YiDYR2GC9Go3lkqyln3fxDQFl
         GN02ZPGcZbtRQC3PfUDf4/ntYkAN6mUJG2A2n5wbXrNME5rVJvLXnb9bf9e+HfB3EfSu
         cuqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijgwtpYA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b5fadesi10057956d6.450.2024.06.13.02.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 02:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijgwtpYA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHgL9-0002JX-0g; Thu, 13 Jun 2024 05:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHgKx-00020s-IB
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHgKv-0001N5-HG
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718269296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJVZfkhG9mnB+EQvHCextvksduin0wd1sdbwyILHm9o=;
 b=ijgwtpYAb1jIrvelRPzXy5u7JLAwrZ1HxxMqJflxC3Z6hRe4oZc/7QJ7Co0rvPZVnW4D1b
 wELxrPZYLVCsrNlumV053loTWLGklixUybwePxnSfFub7KmHZUKVKYPjxBj7EIi/ohVNYq
 oH6gHPBKnOs85paRaygxOuwnQy8bykE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-l5ucLWYNNPixN86rpvEApg-1; Thu, 13 Jun 2024 05:01:35 -0400
X-MC-Unique: l5ucLWYNNPixN86rpvEApg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42135f60020so6259955e9.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2024 02:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718269293; x=1718874093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJVZfkhG9mnB+EQvHCextvksduin0wd1sdbwyILHm9o=;
 b=I9b5O3JROU4IX2eiwHgIPcT/Jm4je3aIpwuqwFYME03t0reEyWZkXEUq2zNqkQW228
 LQJpn4jZhcVY6BQXCu51aZi5SyI/Do9puHORRBONr562QUYDos4T4CTb5SRVbOcL40Tz
 bZ9S9tj6J9D/gjp2xvT6BmQNptd0Hn4q6v8q6viZZzr73v94KsBB0DovhIrUp+0jQRMD
 ovN18N9exCSmIDZi9vw4yb2JqEKAbeRls0wAcTnQ/M4a/6hD74IHhe65611kLGCgJY0p
 uz+E2pBGK86sR6UMs5UJe7O2eQKDYiwxkZU2oeh4+ZqcemAd1CAMvdF8joAlILiBUKqv
 B2FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1NsyVlNDd1JOgnogbSILsnCFvUCDTXiQenJJ2AzYeyz+Qrb1rwEgLIupamo+gevT7NK186Gcv/KGutB/WlYbW5OVE
X-Gm-Message-State: AOJu0Ywt1pDos+KhjyOXMBYgfzSgoz3AoCYaHS7LhNWMijKnXM7vja9t
 M7QQ63JemwiauR7vhc1TLQi6utVljJxy3tU/bsomFcCphAZVzEQwvs9c9O661wMHxt1aKRZ4R7f
 9KluLkhbJG2xCbuw8G2km+sgFHaAffhYvSOMU6f7XqGmMOkKC7tIAeSVjWA==
X-Received: by 2002:a05:600c:190d:b0:421:82ed:28d1 with SMTP id
 5b1f17b1804b1-422867c02f1mr33853615e9.41.1718269293049; 
 Thu, 13 Jun 2024 02:01:33 -0700 (PDT)
X-Received: by 2002:a05:600c:190d:b0:421:82ed:28d1 with SMTP id
 5b1f17b1804b1-422867c02f1mr33853245e9.41.1718269292598; 
 Thu, 13 Jun 2024 02:01:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e0c2sm15839145e9.14.2024.06.13.02.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:01:32 -0700 (PDT)
Message-ID: <ec20948e-16de-48e6-be8b-dffa9395bb8a@redhat.com>
Date: Thu, 13 Jun 2024 11:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/7] virtio-iommu: Compute host reserved regions
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
 <20240607143905.765133-5-eric.auger@redhat.com>
 <SJ0PR11MB674461B49A34599D0166D74E92C72@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB674461B49A34599D0166D74E92C72@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
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
X-TUID: m2zFBN30faRW

Hi Zhenzhong,

On 6/11/24 05:25, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [RFC v2 4/7] virtio-iommu: Compute host reserved regions
>>
>> Compute the host reserved regions in virtio_iommu_set_iommu_device().
>> The usable IOVA regions are retrieved from the HOSTIOMMUDevice.
>> The virtio_iommu_set_host_iova_ranges() helper turns usable regions
>> into complementary reserved regions while testing the inclusion
>> into existing ones. virtio_iommu_set_host_iova_ranges() reuse the
>> implementation of virtio_iommu_set_iova_ranges() which will be	
>> removed in subsequent patches. rebuild_resv_regions() is just moved.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> hw/virtio/virtio-iommu.c | 151 ++++++++++++++++++++++++++++++--------
>> -
>> 1 file changed, 117 insertions(+), 34 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 0680a357f0..33e9682b83 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -494,12 +494,114 @@ get_host_iommu_device(VirtIOIOMMU
>> *viommu, PCIBus *bus, int devfn) {
>>     return g_hash_table_lookup(viommu->host_iommu_devices, &key);
>> }
>>
>> +/**
>> + * rebuild_resv_regions: rebuild resv regions with both the
>> + * info of host resv ranges and property set resv ranges
>> + */
>> +static int rebuild_resv_regions(IOMMUDevice *sdev)
>> +{
>> +    GList *l;
>> +    int i = 0;
>> +
>> +    /* free the existing list and rebuild it from scratch */
>> +    g_list_free_full(sdev->resv_regions, g_free);
>> +    sdev->resv_regions = NULL;
>> +
>> +    /* First add host reserved regions if any, all tagged as RESERVED */
>> +    for (l = sdev->host_resv_ranges; l; l = l->next) {
>> +        ReservedRegion *reg = g_new0(ReservedRegion, 1);
>> +        Range *r = (Range *)l->data;
>> +
>> +        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
>> +        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
>> +        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
>> +        trace_virtio_iommu_host_resv_regions(sdev-
>>> iommu_mr.parent_obj.name, i,
>> +                                             range_lob(&reg->range),
>> +                                             range_upb(&reg->range));
>> +        i++;
>> +    }
>> +    /*
>> +     * then add higher priority reserved regions set by the machine
>> +     * through properties
>> +     */
>> +    add_prop_resv_regions(sdev);
>> +    return 0;
>> +}
>> +
>> +static int virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus
>> *bus,
>> +                                             int devfn, GList *iova_ranges,
>> +                                             Error **errp)
>> +{
>> +    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
>> +    IOMMUDevice *sdev;
>> +    GList *current_ranges;
>> +    GList *l, *tmp, *new_ranges = NULL;
>> +    int ret = -EINVAL;
>> +
>> +    if (!sbus) {
>> +        error_report("%s no sbus", __func__);
>> +    }
>> +
>> +    sdev = sbus->pbdev[devfn];
>> +
>> +    current_ranges = sdev->host_resv_ranges;
>> +
>> +    if (sdev->probe_done) {
> Will this still happen with new interface?
no this shouldn't. Replaced by a g_assert(!sdev->probe_done) to make
sure the i/f is used properly.
>
>> +        error_setg(errp,
>> +                   "%s: Notified about new host reserved regions after probe",
>> +                   __func__);
>> +        goto out;
>> +    }
>> +
>> +    /* check that each new resv region is included in an existing one */
>> +    if (sdev->host_resv_ranges) {
> Same here.
To me this one can still happen in case several devices belong to the
same group.
>
>> +        range_inverse_array(iova_ranges,
>> +                            &new_ranges,
>> +                            0, UINT64_MAX);
>> +
>> +        for (tmp = new_ranges; tmp; tmp = tmp->next) {
>> +            Range *newr = (Range *)tmp->data;
>> +            bool included = false;
>> +
>> +            for (l = current_ranges; l; l = l->next) {
>> +                Range * r = (Range *)l->data;
>> +
>> +                if (range_contains_range(r, newr)) {
>> +                    included = true;
>> +                    break;
>> +                }
>> +            }
>> +            if (!included) {
>> +                goto error;
>> +            }
>> +        }
>> +        /* all new reserved ranges are included in existing ones */
>> +        ret = 0;
>> +        goto out;
>> +    }
>> +
>> +    range_inverse_array(iova_ranges,
>> +                        &sdev->host_resv_ranges,
>> +                        0, UINT64_MAX);
>> +    rebuild_resv_regions(sdev);
>> +
>> +    return 0;
>> +error:
>> +    error_setg(errp, "%s Conflicting host reserved ranges set!",
>> +               __func__);
>> +out:
>> +    g_list_free_full(new_ranges, g_free);
>> +    return ret;
>> +}
>> +
>> static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque,
>> int devfn,
>>                                           HostIOMMUDevice *hiod, Error **errp)
>> {
>>     VirtIOIOMMU *viommu = opaque;
>>     VirtioHostIOMMUDevice *vhiod;
>> +    HostIOMMUDeviceClass *hiodc =
>> HOST_IOMMU_DEVICE_GET_CLASS(hiod);
>>     struct hiod_key *new_key;
>> +    GList *host_iova_ranges = NULL;
> g_autoptr(GList)?
are you sure this frees all the elements of the list? As of now I would
be tempted to leave the code as is.

Thanks

Eric
>
> Thanks
> Zhenzhong
>
>>     assert(hiod);
>>
>> @@ -509,6 +611,20 @@ static bool
>> virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>>         return false;
>>     }
>>
>> +    if (hiodc->get_iova_ranges) {
>> +        int ret;
>> +        host_iova_ranges = hiodc->get_iova_ranges(hiod, errp);
>> +        if (!host_iova_ranges) {
>> +            return true; /* some old kernels may not support that capability */
>> +        }
>> +        ret = virtio_iommu_set_host_iova_ranges(viommu, bus, devfn,
>> +                                                host_iova_ranges, errp);
>> +        if (ret) {
>> +            g_list_free_full(host_iova_ranges, g_free);
>> +            return false;
>> +        }
>> +    }
>> +
>>     vhiod = g_malloc0(sizeof(VirtioHostIOMMUDevice));
>>     vhiod->bus = bus;
>>     vhiod->devfn = (uint8_t)devfn;
>> @@ -521,6 +637,7 @@ static bool
>> virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>>
>>     object_ref(hiod);
>>     g_hash_table_insert(viommu->host_iommu_devices, new_key, vhiod);
>> +    g_list_free_full(host_iova_ranges, g_free);
>>
>>     return true;
>> }
>> @@ -1243,40 +1360,6 @@ static int
>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>     return 0;
>> }
>>
>> -/**
>> - * rebuild_resv_regions: rebuild resv regions with both the
>> - * info of host resv ranges and property set resv ranges
>> - */
>> -static int rebuild_resv_regions(IOMMUDevice *sdev)
>> -{
>> -    GList *l;
>> -    int i = 0;
>> -
>> -    /* free the existing list and rebuild it from scratch */
>> -    g_list_free_full(sdev->resv_regions, g_free);
>> -    sdev->resv_regions = NULL;
>> -
>> -    /* First add host reserved regions if any, all tagged as RESERVED */
>> -    for (l = sdev->host_resv_ranges; l; l = l->next) {
>> -        ReservedRegion *reg = g_new0(ReservedRegion, 1);
>> -        Range *r = (Range *)l->data;
>> -
>> -        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
>> -        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
>> -        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
>> -        trace_virtio_iommu_host_resv_regions(sdev-
>>> iommu_mr.parent_obj.name, i,
>> -                                             range_lob(&reg->range),
>> -                                             range_upb(&reg->range));
>> -        i++;
>> -    }
>> -    /*
>> -     * then add higher priority reserved regions set by the machine
>> -     * through properties
>> -     */
>> -    add_prop_resv_regions(sdev);
>> -    return 0;
>> -}
>> -
>> /**
>>  * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
>>  *
>> --
>> 2.41.0

