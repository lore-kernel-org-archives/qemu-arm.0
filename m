Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1143846njb;
        Wed, 27 Nov 2024 15:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPcSztrp0k2itdjDJOmtE3zRH7RO/T15dp3MY1wNwQ2O12SJ0IMztH/4b0jcxxR/Zl755HYNyHSXIxCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFrPJuTGInBls29MtSnwa4+ZNpUyN503WI+7wuB++OPhdapufiAH35A0h+ccef2AIlseS+L
X-Received: by 2002:ad4:5ce9:0:b0:6d4:22be:9823 with SMTP id 6a1803df08f44-6d864d7a6fdmr70993936d6.24.1732748663127;
        Wed, 27 Nov 2024 15:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732748663; cv=none;
        d=google.com; s=arc-20240605;
        b=AoCJ5bE67hj5+F64JaWlaNe8qUg8UVT5luE+ywxCDC6UvP8TxOzvgTeZeKa+GIcffs
         gJkvlVQMvMu+bh1FzJwIccGpVRNn7yzefpqAZiI4h4GywBXE8jDYYT22lF0HxcaKxD+/
         S+LOyyYqo1+WreCGh28IYxcE5Im6yPT4g7mKahqfoU0DIcu/TTWLYYdcC7H1sBsNxNIK
         NZc/N1LDwCU9WeSGfpFx9Pw0UW8Mz9Inj21NLPm0r1wuhB6qilPR+VnP7GvFPCfNt1aK
         02nIyTlEuJCA6RtmdwHkIn9YTjy4fO/HNa0r5CK+Gx+K7xhtwhyJsQWBp9yNY5AagsoJ
         BzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=B12QmkB/sHu/AYYcn0kiQkDRQSRXiLEWmIUis3o0v8w=;
        fh=zuCGMxchAGG2qCvrXLy10vzOp6cpQC1NbQM5ydfJGu8=;
        b=gqd6mDspxsurY7X09yERFZFuzWOxQJLT4YbH5ABw3eD4MOisXgxmjsh4dpwkisKCXT
         s6GYrId+n1DNBaPYdZD2XfS6if39KcPnr3Ce+Lxx2798nyt9C3BtbWEO6lqCt3O9f9QG
         7Uk45R0lTcjG68PmMK8ID/WmAoLg4/JNLTNVVsvfgKhYPnWJjQYyv1w7R8CsJWiwGsiE
         cSzrJjRygg+SdgMwRavKfrx48FEgUNQkPfetclWK2J1P0Xp/zbWRoyX82ZP386FR2C1u
         tUl1QdVMa3oYUyBOIwrU1+hwvN5TIh4bcOTBPRjLFoWCOOxeVIoNkRgmLFcrqVLTD8x7
         k9hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+AUrKve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875581dccsi1389786d6.473.2024.11.27.15.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 15:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+AUrKve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGR4g-0005yu-2U; Wed, 27 Nov 2024 18:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tGR4d-0005yT-Dj
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 18:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tGR4b-0005Lb-Sa
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 18:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732748628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B12QmkB/sHu/AYYcn0kiQkDRQSRXiLEWmIUis3o0v8w=;
 b=X+AUrKveuRr7SxkB/HkSClw+Om3sgck6MnM08erPJaOo3BaDjO+YtaSD3wu8Zc2xqYnZ7w
 th551hKdBJy3OqMtojLWP5f3cyvZ+wOhviweFqbTpyyIAZgDZi7pIZ/oV8aPfgqzUtBu4U
 ST+y2O3Y5ICDlPFaugxOyTS6Pn/wwvo=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-JPSivnPsNbq0je_sgTrYDg-1; Wed, 27 Nov 2024 18:03:47 -0500
X-MC-Unique: JPSivnPsNbq0je_sgTrYDg-1
X-Mimecast-MFC-AGG-ID: JPSivnPsNbq0je_sgTrYDg
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-84182041b05so17458939f.1
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 15:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732748627; x=1733353427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B12QmkB/sHu/AYYcn0kiQkDRQSRXiLEWmIUis3o0v8w=;
 b=Hj2g9y8R50XI+UTCYKUkBEpW3N4vOsmitAKP1gSTEEGCdbOqWbkPYrSz6nfzeSziV+
 jCzUlJUH+52Lt4sU/y9y9GlcZEBkiPSafrJU8vK+fRBxHR2S2Min86CAEhzjK/raSNcJ
 7G14q+Y3faXrg2eWpWNYRXBvQfya1bh5WrQcwlQsh/XkYHqf+IX98yYq75nPQWXdcbGK
 7ApeobjJAfurRFXxyCsYU4FOaXgPg6WRBJrt1/ByzB4NUA2Iatsp93hNgBElQGlmLheQ
 0ADmuFm5rseNiypqKQ/f0HwnpH5cemdHzP6+PSEC8d5OeKpB0F/E7jN4SRJ3Tj0k0P4K
 AR2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNc8gRYJvp6IRA+ozZW9Z6I2kA8CD7IoS1XXp221IROwAb3UuWZaprd6ndLY6LaWWjCEyCfLre1w==@nongnu.org
X-Gm-Message-State: AOJu0YyBTbXhz90Ua4BN/XLxnfhSl/eItiotrL+QF2GVZlasv7SDRgga
 lUGXr2Gs99mN37HXpkRW9pdBQVzsaT8KB5Wl9+JfNaw1pfrDduD2y9AIBTzJf9Efhu6vEN9j5Pw
 72FrLedtaRBz+IykDhrAnyIUMIOEn1Je1qQ+m6RVGnwr8VYjXNQ==
X-Gm-Gg: ASbGncveDGRmvjQg88JPONsbSo/yzUubfwUu7dGxGqTrGILQmKbnN/gn98YNo41wlAP
 eRMwVO+E/+BOBZ0ZpnBGVF3KY1WQs4i8ZZXcJPiMMYlnD1rI/QstDH9M872dpchEdjcRwrv4MTP
 sfbui8hqTTzqkQZV3AEgn0c1yedHUHCqzL2/245B2XoXgdRwnuDX941a027RaeYXooG8KBqpWYK
 xsfHNi7n+MGbIUpvyoAeJy2iig51wrXLvCMYOmOkoEfybSVucI=
X-Received: by 2002:a05:6e02:3312:b0:3a7:c5b1:a55f with SMTP id
 e9e14a558f8ab-3a7c5b1a78bmr45534815ab.0.1732748626757; 
 Wed, 27 Nov 2024 15:03:46 -0800 (PST)
X-Received: by 2002:a05:6e02:3312:b0:3a7:c5b1:a55f with SMTP id
 e9e14a558f8ab-3a7c5b1a78bmr45534515ab.0.1732748626403; 
 Wed, 27 Nov 2024 15:03:46 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e230e5ec80sm14862173.86.2024.11.27.15.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 15:03:45 -0800 (PST)
Message-ID: <9a62fa8d-a7a0-4bc1-bccb-2fcfaa119d65@redhat.com>
Date: Wed, 27 Nov 2024 18:03:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Jason Gunthorpe <jgg@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20241127160031.GA1253388@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fIfplPZVxZ1dspnZs7MiRtle_KXgXJOxleqwBQOT0Bc_1732748627
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ZI96Dkfz786



On 11/27/24 11:00 AM, Jason Gunthorpe wrote:
> On Wed, Nov 27, 2024 at 10:21:24AM +0000, Shameerali Kolothum Thodi wrote:
>>> For SMMUv3, NVIDIA-specific vCMDQ, it needs a parameter to state that
>>> specifically,
>>> since I'm concluding from reading the SMMUv3 version G.a spec, that
>>> ECMDQ was added
>>> to be able to assign an ECMDQ to a VM,
>>
>> Not sure the intention of ECMDQ as per that specification is to assign
>> it to a VM. I think the main idea behind it is to have one Command Queue
>> per host CPU to eliminate lock contention while submitting commands
>> to SMMU.
> 
> Right
> 
>> AFAIK it is not safe to assign one of the ECMDQ to guest yet. I think there is no
>> way you can associate a VMID with ECMDQ. So there is no plan to
>> support ARM ECMDQ now.
> 
> Yep
>
'Yet' ...
The association would be done via the VMM -- no different then what associates
an assigned device to a VM today -- no hw-level (VM-)ID needed; a matter of exposing
it to the VM, or not; or mapping the (virtual) CMDQ to the mapped/associated ECMDQ.
They are purposedly mapped 64K apart from each other, enabling page-level protection,
which I doubt is a per-CPU req for lock contention avoidance (large-cache-block
spaced would be sufficient, even 4k; it's 64k spaced btwn ECMDQ regs .. the largest
ARM page size.

Summary: let's not assume this can't happen, and the chosen cmdline prevents it.

>> NVIDIA VCMDQ is a completely vendor specific one. Perhaps ARM may come
>> up with an assignable CMDQ in future though.
> 
> Yes, it is easy to imagine an ECMDQ extension that provides the same HW
> features that VCMDQ has in future. I hope ARM will develop one.
> 
Right, so how to know what op is being "accel"'d wrt smmuv3.

>>> ... and all needs to be per-instance ....
>>> ... libvirt  (or any other VMM orchestrator) will need to determine
>>> compatibility for
>>>       live migration. e.g., can one live migrate an accel=nv-vcmdq-based VM to
>>> a host with
>>>       accel=ecmdq support?  only nv-vcmdq?  what if there are version diffs of
>>> nv-vcmdq over time?
>>>       -- apologies, but I don't know the minute details of nv-vcmdq to
>>> determine if that's unlikely or not.
>>
>> Yes. This require more thought. But our first aim is get the basic smmuv3-accel
>> support.
> 
> Yeah, there is no live migration support yet in the SMMU qmeu driver,
> AFAIK?
> 
> When it gets done the supported options will have to be considered
> 
> Jason
> 

