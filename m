Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6666364dlb;
        Tue, 2 Jan 2024 08:15:39 -0800 (PST)
X-Received: by 2002:a05:600c:34d6:b0:40d:8c1a:386f with SMTP id d22-20020a05600c34d600b0040d8c1a386fmr539969wmq.102.1704212139454;
        Tue, 02 Jan 2024 08:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704212139; cv=none;
        d=google.com; s=arc-20160816;
        b=hTi2a7FrdJ4szhl9hl+8sTxhh1sFa+vwJb2yXnUgZj/N+ADLCUiguI89ehTp6taHmM
         TnssKNligRPi5mBP+BCoW2TPSWNQv+gU/4RCvhvDR1ODwHK+U8gvn96VtACPeHy8RdUg
         CpdanTWPOIEQlBs2rGvgLSlMHS9jPuIf7+lVpJo1i6aNmIgA570F9yNMkePYnm5KTTN8
         uC8ULEcWjV1AHHjNG4Tx/UJ8rZqELcjE3uo4CXAXRDOmFBIALxn09neA//dtc410Tcto
         Xrp0B4hjQr+4JkgwZJF+vFhHZZlawk8AYj5nbEwYakgpANoJopguZSgJjfihVCjI5MW/
         Qb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kHHTaMmaf3ppwIK2mjmf5zQwjb0h9+pVdKUcQkkWC5w=;
        fh=yVicoYpAgU/BdS9t2uunJGtWVPSfQutSa+vgBB4VROQ=;
        b=mA16/madDYfrbzxQp/jhaCZ3ZV/3bOBQq8Tp3Jb9DzMrhb0VetiapoSQB0D4ePRY7+
         enL9pxQ9VCZ13sAbKbe6Z+b2E/rXaXTMj1MkFxOcfd/Gn9LQQuBIN8g9Y2c5iqBTrHLC
         qSFgZUfFiL2pkMMhAYbESGCjrw1Azh3I4/fTcI1sL6LmBKVKY9p9KWPLTClIO8noSEsC
         ltDtYxPP3CPnqbEVstKeVkSq//15M7YWdY5FLzL0FE3GGBpFZWIsZCvDmUAiI4er1IUB
         GgDiMR2iqxcfo4J66xQgQb45uk4PfkUUNBGLcn2YTCRGVZAlIuTm9CjVR455tDoqGf2A
         obdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EC1oTkEN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 20-20020a05600c025400b0040d7fd4a597sor2596678wmj.9.2024.01.02.08.15.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EC1oTkEN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704212139; x=1704816939; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHHTaMmaf3ppwIK2mjmf5zQwjb0h9+pVdKUcQkkWC5w=;
        b=EC1oTkEN36hy9mpgPCbiQNn8IfHX1lBRZ9Gv6YAI/Cy2zT0AhtfS0Z66SNoE35dgBq
         0lPLcqwnj4jT61Cf4KUMri+S7iAELotPB2YhMZIWTaKYtkYEWTJCnxC30R4VIRShumzl
         csCm6jT9ZNXktARyQ3H3dIRfFRjaJmsXJd9sjMe6Cbdod+CGK7Vra6SkoZXJiP+F1NN0
         ahIEwot46023DGBBYFtwwlpjk6wrT1516q0CEBWwmk9yqOpLlqEPTB2miUISSCRF51xh
         pkweBg7CYr1CjzqAJGz1ZrN/+4QYwIJQZdaKnKLOb0ddJkLHL3vsYUXdYFMeen1MArZV
         x30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704212139; x=1704816939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHHTaMmaf3ppwIK2mjmf5zQwjb0h9+pVdKUcQkkWC5w=;
        b=lEfzFaZ+u92R+rvnpzrYkomK+tPynijAh3zkj9ytdmhz9ucjc+FIzjcda8AA2DUJlJ
         HBtGInIMA7FoGd6tm3QY8w6LBukmJzUTL1SPeorIznuopgcBQB8/myYHSWQp+mdX0xup
         7PqsuZO8PQx2pdWL8kdBgsbqJRbqHnC1E7OLjK7vMmsfdRrdVyjkGS96RJhq/OfPpkJE
         QBmXEL8/vsxcjPKaEKzLZDdG0q9nhsCwuHMV4f2nvAT+bDadfJNzTXcUINSJArx1MWhB
         qPbc2nWyXbAtltq0JUEYJwoxQJZyZgCcytPA+p67z6HrJYU7mV2RpjgvAiPfyunVEp10
         gKpA==
X-Gm-Message-State: AOJu0YwTc6n9UijzEmZUsfYAINpR3Fut4QJfmOAxgU/dc86WTN+ykTj3
	mALlauwrSdXh7XMynmeXyx0EDfLSThKAD17+
X-Google-Smtp-Source: AGHT+IEeiO/lxozpbeVdVYkVdQgCa4ACsTIz+p1SvARmA1bxULapsJ7uYgQn5jewG9PH2Ey6SQaFYw==
X-Received: by 2002:adf:a4ce:0:b0:336:3df4:f293 with SMTP id h14-20020adfa4ce000000b003363df4f293mr6561417wrb.72.1704212138970;
        Tue, 02 Jan 2024 08:15:38 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d54c4000000b0033662c2820bsm28590244wrv.117.2024.01.02.08.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 08:15:38 -0800 (PST)
Message-ID: <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
Date: Tue, 2 Jan 2024 17:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Anton Johansson <anjo@rev.ng>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pr1AI60f/jqJ

Hi Cédric,

On 2/1/24 15:55, Cédric Le Goater wrote:
> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> When a MPCore cluster is used, the Cortex-A cores belong the the
>> cluster container, not to the board/soc layer. This series move
>> the creation of vCPUs to the MPCore private container.
>>
>> Doing so we consolidate the QOM model, moving common code in a
>> central place (abstract MPCore parent).
> 
> Changing the QOM hierarchy has an impact on the state of the machine
> and some fixups are then required to maintain migration compatibility.
> This can become a real headache for KVM machines like virt for which
> migration compatibility is a feature, less for emulated ones.

All changes are either moving properties (which are not migrated)
or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
is still migrated elsewhere). So I don't see any obvious migration
problem, but I might be missing something, so I Cc'ed Juan :>

> 
> I don't have a good solution to propose to overcome this problem :/
> 
> C.
> 
> 
>>
>> This eventually allow removing one qemu_get_cpu() use, which we
>> want to remove in heterogeneous machines (machines using MPCore
>> are candidate for heterogeneous emulation).


>>   include/hw/arm/aspeed_soc.h    |   5 +-
>>   include/hw/arm/boot.h          |   4 +-
>>   include/hw/arm/exynos4210.h    |   6 +-
>>   include/hw/arm/fsl-imx6.h      |   6 +-
>>   include/hw/arm/fsl-imx6ul.h    |   8 +-
>>   include/hw/arm/fsl-imx7.h      |   8 +-
>>   include/hw/arm/npcm7xx.h       |   3 +-
>>   include/hw/cpu/a15mpcore.h     |  44 -------
>>   include/hw/cpu/a9mpcore.h      |  39 -------
>>   include/hw/cpu/cortex_mpcore.h | 135 ++++++++++++++++++++++
