Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3492070lfk;
        Sun, 12 Dec 2021 13:06:48 -0800 (PST)
X-Received: by 2002:aa7:918c:0:b0:494:6b49:cbfa with SMTP id x12-20020aa7918c000000b004946b49cbfamr30378745pfa.72.1639343207983;
        Sun, 12 Dec 2021 13:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639343207; cv=none;
        d=google.com; s=arc-20160816;
        b=0oWxBLKagaSc/0Au/gS0d/vCcgv7Ww3vWQrUeW/bVC7KgvBIj/ofAW3xvXSW6tEXbm
         lm53rGO28DsyiDRv8yMkUb7oYZqFKgPWIYF09dNsDpWiqFmIuq6+IYsKZUJoN/Ub0Y/5
         KoE/RQYrn0PiHcGAsNxRxQsZnKVGVlXyDyA6uISG1tog1McTZBdr0eMdwoyrflmlfMXO
         md/p8xQbevz3yi87FZ+45fb/9MBdBao6cs8uNsYtA9r/dXJqdbTuQu5Jhue2ftIIxTfQ
         s+lVyip2UZg/4MWsfsuu1myeFvwkwDl1Vu1UTNgPXUbK/w15dyctXagVkw/B0aUefWIU
         dIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CZSKqQNdwq+uSDpJj/BsSq8gJLEsiAzCUwHYyqdtFUc=;
        b=EHf8/0lZ49RELZUFrTHp44OoRzwmIINnHDfQcVUeNM3HNoUz24XXJs1prfoap5wChE
         gW5OZHSa3lm/4weRC73LTRPKifUHqBRkTuVvO3P3sZXcubQC8ZOZkGVWd6BObaKTdE9p
         X/xbdRbtJR+DHUV6AvdPPU//vTVaCdOoMLNT53nc5ZJxXSz2lJk7Qruyd+FhJ+97fDvt
         EdTOJ/8yU7wZAKFjoMJ5DeOdljDbIQYTaX3lKp8Xff83/aMoRozRqf8Bt7YPE8HPRLzK
         u0ELm4NrhfolPnhss323YIWEOUfjdSfOkTQ/9y2dwux0RFx+XeFAvqIgp/uzlvyvTC6D
         ACJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+JsUip3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6sor5538397plo.73.2021.12.12.13.06.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 13:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+JsUip3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CZSKqQNdwq+uSDpJj/BsSq8gJLEsiAzCUwHYyqdtFUc=;
        b=S+JsUip3sPivBbQNhYd4OoU9/WJRB09qkIb0Sa0rgDcdw+jmV9S6uT5XaG2LyKdTxB
         CGPuJQuTSrbsDlGDbfrpBEGmnX7qCZfv0lMr4uZv4ekCJ6TRGlPGsVNDnPUxcHwVVkSr
         FOA3YEjmj/fD9dZXP4CETC3c4x+ABxVFJxOsezAchGSM3nN6ITumsu3VPS16r93X5DyW
         tLwPxvnmgptfq8REFkfkFkHTqYRCroWYx61sub5Ufhy5hpXBj5WLgK56RVIlRkefhe6R
         EtA8/iChK4FsThmBZfsf7WyEYZCV5sENmQE8AWhZpNSqs61jQSLsf1Bf/Vg6jJKsZVSV
         ScuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CZSKqQNdwq+uSDpJj/BsSq8gJLEsiAzCUwHYyqdtFUc=;
        b=XEGxJrIhnSEksONNqDajLfOJe6Fl6SxdQUPvNzuenEy7DOHOzFGeIztQxZIVxLbHsm
         DLm3MlWSerO48tPCCw18sWtZ2qaWMlVRyDC0sVmf2vYH+7IWsEjX8Q/6bood7KfgzJGc
         JDhexfea/QFPYlCYSUawyu2xEznk9bYct5Q/+vaZvV0UevwIZEU1HmumUilIBEg8obRE
         tBQ6VPnFf9diM6AHZIgLJ3aZ99p1gTXEN8+W5QKl9YiMrFOId1uL4pFXyxez7ndrrxvO
         qA/KDZZMM7UBanNzu7HhkYvTl1lPZA0hkfvJImxNnquYnVhTbSIV5IFHhJqMdJhQ+snW
         OBfA==
X-Gm-Message-State: AOAM532cQu+0zoegpZI4cBgI997gjpyz1Eb0/BWGjF810LGI9Qkw2GbV
	KTMs6qj/8ox9OOUE52LFM8/TtKf6+2atmlW/
X-Google-Smtp-Source: ABdhPJxephPRrJbUCMmjA7Epu1n7jnWXrCdm5h/5ld6Yyi55V9EgZfxoxTt6++hqvh6yEXi9WCNEYw==
X-Received: by 2002:a17:902:c105:b0:142:2441:aa24 with SMTP id 5-20020a170902c10500b001422441aa24mr91043380pli.44.1639343207453;
        Sun, 12 Dec 2021 13:06:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id r13sm7426175pga.29.2021.12.12.13.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 13:06:47 -0800 (PST)
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f63f8a8e-f88b-c8ac-3fba-6604fc242d56@linaro.org>
Date: Sun, 12 Dec 2021 13:06:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: hKqVkl3FcFwi

On 12/11/21 11:11 AM, Peter Maydell wrote:
> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
> 
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
> 
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
>   1 file changed, 38 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
