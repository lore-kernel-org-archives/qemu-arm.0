Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp295539ejr;
        Tue, 10 Oct 2023 10:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEIa/iLOlxDbuEmi6lkmCquZF32qwPaatktlCUVvO7TeWVve0dbAFLW3oJoPqXmwJOwmlJ
X-Received: by 2002:a7b:cb8b:0:b0:3fb:e189:3532 with SMTP id m11-20020a7bcb8b000000b003fbe1893532mr16537880wmi.20.1696958245140;
        Tue, 10 Oct 2023 10:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696958245; cv=none;
        d=google.com; s=arc-20160816;
        b=bO2+diL3QKO65P4LoOwgPnYlgl7uxj3PHzeaTVHGhRkEWG6K/h+PeibXmxswTuvKFC
         QsSQSLEUaz3SoqVPP80KwgsMZdIV4RAOLHykarJMFyA+uOOSMrGGTETJ2SKEd4BvYuUa
         gTEAukZ+9gjrj9GQ1rBv28ZGw/2pbz11H0TY0UGpceixlunwQKuvGuEahuEf5UxOkpXj
         by3tTGaXac9PbXSApDvHTb/tvF6A2bkuRxbj6rU84kniaZxDPntNhjGQ23mK9fbXSETc
         Sg3skEDh58IRH1CylsrizYEuEDuL9qiWbsdOV1/y+8+OaUZNBiUshWbwMkDlC+yJaHq4
         FRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DhM0vSBQjsI9sbUzXZDFwUDwQPB4RCHDAmLe5ux6yBo=;
        fh=TQ+KLaSdCJR+FnGUoED6wjJWS9ddGc6jnYmTrrAIVVA=;
        b=hwJbq2l50khGaDIpQ4hG4ns/g0wOwt/vsQkZDVle5VNYhjXMprseErGZpEi3tNP4b+
         6iJQo2ESnUSP8Kt6bIS7Hq04eQhwwkf6mmMzkegzth2QvkDhRCOzPLRBcSmnnTQmKr9O
         pcG6yn7sGSdGoAdKpjiiAhyLeRUzthN83UB5HeZAZYXVHK0aCJwvZrd2WTyNjaejA3e8
         NEBDmaJ+RH6qZzlRxLG3fHZ2Ercs4q4IQZB8Yq9Ae1Mqwr1I20dv1YwpbC3PX5tSsvb5
         BHMMMylWsvVtb3fIsY7baf1Ld/l/zHoCEZ+MIhKCXifZ9SqyBj7Ey1I/idww04xKuzaF
         8ZSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1naoYeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a05600c358600b004068bb3087fsi6924865wmq.220.2023.10.10.10.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 10:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1naoYeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqGLl-0003o5-Re; Tue, 10 Oct 2023 13:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqGLa-0003mP-Qg
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 13:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqGLY-0002w7-0P
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 13:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696958199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhM0vSBQjsI9sbUzXZDFwUDwQPB4RCHDAmLe5ux6yBo=;
 b=K1naoYeZ7V9XD5uy/BOucv6LXeZNxLcjqyeZv5tSGOju2t7EnONEEXeJHZLGUDYmwPbgrs
 skjb193Jd9lLHuykRq3F+qOkSKGF2KFvvYAXjXeHI/bqJlA+fB6q6j0NFvKcPMgvhSYUt2
 VpfRz6ihdpHwIB4Gv6FYrmI6ILO3ueY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-OBIUYEK-M-6thMXtxFSvjA-1; Tue, 10 Oct 2023 13:16:36 -0400
X-MC-Unique: OBIUYEK-M-6thMXtxFSvjA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-774292d71e3so678917185a.3
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 10:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696958196; x=1697562996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhM0vSBQjsI9sbUzXZDFwUDwQPB4RCHDAmLe5ux6yBo=;
 b=VorGjC3z5qST1SJHWNpLBYbV4UH7qJe1A3cG5If4BrlIq4OsRF8n2DuLVq6OFrt86t
 KaenNmOPiuEQZ3zRXJguDkn2i+kkmBHlTvbczhyTwHmoYPNMO11TCNV8n4WPxGC1zOKC
 v/773UOvkSrdSgv2525SaVAb2rWPmR/OIqlIrJXw7OdaQz6LprH7a6adzR8IpNV9XTHz
 yZZazXoTM2BXjyINfWdE7MCUgxaMK5FeR5KxU2QrUYA9DikduyVBOkqQzWOFg1ZJTW0S
 T5xtU39O9Tkrxiv8p299mt+cQqfUCovgkvkZaqWpDkqY8VkcO15YIY58EQuzLbWZ8hzu
 exmg==
X-Gm-Message-State: AOJu0Yy6VX9NzR7z/o/51OasYI8uHBMvHmwTWnGJcwejRbd5pgr7JhBv
 vDT0ikPtBPftU9nnQlxt7qqkDgA+J0mQT3kYDN4OFAvB2tmJhC8cyWB9xhSeeppf1ZrvB9eDpr2
 SPm5v4dxQccm9
X-Received: by 2002:a05:620a:999:b0:76d:ada0:4c0 with SMTP id
 x25-20020a05620a099900b0076dada004c0mr17743634qkx.76.1696958195837; 
 Tue, 10 Oct 2023 10:16:35 -0700 (PDT)
X-Received: by 2002:a05:620a:999:b0:76d:ada0:4c0 with SMTP id
 x25-20020a05620a099900b0076dada004c0mr17743606qkx.76.1696958195512; 
 Tue, 10 Oct 2023 10:16:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ae9e914000000b007740c0e52edsm4492032qkf.89.2023.10.10.10.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 10:16:34 -0700 (PDT)
Message-ID: <087d9ee8-2c89-f080-ae09-4027ec396028@redhat.com>
Date: Tue, 10 Oct 2023 19:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/12] vfio: Remove 64-bit IOVA address space assumption
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-13-eric.auger@redhat.com>
 <20230919112230.5dfe14fa.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230919112230.5dfe14fa.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-TUID: 7nifdoQFkEzX

Hi Alex,
On 9/19/23 19:22, Alex Williamson wrote:
> On Wed, 13 Sep 2023 10:01:47 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Now we retrieve the usable IOVA ranges from the host,
>> we now the physical IOMMU aperture and we can remove
>> the assumption of 64b IOVA space when calling
>> vfio_host_win_add().
>>
>> This works fine in general but in case of an IOMMU memory
>> region this becomes more tricky. For instance the virtio-iommu
>> MR has a 64b aperture by default. If the physical IOMMU has a
>> smaller aperture (typically the case for VTD), this means we
>> would need to resize the IOMMU MR when this latter is linked
>> to a container. However this happens on vfio_listener_region_add()
>> when calling the IOMMU MR set_iova_ranges() callback and this
>> would mean we would have a recursive call the
>> vfio_listener_region_add(). This looks like a wrong usage of
>> the memory API causing duplicate IOMMU MR notifier registration
>> for instance.
>>
>> Until we find a better solution, make sure the vfio_find_hostwin()
>> is not called anymore for IOMMU region.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> I have not found any working solution to the IOMMU MR resizing.
>> So I can remove this patch or remove the check for IOMMU MR. Maybe
>> this is an issue which can be handled separately?
>> ---
>>  hw/vfio/common.c | 25 ++++++++++++-------------
>>  1 file changed, 12 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 26da38de05..40cac1ca91 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1112,13 +1112,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>  #endif
>>      }
>>  
>> -    hostwin = vfio_find_hostwin(container, iova, end);
>> -    if (!hostwin) {
>> -        error_setg(&err, "Container %p can't map guest IOVA region"
>> -                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>> -        goto fail;
>> -    }
>> -
>>      memory_region_ref(section->mr);
>>  
>>      if (memory_region_is_iommu(section->mr)) {
>> @@ -1177,6 +1170,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>          return;
>>      }
>>  
>> +    hostwin = vfio_find_hostwin(container, iova, end);
>> +    if (!hostwin) {
>> +        error_setg(&err, "Container %p can't map guest IOVA region"
>> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>> +        goto fail;
>> +    }
>> +
>> +
>>      /* Here we assume that memory_region_is_ram(section->mr)==true */
>>  
>>      /*
>> @@ -2594,12 +2595,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>          vfio_get_iommu_info_migration(container, info);
>>          g_free(info);
>>  
>> -        /*
>> -         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
>> -         * information to get the actual window extent rather than assume
>> -         * a 64-bit IOVA address space.
>> -         */
>> -        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
>> +        g_assert(container->nr_iovas);
> This assert is a problem for older kernels
this will be solved in next version by letting

container->nr_iovas == 1 if the kernel does not support the api, in which case we will assume 64b IOVA

>
>> +        vfio_host_win_add(container, 0,
>> +                          container->iova_ranges[container->nr_iovas - 1].end,
>> +                          container->pgsizes);
> This doesn't address the assumption about the min_iova and adds an
> assumption that the kernel provided list is sorted.  Thanks,
agreed. In the next version, container->iova_ranges will be a sorted GList

Thanks!

Eric
>
> Alex
>

