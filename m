Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp250726ejc;
        Wed, 11 Oct 2023 10:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvoCpNRYVF8Z/e1Ox+6xdjLGN2WmK0AScqnm3/UxxYhd3YoTxajtLOFHFrTZSLZOgLKbd6
X-Received: by 2002:a05:620a:470a:b0:775:9e64:f5be with SMTP id bs10-20020a05620a470a00b007759e64f5bemr26839737qkb.55.1697045589736;
        Wed, 11 Oct 2023 10:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697045589; cv=none;
        d=google.com; s=arc-20160816;
        b=vp909TxsWLBjXN6Pi4iPd4Hz4dDgTJk/Oogq5UOvQCD176cE7MOgitNH8op+vhCX3u
         z8tp++CFsVW/HS+jilLtpq36aVAuIVuMHgOiiD7ZTQvLCdzRMxP00Ppj7QlkFe2hTUDE
         mX9V6nGz550fygbl2B3rrp4Pxa0l1QnCH10+iNvYykI6x//xxVbu0dBoiUUxz2O132jM
         QDlmWF0cF58PaCzmvEYKYff3+kbH4iFrvFfKp8LWyX3J79Bege2YbBS/fRONLjXa142W
         91quuhEtkbGlXEXlyOPHisemDm/RNm5ACtn5jWOg/8bHU8WFphH7YPn4Qr/Xncd3RBsh
         t3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2mNUVfIFL8ZuCn7HvY/FuQYMZpE3JdbotcMhXDfOfFo=;
        fh=TQ+KLaSdCJR+FnGUoED6wjJWS9ddGc6jnYmTrrAIVVA=;
        b=G5X1Xn2DcH13v3j7qgoGr67tvjMDlTdW97+lh/dpQKBQBKsy7HYNYUrt0P74YfPeMu
         UVyjkYDm4EP09yAAgPmxv6OH0e5rOix/kcSMIVGRdIHPHWn77wcuyFbecuAvGgkDxW5n
         UdpSfp0U4WI5pbK3TZlr0iqlu6wG6iO2CxZ0GgrZud4RBatIiFK+mAPxn9j1uLSFDHDI
         LBmOwKuo8KvWXVqOKfkI8lm6h//hV3tBYqDhAMSSp2t+zdZNFBUJUUweVtZkn1QdXsoZ
         NQ5NYZYn4ev6HuFLLB4jJF3tOpM9+7PWJknG0I+xT2xVykjLFAMofdkDswLA2X0Y4RB0
         /FPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ehdqB3qK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tx5-20020a05620a3f0500b00767e30f501asi9218838qkn.402.2023.10.11.10.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ehdqB3qK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqd4P-0007WE-FG; Wed, 11 Oct 2023 13:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqd4O-0007Vz-DX
 for qemu-devel@nongnu.org; Wed, 11 Oct 2023 13:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqd4M-00010x-El
 for qemu-devel@nongnu.org; Wed, 11 Oct 2023 13:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697045543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mNUVfIFL8ZuCn7HvY/FuQYMZpE3JdbotcMhXDfOfFo=;
 b=ehdqB3qKknCJG/cnrFout3Rm/K4Wqxl6IBuTGOuxijyq4hxSEaKc+SNd8QSvvAa54dzTaL
 CLCiUomN73xXh0t5o3oIbF5YLeART27/bRF270YzWgzNWez3YbIJUeMlUi9oKBp7gLsfsp
 WTNPSDlaJh30QDFq3bDhQRhSI0ETB7I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-W5b_Jww5NB6wMvN2HJ6O_g-1; Wed, 11 Oct 2023 13:32:22 -0400
X-MC-Unique: W5b_Jww5NB6wMvN2HJ6O_g-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77576c78c11so9109285a.0
 for <qemu-devel@nongnu.org>; Wed, 11 Oct 2023 10:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697045542; x=1697650342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2mNUVfIFL8ZuCn7HvY/FuQYMZpE3JdbotcMhXDfOfFo=;
 b=GN/CGjOpZWufYfCQD9ijxvbqqKd+aiHbwEsGLg2CAaMUHnoEUL0Nq1zH+ZQW5nitnP
 av3tjP2LPIpfBk0MoeCxJ94LzGjeNU99G1HSuVJ+9JF3dJktigz3poIGKH9NQxa2QBCB
 i5jNf2EZM5XZyGxpT2dsWc6h9Lh/ahFhMKjM8bS04iVdYs4adW9vyNg65L0JWi99Aasr
 Q0FqeyoFdGEOmaSIx/RtFvedb6mJklWxtgHuyb7Ua9/IAfMuAkSdXnEkg7gYEFskdW+F
 JpNcZM3P4DEhnhu4rkoDZ5fykfYp4CBmf5hyzViuyxs3m/zA9EnzgRHdXqW43gB5mYgf
 nKtQ==
X-Gm-Message-State: AOJu0Yw8MEW6/ycXVeCAhHKzWd2otmV8mn7psS2pR5reBVONSCFb0eNS
 AnD7+CqURvs8Y+9Zi4TKxaLECTbsn3yKOf8SVorA0D3lBcPfa2ftdWOKdIor32gWSkp1xodTFkB
 8NmfbyGDtgFVeczo=
X-Received: by 2002:a05:620a:3906:b0:776:fb0c:6b5c with SMTP id
 qr6-20020a05620a390600b00776fb0c6b5cmr18425920qkn.13.1697045541852; 
 Wed, 11 Oct 2023 10:32:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3906:b0:776:fb0c:6b5c with SMTP id
 qr6-20020a05620a390600b00776fb0c6b5cmr18425894qkn.13.1697045541561; 
 Wed, 11 Oct 2023 10:32:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05620a121000b0076cdc3b5beasm5377268qkj.86.2023.10.11.10.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 10:32:20 -0700 (PDT)
Message-ID: <5ca76a92-82ab-eee6-556e-41e94cf1954c@redhat.com>
Date: Wed, 11 Oct 2023 19:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/12] vfio: Remove 64-bit IOVA address space assumption
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-13-eric.auger@redhat.com>
 <20230920140206.6de4964c.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230920140206.6de4964c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XqNTZUBwWbmZ

Hi Alex,

On 9/20/23 22:02, Alex Williamson wrote:
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
> Thanks for your encouragement to double check this, it does seem like
> there are some gaps in the host window support.  First I guess I don't
> understand why the last chunk here assumes a contiguous range.
> Shouldn't we call vfio_host_win_add() for each IOVA range?
I aknowledge am not very familiar with those VFIOHostDMAWindow's
semantic. If it matches the avail. IOVA windows I am collecting in this
series - which sounds sensible - let's create as many of them as valid
IOVA ranges. 
>
> But then we have a problem that we don't necessarily get positive
> feedback from memory_region_iommu_set_iova_ranges().  Did the vIOMMU
if memory_region_iommu_set_iova_ranges() fails,
vfio_listener_region_add() does enter the error handling path and we
will never reach the vfio_connect_container
> accept the ranges or not?  Only one vIOMMU implements the callback.
> Should we only call memory_region_iommu_set_iova_ranges() if the range
> doesn't align to a host window and should the wrapper return -ENOTSUP
> if there is no vIOMMU support to poke holes in the range?  Thanks,
On one end, there is the capability to retrieve from the host the usable
IOVA ranges.
On the other end, there is capability for the viommu to use the info and
also propagate them to the driver.

Currently if the viommu is not able to use that info,
memory_region_iommu_set_iova_ranges() returns 0 meaning we won't regress
the current code.
Then shall we use the info retrieved from the host to build the
VFIOHostDMAWindow and check the IOVAs even in that case? I guess yes
because anyway mapping IOVAs within reserved regions is wrong. This
would fail latter on on the dma_map().

Besides won't the host windows be built on top of available IOVA regions
instead?

Thanks

Eric
>
> Alex
>
>  
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
>> +        vfio_host_win_add(container, 0,
>> +                          container->iova_ranges[container->nr_iovas - 1].end,
>> +                          container->pgsizes);
>>  
>>          break;
>>      }

