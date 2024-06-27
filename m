Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp145157njb;
        Thu, 27 Jun 2024 02:00:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVFNdVrqvlgv9L7n2aMjFB22G980mbmo2gxQUd+VeBiGfvWmfYt5RRo/VEy5O7bxLzowOmBAnId5YaQYjGi6sJt5zwrhPn
X-Google-Smtp-Source: AGHT+IHbLXqCKwkWvRgmF9BSetWTClzHCOyZkMHNjtzSvEmLYUfQzeSkN4wJFHXuPXLaKTAL1v74
X-Received: by 2002:a0c:f388:0:b0:6b5:41b6:4797 with SMTP id 6a1803df08f44-6b541b649bfmr138672076d6.37.1719478808433;
        Thu, 27 Jun 2024 02:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719478808; cv=none;
        d=google.com; s=arc-20160816;
        b=OAWSL+6RrNLFYH6T/UbrlYB9B1YLayYBzDDFGq5ykSGIkt99v4n/ZFP8RU0YR8/XG1
         0VpObOJXKwZAk1jmTgjNikUMTpJ5V0RMmEtvQN5qTyYpCT/eL+iFk8P60GkqauxVksDx
         Bw2Fw7ZZQCJTslsftbBkcUlK/QiYk5tN6z0ePibW+FjA3pGiK1s27FRfbmQZ0lCSTpd6
         GGThhYRzIfzJ32ZyDm7mbXCDMJ94C4G8Jdedt3H3J+ldo+AR4sQLx3nb9mLCb9MUdJd/
         7Vk8Cf5YqUEBeMmlzR6FfpTq8NzH5Bban8F7Ly2cUgpuuYl7DRbHqJsGg68UGZ4vkPk6
         KD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TQvSGgpEvhPJcNEwTpRwdp8KyvZM8/DnsczMr1jL3TI=;
        fh=y+EfMXPR0GqNrX9s9oJOt6xFWvGWQgBtSPxyK4Cqung=;
        b=r0s8OriRWcs4QPcF8loWZx21VMJvDkya8Bdjv39Oj+QB0r4JuSvXkXr/cHhwUiOiF5
         0VZXn++Uo4k+huFD/mSEYj25Ub0cwfvHKTcZYA+jXJzFynV+4AmO0q3y6XtyB8IoTaBR
         9UYzslyiOkq3/4ILq/JlhKxp7hgYXRBdN/Qx/7fsVNqyJ5wZeVgXxToYOrFj7FQlatiE
         Zen2nYxXzZ6+7uXWyX/b+TN5o0nIaAMkY3XZ7U+n5Pw+z6o25+TYQepMyLX+1iGbuCvr
         eNq4X/Xx9QIn5R+2XfvigM+25Pzc9p5qgVGWWGSWJEFzSWmBi74gNdXj6ZbywLjJLlKi
         +CJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i68k1yr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59269cc7esi8252096d6.333.2024.06.27.02.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 02:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i68k1yr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMkyy-00024E-9v; Thu, 27 Jun 2024 04:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMkyw-00023p-UT
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 04:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMkyv-0000qR-Bb
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 04:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719478792;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQvSGgpEvhPJcNEwTpRwdp8KyvZM8/DnsczMr1jL3TI=;
 b=i68k1yr6Z0mXnZBTEJF9bVSJMNrst5ceaFjJI/wfUdToP8VpxAWyMZ9vHEBKema0V+ptho
 DLl+JxJ79S9rtdro+xhQd/fkVukQ+Qd6W+sSJn/xy3EDXfmuWQ1gd2pIqoYyhEOcRiPCSW
 2Ksli5+SPvd4fDrjgmTq+TdVeZ9t+bo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-xxPHbxqGNzqPZsyipxcObg-1; Thu, 27 Jun 2024 04:59:41 -0400
X-MC-Unique: xxPHbxqGNzqPZsyipxcObg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b4ff2b40d9so114598506d6.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 01:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719478779; x=1720083579;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQvSGgpEvhPJcNEwTpRwdp8KyvZM8/DnsczMr1jL3TI=;
 b=MonLe+Ss6rTjugFvHpybKt8UyJi4q3gnj1G7S25jRB51IYymyMiU1RqyzjJ9VRHPG+
 jOgAcZYPQKdyB9EvM9RfizAjVHcPPufCF3vJs9et3vL9Smc2GqhLympyMQFrL6eVSxop
 nE1SaosDEZXIed+rthXt3DQ0we3nM7b8CKyI3Zx/4FBBdcyGtSVHIHdyHrQTYSJC5dMg
 i1LZ9YDOt4HFP0Ao1If1HGW9gfVZ53/8Rm5WaW/UROHHYtvRdyM1hLDCp+i3eFE3h8t1
 TCNkwkozxQvhF6dU5tChA3rLd+tP4Yc/t/T5jzRC4jtJAub0wm6Ds2it7TohueTwLzED
 ef6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzOkMNVWwa55Lgn2+8A3SUWKnfRVX22gqQeBmP50d97ZsIvqsgTh0PCeAMglEzDtD5h/AXs3NJfmbR/3aAUdcMA2P
X-Gm-Message-State: AOJu0YwyVJdwKP4sJOlxWPTqCJ79Y0+/69BoLq9DnCxy2yBRUiOSBgMB
 zOHqjyXsJe0sKD2HckFPljNaaQLH+Zx1c4h0HJwVLexGBSnwL3Twagbca1fdtaeqlRlmMbHa0Be
 UQ/VASlpOJjfa2U2ucYUoX0p4nezQBo3xfrKA8lv5tzcQocOoqw==
X-Received: by 2002:ad4:5409:0:b0:6b5:b29:82cf with SMTP id
 6a1803df08f44-6b540aa802fmr115187356d6.48.1719478779440; 
 Thu, 27 Jun 2024 01:59:39 -0700 (PDT)
X-Received: by 2002:ad4:5409:0:b0:6b5:b29:82cf with SMTP id
 6a1803df08f44-6b540aa802fmr115187206d6.48.1719478779110; 
 Thu, 27 Jun 2024 01:59:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59241b67dsm3523876d6.4.2024.06.27.01.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 01:59:38 -0700 (PDT)
Message-ID: <ca01fa7e-4218-48b5-8c85-e8f7e9e353c9@redhat.com>
Date: Thu, 27 Jun 2024 10:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] HostIOMMUDevice: Introduce get_page_size_mask()
 callback
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-5-eric.auger@redhat.com>
 <SJ0PR11MB6744E5DF82073F17F2FC31D192D72@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744E5DF82073F17F2FC31D192D72@SJ0PR11MB6744.namprd11.prod.outlook.com>
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
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Z8b29WQqcf4O

Hi Zhenzhong,

On 6/27/24 05:06, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH 4/7] HostIOMMUDevice: Introduce get_page_size_mask()
>> callback
>>
>> This callback will be used to retrieve the page size mask supported
>> along a given Host IOMMU device.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> include/hw/vfio/vfio-container-base.h |  7 +++++++
>> include/sysemu/host_iommu_device.h    |  8 ++++++++
>> hw/vfio/container.c                   | 10 ++++++++++
>> hw/vfio/iommufd.c                     | 11 +++++++++++
>> 4 files changed, 36 insertions(+)
>>
>> diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-
>> container-base.h
>> index 45d7c40fce..62a8b60d87 100644
>> --- a/include/hw/vfio/vfio-container-base.h
>> +++ b/include/hw/vfio/vfio-container-base.h
>> @@ -88,6 +88,13 @@ int vfio_container_query_dirty_bitmap(const
>> VFIOContainerBase *bcontainer,
>>
>> GList *vfio_container_get_iova_ranges(const VFIOContainerBase
>> *bcontainer);
>>
>> +static inline uint64_t
>> +vfio_container_get_page_size_mask(const VFIOContainerBase *bcontainer)
>> +{
>> +    assert(bcontainer);
>> +    return bcontainer->pgsizes;
>> +}
>> +
>> #define TYPE_VFIO_IOMMU "vfio-iommu"
>> #define TYPE_VFIO_IOMMU_LEGACY TYPE_VFIO_IOMMU "-legacy"
>> #define TYPE_VFIO_IOMMU_SPAPR TYPE_VFIO_IOMMU "-spapr"
>> diff --git a/include/sysemu/host_iommu_device.h
>> b/include/sysemu/host_iommu_device.h
>> index 05c7324a0d..c1bf74ae2c 100644
>> --- a/include/sysemu/host_iommu_device.h
>> +++ b/include/sysemu/host_iommu_device.h
>> @@ -89,6 +89,14 @@ struct HostIOMMUDeviceClass {
>>      * @hiod: handle to the host IOMMU device
>>      */
>>     GList* (*get_iova_ranges)(HostIOMMUDevice *hiod);
>> +    /**
>> +     *
>> +     * @get_page_size_mask: Return the page size mask supported along
>> this
>> +     * @hiod Host IOMMU device
>> +     *
>> +     * @hiod: handle to the host IOMMU device
>> +     */
>> +    uint64_t (*get_page_size_mask)(HostIOMMUDevice *hiod);
> Not sure if it's simpler to utilize existing .get_cap() to get pgsizes.
I chose to introduce a new callback because the page_mask can be U64_MAX
and get_cap is likely to return a negative value. So we could not
distinguish between an error and a full mask.

Thanks

Eric

>
> Thanks
> Zhenzhong
>
>> };
>>
>> /*
>> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
>> index adeab1ac89..b5ce559a0d 100644
>> --- a/hw/vfio/container.c
>> +++ b/hw/vfio/container.c
>> @@ -1174,6 +1174,15 @@
>> hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>>     return vfio_container_get_iova_ranges(vdev->bcontainer);
>> }
>>
>> +static uint64_t
>> +hiod_legacy_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
>> +{
>> +    VFIODevice *vdev = hiod->agent;
>> +
>> +    g_assert(vdev);
>> +    return vfio_container_get_page_size_mask(vdev->bcontainer);
>> +}
>> +
>> static void vfio_iommu_legacy_instance_init(Object *obj)
>> {
>>     VFIOContainer *container = VFIO_IOMMU_LEGACY(obj);
>> @@ -1188,6 +1197,7 @@ static void
>> hiod_legacy_vfio_class_init(ObjectClass *oc, void *data)
>>     hioc->realize = hiod_legacy_vfio_realize;
>>     hioc->get_cap = hiod_legacy_vfio_get_cap;
>>     hioc->get_iova_ranges = hiod_legacy_vfio_get_iova_ranges;
>> +    hioc->get_page_size_mask = hiod_legacy_vfio_get_page_size_mask;
>> };
>>
>> static const TypeInfo types[] = {
>> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
>> index 211e7223f1..7b5f87a148 100644
>> --- a/hw/vfio/iommufd.c
>> +++ b/hw/vfio/iommufd.c
>> @@ -652,12 +652,23 @@
>> hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
>>     return vfio_container_get_iova_ranges(vdev->bcontainer);
>> }
>>
>> +static uint64_t
>> +hiod_iommufd_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
>> +{
>> +    VFIODevice *vdev = hiod->agent;
>> +
>> +    g_assert(vdev);
>> +    return vfio_container_get_page_size_mask(vdev->bcontainer);
>> +}
>> +
>> +
>> static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)
>> {
>>     HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_CLASS(oc);
>>
>>     hiodc->realize = hiod_iommufd_vfio_realize;
>>     hiodc->get_iova_ranges = hiod_iommufd_vfio_get_iova_ranges;
>> +    hiodc->get_page_size_mask = hiod_iommufd_vfio_get_page_size_mask;
>> };
>>
>> static const TypeInfo types[] = {
>> --
>> 2.41.0

