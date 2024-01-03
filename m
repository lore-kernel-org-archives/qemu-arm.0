Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp373737ejh;
        Wed, 3 Jan 2024 01:19:41 -0800 (PST)
X-Received: by 2002:a5d:4c8d:0:b0:336:7660:e0cb with SMTP id z13-20020a5d4c8d000000b003367660e0cbmr11660931wrs.88.1704273581310;
        Wed, 03 Jan 2024 01:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704273581; cv=none;
        d=google.com; s=arc-20160816;
        b=nTupiev2Ya5NFszsEoWzyv3a4/KUBTYn7Y8EcgdIDQfgL/CG2vrIT39/HckZzGsWgN
         kQQkWhz4YUjiLw4ajtFOGYNAph5MBYelRbKgdO41if1sBNrDOD3s9uvoU3bUaDrB0L76
         /v80ZzmqnGTxOr+VkoRHYJ/q6l8besIsmFOi0ubL8NwpapfNhuE9K4UVgVpgJ49aM/Bc
         tD0hgXj2PgKwMc++4B0q/AMoXB/3EMnK+SSbkuoJHsJNo/IaMj4kbGEyyKZfmNzLtZLe
         T00/5rzVYz9dpHW77hAQ7GSQhL82M6AoLza6qR9ZY39uJfqm6ZtKaHcHX02SSsIzKb9c
         m9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5ooNoPjL26IpKded8UKXPH4td0bzmVxNmp3Fp+OcrNE=;
        fh=NHMQXeBg57WXHhr3Wj2TMeB9cXrSRi8/n0I3ACUpACQ=;
        b=bxWK9kg22WGdI2yQf8ujId6TVISRMhRYyoh894Z5zLN8UBo/kXCGFWCOlYejEEr7Qa
         nyct4vC+fAzb2U9CVgWnEImE6U5Nx+/vOrEnBP1NbkJTJyEqMsR8T6fm1Nm+D6T9ol92
         0nDs4LuSgGlhCU2DCc/wVUWHwrzwJeH5qu/l+GZaN1Y8DfuwCpSIbzDA4/DcrNfPHsUe
         b+k+3Ab4RX+q5lXtQVves1f4iN3J8vUiAglUePHjpYF7V5+HT+ZQBIqzUvAl7JuPfriB
         SRoAWLL6G+fym37rj/Lw8gCraoXWjRR4a1cXlpdzpw26fCAuDpJ35ylGiDmf4KYlFjeP
         LI9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHQ4EKxq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c5-20020a056000184500b00337491225cbsor619948wri.8.2024.01.03.01.19.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 01:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHQ4EKxq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704273581; x=1704878381; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ooNoPjL26IpKded8UKXPH4td0bzmVxNmp3Fp+OcrNE=;
        b=vHQ4EKxqzSsoJ/Eukgf/G9bkILFn+czLcpaN8qFJk48Pq1FWgvLkvDO+yPuwecU37Z
         wX/O9nAromXgGDWINjvks1SjeZdf1EYs88Z4rWpnH2ZRZGnUiHk+M5REFDA2UPhz1De7
         JeJbak8/vERc5pcM16lF4nnqfIPJtU2UXRqNKElW+Qh2VYRlHms0BFUA6oz8FbdMeT2C
         /YlbhknXMu5MftGxmmxWQ3gUVnbBWxq7BBsrUfKFsq7V8KDcVSDiuFnUQzM3Vl88Tiax
         Yi2TyBMGOu8JtfJUItDLa8yJeNNlxBuC16pDiRHcpT8vkdSi3l1ogOmPWbdht0B8oAiG
         6ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704273581; x=1704878381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ooNoPjL26IpKded8UKXPH4td0bzmVxNmp3Fp+OcrNE=;
        b=kIk4amjg46jPgykwDkWrRQjEgf76DQ1SoPX0jl403zSJfPJRHExankG+DL8TzWjFrQ
         d643Cn7YpAHrdkNWk1wp+KYjiqOyPlCDpDVrrTwWFXTsSfkWdSzxHTr7qq37952uIknQ
         zQiEwld02ZqNMIhgv4dnzUvFClW2IPjefCVuvkg8BBEKUzco2A+Na0JPdsOcKm1CLzi6
         jYY1lje7nJtTDLLqGJhw86HycMPapd3TR5Hq0ZVEIpI0hILeSpnGlhwqPD7t+xQZOz9l
         4xbom5vc44Er3ULfkQeHpJkIOXXAYFQdbFnUqQeFSpUmNot2PcxH3FC6q5LuOCygZKqX
         RlkQ==
X-Gm-Message-State: AOJu0YznsDWU7kp1z5J0JNBZ9il2AglRb+Ue91Vqs6LpW6Il9l8xtEUF
	lTtBWwaV2Zzokc3A6N1ZCzZcsijs5lAFbCLRAWUoIDy79vx3aA==
X-Google-Smtp-Source: AGHT+IGSJf8MKcjwqxwbl1bKe5xfiRAki36T8rP8nUpGLQNBb3SGLs2cpiAUvOdKD0ykp0z4plt/Rg==
X-Received: by 2002:adf:f1c5:0:b0:336:6b67:2cc6 with SMTP id z5-20020adff1c5000000b003366b672cc6mr10711490wro.126.1704273580932;
        Wed, 03 Jan 2024 01:19:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id c15-20020a5d4ccf000000b00336ebf27d59sm18486753wrt.78.2024.01.03.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 01:19:40 -0800 (PST)
Message-ID: <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
Date: Wed, 3 Jan 2024 10:19:36 +0100
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
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@suse.de>, Peter Xu <peterx@redhat.com>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7vkjbxrxLicJ

+Peter/Fabiano

On 2/1/24 17:41, Cédric Le Goater wrote:
> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>> Hi Cédric,
>>
>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>> cluster container, not to the board/soc layer. This series move
>>>> the creation of vCPUs to the MPCore private container.
>>>>
>>>> Doing so we consolidate the QOM model, moving common code in a
>>>> central place (abstract MPCore parent).
>>>
>>> Changing the QOM hierarchy has an impact on the state of the machine
>>> and some fixups are then required to maintain migration compatibility.
>>> This can become a real headache for KVM machines like virt for which
>>> migration compatibility is a feature, less for emulated ones.
>>
>> All changes are either moving properties (which are not migrated)
>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>> is still migrated elsewhere). So I don't see any obvious migration
>> problem, but I might be missing something, so I Cc'ed Juan :>
> We broke migration compatibility by moving the IC object in the QOM
> hierarchy of the pseries machines in the past. These changes might
> be different. Here is the QOM tree of the ast2600 SoC.
> 
> before :
> 
>    /soc (ast2600-a3)
>      /a7mpcore (a15mpcore_priv)
>        /a15mp-priv-container[0] (memory-region)
>        /gic (arm_gic)
>          /gic_cpu[0] (memory-region)
>          /gic_cpu[1] (memory-region)
>          /gic_cpu[2] (memory-region)
>          /gic_dist[0] (memory-region)
>          /gic_vcpu[0] (memory-region)
>          /gic_viface[0] (memory-region)
>          /gic_viface[1] (memory-region)
>          /gic_viface[2] (memory-region)
>      /cpu[0] (cortex-a7-arm-cpu)
>      /cpu[1] (cortex-a7-arm-cpu)
> 
> after :
> 
>    /soc (ast2600-a3)
>      /a7mpcore (a7mpcore_priv)
>        /cpu[0] (cortex-a7-arm-cpu)
>        /cpu[1] (cortex-a7-arm-cpu)
>        /gic (arm_gic)
>          /gic_cpu[0] (memory-region)
>          /gic_cpu[1] (memory-region)
>          /gic_cpu[2] (memory-region)
>          /gic_dist[0] (memory-region)
>        /mpcore-priv-container[0] (memory-region)
> 
> 
> Thanks,
> 
> C.
> 
> 
> 
