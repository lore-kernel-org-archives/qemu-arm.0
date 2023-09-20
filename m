Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp4125145ejb;
        Wed, 20 Sep 2023 00:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb82Em1O9epLwb2YT/3G5EkfgZTgaCiCLF6fjTLiIasRlXFqjB1MFzElBOOkuOeoXs8VwU
X-Received: by 2002:ac8:5e4b:0:b0:417:8db2:f5f8 with SMTP id i11-20020ac85e4b000000b004178db2f5f8mr1741196qtx.17.1695195527675;
        Wed, 20 Sep 2023 00:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695195527; cv=none;
        d=google.com; s=arc-20160816;
        b=BTRJjBlP0rmsgGCKjXe+qhdxmSRXJexj7FBTJYS+X88CgbomBBc1nkULXjkKCi3unz
         zMf4XY6IfP9kMcTa80cL8DJ9ni+J74854C4O/l3Y91ZkqYOOLvGBN1A6YkvJ8WNhxJjw
         QDVv8OPO4Cu4eZcswWcU8M23oRvVUdW1BRanASR+58FsUMSoF1Ey2EL2BMVxbo4JVVj3
         5776cPOWWn0GlIGbaly4ievaMUCqdctEOVXukGKDFGFvHuuDHAVXulVHQl7pxTdENvTT
         1kROD5jtvFqQAbH/tOQTCNZKUoYEewdjJEE14lOD/dbnSymvHeawr4f+Osf6GADXALKR
         Ml+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KA22eBtIyZL/4u4ZGs0k2SudbeaF/uZPd3gJ95Pih/o=;
        fh=YeKYoTBFrmLh8/KPkR9sRTrErCu3JS4QCrxSKNkS0ps=;
        b=rCgIXe4pMWvHrQoVZG9LW/8lfR0TKImZ6YivQh3sWOlDvf4c6owo2AuZ4Q7mD7fHKt
         HWoh30uPZIi/LCz8vJvKA1kN21+uL7qbolyl4hhTFL4y65mu7fWSU2LR1pUF72zYlCYB
         Da+YOsL2efPw67pOZVGSqJaVLOdEjiGo3VNyzswSHDsEbTLIjyy23snZ42Y9ov7aiLLM
         pXckHZ9YRjL/3io0IxVK0lXYyFfENok5Ia1XQjmcYMl82Y5o8vx5naQJknGHlhxJ9oin
         m8dT4jBVP5lHI1U8pBVK51nGySkkM2vf/Y0ekTvCRyJWRwgFXkO5hTic6ezj8OGkApJA
         nZ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuJ0jCxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a100800b0040fdab1c16csi8834407qte.616.2023.09.20.00.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Sep 2023 00:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuJ0jCxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qirn7-0001Ox-5i; Wed, 20 Sep 2023 03:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qirn0-0001O7-ST
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 03:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qirmx-0005bo-Be
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 03:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695195501;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KA22eBtIyZL/4u4ZGs0k2SudbeaF/uZPd3gJ95Pih/o=;
 b=NuJ0jCxhZrkwbpte57T2f32Gq0cubrnv/m2RjB+dFSYGoLPDbrLpI1PwIUdo7lljjV/cff
 UOcc3fyyDyZLjiy5Py2yL1iTI+eHEAqsRmmJzB1Aeycy7me5iIFxo6xTn0D5uZPUOK2mPJ
 CoV0UnjMxdZPY+vb7JshlDzA+duniCM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-b-g0QetLOrmklxobuX8BJg-1; Wed, 20 Sep 2023 03:38:20 -0400
X-MC-Unique: b-g0QetLOrmklxobuX8BJg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-656407cbd43so45159276d6.2
 for <qemu-arm@nongnu.org>; Wed, 20 Sep 2023 00:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695195500; x=1695800300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KA22eBtIyZL/4u4ZGs0k2SudbeaF/uZPd3gJ95Pih/o=;
 b=tHAbcBJ0ughTinIJkXnqJLUETi6RBc/+pAHDACtIjmQSrzSkXiOlcmaj9FWnLpRYSg
 P5hFWzrfZglzLQ54d28Di4v8d2H64GAZWUrO6KtOl+YywvnVsnXPH2FrSbv3OkqnASl5
 GAUSHqpbj6gaC/yPGBKSPVwzwwv3kRlzmn+KYHO3+p6KMmXvrfwPf7Ex6eVZiutujX3+
 50sh4vOMC5ELmi+cN1h82UxHQ6W7XUS0MRRawg/vqg+nmQp1jy2y5+thSFOjwVS+1Dww
 paIOpi5BTbReeHqZGuF7brGAF+BUVjkwbahv8OaP1gDVvx5BIUunvkde02BjT7uzlzfR
 4Frw==
X-Gm-Message-State: AOJu0YxiSqBDml3aCeKRmSn8aWzd51XiqnP5cOS6I74e2qX6KHoTMgPP
 wgJAnB8Qm2BzmL9ayjRXqu8IUdwZEgYVfgjg4gd1GALKbLt0B+i/PgXNygqcBqCTqTC0g2rJFlF
 IPbWrRLy5GZ4p
X-Received: by 2002:a05:6214:2d16:b0:655:d81a:2cd2 with SMTP id
 mz22-20020a0562142d1600b00655d81a2cd2mr1497692qvb.64.1695195500228; 
 Wed, 20 Sep 2023 00:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:2d16:b0:655:d81a:2cd2 with SMTP id
 mz22-20020a0562142d1600b00655d81a2cd2mr1497669qvb.64.1695195499977; 
 Wed, 20 Sep 2023 00:38:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a0cf0cd000000b0065831121d0esm1833668qvl.90.2023.09.20.00.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 00:38:18 -0700 (PDT)
Message-ID: <48be39d4-8fd6-15a1-fd70-a5dc55cfce6a@redhat.com>
Date: Wed, 20 Sep 2023 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/12] vfio: Collect container iova range info
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-4-eric.auger@redhat.com>
 <dd3f27e9-2a4f-5f6b-84d3-13de767024bc@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <dd3f27e9-2a4f-5f6b-84d3-13de767024bc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-TUID: NnFxW8H+jSLO

Hi Cédric,

On 9/13/23 14:55, Cédric Le Goater wrote:
> On 9/13/23 10:01, Eric Auger wrote:
>> Collect iova range information if VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
>> capability is supported.
>>
>> This allows to propagate the information though the IOMMU MR
>> set_iova_ranges() callback so that virtual IOMMUs
>> get aware of those aperture constraints.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/vfio/vfio-common.h |  2 ++
>>   hw/vfio/common.c              | 45 +++++++++++++++++++++++++++++++++--
>>   2 files changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h
>> b/include/hw/vfio/vfio-common.h
>> index da43d27352..74b9b27270 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -98,6 +98,8 @@ typedef struct VFIOContainer {
>>       QLIST_HEAD(, VFIOGroup) group_list;
>>       QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
>>       QLIST_ENTRY(VFIOContainer) next;
>> +    unsigned nr_iovas;
>> +    struct  vfio_iova_range *iova_ranges;
>>   } VFIOContainer;
>>     typedef struct VFIOGuestIOMMU {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 9aac21abb7..26da38de05 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1157,6 +1157,14 @@ static void
>> vfio_listener_region_add(MemoryListener *listener,
>>               goto fail;
>>           }
>>   +        ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
>> +                container->nr_iovas, (struct Range
>> *)container->iova_ranges,
>> +                &err);
>> +        if (ret) {
>> +            g_free(giommu);
>> +            goto fail;
>> +        }
>> +
>>           ret = memory_region_register_iommu_notifier(section->mr,
>> &giommu->n,
>>                                                       &err);
>>           if (ret) {
>> @@ -1981,6 +1989,29 @@ bool vfio_get_info_dma_avail(struct
>> vfio_iommu_type1_info *info,
>>       return true;
>>   }
>>   +static void vfio_get_info_iova_range(struct vfio_iommu_type1_info
>> *info,
>> +                                     unsigned int *nr_iovas,
>> +                                     struct  vfio_iova_range
>> **iova_ranges)
>
> I guess there is no point in returning an error since we can not
> assign default values.
Actually this will return a boolean depending on the whether the
capability is supported,
as reported by Alex. I should have get inspired of
vfio_get_info_dma_avail()!
>
>> +{
>> +    struct vfio_info_cap_header *hdr;
>> +    struct vfio_iommu_type1_info_cap_iova_range *cap;
>> +
>> +    hdr = vfio_get_iommu_type1_info_cap(info,
>> +                                       
>> VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE);
>> +    if (hdr == NULL) {
>
> May be :
>
>     if (!hdr) {
yep. I guess I copy/pasted the vfio_get_info_dma_avail() code here ;-)
>
>
>> +        return;
>> +    }
>> +
>> +    cap = (void *)hdr;
>> +    *nr_iovas = cap->nr_iovas;
>> +
>
> I would add a trace event with the #iovas.
I do agree tracing the resv regions is usefyl however I would be tempted
to have this trace point elsewhere, maybe at the place where
vfio_host_win_add is called to trace aperture min/max and in the
set_iova cb. Because here I would need to enumerate the regions to trace
them and usually trace points do not add any code.

Thanks

Eric
>
> Thanks,
>
> C.
>
>
>> +    if (*nr_iovas == 0) {
>> +        return;
>> +    }
>> +    *iova_ranges = g_memdup2(cap->iova_ranges,
>> +                             *nr_iovas * sizeof(struct 
>> vfio_iova_range));
>> +}
>> +
>>   static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
>>                                             struct vfio_region_info
>> *info)
>>   {
>> @@ -2433,6 +2464,12 @@ static void
>> vfio_get_iommu_info_migration(VFIOContainer *container,
>>       }
>>   }
>>   +static void vfio_free_container(VFIOContainer *container)
>> +{
>> +    g_free(container->iova_ranges);
>> +    g_free(container);
>> +}
>> +
>>   static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                     Error **errp)
>>   {
>> @@ -2550,6 +2587,10 @@ static int vfio_connect_container(VFIOGroup
>> *group, AddressSpace *as,
>>           if (!vfio_get_info_dma_avail(info,
>> &container->dma_max_mappings)) {
>>               container->dma_max_mappings = 65535;
>>           }
>> +
>> +        vfio_get_info_iova_range(info, &container->nr_iovas,
>> +                                 &container->iova_ranges);
>> +
>>           vfio_get_iommu_info_migration(container, info);
>>           g_free(info);
>>   @@ -2663,7 +2704,7 @@ enable_discards_exit:
>>       vfio_ram_block_discard_disable(container, false);
>>     free_container_exit:
>> -    g_free(container);
>> +    vfio_free_container(container);
>>     close_fd_exit:
>>       close(fd);
>> @@ -2717,7 +2758,7 @@ static void vfio_disconnect_container(VFIOGroup
>> *group)
>>             trace_vfio_disconnect_container(container->fd);
>>           close(container->fd);
>> -        g_free(container);
>> +        vfio_free_container(container);
>>             vfio_put_address_space(space);
>>       }
>

