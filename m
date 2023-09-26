Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1341596ejc;
        Tue, 26 Sep 2023 13:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnMQHXDBOAX39sXwBVfJeRaCJhPF5+FCQiZNxQl2iqhQQESBqd2CMwQSNgT7Use7+uCD8A
X-Received: by 2002:a67:d011:0:b0:452:7767:9058 with SMTP id r17-20020a67d011000000b0045277679058mr69866vsi.31.1695758475859;
        Tue, 26 Sep 2023 13:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695758475; cv=none;
        d=google.com; s=arc-20160816;
        b=Zt+cCJ+RMWR9zQqhZkTVWunYwI9/3RXqLWdhXI/BseKCwGoIFDHslAZC0TrYEsRiSe
         VfsxeLJWjwiSlqLC/wpEJdKIPmoaylqEhZR0qyZDRlS+T/ZbAK9VPOS09eU/B6GGcm+3
         9tVFj8gMcC3rnWucaupDzXQpOa4td5Qyh+Q47uSuP1qjPdbZNiA94gv7Z6A648T2kaEJ
         8o8waX70lAfbaDyfKEtvqH0eP6rTGn8KB80zGprnKRkNtvAvZyDjr9690x+AKS/30bvv
         X4MxyULoyaFTRvFa433G/CSKIFnYWWqDJfKIyassSehoCNoRlY9YKbSjOA8IpqTQTGli
         lV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KL6Maw2rsrGisqHfV8bVwJKb4U0qlfOa9egyrfzZ1mA=;
        fh=TQ+KLaSdCJR+FnGUoED6wjJWS9ddGc6jnYmTrrAIVVA=;
        b=iOLoAFs9XBoSL7cA6DnSwy6u06JJxEHyXP0C/j5V3Uhh8rS7EkaIrs91Q1cVVAaq4m
         kI4ED5yR1oy0J6THc4KmB/1jTi3HtNmLNEcN58k2vcfQUSOxcikTRINCToVkcHYM8Nkv
         9DVjdT6xJy5V/2FZ/b1pbV9ehVP1ELS4h7AhFbJoWI/hB+CBJ3CrdSxpHYVEUffe/Fdy
         swZAbVOid/bDOMXYu60OQC5gWf06ROVfpKEtXl0+zLZ5HBYmm1Qt+H09lpJ94Ba6syVz
         T3Tdnb3JuUrggMtH1+9CGsOptahGYleRpX/hPpcReldEQBhf2PmPuNZ1nQKzjL+d6LjQ
         v9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VpLRMdQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a0cdf86000000b0065b0541ddb9si3359739qvl.93.2023.09.26.13.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 13:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VpLRMdQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlEEz-0002Jm-3G; Tue, 26 Sep 2023 16:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlEEx-0002IF-8N
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 16:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlEEv-00060G-AF
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 16:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695758458;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KL6Maw2rsrGisqHfV8bVwJKb4U0qlfOa9egyrfzZ1mA=;
 b=VpLRMdQGaxRzb27wBpq/+w7PWFsBq5Vy9hh5GkUa8BfYfKZAJUU3jsS09L/q+f42dgrO8d
 3PuqD8IdSznUFNp2cHR+D81tPwxP/5AOPYF9xbF7bNZgqg8qlydTg1icjNidU6ZHjtpxaE
 nEvtEnY2qQ2RQZ6KR9BGe7qW7abw5R4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-AkMQoIbrOx2XAE4FFL4pNQ-1; Tue, 26 Sep 2023 16:00:54 -0400
X-MC-Unique: AkMQoIbrOx2XAE4FFL4pNQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso7700568f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 13:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695758453; x=1696363253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KL6Maw2rsrGisqHfV8bVwJKb4U0qlfOa9egyrfzZ1mA=;
 b=cBwnT97LBDCU5haO0RUOC31hOoB8lW/KiBjcNMDcNOJABolSu2Fc8kKU58Lgu+BWvU
 scQ4darZqQmYS8/GWMmD80clBi1F3CRa8U5HNnZM1fIoaS4DTw/f/QYHw8NFqZ8bWtFS
 hm6X6P0SyB5IpoCXC1r4JH83Ur6PCw44aDylWet+Z2Hsg6fY9sKj/QxCdFlQNBvS5hof
 BA22fEnubwI4BZ4IFABuyBEvub5Vh9WkLTbzjVHv2KIu2h/MLYjqlNCJiK2Cz0mAgFiF
 3T+TyOaC2QKvd+sGvkVxf7xhjl/2UMYCInVD3DnLrEzIBgg5EV7HjGjJjiOjs5irMZrr
 CA1w==
X-Gm-Message-State: AOJu0YyPGtXJ8HjMrrrVvRhXRKpojQC8sNYGoW027uEkN9lzaYoUidY8
 rWCFLiMEu5myB83x2RnoZ1wWWnwmpkQ977AoZc0tcvQ+ycqxQZV9E49th1yUoVk/SGyW/X0oWqd
 NY7jyyoF1ERl8
X-Received: by 2002:adf:fb44:0:b0:31a:d551:c2c0 with SMTP id
 c4-20020adffb44000000b0031ad551c2c0mr9669089wrs.57.1695758452961; 
 Tue, 26 Sep 2023 13:00:52 -0700 (PDT)
X-Received: by 2002:adf:fb44:0:b0:31a:d551:c2c0 with SMTP id
 c4-20020adffb44000000b0031ad551c2c0mr9669066wrs.57.1695758452589; 
 Tue, 26 Sep 2023 13:00:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfd087000000b00317f70240afsm15312653wrh.27.2023.09.26.13.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 13:00:51 -0700 (PDT)
Message-ID: <39bebc9f-7ce0-9428-e313-f09798669259@redhat.com>
Date: Tue, 26 Sep 2023 22:00:49 +0200
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
X-TUID: hCGw5YFX5Qsy

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
>
>> +        vfio_host_win_add(container, 0,
>> +                          container->iova_ranges[container->nr_iovas - 1].end,
>> +                          container->pgsizes);
> This doesn't address the assumption about the min_iova and adds an
> assumption that the kernel provided list is sorted.  Thanks,
Damned I was effectively thinking the array would be sorted but the uapi
does not document this :-(

thanks!

Eric
>
> Alex
>

