Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1606797lfa;
        Fri, 4 Jun 2021 17:35:05 -0700 (PDT)
X-Received: by 2002:a17:90a:2ec6:: with SMTP id h6mr19758480pjs.103.1622853305124;
        Fri, 04 Jun 2021 17:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622853305; cv=none;
        d=google.com; s=arc-20160816;
        b=BYsWlgFCT6cDy0G5x9yriwomgqPgrQe5yenIDjFFbtbRsGV3qsZ6MxW5E+M4W9GzqB
         /pIaTnGJ5Bi08cfHzsJpxUlMERQlGk4Sdn3lpYWmz9VwC+OxqfgQJf0Hw5pQya4UDoA+
         TaJe0SaqCeNwOWN20RHtecIww5YSN9Or1OWwIXmILFAkZqOctZcOX6h9YUTTs91S6HSr
         0yEC7TThw6crLNod5ltKSUpciWu6R04hg/AHRz8ns0GzPPAlrRRbwleDmUZAmlLHUWsv
         QvWL7g5AzaNQCl68i4jl70cCM7KW68woDxn1Y8Jnrcewk6mPG6O1twjriYZeaL+QLsF0
         gtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IllVOuVLyWVmnpnbdo342KsYg5PJF8rlhV7X4bGeK7A=;
        b=zF4RFnQHFyz0QGiJ/+nN3btsjCBLOtsCFVBOivY86GB2qawXd6Y3abBWI0hAH61V6o
         dPvUfFtwP3zwceZ1p+g9Lm92jVOV6gySXuYQz1grJYT6HBkiTctZ2w9aNFC+FSygyXdt
         GLAKTqh8sdzKECSYaeN+2uF1Yt4UJuHVfEM1qsPyDdNeW4IoTwiTli5GlD7iDwMYGUSg
         lD/9yz8n6Ot6Fo+DzA1BQ0hhbwGxKvRIvf6Agk6fGGtHLrOm50VGK+iES4svcktsKJgB
         SJQ2b8eI8j/mr+a5kl0ZU3RcfeWRplzj+4bAcKI8n+x5MBKv2yEj7jQ8DVCDdtaj1EN0
         K3vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EPb0vUh3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9sor1964517pgp.77.2021.06.04.17.35.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 17:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EPb0vUh3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IllVOuVLyWVmnpnbdo342KsYg5PJF8rlhV7X4bGeK7A=;
        b=EPb0vUh3xN/Xt+1r/SoRCvAN2NaKEbbDzm+AXbqtcnvhGSrrPCW19kS0wPk+6+Dx4q
         fxUN0M6cuSs457+KUVnb/3bkyozlhcbzTABTvUduatQs4WHWI4DP0vg6IaQKrxt4jioM
         cpwktbbhcAYqvNCST5ifLkoWSDOOtsGdnmM1DOWInTkVcFkWja0+FACwuhalObapHxlE
         +TMZbaOpHuVg45wixB9BNk2fHhIUi0x+3j2O0Uorz8Ra9hj6HXhV+U+lUsehNjcFs7BT
         6n34PxJfYT98awAT8mV3YgNXjpxB7nJ0ol1ZdFSUSAtkN9ifo4IZcN/1qP/gHjT325LL
         VuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IllVOuVLyWVmnpnbdo342KsYg5PJF8rlhV7X4bGeK7A=;
        b=JiXM3pi5RrfGUXV0PPxFlZi4vXqf9ZT4vXwbk7BYJfkLAJEAculk1Y2n6TCz0pNKz9
         ktv/gxW9uZB7Ju9vRipF8y9MdlLFi0lyxymOR2vu1ZBrzIFYdIymz4lmcRbR57WMH1jV
         ZVpYrXzGYAPBZMvlTbxUIoni4Y5sHQJymMLrC8p9ZaD9LBMLRM/5W/uwoII6TMZmoUEA
         gVWxgO0aVbjOLQT30kaejlFEKhxUs+a1lz5No+EbzU1lLVn/v4+nZbSdbF5EhC6yy7Nd
         P8RJPmASUirzb/K4kMtTIIYl+4NQHt+j0lvE2Lk4wRWm0WdhvZRFcQkcTmy7wagKTLCy
         VJMg==
X-Gm-Message-State: AOAM530Vu0fvruSWR3DN+tGpH7serA6Hj4pHGH6W/QQdXDDfI5EJj94a
	msaPd+EFmS7zCyYPi6DWS/Coho5V9LjnYyV2
X-Google-Smtp-Source: ABdhPJzwvfkyVS63Z22ts7nHI6iZPJT1IXln2Ifp7PEuk2XQPmA9mtnDOhnygTl3MBfAofy2UcR+uQ==
X-Received: by 2002:a63:954e:: with SMTP id t14mr7530446pgn.427.1622853304672;
        Fri, 04 Jun 2021 17:35:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id f3sm5362360pjo.3.2021.06.04.17.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 17:35:04 -0700 (PDT)
Subject: Re: [PATCH v16 47/99] target/arm: move fp_exception_el out of TCG
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-48-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74606cc6-22c1-1bbe-dfcd-8919bbe2d0f3@linaro.org>
Date: Fri, 4 Jun 2021 17:35:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-48-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4sn7BikcN8Ak

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 100 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu-user.c   |   5 ++
>   target/arm/tcg/helper.c | 100 ----------------------------------------
>   3 files changed, 105 insertions(+), 100 deletions(-)
> 
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 7cc721fe68..128616d90d 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -410,3 +410,103 @@ int sve_exception_el(CPUARMState *env, int el)
>       }
>       return 0;
>   }
> +
> +/*
> + * Return the exception level to which FP-disabled exceptions should
> + * be taken, or 0 if FP is enabled.
> + */
> +int fp_exception_el(CPUARMState *env, int cur_el)
> +{
> +#ifndef CONFIG_USER_ONLY

This is cpu-sysemu.c, you can remove the ifdefs.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
