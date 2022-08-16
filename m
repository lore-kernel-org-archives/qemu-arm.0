Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2011507ejf;
        Tue, 16 Aug 2022 13:41:07 -0700 (PDT)
X-Received: by 2002:a9d:1b8:0:b0:637:1c86:a402 with SMTP id e53-20020a9d01b8000000b006371c86a402mr3457004ote.113.1660682467315;
        Tue, 16 Aug 2022 13:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682467; cv=none;
        d=google.com; s=arc-20160816;
        b=0jwtI0Atut4JQYkp4A0HVV3QMVZfUlCB0ZhnLcIQ174zE5hn7kMCLaRTP/72mSK0DE
         JOJ+50jpTwXPTAsX6ZBBMxTJ5o4gdZ8acNYF0yxpAcZWlTl99AJ2eC39gTCWb9ld3/ZO
         9P9dONc3qYrRPgfdldPGAvmtZ//WavkopTP+fanIfsGUuSzQXmQ8yY9JKJYfdzkmac95
         iZqh1E1uKhYw+FtlWlhM2aWoZgdgRd57TGX3YwV37mpBhAkdWdBo6KrISQWdrf17K4km
         /akN4LtmEyh6soOJjHFsv05lilPfER9DDGn4GBXDLQJ80vv2yxRH6NkHmgFxbmZyVkji
         wwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y3dMJQsWCzoReIC5Pnpjsru/SDKUKCLm1SMo3ujwlcs=;
        b=LuGyfo6azL3CGSFwKVfRdcM+5TiBNJ8dP4hxdRP8usEKQSzQeksDh6jgVxhvDuTTD1
         HcdNWe2zoTIyu2i8fr2OpdspU75N8ri9rqeJJLE9FRAjfoMBn5XK/aEeNMMBUHO9mkDJ
         larOk7AB8IA4+1bVrx7L5C8yFe4ILQUDRUkujD+h7WnGhoK+jftKwQyDkw/UH5UdT+pn
         RmmZZcNWOIXgLzQIhEWnweogMNbjggrKKGadDJXJtettavTl41MXgbgiI3SJwu1FQ5rx
         SvzVnHpIATcCYIbAduMLZVYDAo0dFku8yrZLKsJUxSwyGnqotQPx7FPBCX4mRvA7E+AJ
         /+GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS+yVW1f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i13-20020a056870578d00b0010e09af74bfsor2251401oap.125.2022.08.16.13.41.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS+yVW1f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Y3dMJQsWCzoReIC5Pnpjsru/SDKUKCLm1SMo3ujwlcs=;
        b=zS+yVW1fNAHYXW4RMmqDtJ/lsB/zw0MUnggol52OXnGDwjL2TsqHUpG4hoiGLIJKDR
         JdlXfxA8jQqQ3WE1KsHJNnirJ/+yEyn2bh+f8rtfrdS4ehrzDLZK/Cg1b/+8HdQe0n2S
         HF608XpO4LoQLrLAb+BmvIZjx7l8I+pCboyizM6mW/qutnbiLJ2FrPRSAJ6Z7qgtJOCL
         YdYnq+d6Pc6QCcH2ibHrJ2hEPDfjLHLpIq2VrUIk8bqCLmMnIAubQf5p8noj+HpOnOMb
         4pt9Akd80zPh52OLlp/0ge7YhtqQeRHlxhHgNbUI32jsVwUzpxRfiHYHsxmUR9pObZKc
         gZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Y3dMJQsWCzoReIC5Pnpjsru/SDKUKCLm1SMo3ujwlcs=;
        b=HM6Rsk2hUVBT03GmThyPoOpyPctm3/6zz7Gdagl7JiatFEtyA+jtVAEjuQi0q9bGH+
         CVmw5N893eC3mldkGcc2MaHTWe9Z3HioUf2QgZBw32dr0utzEI/5LXX9L+QPPPl1NWBu
         50yOe7miI2hYM5rBELug8lLYvYbE9C4EZF/kCAJO21zwrJ/xNRoYkn6n2qF8ObiUFunU
         QcTdE7ASFsUXeuzCZYyGdShAZFuZZ1lqkpFfHhGAolbAQWgsSSTttkuV6vpYRUQ/+sAb
         NLyEg7w/3A8ucbL5cUW86KZMQgSynFR2PJRnyuwwpgLhkPhBLi0ZUwjudAqt3ezLGSEU
         GFFg==
X-Gm-Message-State: ACgBeo0yLGiapuATbptPIRgJEVmLDW9ClpEahg0VEl4fyOsNab+1FBfy
	GCbhl8N7KvTmZgSuqz5qV1xeNk6V
X-Google-Smtp-Source: AA6agR51HJNAZ5MFAGopMMAospDifG3aNepvximyfZUIHZxvH7Pl4w2v+CHDtyeyQcRDm6SRcxNWPQ==
X-Received: by 2002:a05:6870:56a8:b0:11c:3b32:e16a with SMTP id p40-20020a05687056a800b0011c3b32e16amr151644oao.117.1660682466969;
        Tue, 16 Aug 2022 13:41:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80f6:61fa:9bc2:5095:d612:5e22? ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id k24-20020a05680808d800b0033a37114eb0sm2547633oij.19.2022.08.16.13.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 13:41:05 -0700 (PDT)
Message-ID: <417621e6-d20b-f3c5-bafa-c011e0426b35@linaro.org>
Date: Tue, 16 Aug 2022 15:41:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 33/33] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, iii@linux.ibm.com
References: <20220816203400.161187-1-richard.henderson@linaro.org>
 <20220816203400.161187-34-richard.henderson@linaro.org>
In-Reply-To: <20220816203400.161187-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AB5HIuLq9RnN

On 8/16/22 15:34, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-param.h     |  2 ++
>   target/arm/translate.h     |  6 ++++
>   target/arm/cpu.c           | 23 +++++++-------
>   target/arm/translate-a64.c | 37 ++++++++++++++++++-----
>   target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
>   5 files changed, 100 insertions(+), 30 deletions(-)
> 
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..ef62371d8f 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -34,4 +34,6 @@
>   
>   #define NB_MMU_MODES 15
>   
> +#define TARGET_TB_PCREL 1

Oh, this was meant to be system-mode only, as there is no virtual aliasing in user-only. 
But during development it was handy to test the feature in user-only.  And we might find 
that maintaining both mechanisms is more effort than not.


r~
