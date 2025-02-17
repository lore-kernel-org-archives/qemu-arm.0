Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp80863njb;
        Mon, 17 Feb 2025 06:45:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQWuGTSQX5IOK4zZNO2AFVbtfn3Yq0jsFIQV35IlPmp9UqCrOoOHh2ffvCRJLOBvUftGX8O2jCLHguiQ==@linaro.org
X-Received: by 2002:a05:600c:4e8d:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-4396e7d3b00mr85934605e9.0.1739803557176;
        Mon, 17 Feb 2025 06:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739803557; cv=none;
        d=google.com; s=arc-20240605;
        b=iGIsMMnRZMLbtWzsnq2Kq6WCdfgVA+9ZK9fORR8x/ToP0dEUSdQFS7vez07v76VlUL
         KdPudHNkKmMWZspAJanhVmIqunRKmJcYquaSFVvg/kOOM2d9zUC18HPHePPZIv0RVwgG
         Qa5j3L3RLOI58V9Ogs8LADoLlioHWxup2+LYK0Bm1lF/o6iNDd5j0/dAUSRqbQ3ZfuyI
         X3ETV8qdDxR9YKK5LqGSSRaG2eRrI0Gt+9bhzifIZSyOo2TbhpI1A9Oa2UBKgfB54Cps
         QTdJjYSubG4G2rFjYKDxapYamUilOUgNxVD3nBZopxJA3KEOkjkhQrkMi1jtR8q66kZN
         PbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y5dcl97+R9ZvlvmhWi8vj8stXbph2OUxTVkLSpaI3GU=;
        fh=e8IkcL1trkLr0lQnvGuMX1MuRuFFIqmx2iRfeiG9knU=;
        b=DR8ADvA7PFjJfoACqFg69JQIHUNFVaC4sWx4R8/cpOD6j0s0AknHoB4Zh7RRCzoECX
         nMGYveEjnuB3BEYDuRamXY5l9iGy23b/EcM7SFam62D5K79uLIRG4bLuSGXH8j8X+zaP
         Gjio2i4V+lPZizoRbiTYwMHiQkfd7ZbZc/VGkLkAsPLbQ8pdB/qVJnUmI8KO3ygBFUkq
         nkcWhFJ3knW3i9vkN7hRhMoeC+4WWd/rh66NcGvXKOe4UBpmPlOwSh3K5fckBsBIRn4n
         PmFBSIKgtze7gxDSODMx6vK8AX4dVFqIejToMGa5pfyPpjJx+YNgd1QTypwEOnZpJYqC
         Et0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQiz+P9R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43982438f31sor6426185e9.5.2025.02.17.06.45.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:45:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQiz+P9R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739803556; x=1740408356; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5dcl97+R9ZvlvmhWi8vj8stXbph2OUxTVkLSpaI3GU=;
        b=rQiz+P9RZ9ePQVUBI0oRLz56wCXyq2Svi/IljrShV8nPa70ANXSMMu0deHpXjtIeeQ
         12IaNTgRQ2yExqGa38DigjgqaURzdUio6iv3QxCP8sN3PMaFpDs6yJsvkfrcywtd08c4
         SbKssph7aiPhAT0xobu2+NDnZ1gcIiiKFgCMQq5B9Zdbx3Zs4WhdVY/qsa9wg1iZUSV8
         VKcybTyR59m4VNDtvt5FD3PxaROEJujyVDLXmHySHEFkzeo7ziPPcDS4KajtU73uQctw
         7Dz+LZJLp3EARs39OW8vAMNQWu/G0+sChkWFr4J4z3zLkzvO8GA1UgAiokRwfxbWZzsA
         NPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803556; x=1740408356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5dcl97+R9ZvlvmhWi8vj8stXbph2OUxTVkLSpaI3GU=;
        b=XHbdQ9+XjOEwopjuhilKYMxCLhd/5tV9StK24DZG+1lLL1/f6lg0e0U1LWhpF6TpgT
         kOtq/Sn1kWcsDvREzQH9F8zjM/GqZSEKU1mbcNQuD1PQCCCuEPjBLupMRSYS7mZYgM8E
         iLFhfJudeFIw8jtbat60aoznjd7Pvlc7SYobpzWZyW1Y3xNPMUytXbiExZrWtxks6YL3
         GSQu7hxLHfNPTOsKOqdYjfncSbkFy9C1OWFXRigRL9Sa81TERMrVVSXBNZCYUTBZUMeP
         xo5C8AsAIj8m0ShQnb+M4OahK0j+pgg3wJTMb53E+fNaMxiOOlzVOJynZTbvH7DDcwL1
         7COw==
X-Forwarded-Encrypted: i=1; AJvYcCWAUYCVEPmarCdic+GD6iuIyIqaH+UX7VSyxyhokPKk4NEbEd5W3pUnWcqUpcQwotuGzIXze78c0YcaxQ==@linaro.org
X-Gm-Message-State: AOJu0Yzm/YfZNxE3nW3YSTXrxc99bWq6asnFb9fXbtmOE83DmbmN5pZB
	B+Siw3xt6slw2+hIiRWiVIIN4OdD3OyBLlVw6lWlpqH5THysIaCpPlRhEJ8vleC7DA==
X-Gm-Gg: ASbGnctgDjfiuw1H3+MK6xfc4nBsXga6LBSsEJOsjRjRbwXuTcWV0kJiqh/jY3hRlHx
	wpi8OAilxYNnVe5PM4S1MzBq9btmT7a+4wW/wsrf+MH/C8fQw9oi/X+HNhQnERu70ijqfM5xxpo
	FDMEtFfzRJMDDiK9Ag0o3gY8oS+ELtb0o/ARCire8MifSfMbEji+JO93YHagvHEQ/dbB0B+E27D
	isGkug2dgcla2yfweznlRUGIccWdhs7O+zjfXqjA8Vwmw5OCZLUWM0Qjuc38zD4YN6Um2y8Dsnp
	dpE351f3rVxLb4uVZTQymYBq5b4dZf9QlRk=
X-Google-Smtp-Source: AGHT+IGiZCOT4kWCD8sJLEoL3o4iHw3Z3wI/vp8OkstOwVhDGGBN+DxGJkpaozJ5yg5lWCMHEBJ1hw==
X-Received: by 2002:a05:600c:5124:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-4396ec31d4amr87754755e9.7.1739803556598;
        Mon, 17 Feb 2025 06:45:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.121] ([176.167.144.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7bcsm154096515e9.28.2025.02.17.06.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 06:45:56 -0800 (PST)
Message-ID: <b8377b2b-8924-40ef-904f-dce0b01e5bb6@linaro.org>
Date: Mon, 17 Feb 2025 15:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] hw/char/pl011: Trace FIFO enablement
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250208163911.54522-1-philmd@linaro.org>
 <20250208163911.54522-5-philmd@linaro.org>
 <CAFEAcA-tQUL2Rt4Y_eNFxCFXzNXupzQz3qYdEupB6Bb3HFyhfw@mail.gmail.com>
 <CAFEAcA_66f2t2UQv5eKwspDTBs+kfvpGsMPG6f31aqs6FWMx=w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_66f2t2UQv5eKwspDTBs+kfvpGsMPG6f31aqs6FWMx=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1E2aAjTxOMrx

On 17/2/25 15:39, Peter Maydell wrote:
> On Mon, 17 Feb 2025 at 14:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/char/pl011.c      | 4 +++-
>>>   hw/char/trace-events | 2 ++
>>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>>> index b9c9e5b5983..447f185e2d5 100644
>>> --- a/hw/char/pl011.c
>>> +++ b/hw/char/pl011.c
>>> @@ -148,6 +148,7 @@ static bool pl011_loopback_enabled(PL011State *s)
>>>
>>>   static bool pl011_is_fifo_enabled(PL011State *s)
>>>   {
>>> +    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) != 0);
>>>       return (s->lcr & LCR_FEN) != 0;
>>
>> Might be neater having a local variable rather than
>> repeating the expression twice.
> 
> I'll squash in this tweak:
> 
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -148,8 +148,10 @@ static bool pl011_loopback_enabled(PL011State *s)
> 
>   static bool pl011_is_fifo_enabled(PL011State *s)
>   {
> -    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) != 0);
> -    return (s->lcr & LCR_FEN) != 0;
> +    bool enabled = (s->lcr & LCR_FEN) != 0;
> +
> +    trace_pl011_fifo_is_enabled(enabled);
> +    return enabled;
>   }

Thank you :)
