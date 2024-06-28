Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp240682njm;
        Fri, 28 Jun 2024 10:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/QsG8l4hCGu5DWNj99plTiYnVcFyWxq6i76tyFfjbIrQNDtfQzMUZ8htks3/N6KBJGQvwY+k8svSN7a55dAEXu7toQfC/
X-Received: by 2002:a17:902:d2cc:b0:1fa:3428:53c2 with SMTP id d9443c01a7336-1fa3428591bmr169274375ad.63.1719594689900;
        Fri, 28 Jun 2024 10:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719594689; cv=none;
        d=google.com; s=arc-20160816;
        b=zHfTSudeawjSHNSEehSgyv4lzxSgfxtxqkP5UfKNQzs9p5vktSXbYIg2t/bXvQIVqy
         zjeKMDtc3z9NkVjHag2kUokS7+Qhy1v5KsWU2EQ4gpffs6GR2QwHJWC3gIRlkL9doACx
         C0I92dDBlJYdzDU14Fuz/k+v6cFi5XgHLITZ6N8sTHRLq1Z5OWWNdKO6vktUGjGJ5ntQ
         yL9MSlODSzzHNcYEoTKnuWcSz19mE0KdooT40m2YSPeKc7v/uIQVz2oiFI3y8HakyhJI
         2RLq+EGP2ijDtRLpks1ZF3ByDTkY/OA7T/dqi+CWXOdv976N6hjvso7gGP3uol3lYGVw
         wSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UEnv1Xe7Ey4m/cyKdLC8yf5wfk0oVg6dQ6fUguTxPjs=;
        fh=NISXH0FV6+2CHYkNPddVyaVxP2O+KBnZsYjQ3D7U4Bw=;
        b=k4XydzaTmvHoYXmgT4V/bFxy2OnYFmi63zxbvHtCRqdyOGgKI6NRVf+cTRO1G3xLoR
         qmPLEv2iT+pusLdTnleLM/pBF8C75RQpfmI6/8n8wL2eYersSwtBmtu/D9C7saInJiIf
         YSyMnbjkbWFZBCHkm8eX5JAdG4IBv5HOmE2sqyRes8A6wA3/lTbTN1X/h5vUe/RGLZvn
         HZutSisqyN2KGcLfbsV/j+66xIXo0GJcwa5F0ijHyXmxjC0Di+x3hMuXI8OtYFBr1LKU
         Islgzigjo2wpcymeSnzK5Kw4Dyt0MQbCWezC+pAUFz+7Sq9gPMQfwAHAq0yaCGYNSRux
         517Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvlUDPv8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fad0671447sor4842025ad.17.2024.06.28.10.11.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2024 10:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvlUDPv8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719594689; x=1720199489; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEnv1Xe7Ey4m/cyKdLC8yf5wfk0oVg6dQ6fUguTxPjs=;
        b=SvlUDPv84hUY4g1Q7vzm/99zRokFldKvh/kWw1cRoTZqjnm4Ab+I51l9CKwJNJOg+u
         or87CBQKuHWBm5GfDpuScK76RHQxpg9veDxN0wfejKlMMIWvCinIzn+gOL89ZyMnMAiT
         g04DgatRfzt91r/iOHPvghMJiAK9wXlgsLEHPATZpNsXlLdm9v5V95qcnIL5O3xscmlC
         tbmR/JM66UEGUUzDWi8hngC4HiSNOl8fzajWwfPnDJHyk/JNQpMlU1/NN5dDoXX9rxU6
         EYt8CiB/8F/WfgnDjCV/xOdRLyawyHyJ62899OxKItN4YejdfkmOv+ImZ4ovBS0DoX1A
         jZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719594689; x=1720199489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEnv1Xe7Ey4m/cyKdLC8yf5wfk0oVg6dQ6fUguTxPjs=;
        b=GvXvUJ/jeGubHJA/4Crh2Yku0pCNh0JGU0wwvsCiqEGxAVZ9zjFq9dhw7bOAOZrQW7
         GZoEgtg2t1Jok2bvqOB5qy0eyOOyYzQwqpk2clC6AgpP2kh+o4u8YAH/WRVR9XLgbHd6
         hANBLlOpJBATS7S9xGE8RGr0KLyfdJyGjdA8ySPv3UCGaOu451LKeoQlvNl9nMtSKgvQ
         yXeYRh7QBoPVu+H1g99xvMKoFE0ibWTw0Nh6nF9Vmgzl4onmrIgxyWKBWzn/Bb8nXt1m
         sPPgG791X2mecVg0cMH0iUnqCB0SptZQhyhSLzFTJ7RM6xQTpUW2fNIpc6O2FCnC6Rjm
         hpCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0bR13LQ0iJ3iQAboi2XfQQv/BxA4uKmUGv3oKuQB17qlN8/ol1xrLDvhOQv2ZbsBw7lCIJMjeeQZ/x0eW4/qmHoBpx1sP
X-Gm-Message-State: AOJu0YxuPedqY/mi9EaU3HcFxYzlaxariDODkmLmwTWgem2F77w34Kp8
	d0/u4XJmFq7B1CdM0WPvgmDTFJJE5my6UZQkqcIGtMExGvGcRXVAldpzYfOYrjPc8Ze/cgN2saq
	Tv3g=
X-Google-Smtp-Source: AGHT+IHr4FXYFeYOW7zhzGEBHJbw9iVu0CVpzcGsecNfIlSeiWYB0XtB/kzXXHc1glCYIY86V+WoHA==
X-Received: by 2002:a17:902:ce81:b0:1f9:c3b3:d8f0 with SMTP id d9443c01a7336-1fa2401c255mr178196505ad.39.1719594688985;
        Fri, 28 Jun 2024 10:11:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1594eb0sm17681165ad.246.2024.06.28.10.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:11:28 -0700 (PDT)
Message-ID: <afa54739-ce19-4b3f-84f9-696c1c28ddbd@linaro.org>
Date: Fri, 28 Jun 2024 10:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] tests/tcg/arm: Fix fcvt result messages
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-1-1690a813348e@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240627-tcg-v2-1-1690a813348e@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IAKv0ll5enWo

On 6/27/24 06:58, Akihiko Odaki wrote:
> The test cases for "converting double-precision to single-precision"
> emits float but the result variable was typed as uint32_t and corrupted
> the printed values. Propertly type it as float.
> 
> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
> Fixes: 8ec8a55e3fc9 ("tests/tcg/arm: add fcvt test cases for AArch32/64")
> ---
>   tests/tcg/arm/fcvt.c       |   2 +-
>   tests/tcg/aarch64/fcvt.ref | 604 ++++++++++++++++++++++-----------------------
>   2 files changed, 303 insertions(+), 303 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
