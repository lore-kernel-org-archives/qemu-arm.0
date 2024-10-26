Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp252484njf;
        Fri, 25 Oct 2024 21:32:37 -0700 (PDT)
X-Received: by 2002:a17:902:cccd:b0:20c:9ec9:9a77 with SMTP id d9443c01a7336-210c6c3ec85mr19533425ad.37.1729917156793;
        Fri, 25 Oct 2024 21:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917156; cv=none;
        d=google.com; s=arc-20240605;
        b=WpWoo5bhVRp4844T4eC+/XrW5sQ0ikbJ+ZXNf1M4o5dFzB864NDIJErfIxEP/z++GD
         A6qdHU8Ds4oY/mYGqd5bHoyc5YGs44mI4XRIe6n9fX7Ox2tw++jMzO1Jx0iFrMbiA7ad
         hDgbtaOpACp7UEZV7tzhwI312a/7l6pnUKG5JlrmtYAr0CVCGQGEGLO7tTXIhCm5VuaX
         u5fqHPmCvV5cnUC1bxoWIZj3IssvQf9AxuFNVm7gWgboEfRl4vkymWC91a5ViR96D/LD
         9etnpShN/CKLni/+jBNNFm5sdy9quM1hQ3jq78G6zkKw0cX2cAg87jtrc50QoWH2o6Vp
         NFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2xY5NFCSqNOVgI2joiK27KmS99wVtlCnPM+PxE8Ic9A=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=VVlF5PUT9BPPH0l0OHNmm0+glcNRemLR48xAMgAqFZfTRuYscqtcgWbsEV2ymx/IPc
         zDV/I4uLFY209czA7Z8ga67zskhl2ggSgOA/dw/VFlh+SIwLHuY1SHHWdAZbLmgdnL26
         FnmIU9J30FqZ3nfNxmn/GjekSHdhMU0fErfT/7RmCERTaZoXresAgfoDIllNXFroXQn2
         PsFxnKmyxgRcrHjsI9lLlTxr39HtnJ5v0msq1/mWyTiRLisyKEbLKvlv0t+r6I2XTwDe
         Gw6xMwmz0w7SYxrdBcE14pPBt504vOLTg8Pt+NECaH2ySef4ipqQol2v4B1wZU61p+xr
         EaOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzMpxaW0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bc06f0d1sor13641535ad.19.2024.10.25.21.32.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzMpxaW0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917156; x=1730521956; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xY5NFCSqNOVgI2joiK27KmS99wVtlCnPM+PxE8Ic9A=;
        b=SzMpxaW0E9WQLSuEGt13gA/YJJhQuDTKEBXDrCogHl9SBIVbXpwQhYK2hPcXi1bcLH
         sG+1kXTgsPMfOjqbmxVNzllhLLK1wuQNfzJExOIGsKzjzcW/KQiTO5a1suEDb/4gkZWx
         bxaiVIYV6kfDCOwh9WVLKDZX0D5uWb4vpwLkpiRUy1pLjgG8YipHFZEBZ58Z9Zb092tq
         Xat5okLOiklqW0+dbgHG3h9V918K2cz8FY34aHyRArdk8R8PQArYmvOdlbcXUORTLVdm
         lJF6+HFOzdotz0CBu1z1+edUlQ3il+jTahwxiPHApmXaaAba2ZXPxuIIg/N5skH+BTZ9
         gCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917156; x=1730521956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xY5NFCSqNOVgI2joiK27KmS99wVtlCnPM+PxE8Ic9A=;
        b=hpVNFGcy1ojiRDcogABL7qcrZWxnkME3120KamrAvhbapJ7HCMNbMajb3p8KbSdsYz
         XprOhjn3i6M6SElNI1xUnwzFJkf//ZUwCm5TLTaiLVax+zX9s+R93T84YfmLtRLIBEYQ
         cR8DljQSX7zi/zPNRLudQTRREkvicwGEJCR9Xq3lrjQcsZ5pmLzcxBfJ9ZLTnDnTxQio
         19ilTpZh1x2kZaDgybQg+kTrrQ9Po0S7EIytmvv0Ir9G/Gkd2Bpkeg6E2FEEIjnH2jsM
         Z98fvEhQJOM5Lsb1zXviEd/loZAU1BgQP8GnpVz1f+/lMsGJ7oqBQyiCe+vH+hUFNhCg
         7I7A==
X-Gm-Message-State: AOJu0YxZh0cteQBBL7s7cvWq2ZUCP+4Hhpa/3J/1PB14u1esi9jab8q7
	xMkeg9J1FTnZE5nmb/3FlgPI44R28/Ba3P72TjYiHqVp1oWfCm3iPhXqhDEuwGCbCg==
X-Google-Smtp-Source: AGHT+IFJ8TBIq1vw2ZrDWZ66H+dIj/BiCfj7ifKHaOguXKsUTHM2GUCjEft7XwWKwwgXSFj43vaeag==
X-Received: by 2002:a17:902:cccd:b0:20c:9ec9:9a77 with SMTP id d9443c01a7336-210c6c3ec85mr19533225ad.37.1729917156310;
        Fri, 25 Oct 2024 21:32:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf445d5sm17221225ad.42.2024.10.25.21.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:32:35 -0700 (PDT)
Message-ID: <3bc58d20-a874-44e8-9f09-3a0fb54a46cb@linaro.org>
Date: Sat, 26 Oct 2024 01:32:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] target/sparc: Move cpu_put_fsr(env, 0) call to
 reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-12-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1ZQwvamZHCuF

On 25/10/24 11:12, Peter Maydell wrote:
> Currently we call cpu_put_fsr(0) in sparc_cpu_realizefn(), which
> initializes various fields in the CPU struct:
>   * fsr_cexc_ftt
>   * fcc[]
>   * fsr_qne
>   * fsr
> It also sets the rounding mode in env->fp_status.
> 
> This is largely pointless, because when we later reset the CPU
> this will zero out all the fields up until the "end_reset_fields"
> label, which includes all of these (but not fp_status!)
> 
> Move the cpu_put_fsr(env, 0) call to reset, because that expresses
> the logical requirement: we want to reset FSR to 0 on every reset.
> This isn't a behaviour change because the fields are all zero anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/sparc/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
