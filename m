Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp557040ejs;
        Tue, 9 Jan 2024 10:17:12 -0800 (PST)
X-Received: by 2002:a05:600c:4395:b0:40d:88ea:5c3a with SMTP id e21-20020a05600c439500b0040d88ea5c3amr3037179wmn.141.1704824232199;
        Tue, 09 Jan 2024 10:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704824232; cv=none;
        d=google.com; s=arc-20160816;
        b=fNNKLqyCtE4J99zUJDC1McEn5c6e6DGftD9CRDzxZfPS0xiIGhNnf458WFg4DtVn0U
         1bML+G1/81CPekpHmmnIMM10aVfO3pCEZmbe13xzU7w6YfMbwJu6/QiksF5DP1m7xxQR
         XcNZl2Br6jsUxZL8GDqiw9gtK5QgRPl2VYMfuQXSxgCaxdeiravb9jl24iCmJ01Grcad
         r77vEc9S6c/LsaRqvjZMdKJgl179cvC4/fwvh7XWNKBG2iXCczfuEaqAnuSAcJ6n2MIs
         PYNecUZ8X2bTmlFJK+uacw7K+JaKE0jGtn+A2O3Ajda80c8R8JSzL+QNdCNmk3lHl0Jz
         MecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Im1zlbdxa9TddRVz/6Jix3LDtFJyt0kZS2LzdsZk3es=;
        fh=tIPtNlFzeHxgf2SHuPpxDfNXaZCwv2ZxIDfoid7y1B4=;
        b=03P87wrIxHcM1skd8tz4PYxFgUBXmsTUIrdAHj6glPNsN/4DUUCZKVQSX5CucwZQ9I
         V3RLzqjQ1Q3te2xTKQ8dvo2HtDwQGXbLZXQbxFOGWXVdv2Pm8dvxQ89oUUMTEiWUs2gh
         sv7ufTAzQ+mCj3joT2KaT+kdR4+IRmioZlur+2v6HkorEcz+KLCHIIRFdsUiOmjFlpKE
         Hq7Cun6gtu482H+woS6Nxaq3yDW9Ep3Xu04Z35mv0YLU5MNwZyb6xuqhVvEkdxvfcdqM
         9frWcN56AYPS3OUf7+dsu9mCcOw23CQFYNNzHao6xRiz7xt0LFw5LgNvItk/ssVWODSb
         paWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VO95XUQk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg22-20020a05600c3c9600b0040d7fd44915sor1062367wmb.1.2024.01.09.10.17.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VO95XUQk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704824232; x=1705429032; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Im1zlbdxa9TddRVz/6Jix3LDtFJyt0kZS2LzdsZk3es=;
        b=VO95XUQkdpC3FCSygHweKLBJ3qBpQB3WTMiaktXgV6/e8V14CiavK3zMXQ8WPu3psj
         h+5xjz+G/ZyPRGoX4D7sq12dLgPsCCSZqnUBLzaKPhGpnEpd23NMq/h+fa6C9DnA1e+z
         S6M01Je3qq2pSQdc3SkzeNG8zxfRQZvdHDZdHeC/59OD1Y9SziZxp8gGedVCSR6jJQF6
         0l0p+B79ZEz+IW3NAuJjDqpr4kZsvFPfwF4sn/1vgkef4mbEp8Xpe2q/ih25FBD6bABt
         TPJRfVEE/9F4Qxu+GTCqTvH67OeBvJGx9B6GVJZHvi6uk4HSc2vU/h3gjByCF0A2EmNJ
         IKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824232; x=1705429032;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im1zlbdxa9TddRVz/6Jix3LDtFJyt0kZS2LzdsZk3es=;
        b=kgQDAOQyudzkCKlGENV6eS//y2tA/pyniGk9Z8zEcUirNflcOB8/Og1wavsecFze8Z
         CwP6TftgqID2YjcbXOLSXQUUOrxLCGqz4bkiAoJVWdqpkMDJ6UFjtP/0+ff9Ids0vOJI
         jwQYNz1t4j+3r9zgrU8jkwBRvOD7PyxKD+v+WyahOm9MNa6min1lGFxOCpj2pegXkQJm
         4TiVdq9qJluMy8tBvusJnm8RBdK1yJLclLe8EXmpOR/3lzcgWTDL/XjwPZzKwGYAE4Xv
         JF5yEhK87yE7gDYksKrC588Jy/mgzugdWZdaTGnkYm+/K3uugMkAP6IEfngp4mZQ1aSU
         XYMA==
X-Gm-Message-State: AOJu0YwgHZq59jsRgcV1VV0YQSbsp2HIIXyH/l3ZL7uwcTWrZTXyP/eK
	xRZdRnoqJ1e14FQLnG/hxXKBMaLKuR21tRZE
X-Google-Smtp-Source: AGHT+IE/67O/UX7j9V7C3AlbRGgZf9I0XmwLn5yB0vHa5Nh8BvHgWG1d9aiVabyT2d0U7VbWMHrPew==
X-Received: by 2002:a05:600c:3d1b:b0:40e:45a3:bf6d with SMTP id bh27-20020a05600c3d1b00b0040e45a3bf6dmr2003989wmb.90.1704824231828;
        Tue, 09 Jan 2024 10:17:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id j40-20020a05600c1c2800b0040e451fd602sm9533800wms.33.2024.01.09.10.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 10:17:11 -0800 (PST)
Message-ID: <102e3be3-a574-4095-a6fa-7d23e7b0b0bc@linaro.org>
Date: Tue, 9 Jan 2024 19:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] hw/arm: Prefer arm_feature(EL3) over
 object_property_find(has_el3)
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
 <20240109180930.90793-10-philmd@linaro.org>
 <2fccc023-c10d-4d66-8f3a-9e119dd29ffe@linaro.org>
In-Reply-To: <2fccc023-c10d-4d66-8f3a-9e119dd29ffe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WAAugHkHYKPK

On 9/1/24 19:13, Philippe Mathieu-Daudé wrote:
> On 9/1/24 19:09, Philippe Mathieu-Daudé wrote:
>> The "has_el3" property is added to ARMCPU when the
>> ARM_FEATURE_EL3 feature is available. Rather than
>> checking whether the QOM property is present, directly
>> check the feature.
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/exynos4210.c   |  4 ++--
>>   hw/arm/integratorcp.c |  5 ++---
>>   hw/arm/realview.c     |  2 +-
>>   hw/arm/versatilepb.c  |  5 ++---
>>   hw/arm/xilinx_zynq.c  |  2 +-
>>   hw/cpu/a15mpcore.c    | 11 +++++++----
>>   hw/cpu/a9mpcore.c     |  6 +++---
>>   7 files changed, 18 insertions(+), 17 deletions(-)
> 
> 
>> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
>> index d03f57e579..9355e8443b 100644
>> --- a/hw/cpu/a9mpcore.c
>> +++ b/hw/cpu/a9mpcore.c
>> @@ -52,7 +52,6 @@ static void a9mp_priv_realize(DeviceState *dev, 
>> Error **errp)
>>       SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
>>                    *wdtbusdev;
>>       int i;
>> -    bool has_el3;
>>       CPUState *cpu0;
>>       Object *cpuobj;
>> @@ -81,9 +80,10 @@ static void a9mp_priv_realize(DeviceState *dev, 
>> Error **errp)
>>       /* Make the GIC's TZ support match the CPUs. We assume that
>>        * either all the CPUs have TZ, or none do.
>>        */
>> -    has_el3 = object_property_find(cpuobj, "has_el3") &&
>> +    if (arm_feature(cpu_env(cpu0), ARM_FEATURE_EL3)) {
>>           object_property_get_bool(cpuobj, "has_el3", &error_abort);
> 
> Oops, something is wrong here...

This should be:

-- >8 --
@@ -84,3 +83,5 @@ static void a9mp_priv_realize(DeviceState *dev, Error 
**errp)
-    has_el3 = object_property_find(cpuobj, "has_el3") &&
-        object_property_get_bool(cpuobj, "has_el3", &error_abort);
-    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+    if (arm_feature(cpu_env(cpu0), ARM_FEATURE_EL3)) {
+        qdev_prop_set_bit(gicdev, "has-security-extensions",
+                          object_property_get_bool(cpuobj, "has_el3",
+                                                   &error_abort));
+    }
---

>> -    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
>> +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
>> +    }
>>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
>>           return;
> 
