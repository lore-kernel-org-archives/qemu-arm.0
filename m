Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp947939njm;
        Wed, 5 Mar 2025 09:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvg/pnyr7ARZ4sKfEt8Bgtp0XM9h4vxQJSh4+E7ptMY6quv7cNU0qaSNzhe5CDqqWYsR4bjqLrCpJytw==@linaro.org
X-Received: by 2002:a05:600c:548a:b0:439:8e95:795b with SMTP id 5b1f17b1804b1-43bd29d8dbemr32288945e9.31.1741194436605;
        Wed, 05 Mar 2025 09:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741194436; cv=none;
        d=google.com; s=arc-20240605;
        b=ZRahfIfpGzy7UBv+sGuOGwH2Yd3nqzpqG3fexeAJWFNwdHdSmVybQahqm0U7ZShpD5
         VJRHfuarGcvkCseektmXoP9/5ndrMBOh+GnXARAKGrW0EvYaGV8qvJbSdTA1csQyMXVy
         wolKYUdVbBuD9uX81E52dAGKAv3En9B02XlLE8N53OvFxXFB9ke7trbHJihfQrpHsDBM
         FsYQ/8z6Ex1WTEXU+herB8kx7KkXy0d0M20ihDeZi5xO6T4jGnsmQKnTr9SWCU/jq/r+
         t6aCl30/Cf7clNGBO4adnXAhYQ01Fl1MhdpJ85KZ0oPg/NTscM4x4CcZl2mfGENHDO1n
         WlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=emal6xfxY/XSycwWClQL8p38IOzHHNwRXz5owTQozGA=;
        fh=rRBzmw3lohGLMfVkGv4LNRgCv7E1ua4df5NAOTy7n3M=;
        b=XYHG4HWMyUYFrkE3+wKXUzGmAqyOBGUGidrb4e5oqIn86et9C7nD3wJHpCVZoRJTC9
         Xxk47oLPa/p9jMwZcwzQvWT0thhs4qy0jWR5tmTAJi8SdYFENNfyTFdVtZj7vnEcDW5k
         SJ35QaYhonn88rpw5snHMLGbGB348fSmRXk2krvRsqmLyfIWEKCXaVDJHfhM0BcbvkJF
         hAM6KA/slEW7rgkOYL4yF5bEWM+NsoMC+fn6NeT1QeUUORf+ZDJoWlE8NFUVkTpgE4cM
         lL1TnBeyssmlWLK1yM6aEjfKQlIxQ1+KCsIrdWD3Xt2TYKSMvM/nIm4wWkrSqqqbpedm
         KXDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDJt8Ug4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-390e479b897sor4584827f8f.2.2025.03.05.09.07.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 09:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDJt8Ug4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741194436; x=1741799236; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emal6xfxY/XSycwWClQL8p38IOzHHNwRXz5owTQozGA=;
        b=VDJt8Ug4Y23BXLgZUoZXI6J+LU8Ej4LPZtySnL9Btr+TT3rPm5q4p/oFPV7nU8KSM5
         bNCisdZ5uj0IIfh59agKCnVKHSyGWf0o0HGe/K3ejTl45KlaA6tKuajUDJy8t+pb3pld
         /OuMjj9RNNpG0PZ6b4m/3+IzSo2hNdmMuw9CBS5tK3NT+ZC6jGFl9MgqjXa7C+FdlkTn
         I/Jg1deIDWW0D9OB8IhP722ZXg3CayEz9uxcL4IjZDeNeMDnO5t+0hjkEYZ82mhHbXEa
         bNOUmr90VjfCW4IHYoWcNjUp1oId50LP1PeLRDsUNA3si7KlhcDkQTBxZcFG1aycU0nc
         8M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741194436; x=1741799236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emal6xfxY/XSycwWClQL8p38IOzHHNwRXz5owTQozGA=;
        b=KRjgxsWuA8m1kKxj/xroUkwme7Seb539QxuByCG0xY/XRAb+Xu7gSb13paThgVBgeY
         Z31sRFJT+yBZKIZTeE220retVMAGVfIguXJdwwjL3U8wMhhDQvtIhnJ8qbbPLXjRrJD+
         UTiWXsBFWd74f2I+/zpDOQMU9XJmucwLGYayYCNtVnBupLXiuBnt6EgqXfzKN03LYA++
         af9qTd1DNsktFtnBNcDq7IIgmRVUAXWFHJ9etfmBer8ZWkcKEzkY4uOCorCakNLluf7H
         agTqn3agLVaC3DS2/O+Jgg6A4YWrulI/hMowKm35ETzLIq6j31C9APztLMYe+7nLylFk
         MRfg==
X-Forwarded-Encrypted: i=1; AJvYcCXW8K88KECw+j3Lqkvl7zq8ODC+dY9GLjtKZ2gjBMo9Sz1dFlxdt3iFCKPkrP6vh3N2NR3mVaRAwlYdcQ==@linaro.org
X-Gm-Message-State: AOJu0YxV+e0Bc0jBiIV3zLEmWwcYqPG3tAYA5Xgz5h+OFaxTUtZ4NEmP
	uCtuGM4hVFn+GB3rDpOwtGv7vcdYTsVcnBAj0UlbLE41FgyCUhR+XwLotLwvcH3HhjTJNs+Z5ap
	SVVjjXA==
X-Gm-Gg: ASbGncteSorsq7WYZgFIM26XY9rpZReEGmZNMdxPctUbpFh2VGw1AuEc0AtubksElub
	1mtUEaJUmwb0MPM/BwUKp5umI7vovz/4qbh3yFHctXf5JhT5YLJ/XI90MH7+SsuzYmiDLPvJRiY
	ESqzJFXwDeV355GJPokLk4fprh5dc8BWCccpRlQw1nSDZ+bGO/thZAQHxysq4O4q3FpQ6vWfM3c
	s+OMM4dulwuaMi6UzGqLP1bulJndnAi1knTx5ehz1tt8H4diVTfAaCvqTOD9mBYfVsaq6MksluS
	hRFjCo76AEsd+qiOoO8J8a/n3moyEhUDJpSNCc9RFkRi3M4dStJWym0Qt2CsmSB5sDjmE8QX6OR
	9qvqJkyOmYxFV
X-Google-Smtp-Source: AGHT+IEyRFAUZ5UgpoWtBVfDrhdbPLN8Q9AcJ3bzcRZBKkycR1khAtNFbmj5GPYtQoKJj1LQIxWEFA==
X-Received: by 2002:a05:6000:1562:b0:38d:e6f4:5a88 with SMTP id ffacd0b85a97d-3911f749c86mr3153177f8f.12.1741194435860;
        Wed, 05 Mar 2025 09:07:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912933c050sm174175f8f.100.2025.03.05.09.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:07:15 -0800 (PST)
Message-ID: <6c62151d-8030-4568-b29b-b6793408b55d@linaro.org>
Date: Wed, 5 Mar 2025 18:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] hw/arm/aspeed: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-4-philmd@linaro.org>
 <3eef4f0d-b931-473d-8e69-4b8c46b6485a@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3eef4f0d-b931-473d-8e69-4b8c46b6485a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kR5rj9j2urtP

On 5/3/25 17:33, Cédric Le Goater wrote:
> On 3/5/25 17:12, Philippe Mathieu-Daudé wrote:
>> For legacy ARM binaries, legacy_binary_is_64bit() is
>> equivalent of the compile time TARGET_AARCH64 definition.
>>
>> Use it as TypeInfo::registerable() callback to dynamically
>> add Aarch64 specific types in qemu-system-aarch64 binary,
>> removing the need of TARGET_AARCH64 #ifdef'ry.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 98bf071139b..3f18a4501e0 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -28,6 +28,7 @@
>>   #include "hw/loader.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/units.h"
>> +#include "qemu/legacy_binary_info.h"
>>   #include "hw/qdev-clock.h"
>>   #include "system/system.h"
>> @@ -179,11 +180,9 @@ struct AspeedMachineState {
>>   #define AST2600_EVB_HW_STRAP1 0x000000C0
>>   #define AST2600_EVB_HW_STRAP2 0x00000003
>> -#ifdef TARGET_AARCH64
>>   /* AST2700 evb hardware value */
>>   #define AST2700_EVB_HW_STRAP1 0x000000C0
>>   #define AST2700_EVB_HW_STRAP2 0x00000003
>> -#endif
>>   /* Rainier hardware value: (QEMU prototype) */
>>   #define RAINIER_BMC_HW_STRAP1 (0x00422016 | 
>> SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC)
>> @@ -1661,7 +1660,6 @@ static void 
>> aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>>       aspeed_machine_class_init_cpus_defaults(mc);
>>   }
>> -#ifdef TARGET_AARCH64
>>   static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
>>   {
>>       AspeedSoCState *soc = bmc->soc;
>> @@ -1690,7 +1688,6 @@ static void 
>> aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
>>       mc->default_ram_size = 1 * GiB;
>>       aspeed_machine_class_init_cpus_defaults(mc);
>>   }
>> -#endif
>>   static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>>                                                        void *data)
>> @@ -1813,12 +1810,11 @@ static const TypeInfo aspeed_machine_types[] = {
>>           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>>           .parent         = TYPE_ASPEED_MACHINE,
>>           .class_init     = 
>> aspeed_minibmc_machine_ast1030_evb_class_init,
>> -#ifdef TARGET_AARCH64
>>       }, {
>>           .name          = MACHINE_TYPE_NAME("ast2700-evb"),
>>           .parent        = TYPE_ASPEED_MACHINE,
>> +        .registerable   = legacy_binary_is_64bit,
> 
> where is this routine implemented ?

Based-on series mentioned in cover:
https://lore.kernel.org/qemu-devel/20250305153929.43687-6-philmd@linaro.org/
