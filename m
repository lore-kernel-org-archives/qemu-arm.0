Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp302162njc;
        Tue, 21 Jan 2025 10:53:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7qgpBTMz7zAp7YRcsoS7jQ7yfNFFr9Ms7XNJ9gQDM0/Pwsn7tyXUjLT5/rM+ayJ4jcksditf9R5utWw==@linaro.org
X-Received: by 2002:a05:600c:4f42:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-438913cf805mr179983795e9.7.1737485619638;
        Tue, 21 Jan 2025 10:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737485619; cv=none;
        d=google.com; s=arc-20240605;
        b=NgO5za6+WPYY724tMhCea5akLxT1MEpclFCjNFfg7sb3k712eHb6FjKwtPRmnNI45G
         uvKtkvCkF+MTSAjpXgL54gp/Mzn4s1S7PPfXPsTIfYWKu7mrdqJ5lxmwdT9Fw/ymNruF
         nXUAvIsD+pwPO6d8EuvUbr5F2Oh6OxASigM16nnVJlqN08DuLoCXIE1ZCmnyAPzOZdD3
         G4qL88tf7SymR2LbGd7xVzQCascLqoW8yrE4ULzSkGAHXrBC6a3Wq5hkqglY0FihohJy
         igldzafuVGdzzAcM1k9sg0saXQtXcYUGuJLc7XQ7uk8mis7/B+iLJ335IE6UaFcAzGy5
         NwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1mp4kixCqNF5aY/wzjvtuJsTc0Evfg7uUcJP3WcQbTQ=;
        fh=vrtscAnPPzqwTYskqUlirtxAvmPKAjW2McZ68BW4rg4=;
        b=P9nqmLTkdH5QEOBEYV+bq3HX74P5rn0588ijDBJgsXwUO9pnkCb4mbhaTsdbOgb739
         wP/6oQtpECVr8SdMf5VNuAJOzKYzy8PRQZgxtdACYnxq2qEkwFoVn8znU20yawt57t2z
         1vUaEImkdMmrncIODkn0Wavxw+wyITdIjMLGUKyotLviEq8smDr11z7XSPv9cbwSNce8
         yYaKynX5hFYEI7eWt2naGqtfg/eEp5zIUeTQsIE8InktZx/IWZkNjSBmt4PyBXsWND8F
         tYdn3/UGL07CtLy1El/b8am0qvguADU1yQ3/GTY1aafsCLlAqhDFhxUoTHgYbRMR+WEp
         Ll7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoJV7s2m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890445e30sor39366295e9.5.2025.01.21.10.53.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 10:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XoJV7s2m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737485619; x=1738090419; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mp4kixCqNF5aY/wzjvtuJsTc0Evfg7uUcJP3WcQbTQ=;
        b=XoJV7s2m1UudPzMr2AZJwowegfmNvcK/OCGVPnEbOpz7BAT6Ay0IhXW26NaKgUG0NX
         8p/W1QcsnIYiJ0RDZIG85PyIb5uYKlYE86Ljjk/yx2UmRh3OWPolftrXsMzIBaC/ONqX
         jaeqcvVnE8oagplJydGRev6bvXEDMLiq/MK96z9/4WoTNTAjSCRmcsdaJZfWCYdiG4Tm
         mq2vXUMz0kR1QQNU3kHzA9kekayyNestZeNhrxm8EYPHiSiVuM3DZE9GysqPQkzwzPrp
         TAsk6xnk+hJSqbxSzUEavQgYA4gSqdS9zgTh+DlW93ER1JEa3FmzDBCjyUY6I7b6pSQc
         9cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737485619; x=1738090419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mp4kixCqNF5aY/wzjvtuJsTc0Evfg7uUcJP3WcQbTQ=;
        b=U94FoZUCMhjC8mJj3/hZk1tFqpXSTQFhDIENyAICb6r7IIOM3zdCgTMdcz04A7CtXH
         UdzVlKzeGI5TGpy94+2KdfxaYrX8pC0BC+hHR+4xGEj0FZBOTXY/Unwq0oWw3/3aEOJi
         dZgn4kuQeesqyyRkihmRt2Sin/Nxo6uQdjPxtuZm6kyVfhPLuytFvrhVbw5R2UxMXs6P
         JUhIOHSM6s+piDUumCfjxjjRJZdUQIkNZ2bdSVrf22QBqDhL5FP/kLCQXnBp9wJ6ma3G
         SZme1Gy3VM3/Js6WuzxY87ET3YdajuE/1ZZI66/ocAmRShcJATkPWD6QYzoChO/7+L5u
         lwGA==
X-Forwarded-Encrypted: i=1; AJvYcCVxPGBzkm0bOgKuLpMb8ZyMQtUrtG9ICNb/Wy72mkcli5flVye0J2ny9vwHYmzyM2sdJe6BGDphInMweA==@linaro.org
X-Gm-Message-State: AOJu0Yx/P9YrseOeTXSkU8u3q/BcWcPwm0tONp1wDjvWRb79wlAUEpY7
	sWHLTq3XTcbGkQbBURvCVMUNTBWY7+tAzRg4MrjGkglxUbGDPSy6Qg00ZEYsJc94BQ==
X-Gm-Gg: ASbGncuPa/1sSRs0tSUrmk9OCd1qRDOhTZQU28GmSaLpOnHI0OAxLr+ecpqdY3S4g73
	rwEYtb0AmsXdle9PvGrXtjs10CzEeL1BK4OCsPPeQ1T7G1dryxi/9dD81v71mOLEacsaMXfhRHs
	8s8i2QVFp4boUyrHo3G9gX0SDth2P9gnmfTeDWldczbrQTksHuT4nrDecntgjKRt1PpPZQgUDZw
	PCgzmv1rkPnHv5al6GtkKtqzPO2NQAIWMgxiIq8+o7KUyp1PgCP3eIA35XLaowevISTxkxGZI5h
	6J6Wxrflq3TeTDYECn1NV4GtDwvUSyHSmawzuw==
X-Google-Smtp-Source: AGHT+IGO8yqv3zKETuNLrHZbLjKMOpTtPhjzdTGGrEX0ZlfKUrs7B3cHEUln8mfJuSHcc0Xq+c2jWg==
X-Received: by 2002:a05:600c:450c:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-4389145145fmr157533605e9.28.1737485619042;
        Tue, 21 Jan 2025 10:53:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b171e68bsm5143915e9.0.2025.01.21.10.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:53:38 -0800 (PST)
Message-ID: <67ed0028-e559-40d1-8266-0a220021b244@linaro.org>
Date: Tue, 21 Jan 2025 19:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hw/core/generic-loader: Prefer cached CpuClass over
 CPU_GET_CLASS macro
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-9-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250121114056.53949-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IlKc24nioDFr

On 21/1/25 12:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index fb354693aff..0ddb3a359a2 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -48,11 +48,8 @@ static void generic_loader_reset(void *opaque)
>       GenericLoaderState *s = GENERIC_LOADER(opaque);
>   
>       if (s->set_pc) {
> -        CPUClass *cc = CPU_GET_CLASS(s->cpu);
>           cpu_reset(s->cpu);
> -        if (cc) {
> -            cc->set_pc(s->cpu, s->addr);
> -        }
> +        s->cpu->cc->set_pc(s->cpu, s->addr);

I guess we can directly use:

            cpu_set_pc(s->cpu, s->addr);

>       }
>   
>       if (s->data_len) {
