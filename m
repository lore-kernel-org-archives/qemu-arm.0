Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp254037njf;
        Fri, 25 Oct 2024 21:39:16 -0700 (PDT)
X-Received: by 2002:a17:90a:4ca1:b0:2d8:3f7a:edf2 with SMTP id 98e67ed59e1d1-2e77e606f33mr11913096a91.12.1729917555818;
        Fri, 25 Oct 2024 21:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917555; cv=none;
        d=google.com; s=arc-20240605;
        b=JwNcv0KhtrNC3llvpdL6QPybgi39lk6zcVoeAlJ/0rT4htRpdf83bPOy4j59syF1xj
         xjdlLO4sLiN5x5H4ZhAncwFzsVdY53xQamAUgrplOU5clnYp4j7PPSVGQ52hS1WZXQ3j
         hZry9Ffupv9vlyB5oOFQI9XFFfkjlIRNvZTook5Qe/sfk4j+WPgXiwXtzYpsn6xtjsnE
         Og/2nJ+cuDx5GorZlm9WnQIqKTt/mb8gDy4RClAvffQa859hZTmbUByhx97OpN62pHn1
         MiLagv5zB67/Ba716dZiguSY/Zzc1bStXV7uuhvuDg8rLlE/v542jvjYShouo6rmFzn0
         g5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gs6F87cjm0we97xF2OmKhXtcxUpIT/xX+fPAETT/hiA=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=RZGHdKZT17lAwy+lWWHCpMIJZmo9HVLZ7Vwoza68mdC1ck7098ImSvhxTp2OHAD5L1
         kd/oN4+ttBxl0P0tjHJprVmqgvZ5Tj6bhIzRVyLOUIbL0GX9Hk9HZ354+12m91Ifve7S
         bGqWUav4aTS8IvJrV97xtVBYHwvzja/+wE9cPjgTJSeTJjfd9Q9ivyyBcE1LjTXuCXln
         Abk6UCg0Oq+/HpavdQF6WBMziGrqv5O6nO2tTRFrCKBxRrWrnhCPVmpIy70akVy1Advk
         F1MHg5BCLzVBOK7JhYkPJ16ChWyehXQkFdzFGaCwt1h5+KsdEsX2jkTRS0YSvGmtZyPJ
         NQbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIC8F0+T;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7edb22be620sor2366301a12.5.2024.10.25.21.39.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIC8F0+T;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917555; x=1730522355; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gs6F87cjm0we97xF2OmKhXtcxUpIT/xX+fPAETT/hiA=;
        b=iIC8F0+T0n/77KuwiaYboAvL/EAP73wlkbNvPs+ZIDWzyczG5q66UizLtyt0mLQX9l
         5IXZmorfUUOx4mhSN0E/dPOBiYd7b5uKGCdhVO+62mPegt0G3r+ezSeTtPsZLHPURpkk
         IwxdEOMSSC1aIHW4da1+skIupxkuLujS3YSFfbBVp0aJ35uaK+CX08R/AU75OB3CaTp+
         vf45J++9cUTbXGXk4GFNfgg49mLNVaEpQSK7jWi/KrM6yrMy5teT5/OBc6UhLfgv/IDQ
         6tMgJzh9r6wv8rocaB67L395l7M8JRSyeb5tkI3Kiu4O27edwV+B/8KbfDxZQKo6rn0I
         MbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917555; x=1730522355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gs6F87cjm0we97xF2OmKhXtcxUpIT/xX+fPAETT/hiA=;
        b=UpnPRtMYkX1yISDcxRoQmueWivsZKxtmerIsg9yLCZQbiDUOgRcoqwHA1lifzUFZln
         o124NI0J2ICCowMm+OmHQS71KR7tIi6fDqpm8YaVMnStrPu0P4/5WA2RXCxVkGh2HsZ3
         RPSX7NL94/VcHFtDF9YHZ/wcE5KAuvONYxIgZsS4D1E3+bUmqfM5CIDRG8C0edttphEH
         GqFygT+P6XUDVHpL6pBrRgdahHPdal6SAfFqCf8lX6tvIFeoy++UamhiKkB1QUUbRQvj
         jcKCmujJ8wth5Th4F1K6sA6QwPf3r3mB9ccOti0i6CJcXikNZXItEfb3PwmBiDVc+MIm
         4x5w==
X-Gm-Message-State: AOJu0YyRKJMluOQ73ilyNfL8yGMAkRxoGJ4E2aC9e46iWzcrvLPpecew
	5t7BZ6u8kxwFEqZs60xoavLsT2OxILnul0kZ4LWq4fDdyQ8uLRHcZzAE7DTPQNljEw==
X-Google-Smtp-Source: AGHT+IE9cAmM7uvfX63iDT5wbxyT+quafADF/2cuZhczWLuuSId5gPFypr8wGxOgyNuz2Jpnye1Idg==
X-Received: by 2002:a05:6a20:c6ce:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1d9a74dfaf2mr2800762637.10.1729917555344;
        Fri, 25 Oct 2024 21:39:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8664f4csm1981393a12.7.2024.10.25.21.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:39:14 -0700 (PDT)
Message-ID: <1451fb8c-029e-4342-81e1-74cef282ba0d@linaro.org>
Date: Sat, 26 Oct 2024 01:39:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] target/alpha: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-17-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NT6bxOuj76jM

On 25/10/24 11:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in this target.
> 
> This is a no-behaviour-change commit, so we retain the existing
> behaviour of x87-style pick-largest-significand NaN propagation.
> This is however not the architecturally correct handling, so we leave
> a TODO note to that effect.
> 
> We also leave a TODO note pointing out that all this code in the cpu
> initfn (including the existing setting up of env->flags and the FPCR)
> should be in a currently non-existent CPU reset function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/alpha/cpu.c             | 11 +++++++++++
>   fpu/softfloat-specialize.c.inc |  2 +-
>   2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
