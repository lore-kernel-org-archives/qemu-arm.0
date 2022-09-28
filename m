Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp435581ocs;
        Wed, 28 Sep 2022 10:04:20 -0700 (PDT)
X-Received: by 2002:a17:90a:4588:b0:205:d605:8bcc with SMTP id v8-20020a17090a458800b00205d6058bccmr11411616pjg.205.1664384660774;
        Wed, 28 Sep 2022 10:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664384660; cv=none;
        d=google.com; s=arc-20160816;
        b=x9iwgHTzUAJ2FZhrfISHHP5w8vQhM5sd2qAqSGy5tKsuaPFviqjg3rPf2Be65fWfTV
         fa5vDguD/WOiqeN7Uj5Lba287i/MBamJqNdxgszwjd88HRp64nzoIdIDwayXXMVxNgK2
         /+6WJfRR/Sw9kfL7Yj9Qh/jZUKN8Tbfoo3Nx7TcsZ+ZkqVHOkf5gAj675p0xz/fnHS/K
         veal7Pd/Paf1zeMarUp8X+pFg5vBBODLvTZ7+xhPi5m3HaCVP+YHSL+FVydi8K9LfCPn
         pWVOBT01xX8NwmT8UjFlLCbUzlnRCGXjQxiptTB0a/ePCOS+oZkqDhPmwMAmzAV80+T8
         Glkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h9s1x3zsPX7bVFOgqG0LesvY8nj/+4qwmNSABEm1Tu8=;
        b=UqWPv/soOrCNNr5+cQ6ysGGnpQiRINjZYASyyuX5Q3EZbQSFegOapK63usj0HBAzXK
         tjlkV9T4kmthQ+zsmA2hLbRIlAP0PytivjHhoF1Wj1exihPImpH7u88rH6EUYwhhU9L+
         risYRaniPNuSZCKI8ISTYTge9gWX3tM34IZuB+EPp5j35WrEa/aMokdCh8CXjPlcIkHD
         dkpGbmahJqC4ws9FgRLwoMBO7uh7bQh3jwT1VlLIO3f+EB7/tCTDTH4VoYW4N6rAsIZu
         jViQo6o/Im8vppwjiDSAeE2pSvVaWUrZK4oQiYNNSwaeKC29wkTuc/xN4oQ4x2cy9BxS
         J+VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gEhIn3qQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l24-20020a63da58000000b00429f4f47d57sor2613566pgj.63.2022.09.28.10.04.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 10:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gEhIn3qQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h9s1x3zsPX7bVFOgqG0LesvY8nj/+4qwmNSABEm1Tu8=;
        b=gEhIn3qQtr1s1CZXaQ/cvtb6ZU+n8MyasvqrYFOHGVDr5VezuuoWzCNAHaZ5V9KEQ9
         Uz5eeNoyjfam1sjGiI8mYaNBVXZuksw9SRyWEInD7kDPo+8iFaLq0vBXBtEr6PkVJILx
         Q2DMjvGlZwuH+S5sU5+wTBnnEhHNYA+r2e9qUazHHcrToGXClO8tWTXgfT/Eb0WzMQTq
         u+JDsu/FxwuUsN0vWCsZlRclY/4w7YkSIcdebYbTfUzy6ZC3bs8VeroEpgS3fd41k00m
         rJXZbzY5k720p9R75OopElDP5HmErJxU88x03Ij6NcUDTnsotvk6/kewIKFbny+LRixh
         5mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h9s1x3zsPX7bVFOgqG0LesvY8nj/+4qwmNSABEm1Tu8=;
        b=LISOoRMd0oBRb5Wey1QS1PYmQVpX2pkwFptayEkGJHG3aCzI2047Ds44XNi/CtiWJY
         +Jhh5YM/VE9IP652YCa65wePW28DlWoJnuKk3n5Fs0J64ZIcgAs15QFHd0TvVL9MIfB9
         wFQrg6FsOWb/uQ718RUUR0duVLkUiYZe22TdBawM1QX4eZlfnl6uQML5lptiI181gYSz
         PSv2vAp5qtvLqZNtWXRqILpmPM2p6GhzIFjG+UkHlv5a9qx5fUxrZkr3Hdb6xcGF00+L
         KXPd2Ob2z2NtU1/UE2KbgYma3FKSQ5CbQNic3j3OddQqH44TyeV/XiIubhBLqyZTkNS+
         Fu5g==
X-Gm-Message-State: ACrzQf08qr6h7p+yo/UDlxjqrkgqGeZQvOTXDN0TAp5GvTw8E/52EATi
	f/rwoFXA7StjIcgvKW73SnVKAWTwpF41ifFD
X-Google-Smtp-Source: AMsMyM7vk1bjKEimCo7Xw39PKRcyPCm7fNdOPWv9hrZwcRzL6B9QGRS0nOXr+MLOWfJpkYfpsGY/Qg==
X-Received: by 2002:a65:6cce:0:b0:439:49b5:48b8 with SMTP id g14-20020a656cce000000b0043949b548b8mr30186838pgw.514.1664384660380;
        Wed, 28 Sep 2022 10:04:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id q5-20020a17090a4f8500b001fbb0f0b00fsm1800172pjh.35.2022.09.28.10.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:04:19 -0700 (PDT)
Message-ID: <80f331a5-77ae-6e96-5861-77327ad0662c@linaro.org>
Date: Wed, 28 Sep 2022 10:04:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/15] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UrIzotBoGQlc

On 9/27/22 07:14, Alex Bennée wrote:
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
> 
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index cdfca3000b..34693a2534 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -41,9 +41,10 @@
>    * which is used in both the ARM11MPCore and Cortex-A9MP.
>    */
>   
> -static inline int get_current_cpu(ARMMPTimerState *s)
> +static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
>   {
> -    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
> +    int cpu_id = attrs.requester_id;
> +    g_assert(attrs.requester_type == MTRT_CPU);

I would guess this needs the same non-assert treatment as the gic.


r~
