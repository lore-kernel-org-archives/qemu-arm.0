Received: by 10.28.71.27 with SMTP id u27csp1226457wma;
        Fri, 23 Feb 2018 16:42:44 -0800 (PST)
X-Received: by 10.99.114.86 with SMTP id c22mr2712392pgn.162.1519432964723;
        Fri, 23 Feb 2018 16:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519432964; cv=none;
        d=google.com; s=arc-20160816;
        b=LL3gnWcXRaNtyWZxw8kPDTaIYhQ/ZrDtaEr4cmAP2SWhxCWHoXvAoAT91/b8wYwFAy
         nC0fhT35VW+2c9dZt4E8eNVMi47bcTkogcrpjz7oX81IfqGCSHdShJtcaoA2rh3qXUnC
         CrlH56mPY4R6Olt4iXgJStOzbeQ1+iwjPvWyWp6PxipTKANx0+w5B87Bmf/wThk+fVSf
         rCmgvyrY4FXLZMTqYkcHreERm5/gDxQu5axld5eyW4/aQjb+mSG5f1+f9h3awA1NeUOR
         wkCt9PIL5Mg/+/NiHHSFDPg/jX6AJdugPIUwIF/YKHusIS5qR6oyYOTS1ij1g7fvKZCs
         YO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=EKFTdfEfJ/osnT6F8Clsb1ci1VIlgOpGH5JMS8FxonI=;
        b=ad0gr0GleDRYysrzcOblc6qa7EliP2bCWfW0kcMOj8iADUOf0qG+Q/ajn522nHetq3
         DxfjpWUTMvm6VU4WLqQ7o+HWx1V1LUPw2NGZdXQKziCz46J+9l7/p0I1k/uzKeoWwrVc
         rvJvN4OYClXyvbwnb7F6OR/GDmrbONtVV0eNh+U2l3PqDw6WS/tWXkFhuaXDaLmsAuPX
         evzXsu5H7hGWk7svMVWA00GMKyxj2CFEyiUsBaR4Q44tweEkawYdQVEFszealIFGYiIC
         D8Jeh9Da/LJmQg5NQZeawY1bfgl7NUObpXsOQUBhFbBj/J4mOhm4S0Atu46Z8yulje7a
         PmJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUIwiItJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b25sor115859pfn.122.2018.02.23.16.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 16:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUIwiItJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EKFTdfEfJ/osnT6F8Clsb1ci1VIlgOpGH5JMS8FxonI=;
        b=VUIwiItJV1jsaUqINtQXYEeneXm45ZM1b75jKkQWpB/F1J5znZat2T8jm3FC+I5RAA
         YYF2KxvLz/CSIQ1u3rboLEfmJbwPeaDbvgbbanJcwW2HHMvO78hFu1BRhJtNWZ7ysIRl
         A+ytp6Oon16XAWR1MDCdxnqpOa1o4GytYchqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EKFTdfEfJ/osnT6F8Clsb1ci1VIlgOpGH5JMS8FxonI=;
        b=KNEGonyozi06+2eEh1fjW0xyOBGwqUg3RYWxuuKYZuZA1NITg6rTN7yOd4Sc5st7ND
         kV+P0qqNWHHDSyj/c+zXu/dCfGXh03o+jo0YJncbj88EbaMhgc80MxF4LAAcl7elu6/4
         ykgYFg03H63qpHYtx3jJWegDbP8qF/klkBkmNpq16FyqhmUqWTtlCbZiN3sqnry/b8T4
         5rwdl88piU3gKF0PZw0Wa5ym+voz/+nMbO+bqwYVCrWLILnCUhqj62XbnOBQ8qySGe8H
         TxeoA5N5Fmc5/Und5vQA/aoK05aC4nrr1NLceL8L/jkTR0avF0FOXtz17Ich+vlgrsJO
         8tUw==
X-Gm-Message-State: APf1xPBwOm3lk5u6vxOW0qQnFtmvM7DbWLptMnqOXUtuTKUCDVURO0zH
	TSJ7hFJdCe579Z8JapCOqKjY//YX
X-Google-Smtp-Source: AH8x224WfYtE+RivO44VP9zRBH/7U0nlUuUoLTFlxgpfbKVmLuSqMsR8Pkdr6JLzyuEQWvyn1ESh2A==
X-Received: by 10.98.228.3 with SMTP id r3mr1866640pfh.77.1519432964192;
        Fri, 23 Feb 2018 16:42:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id j1sm5535904pff.94.2018.02.23.16.42.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 16:42:43 -0800 (PST)
Subject: Re: [PATCH v3 28/31] arm/translate-a64: add FP16 FMOV to simd_mod_imm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
 <20180223153636.29809-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2ed30f0-f5b0-fec1-0889-e1cb0a786b38@linaro.org>
Date: Fri, 23 Feb 2018 16:42:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180223153636.29809-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nLz7fAz/XbwN

On 02/23/2018 07:36 AM, Alex Bennée wrote:
> Only one half-precision instruction has been added to this group.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> v3
>   - use vfp_expand_imm
> ---
>  target/arm/translate-a64.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
