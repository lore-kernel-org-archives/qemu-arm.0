Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1935718njc;
        Mon, 24 Mar 2025 06:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVQ4IVO0hkAlM+c7gyupDOupmca5dYWLFTHhtbR5+So3RqPJSdMaXHyUQSEtJxOQQi/kk0hTR6q1LNhA==@linaro.org
X-Google-Smtp-Source: AGHT+IF31Nfik27PvFXNnGP5gPhYL/QJnRsNt0zCv6ZbA45d+ywnIBKayKwSuSbRyHQG4QqxW7+g
X-Received: by 2002:a05:622a:1144:b0:476:6cf7:6c35 with SMTP id d75a77b69052e-4771dd93355mr260595831cf.31.1742822041298;
        Mon, 24 Mar 2025 06:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742822041; cv=none;
        d=google.com; s=arc-20240605;
        b=VPNA1ATAcObsa87BukviS1KpjZrqzvhBgz5okTYPuHc/3sXErPiPcmqi1Pkh6wi531
         91B220flmghv4tmHTpPE3Vi7vQG8bCjk9kUDwDd4S+JlJRe9UFl5ArCx66rMZR/l31cF
         NlokuX46kt4aC0KRjWH8jvJ3v008hBIhzPNqygFWAehaperNelk32MOJY6LnfOKYyGYx
         ClxZX7qgrYvd20shirOk74rgYn8baEmT7b0tcv4ojReyQ6hILcb3XwsxYtv5NlTrqmV+
         HNRkkrpuoHDR58diwPKlK/+ONvMjO3QqVXUKGgecuIgTggZRDiRva5B3aA2QzxmGRQmV
         DXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IUQyxueVFXvlrjK3VZzJCpddW1FgCnJYqfitLgz1Edg=;
        fh=pWjXv9EOsWnF7/5u4geTmmG0nqd8kGSsPNwxy00AtSE=;
        b=BNUnNoJ1R+OUZ3EMMVrOCpzqR4VVgk3pBomi8EWQdo+dfpGIGvzLc9S5A0m3r55dar
         nSlAp+LfqL2kkfXrTMcli/qyDQodnNlXMXwx3jZNgPdnct2Uc7mUXYze0ndSH5y2NXeK
         hsLbWypNajv/fD0TnGtyUjr1Zdl/OjITl8cYNrSBly2f4+QOigMzBkLUXcxOuN+l9CvR
         y5K3/1Do3d80SD8zgFZ66Iur8MtnShIOrEfScXr+kswN25+X2qSS1C8uJ0kJbfICvxzG
         NyAKseQSowXC2Ppd0QjT3I+qotQ/XuCBdeGh39TJh966RpRZLZZUH3lF8z1ff0ZHPATu
         9PPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBvPD0e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d15c9e7si76153141cf.42.2025.03.24.06.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 06:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBvPD0e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twhce-0007RB-6I; Mon, 24 Mar 2025 09:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twhcW-0007Qn-IC
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 09:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twhcR-000693-Ek
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 09:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742822008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUQyxueVFXvlrjK3VZzJCpddW1FgCnJYqfitLgz1Edg=;
 b=SBvPD0e3yyllZUBDgIET7HilWDjeluBsLjTnworJmyNEn2KkM2/JjnriSAjot1Kzv5u5jN
 sRh6Nkfcqd8Jpa9FYNwE7qOPVLCU+7lI6BIlUSjjLkJE31DG1DM9Dh6LR526KAMWpku/Li
 KQeTYrfuG7+hBS53Iah37Ngm7LEyiYM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-5wxeVpYTNwOzfJjFj2RuwA-1; Mon, 24 Mar 2025 09:13:24 -0400
X-MC-Unique: 5wxeVpYTNwOzfJjFj2RuwA-1
X-Mimecast-MFC-AGG-ID: 5wxeVpYTNwOzfJjFj2RuwA_1742822004
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-391425471d6so1811568f8f.3
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 06:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742822003; x=1743426803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUQyxueVFXvlrjK3VZzJCpddW1FgCnJYqfitLgz1Edg=;
 b=HtA1oKRmDVymxQ/0OIRyYQrBeCRm4nvbxz1Aj8YKT3+E5OhZDUD0gMo7pUImNjgbkJ
 Q2NkhwbV71wEvCcQqyBQ0bFAzBDqbFN5Mt4sSr2eD0DyIFUJ0lKEnlU3+yb3RU9aUNvl
 +R8XEeYxVeH0w8xpsMLf229DnIlMZIGFWtuLVPiW/sAhGONaWAz46a8mG/cBlJUf84qt
 soORbQoat4AN4Cmmb2/Aadnx4tFfSwWz/Us8u2GwuVdgsS854UQPs552IWra20FPWCPx
 QhZswcgWdUvvZ8b/HeQxcnxZg+F23zYUVy5u/dXS5K3tjcZO22xfFEj7iL4NTPI12qJm
 AU0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM+iEFYpvUyKDvjCZntk50fTDrvcwbwZ36tf6yBdY1KDmrFC9S3VBu3KNDPx7gFo/rWjsjof/ZLw==@nongnu.org
X-Gm-Message-State: AOJu0YzgEqEWEGCRl6kbMkt2aa6D59XHp2v2yDET1enIK+gsbiSLd7X0
 Awo8W4LOLeNqfZISOYl2cq/pQY+LOV2icutCNSyIZURPA451iusyIr5Y9jZKr66d4SM356r1gmK
 LCVlbCfraoxbKPwrhaJT/PROQ3u5aEh+vIbTBCVGQavZod/ilaw==
X-Gm-Gg: ASbGncsxDFgf5DLrzWo7JMxj5hU1DnqsUIZBp6+2GRO2FHph3OFvXCKNrqc+/m/K6Ei
 T7A/HZfCFkjw72tSExm2319KIzcGFtWk9YdkpR09JIV79k0gn0/ArBo5JbSol0266I6GFSaEiLK
 XIoJwfBfwS4ocwTEwieNRpZgrLnVcLeE7MJXdb1yGCcqs3w9rYyUacNFmX705mKNRWhzch8YJXV
 nD0Oc0vvqZc6JB6zymlw8eSJszk7jEX6Oq9MSmUYGwluVQZTyGwoykPhBo6lD0PzDR8Ya//xiaA
 yJEKiKPOzR9kzwcK/NNbqrXEjmMJax8Kz73oK1UYSaO0C3166Ufrx+F7j3ktwik=
X-Received: by 2002:a05:6000:43c9:b0:399:6dc0:f15b with SMTP id
 ffacd0b85a97d-3997f959596mr7960135f8f.48.1742822003529; 
 Mon, 24 Mar 2025 06:13:23 -0700 (PDT)
X-Received: by 2002:a05:6000:43c9:b0:399:6dc0:f15b with SMTP id
 ffacd0b85a97d-3997f959596mr7960104f8f.48.1742822003090; 
 Mon, 24 Mar 2025 06:13:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3372sm10824513f8f.21.2025.03.24.06.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:13:22 -0700 (PDT)
Message-ID: <ad0b5fac-2a7f-4978-9f6b-0f7b1df14a35@redhat.com>
Date: Mon, 24 Mar 2025 14:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: Donald Dutile <ddutile@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
 <3d1312b411f04121a3be90879a915982@huawei.com>
 <Z9xKL49nOenvQIsW@Asurada-Nvidia>
 <2f84490d309440a4a2ac56fd893ddab8@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2f84490d309440a4a2ac56fd893ddab8@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qP7sUA6mDw97MTIVtpjy7AFDtQmR-VDFNguAXTRPgtE_1742822004
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VE+NzPTGWinQ

Hi Shameer,

On 3/24/25 9:19 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Thursday, March 20, 2025 5:03 PM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: Donald Dutile <ddutile@redhat.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
>> jgg@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>> pcie bus
>>
>> On Wed, Mar 19, 2025 at 09:26:29AM +0000, Shameerali Kolothum Thodi
>> wrote:
>>> Having said that,  current code only allows pxb-pcie root complexes
>> avoiding
>>> the pcie.0. The idea behind this was, user can use pcie.0 with a non accel
>> SMMUv3
>>> for any emulated devices avoiding the performance bottlenecks we are
>>> discussing for emulated dev+smmuv3-accel cases. But based on the
>> feedback from
>>> Eric and Daniel I will relax that restriction and will allow association with
>> pcie.0.
>>
>> Just want a clarification here..
>>
>> If VM has a passthrough device only:
>>  attach it to PCIE.0 <=> vSMMU0 (accel=on)
> Yes. Basically support accel=on to pcie.0 as well.

agreed we shall be able to instantiate the accelerated SMMU on pcie.0 too.
>
>> If VM has an emulated device and a passthrough device:
>>  attach the emulated device to PCIE.0 <=> vSMMU bypass (or accel=off?)
>>  attach the passthrough device to pxb-pcie <=> vSMMU0 (accel=on)
> This can be other way around as well:
> ie, 
> pass-through to pcie.0(accel=on) and emulated to any other pxb-pcie with accel = off.
+1
>
> I think the way bus numbers are allocated in Qemu for pcie.0 and pxb-pcie allows
> us to support this in IORT ID maps.
One trouble we may get into is possible bus reordering by the guest. I
don't know the details but I remember that in certain conditions the
guest can reorder the bus numbers.

Besides what I don't get in the above discussion, related to whether the
accelerated mode can also sipport emulated devices, is that if you use
the originally suggested hierarchy (pxb-pcie + root port + VFIO device)
you eventually get on guest side 2 devices protected by the SMMU
instance: the root port and the VFIO device. They end up in different
iommu groups. So there is already a mix of emulated and VFIO device.

Thanks

Eric
>
> Thanks,
> Shameer
>

