Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp390639ejc;
        Wed, 18 Jan 2023 02:45:28 -0800 (PST)
X-Received: by 2002:adf:ff90:0:b0:2bd:de40:3a45 with SMTP id j16-20020adfff90000000b002bdde403a45mr5512414wrr.51.1674038728813;
        Wed, 18 Jan 2023 02:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674038728; cv=none;
        d=google.com; s=arc-20160816;
        b=vt/q5/WWDkQ4aVgY5j1Kg1BGvzAWVpSxpF6PHN3HR+3eYgYV4TrASktVt3p0Fdfvs2
         mZT9su9CuWzACJZ2EgdEOznmysRorvRa8Xh06ExWe6JIKlt2XXh+dVHS37cYcg4hfwH2
         8SqGYiECiCs1FwoDD77epIVvpHM5o4AM0G6s1ASb1fbl33MED7Jf/W9aNz91cmKAFiLG
         IOH73MyeO1E34+5+8WA4DBV7mQhj0pF3Hy14MhpRx5sXdz4/MuV99koUDarVzA9O24Iy
         wsKYT0EzrmB8rVTgyMhtiZ0Jla60Gcrdybf0Eyt4sDimh8VrxwBKNBbA7/7iemd8arM4
         eUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=POBLeK6wEBeyqlHV8bgMgnWeDtKCT80g2KWdwHFt+N4=;
        b=BJDEOiVdOC6wIJOK35cpyAV2v/ciElp0vxuixBu36V0kgl3JHwtICPFpYsesbnzI9H
         WIIYYE2K4F4ExNnT5iNA9FRYqbRT3qh/kSInqLLPhHOegI4vD1+itJu9rTX2AAmSTytZ
         sO95t5BbS1a8mX2vds+zUMCbxJKNrAyudsWW94ojO7gUG8h9enF/u/2BcY+i8VZ5sgTS
         P8Ink5+hXuEqSH6zYv/nA9dpKcuEiepT5/Ylw/Jksic6kHS0U80Le9gSOLRItLIgBZhK
         qMRHb9oFULXo9wIYHj4gQRPPCVoOn8h/54idgGcB39nhJfAxeiydbnJ2zfZDEUJf5YSp
         BPbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eBHh1gU9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r1-20020adfa141000000b002be2b409252sor994741wrr.67.2023.01.18.02.45.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 02:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eBHh1gU9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POBLeK6wEBeyqlHV8bgMgnWeDtKCT80g2KWdwHFt+N4=;
        b=eBHh1gU9890a0Cjs1jBmE58zoc/8pgoRzETRQ2kwcC/e+CQkN8jNP3Eo45hsHPXfQu
         fkaoh+LR2Bb07pDtH3lMsdI3tualo557O+NyIijMGwVmIikmxjra0NkxfM8bFFSMMB64
         yldNagt4h2dEw2AjFYo9eWlS3hQ1iOSFBx04oMVZN0px1BzuTQSy/LXnYKMZ/e/9WPEj
         K5Rm47VJEgPNxzB9Lq6bO0ArRcrnaDAP08rcY3PWqqRwKv0x1DR/+mDWYbeE1EJXWD9R
         h8JjCPdg1u1tgz9mjnVGNOn3V+HKh93W4tNkPsrZ5BOz/S32eRQAWrF/GWJQsbIZnNdF
         xF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POBLeK6wEBeyqlHV8bgMgnWeDtKCT80g2KWdwHFt+N4=;
        b=yGBBaNN7fX819fquS2aNl0Bsa+xGIqgeeO17c4gqjj+eGPXTtk1XzEBDUf9KBq8xWV
         ysf9gbrIj4tqryNlL66+tZXHZRAUikU9y/mkWbMTQlkj00RdiZW7DXwK2XzJXHCFgbiq
         HxRlPpkG66gKOnVwx8QiQsc/D7B8j+rl3hQ4h8BNi32c9OEwMwt5egbOEf2z4vvgGdv6
         GQhQHqTF/On+omLOKP14kUuEpVdjOYrqr2kb+97wjsSRyQ5Wxbp7bqE10E1VxRVLNAb8
         UGNOMiOGdaAML6/ZpnAPRf5LEaK0nrnzaRvwCMDLqFaOrbvA+esvXWH08To/KrfrVenp
         1BJg==
X-Gm-Message-State: AFqh2kpPnkWAC2rQvUpR8AHsEueWwF9jBW1axzNKokuV1CRjIv/zPrw+
	2rp0RQQ6/S/3EuEHjU2wjllD18Dv
X-Google-Smtp-Source: AMrXdXvb7kGmsBhwQYlBpEUi/YaiU0sZP3RlGi7e9bGC9mrhnmUQMDdPSHWj9CGvHNgjl/HQidjpeQ==
X-Received: by 2002:adf:a318:0:b0:2bd:dc0c:ffd1 with SMTP id c24-20020adfa318000000b002bddc0cffd1mr5978546wrb.13.1674038728583;
        Wed, 18 Jan 2023 02:45:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h3-20020adfe983000000b002bdf5832843sm10162239wrm.66.2023.01.18.02.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 02:45:28 -0800 (PST)
Message-ID: <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
Date: Wed, 18 Jan 2023 11:45:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkmx0yux.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /h0Xy2ZxB09X

On 17/1/23 20:01, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>    target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>>    target/arm/cpu_tcg.c | 77 --------------------------------------------
>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> [...]
>>
>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
> 
> Hm.. QEMU doesn't start without it. There might be some implicit
> dependency. I'll check.

Likely some M-profile code (note this type is a QOM *interface*).

I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
reachable in a non-TCG build.
