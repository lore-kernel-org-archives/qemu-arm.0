Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp980200ejf;
        Tue, 16 Jan 2024 08:20:19 -0800 (PST)
X-Received: by 2002:a92:b750:0:b0:361:8f09:f6c2 with SMTP id c16-20020a92b750000000b003618f09f6c2mr681305ilm.96.1705422018827;
        Tue, 16 Jan 2024 08:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705422018; cv=none;
        d=google.com; s=arc-20160816;
        b=EkjWfKBtSsHzXqWDGrJbNFFeZTSHoPwc4zzOw7q77Yv6wp7al4juudFeMa2awxHKOt
         Ay2k1PRyPuvu/xvX435Bl+CYT5REKY1ubNGLZDQisdazilTgtDQciDRbMWhPeHVegYHJ
         ZSvbh7ZV0wV8fuqPTEDnvRwoMHz89ELZeSVyfG8gUrNiGeXIEKWr82cYmeygbCgD4GXy
         JfsCHc2Q226bikye/F5V1XgUG/L8NT2MJFFGfjb/oX91ErjU7Cu3qCTXavcvgV59zBNy
         Rf69mxyiGY1iSgWnWaMKsgKOYsaJg5AEnaO2HyARAUJkA7d5A49g2Eh1jRdGyEJTnhTs
         eyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yMx2L1+o6Lxao8lN2+Iy4S7RzUqY4Zi08OgW0aT2u7o=;
        fh=ewCEffdgWjLztBEe7sZYUB+0jyyH53i/9XeoAMy3zy4=;
        b=Ly3QIT7AGSojzpo9jT4ucgkkgxFNjftBAJgcTmUxewemKe4MvBh/yoX6TZOXCK1cAq
         wAtwJKtzX4zofYDm4GfQELmVpmAM1WytHpz7PAvcYB+iiKcrFVNWIMCJXhoUHejRX2R7
         Jv2LAXuq2zYCDIzIqV1/DUQGavir09PVkyYAJN0ydbdht8HbIXb5j0yJGkV7T8NJOmIm
         7JVZLr9SHJV8CgyoyLLJ1QeL1V68v64DIDEQTf3TlnH1URht3wsrI1KJdqqClR6NHMw8
         k2Qip/vwnNJPiN9hGqpiVFsRfsddPyRfmN3c8p29JL4QvvByRFwESVjM1aSjVJs3w32p
         3L3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v9SP0EI3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15-20020a056e020c8f00b0035f9f460e45sor4024057ile.17.2024.01.16.08.20.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jan 2024 08:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v9SP0EI3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705422018; x=1706026818; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMx2L1+o6Lxao8lN2+Iy4S7RzUqY4Zi08OgW0aT2u7o=;
        b=v9SP0EI3wTbNZbJZjG3CxIqHtyyoPEi2yb9i8QbVzuStRlfWmkZeQLAaIKYm4pR+1z
         OZsRod3mxOyb1Yp/a6X97sjhyWh96Z1eEfQuxia+7CH/XhSWudIDJT9cGM9rtCahPP5K
         BaL2hd4VjoTQ+dau8Vt49eeXNILjALJPK3bT1Rbr+wfThm86uUG0QsXHw78iSBZxzhNs
         Oo8LQlvwEbhus5veOnMRWdY7j6MJ3/nBjDRqZeim08mwZG3QiOYmnaZL2avxmcQElaJi
         wkCYtlpDFm05oMXkSwW6ZwqJhr5dphtm7ENVs6+kzDdKyuWUMOAi/C5u8JBQHgXXLJYq
         /cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705422018; x=1706026818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMx2L1+o6Lxao8lN2+Iy4S7RzUqY4Zi08OgW0aT2u7o=;
        b=J7zpoM+WJsetfzflDtxzWWH8KuUH9SQ8QRTorRmIuqrM6DhWxWlJkYWGXAnAwuQQx2
         /IEwmdk7KuaZ3NjPu/3C72NQjvIkZthuHtWYr24y1PIya6Q7liOhXvffitB/W/v8EtKk
         I2n4kKat0xFaN0qQsYr2BRsCmIzQSmqSMKNAgtl2w0RQMRcfd2u2kv4jKv4JRQbh+cGL
         o2NkTmRVoqi//HJfrH1tjeBaDJHvhGLe/xsvE+EUg/zU0LfaQlNlHlC90MAnHHQrdNkj
         xOQe+SMrA4cW2xLDTvrzb8WeFAkGr4pP5+qmLqUJtFDFX6hKFcHu3j0aVRq+GeN8tfy0
         Y71A==
X-Gm-Message-State: AOJu0YzwJZrBfUHNoNEpE3oMAZS9PUQ+aqFMyP3B4yC5/fdqlhEo1+hd
	jWQit94htTxNOZZkeR0dp1KZg3Lo+NZ+4Gxm
X-Google-Smtp-Source: AGHT+IEQ5OV5BIC2q15KsebeioDvRsWyXEhHD2P4ji6M5ruw5D6eMht9npmzQDIi+yPPSXRTNWXcAQ==
X-Received: by 2002:a05:6e02:510:b0:361:923b:d79e with SMTP id d16-20020a056e02051000b00361923bd79emr510337ils.85.1705422018354;
        Tue, 16 Jan 2024 08:20:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.102] ([176.176.156.199])
        by smtp.gmail.com with ESMTPSA id y1-20020a056e02128100b0035fea0268bcsm3607268ilq.28.2024.01.16.08.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:20:18 -0800 (PST)
Message-ID: <7a73231a-d7ae-4abe-9bca-e8e295a5f70d@linaro.org>
Date: Tue, 16 Jan 2024 17:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] hw/arm: Prefer arm_feature() over
 object_property_find()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20240110195329.3995-1-philmd@linaro.org>
 <CAFEAcA9c58iVvgW4wnNT1H3tzsdYbxyU-kT7bJP=A3E+B-t7PA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9c58iVvgW4wnNT1H3tzsdYbxyU-kT7bJP=A3E+B-t7PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fr7rsZxH0/QC

On 13/1/24 14:36, Peter Maydell wrote:
> On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Since v2 [2]:
>> - Dropped "Simplify checking A64_MTE bit in FEATURE_ID register"
>> - Correct object_property_get_bool() uses
>> - Update ARM_FEATURE_AARCH64 && aa64_mte
>>
>> Since RFC [1]:
>> - Split one patch per feature
>> - Addressed Peter's review comments
>>
>> [1] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd@linaro.org/
>> [2] https://lore.kernel.org/qemu-devel/20240109180930.90793-1-philmd@linaro.org/
>>
>> Based-on: <20231123143813.42632-1-philmd@linaro.org>
>>    "hw: Simplify accesses to CPUState::'start-powered-off' property"
>>
>> Philippe Mathieu-Daudé (14):
>>    hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
>>    hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
>>    hw/arm/armv7m: Move code setting 'start-powered-off' property around
>>    hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs


> The first part of this is fine and reasonable cleanup, but I
> continue to disagree about the later parts. What we want to do is
> "if this property is present, then set it", and that's what we do.
> Conversion to "if <some condition we know that the CPU is using to
> decide whether to define the property> then set it" is duplicating
> the condition logic in two places and opening the door for bugs
> where we change the condition in one place and not in the other.
> Where the <some condition> is a simple "feature X is set" it doesn't
> look too bad, but where it gets more complex it makes it IMHO more
> obvious that this is a bad idea, for example with:
> 
> -        if (object_property_find(cpuobj, "reset-cbar")) {
> +        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
> +            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {

For that we could add helpers such

   static inline bool arm_feature_cbar(CPUState *cpu) {
     return arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
   }

and use it in the target/ code where we register the property
and in the hw/ code where we set it.


Anyway I'll wait to see how Kevin's effort is going before
insisting with this series.
Do you mind taking the cleanup patches (1-4) meanwhile?

Thanks,

Phil.
