Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3649975ejx;
        Tue, 15 Nov 2022 06:07:54 -0800 (PST)
X-Received: by 2002:a17:906:1e96:b0:782:fd8e:9298 with SMTP id e22-20020a1709061e9600b00782fd8e9298mr14349860ejj.640.1668521274339;
        Tue, 15 Nov 2022 06:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668521274; cv=none;
        d=google.com; s=arc-20160816;
        b=EJ5p49pjWyfLLREOyD/RZ4xZY71j1F0yHQmQDNd0TPzv6bl79rqcFn+n/ca2I2SjVJ
         bZST89xdxnFv/ZuGmCj6Xb5owZzZ2FuBgledl9iwz4Ds7xnhLUMmWtlpuAACMsM2sXXw
         LH5WAMkqluOAAEDrfRY0DVeYwbRKmTYJHbkfa8GthYRiQBuCHtqKHbYEPH1DKaNADK+6
         hOxoMRITXxolj7OaqhlQoSBTlb6tJ/SrwnpfB1pAOUJKXYxKaixfDSKPhu+OZIxVvEud
         ASB2QzZEDaJkPvYYlJHjkW20YT4pzFQ6gPVblNVyAEM0EfnrhxDhYzkemeTp0Gwd2v+3
         dopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sJnLV3FvNumSx4N5K4rsKrGuRHQJWalwl0PilSi6WTY=;
        b=cB1+kQVMv/2fkTi8bbADdkSIj7sYa15wlNHl1ActBoL+tvVAM0IpI8NfsPVwIMqZHY
         Gd7qoX13oVPkGT61YLL72sN7spk/QoMgzROdulwUqXbLzD0uljXtvABuYW0TwHMuAexq
         3gRFfjRiR9Ee37gNhYhZBHupCkUcACT+Kr65sQeVim8Ona0IjYKr72kLZyv2b1WrPbQO
         DSDLcbAP9f64tFE+3TBuWVwXtIVwNFvCGCFEV5O2rhUR9IGwXbLQZPeqR98K/SLbVvdr
         nNF3MIfdZAzSBgX2mtBRkkj60m84YygGoNAczMTNg10a/Pv2OvvEl6mlYTNGGGS3kMiZ
         fU3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BojG+kqm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bv16-20020a170906b1d000b0073d651d1730sor5573206ejb.119.2022.11.15.06.07.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Nov 2022 06:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BojG+kqm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJnLV3FvNumSx4N5K4rsKrGuRHQJWalwl0PilSi6WTY=;
        b=BojG+kqmZcPKjlW0pRI7se/J9vJveiUsOHUMFBnye3yaY6ZZHjMEhU0T4XjJxr9ztZ
         LadWH+hOig8vDQ8IpnXJFB1tIBa/qnc6MciDrdMi98F9MJt5pxOEnizlyZHOK0QXDy7w
         tAVPapXGgj2Pz1pySYJqpUX7Un/Wfk1v/prG/RgP7aAI6aoc8OfcO8Q32qiNovs8Xm9t
         UfrQ1W+2JVQj2VlI9I4FaFk00KNrk1byYcdJCWzrlaGlExlc6JCBX8YqhEZfKd9F+LIq
         npGVgEHAzZuRM8PJEFxl3/QBNVqJLMvlup5MNQKk/a/4jktMmpQyZbJMnkKq4ERoswHT
         Syjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJnLV3FvNumSx4N5K4rsKrGuRHQJWalwl0PilSi6WTY=;
        b=dyhsxxhDpG9LdTtfyc9fQXMatKp0CxopVUr1YJ4GMHDqheKjARutFGXu9okGIZoxcM
         E9yLe1q18l/NlSYl6aBivCgGKYMKg6DbPTJM0mvR/VFppwUKNmiK+kWkclx4Tyk2m2Ss
         Kr52s1okgW5poRZk2jOEXdbgaFHCsonLhkEgIZBcJ0Mnllz2NC1BQTfQa5qr8zvocNQB
         wRlLB2TBwNJ9HK8l78GMkgnDYn69DD/n0NOpcuoeSFtjhZfxVzqFy7g49EczuGdkEZcu
         Syj4WMHlpCYyFNDSTa3jMBkhLxcgLNSqIxSmbOVtP9EBnLy409I99lxMWGdIjyMtlp5m
         O0Vg==
X-Gm-Message-State: ANoB5pnHgVRqzAs2CMsubHzBd+pAd8D0uI/kxJRawP9a71I7FzYfebHG
	ZXZxKPRp2V38vxnvb+3tWsKYXMvkL/9vCFuK
X-Google-Smtp-Source: AA0mqf6t+Xz50DXBlavFpJRBRZ/feoWT/SIpD+w/Z/n3oJQ1kM3mKck0uhUMVGg4krtGq4gCHpQzCw==
X-Received: by 2002:a17:906:b45:b0:78d:b65a:aabe with SMTP id v5-20020a1709060b4500b0078db65aaabemr14258669ejg.5.1668521273725;
        Tue, 15 Nov 2022 06:07:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402516c00b004589da5e5cesm6205071ede.41.2022.11.15.06.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:07:53 -0800 (PST)
Message-ID: <d5c53f34-d470-461a-2918-dddf313284f7@linaro.org>
Date: Tue, 15 Nov 2022 15:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/2] hw/intc: clean-up access to GIC multi-byte
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
 <20221115134048.2352715-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115134048.2352715-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Y316JDGgTZ6Z

On 15/11/22 14:40, Alex Bennée wrote:
> gic_dist_readb was returning a word value which just happened to work
> as a result of the way we OR the data together. Lets fix it so only
> the explicit byte is returned for each part of GICD_TYPER. I've
> changed the return type to uint8_t although the overflow is only
> detected with an explicit -Wconversion.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
