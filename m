Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3840240eje;
        Thu, 13 Jul 2023 23:49:09 -0700 (PDT)
X-Received: by 2002:a05:6830:1d65:b0:6b8:6851:b19 with SMTP id l5-20020a0568301d6500b006b868510b19mr3980354oti.3.1689317348926;
        Thu, 13 Jul 2023 23:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317348; cv=none;
        d=google.com; s=arc-20160816;
        b=qf9Yr5L4g4nljG9g8BWCYvGdmVFpUe/5GK4US1DnkftoBRGH8GPpzhLOHExbTFijYv
         OfMn3rZ45Qk1DNqPFSVCt/nfnXqF3NbpgAEZ5FRz3gTefcaHM6N1WwOQr9RxluDnzoZw
         d/CJgdPDyT++tWWkWSGDLYSa+F6Ffz5xxpMAXjlEjNoR3GHTTySMTvQqeK//oyDe1RLW
         njm76BGBHmTFJ+DZduKHwXrWFDekqU9uOtxWNKwpjc8HSvIp66+yhji/3NqiH/jkGOLo
         ZZDAcjYYE6DB5BUaRqz5OivBYB+EoBBIrMWZ/7Z4zuv4J5mDRIrH/1oueJehheRecMqe
         ByUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4FIWKdYrmInmq9U4lN0gaf+FX8HlpekkwQN86ZEDlYg=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=ZrFArmqhdWlj2KoDQyrXhpxPtbO9qsT2thqX46JcYagk9S8/n4wsqxltQC3bE1QoMW
         KlrVZQFv+wsNT6bZTUNdR3WJ9nT4GzHpqFXrs69hfM1fJwy2NNvx08vciy0v0KyVvcmd
         zI0guCF2fprVnaEEaBDEp+fQPF7mVGGxslWqCLLUl9monNL/HBFL+ul8yO0zuzhSM0HT
         5cWKSB6zuc/TZf2l8GHneUcrQI9+EW/4eIs3OKJcgNyGJR9Ivi8Ku/Q8Oxxknalk8Fhh
         6zQ13umP0rCaYGWOl4cOs25djVt6L4O4AKh03oJyaFAcn8R6O9HGZsHMe/e/7Hlho3OJ
         4Hqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=okbGYrWl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y20-20020a056830071400b006b9b3253eecsor1840220ots.12.2023.07.13.23.49.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=okbGYrWl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317348; x=1691909348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FIWKdYrmInmq9U4lN0gaf+FX8HlpekkwQN86ZEDlYg=;
        b=okbGYrWl5bWb+PGbA3IvE5FDQMkT484YZ/BxaI9Xp7FM3+j2SHOA7SlYD+V3ccL55n
         khWJwF/W3zTBzg+RUJXznthmuD6x8jvCeupDZGgfvww2ek+xatB5zGHpXrFL7rIonKIH
         AwaqvgQv4cix0ISzpAdBusznkprzMsGwnJCkaNJKElCu1zivpjWnKiHxGCq5JJTXzVn5
         kG6+vOWYg/+mqNHE4/9ieTgwOqrWoGBq0hI+QEZeRk53Gf6ebXzddM0GBe4YCbrKT+U6
         hC3XsMWKmpQeXy33XukDsaGofUJ9WH48tjzETqS0fig19GOldqxAJ3sfdUwrr6LKamon
         iUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317348; x=1691909348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FIWKdYrmInmq9U4lN0gaf+FX8HlpekkwQN86ZEDlYg=;
        b=bhsX6VRzRJzOGo87gae+ZF83KcSfLQ3bM7lgnXU14j6lDvVJ7JJuf7Znco+UnzXRa/
         1P4ZdUhKFmRC/gWGDRU0GrS1mWKQ3sZtn+w9ZjeJx+9CmmSxQRs1Tg6aDOtmh3PaHCzZ
         pPf3pLupTNWIjPvJ1IG1k59OdX75449xuH/N+yYQoI2Vcn+8TzJhwOCWKqP18EMkqjUl
         FeRNazBsDJq64WIveZwHTv7qwNkjyYJzD6c9BXgplkWfm5MmrFokSY1FU6VHFKocbMrB
         y/9XhBGTmZQqnl0nqBgeg+ZOomLR1UFWf7Q9AVcNW14pD7H/dOwVPp1nWfnH2/1n/4iS
         Tdxw==
X-Gm-Message-State: ABy/qLZDsiekd/obX5M2cBe510+1i9bV/dXegj99X8ceo7wctIjKZWJW
	OW1HILrQKIkR9b/Fnstx9TgN9lNr
X-Google-Smtp-Source: APBJJlFNsjYKqjWlNzEnFuiJPMJ+VoaVoJz5KpqFVzRNTgZsoYjepJTGxlhElC2wKjlg+30Pbim60A==
X-Received: by 2002:a05:6358:339f:b0:134:cd32:3565 with SMTP id i31-20020a056358339f00b00134cd323565mr4740774rwd.31.1689317348440;
        Thu, 13 Jul 2023 23:49:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id s10-20020a62e70a000000b006687b41c4dasm6448290pfh.110.2023.07.13.23.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:49:07 -0700 (PDT)
Message-ID: <4e360b70-3c13-ba87-89b7-d4b36319bcd7@linaro.org>
Date: Fri, 14 Jul 2023 07:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] hw/char/pl011: Display register name in trace
 events
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jJKQiCBIPMTP

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> To avoid knowing the register addresses by heart,
> display their name along in the trace events.
> 
> Since the MMIO region is 4K wide (0x1000 bytes),
> displaying the address with 3 digits is enough,
> so reduce the address format.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c      | 25 ++++++++++++++++++++++---
>   hw/char/trace-events |  4 ++--
>   2 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
