Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp213971ejy;
        Thu, 15 Sep 2022 01:17:42 -0700 (PDT)
X-Received: by 2002:a05:6638:4107:b0:358:4a01:e1e3 with SMTP id ay7-20020a056638410700b003584a01e1e3mr17104456jab.189.1663229862423;
        Thu, 15 Sep 2022 01:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663229862; cv=none;
        d=google.com; s=arc-20160816;
        b=IrNjl+8iYb/e5fpr3K5Xfk7Y8laWB4Cj3AIu9jewLii5CRwm+q2Je7OlDncAjd+IVj
         Q6r2hUFGIc34KND0jWMEF90lGxW0j+2ITS9QWaPbMjT1p4vMwK0afaEANG/eYgRAhJ3T
         CKXtR6Cm8AS3wwMqaT6MB/ClhKDcmHv08pf9k1ApfMAK0Qt8PxQ+6/0c0kdTGKdMkOHC
         Bn705hDMlmZT7OxytLUNmFb6ceRjh/GIcWFE2CWjCOTwzWKkJX8+2EnZp4dwi+A+4p7J
         R6HjQAAeAcEmwBPWf9OF7PSEKMLE0g18p384tZP0JWW2N5eNjLyRn4WXRFA8ipkMflS5
         W28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SLIN/T2UVl0GiEwLwyvJIoYqnT+Vo1HQI1JH12/FB7E=;
        b=e98B5DYlydR9YZF1WhFcnet6o+6SMZoldBdrwq/wq0OYkymS9qAwW48fB/tJwD/+Xd
         lkIbLflZFRSOANVA8ByOwSI5cgI4hrSQabCpEx2JotFSrLQgRE0zJjbaiDbdxr/r1s6Z
         aZVvUccKFTjAdcbWp6oX33RyFIQKfuYvvJ6XhlpSb6KVwz0MblfXIDQ91jTE9WkhGKcG
         zeqXEL0ItKUIn/1fNLD4g1Aq9cm2wGXySzM5hRD2ytvNKREJ59b0MzhHGTN7qO5NQ8Ij
         3Q+qsDFD04IaJ1vnODQx7T1yXJwxmgMy46JYOh2QFBi9FIuZp9K4T69Q3q8SETDRkpJN
         wsTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VD3ML2PX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v16-20020a922e10000000b002da82f13d8esor4533203ile.102.2022.09.15.01.17.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Sep 2022 01:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VD3ML2PX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SLIN/T2UVl0GiEwLwyvJIoYqnT+Vo1HQI1JH12/FB7E=;
        b=VD3ML2PXYOTXg63HleEwRJ5Y4CIcNNs3dvEDJ3ng2u0UesZiOPlJ0rFN/6+5kHNLSG
         5jIOYBquNiow6kWeHRMRvPbsYNA8cbreymMhYblZy3DQLNYZKAvdzjJh+shws6Yebc/x
         55h7Ywt1hg7f4IHavtj6ANd0BNsD/6VzYQ8UVDl0VSXUCaapw5YFeWTdh8gnaqF/BJma
         4vnRO3AfHz1IDOf4xUCe0YVjn3WVSfgSikeHI5Nc8I42BbiBGDxaJJa4sGPF2MvGlKLk
         YJzxER1AlGWEdXnm8WKmckYfwQd+t27hDbfsrBSuw16O/lWpjwOowYj7z0tZCorUI7UU
         2A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SLIN/T2UVl0GiEwLwyvJIoYqnT+Vo1HQI1JH12/FB7E=;
        b=nI54yKQgjJODR2t0dpPHkliKtq2zyfpuDOOrDJAKmXGqEIMASnyh0stX56mZ2QgO85
         +JjmXRVvTkmkr0z/4pGHtk6A7a+gyL9VSOrPAqlNYQRdIYHdVMCJdhaW0kSBeBZnRKip
         VfD70oOcrialZsfhhgmcN5MnvV14IaqpA0RpaHlr69BPFkxmKkNOac4n8DFo4AhIwo9R
         hgElv0cZJEjM3Ur7Nu9695FlvuqrLalOWneEriOlEf+ru5UUgXx+B3/FsgYPamg6yxQT
         SiYhSekS1/VOqMH4mx485NBWLgLxO8UCUL1dnzOAfTFLv3PuJb3j/1O51TELIlJWvqnY
         DF8g==
X-Gm-Message-State: ACgBeo2ZJ8GQdcmhrKwTCpXc7Lc9ktNM9lJqtrm+jCv7QdWERxxM90tz
	+ecx1F52FmWFEOYqr+ydoPR4CgAo9Q/FdMw3Hs8=
X-Google-Smtp-Source: AA6agR7LJKoLaGPEkCo6Ec8cCvd6h3fcQHmlBDp1BI6VT1U5UYzqJy8CYLhmXCrUthvxk7gAG8IukA==
X-Received: by 2002:a05:6e02:1748:b0:2eb:e656:8123 with SMTP id y8-20020a056e02174800b002ebe6568123mr16688138ill.15.1663229861944;
        Thu, 15 Sep 2022 01:17:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf? ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
        by smtp.gmail.com with ESMTPSA id d18-20020a0566022d5200b0067b7a057ee8sm5179450iow.25.2022.09.15.01.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 01:17:41 -0700 (PDT)
Message-ID: <91b4f280-abab-1227-35e7-7d3189f14cbf@linaro.org>
Date: Thu, 15 Sep 2022 09:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 4/4] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dIYJr7qKjleJ

On 9/14/22 17:09, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index cdfca3000b..a7fe6ddc0d 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -41,9 +41,10 @@
>    * which is used in both the ARM11MPCore and Cortex-A9MP.
>    */
>   
> -static inline int get_current_cpu(ARMMPTimerState *s)
> +static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
>   {
> -    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
> +    int cpu_id = attrs.requester_id;
> +    g_assert(attrs.requester_cpu == 1);

Again, drop the "== 1".

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
