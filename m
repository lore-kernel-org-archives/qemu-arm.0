Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1364360ejx;
        Fri, 11 Nov 2022 20:18:59 -0800 (PST)
X-Received: by 2002:a17:902:f64f:b0:186:a3bc:93a1 with SMTP id m15-20020a170902f64f00b00186a3bc93a1mr5443716plg.13.1668226739401;
        Fri, 11 Nov 2022 20:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668226739; cv=none;
        d=google.com; s=arc-20160816;
        b=RJ6aiGlqoqsXX8S7Wbyr07PcpNduaLcFaYggqIA4exRgb/KjQEdN5ciQukQCX4PBYS
         wLUek/AkXI9MjF/oMxqfJ3SO3B2mApSEhCuCavRlYC1asc9whW5wgHidfUXQBVHJGYc1
         dWP+FdfTDjA7Gu+jKh2BzpmTSkbmEkykCGm/3VbbU+hnhrbOMiGirn7JHNcNGjqAhxwM
         yV/6QmfcAIwXOHcupU0s6qehPM1VWxXd6m+HlnKmrzqvuyYfdh6BL0lTwATUrs67RYsL
         DxpP3C0MOzNPqhJd0oJjYOgBuY7NY2l9SyHXQnrDjtQl+7ts6WDenW0t3+G90P6gEiXz
         QE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pH9uhdGtaF0AWIeJlB8FbPYt5YyXxxf/W6S0LpZALuc=;
        b=zdjSEm/eHNyKep/S2GtT2kXMgyOqJJKEYmk1Fah29tWSHikQpmKbhFemoCdfcvHV4A
         TU6JEY2lM/emSNF8YJGDXWlTXwwKqJnKjXe64nsN8+EdQbapkAlB8d0KBACvQYbp+EBF
         1gPfwLn/bjBsUJElV+MZ1nK+t+bZt7r/SN/4Gr86Uqyob0g/oOawemFwl3LJlXwZrCeG
         Dq+Jpk0v/kI/xkvShjwxXURCmCczpiZ5k5jO02aTycA7hurRN3flYtNEqA5yLROVFqCv
         +sktv7gfsUtihLDXrVayB6QSJmKPo/0X6Wl3IPl2tXLP5Chf4XigDHYzxI5Yy4/yzIal
         LtHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXkFoFjR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iw19-20020a170903045300b00188a93b5d41sor1514876plb.79.2022.11.11.20.18.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 20:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXkFoFjR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pH9uhdGtaF0AWIeJlB8FbPYt5YyXxxf/W6S0LpZALuc=;
        b=DXkFoFjR/MWJHe2rLLFlntYaCvoUnCcoCENOBSPiftOzYWc8sWwZ/ogazN5uj0vGsn
         GfNY2S58gR/NHfPzBbvVbAW/3rYITB4xuuAiV/rjKtSXil7XzJomYm7vY20TFkvCgQVB
         i1quvIDntT8iW6J5lP3nItROEdYLjCyBKtcmm0UZPe2J5b0e+it125xSe2T0K7hnQ9gM
         a4pzHnuKRe9XQBo1hzoRUlqmstytKMcPSS9AVCQJOkd5E4bgottianjiVQVePPIrxsD6
         NB8lrFeRq2UMW2+BYfnBRHCR0SQQxg/Oyl1fInW1JLfsnngNF0Mt9jZgNnIkxpxlXiNM
         UOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pH9uhdGtaF0AWIeJlB8FbPYt5YyXxxf/W6S0LpZALuc=;
        b=rWdahK2hVZC0YiL15OnazGlGUwXdldwp2XP6lfR2FhThYi+Cel85/JImKCcfyO2N8X
         DmbFpq7xliYXBRCkAu6pWKKVgO16/Bs0Z389rLJSLGcaodkMszB1tENY5zDFhFl3Y/xK
         oaGjbNHASuCkjPa1+zLOTFlVJuMV3Bx1uEiHMU9Pq/cpE1dV78rcAHzNnJOP3dksZGgD
         5dBfA8T9WXbzKUX7aJDp9ytCxNsh5Zao5/4+u9ntGTzFiRmY2SVNxTJHcwiRFtBku8Qx
         bED+e5vu6EaK6BTlMfYhKEwp5F0gZz5hRPiatcHySMJzX91JOEAEAXNHoXIGBs0Pwuig
         Hgzw==
X-Gm-Message-State: ANoB5pmPW/6YV0MFWLbAQx1QTvMErbUkkWGm2JWZ0CatS55tLiVRLBpN
	iy3pYXddAHWHiigZFC7ozvKBMS6cc6DTHhu9L9k=
X-Google-Smtp-Source: AA0mqf4k8iUXpaQG0rh5xqA3g/9vQXHAcBIYtpy57CrlGSXCfkgbg2Xe5vyYCT9tEOvkz1FniSAJWQ==
X-Received: by 2002:a17:902:ead1:b0:17d:a81a:5dc2 with SMTP id p17-20020a170902ead100b0017da81a5dc2mr5288554pld.90.1668226738861;
        Fri, 11 Nov 2022 20:18:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902e54d00b00186b280a441sm2537111plf.239.2022.11.11.20.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 20:18:58 -0800 (PST)
Message-ID: <e5d17f8d-cb93-a2cc-39f8-c9dc972f2bf4@linaro.org>
Date: Sat, 12 Nov 2022 14:18:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 01/20] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-2-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LCkLH4g91lEj

On 11/12/22 04:25, Alex Bennée wrote:
> +/*
> + * Bus masters which don't specify any attributes will get this which
> + * indicates none of the attributes can be used.
> + */
> +#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) \
> +                                { .requester_type = MTRT_UNSPECIFIED })
> +
> +/*
> + * Helper for setting a basic CPU sourced transaction, it expects a
> + * CPUState *
> + */
> +#define MEMTXATTRS_CPU(cs) ((MemTxAttrs) \
> +                            {.requester_type = MTRT_CPU, \
> +                             .requester_id = cs->cpu_index})
> +
> +/*
> + * Helper for setting a basic PCI sourced transaction, it expects a
> + * PCIDevice *
>   */
> +#define MEMTXATTRS_PCI(dev) ((MemTxAttrs) \
> +                             {.requester_type = MTRT_PCI,   \
> +                             .requester_id = pci_requester_id(dev)})

Any reason these second two shouldn't be inlines?
Anything with arguments gets better type checking that way, unless you need preprocessor 
magic, which is not the case here.


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
