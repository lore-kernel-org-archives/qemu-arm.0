Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85575CCF2F8
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 20:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcquD-0006JL-Ac; Mon, 05 Jan 2026 15:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vcquC-0006HS-GC
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 15:10:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vcquA-0004aD-Np
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 15:10:20 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so2613745e9.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 12:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767643817; x=1768248617; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bIU2s4KJJRBbJUd2XBpD85ZPXhJLwARtyREZU1HcZKg=;
 b=LqqF7hDyLNq/ibLpysshTisHPIJVUbPPxArFL8K/j25V5ND25JyACdlsHsdAQW/QUP
 tl54OvCpDA7+8za3KLcKJTYtiUwqgL8lYePkM0yDinGxjQSY68ngXn7zRDCpS5auXLar
 vV74Hw2lEV/e3r+cRwq518Cww2zje+eu7YpHOGEckri40vaa84hntJZIJZrxocifp3Xp
 rdyOF2T/MOJSTBHIkA7SB/lDK8Zd1Znf6JpO7y3tONFQEG0503HBNaGYCpMkPgcT9tEJ
 eXHmVQue6i9emGFDvCLhxLYOoNEjtlzkYyCm8c0oB52Ic3I/iKo1G1QEHXxp4GsKQvlN
 PNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767643817; x=1768248617;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bIU2s4KJJRBbJUd2XBpD85ZPXhJLwARtyREZU1HcZKg=;
 b=IAFhK+5UgFE9Eqw7hwEpiABb3lUzsyyPnFmb1ff3jFH5aCFfuOdRrtevwvCfIxr2Q+
 0XhqGUMqmSvR2u6VK4YQYDE0/IvSe9/Ox5BmXR0IM4zz0BZWrallDRibd8xmvLvzoXIk
 nkclupchnrwpw5G1NCJqZJHXdWu4JdWg4SOml5k7yi5RNYFcYy5d6c5Ty/qs06AyFLV2
 kYSxW7CO3V6tgWw8UtNrdwH5umKcKWflXyVHYb3nv4t3MNf7KFvwGyeRxXva40nLjmiC
 3vUsIbZBBkCcE/dkBppoED3jC/uIwcBIrbsc1qp3C/ajI1z0I1qJU6iPZHJN+htYZX6e
 HSSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHL6Fb4Ccc25w4jK89bOiIIGlv/SAfsFUhRKRGi2IzFR3vw5pIZqqJkI/8OxJpSBpFaJvJc3m8KA==@nongnu.org
X-Gm-Message-State: AOJu0YzB/ysj0HZ3X1U3lpU/zsZMb6exDWllAjEfHCuu6ISllPpXEuPJ
 rfSf3dANk4MrSOROEbBWqvQ5tQJ5NcOuFcm1gYziHjWmXqQnyjZXD6EcBHiXbLum/2g=
X-Gm-Gg: AY/fxX40MKrddENZL/J3++v4a/nEI+HreD1krGsGXUh94BKumfAG+T7bbXeMgaqDwam
 4PCD9JheOFGFtv9aPpya5+xoGgNILGLkZX+scQotkvxeCmC5O0E4yxpIjDjMtuXHjMnCAwmhxYK
 kraNGBOjFliiafSKH/mgHfxcc3i8KH3Cze4Dnl28ptwSRPBTrIsYRbZMKZKpp2cx0t7vZFP/HMy
 2lmaStFtd1+xJsNynpzkuD9tK7w8pLbflcEBIHjmJas5bkP91Pu8r4vybWq+Sby/0YRFu+GbGRe
 LgwLOQXeXURzEOGpryvG901BArbqQ/oH98eJHEAw4cxQqlu5QEJIEoONVCKETok9Mt40slcGFao
 MWTk38SFgpSv+MqulRRlqo8ixnC4AUi0uPgykXGb0WsDzMXvWGVEH2YpJHEf04zEK2GhGRw6T35
 5ZkIIlO2iqK8DAm2PFlgL+BYpRzqsuCdtFUrvFOWtS75HUoCBLvPx1
X-Google-Smtp-Source: AGHT+IH2z1pKP4wgXypZMaOaz3FmVF61nZs8Sc7OmJXixITySz70+RNHcBmf3gZ7OMT4L9LznUSybw==
X-Received: by 2002:a05:600c:a08:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-47d7f066044mr7612005e9.5.1767643816844; 
 Mon, 05 Jan 2026 12:10:16 -0800 (PST)
Received: from [10.247.174.66] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7faecaccsm949605e9.2.2026.01.05.12.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 12:10:16 -0800 (PST)
Message-ID: <a467095a-b796-4581-8237-665f1989f7d3@linaro.org>
Date: Mon, 5 Jan 2026 21:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
 <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
In-Reply-To: <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 5/1/26 21:05, Philippe Mathieu-Daudé wrote:
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
>>   include/hw/arm/smmu-common.h |  4 ++++
>>   include/hw/arm/virt.h        |  2 ++
>>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>>   hw/arm/virt.c                | 13 +++++++++++--
>>   5 files changed, 54 insertions(+), 6 deletions(-)
> 
> 
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 62a76121841..9a67ce857fe 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -944,6 +944,13 @@ static void smmu_base_realize(DeviceState *dev, 
>> Error **errp)
>>           return;
>>       }
>> +    g_assert(s->memory);
>> +    address_space_init(&s->memory_as, s->memory, "smmu-memory-view");
>> +    if (s->secure_memory) {
>> +        address_space_init(&s->secure_memory_as, s->secure_memory,
>> +                           "smmu-secure-memory-view");

Preferrably: "smmu-normal-view" and "smmu-secure-view" (IMO 'memory'
is more confusing than helping).

> Else, are we sure the SMMU implementations will behave correctly?

Alternatively, use AddressSpace pointers, then:

         } else {

             s->secure_memory_as = s->memory_as;

>> +    }
>> +
>>       /*
>>        * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie 
>> based extra
>>        * root complexes to be associated with SMMU.
>> @@ -1008,10 +1015,28 @@ static void smmu_base_class_init(ObjectClass 
>> *klass, const void *data)
>>       rc->phases.exit = smmu_base_reset_exit;
>>   }
>> +static void smmu_base_instance_init(Object *obj)
>> +{
>> +    SMMUState *s = ARM_SMMU(obj);
>> +
>> +    object_property_add_link(obj, "memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>> +
>> +    object_property_add_link(obj, "secure-memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->secure_memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
> 
> Why can't we use device_class_set_props(&static_properties)
> in smmu_base_class_init()?
> 
>> +}
>> +
>>   static const TypeInfo smmu_base_info = {
>>       .name          = TYPE_ARM_SMMU,
>>       .parent        = TYPE_SYS_BUS_DEVICE,
>>       .instance_size = sizeof(SMMUState),
>> +    .instance_init = smmu_base_instance_init,
>>       .class_data    = NULL,
>>       .class_size    = sizeof(SMMUBaseClass),
>>       .class_init    = smmu_base_class_init,
> 
> Anyhow this is functional and I suppose this can be improved on top, so:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


