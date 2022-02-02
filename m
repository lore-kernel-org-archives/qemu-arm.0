Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1403538lfk;
        Wed, 2 Feb 2022 13:19:08 -0800 (PST)
X-Received: by 2002:a17:902:6848:: with SMTP id f8mr32230230pln.54.1643836748604;
        Wed, 02 Feb 2022 13:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643836748; cv=none;
        d=google.com; s=arc-20160816;
        b=BjTBlUkfTDd7KnKYUlFRcXTBtmHsL8lNsZ0R8x2B4TfhdeSJLEFPq4Vj8xi+svlziz
         8BoM2DOksXW+Ih/eeP88VTcKxK0wwrZldKyXKbPbLWAEmuxkfO72UeI5c6f5sEZ+Zvra
         mTrO2Qr4laTZEUtX13JjcWjMiqan7owjCteavngcT6LLUfDyIcRxhvvXbyathXienLh5
         KLGCC1ye1w8avU2hV6reAQvI1VDSONFfZZD9M9UhJswX9Z0cQ1lySd7u92O6PRVyIjcE
         lO2bcggXPGbRfIqAWIXZr3hjR5hKb7Lu80S9CDW4byuvTZGh9FN1dZKdejl5SG0hPhFu
         EpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W08u8gWV2kdB1gWVk9clc7MVV2ByJqztbieghMKqd88=;
        b=VK+To+OeUJRn7rV0cjbOR4ArF6nS0nGPRewsa8RgPE/BoMWQBgMbwx6wrFEo7AbHFO
         MIYnwXx8+rhlfkbZcXBgIqCUEAXQqV0x3NctBxkIugWGvvdf9QdNosU0amkw0Uqn7m8I
         qsD9m16dVkntKNSg1LyCIpwbmbWGK9yEOrfRhZVdfZW++T2bYV7d+PoyAIkqd8DsiYUg
         gHo8aMn9yog0VcV/9VJFAh9+uHeF0Yzin8nvq6t6YtPo2qbbuDeR2Bu4fjW2PKSpxBU9
         zSSwG5wsrlsrEG2GIJkl78L4C1Wg5AxqSkZPKNQ66dMjL3lbQmpquZFGnxhCG293Xx99
         4bDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtQTBZ9E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x27sor9775053pfr.61.2022.02.02.13.19.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 13:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtQTBZ9E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W08u8gWV2kdB1gWVk9clc7MVV2ByJqztbieghMKqd88=;
        b=dtQTBZ9E/WxLfWwENLRJmtM7P/eplbQKhi/+A4Q/oeFsZ8NdA8GGDcO/WDNbFECMfV
         ERz1EJl7BdfIe/THxfk0IcjdC1ess6JllyRrwBnxD+7oQrcSI4zcP0/qcDHIrR5HzEv0
         lU47Z/dxyXsOry9//OgGp8NkA1WKS43Dp4nd/wvLu1UQOk8arJnqdSYZ9UtgzNDGvqfA
         1Dry6xT5Cz+6mxfxIAIC19HYT9VBxWRvcYd0RTC5d5qVMnr0tv/LP2dW36tpctmQsiJR
         8c7Dwoiqtf6pGKSNdHrp2IPaV2RwsJnpVNBUXj5Cn6wp2kv+R+xWBO5c0MnpfstqsKPe
         Ksfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W08u8gWV2kdB1gWVk9clc7MVV2ByJqztbieghMKqd88=;
        b=0WzPPoY1CdLCyK3JFRVbaDw7Pp5mkQcEeR+ADM1+m2eTfgeXpFqGbbSQlrG43FdXxI
         DgUo2hiK76QN15vgFWCynWAQrekfdojegZOeVlS6UZKoOwwaA1p3dVyVYH46ZgV3kKj0
         STLq4MJF23DXb5vUxZ0J18HktrXEQKUL9QPvsHuKnxpxMyuV8BB/qHf0gSJ4fl9/pT2p
         DDTQnsyIqhtXuZwdj0ghAmit3eBrpuoBn8VBQYnbwaaC4Q/9eJ3O8ABdsK9udRvfHQzQ
         mlf0DlvGCsU7X4svN9wHLjCWcoSvKnmosIlgI3SqkxgwZelQWkCI7EvagbGjhAaUBY+J
         DrwA==
X-Gm-Message-State: AOAM532B/1vY0/jS9jul1aj25LWXynaNODamBUsduaEzmNoQ/wqC5Fvg
	B0G12qwiAsClbsCBfuPaDEUak6s+iQOIeEXVYhI=
X-Google-Smtp-Source: ABdhPJxfO6OzfiRHWI/Q1K6QMkASbHHoz1L46ouaUdRv08Cwyalx1rPRsBKJx1r517sdCfck1fptDg==
X-Received: by 2002:a62:750d:: with SMTP id q13mr31322503pfc.43.1643836748135;
        Wed, 02 Feb 2022 13:19:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd? ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
        by smtp.gmail.com with ESMTPSA id lt17sm6957073pjb.41.2022.02.02.13.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:19:07 -0800 (PST)
Message-ID: <2b280d2e-cc74-f02d-8b55-1c089cc16d4e@linaro.org>
Date: Thu, 3 Feb 2022 08:19:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 3/4] tests/tcg: add sha512 test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kRa0EnLXspZX

On 2/3/22 06:12, Alex Bennée wrote:
> This imports the sha512 algorithm and related tests from ccan which
> offers a cleaner hash implementation with its own validation tests
> with which we can exercise TCG code generations.
> 
> [AJB: this exercise in copy and paste does raise the question of
> should we add ccan as a module to use for writing TCG tests?]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/sha512.c | 990 +++++++++++++++++++++++++++++++++++
>   1 file changed, 990 insertions(+)
>   create mode 100644 tests/tcg/multiarch/sha512.c

I glanced through and didn't see anything odd.
Could be a decent enough test.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
