Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp34876ejb;
        Thu, 23 Mar 2023 10:51:23 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:1a1:bcaa:aaea with SMTP id h2-20020a170902f54200b001a1bcaaaaeamr8894920plf.3.1679593883655;
        Thu, 23 Mar 2023 10:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679593883; cv=none;
        d=google.com; s=arc-20160816;
        b=O/rP8X8ej1EY3DEeWgOPDnAXNNn4vyFZoQlr1UI4xB3F/7EQTPetMkq6uVBqSogu86
         k4W57ZDmEX3XUtGweEGvBPrtUyexjigBxcTtIYwvH83pWssShYkk5O+cQFXfWGK/W62p
         Rc+BPrPKz316/243vC+TFp6vLJmRvrKcYbWhxb1/KTDz0u5nay9C3EFi0Zezgl1x+NxI
         qUPjrIoEEeKn6BMOAKHPCHO70DokIi1mOlm0xl+M29B5ek9g24+zx2n8sRT2Ttd+0eM0
         pOfJN3U9LcrNBMGRhmqq7IyqEWDMxfUX8/Yk2WcinASYsw5UKcE/0vE7GsTPFAiUSG+N
         hW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=36EgZl4Z+OkPA4/GC7SYMcBbd0ZjnFa3XKbyWtTgFao=;
        b=wgHBApLtvDYnTy2f4cwP0XuSN6AnP9XxNcmO0fpVVIPzhIxctSh9ASJAyuJgQDmKKG
         xzZCt5p1SXHcPse4GpkL0VidI1TvwbRSNFJ/4MYL0eNlIqi4MdIirFJFlshL5hD8/HM2
         K51C6BWmBy8FqX00njbhipXNdaIsUTicazqEguUZpA/R0RycMtwqDEFtse9zF5v8TY+M
         cBSa/24RRhaWNv6T9LIVJNymDXmyaIxAKqWFlcJya8iDEbckjWi5Dhj1KO3nt32Woo7q
         u8Q5nHYR3gCDbhaktYoSpmfNgkwVVRyqHZnXj0JKwVBBYp/3VWwtnLp7X2p9p3Ta+nlT
         +rgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1+UsVoe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w22-20020a1709027b9600b00196010ebfaesor8752899pll.185.2023.03.23.10.51.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Mar 2023 10:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1+UsVoe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679593883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36EgZl4Z+OkPA4/GC7SYMcBbd0ZjnFa3XKbyWtTgFao=;
        b=W1+UsVoe5cPUxnJ8wPqDP1J17iO1hIhBCDodo0ZH7LlzM3bOkl7nMj6PQgP3yYPg83
         qwIuO0+/k+OJym15ggl1v5VVsDkycejt9h51c/PakhbWtv4oJYT23eTLlyQtocAXv8f8
         OW2FujYpTaaNoPWMEpM2Ea4ia9Ki7ygdq1xU9NIQU2Tkmrb5mgSSPA+7ftenvWKnanaz
         3Gib4mF7q0c2btHSIAmLgcIWWl+97fxd6ZDUzRHwt4A5YXaDYZ8G6L+BRMVvEOWysO62
         Pdk5e8PTshCTQCYwJOFFdUDXBX8OjLmFn3qMkcvBd5NqE2Z8uJdCfGcW0xeKd7EGvHAG
         o2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679593883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36EgZl4Z+OkPA4/GC7SYMcBbd0ZjnFa3XKbyWtTgFao=;
        b=Adj5ncBrB8WpxhogrjeKXL+jkv2NPYoof8VGd2DVyJSNDRs3nyJj1M9BYuojbJofas
         ED4cPmut5Qj1JFJwkNs+BpB/VDr+jg1EfN1dCYMBDEdN5t/pv7atVBfKhXFCssbOVen6
         68/2WyKtLWyjBuWW2ExYWuW2m50I1xNF0NM9krb5kQXL6UiO//ofqxDG+KM+Nm4MJWH4
         q8YSQe6mJRqYtpkHmgNddeou+Vxr9/gfd9ETEtblnGdW16PT4p9aUg/yj7YxA6aTFKvi
         C6P+wbJfhc3aTqVMOJ7azkoow9bVxvpRm9+b6NSLX5eNGD1dY1G/Ca/AQFnI+GL+qN9I
         DqJw==
X-Gm-Message-State: AO0yUKWFyYjQT6runNN3HZKSDROkMtypA2wJ5yaleKfkiqECptgbt9Q0
	cVDuCkZnOtcCHZ4c6wLTgChKUMwT0NO2iTE3j4ogNw==
X-Google-Smtp-Source: AK7set/4+ykcL2kdHEQedRXhY3AArhXHeQ/Z4D7nS89dy9DEZ7vePRr3Fixv7mmSfaAdMDXhWvUbkw==
X-Received: by 2002:a05:6a20:4d83:b0:d9:8b07:eb08 with SMTP id gj3-20020a056a204d8300b000d98b07eb08mr349048pzb.21.1679593883203;
        Thu, 23 Mar 2023 10:51:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957? ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
        by smtp.gmail.com with ESMTPSA id w129-20020a636287000000b00476d1385265sm11959743pgb.25.2023.03.23.10.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 10:51:22 -0700 (PDT)
Message-ID: <0608d81e-4ac4-b090-b267-3bd0d058b898@linaro.org>
Date: Thu, 23 Mar 2023 10:51:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 8/8] target/arm: Add CPU property for QARMA3, enable
 FPACCombined by default
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-9-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-9-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lTRkBhIDJR2n

On 3/22/23 13:25, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> ---
>   target/arm/cpu.h   |  1 +
>   target/arm/cpu64.c | 48 +++++++++++++++++++++++++++++++---------------
>   2 files changed, 34 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
