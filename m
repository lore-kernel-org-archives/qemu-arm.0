Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp72778lfk;
        Thu, 27 Jan 2022 19:32:01 -0800 (PST)
X-Received: by 2002:a17:90b:3554:: with SMTP id lt20mr7584779pjb.108.1643340720992;
        Thu, 27 Jan 2022 19:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643340720; cv=none;
        d=google.com; s=arc-20160816;
        b=UW1w3uYXpzZypBRKdz6UYHqfVpSJOMCeB5E5Y308xwybBDlP03rypa7izngQBRdV33
         c4OmgxEGAVoW9edHYGr7d4zGayuM2wH1F/FdDI03IfUwIeOVNgJXnWs69bIWLmwFChPO
         NE75e9H+5sGEfYhOoSLD92jyBBHSdLrZICmOcCY2Y4uolhrXYYNI4Llhr75Zb4Wv1G5P
         eWKj1edzGKCZyBE9X51MJNNXHlcHyP71kPSz6qQeDaaTn4y8a7pJZcVoiqFVYHHlbelo
         cm33TBj59ZGWePw/9Ep+C1TQ4gRtlq2l7lqb29axYEfsJCuIBT38T33HxNC1jVJmG3NQ
         TNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FPkNNZeahEEH3UPvcmIleRojm0EA/KN7k/E1JhaM9wg=;
        b=hI8tm5lRm/clsVssn2HtcCwFLiKDwMfkY0p8fGmipJqtLG+SzatgJ19+2HtTI2GGif
         L4cx2d1YRUByIli5GDeQECFlbigur378TmexocZa0FK4y+sTOjiu2zBSPN8Rmy8UObm4
         zTsNvmCf0qT8XErr4WgxCfQKzhPBKxTocV0qcGNVRirVbdKmxT7Y+h4AUuHc3PBmJ/o9
         YB6d5d8oI9IYlZ4cTOxT6RtGhDRe2nVF+nYFjCDVinxlA2tW8oYe/BMLYNLCRAb1Kf5L
         SbFW2eopN+JEhQ5jGOCvqOjfcpjO+JgLp87NODqRTxN2ZUaYeJPbcmPRd7AKQCmVWC3p
         yDZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdTJQKaP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m17sor2002962plx.10.2022.01.27.19.32.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdTJQKaP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FPkNNZeahEEH3UPvcmIleRojm0EA/KN7k/E1JhaM9wg=;
        b=PdTJQKaPzLEy3TNYBKPinwe1XUWaqqpSqWsTil1jlw5HImSaPcIztQBvUOuulLnBL2
         gIqIZGqTqyRPfmCHH2ogiO/bK5hiuOEwMnoN9LS8l3A1e876QcCeIY+6HBYzH7vRkJ0k
         CgnrecQUi9Fx7Q4ILTLbUx49LwevChAuwAB0QQKe7bzHyEcAPCMEK+rg1Vi5+P9CQ8v7
         qWr+Nbh8x6DsWLpHIhb9qEVeAIic4H9/+yhlsxD1Swx27Z6JzIc7dmuxuFpNCZxHkdKM
         aLrBq9v1nreUyGdQglzqu3eVDez4e96HCAq9Aa2Qks+jHw3BGzZF8TPRSWLQnYRF6RoB
         9c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FPkNNZeahEEH3UPvcmIleRojm0EA/KN7k/E1JhaM9wg=;
        b=X5e5KDdpZIS9ikY8Xr9iwblUzrY4YZdeqXC1p+UtJBI08Zc6yH/Bp4ZG3UizVpBYgB
         GW1tXcBtPbI8UOgboZg2TYSTDe4Jy6dvi4D+xw1QvFjzt0l/UlzXCYxTEKZALoM4ptpN
         1DTTLipX7W8/p/SLdMkJX0OdxkaGr0LmWq5Q4JecBToSsYGxHp7h9GDK5E+5rB7BsTOf
         QnfqguFCz/5E3QN4ChdVH0bsq3KNDIO226tFO53vbLawITbBQjhtUBwowziuTbeM3f3R
         ZDzp5e6GECDKiRgkOy0Ad32BlnN6DjrBlbFZSL6B6PKnshUknYch8HekHAL3pLKf3XYs
         +HFQ==
X-Gm-Message-State: AOAM5324mzWcBt26YZudlKYK3YTfC/us2a7QducM0hlpDOiqfGPi8tqJ
	2ejoBYvfFwIFRWVHIZCEkf+0CDQr
X-Google-Smtp-Source: ABdhPJzRAPVK3LwWF+fkuWvS9hMMUFfVt56Pipz6mNc2GofTHqVf4l/yM2VnKnopoLyDg9LqG0JCFg==
X-Received: by 2002:a17:902:b215:: with SMTP id t21mr6842539plr.73.1643340720463;
        Thu, 27 Jan 2022 19:32:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id f2sm7197414pfj.6.2022.01.27.19.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:32:00 -0800 (PST)
Message-ID: <9ee60c84-54b2-4f28-c74a-ae9bba526889@linaro.org>
Date: Fri, 28 Jan 2022 14:31:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/14] hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI
 for unimplemented registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: K3nB6AeqYQkW

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS has a bank of 8 GITS_BASER<n> registers, which allow the
> guest to specify the base address of various data tables.  Each
> register has a read-only type field indicating which table it is for
> and a read-write field where the guest can write in the base address
> (among other things).  We currently allow the guest to write the
> writeable fields for all eight registers, even if the type field is 0
> indicating "Unimplemented".  This means the guest can provoke QEMU
> into asserting by writing an address into one of these unimplemented
> base registers, which bypasses the "if (!value) continue" check in
> extract_table_params() and lets us hit the assertion that the type
> field is one of the permitted table types.
> 
> Prevent the assertion by not allowing the guest to write to the
> unimplemented base registers. This means their value will remain 0
> and extract_table_params() will ignore them.
> 
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
