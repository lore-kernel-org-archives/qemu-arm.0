Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp4120732ejb;
        Wed, 20 Sep 2023 00:28:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOJsAxHThhq4vqVr+/bSAIbbw8GKXIkrHcLjWkxejxWX5wmITqmi360ZJH68fT09rZqaFl
X-Received: by 2002:a0c:b552:0:b0:651:6edd:c6c2 with SMTP id w18-20020a0cb552000000b006516eddc6c2mr1456498qvd.3.1695194935977;
        Wed, 20 Sep 2023 00:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695194935; cv=none;
        d=google.com; s=arc-20160816;
        b=XKMDXLtRM8zf5ywVNTadbc6+Er1IAJdVOD05JbumK0KMoN16M0Chhr9dGxOaZ48Fyv
         n3s2Ynp+PcipWJtHDAl+mNP9cFvMEr1sjcTgeRswBDAimBBrVy2EdU4WxMjskoO840kW
         jMDdhv11455+QeXtMEEnyEwloptru3+kt/5IojQ9cfmfD4x4Hc8PR+bhfqV8JXuQeksh
         6qxo2flUJGElC+8wfUKXCV5qQhGUQswq/qMFiRngDGvDbhaj5KlsGQ5fCH74cMfY1wk0
         iU/OyB/CNBtwIlEpzOtRnzsBHFO9pnkyNssQts16H0UeWI9HglQfupfv/LQ0YyupRl92
         KYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JD50fnqSCdxa4RI+t75NkjYqRbcfb8PPD6gAydx4Ynw=;
        fh=TQ+KLaSdCJR+FnGUoED6wjJWS9ddGc6jnYmTrrAIVVA=;
        b=SECPhGhSSDwAOT/J9B2VL/Tb98QtEbpAjSufrSEoPBl4lJU9ZaD/Jo2WxaUoQJEjqH
         FHYZGlU/FrofYilqvTNhLCy2fcxYf/hqKcwCAqMyT82D9xBlff+Pu1xJ/dBt3YPrSL/l
         2l9TvYLd2qHBuaVf8r/olknkUJGZJH1J9HBMjimZjBTyTF+WJ/Ztm9grD0zNIW6SBu3A
         bjNVK+Zgv7q/bgU58JBt+i6Zu8KPOnPpzNcfocU9g7dYUmq2Rn5YtscL1aNJW4uf6aNl
         BLbx4U6r0lQc8x2bAC5N/wU83DRuOi6fxqfh7PZNfPx/8QCudvmjmkmiE+W9xubw02Du
         uhIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fu7fVnw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020a0ce4c7000000b006563ea7931csi6338531qvm.545.2023.09.20.00.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Sep 2023 00:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fu7fVnw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qirdW-0003fS-8F; Wed, 20 Sep 2023 03:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qirdU-0003eu-30
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 03:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qirdS-0003Lk-Gc
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 03:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695194913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JD50fnqSCdxa4RI+t75NkjYqRbcfb8PPD6gAydx4Ynw=;
 b=fu7fVnw/HA79IOB2KqeKcfg+dJIRDlCGzvN9zpsj7vTQi5UUUMw5A8KP1QG5q2pCkKUNRC
 Mh7WKNag1J6ndYSuA41bRKxa8JBqN+V+eW/nSM1c0NKF528linVzrOmq7UQvgemSGYEuiR
 IzLMVcrjjxEHhAMvMBQuRvkInvsw0eo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-imJ2ejTUPRSwTjkNXGu0kw-1; Wed, 20 Sep 2023 03:28:32 -0400
X-MC-Unique: imJ2ejTUPRSwTjkNXGu0kw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7708f711f99so806897985a.2
 for <qemu-arm@nongnu.org>; Wed, 20 Sep 2023 00:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695194911; x=1695799711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JD50fnqSCdxa4RI+t75NkjYqRbcfb8PPD6gAydx4Ynw=;
 b=hQfej3Mw8qsTjMBZhrB0QKz6aDiCRtYKqHMA+l8v88q2GcT5gUAh+bwh2Qxnb8aQBU
 hP+woddGxgdf7KZftP8Fe2qRiJLWbnihDewLK0YcHh1cvo8rD70tOUeCw5XvSqjDgoqt
 c0ktwCi1wbkbXk+GEQjbrCv+h3rrQsLifTpNus5/y1hJOfbPA1yDn9jKjR3QcbfwCAzK
 4uuvQkk0YQs9g68vxf6ll4uE8BQWq3cbfsTB6q1C+gSS7xlR0tDxb6KYKPLVXgbu+OKW
 qQPIOxC1u57c5z4SC2uYO+53zCk+Sdq2/ZfgS4cvABw6tH42c3ZWNXiX5q+nSukJoTLH
 iePw==
X-Gm-Message-State: AOJu0Yw2Y4rv9a6BnOnk0LPqgXcRx9kG+dg4uaNlkLd00eQxyXJdKx8T
 q4eMM5ay0mxx5rbaTTMj6J20hyEg6L3O8Vc+on98Wq+XFaIXtqePGTXij+DwVJ+tPRgAqR9mTth
 9rAlYtQ0b44tO
X-Received: by 2002:a05:620a:46a4:b0:770:f29f:d1d9 with SMTP id
 bq36-20020a05620a46a400b00770f29fd1d9mr2305531qkb.2.1695194911683; 
 Wed, 20 Sep 2023 00:28:31 -0700 (PDT)
X-Received: by 2002:a05:620a:46a4:b0:770:f29f:d1d9 with SMTP id
 bq36-20020a05620a46a400b00770f29fd1d9mr2305511qkb.2.1695194911417; 
 Wed, 20 Sep 2023 00:28:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 g6-20020ae9e106000000b007726002d69esm4594017qkm.10.2023.09.20.00.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 00:28:30 -0700 (PDT)
Message-ID: <bc5bf537-8456-c0d2-c4f0-5cf5f64a9674@redhat.com>
Date: Wed, 20 Sep 2023 09:28:27 +0200
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
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: UX5HR9kAd9cB

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
> This assert is a problem for older kernels.
yes I will fix this.
>
>> +        vfio_host_win_add(container, 0,
>> +                          container->iova_ranges[container->nr_iovas - 1].end,
>> +                          container->pgsizes);
> This doesn't address the assumption about the min_iova and adds an
> assumption that the kernel provided list is sorted.  Thanks,
yup.

Thanks!

Eric
>
> Alex
>

