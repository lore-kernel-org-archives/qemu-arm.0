Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1636860lfa;
        Fri, 4 Jun 2021 18:34:54 -0700 (PDT)
X-Received: by 2002:a17:90a:5911:: with SMTP id k17mr7641058pji.29.1622856894519;
        Fri, 04 Jun 2021 18:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622856894; cv=none;
        d=google.com; s=arc-20160816;
        b=lYI9RMTm2UcjOiNmYwIvzvNfMDH9WazWuPvwsKU3nZrEAYLdT4bAnJkt/n0dk8SbpY
         PZL+xsJ2QLfnKV6OOP0/V/UToHxzBE6Z4PJ5dOHEPRdovJYJBfJcxkN/W5TDYH6Jo6O8
         iyRP2JH2nkCSUNQEy+Xx5O0k60ZU1118vi/pAU0bCCXBiQxsjaDW/k3bLxXBirkdAje6
         3xW/EnB6tuBUqiwHgJwxdX8+3DhxIf+JA4G3Cbkib5W2BTSzu3nH+GNUa/ocgwvlOHTs
         Bkh9Nn9434lBUgLQTwOEGKwHvo6hLTpK92NbYrIMj/icEA0pvLOK/cR9tkV03Qv+Eq7b
         wAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OU50V3pTHSUQcQ9LG58F9/C5JTGxP15zI5nz4AAJpGU=;
        b=BzZD60x5jEq/8lpKNe2dcgLiKv+jhLc503C2mHoINZMAvybhb1wbaSYBtG0s1YQXns
         v/RSI7Z6NB9eRRTkodZue1t4+1aR1TuFozUM4bilwm9HpY3LKxfnGfcVvbRnVSDi/8gC
         Kwxlks60fW+XaSFBCAoo8RMSawPKl8CeGStxT5lHEPGELFkqmPJ430G+/LMEtbfnVUKW
         eLIKrW/wZStUBA+A5UmCYFSPqrhXb4U1Ea0oreYyg7wTSP+Ah7nY+2YX8zkdf/d1IfCP
         gA5CDxvWmhJFKQwRURLcbTA0bPaE5pOQTbG+JKpKtPiXY2p5d8EVZuCYh1iMtoK0wsKt
         fJpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccqEWlA8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h11sor2040345pfc.5.2021.06.04.18.34.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 18:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccqEWlA8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OU50V3pTHSUQcQ9LG58F9/C5JTGxP15zI5nz4AAJpGU=;
        b=ccqEWlA8XgqWY4GMRNGDlnfLc2lGFKlz4sr3Cz1+JFyBLbLjH0gsIWlvB+c8ILqDsX
         GrsdQEdLJ0FCjhxfi+gsdGquOmbGMy0RA88T9E/XYsYWdNoWcnDoFGvHFq+OM1KIvy7d
         OkBTHhcLcIur68SyqXGIxzHPKUKiW7KThJbhzvyHWTp3ynPbbRDA+5tBruX5dbya++fc
         oE6UAKesZ9K/lblQ80Lq+/Pnyv3YyKrovCtk7+Y1stRnJy2KP1LVDhPCx14mRw2aSZ35
         fUvkbJr5I0gB8ROU2FLwTiw17GoGJS9aFX7jrR3Q74L7LOpV6CyYKpbE4SCR/dWS+uux
         wWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OU50V3pTHSUQcQ9LG58F9/C5JTGxP15zI5nz4AAJpGU=;
        b=aUmH6Ui9yD1nuBFhVPvYPh7gDzY4TB4yQJDSeVIAHx26WVkHB7nDddn65po66GHQbQ
         a57QPE8cUK6Lz97cRS376Z+O8jPwNVvI3Y7GCTDOJEchDcT5ok/FyxNfSodG/qbRU5oM
         F0IzP1iY+1X0S9BqZmRINmXmZzty8TU9DJMYuHAxUV5ceEnsY5+Zn6pdsbw/6E8QvZNQ
         ea8IlGl/5cyIGAUsPmqlMm6rSLQkE8rz3YM3mD6JACdYDis+3k3s+xjquAzpZb44Evwm
         c89YOTJwR6GXQLQ2Li0tCqfDEoCyL0iaCbMBMjBx0YkzpCTyf+/PuT3weY2WwS0fOtwe
         na6g==
X-Gm-Message-State: AOAM5301x1e6ujonAFZ6EDilTeAj4xHxe/7c27/KtSLRFPUAmnlfivSs
	wD9r9CeZgOw7nbXpLq48xV0Ku8k/
X-Google-Smtp-Source: ABdhPJzCjPmWMU3XOHwvQ7XFp8nzDK57fF8iy7tMTzf9an3BavjVq/36egk4d6m+waoAW1q2ZTjx7Q==
X-Received: by 2002:a62:2987:0:b029:2de:b564:648d with SMTP id p129-20020a6229870000b02902deb564648dmr7141673pfp.48.1622856893783;
        Fri, 04 Jun 2021 18:34:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id q23sm3049827pgj.61.2021.06.04.18.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 18:34:53 -0700 (PDT)
Subject: Re: [PATCH v16 49/99] target/arm: make further preparation for the
 exception code to move
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-50-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e55bccdf-8e31-e051-2382-5a1ce3a32cbd@linaro.org>
Date: Fri, 4 Jun 2021 18:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-50-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: KFCYJcBpGXq9

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> the exception code in tcg/ needs some adjustment before being exposed
> to KVM-only builds. We need to call arm_rebuild_hflags only when
> TCG is enabled, or we will error out.
> 
> The direct call to helper_rebuild_hflags_a64(env, new_el) will not
> be possible when extracting out to common code,
> it seems safe to replace it with a call to arm_rebuild_hflags, since
> the write to pstate is already done.
> 
> Also, some CONFIG_TCG needs to be extended further, so that all
> the tcg-only code is marked as such.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/helper.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
