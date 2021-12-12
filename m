Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3483873lfk;
        Sun, 12 Dec 2021 12:53:15 -0800 (PST)
X-Received: by 2002:a62:1a03:0:b0:494:64b5:3e01 with SMTP id a3-20020a621a03000000b0049464b53e01mr29878947pfa.35.1639342395027;
        Sun, 12 Dec 2021 12:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639342395; cv=none;
        d=google.com; s=arc-20160816;
        b=SUjpTJyJ3JDUep4rdsrgVVDYYm1azFfPSV455win/ZerStEj8eWgiDLoZh6OFguWZK
         kLrZ32wIvq6z02dxfKv6szMalrPEUBSW7k8pa/69MnM06DgeZYZURl29xVKVufETtaN1
         Wl2qOlYPPEzHDcB/wpB6APjRXTHQ8eeyp9xHEraDIsvoWPGQ1gp4zlGeNf9z0skluleP
         8ztdL1PGwk5/GBbyX66knuT5TMBf5BT/3g7b83mg9II2Lk7Ctcd1hAKP2OpcmQXR1QcF
         REpOV33TOa3GRXxVJITcl1ldik7n0WaYNtlnzK0pDRNIeTQKTtpSSHakI0DiBxR3Ln06
         j4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FXHrD3OSbgYnhX1kzZQAWrHc67U/uVLQ/VR7pMSBCzs=;
        b=BFD3Kl0vvvCbzDSEap9qS/Ob1rx4ek3p6s4qo3liMdg65s49qf0V7cnKfrC0HHAdqt
         BU0MAQlmkIdfUwMtH6tiRkC1KHaet+kbkYdy2qGjZbXJtwtd96y+kzEfHv2PzNotPeuv
         dAZwun/sNYdsZRydTDWSz4pDqbA7Sc589QpzfWzh181uNYRCF6PPgY/HTuGY4DWdSW5G
         nZD3IgHZfGBLQOEFua9pz60fkkE12BBpM1qvEsONm6GtOT33Tic/16cwT8v2PrU75W5D
         /XbMcuPQEZqdorooF62DTGaRhOMRyjf2uOsfw76fj2RkIPpGyFJxfoj8QH4l0PNOq6Yx
         Jiug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UABc/i9V";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s7sor4239286pga.34.2021.12.12.12.53.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UABc/i9V";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FXHrD3OSbgYnhX1kzZQAWrHc67U/uVLQ/VR7pMSBCzs=;
        b=UABc/i9Vi8AV77ESBl+GnM7PQFBwPf4PthQ5+mWCn7M8v5x57HFw2mhY/D11pFcm9V
         EteLWvik9L8SeRf4xuIXjGI+T09AXIEc7lIa18+Ccw/QqJmWq0mZBzAi5plsn1WIRA8Z
         ur/j8N7UfeNAX4qKVmQY8VnQY10WH6gf1TGnpU5SacN83/UcwKcAX398/H0bPLNzECIX
         /cqzRoIVGT8PTBZ93+l01GMDhKKac3tKlCFpP8LMpcTshu/Gl01tbi7ziw/up+2lhLdx
         aWQK71M8vU63VF0ZwbUAPE7iypmDFEhtwdpwozZVNHhKtqaTy1+3mBmdfIKkeYGpqnkR
         k/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FXHrD3OSbgYnhX1kzZQAWrHc67U/uVLQ/VR7pMSBCzs=;
        b=0NKvKErWfjOkJkKsBs8w5ZGlyvhhDJGQxUenir9eT2dj2eleUEbScu7vF7VxGxx2S5
         aPFF7CZMIyY+3oMWMfYF3RWlG/8FvUejPUcnjSGgINhhJtuArFVTZrKlIkr3dlA6YZRA
         LyeKJgL07XdF+U+VABJ3SsDPBGDs2BHEOl+CvIvIKuipHlVWewopJWX8Sx8Jn8NXByEl
         Z94CZele+bzuO6dUw/we78yA4uEDno8IlnEOpYDItyZ2xD9Z3LiIlXNR1HF3Z4AI8Jfn
         uA7g8BY3L+nHEWiQVlNywrWjSD+coV8JWCxJXkiGk5DpGR4bSwmmXmgT0yO6exvvC1od
         mLwQ==
X-Gm-Message-State: AOAM5309SvZq2J7L8HbVlWTOCPxFPc9p7QGKbpOiZpw/2f6kYlzd1Cwj
	HKj4rrxUD80+5CZfX+lFbioTtHhDyv/DFYfI
X-Google-Smtp-Source: ABdhPJy1vPxYdEpAD3d+Lb4DaEjQqdsI086UVEirsTQCUl9NQlDSxuDARcwHWoYnRTXE/YLtCEX1Fw==
X-Received: by 2002:a63:1547:: with SMTP id 7mr14104031pgv.488.1639342394630;
        Sun, 12 Dec 2021 12:53:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id k2sm10654075pfc.53.2021.12.12.12.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:53:14 -0800 (PST)
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b4e04fb-3e4b-9153-456e-0e7b4b5c8c17@linaro.org>
Date: Sun, 12 Dec 2021 12:53:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: rBBunSIX5KYV

On 12/11/21 11:11 AM, Peter Maydell wrote:
> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
