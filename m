Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1233058lff;
        Wed, 8 Jan 2020 12:48:38 -0800 (PST)
X-Received: by 2002:aa7:9218:: with SMTP id 24mr7023776pfo.145.1578516518505;
        Wed, 08 Jan 2020 12:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578516518; cv=none;
        d=google.com; s=arc-20160816;
        b=gNt9bBdwQGK3xddA9XoseZb35f3pkXlNwrMbEAR//Uf5mlUa83NsuTsT7lCziZwqei
         u4QD9azRMwgoXmt42a5Ac4R6v8KfhzwzmGdMU14yRrmcKLVNJ4IxQfprIUem1x/eSWMg
         HuHaJApW5biZbN+gQInTuf6vk79AvKPTt86ZPRHi2Q9SEBHU7JM1wSnAZJwkDmfBnOjl
         by/BnZU3/ayA0V/QjVm5Fvv6WIbK8fYsGJYlPgHu+FPZ0bn/pCO9HDMkhry0hwTi6D1G
         Zaed5unvVS91uJGAxRWYxErWqDagxVDCYV6cQjEDEgikFpbcwfADkOFy5H2WNlcAt6zU
         EdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hW+k2uGtlUYlhpvIMLfCQP9nWDcZgdXgSrRx4bq2qK0=;
        b=Nv+ivixPCXzcgIZM/5nBlZFwMtvAaW2weEyT2UI+s717157s2hfxnsooOv65XZkrOp
         19kKWKbKCbOYJ+FVbdgOgbl8/plLCJn5YGuRvUv4+Aldul2571i0EK5rjAMT31SFvnY6
         sOLJpwF8xAhwRw9VTrRmUYbfX0+vfXZ3JQPWmkGvYWp1ir+TeMrJCKJKw2qGX93RinSA
         RTBXx+V4T5ZXZftAmm6MTpz71qhbUbn9U0q+6gVG5ygwQGGSRawMmIKqBcewGZ8bcuId
         0wMTEuAome+SmcdM1nMsWuPg5+0myswYVxcT5nnwfHim1jmLuOhWS87RvtYRF30aFvk7
         BRTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mCsnMQSq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q21sor4585673pfs.18.2020.01.08.12.48.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Jan 2020 12:48:38 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mCsnMQSq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hW+k2uGtlUYlhpvIMLfCQP9nWDcZgdXgSrRx4bq2qK0=;
        b=mCsnMQSqepoiEqNdxoGpdIt6ARRv7zGEqe1sumOD2Wr0iFEUSeJZY0Hj3c6pLAL27X
         UiMcRCotyCQwMh1KzfhVxYy7X3spLrmC2aP3Nak9xxZ3y3vX6BBoZqKK3BeksJ5RIOuC
         0awkCbLGD9TzPhPdqhTLat/pMR+gK91Dvc14tYAuEi4mk3rSVu/NpCwmkK6sDU835x/G
         FT4xJtT2DqJy5NgdDk7IwCbrDxeJLKbZ8Au0qzK/3MQO9y977f45SfPM4GzkD4wiEm//
         Dp+cQA8yr6C7JZVT7Tnziybo9horD/R5Vk3GmzEFHMupPv1BiSWPv4U3PNl2Ye72Jsi6
         n40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hW+k2uGtlUYlhpvIMLfCQP9nWDcZgdXgSrRx4bq2qK0=;
        b=l5LuDj0m4ScbL7Hnbs0hmbaRxoNBjpoXjgc05dMiszSQDXfX4raSm6KvfluY/Ng8om
         JsLL+luKnqqEGK0YA7dMANdnCc7JmC9iD7Z4d9q+AeXn/V8049hnxxn9VsnV2WWAdYty
         wheWbAbROEJji+5Mtq5GLpn90aNchj8BKhLqYviXzU1ChqhxVIAVX/+za23j4MGZVf06
         FezlLO9LsssOMT/L+aMX2Sg0RWeztyk0VqN4U4MCYs6r91y5GMJhXqLXMJSrw30mxzdA
         IiAsgGNIq6+l+vTkkjthY9oBzHo2nkZt6tDyOitBJQWXECNwQ8LdmbDEGCKuO1MBVN4m
         utYw==
X-Gm-Message-State: APjAAAWpbWGN33o1fp4o7kRZN8SgIeEukB978Zk0Q1aa60WrR52qz7IK
	UsAdfAmXxJ6g8BnkE+OW/lUUOUiMwXohV6ed
X-Google-Smtp-Source: APXvYqxEWaZlYdV5QQ3OD9kyHmlf2K/7F81oBTMHMuehUBBNc7wiUieRwS0zHRj3CLoG0h/T51AHiA==
X-Received: by 2002:aa7:8246:: with SMTP id e6mr7224065pfn.102.1578516517974;
        Wed, 08 Jan 2020 12:48:37 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id m14sm178258pjf.3.2020.01.08.12.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 12:48:37 -0800 (PST)
Subject: Re: [PATCH v3 5/6] tests/tcg: extract __semi_call into a header and
 expand
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 qemu-arm@nongnu.org
References: <20200108150252.6216-1-alex.bennee@linaro.org>
 <20200108150252.6216-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <841fb3d6-2cc3-dd4f-1151-4e83ae43dfc4@linaro.org>
Date: Thu, 9 Jan 2020 07:48:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108150252.6216-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZrLbYFbgWo+h

On 1/9/20 2:02 AM, Alex Bennée wrote:
> There are two types of ARM semicall - lets test them both. Putting the
> logic in a header will make re-using the functions easier later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/semicall.h      | 35 +++++++++++++++++++++++++++++++++++
>  tests/tcg/arm/semihosting.c   | 21 +--------------------
>  tests/tcg/arm/Makefile.target |  9 +++++++++
>  3 files changed, 45 insertions(+), 20 deletions(-)
>  create mode 100644 tests/tcg/arm/semicall.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
