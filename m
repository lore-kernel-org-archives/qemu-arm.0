Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp582256ejb;
        Fri, 7 Apr 2023 16:14:06 -0700 (PDT)
X-Received: by 2002:a17:903:32ce:b0:1a1:dd2a:fe72 with SMTP id i14-20020a17090332ce00b001a1dd2afe72mr5111776plr.23.1680909246323;
        Fri, 07 Apr 2023 16:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680909246; cv=none;
        d=google.com; s=arc-20160816;
        b=dN1CPKRcb2SowH2d8PE5PRzq7RFwQzDy5MmDnhXLkqaa0VHnMnSFMVSKk9PPIqvixB
         Wrw/jSrgbgF27fv9ZFUVJIdsc/NRJTQJm4pNLnasfvOSVYYebTgbEbIjHL6cjv41IuBg
         bE6CIs+09DxA/IxEVOXgXrp4/GpZBwue7AlDsODsaOqziqUFRwFUo9cDufZuW96ZuVN/
         oBy3nbY85j0qOdxOU9srvGY6PyfsdXEK1eZRl2pguLS+qH2ExobRiTU5ZG+qXjYyoRnl
         l2aIZqFOx9AT4UK/jU3QHetCElCX6xC+lJEjYT9rl1Kvlt1rXdW2kuhRVjPiIRGJ36ZV
         7LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
        b=abGs8F+ix8mac0EHEFLd8yrxcpv3o98lJR5zN9y/PNXsm5GPpZsxrS6NILDnZPEUjv
         ZxQuVGJrz5AyaWlMYAHjSsZA4ZFfSxvESfKgnsZMDxpwLg4A7VEXkcyHSYgJI240zBJB
         XPNjgUaJp82/u2QKEk6MMttF/KaFC7yxkD9dJYU2BK3B2UGjAytZ9uR4u/uK1hYX9p7y
         nw8vsrmyxFLSGxxGdQLZK9Dgf3Lw+KW41s9nJzcT2qHS9aw3OxhP+5uZ2vUDvEde8Q5U
         JDvoiGaywGpqE2QnNU/AGmdgOJ6/sAoPRMPpTCjQPgNrypwtZF6n9vn6FY3Sbb4AY40o
         RtUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=con+E+nB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ij16-20020a170902ab5000b001a1d711b6b5sor583627plb.23.2023.04.07.16.14.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 16:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=con+E+nB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
        b=con+E+nBuUuL8bc6aBTNFmZw3A88rUFZYxGTFhDreXq5RHJZKuVoYlJBjJANRic/qc
         d5s0aIniIw0RL+malEGtEBMEHpe94GQp29//JHjND3LOTt2Qz6neACI5ima/6Bs8ADdA
         yo/JWYahYMsh7ErPLucmzyNckoeMuF0c9x1qrf9zMQmx6Bnh5MEN+0uiyAhmVmsWPJFI
         pWVaQ9k2ZnUgguA6EPAKVUUEzJY96hKZT4/VabPIIz8klAbW+JC3mY3jjRBuLk3fSGy5
         mfIp7D/2faI4Ti1BgkVfeheIv0888nglBVVCpOLVsdTkwhfsjv/mG9K919FmrAqv8UV4
         NPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
        b=RsL9SUzc/vhY4PzEojSNFUn3nSrT2ZyBHFQWP8tWUPg00Xlj/v8e+f85qMvAnpxtkH
         mozhCvnaBr41eTaJhxoEUc2C4lU19+wil1ON940TsUrWU3xwfSBJHeK7D7fsAFgTBUJU
         fAWMIyM3mKt8Kc1Ee5m8X+SbhHVd5beeVgsptWhp/NdIj8KiKCk6NQe1lhyd40Syocmj
         6BkJatIEBxlzn9mpf0/PZghOv5cI5rY3F2I3yVQhTPKnXSsM9+2wZcMy23W0mO7YYxjU
         NhujPEGAvIOZikKHHBnb5/saNb3ClpF/qi4J5Edjffjqgfn+aY3MRv7JXO8qZWIFQKpy
         Jdgw==
X-Gm-Message-State: AAQBX9f4bnktwgmwbzhQxBV8fTsMB3agaD83BKZWJAyRD33Wu7rdPU/I
	oXo19oYm3Ku1FH6RqXwDJCb7rz7xs2YXGAaDXhrsYQ==
X-Google-Smtp-Source: AKy350aI+71oWAmO3OSiaf8U410Jg/WRlz+R9/yR6IazGZ/MKyDHhEtyo9+noerB1d8Pc0Zo6Qu0ww==
X-Received: by 2002:a17:903:183:b0:1a1:e33f:d567 with SMTP id z3-20020a170903018300b001a1e33fd567mr5603426plg.52.1680909245863;
        Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id jh3-20020a170903328300b001963a178dfcsm1477074plb.244.2023.04.07.16.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
Message-ID: <e2687d91-85d8-d11f-4cea-c7363927cb9b@linaro.org>
Date: Fri, 7 Apr 2023 16:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 14/14] accel: Rename HVF struct hvf_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: f4TvjhMIxiqk

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState.
> 
> Rename the 'hvf_vcpu_state' structure as 'AccelvCPUState'.
> 
> Use the generic 'accel' field of CPUState instead of 'hvf'.
> 
> Replace g_malloc0() by g_new0() for readability.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h     |  3 --
>   include/sysemu/hvf_int.h  |  2 +-
>   accel/hvf/hvf-accel-ops.c | 16 ++++-----
>   target/arm/hvf/hvf.c      | 70 +++++++++++++++++++--------------------
>   4 files changed, 44 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
