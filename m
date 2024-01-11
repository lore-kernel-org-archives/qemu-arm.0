Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1593169ejs;
        Thu, 11 Jan 2024 02:08:21 -0800 (PST)
X-Received: by 2002:a05:600c:524d:b0:40e:42e7:4c43 with SMTP id fc13-20020a05600c524d00b0040e42e74c43mr150831wmb.239.1704967701035;
        Thu, 11 Jan 2024 02:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704967701; cv=none;
        d=google.com; s=arc-20160816;
        b=ntq3gdsXlyvw8NjHJCzu+ixbuezvc13lqMVNHEf+MqxKLlY+zQzbsX7k9y4+51rmC4
         +Pqdn6zGRHUJ5Iq6gYIkc32o2Y/s5bPVFw8l/eomTdlOv7tUKecQy4TZbZxK7XH1xkXH
         nGec52e2Qr5dbedqEuCOa5LafmiUM7bOCLnaMBq0TWhSp1+WUpfNAr1TpRB6N2p5pfeW
         g7DqIQH+D8xbf8m5q+WUQOoX3h3zxoJpEQS8l9Btn/7KTV3ax+pVxFBxptvkTEhPQidm
         yoX9GD79tNq4fmpcxBk6Co+6fDR6Pqa+udpAhK9L81e+YUXkO3Ls3K1b3P3GIsFfnPig
         gWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hhkXnq8B80M0ydMbTVSOkTWq3ohgOslq77oKCz4Ib2s=;
        fh=7C4VTGukQOsW0GkZ+60tc6ntVPM5UfQXfYiqcI6l8Gk=;
        b=S0O3QMjeqDqr7j82yPqwZTlBOapAxF/4K/ux53UB17XN0jMbb9hk7UcXpCB5C1nH1r
         enDIRhxnyEv6abxdVvXnfNXw6XIl4hxDWnYmR67xXdIDvgI5Uax+05uScIUgt6G/dGn9
         Cb5NNAwPReYE0aqtDgeLDd+5Qf7DgfLcI+P46bdUE0uTX8xXRk6QZso3Cav0UIeojytn
         KjW+3wuGE1fr+d3VYRx8iGSGWbFvbYkc3EKszfaYJNAhXY+Li82+WcaTAxq53GOy9Am4
         4XbYoxFnVTMLJl1zvNpqrz4MN1RIV/xJUMZNoKjiOxrBl7uReFLxZ3QCXgMuy1j/tJU7
         cJFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXbLoo1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u26-20020a7bcb1a000000b0040dbef7c66bsor214281wmj.13.2024.01.11.02.08.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jan 2024 02:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXbLoo1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704967700; x=1705572500; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhkXnq8B80M0ydMbTVSOkTWq3ohgOslq77oKCz4Ib2s=;
        b=LXbLoo1dSXz13mBmzgaSowDvMBxm49W1v/kh5yfxDRjcWKL5ohaoOfkoTJEIeRpPGp
         1OSfKOSuB+nVYT4MwSiZAulC9A6dpLR/w2rIIisbwvWIn/oGwcp91v4JNf2zUViTxfw3
         iUKndfn1zF9/Fzoad9a6Oqmld6U3tHy5l8xHc8tPfQK4WinKyHH+rdke0zz6K+Ps7q7v
         lTwSwbSjytAMuff5mgJm1m3hP/zXH+3Dd9UsdSMrLbqvcRDQJuvUWh4lg29dkrM8wChJ
         CgWh4a56Eboo2lreWY30tbs7PTxD7pKVF9uU0TdWT+0swcFoH+WigIuBrZwWtgYVqMDo
         FfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967700; x=1705572500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhkXnq8B80M0ydMbTVSOkTWq3ohgOslq77oKCz4Ib2s=;
        b=uRANsh1YYSPGzrcNO8Vuzfi1m7/vBrxK69jJ7waUKmq8DK1ZNAU3X5PkOQDrhWtjEK
         8U81rok1rOpCETQtI2H6usQB9yrd1xpqMoXtDVswqLJ6py7ihnOb1QHllb035OwA16uY
         APFMKBBRCQlIKMA2e0ezi0f8XeP5d1pvsVu4mJRdZfRmaBL+/NmFHI3xUV6FU73ShwBq
         hpQa2EPjqMdDb+sUwJa9ckFkBP4LFs2mQ7u3iypRPa2nMvZ1DoRWa4vZkqxCSmFNoHXD
         JlLYj8VF5LCytvDJ48YGYSmhI2qTrWe+67gQRyzfYhcMOJNnjUP5/fPKm+Aux0+QRoCe
         XNiA==
X-Gm-Message-State: AOJu0YxNLO6x3Ke5TLTj3PZg9RBOw0c4xaBqQcqnbrbX5LkRzWNIVsiQ
	14iEHB4sXFq4E9bxZ3JxAJdU97SXP208sIQG
X-Google-Smtp-Source: AGHT+IHEZQQ1nWh1etXsfTJ4jmcHGHfQnXiBL8IdJfiUhrP/YIP0O6bQXWT1aXU1ySP5+q8Bz43Epw==
X-Received: by 2002:a05:600c:354c:b0:40d:514f:7305 with SMTP id i12-20020a05600c354c00b0040d514f7305mr152207wmq.300.1704967700604;
        Thu, 11 Jan 2024 02:08:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.207.175] (83.red-88-28-3.dynamicip.rima-tde.net. [88.28.3.83])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b0040e3960f46asm1306211wmq.14.2024.01.11.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 02:08:20 -0800 (PST)
Message-ID: <585e091b-d75c-408c-bc19-72728ff45e6f@linaro.org>
Date: Thu, 11 Jan 2024 11:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] hw/arm: Prefer arm_feature(AARCH64) over
 object_property_find(aarch64)
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Radoslaw Biernacki
 <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20240110195329.3995-1-philmd@linaro.org>
 <20240110195329.3995-14-philmd@linaro.org>
 <ff57e1f5-ea78-459e-b51c-48040483bdea@linaro.org>
 <865y009p6b.wl-maz@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <865y009p6b.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RKSBaO6ob2Ag

On 11/1/24 10:47, Marc Zyngier wrote:
> On Thu, 11 Jan 2024 09:39:18 +0000,
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 10/1/24 20:53, Philippe Mathieu-Daudé wrote:
>>> The "aarch64" property is added to ARMCPU when the
>>> ARM_FEATURE_AARCH64 feature is available. Rather than
>>> checking whether the QOM property is present, directly
>>> check the feature.
>>>
>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    hw/arm/virt.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 49ed5309ff..a43e87874c 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2140,7 +2140,7 @@ static void machvirt_init(MachineState *machine)
>>>            numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
>>>                              &error_fatal);
>>>    -        aarch64 &= object_property_get_bool(cpuobj, "aarch64",
>>> NULL);
>>> +        aarch64 &= arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64);
>>
>> So after this patch there are no more use of the ARMCPU "aarch64"
>> property from code. Still it is exposed via the qom-tree. Thus it
>> can be set (see aarch64_cpu_set_aarch64). I could understand one
>> flip this feature to create a custom CPU (as a big-LITTLE setup
>> as Marc mentioned on IRC), but I don't understand what is the
>> expected behavior when this is flipped at runtime. Can that
>> happen in real hardware (how could the guest react to that...)?
> 
> I don't think it makes any sense to do that while a guest is running
> (and no HW I'm aware of would do this). However, it all depends what
> you consider "run time". You could imagine creating a skeletal VM with
> all features, and then apply a bunch of changes before the guest
> actually runs.

Thanks, this makes sense and confirms my guess.

> I don't know enough about the qom-tree and dynamic manipulation of
> these properties though, and I'm likely to be wrong about the expected
> usage model.

Kevin, Markus, this seems a good example of QOM "config" property that
is RW *before* Realize and should become RO *after* it.

QDev properties has PropertyInfo::realized_set_allowed set to false by
default, but here this property is added at the QOM (lower) layer, so
there is no such check IIUC.

Should "aarch64" become a static QDev property instead (registered via
device_class_set_props -> qdev_class_add_property)?

This just an analyzed example, unfortunately there are many more...

Thanks,

Phil.
