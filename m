Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp136038ejc;
        Wed, 18 Jan 2023 23:10:50 -0800 (PST)
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id hg6-20020a05600c538600b003cf98447b11mr9569715wmb.23.1674112250653;
        Wed, 18 Jan 2023 23:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674112250; cv=none;
        d=google.com; s=arc-20160816;
        b=pDq5txRnnyeV6cTgPK+F8wGy/mNl7bj3/eOBSXC4wVkZ3zfOed22k1qDtNf3wiN0F8
         DYGwvOOhctPdUGAQAZI2gnS8s6aAXfBsjcN0ioumXhyDTS2OvZatTUTfj9INSkFJBJUG
         t00ur6a7X10ey2Izs3ef+n5GktfINaSgf2jwQ2goLhDqgxM8OjJ0h76FqmsUs8mH7wIN
         4pZF8dwq+ecSPRKrMZftSI8HZRJXhbfngiBYT3LDU/KEeC3rQfP8VZm2am1WRpcNOLT8
         3VoC2AGVFdhpaKWNxLV1oBq/nGZDkj3D+DKzQ4kRdHWFK92EQTKoJuHQYXBR/JYa1Y2O
         FVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mfGrruK8nilb3QcyxSk4e6VXknYwMjLnsxyzt8RpGAA=;
        b=IIBczjfbYxAJgbZhKFJLupwvm/ek6fIqB4oo8GN5dAsr9OfXgurxc1IgmlisqKNTp1
         f7ar48twtF4Nkt83rYWsfRo2Aloq7QbZoUscsWk73kupwax3iVVRPAtLCNrkTrUigaRb
         oEKmrcN6a4k/nadwWfYrSHmhMfTSf9NTdmIMe8X3A/2WuLiOPTKdV5jI+hUKnxVn2gAD
         WtRagWJWlJa2sb8K60eetLWssIVK4CbM2H72FitCpUIXjrYpav9sQVCnAKc5EE/wtVYB
         l9Rn22s7rftKuMoK72APP8eBEWBvLm46NtX+UyRmIE00IFb/4czbVbmsibJ+otYlwu4s
         XUTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EY6ya9rC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l12-20020a1c790c000000b003cf694c21b1sor1444284wme.37.2023.01.18.23.10.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 23:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EY6ya9rC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfGrruK8nilb3QcyxSk4e6VXknYwMjLnsxyzt8RpGAA=;
        b=EY6ya9rCvFE0fQSmFJHIGrbwHx24ASXtPxXhCRQ8VEDu5Y3UUu+cewc3kkDEWhi0nv
         +nDPE+vnnw8Y2DjcQjVYT3guyquYdW7vis6FxGCORG1bZc2FQm+l8tX+rdHCYf0/t1dI
         /AqK5sfpGPjvtEXqykf3C8SJfiWIw5NL/GR+GfsvhxrodslZ2k7L3ZOVnfvfiNTClJwE
         mM5CW23OsSGDJoy2+kzbyB+EwVlOHUq8Vo59oSL4aC5P6Drz91iaUs3ucG75U4NTfHl7
         p80yxotTHZ53aE5LIYdjwdIQpvys5jdLSyrNT04v7qW8bjmCBMi5noQnCRVK1MmsBRC/
         CKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfGrruK8nilb3QcyxSk4e6VXknYwMjLnsxyzt8RpGAA=;
        b=vLn/4/i8Ksnwns1QEvKfhnM2glav2BaIkXnT4nij/NU77HOuLWt+NOB2lsxacVwI7V
         ifvRRabYyi3asbTwRTEJ/z9TS5kQKoJ5krb9hJyspzhaZFHvSmaPs/w9gecLLfPiiq6l
         GmZbVxHr+pN30PZQ6hZYuLGfQOiIf6+MST3xd8iBvu8vhK7bmPyUJolh495oX2gKTQMf
         rliJUgrg5DWkWE0ze5VzAt6HdUTaJhj0C7y33cGmr7it/tnQuxX8mhSzPzgc7bAJbKAP
         nSB3BtRJzdtluWp/8lbohTW9FtSZ3deVDNmhqZzi6AWdgq/PfUmU3++KD+lwcqd8v1wv
         aIBA==
X-Gm-Message-State: AFqh2kpI+myRE9nbf6odN8GTN8Hd1YEoJFXfZQoLyG7ok5yMupFM35vz
	pWI2fWUuHZDGgemaigfO8ItMQXmq
X-Google-Smtp-Source: AMrXdXsfg1qktCF/uCLKdG3s++8+XGVPWdyZlMaZGxeM37iCrcDByoN2/cBPx4DnzdiaZg05MtVGIw==
X-Received: by 2002:a05:600c:1695:b0:3db:12b:5103 with SMTP id k21-20020a05600c169500b003db012b5103mr9597988wmn.5.1674112250400;
        Wed, 18 Jan 2023 23:10:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003db0659c454sm4902782wmo.32.2023.01.18.23.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:10:50 -0800 (PST)
Message-ID: <48021cf0-914a-d186-4464-0ae65d7501e6@linaro.org>
Date: Thu, 19 Jan 2023 08:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org> <871qnrcz31.fsf@suse.de>
 <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
In-Reply-To: <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: E4MvsupMfnwW

On 19/1/23 08:05, Philippe Mathieu-Daudé wrote:
> On 18/1/23 22:28, Fabiano Rosas wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>>> These are the already reviewed patches from the first half of my
>>>> previous series:
>>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>>
>>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>>> that are still being hashed out in the other series.
>>>>
>>>> For the build _with_ TCG, this should behave the same as master.
>>>>
>>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>>
>>> $ git am
>>> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
>>> Applying: target/arm: Introduce aarch64_set_svcr
>>> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
>>> Applying: target/arm: rename handle_semihosting to 
>>> tcg_handle_semihosting
>>> Applying: target/arm: wrap psci call with tcg_enabled
>>> Applying: target/arm: wrap call to aarch64_sve_change_el in 
>>> tcg_enabled()
>>> Applying: target/arm: Move PC alignment check
>>> Applying: target/arm: Move cpregs code out of cpu.h
>>> Applying: target/arm: Move define_debug_regs() to cpregs.c
>>> error: target/arm/cpregs.c: does not exist in index
>>> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>>>
>>> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of
>>> https://github.com/stefanberger/qemu-tpm into staging"), what am I 
>>> missing?
>>
>> How did you fetch the series? You are missing patch 06. Maybe it is too
>> big for the method you used?
> 
> Actually the tool warned about patch 6 missing, but I didn't notice:
> 
> $ b4 am 20230118193518.26433-1-farosas@suse.de
> Grabbing thread from 
> lore.kernel.org/all/20230118193518.26433-1-farosas%40suse.de/t.mbox.gz
> Analyzing 20 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
...
>    ✓ [PATCH 5/20] target/arm: Move cpregs code out of cpu.h
>      ✓ Signed: DKIM/suse.de
>    ERROR: missing [6/20]!
>    ✓ [PATCH 7/20] target/arm: Move define_debug_regs() to cpregs.c
>      ✓ Signed: DKIM/suse.de
...
> ---
> Total patches: 19
> ---
> WARNING: Thread incomplete!
> 
> Indeed patch 6 is missing:
> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

I could find it here:
https://marc.info/?l=qemu-arm&m=167407090423121
