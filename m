Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3117476njk;
        Mon, 2 Dec 2024 10:53:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSZDowobKrnxbnjZreGD84C6lUDkAObHOl08Fz/hOWn+TnvIRL/ygiJ0zs1lDScWdFHhzBGQu0FetWFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHsC08/YZ2KUF8qzYzkWlNGJkshE6Sfa/ml+qTx7VelAQjjKLn69BA7V/yOkqlkvxVeNE2E
X-Received: by 2002:a05:6214:5296:b0:6d8:8c51:5585 with SMTP id 6a1803df08f44-6d88c5155a9mr219419086d6.15.1733165633293;
        Mon, 02 Dec 2024 10:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733165633; cv=none;
        d=google.com; s=arc-20240605;
        b=W+8U6//gIInkHpxT5upxU4Yywfon6gw02PG/gfrrnep6YFHB4XqLMvaErlR2jwZTHa
         tskpW5wngHNvy+8EMcme/FkQOmW4LufWuWnSoZckhzIb09yrObJ2qcPyV2JFUxNjAK75
         s6De0ZlaIayZY3lYSTrC2UFrANKk7s2SLoTpkAgVyvNDODpNGsCR/bt7fqr8yUbm6V94
         puAT/J0EFx3/ffRFO5hbFegyhezqKHCPQHU75MDvPhyDvmad6Cecw7Bn3vyh7dcvJzZh
         1fzydJ0RmA3lbAU2DDDk2bziAlDmdJn3dIp1/fo/kG8sxS6d6FVDwAl/lcWeNj2n8vq1
         3ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=T2d3o4zFKpl8XI9/C48C2l91IQs53Z7HqX95j3jXgBg=;
        fh=62GaoJgBEgVF2kpcWZ1eklRerwMtIeA6tesqdT0wwV8=;
        b=XFoK9UF1pMLd5dYDep4GT7dUBV+SGPIb0aXXBOZrlegKxXPy2wXSJ9l4XItjLF1fLu
         g1DJX5tAQYvqfWcbVbgGW+t41tFj4kwirtIDUn9fo9pNG0ay+C74JFTLU94UESFpwcBr
         TE7NzFmyV3mPOiiM1L49iYDp4xIm9nrDVnbCwM3QHsHIwZo+OTa3B6V2YLppFuYH6D2F
         z2pywvHZxHMRciiMQ8yKydzuoVrXTXvBKIROqmSaPQlXkQRaz3Es+c5mXc6O6bOy78gD
         3jyeO5Wv8Sq7Md6xXi48BXrp8wSbnHOT3hwTOkDQZjKI9S5rGJ25B504MPXJEwjjXgRY
         xoJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sn50Qrpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89489be4asi67382676d6.197.2024.12.02.10.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 10:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sn50Qrpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIBYK-0007NN-M1; Mon, 02 Dec 2024 13:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tIBYB-0007Jt-3J
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 13:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tIBY5-0000Cx-LH
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 13:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733165611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2d3o4zFKpl8XI9/C48C2l91IQs53Z7HqX95j3jXgBg=;
 b=Sn50QrpcvXqtToKcLWZ1OXEesm0MXFLIXxPT7ujVLX9QeBHsDrsflVd5+wRzq3vhHj4ojh
 T9IVtb9N7do+yu4PPdiouQ4VWsYogRzCHCmLFDtGG6YDivL13EuKssGFvS1ik6z6PDK464
 GG2dgoFklPunxsNeNeGyV/4ZnMflSa4=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-5wzWgY1ENH25azHs6QF2aA-1; Mon, 02 Dec 2024 13:53:30 -0500
X-MC-Unique: 5wzWgY1ENH25azHs6QF2aA-1
X-Mimecast-MFC-AGG-ID: 5wzWgY1ENH25azHs6QF2aA
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-841a9ae0f26so776288239f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 10:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733165609; x=1733770409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T2d3o4zFKpl8XI9/C48C2l91IQs53Z7HqX95j3jXgBg=;
 b=YTS2Yw4jgI23OiFWVINNHgGz3tMr8gCZRKT/ggY9RSBt7PQFyAhBhjpc1jfVro4q3T
 jXrwJZUS8NSEj9WisYH6TPZq5yEvTlaXcsuZi7SbALvDv7NF+MOQ0HSqmPJzMIxhku5c
 InmrIUuiKdmAf23PxHXd/TRPnl/7X0+4t026NCUn3QkBLYUQjbrcK0WNUE4xY58t2Zfn
 ppKYMbgL/KE2RbRvO7zbAWCG+ptgYAO/i5DE5xjCEY1jHJVThRJs5DJ1VRwDih0l9Bdu
 ACzN7jMMeAy1yMPkjx4Uv7yetNUYPA3VeNdyb3XKCafvRhd+00tiPgLUdIgXY3wqN7dx
 kZdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWIMkLZjuTDqpy8kB+yzKZqa4GNgUl6AYWOEf4sKVoRsvMpTX1ySh6h5MctPjf3cIejuCpB5cfeQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOzUNwNHp8k5FS59VWwT0tScqrFpi3tMj7vipXguPf4f3fqZFt
 zOExL3Os+kFTzFSauWWPXSGM3PoyC3v69rX2j3pK/FxATA6aOKCiLjZByHNUajYpPVZhpknxmn0
 Fyn4vyZfloinQQCJm4csijG6cfLJSPgKbPLXS/v6+NuFsTERWiA==
X-Gm-Gg: ASbGnctmEArMIFfC2XikIRzFl6yuA7786ksiF/ZsxNFIcN5NIg54V227QCr9M1ZDCDH
 lQNLymnYHK0/gfimJAVP6b3XX963uLYdYA4lxlWlRl8cRF+Wrd8K7wc/Ali0T8D3nVVLA8zf3QK
 gB4lT70Bq8Ws9/NmPrB+ymyXlFrZ0LCBYOCPfLWX+bU/dJGgC411yBlhM/f1hEyKymVPixnsavd
 jPPCrEOsVPxBAc0w79Yjq4DWXHG6CIXN/SY+0DqTLP/FfJVDb8=
X-Received: by 2002:a05:6e02:190b:b0:3a7:dd62:e954 with SMTP id
 e9e14a558f8ab-3a7dd62ec53mr147976335ab.0.1733165609652; 
 Mon, 02 Dec 2024 10:53:29 -0800 (PST)
X-Received: by 2002:a05:6e02:190b:b0:3a7:dd62:e954 with SMTP id
 e9e14a558f8ab-3a7dd62ec53mr147976095ab.0.1733165609356; 
 Mon, 02 Dec 2024 10:53:29 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a7ccc5fc09sm22971325ab.61.2024.12.02.10.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 10:53:28 -0800 (PST)
Message-ID: <7d8fd88b-2b2a-4b1e-9feb-8030fc2111a4@redhat.com>
Date: Mon, 2 Dec 2024 13:53:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
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
 <04c73d87-35ce-4e11-a906-17c1e2961387@redhat.com>
 <Z0f1P/Tie2Yhe1dv@Asurada-Nvidia> <20241128125426.GD1253388@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20241128125426.GD1253388@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B657pIdTPhoHKUtKjlP2SbtoRfsz5d3AqWZ8BoYoGks_1733165609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pOrtTRpPESPI



On 11/28/24 7:54 AM, Jason Gunthorpe wrote:
> On Wed, Nov 27, 2024 at 08:44:47PM -0800, Nicolin Chen wrote:
>> On Wed, Nov 27, 2024 at 11:29:06PM -0500, Donald Dutile wrote:
>>> On 11/27/24 5:21 AM, Shameerali Kolothum Thodi wrote:
>>>>>> W.r.t naming, maybe something related to "hardware-accelerated"?
>>>>>>
>>>>> Given that 'accel' has been used for hw-acceleration elsewhere, that seems
>>>>> like a reasonable 'mode'.
>>>>> But, it needs a paramater to state was is being accelerated.
>>>>> i.e., the more global 'accel=kvm' has 'kvm'.
>>>>
>>>> I was thinking more like calling this hw accelerated nested SMMUv3 emulation
>>>> as 'smmuv3-accel'.  This avoids confusion with the already existing
>>>> 'iommu=smmuv3' that also has a nested emulation support.
>>>>
>>>> ie,
>>>> -device arm-smmuv3-accel,id=smmuv1,bus=pcie.1 \
>>>>
>> ..
>>> I -think- you are saying below, that we have to think a bit more about this
>>> device tagging.  I'm thinking more like
>>>   - device arm-smmuv3,accel=<vcmdq>,id=smmu1,bus=pcie.1 \
>>
>> I wonder if we really need a "vcmdq" enabling/disabling option?
>>
>> Jason's suggested approach for a vIOMMU allocation is to retry-
>> on-failure, so my draft patches allocate a TEGRA241_CMDQV type
>> of vIOMMU first, and then fall back to a regular SMMUV3 type if
>> it fails. So, a host that doesn't have a VCMDQ capability could
>> still work with the fallback/default pathway.
> 
> It needs to be configurable so the VM can be configured in a
> consistent way across nodes
> 
Yes.
To expound further, one wants to be able to define an 'acceptable'
VM criteria, so libvirt (or OpenStack?) can find and generate the list
of 'acceptable nodes', priori typically, that can be a match for the
acceptance criteria.
Conversely, if one specifies a set of systems that one wants to be able
to migrate across, then libvirt needs to find and select/set the features|attributes
that enable the VM to migrate in a compatible way.

> autodetection of host features is nice for experimenting but scale
> deployments should precisely specify every detail about the VM and not
> rely on host detection. Otherwise the VM instance type will be ill
> defined..
> 
> Jason
> 

