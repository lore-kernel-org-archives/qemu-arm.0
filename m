Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1587929lfk;
        Wed, 2 Feb 2022 20:10:04 -0800 (PST)
X-Received: by 2002:a17:902:e891:: with SMTP id w17mr33229056plg.33.1643861403892;
        Wed, 02 Feb 2022 20:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643861403; cv=none;
        d=google.com; s=arc-20160816;
        b=LcNaLjwLmx/4mSl8kcMAgFjgusQcint1CuFxLa9lNeQGrdHTkwW6JO3N7ycYDB6z3U
         uZImhPc/CiZEKpQHi5lTC/3YvUHCtRUrB7j+bM3V4oDtowQOUFOuLO3w7D45bgVTh1jV
         Y+xIYDjFJmb/4SXORAPkccF1+z7e2rkCIzRET+hmwyUqFrZTiMBs+dnfhEDdDqgHSjwP
         pJGoBvNcwm/EGu0wgCJJ12MBOAHIsHo/GL1pD4JHch1KkGf8GSukac1t8brSZ/2RWmRR
         8B77FjMqrF9IbjHfwB69e4DCTfd+EteWVcBPaQ6RjwylYISoGN/269yjnsYgc/keKvqG
         CX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rI6yvGjpYrIBV2NV/qzdImFGC/UMQWIzgQnwJw27qLs=;
        b=X4xofl3NKLnK/Ykvf8xuxFnIEYD5AsF39Mot9JKYmwswVA7b9UYu4b9DDFTEQX2lxs
         ndEZ2lcU41IuJ7KyWPxAv2QthAcesoQqz7zon3X6AvNsk1Wtc1QsLjSezI9QoamJtEGO
         99VLfupjZOrKbosU6Tn9oDFCqDxP4OfxnsWd/fhD5njKduC+BPNcBy+sCMrUzJQB238q
         fvJLHvqyC0yEHUcc7dMuTzuqS464TGyZt2c3NZcvCjj55L2Ks228ai4JORWeY8zDk8ng
         z00kHG/iHAbAcW4Bk1R9/VtH1ema3HkhEn5L0I9aWHoNuANV5+0uK4sHZ01w0ldJcwCd
         wnlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHx5LoDt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m16sor9408533plx.29.2022.02.02.20.10.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:10:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHx5LoDt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rI6yvGjpYrIBV2NV/qzdImFGC/UMQWIzgQnwJw27qLs=;
        b=uHx5LoDt+2wYkWRCRdDUNCbdRzEQGYGEDAZZSv80aWiQbzxVypqaNPJMCFzHCeQbaT
         X/N5Gk4TK5ibvwmeFn28S6/Qb7bZdFMvCLqkDTNOOZa3WtVs74z1xRaSB3+BQqOjPfUb
         Ip+8vwKA8PhmYDFi27E4SAmWpz5vd6JRBhflmCJ6rU4dFIZjv/YNSOjLYY2b+bq2et/K
         F8PLGCymTYOKlsDgQD/xpvJ2KXo5jbRdLly5hA0TQXl09+B/RngQRTOUjswlHe3ClY4C
         uL688FkpcJTaApkIG9nbcUpESuF+DPZxvmmODOLbQzH6PiVqbCRfJ3ZvrwaPgC/N2JXb
         BmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rI6yvGjpYrIBV2NV/qzdImFGC/UMQWIzgQnwJw27qLs=;
        b=iBa8otLyDDQs0uZUKaN5yLJNlWb7v4gZGZmnoOmz3y+LYfNGdF4tei1VacnhOtmnUj
         7eUmYu6a7/5ZB+wjP51Lj8N0iu0mmmCW/a9k1p1bTSKnWTuiSAqPiTHY51ZLzrXSebdN
         T3kS31YuPWdHesO7THbmMMMY09P+CpSXCiOGuv4t7Wp+o2isbeY+wv+JFA9gJlXXMcxZ
         CL96ZaHRmoFac2HpxT3P327S/FJbI0erSLA8zRcjHmay6q4aA4BxOv64mUVh5aBIrhXU
         oLg51C4MCxsrg2fgpW9BIqEUhd1Sjs+aQWuJu5hao1v3NgGyEBTeRTzg52GhcFZTXzZ8
         Bq8g==
X-Gm-Message-State: AOAM533k0Auf+LRMWeovyZADUaN44nYvpa9NmntwWQAdH9j8jqhzrXOj
	Xq+rfix7bc0YcMSnudW0uG4ki/NC
X-Google-Smtp-Source: ABdhPJz81keYV3Vdr7GTo8/kmo9CGDz8vEpxalW+8V56L8xYA2aJcrru5TVZefT8W7/jCj9wV3ofdw==
X-Received: by 2002:a17:902:dac9:: with SMTP id q9mr34119845plx.5.1643861403442;
        Wed, 02 Feb 2022 20:10:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id oj5sm8610448pjb.53.2022.02.02.20.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:10:02 -0800 (PST)
Message-ID: <2f7134c8-568c-6b66-394f-6535c443de56@linaro.org>
Date: Thu, 3 Feb 2022 15:09:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/13] hw/intc/arm_gicv3_its: Make update_ite() use
 ITEntry
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: eqe8asnSSwWE

On 2/2/22 06:32, Peter Maydell wrote:
> Make the update_ite() struct use the new ITEntry struct, so that
> callers don't need to assemble the in-memory ITE data themselves, and
> only get_ite() and update_ite() need to care about that in-memory
> layout.  We can then drop the no-longer-used IteEntry struct
> definition.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 62 +++++++++++++++++++++--------------------
>   1 file changed, 32 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
