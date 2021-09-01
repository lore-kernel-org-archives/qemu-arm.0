Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp475522lfb;
        Wed, 1 Sep 2021 06:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyElG3Qme1z4Ip2UObu2SUfHxvxUBe+As3V+07u5g+F9iK53bRjaq5qP082shV9qllu8IxC
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr34375273wra.287.1630502075760;
        Wed, 01 Sep 2021 06:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630502075; cv=none;
        d=google.com; s=arc-20160816;
        b=NDI+pEgV11K7K4Mnm8w1SLXGHimVNJpdH/IHqMsdDMM7zh+F9tGMFJjxQjXb9AxF/2
         O31P5wY38EBmVPqPj+mLF2Ez0c3vJBjqmOaLjupMokStConT+kRTyGiEraHPhru244AG
         GS35PngzFt92qahYjCh+v5GkpZ8rsVvcRj7+bCAG4t9q7ZTrirnNTVplxynbfDvvYR0p
         F2MNU8nYy2a+Zm+TstGdzDuC4A5TshJq8Y5n5h5nhmSVfD0hf/E6s7ZgCdZUlp3xClFa
         RW3Q8mrBKb6MT+DEusmw7CiJdQFQJ/d4+uhsbMQIuNN/nP0OTS8UqUSWTKpubTZ0s2On
         TydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zTq8bzNn/15bWWZP7Imc88LXypLn3mTLFNxBVP2+CAo=;
        b=mZRO2nz5btTVI+poqXrkg6/lFcHgW0hUMtYbLTqS/S/TToECF9v/eeGaQpzsAaopFB
         uLE289U89+xi12uatNGe2+8o+BX/dKnvVeuyEVQvWd1v3uy5TmbG7tgwJTKkAv1OJPcz
         YNhjK5w5YUb4aGHMvU47BGdiTlKkPVUL78FiDTuILjQiLCK1Y0W76rXKk1K1ry+TUmWp
         UMTl1QHCv7Qa9YNM1v6bsoi0mpXsyrDoTIMgGb2wQeoTSchXXHBQ0+QrpmVEy5ALGFq0
         Xrv+/gRI4yansDFwTPLdjwEbxHMXARXw8Ruzqmb6oMJxJ6+lZS3QOvGyhZaz4Lgsta7A
         2DBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTIfx1VW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si6922327wmb.209.2021.09.01.06.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 06:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTIfx1VW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLQ4Y-00056z-K5
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 09:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLQ4D-0004k1-27
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 09:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLQ4A-0007ls-KQ
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 09:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630502048;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTq8bzNn/15bWWZP7Imc88LXypLn3mTLFNxBVP2+CAo=;
 b=CTIfx1VWntzYqGCAmslNuRUc2xXL5+8vftUj02MeqFKa2dvP6ClNGpprA19xB458a8R/wO
 TO5xAh6+zA3Z3rFbYpnKF0T1hFyerIjki8JrnicDjX2xxujPazl9fyDx776Z68DSVTeFAy
 CNEoZ8PxPGGpivcCn6Btbsg61AZk7nc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-nCFMd-OiN9uBNoN0CUh3SQ-1; Wed, 01 Sep 2021 09:14:07 -0400
X-MC-Unique: nCFMd-OiN9uBNoN0CUh3SQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f128-20020a1c3886000000b002e887c95e07so1025996wma.1
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 06:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zTq8bzNn/15bWWZP7Imc88LXypLn3mTLFNxBVP2+CAo=;
 b=ayJEj/r4EYZmMHQ7KHs5YuhFs/nVcSkri6aWItnmJY0J9b9hRFjZQ9cD4xRIaMRvIA
 PPIIyNjnR3iFRBNPorOESB3rx2O6EI8mTArwSrvTfhqFK4K6ubQmkpUbAgdlhZAK9Dke
 A4+VmvwMCMYPej67LhSHAQB13RvHsDQSW8Jtuo6r6or2Zhv8CiWVF09JYquHKuaqJLff
 TaEFFlfw7wRMt4VsFBmLkRomne8SlBBK6VxRp+kurLfn1qaoOSL0M1lyPpTkPQj6e76W
 Z+OPs9DSGvLIm5knOAOgr0fPj7sPUrRoH9zvjwAxQAscfLX/ppiP5IRBIhIKsBoukTIM
 Rjaw==
X-Gm-Message-State: AOAM533HWGgGATm4O9fHfYBFeB6KIPUwInf/5VD2CmdZOh3x8sdhMkhr
 PLbsBq0b9E4VSTVN63cHUHZhr8gzIHKkxVZt7+qFzNwLufGxk0czWyP+6WPTX6P53HsFT047epX
 wTgInZUOMoMQE
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr9820010wmq.6.1630502046693; 
 Wed, 01 Sep 2021 06:14:06 -0700 (PDT)
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr9819982wmq.6.1630502046423; 
 Wed, 01 Sep 2021 06:14:06 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r12sm21903785wrv.96.2021.09.01.06.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:14:05 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
To: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
 <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
 <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <48a545f5-d21c-85b1-20dd-b5449b88e993@redhat.com>
Date: Wed, 1 Sep 2021 15:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6FKG3B1g+umd

Hi,

On 9/1/21 8:33 AM, Liu, Renwei wrote:
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Tuesday, August 31, 2021 10:46 PM
>> To: Liu, Renwei; Peter Maydell
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Li, Chunming; Wen,
>> Jianxian
>> Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
>>
>> Hi Liu,
>>
>> On 8/23/21 9:50 AM, Liu, Renwei wrote:
>>> Simplify range invalidation which can avoid to iterate over all
>>> iotlb entries multi-times. For instance invalidations patterns like
>>> "invalidate 32 4kB pages starting from 0xffacd000" need to iterate
>> over
>>> all iotlb entries 6 times (num_pages: 1, 2, 16, 8, 4, 1). It only
>> needs
>>> to iterate over all iotlb entries once with new implementation.
>> This wouldn't work. This reverts commit
>> 6d9cd115b9df ("hw/arm/smmuv3: Enforce invalidation on a power of two
>> range")
>> which is mandated for VFIO and virtio to work. IOTLB invalidations must
>> be naturally aligned and with a power of 2 range, hence this iteration.
>>
>> Thanks
>>
>> Eric
> Hi Eric,
>
> Could you try the patch firstly? I want to know whether it's failed
> in your application scenario with this implementation.
There are many test cases, virtio-pci, vhost, VFIO, ...
> I agree with you that IOTLB entry must be naturally aligned and
> with a power of 2 range. But we can invalidate multi IOTLB entries
> in one iteration. We check the overlap between invalidation range
> and IOTLB range, not check mask.
This smmu_hash_remove_by_asid_iova() change only affects the internal
SMMUv3 IOTLB hash table lookup. However there are also IOTLB
invalidation notifications sent to components who registered notifiers,
ie. smmuv3_notify_iova path.
>  The final result is same with
> your implementation (split to multi times with a power of 2 range).
> I wonder why we can't implement it directly when the application can
> send an invalidation command with a non power of 2 range.
> We have tested it in our application scenario and not find any fail.
Assume the driver invalidates 5 * 4kB pages =0x5000 range.  Without the
loop you removed

in smmuv3_notify_iova()  event.entry.addr_mask = num_pages * (1 <<
granule) - 1 = 0x4FFF. This addr_mask  is an invalid mask
this entry is passed to components who registered invalidation notifiers
such as vhost or vfio. for instance in VFIO you have '&' ops on the
addr_mask.
addr_mask is expected to be a mask of a power of 2 range.

Does it clarify?

Thanks

Eric
>
> In addition, from the code implementation, smmu_iotlb_inv_iova()
> should be OK. In another call smmuv3_inv_notifiers_iova() ->
> smmuv3_notify_iova() -> memory_region_notify_iommu_one(),
> it also checks range overlap. So it should be OK if the range
> is not a power of 2.
>
> Could you take a look at it again?
>
> Thanks
> Renwei Liu

