Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3399403lfk;
        Sun, 12 Dec 2021 10:30:50 -0800 (PST)
X-Received: by 2002:a17:902:7005:b0:142:4452:25de with SMTP id y5-20020a170902700500b00142445225demr91084740plk.3.1639333850587;
        Sun, 12 Dec 2021 10:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639333850; cv=none;
        d=google.com; s=arc-20160816;
        b=cLkUKf4OB7zmy9FRmt6EC3/zc8TNWFOCpLw+jYwqfflhbkvbmt4O/NJ+9ndx8lcz5z
         BYYFgMkZVkPDVeZJuV2HnYbIYpuC13CMjrSHy66M/+zjVQBG3nrR9wnPJbcY/boT+Oy6
         c4vOik/HDoXl305Xz4YUnipAa/IWRqX4n492m2IuIOJ42wPzRopBWOCbdijIi1rhlTuv
         DOUemzQSkkxLUdgyS0rxcbI6dkgmMciDUzYQwMFqJhQ4j92sGEYBaLuhgs27GgTA5jFe
         QEJDbC/U1WncE6wnrWvDFk4NSZ77z7qmAGIz6hzLRDjDYf5TBGMOE32ynZF7j9y7Uvir
         aJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JKKHagG8ufP0r6PxqN2dDi2HfWVv+BylaHHCTFTrh0g=;
        b=c1vsZpIunC8NqC6MGUXixGqPlxL1WcpfVpX0MIQZP48wJna9PB23lIKpc1Pn3rpyiY
         Bg3fBMFvaIyzxnOhELhxARowt0mce+ES8iQqcZecGzS1ZW0duJ+8tSiLHRJhjIQZ474W
         90yZOd98Xotull1BphyFMzdsVz5g6Ki2T3qKJjY5eIRGlaDhjQkAndcXFQPvpPcDK6Q/
         m0qYIpeRyi0Ld9DCxfAwejquJcIXmODfnyJ9tRRcW3BYP1mM6tEQgX//N/P6sejHISbQ
         ROQoxoRYxi6qmw4Zwi3K05mrdaQOm4V+gojzaTR3qGDox2seFk6WLA32UOnlcCSyb1bt
         AG7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EPfHYby9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z2sor5450631pla.14.2021.12.12.10.30.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 10:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EPfHYby9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JKKHagG8ufP0r6PxqN2dDi2HfWVv+BylaHHCTFTrh0g=;
        b=EPfHYby91x7WayrRIqMXSS71OufMbsHe2P5K4x099iNnWsOhEKagINcxlz+GFraMqJ
         TIXnab1VXBRoPiclwBNvrVo3KpTsBEXXVQI8gn8D+abB8XSLHucVeMMMoY+fm+5CMh2V
         G3zkoFE0jz1QThevw4h7ueaTlZCpd3P+Fr2npQmeHVsUkKuVe62tTBru0PuPXLNphfrB
         m+nNiwJ4Ahll988dwW0KJvAaBQpmdpWUiHm76IIn1rPAod23D36vRcMrV9uM9gfNRn55
         EErekkSF26BNoM90zx0eWE3/B7WqmgPi3IE1o47plsVlMTkkmyYn7S0N0pEuKqxshIpp
         1fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JKKHagG8ufP0r6PxqN2dDi2HfWVv+BylaHHCTFTrh0g=;
        b=x+MfpWEmR7zbCPl7cNWptg5M/zoLWJ/g4/PuW6dbO1N4VbXc3lTXBTKy6YOaOZ4++u
         IHqSLcrZzVZS33aNn1EE1QidzvouD3/165fv/qGIv7AMW6LBgcVgvbzaSQxU+eBZO5gW
         qx4P8pMpbfDvbDPDHf9V5ahh74P0OV7LnHqhFGzMr5FqewoG4supF4n8F/qiP39dwC61
         o7nulJZdjDOv3GlHGBTauStGHwIwso8Fj6nNSbnSOf1DbhJQY5wXCoytfCcDDHtT4Q3n
         febXsQK5w8xSaLo+Ac4Xshb7ECFu2qxQHMWyar9+RVWwJQ1g4bxu/3JTdzVefl0IzhNj
         QklQ==
X-Gm-Message-State: AOAM533n3+NQPnh8LGhyuRf6dtSCRrDxbqVKxeqsSsgjVrAOR5vZpRw9
	fpgYwexJSe2Dav14KobXxPm/dfFc6Wc+z8qz
X-Google-Smtp-Source: ABdhPJyoY2bWesdOn5IRvoieeIBEuiMIngm5LtVJW+XdUxUoKj9oBwVmOxMBFJkDRzvSmpIe3bT5RQ==
X-Received: by 2002:a17:902:b210:b0:143:789a:7418 with SMTP id t16-20020a170902b21000b00143789a7418mr90253853plr.38.1639333850115;
        Sun, 12 Dec 2021 10:30:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id s28sm10756087pfg.147.2021.12.12.10.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:30:49 -0800 (PST)
Subject: Re: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b907d2e1-0c4a-7e0e-2518-1e000f4b8e44@linaro.org>
Date: Sun, 12 Dec 2021 10:30:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: p7e7Xrt/IIq3

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The extract_table_params() decodes the fields in the GITS_BASER<n>
> registers into TableDesc structs.  Since the fields are the same for
> all the GITS_BASER<n> registers, there is currently a lot of code
> duplication within the switch (type) statement.  Refactor so that the
> cases include only what is genuinely different for each type:
> the calculation of the number of bits in the ID value that indexes
> into the table.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 97 +++++++++++++++++------------------------
>   1 file changed, 40 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
