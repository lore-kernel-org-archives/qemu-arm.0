Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1123225njm;
        Wed, 30 Apr 2025 10:48:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWo23fTpWkhd5jNgLB5PfRIWFiQycv0uuaWt9yMJ+fcLO52Fl/GzKTQ6wvRVOTMSVIctN9LMUsROLQl+w==@linaro.org
X-Google-Smtp-Source: AGHT+IHGyp77h7QQViwQAd7sjKEMsohlzOc769dXm9F+75ik/AQM9upZXaQCMLw5UUh/8OcYDgNM
X-Received: by 2002:a05:6214:caf:b0:6e8:fee2:aadf with SMTP id 6a1803df08f44-6f4fe116a4bmr65268906d6.31.1746035323789;
        Wed, 30 Apr 2025 10:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746035323; cv=none;
        d=google.com; s=arc-20240605;
        b=dcJdRhb6cLYlPIbhWt4hPBtcwYpBwKubxDf3+mF03cXs9tP+HfAdphsyhYqwyY2WTX
         k9VNe2MjTq7dn9igNwvdzt2wN/b8Ex3PIkqGfKvvK1Qygbl9G4MPx2qTZvkarjJl8MSi
         hfTboqHUQEtTzoV+feCpxjduIr57aCQnq2GCg4nqesgM3QtAvQ5ZPRjqMvlylWj6Cf+M
         yIcqJEF1Z3g0iQOEjfK4byL/RQWWjxXJa7AbrvIj+qmn6AprSCfjdw0QOpQ4NK33/PjP
         wZCoF/8l35VNFhhqgGOpdvt2GLJgRiJWkj5iS54LxRUrY3wSalDZmSMWLoFV6t5tJEIo
         bufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I17Tf9phOKeR+tV1EMuXPuWTe/04bB4ikge9qN2d8Jk=;
        fh=MnsVRtKJbI2SBKChiKCbY00oI3wAaZWbRdp2DEBa4Kg=;
        b=kkdxw+7LT25MFB0ZhgJyQOjp7K5p8Mv2Yf4Igbch5Uic66u9BAmUon5DmsDCO+hqN/
         rsmJbeuoyjCn1nSAUh0+cjQUT9KkoaOGjQ5M79nfJBI9voyO0QW+RQGL5sDe4aHzje+H
         CUfO4MNw8rG2QyE/Tvl7NFM7T/EweKkqnuFCWvddyBPtv/iKoUTkWH8FT7i84hqRNsmk
         kroAJrXmTAWBUsTi9FbrpdXufzj+rbKKKh9Ko+dCuIMNbC3j95dqlovRZpXNmVG0uA2x
         eBhtmM8ORDS59xaF7JAtFeHDohGhdalTWXQ0oMYpxm/WwrPWc6yaCXbNSH5G/IVSPLJb
         KHRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlbZ9qWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4fe6d07f1si20617776d6.138.2025.04.30.10.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Apr 2025 10:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZlbZ9qWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uABXq-0000cm-0L; Wed, 30 Apr 2025 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uABXc-0000Zg-Ga
 for qemu-arm@nongnu.org; Wed, 30 Apr 2025 13:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uABXZ-0001Al-Ra
 for qemu-arm@nongnu.org; Wed, 30 Apr 2025 13:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746035272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I17Tf9phOKeR+tV1EMuXPuWTe/04bB4ikge9qN2d8Jk=;
 b=ZlbZ9qWkA2iBZx8HCCiOkT4hGSQlVkRoZ7lXHSB9NBOYoujTdqNS3QK3AVTXM3OnILNdcM
 Feq1orK3pPbkvRTrW+EC9dNWPCc+lSfjHFCWklFKaEl7WCmbFjtsFQ6l+tuLLtuT+dkNQY
 uUgF8ddJhydb9nMc10f3Y1JNSXVSS/Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-AQKyu7exNKyP4ZVGn6Asww-1; Wed, 30 Apr 2025 13:47:49 -0400
X-MC-Unique: AQKyu7exNKyP4ZVGn6Asww-1
X-Mimecast-MFC-AGG-ID: AQKyu7exNKyP4ZVGn6Asww_1746035269
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39d917b105bso14216f8f.2
 for <qemu-arm@nongnu.org>; Wed, 30 Apr 2025 10:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746035268; x=1746640068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I17Tf9phOKeR+tV1EMuXPuWTe/04bB4ikge9qN2d8Jk=;
 b=ras9R3uUCUs7/Wnx/jFVQvseU47OrZGWPikqxIFBuzWb7zdyI0RZ2y2I0vIDNi81RK
 Mb2zKp2pzs5fO2xgUBEBUiq1vyw88y6WBmYq5LmRGXPgYXdErVWur5yD+Ot5Np5W9bed
 7f/mjjFqmOqHKaBY+H/5E3zemQpLj2/iJ7iJ1BFNMxJ1NSxDP/vYZuWyd9jczE7w2Ln3
 NIl+wOMZUqx4A4D5gCLqYsF7FjsufptHZ6TEHqg1RI4jUl/ABdvjI13jhTmT5YCEu1/W
 C7fGWZYYuAkb8SJNg1aTK5byjBvP6lgpTSr32m+49iL151sUHaxHnV9d6/79cQ+GTSLi
 AsUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5oN3UiXDh3r75/613DXOeaz7pBsuZFsM/NJhvC2FyFcmzQk2GrqOryVhDotz3W6j4WzXqo/Ne0A==@nongnu.org
X-Gm-Message-State: AOJu0Yyrrohq2DnemKwv55Z2+JAdAft/8LoLWKp+krFAYUovy0zM8Wps
 Yr5Uksiwk77njqE7n/PpWG6NboxYTL/rZ5WnG9ZvRFlRyrr0f9JpT9GACpgdgU8m0m8hyzVwbcB
 IcJnLlA5UxhaK71DAjfhbZ3F+HevrmDwsF1347xIH7qAW/qFrNw==
X-Gm-Gg: ASbGnctaEhqwr/boWd8Sy1BSrOVoZOWzWVlPAaIFRcGMkwQ4EgLy9taEOt7L1XuzpoJ
 cqhDoZmw0uDGiQUWC5Mi2jZa0hVoednLgxn/ikig39UXqZlR61woaizAwzlchi3mE8nv/Dy4U7T
 z+3L/nV+GrTVyqWiEcrq2kiLTBvah1J4pQRfLxvx9g8fUtlYhWcH0NVvXCPiX+5UnO+uuBIGERQ
 b6pJgz+vGCqC0kFDvyTFaiAIREj/50JmfI2YP9pocU/uPyFkKfXG4hmaOvP10A2ueYX0Z8nNae/
 KYT5dI+C2lMxQYfLNuNjY9Hi1LbHY5pnqmQfuwP7Hj0/3NZ5ZXTvKMkIwEo=
X-Received: by 2002:a05:6000:381:b0:39c:e0e:bb46 with SMTP id
 ffacd0b85a97d-3a08ff32d95mr3443468f8f.4.1746035268649; 
 Wed, 30 Apr 2025 10:47:48 -0700 (PDT)
X-Received: by 2002:a05:6000:381:b0:39c:e0e:bb46 with SMTP id
 ffacd0b85a97d-3a08ff32d95mr3443447f8f.4.1746035268124; 
 Wed, 30 Apr 2025 10:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5e1c6sm18033396f8f.98.2025.04.30.10.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 10:47:47 -0700 (PDT)
Message-ID: <a37de640-1b6f-4b95-8ba0-ce7b78c10418@redhat.com>
Date: Wed, 30 Apr 2025 19:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for user creatable SMMUv3 device
To: Donald Dutile <ddutile@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
 <84870c74-f078-48c5-bead-96db1d582987@redhat.com>
 <8f7cc59e3745407bb7ae3d875cf97ae0@huawei.com>
 <7446ba2c-0dbb-44dc-9e48-300f431dcf85@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7446ba2c-0dbb-44dc-9e48-300f431dcf85@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _xIQIudly-wbvEIgbqWv0Q7hVLJkNXGQN3S7ybsB0bo_1746035269
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.483,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WBZ6pu3u32d1

Hi Shameer,

On 4/28/25 8:41 PM, Donald Dutile wrote:
>
>
> On 4/22/25 4:57 AM, Shameerali Kolothum Thodi wrote:
>>
>>> -----Original Message-----
>>> From: Donald Dutile <ddutile@redhat.com>
>>> Sent: Friday, April 18, 2025 9:34 PM
>>> To: Shameerali Kolothum Thodi
>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>> qemu-devel@nongnu.org
>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>> Subject: Re: [PATCH 0/5] Add support for user creatable SMMUv3 device
>>>
>>> Shameer,
>>> Hi!
>>>
>>> First off, like the partitioning of these pieces.
>>>
>>> On 4/15/25 4:10 AM, Shameer Kolothum wrote:
>>>> Hi All,
>>>>
>>>> This patch series introduces support for a user-creatable SMMUv3
>>>> device
>>>> (-device arm-smmuv3-dev) in QEMU.
>>>>
>>> Can we drop the '-dev', as 'arm-smmu' is sufficient, as is '-device'?
>>>
>>> I know, internal to QEMU, there's already an ARM_SMMU, but as suggested
>>> later,
>>> if it uses the same struct, the qemu cmdline syntax is a bit less
>>> redundant.
>>
>> Trust me I tried that😊. The problem is that, the legacy one doesn't
>> have a bus
>> associated with it and the moment we change that and have bus
>> specified for the
>>   "-device arm-smmuv3, bus=pcie.0" the legacy smmuv3 creation in virt,
>>
>> create_smmu() --> qdev_new(TYPE_ARM_SMMUV3)
I have the impression you can achieve your goal by replacing
sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
by
qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
See https://github.com/eauger/qemu/tree/arm-smmuv3-dev-rc0

and its top patch.

indeed it would be better if we could reuse the same device.

Eric
>>
>> will fails as it expects the bus type to be specified for it. I
>> couldn't find a way
>> to solve that.
>>
> I guessed that's why there was new syntax for what is basically an
> extension of previous syntax.
> I'll dig more into it and see if there's a way to handle it.
> qemu does handle varying added params (id=blah, no id=blah),
> so I'm researching how that's done, to figure out how the legacy,
> smmu-for-all,
> and the smmu-for-specific pcie<RC> can both be supported.
> Given your stated trials and tribulations, this should be fun. ;-)
> - Don
>
>>>
>>>> The implementation is based on feedback received from the RFCv2[0]:
>>>> "hw/arm/virt: Add support for user-creatable accelerated SMMUv3"
>>>>
>>>> Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the
>>> machine
>>>> and does not support instantiating multiple SMMUv3 devices—each
>>> associated
>>>> with a separate PCIe root complex. In contrast, real-world ARM systems
>>>> often include multiple SMMUv3 instances, each bound to a different
>>>> PCIe
>>>> root complex.
>>>>
>>>> This also lays the groundwork for supporting accelerated SMMUv3, as
>>>> proposed in the aforementioned RFC. Please note, the
>>> accelerated SMMUv3
>>>> support is not part of this series and will be sent out as a separate
>>>> series later on top of this one.
>>>>
>>>> Summary of changes:
>>>>
>>>>    -Introduces support for multiple -device arm-smmuv3-dev,bus=pcie.x
>>>>     instances.
>>>>
>>>>     Example usage:
>>>>
>>>>     -device arm-smmuv3-dev,bus=pcie.0
>>>>     -device virtio-net-pci,bus=pcie.0
>>>>     -device pxb-pcie,id=pcie.1,bus_nr=2
>>>>     -device arm-smmuv3-dev,bus=pcie.1
>>>>     -device pcie-root-port,id=pcie.port1,bus=pcie.1
>>>>     -device virtio-net-pci,bus=pcie.port1
>>>>
>>>>     -Supports either the legacy iommu=smmuv3 option or the new
>>>>     "-device arm-smmuv3-dev" model.
>>>>
>>> nice! :)
>>> Can it support both? i.e., some devices using a system-wide, legacy
>>> smmuv3,
>>> and some pcie devices using the -device arm-smmuv3 ?
>>
>> Please see my reply to patch #2. In short No, it doesn't support both.
>>
>> Also I think we should slowly deprecate the use of legacy SMMUv3 going
>> forward unless there is a strong use case/reason to support it.
>>
>>> If not, then add a check to min-warn or max-fail, that config.
>>> I can see old machines being converted/upgraded to new machines,
>>> and they will want to switch from legacy->device smmuv3, and catching
>>> an edit/update to a machine change (or enabling automated conversion)
>>> would be helpful.
>>
>> Please see Patch #4. It already checks and prevents if incompatible
>> SMMUv3
>> types are specified. Or is the suggestion here is to add something
>> extra?
>> Please let me know.
>>
>> Thanks,
>> Shameer
>>
>

