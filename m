Received: by 10.28.71.27 with SMTP id u27csp1221858wma;
        Fri, 9 Feb 2018 10:00:07 -0800 (PST)
X-Received: by 10.36.246.70 with SMTP id u67mr4339229ith.29.1518199207711;
        Fri, 09 Feb 2018 10:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518199207; cv=none;
        d=google.com; s=arc-20160816;
        b=wV8Pu1GKZF5fPD67KZd+7HePmNl/1BAj5CnRiukF/cd6Lr5zLN6V1lupmGF1ou1c9o
         27e5oDLlLlRbZT7Z34LjY4+4QtC4I0FrcUuc9KRb6/MgfdBflL86jZB2JvTQhqznAxsN
         WKC03j7G9a0Q+wB8NjN1By1KUvsR7eN6DMT3PAaypGrzcX4fCFEOadYZAFHpbe8DSYd7
         3/Joh/L0KvW4KK0sv6ORI6K/+8vjCpG0ZJAPPf4Y+DCsb6A/o+5MDpRcdAYuy4PhsSN8
         AxX9n1LHoNsWZbrMnWVPDQ88ueeF9xQv+G9eMVYqi017SeLZBGk+znu9RzGwUvRys2wp
         PpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=4og7lHENPz7Mhta9b2d3DLRMAhzfYj6dGkfWAxQx3xE=;
        b=iRb+kfheItuhWTax5nXt1NwPkZN8dkyt3eQLtopO0q/iYvCeK7ZzfF3AIrF012jdj7
         pBXZ2efHR223f3WEu1SnGyXs+HDHIA1g9WhjFc9tF4raDD3hyDaiGMItMtPPFh7lHLL6
         yeXORq9vOL9IQWNwLiVBzDqe+Vt2p/Lp/fEO1JUiW84OkDV3Njt6S6sqUJzlmUZjFRZ1
         mLld3mnqulWsXjDK3XI5tgnpx7li/mkGZvQSvRCdEMJjLRSNK4ISopigcRqoLJKj2Wna
         bPch7oxNXdzTnJLegv7jYyQG/yVtbkRVNo9k9McVYEeMunBo6kdQPx1t+Xs4jw7V60Ny
         8Vqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KxtE/+IC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j73sor1716084ioi.23.2018.02.09.10.00.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KxtE/+IC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4og7lHENPz7Mhta9b2d3DLRMAhzfYj6dGkfWAxQx3xE=;
        b=KxtE/+ICcb85l8dQtXkxr0FWOjL5+KkpAbRxF+A3Gy/NKuYtCCu1e/wNJHCp9GIF+Y
         MQa1EEZ/vNo+AT3tzEBeA/45F7xpBG9mnnOMk6U/ASD7yIUA2jrHEnd1cJIu05uh3xI9
         xtCmWzYKrfk1mwWcuVylASW3UDb1eU8jMSofk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4og7lHENPz7Mhta9b2d3DLRMAhzfYj6dGkfWAxQx3xE=;
        b=UKfpIXeoLl6WpGcEAWYbu1uu1SKGQV4Mi6FRuffffUiXQ7XEVMy0juHnYDUQSC769g
         gqFItAT/jBujI4L8V7WKoBq0o/1StaM0y5DZ0tK0908CoOt/6VzC2GeUUXHvAxFje6Hq
         Wxxbl3M2stcshpzlLcTR/VegObYIcvLY05KfpJfmx0oFmcZJHdlNXvzik/fxycwsx58m
         I2exkHNCz9sdqBn/724n66txtORtuknvA+OXYF+xxcgEeVXB+b67CdbZiFDsJpTI9Ise
         NLLiuGETXuFHEhHlHaiSU5a+TsNBQo44Tl3T7M+JG0xg/rXlWCWn6LDzZP22ZUZ3YvpL
         iwVQ==
X-Gm-Message-State: APf1xPBlnzZd3M4sxRpUtZB9FKyF4CiqmZVa2mf7cEOD7YhfUO9aj9AR
	QTxz/7j+QB+pAuUSz7zhvZ+8KLdB
X-Google-Smtp-Source: AH8x224qh+WKj6sITuyE7ZonL6F0U/lZxQ0cHHnWt5kK2AyUL+tLA+4dvVUW9sqpuRqxjogTnbWeng==
X-Received: by 10.107.189.196 with SMTP id n187mr3839986iof.47.1518199207230;
        Fri, 09 Feb 2018 10:00:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id r2sm3930420ioi.86.2018.02.09.10.00.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:00:06 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 25/32] arm/translate-a64: add FP16 FRCPX
 to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-26-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e177fb2d-36d7-a835-2c1f-59e90a708e80@linaro.org>
Date: Fri, 9 Feb 2018 10:00:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WT3y14RbWQ5G

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> We go with the localised helper.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper-a64.c    | 29 +++++++++++++++++++++++++++++
>  target/arm/helper-a64.h    |  1 +
>  target/arm/translate-a64.c |  4 ++++
>  3 files changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
