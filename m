Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3362091lfk;
        Sun, 12 Dec 2021 09:34:26 -0800 (PST)
X-Received: by 2002:a05:6a00:1a53:b0:4b1:7ab:9b5 with SMTP id h19-20020a056a001a5300b004b107ab09b5mr17551149pfv.29.1639330466653;
        Sun, 12 Dec 2021 09:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639330466; cv=none;
        d=google.com; s=arc-20160816;
        b=L0daPdcLZQeF7ey3XAS+5BKmE/Ota9SVDqms++zuMsnZWnX7KM2Kn78zl0rf+/l8ve
         JcXSZcYANBCVr8muUQmzh3GctHnz/+9HTPDRg34H8GK/Wk3QLvhQuJMAJM4Ds6kvSXwY
         lpO/ajgYqq1aveLZL5JNXkV9I8lCMGR2dtGoTuoxcU3ailXba//NjvsIRdL63i1e+KuS
         j8C46SMulH9XOlKzMLRyHvcU1n3E1jpLUu2GMFeZvArOQiXHjq+BzJVcGloxwfscPWXS
         kxQImcf8GJXA05Sny6yf7pN8m/zci/nmhRSO7MMBgrOMtLcB4Tdt8EEPwz9zAm0faXCj
         /rGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2q3FOjs3OFD29z+I+RnET3LJqbFDCsg8vnKqytoBMz4=;
        b=e0tYDqdcneOookN4ewddTOoZgkiBOn9cwRbVSTpsz47J0otNOV9LHlw421Zi6YC80M
         3Lk/ZY5AYYFUZKkdY/LB4U2muOklqZr+KjCUstftG0YEvHOb5whN3ebydpC6oZqDfgx1
         a3PG5gTvMevx+XFNtrOyIOZ9ZUSofRW1IGgpABpHdDI2XNUS0E2sbaFrI1u9Tlyr2H+e
         +mvxkkq0BZBbXnrPeFK+x0zJQys3U4XvR5zZuPuSAi8XBpbwp5glHI7fE7ruoHLQ4XU+
         3suV30HCDMErGST+P7BR2gDKUD0nSrNjhnI/vk+sKvJkXpNbJjyfg5EScmUIhOXi/PDC
         wM7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iblrj4RZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o25sor4058884pgn.9.2021.12.12.09.34.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 09:34:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iblrj4RZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2q3FOjs3OFD29z+I+RnET3LJqbFDCsg8vnKqytoBMz4=;
        b=Iblrj4RZ6oqYoZ8YAS2iRR3hYsRVkFItwb1VSv/eLyLO9+TwOki9QmLgKMKrENebcw
         jKzqIVfkJq1L7Pzw1I8OY+MX1Mm6DVkEPYtDkQoRQ5hnYVNRGPBBN9DGkzjm05bEYtFh
         hQ1koNw9TDfSyb9Fs4RuqKhhLHAam7Hobb9+D1B7GPzjKluIUoHCsKWbpTCjRanBztXE
         QWguSs7pen2BS2IZASw4/u/nrTeZdBlii1/8PP3BX7sso5c3+cTRIAj2+wwIMP5R2q9C
         w2YFBh8rx8fSHJyEWF4qpqJ6dQgRpTqC+pHTUJ3YZaF4RUAoMsRUNyoePsiIPVtGWz0E
         8gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2q3FOjs3OFD29z+I+RnET3LJqbFDCsg8vnKqytoBMz4=;
        b=cgILv3ii9STkDi2zh18Dt4K46g7nhr75Ei3+s1xjWjQEEKIAzSk7RVAEVamSy6Fqsv
         6OHoPFno8fZcC8/bLGXkIooWN0fU51jv/rUO5YqqvfC6R8tUOq3hBg8IuuJELp36pBf/
         6RZwXUAr9W7w46Rdvhvob/ZJ93wSVOqfjpcHLVtlMLfbIf74yJhtdumyUYOMBjDEZDST
         RHkq++P57ffdxtZWBoPxa84bGEks0VfC4+Qj4qbe+ViWC2yLGGnODwQF8qdi842jmhr5
         /K202lybdAS6PD2vIO0Qt6TPw9i0XoVJ2o2X4t8+l5FozVDnRPM1xDEFgMgexuwMuXHJ
         54pw==
X-Gm-Message-State: AOAM531qnVkGmyN95eIVm11aVOZHNidjGtkSG3qBbi5pHC3q1SQl5aOm
	0PACmH1cQ8BjujmWSu/bPwjU3eYB2xu6JuVp
X-Google-Smtp-Source: ABdhPJyOHJmmiuwXn0FtJscrY9f58sRAUvg/dyIXfJbRhtA2RM+yUjpac40DjLHR7wZfT4wPycVIqQ==
X-Received: by 2002:a65:464a:: with SMTP id k10mr42759173pgr.199.1639330466210;
        Sun, 12 Dec 2021 09:34:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id 12sm4578513pjn.16.2021.12.12.09.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:34:25 -0800 (PST)
Subject: Re: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee046585-e571-a466-428b-91e2344c95ee@linaro.org>
Date: Sun, 12 Dec 2021 09:34:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: rQOOCxALv+ne

On 12/11/21 11:11 AM, Peter Maydell wrote:
> We currently define a bitmask for the GITS_CTLR ENABLED bit in
> two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
> R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
> everywhere and remove the redundant ITS_CTLR_ENABLED define.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  2 --
>   hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
>   2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
