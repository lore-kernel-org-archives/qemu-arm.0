Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp837771ejs;
        Tue, 9 Jan 2024 22:01:39 -0800 (PST)
X-Received: by 2002:a05:6808:1445:b0:3bb:f5a8:3d63 with SMTP id x5-20020a056808144500b003bbf5a83d63mr733881oiv.57.1704866499366;
        Tue, 09 Jan 2024 22:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704866499; cv=none;
        d=google.com; s=arc-20160816;
        b=KSKucCGIZN+pOW66cavJoUNUVMh1ILZ2bLcf5RomXu2WRGFYkdGy4wJ88QC1uSPHoK
         gWgX6BamhFOmRcFhdbGpE9+gT6/akiGnCLRlbXgHLbvfrxLL7BKskpLPqBoOr5sK20HD
         Eh4GCQJ1xm5nnoD1f0Rr2axmU/oj3vHmQFIyxHB+EgIUOQzTay/glXLjCe4uufplY0Th
         kwANY+ritJjbLmcefu2fZMU7x7xbySce0ADpzkdmRJZyIT0pIHNvjsn+klRDYd2tg0NB
         P+EWMbhfp7XMe3aciSH82E/U5xIin+7dxr9RK5ayf5yJiR571cHj4VFGq/8AX09Dm2Hq
         NS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yUr0rz0CGQNbyRQhIZTuzB+wBwc8xG3a/ElYHjeU7h0=;
        fh=51+uMIqR/Pl6WtqsZb942+jZp5l9VwQg+c32yvGGPxA=;
        b=ipk4a+5hZWkVA+hex03nZzp4pGOpyqNfabUrH/hY46zmwyvJ+E5k9+7auQyj/3TACH
         WGtGZ7HuVs0enwKqWlc79Wy7NSYn1jfxnlswFmd5VWz95a7hWJ88L7HqbElSViw5+Sxl
         eGTUoQqBqG/UDZv1QRj3L2sFfK/MvYPJqVsPie9V8Ywvrv761HZfPRPxlFKtfl7aNN/z
         JnhpoBmWI2WT+Q2nYQeCTOgiBsuiLrglePrpNbobG2biD1k4qiA9BEs1e6voliIH82tJ
         HT6v/irzog252MEsYABJ1mzwacCHAZptnMtoE3Xq9AmCl5nwlCob6ukXJlLHhqyZIWAT
         7H1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdvlP5Gq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x19-20020a544013000000b003bbc1d527dasor2204025oie.7.2024.01.09.22.01.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 22:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdvlP5Gq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704866499; x=1705471299; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUr0rz0CGQNbyRQhIZTuzB+wBwc8xG3a/ElYHjeU7h0=;
        b=XdvlP5Gq/2yzTPpc3vlbUrcDV8ZWW8lmNn3PV3A0dqJHq+TjGnIY/xigXdCg+iIvaS
         aVoa2AQVS8x96q27WZO6Lqjv2pgMRx8cRslIyCmjfUiZvjb1JImExmOzxzFKQ1uaMlHb
         zRlW0iJyMfVMpEZG9c7c801lQ2GhKC+CoYak+dWWkPX5JeRFEFbEcK4+qA1Plo6z67Ku
         o7jRP0EMSUFeCXI8EpqdnZmYyaJ2vvZaT9m3w00E6uOO+0J6OCszmbf+36iNe3VJP47h
         LC9WOcXZ1s9wqDRlQfYiRZ1d8vuMWvk76preasp7jBcYdcwAoD/NQSTHopqns41oCkyg
         PdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704866499; x=1705471299;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUr0rz0CGQNbyRQhIZTuzB+wBwc8xG3a/ElYHjeU7h0=;
        b=dwBoq9xSJTy/6wVoLMKG8gXp8jrNb+jlNDNmEeseyfJtahzf4cCFox4N07nhccj9VA
         maaeZ4eFNchJVj3CkdGXOD8A/AVNk6X/8px3D/AhzeIroQUWU67mQa1HpK1vLftD0qam
         5X4xHdgpvvhvx3w/NNVoljF4YK9H2bkV2XXY1ylbErQLu2D1h+syhLvFcEx8C/wJnIO0
         GaZwlKydjwKtni7rrcAGo4jUDF7MSmM3DGALUE2I36WH6jRjRqrkWpT+RBIuwyHkIqtd
         lfsJ6oZ6wxRojm0hjj5u/cTNRR+Bb9wTgV7rXtL5awQMM+3j6s7p5gtG/l1Vo0nTWa8C
         e1vw==
X-Gm-Message-State: AOJu0YxmlU0tkpvNV/NknWh9yhv6FqB4wcXXEm3yqfDF9mz8NftpXOtK
	Dchec/3Bfn6vYQK3SDAqgsB4eTMQ2wdHZg2t
X-Google-Smtp-Source: AGHT+IEdazBoRIJyIXAHGRQEa7qvLWwDCTKT97SvHBfi+8LK9dvSjTDMiWqABDv5Dmyz7cFlZc63zQ==
X-Received: by 2002:a05:6808:11ca:b0:3bd:3e8b:8734 with SMTP id p10-20020a05680811ca00b003bd3e8b8734mr551518oiv.99.1704866498914;
        Tue, 09 Jan 2024 22:01:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.40.227] (ip-38-9-1-25.internet.url.net.au. [38.9.1.25])
        by smtp.gmail.com with ESMTPSA id s9-20020aa78d49000000b006d9b2d86bcasm2648982pfe.46.2024.01.09.22.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 22:01:38 -0800 (PST)
Message-ID: <6c877f5e-e0f2-4ef1-920a-df850484c358@linaro.org>
Date: Wed, 10 Jan 2024 17:01:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] target/arm/cpu: Simplify checking A64_MTE bit in
 FEATURE_ID register
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
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
 <20240109180930.90793-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240109180930.90793-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Koq5buYVF1Q4

On 1/10/24 05:09, Philippe Mathieu-Daudé wrote:
> cpu_isar_feature(aa64_mte, cpu) is testing a AArch64-only ID
> register. The ARM_FEATURE_AARCH64 check is redundant.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1c8b787482..c828b333c9 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1690,8 +1690,7 @@ void arm_cpu_post_init(Object *obj)
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
> -        cpu_isar_feature(aa64_mte, cpu)) {
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
>           object_property_add_link(obj, "tag-memory",
>                                    TYPE_MEMORY_REGION,
>                                    (Object **)&cpu->tag_memory,

It is not redundant.

If !AARCH64, then the isar registers tested by aa64_mte are invalid.


r~
