Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp647089njk;
        Wed, 17 Jul 2024 00:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfXD+qwFua0wmXobVFy7vLpkXTiarUukLkQNHQr00rUzMyv7TBw/9xoPjrhyYXl7VVpxy6UVhA+vJY4/aLhtHK7j4wqb3p
X-Google-Smtp-Source: AGHT+IG6YfyQgQ2tlzTWeD44G9KQhhy3/0GvHl55WdS4/YEcreUoOo/C9IiYRbwIhwjEfnce3Vlr
X-Received: by 2002:a05:620a:29c6:b0:79f:6a2:398c with SMTP id af79cd13be357-7a1874d2826mr84656385a.53.1721202090186;
        Wed, 17 Jul 2024 00:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721202090; cv=none;
        d=google.com; s=arc-20160816;
        b=BjKlCFEIriyDKtAo+Mykm/U+mHA+Ucwh+o8ea+Qk/sW685QDv7gF1SGAgOINp/mXh8
         7Y2ErByR5R46rbU5jtqRK9RI59Kmj1rZ1/S5ZqBOty9cruKTKEzd51Sw56xMWTEw8Ima
         oKxk3Y7KGLuDNmBNnurgprKlUlvdkVgyWWn99BtkyYv8uUJFRSExniX9GTup8QDc0MS4
         2kDUdmaYlW8gTWsqurcnPqvMN7zhWCz9bDi5kMjlPgQghBngoMbwu3tQvvxCSaIxQcuR
         YX5d+RLOHsEAIRwpIsegBJzrIOhiV6sVFPEuT/UQLkO8wzM+KgqnBPSYo+4Oqrg0HaS+
         7nvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ErqzU+MeAVMUCGlNRiooH+sSNWTmSjcZqa73vQYikEk=;
        fh=9cTpqzy02slPWKE17HHWxPR1CDulERZJPQfiqKSsNc0=;
        b=Wa1PJ/+UHv8Yfsj5LXb6XLbRkLggwlMZtCnsHx40WUr8l03DIAu91Gwx3cES/KeKeS
         ZhPN5xDU3AoBLvj93T2U9J5t+1mFxa3A4ZXfFVcZysuWF9gfqqKavCuqjzWBQIKxvIUA
         B1b1Ie+DbT/NcAQqLIRoSphRKoFPgf15W22gituE5KMQaxwUNNYBkeKD1sHTSgUC9zeE
         1DhWEZZn85v2GEAALBXh93oxtkJfkqDpY9kq/SW+5lU1MBFtnhEQfftu1GXbEWuDR3ER
         exre85/UbaCb6WTBFPQyFkMXrPEpsE0tY0+g8s6DXLyNhA/+AZ2gzbYJLyqLc6gO8Leh
         xLkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jF40poei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160b7c942si961507685a.20.2024.07.17.00.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 00:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jF40poei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTzHj-0005VK-56; Wed, 17 Jul 2024 03:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTzHf-0005LO-3T
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 03:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTzHa-0001Le-7g
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 03:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721202060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErqzU+MeAVMUCGlNRiooH+sSNWTmSjcZqa73vQYikEk=;
 b=jF40poeiTLO30gXrIApbKh/q9bxo4ehpZ/mXEDlR/iRteKf2m4JUybI/30FL9NTT04H2r1
 pVwjkuGyPFJPMqK/R3nDwB2jAQMMQ1ql64/3B7bqEUPxoTIaSZQgEWULRVM3N+srigQ7ok
 A+QoKoaa0Dve6bmxXHSG/2EajEdqV2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-IfUpH5NDNqSONVASBdB3Yw-1; Wed, 17 Jul 2024 03:40:59 -0400
X-MC-Unique: IfUpH5NDNqSONVASBdB3Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42725ef39e2so47538475e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 00:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721202058; x=1721806858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErqzU+MeAVMUCGlNRiooH+sSNWTmSjcZqa73vQYikEk=;
 b=G+PbrSHuftM84zk2axiIl81HU9SpJlLd+f89RzfBZ6tA9q21dJvJ9M20UOLqRvgVP1
 1QxY2yxWUd4Jyx/fCUs5aeoqt6+mWUMr8tvDd6qg03xxTofMwZs1GaFfSp8uYak2UXEP
 ZJM0rrHUd2ITfo5Ep1mhS8fY++90EQjv6BZcNN+9UlgwWfIcoVVQEv7+gJP29v2apjSZ
 QU40T7K8hygI962SkFoUGCcL+UWfPc/3k2MqnIYtbXkiRBsSA9GUqWIVWx8kQeGYbBm4
 rTjMLj+aQmD2cXZQ2DF/dyYN3n75XlQDDDVLzn0H3oUz5BD8NSutPWCbdgIrmf6HRL/7
 WQnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDIB9DDmC6zf/+A3INLJfzRxss8WMClSAMxr2XYlpr7xOycb6+dioJW4lXLlpPrDgbHPl9zVRUW95qG4NjkG2XmwlC
X-Gm-Message-State: AOJu0YzYF79Rx7CbxRdIs/xj8C2R2myCsZxq90FHJEjIX6nPX9bbUmw7
 cx4MizTl4+cm7yLjc1e4TATYBj7X+LR5ku9uI8Ho1fxBztF7Vi7OqQDwdHXp5BjG9eBFDH4/5Qr
 6/EAE/vHxO2cvHM94aKEqsrNUmcmefkxmuwbi4Gaezyv3hncpEg==
X-Received: by 2002:a05:600c:3513:b0:426:6308:e2f0 with SMTP id
 5b1f17b1804b1-427c2ce8cecmr5186605e9.26.1721202057950; 
 Wed, 17 Jul 2024 00:40:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3513:b0:426:6308:e2f0 with SMTP id
 5b1f17b1804b1-427c2ce8cecmr5186465e9.26.1721202057537; 
 Wed, 17 Jul 2024 00:40:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7c9csm194753435e9.48.2024.07.17.00.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 00:40:57 -0700 (PDT)
Message-ID: <d31d814e-ba00-4a2c-b905-d01022883b95@redhat.com>
Date: Wed, 17 Jul 2024 09:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] virtio-iommu: Free [host_]resv_ranges on
 unset_iommu_devices
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "yanghliu@redhat.com" <yanghliu@redhat.com>
References: <20240716094619.1713905-1-eric.auger@redhat.com>
 <20240716094619.1713905-4-eric.auger@redhat.com>
 <SJ0PR11MB6744D54C9B81BD1AD2BE5E1A92A32@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744D54C9B81BD1AD2BE5E1A92A32@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lYtlJKuYbbQT

Hi Zhenzhong,

On 7/17/24 05:06, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH 3/6] virtio-iommu: Free [host_]resv_ranges on
>> unset_iommu_devices
>>
>> We are currently missing the deallocation of the [host_]resv_regions
>> in case of hot unplug. Also to make things more simple let's rule
>> out the case where multiple HostIOMMUDevices would be aliased and
>> attached to the same IOMMUDevice. This allows to remove the handling
>> of conflicting Host reserved regions. Anyway this is not properly
>> supported at guest kernel level. On hotunplug the reserved regions
>> are reset to the ones set by virtio-iommu property.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> hw/virtio/virtio-iommu.c | 62 ++++++++++++++++++----------------------
>> 1 file changed, 28 insertions(+), 34 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 2c54c0d976..2de41ab412 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -538,8 +538,6 @@ static int
>> virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
>> {
>>     IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
>>     IOMMUDevice *sdev;
>> -    GList *current_ranges;
>> -    GList *l, *tmp, *new_ranges = NULL;
>>     int ret = -EINVAL;
>>
>>     if (!sbus) {
>> @@ -553,33 +551,10 @@ static int
>> virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
>>         return ret;
>>     }
>>
>> -    current_ranges = sdev->host_resv_ranges;
>> -
>> -    /* check that each new resv region is included in an existing one */
>>     if (sdev->host_resv_ranges) {
>> -        range_inverse_array(iova_ranges,
>> -                            &new_ranges,
>> -                            0, UINT64_MAX);
>> -
>> -        for (tmp = new_ranges; tmp; tmp = tmp->next) {
>> -            Range *newr = (Range *)tmp->data;
>> -            bool included = false;
>> -
>> -            for (l = current_ranges; l; l = l->next) {
>> -                Range * r = (Range *)l->data;
>> -
>> -                if (range_contains_range(r, newr)) {
>> -                    included = true;
>> -                    break;
>> -                }
>> -            }
>> -            if (!included) {
>> -                goto error;
>> -            }
>> -        }
>> -        /* all new reserved ranges are included in existing ones */
>> -        ret = 0;
>> -        goto out;
>> +        error_setg(errp, "%s virtio-iommu does not support aliased BDF",
>> +                   __func__);
>> +        return ret;
>>     }
>>
>>     range_inverse_array(iova_ranges,
>> @@ -588,14 +563,31 @@ static int
>> virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
>>     rebuild_resv_regions(sdev);
>>
>>     return 0;
>> -error:
>> -    error_setg(errp, "%s Conflicting host reserved ranges set!",
>> -               __func__);
>> -out:
>> -    g_list_free_full(new_ranges, g_free);
>> -    return ret;
>> }
>>
>> +static void virtio_iommu_unset_host_iova_ranges(VirtIOIOMMU *s,
>> PCIBus *bus,
>> +                                                int devfn)
>> +{
>> +    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
>> +    IOMMUDevice *sdev;
>> +
>> +    if (!sbus) {
>> +        return;
>> +    }
>> +
>> +    sdev = sbus->pbdev[devfn];
>> +    if (!sdev) {
>> +        return;
>> +    }
>> +
>> +    g_list_free_full(g_steal_pointer(&sdev->host_resv_ranges), g_free);
>> +    g_list_free_full(sdev->resv_regions, g_free);
>> +    sdev->host_resv_ranges = NULL;
>> +    sdev->resv_regions = NULL;
>> +    add_prop_resv_regions(sdev);
> Is this necessary? rebuild_resv_regions() will do that again.
My goal was to reset the state that existed before the

virtio_iommu_set_host_iova_ranges() was called. prop resv regions were originally added in virtio_iommu_find_add_as. 
The next device to be hotplugged at this aliased bdf is not necessarily a VFIO device (may be a virtio one), in which case we would miss the prop resv regions.

>
> Other than that, for the whole series,
>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Thanks!

Eric
>
> Thanks
> Zhenzhong
>
>> +}
>> +
>> +
>> static bool check_page_size_mask(VirtIOIOMMU *viommu, uint64_t
>> new_mask,
>>                                  Error **errp)
>> {
>> @@ -704,6 +696,8 @@ virtio_iommu_unset_iommu_device(PCIBus *bus,
>> void *opaque, int devfn)
>>     if (!hiod) {
>>         return;
>>     }
>> +    virtio_iommu_unset_host_iova_ranges(viommu, hiod->aliased_bus,
>> +                                        hiod->aliased_devfn);
>>
>>     g_hash_table_remove(viommu->host_iommu_devices, &key);
>> }
>> --
>> 2.41.0

