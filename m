Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp221022ejn;
        Wed, 19 Oct 2022 03:46:03 -0700 (PDT)
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id a4-20020adffb84000000b0021a10f21661mr4585801wrr.2.1666176363401;
        Wed, 19 Oct 2022 03:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666176363; cv=none;
        d=google.com; s=arc-20160816;
        b=vn9FAWaVRnERnFmlb4ALe4FnQk8UdrK0PKYh7eq0QHdW9dv14AV/eli+mazOhdjBII
         XfNwNev7/UhjzSXTilfzkMkN6f1vGHMebciqR771GuDFYMVYt5SV3TUkF8hCe2riTt7u
         c9bxqoAhJnRY+B4/P1u/WyG74iBTTAY/vPp2jU0jTDIuey/LDYelirpFa3NHl5uvghwo
         wxsJVVyVWa93C4uv5m/eQ2J8DNZ1AEojvbsgIdS9eOr9pZHmcjGK1B2IkvjhIjZv6fSA
         c5hhU8tetyLHn/R+/TbvBd/sBREbWpfboY1qS6YlgYwU5jPRxK1TZRF3/qZ+czwJ+Mnr
         IocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1KmOaDFf/dmsb6gAjpxiL6B3fTWjDmaoHrX3Q1Fz82A=;
        b=qlaSg5iI4BKyr3lUicIdTYGdXQtfDYoZbj8+3wx3duMTCoM+y/iXAglSCMvuHLYusP
         fw5/Hv6hKSfQQGCxUKkKHpRvHaAtM0xg3Vzbrgcvajwc/x+1CUsFnSJvkiFCYYVJseA0
         aDRVsOANj65Cz1t5qQuqY6//RVB9zvjdWTC3KuecOrk2zGGp/XHb4MwfllrLi2puQzmO
         nSTbRwkWpIZa/NWsIEeiRJMtm45JTylgKEn6ps2YSYeNEYbdYYRcux0R1fmAXF34yRao
         Bf6dVSe8p000V/cH75lsAj/2B89/62He0SZuElUo5RZmOevQAVuf1XJS7zWn6TDHyFid
         vGbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIBkH1vv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c3-20020adfa703000000b00231bcaa316esor8173568wrd.33.2022.10.19.03.46.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Oct 2022 03:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIBkH1vv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KmOaDFf/dmsb6gAjpxiL6B3fTWjDmaoHrX3Q1Fz82A=;
        b=KIBkH1vvt4GurDej+ub+ZnU+OOwXfBf53vEYd8mMkvajqqgap8Bh4xPsHO8ZG9HAJN
         w1O6xmOxayLlc1hrYVnoJZ7vTTRi2E2LSUd2oJY8ZhSyNaPqbxNP36ACFMXZOMfNQymY
         iKZ4gPUH/mnu/VHgXton0OY+v9sCOLpYgzEDp5XvSapkzTRfOAiLH/UHQLIdJq5eqZMM
         vm3tRboFGSTX0lvHPQQQWz2Pewh2iaS7j4NiN7VFxL7EMzuADIAJtcgMNZj5XdcQ3oJA
         xhE9TZfTONZhddV6+FHl2H8xq8jgvONEDyIh1oZGs/P2uf+HMwQwen9fJ1cA3OWdHIBy
         NKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KmOaDFf/dmsb6gAjpxiL6B3fTWjDmaoHrX3Q1Fz82A=;
        b=kTBTdEqrNgKo0FPwkJZqVOdr9eXJ7RIxQbopLHcI9hrl8cYOyj754xCaSbghOC8QT3
         JQ1SoK2AvU2hUQTfzFzJT7SZOOkUxgcIVIyPkvJA+UjZL97gZ4q5TrBtMZP7rTbjziaC
         udDKGpLPdm4CVWU+diyocZ39FW2skelGiDayYDfx638Ld/c+O08gz7x3qL4EjdS149Vt
         Cl2JrARdG4PnjlzSIlFu6XsIrSyPK7cX7FXXBQ30BfCBQ2pTD/XQEA6T1WNHBoNHLXHM
         p0068Agz+9YmjYXpxMpsOGvCjX/Nph1tPF6/ccZis94fMJNgRxJxu6QaqLe9siukpzsG
         ehYg==
X-Gm-Message-State: ACrzQf2cbT0oxXARRdcT3CIaHQYhkmB79rVBRM+rC6EXOpXySASwDazu
	WubziRghulT5GXr//hgFOGR92wZ5X+mdvfgVCbk=
X-Google-Smtp-Source: AMsMyM7H9YiGYiTvtGy6xrPGHnkETZdC8KG08POy7l+/Sxhon1UmfnULIvjqGhoSAJnIxhR6df0fBA==
X-Received: by 2002:a05:6000:184d:b0:22f:4ef4:47a7 with SMTP id c13-20020a056000184d00b0022f4ef447a7mr4594527wri.563.1666176363000;
        Wed, 19 Oct 2022 03:46:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id o18-20020adfcf12000000b0022a297950cesm13390065wrj.23.2022.10.19.03.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 03:46:02 -0700 (PDT)
Message-ID: <f2652058-dcd8-b2ee-11c7-ed6f5d6774ae@linaro.org>
Date: Wed, 19 Oct 2022 12:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 09/15] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jJ3BsxZ92yML

On 27/9/22 16:14, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - update for new fields
>    - bool asserts
> ---
>   hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
