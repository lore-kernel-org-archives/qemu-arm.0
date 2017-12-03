Received: by 10.223.159.74 with SMTP id f10csp639776wrg;
        Sun, 3 Dec 2017 07:16:25 -0800 (PST)
X-Received: by 10.101.82.137 with SMTP id y9mr11182167pgp.56.1512314185567;
        Sun, 03 Dec 2017 07:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512314185; cv=none;
        d=google.com; s=arc-20160816;
        b=qKnhpLpT0udcs4RE2nW4+OInC47uk261BE5OCxHZlpGyMw7xVvjNzJyAir5kx48hQi
         MreDRuQhWvneizSPr0i6Utde8ngonKGxWBAXF5MCeR43Jzs1uY5BDpWBQVQOQM9psRP7
         Achinns2Jrq+lzXT5SfYsGmdsa1vvqwWgcv2I49fyACNghcwtlXWjl9Wb6gdIsRTOvz7
         lD/REXL5JZU5MoCfWfA2zdcR5ruSAhkn9xiExKUeTN8KU5epa82qH4Dh09rWTEskidOi
         Wyj9QU2IiybBEVmsEY/f3y0862cuvFF9C7v8GFsSy47ijWsLdXaUjYgSF7HHC6j37SXz
         ZcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=L21msPK+MCMchn6NgLr3W9QPlXNUx/ARCFsJSmM5bxA=;
        b=sI5pLwN3NoLGXitFRsNs9Ku+pu5uY40HjGrlHXKwG4Jb8o3dxlD7HNEOh2Z2dVVd6m
         CoU8i3IEBTJSgS+PpFI4iNiptW7ka8e4UAhGzleiCkWc8mCCAGtuZIcyB8pWvhDMR7V5
         Js3C3dobDJXBPUcnxrs+bvJzkisaYtIjUkDgQz8TVygSBdFGfxMEEaK4dIbHTqxdWj7o
         MK9rhI/7P7J01NJ/gqwBKflNgxWa8ggDoyZUxwkhcOvXjwpTKAg1Tlo0Dvpv+3tsoUZc
         GLJPOpxlvqoMDT+M/HCRFnGIlGK5GQAT77033Xjrg3mWFFBgDu6ES3wNnoUmYCkVtbZA
         uyHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPrfZP6b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y5sor3681014plr.137.2017.12.03.07.16.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 07:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPrfZP6b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L21msPK+MCMchn6NgLr3W9QPlXNUx/ARCFsJSmM5bxA=;
        b=WPrfZP6bzTe6Nkb4As0ei7aaPjYXC2iIAiuCtj9iSQCdfgdLuje6D4IPbDmawyenMd
         av1q5EjL1F4U7gU7kFMszpWOZniI1Na97/L4V+AxUSaQRRqUL2fKD0Fj1ORNNVRJPq7q
         dRuNTuNu/+rE7CsHcCgvI6+CP1vdNILbXx4gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L21msPK+MCMchn6NgLr3W9QPlXNUx/ARCFsJSmM5bxA=;
        b=bs13TnVJ9Dz43Y8her5Dg+0O2EXBmJ8Kqj/N+a9pmJVWVZeD0FwATTvrAkL2mZt25z
         xqFrntzbydmgigIQMP9TPhS3ijTNRDexCy13d4SDsR2PhByu6drvuWb142V7rRN8Ctuh
         edT2P4FjBn+jdMM9yBfyq6bSeYG5SeR4qJCMvCQmttMwYf0QMu/9v/JPHGROh2Gt5zoZ
         mujmU+pb5g2/qVbaeKUVAZxcebz/0+a+CMTFmqDAtJzrBIIDIxIeCKicsenHOztN7wUY
         d0B0HaxVcUABlpeN4C06ln5MEOG28mngUmD9X/+J+TbE+OFyIV79Snd0UF5naatBYqeA
         L9Eg==
X-Gm-Message-State: AJaThX6cIjL7ekGV3Tb1ASEqJvlFatndiDo/9lntNFBooJu8bdk1N9++
	UhA483HA7tz3kBzakx6ZLrnRwRfq4jjMmA==
X-Google-Smtp-Source: AGs4zMap5WtFAiJPtqmA8yUn0r/bfNnDN/4HVSuDu4eAol5WoBTG1JS01GdDVZtfjE1WXw5eb8lNog==
X-Received: by 10.159.218.140 with SMTP id w12mr12073954plp.162.1512314184812;
        Sun, 03 Dec 2017 07:16:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id e8sm20926767pfk.6.2017.12.03.07.16.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 07:16:23 -0800 (PST)
Subject: Re: [PATCH 6/7] target/arm: Factor MPU lookup code out of
 get_phys_addr_pmsav8()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09877af2-5542-8f26-1acf-db2935431fcd@linaro.org>
Date: Sun, 3 Dec 2017 07:16:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 28XDPHct2/S6

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> For the TT instruction we're going to need to do an MPU lookup that
> also tells us which MPU region the access hit. This requires us
> to do the MPU lookup without first doing the SAU security access
> check, so pull the MPU lookup parts of get_phys_addr_pmsav8()
> out into their own function.
> 
> The TT instruction also needs to know the MPU region number which
> the lookup hit, so provide this information to the caller of the
> MPU lookup code, even though get_phys_addr_pmsav8() doesn't
> need to know it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 130 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 79 insertions(+), 51 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
