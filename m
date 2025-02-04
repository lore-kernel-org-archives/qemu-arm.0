Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp263939njb;
        Tue, 4 Feb 2025 06:59:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvjB/G2GlZBKmyCuwH9c3q22L87loElW4VTEo9S7QtbuAiZcc5ketG97PJ29cVry2xerXSpoaeKZyang==@linaro.org
X-Received: by 2002:a05:600c:470c:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-438dc3bb395mr229596795e9.2.1738681166560;
        Tue, 04 Feb 2025 06:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681166; cv=none;
        d=google.com; s=arc-20240605;
        b=eEiC3eRXCPh5zpY0j08SKXhKbIpigBLO52y53osjIzgNwrZ45n5egRV10YPxjI7wyn
         tY7vtnE7VoGC9EPMtna863mCg78q/kOPWWfao4pl5ijUuYVnClWJ0BMnpD1pJz4u70wW
         KKhogKJHH4FTULhYTc/i1NBj5cuVJhCKHyqNgC/Ar54igVTO/u5TWrBjBGXtgahfppFS
         2L7s/4za1PgYg3ucbqa2pt7wu0H8gRkGZi5yiWysIbn06eIONTNAC+ERVMgj22Sth3JN
         gfBwlsg2AiBbEPMGPjM6u1huh7cOezSclQ5Rj3Q4C5CbEAuXhdHmMJMtBb2F3f/ol0kU
         pTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G8anBbyMT55oA4TitLuKWWu2XDaUG1CFB4kIBNGpbGw=;
        fh=bJmYBDpCtFLoMmD3mAOPCDx7TdI3oN6agDdJH8hypy0=;
        b=S+bS9oQwPKxpcqArvIF2iBUevd/qu7ghgJN701vF2tIPRA0qVuXUMfvj+J5yOECcTZ
         L+X3xtrSQ4b2bRucKsSPtVzL58a9CP9cl5ii4zahVK8cN0Qe+sU2vtEBSUVkiwC5JtTv
         WwcVlWhCX/Sk9m2lLTOhXuFO5Z8cP5xi4556rDmaAq7ZbMCcxLf6W+8TefhmPzXMUb/F
         Vn0bwuL5BbOODFFqi7pGNVX3AwOL50j973seYnDcX2bPDFh9FQBXpK+GAPL64M/adL4s
         G+PldPAYtrorufX115ybGlzUrnmndZBrGS82208zJWOD0ucTiv+kloEm/QD++dsHaDCY
         VtTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OsmlbRVs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23eaecfsor51258755e9.5.2025.02.04.06.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 06:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OsmlbRVs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681166; x=1739285966; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G8anBbyMT55oA4TitLuKWWu2XDaUG1CFB4kIBNGpbGw=;
        b=OsmlbRVseNEzH3wcUg0JtYFsBDFNF2dzVgwhcKPii71VESsktZ5a9pV/sXYYcMVPJy
         /7zR8S++/DDp0BBO7pEs9zqr2zmWZOng1gRuXWvCiXJLp+WuKGFwu6+1u+a5aAKbV9jL
         98dluhypJHNCziWlg91cu+XREdlwc26e72QsXBJoEbCkHtRq3GV6NBqW2CjvXrGsl8Kk
         KQlORQqF9Og1Mq//e0R4ftFIUaqM/uddSgmn4dLk1SpXGTSFXLD1Gi2r/1HiDei5HpNv
         UuzLP4mkweU74phk7aof2ziaJ3nxKop5fmkaftC3nsKyOWS598gXenA5G/0wLnW+59Q1
         +NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681166; x=1739285966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8anBbyMT55oA4TitLuKWWu2XDaUG1CFB4kIBNGpbGw=;
        b=VirweSNPzEe/APLPbZ3qs4mFhAR6Z4wobaHg5TSk5QbxrM7EQ0ZKjR93F8ZaJF1hDP
         fig/PfpNUmZ+aGMcYhVwoA4jBolNitHdSM+EE7ns1UoqXOSFghVt7FArKt9DgAyV1d0r
         ThrAVk38PlapCvna6T69i/yzWYjYHo/eQWPE1B1d3PtLP7BTEiIGXxwf67msqyG4G+y7
         uBnPv6kOkWnD+6E9S/egC/oO2rspeF31pcoluhsz/0XAMZarCuLfpATb9muDD78FL5ZX
         qjMv0EZz+XQOq5vWbt45UYabNBLjU3FNkxMyl8R4RkA2aNlUkVKEVnSH+3+7lKPkIL0B
         GWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE/vq5nYodHCdruF/5+hoLTWeSN2KU3kA8n9XMO0GjgNwtY8zQJ+L/tOGAPcuPPKQkvo7kkagroX4ogA==@linaro.org
X-Gm-Message-State: AOJu0Yyfms7zRDB77es7wSr+sAv3vJ7+niWwCZGy6dsWQT2H1wfJMn/D
	ddJgEmLXxtHnaKkYnUDkvNzRuOwOpukNWvO9BQ1b0X9I41Ra7YWdoDG4KvleBWRE7g==
X-Gm-Gg: ASbGncu6/wI4d9mq5brFveW3OXF12OE6PVu8bPWGTj22mijCnGEGeBrzNsCEch8J6+E
	XVp/BDClV+914LaWD6mAlsRTJkZfvtoYNV8bZyY+NzumqxLJbtlWFZEvongkBpFkb2ZLj/rToVn
	CiCC3qt07BPoPikv6tfYRnVeoLZQZjdPwiCWQmF8MF5iwYSQtxTAOx9D7/y2f9X5GTxNsA51wAf
	9qeDY1EfYZph8zF942T51c8hnoK+DQcL/O790PZcYB9s4l/yVMTxO0VOBkI8OkkDYDW0bz7ZbSp
	BDYQbjtvfipTP7BxwU6IG/SYWix31CJNL7W6Ty6cG/HWLFQXNN/jNq0nmgE=
X-Google-Smtp-Source: AGHT+IEu5vViV42ffKjJRwQusiGEU2jHEczefEeY2w30sljGmqFRrYksEhjWr66LJJC4E5zny08+5w==
X-Received: by 2002:a05:600c:500b:b0:436:fa4f:a1cf with SMTP id 5b1f17b1804b1-438dc42551fmr232683835e9.29.1738681165971;
        Tue, 04 Feb 2025 06:59:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f41esm193956215e9.36.2025.02.04.06.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 06:59:25 -0800 (PST)
Message-ID: <e368b476-5958-404a-98e0-591e8f638d34@linaro.org>
Date: Tue, 4 Feb 2025 15:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Laurent Vivier <lvivier@redhat.com>,
 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
 Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 devel@lists.libvirt.org
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
 <Z6HklNsu0Mzgh7bC@redhat.com>
 <CAFEAcA9m8g=K-0RU31kswbNSKWnUqA78KxNkcXEAqR=BhWc9bA@mail.gmail.com>
 <8616891b-9747-4388-99dc-d6e53e090001@linaro.org>
 <CAFEAcA9weFzHW+kL8W0GD26A+QTWpC7Baf9-=Oc3t2yw77=RCA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9weFzHW+kL8W0GD26A+QTWpC7Baf9-=Oc3t2yw77=RCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MISXaEmT71BN

On 4/2/25 14:52, Peter Maydell wrote:
> On Tue, 4 Feb 2025 at 13:40, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 4/2/25 12:13, Peter Maydell wrote:
>>> On Tue, 4 Feb 2025 at 09:57, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> IMHO we can have distinct machines for each model, but
>>>> *NOT* have further machines for each RAM size within a
>>>> model.
>>>
>>> Yes, this was what I was intending to suggest. Apologies
>>> if I was confusing with what I said the previous time round.
>>
>> OK, let's see if we understand each other correctly as developer,
>> before explaining to users, taking the 4B model as example.
>>
>> The 4B come in 4 physical variants, depending on the amount of
>> DRAM: 1G, 2G, 4G and 8G.
>>
>> We can not allocate 2G on 32-bit hosts, so to have a reproducible
>> guest behavior on 32/64-bit hosts, it makes sense to takes the
>> model with 1G of DRAM as default for the 'raspi4b' machine.
> 
> At the moment we create the 1GB version on 32-bit hosts and
> the 2GB version on 64-bit hosts. I dunno that that's ideal,
> but I think it's probably best not to change that at this point.

Well this is annoying in my "unify qemu-system-{arm/aarch64}" effort,
but not a blocker.

>> If an user specify -m 2G ... 8G, we can adapt the 'board_rev'
>> register to expose the corresponding amount of ram. Now, how /
>> where to tell the users 1/ the default is 1G, and 2/ they can use
>> 2/4/8G?
> 
> In the documentation: docs/system/arm/raspi.rst .

OK.

Back to this series, please tell me if patches 1-7 aren't useful or
if you prefer them in a separate series:

   hw/arm/raspi: Access SoC parent object using  BCM283X_BASE() macro
   hw/arm/raspi: Merge model 4B with other models
   hw/arm/raspi: Unify RASPI_MACHINE types
   hw/arm/raspi: Pass board_rev as argument to raspi_base_machine_init()
   hw/arm/raspi: Consider processor id in types[] array
   hw/arm/raspi: Consider network interface for B models
   hw/arm/raspi: Check ramsize is within chipset aperture

Thanks,

Phil.
