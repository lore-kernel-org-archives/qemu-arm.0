Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE71D0D155
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdXsX-0007t1-84; Wed, 07 Jan 2026 13:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdXs1-0007e1-B3
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 13:02:57 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdXrz-0000zP-It
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 13:02:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-34ccbf37205so1515355a91.2
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 10:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767808974; x=1768413774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Am2/Nuw3aRl/UlKx93MkIvwIzCrCKfg4v9OKCoZibY=;
 b=LkA2mBcdnSZxbUXlZdICBxHvW7aSfNVqF0U+Y0xgpbqdVWobUfScnoGB5XLJDIRgKk
 7XA49TGa3cvA7TDzCedgdHh511T06oivtmQQ0ysbumJ+HL/7KtWAD8V70COzts9YU0wu
 YKKB57cnVpsHau84wNOYcEVhyWiYM713WM5KgPkQtBLT2TNXtXQQrohc4btboUHA4Wkj
 PqNfM2EZBcJG0RR5sR5TStu/TDqVVfQIuyJa7869Cox/cVYycFZPjuCMPPOXdqkSH5nV
 oRN2zoSzHUA9Lfzb1ijLofMlh5B9dpVK3sO2goWXPhJO2/v1I+coZkeLVwn+7IfMqYId
 qFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767808974; x=1768413774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Am2/Nuw3aRl/UlKx93MkIvwIzCrCKfg4v9OKCoZibY=;
 b=Tjn7xIoDG8bnxZ2CiYj9/Obgo8fEAy1QYDi+Yy1V6MIvoS6Yeh4TAvZm3ql4ZKkn9k
 yT4mR2uTDwsyfssN4eyD3jWqOHbecIboZoDhsZKgEPTG74PVyb/iLskEIsKMR4vSOTIL
 PSIMZlrywo84ICQ/fkP2Qwbmq7jw3YuuB1OwRsqUPgrMuvEtMty8YYZgYC6p8AtCtRp4
 B6y8Z8NdLppyaZcrbc1Ic5kkz+nwuVKCJyV+ByZeheDO6VIK6aQQox32dMT7xR2bFAwz
 chqFNHR4Gy8oBtmmaYzEZ/kS9wTc5D93wT/57m3js9U3oIR0dzuI5oKkt3T5ezLgvYAT
 45Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzHwJZ2BgYpd+Ncyp0/HEvB21ZYpdXPP/xUw7hjkr2/KCx33zutYElkHKHuUa1fvonHkTabD2aCg==@nongnu.org
X-Gm-Message-State: AOJu0YzZYgBZLkOEiCLGhHMRZOwqGPfHU1dZDmA40djVz7nMjJz1djaZ
 P0zuzO3ZWkInRBJr5OEYAMW8qALbudRcivauXiiAVMMfd1Cr2wey15sOtHufa31VN/A=
X-Gm-Gg: AY/fxX6oudhbUbEF1anqNciQiW8lpy43RIqhcq8Y5J4uVDu4LC62DFHFdn3lRg4b3oc
 Md6XWBvxAGAzNca8MgFvco3QO1O8Y7orj4+Z/GdTNyru0x7kTRtCrmYD4vpxTOvrAJZWYb+4Kp1
 LnqG8rXNa3us4KIcoSYDdJVPU/oiMhK/qxMi4Xf6QG4qV8WumkUw9PaEbZ6TE0FzbmHRsVgFWBl
 NuvSUtm9YDbw7rwrv1KsauupqAPwgEyLZFB1I/t2sZcLEq3uByX1vmcq2kP9ppbZojXO4TaI/16
 ajunLDRmoy3u6Zp5ZO/t2GqH2CE2mt9Pkhg1/0AhfnJUTzyH9nTMC6+QK7zZgqpGcg3Ti9dppqA
 0LFk+zt3i+6+0fotRtiAPhHIyOQKs1jLonzQzjckPuHqdKihtKmBLFQ1yUGgqC8EDoufWrc7aus
 1p4lzcQvKkNDe9oIY+6uKN83Wvg+H9A4QkrZvttQcIwVwx4W85M3hEmx4AGQ754J0sEMk=
X-Google-Smtp-Source: AGHT+IH8aPTYs6XRRRulPemcTtz32Ztck/GgkW8GnKBxQwTFE0ZbBgWBSmpqd1UaxDQepOxefZrULQ==
X-Received: by 2002:a17:90b:1643:b0:340:bc27:97b8 with SMTP id
 98e67ed59e1d1-34f68c4ffd5mr2702717a91.10.1767808973347; 
 Wed, 07 Jan 2026 10:02:53 -0800 (PST)
Received: from ?IPV6:2001:569:6fb1:810d:63cb:57dc:3bf7:ccf8?
 ([2001:569:6fb1:810d:63cb:57dc:3bf7:ccf8])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f88e95dsm5617132a91.12.2026.01.07.10.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 10:02:53 -0800 (PST)
Message-ID: <ea63e54b-adf0-4ab5-88ac-d522d578ab58@linaro.org>
Date: Wed, 7 Jan 2026 10:02:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
 <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2026-01-05 12:05, Philippe Mathieu-Daudé wrote:
> On 17/12/25 00:57, Pierrick Bouvier wrote:
>> This will be used to access non-secure and secure memory. Secure support
>> and Granule Protection Check (for RME) for SMMU need to access secure
>> memory.
>>
>> As well, it allows to remove usage of global address_space_memory,
>> allowing different SMMU instances to have a specific view of memory.
>>
>> User creatable SMMU are handled as well for virt machine,
>> by setting the memory properties when device is plugged in.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/hw/arm/smmu-common.h |  4 ++++
>>    include/hw/arm/virt.h        |  2 ++
>>    hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>>    hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>>    hw/arm/virt.c                | 13 +++++++++++--
>>    5 files changed, 54 insertions(+), 6 deletions(-)
> 
> 
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 62a76121841..9a67ce857fe 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -944,6 +944,13 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>>            return;
>>        }
>>    
>> +    g_assert(s->memory);
>> +    address_space_init(&s->memory_as, s->memory, "smmu-memory-view");
>> +    if (s->secure_memory) {
>> +        address_space_init(&s->secure_memory_as, s->secure_memory,
>> +                           "smmu-secure-memory-view");
> 
> Else, are we sure the SMMU implementations will behave correctly?
> 
>> +    }
>> +
>>        /*
>>         * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>>         * root complexes to be associated with SMMU.
>> @@ -1008,10 +1015,28 @@ static void smmu_base_class_init(ObjectClass *klass, const void *data)
>>        rc->phases.exit = smmu_base_reset_exit;
>>    }
>>    
>> +static void smmu_base_instance_init(Object *obj)
>> +{
>> +    SMMUState *s = ARM_SMMU(obj);
>> +
>> +    object_property_add_link(obj, "memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>> +
>> +    object_property_add_link(obj, "secure-memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->secure_memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
> 
> Why can't we use device_class_set_props(&static_properties)
> in smmu_base_class_init()?
>

To be honest, I simply duplicated what was done on cpu side, without 
thinking too much about it.
I thought there was something about passing a memory region that 
requires this, compared to having a simple property.

If you think it's important, I can try to use the function you mentioned 
above.

>> +}
>> +
>>    static const TypeInfo smmu_base_info = {
>>        .name          = TYPE_ARM_SMMU,
>>        .parent        = TYPE_SYS_BUS_DEVICE,
>>        .instance_size = sizeof(SMMUState),
>> +    .instance_init = smmu_base_instance_init,
>>        .class_data    = NULL,
>>        .class_size    = sizeof(SMMUBaseClass),
>>        .class_init    = smmu_base_class_init,
> 
> Anyhow this is functional and I suppose this can be improved on top, so:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks,
Pierrick

