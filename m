Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp284352njj;
        Thu, 1 May 2025 08:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdnys1fodGJtD4q52huGJpIdUoilmvEfB5/L3Smm6sl2D1GYOIDAbM2RaF7qzXp3bBcqh2JS91Rsh5yQ==@linaro.org
X-Received: by 2002:a05:6a00:4b08:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-740491cf02amr4449505b3a.7.1746113536168;
        Thu, 01 May 2025 08:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113536; cv=none;
        d=google.com; s=arc-20240605;
        b=HIoYbEJ44KQgKVEgdPnSIStpR7yZ1pA9iW3i2+xFekqOZEa1q5zHIYa541kGrSkZ59
         1LVCJ+voT1nyQt6Wb5n5fgVs6THTubxpxrKsVVZsGniv1hHYAOqONnddyfGFEZfbnjii
         2WFUPcHMYzjMODYGldvhOEFzK09ObAVMSLu6PSA1zI4EKvxJB0sG9jis/7bN7bzSzmG5
         vaxgTVnTJA4mMT+bDBbtIiV8nyJkmR6ehXjjeQ+8ux0fXE/REzkJ9ds8rlRmySioFNCA
         x6cqESBe5LLa+FCm/IJtldmw+rJnXu5HDgueOM4XLyI70ZZGIEHf63pZW+VxiP2gTPQv
         j8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iAnD1GmafUPGhBO+bMT+SirMBKARuf2EvO+yXD9bfRQ=;
        fh=zfF7hDERaJtwLmxcmZKRCenRrLcVRbdwAgeQ4uMxRk0=;
        b=GkRhH04DD7KuEa0+B9VEuZ64WSay4pi0/Hk9fXhrXyyZtZis8A/2cgdZrpDGBWJZv1
         C8lfjHvIwX7HfKbZCrtwS20YIOjfThWMmdR6Hw1jkCzBZlQl8FzBQ5Ux/l1xyZOdJmju
         W0ECbXvbBjIhWEkCtmeBpN21nT287J/F4beADrkEiOucepPBKZKJcDTqk2WTT41/qYIT
         tYPX4aPIEGgozARW/YVlKlDA/LBOjcj+jqPfbngA/CHRoLF+DMnM0Bw573KP5as84yvA
         FLA7nHQP7MTONlGTGvxI4HchF523tWPXifzk5QlJ7s/8ViOSIf9HVPhq4VgWHy0/j5W5
         AMng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zZdeW/VQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18c34sor558350b3a.4.2025.05.01.08.32.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zZdeW/VQ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113536; x=1746718336; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAnD1GmafUPGhBO+bMT+SirMBKARuf2EvO+yXD9bfRQ=;
        b=zZdeW/VQFrlwf7IV8ZUwCetb+z3eD80Qfn34o91uPl1VnjV1IQvn2LacZZtuqCSJAE
         rDZoxb6hqFW2UkOLk3JA0KJaOpEhw1sAvv+9cm0axzQWn5l3XZvsDO3IhW9nMS8gLXYt
         6QHBDyG7R8OdYjFHiM8TU4GewiFovGz6dnfx3STrBJExIlbhpObkoogLdoXx5tf/Tqbb
         qBG3H3OaR6gc7fRZFs5YfERZXTL1tnbW0dvMkLI1BR+K9guRBTeTiyVETMMb2q7k6xhu
         hUFTFJStVy945Z33DEND4cGU4dBZDI322+nw+QOdXDnwMXDPEq4RMn2PTelDXHAyeVYM
         IA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113536; x=1746718336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAnD1GmafUPGhBO+bMT+SirMBKARuf2EvO+yXD9bfRQ=;
        b=Qgp/R/RCpu4WVJFcFc9Txc0XWIhCwTs9qi42Dn2sMtvNLHt7EqsHajo054R56LhlHb
         QfcXESuQbsHbqz9iOSGnA7VyPoo2XC6mSK1inWHPJGkgcx6mNTBn0r4+pl2DuK5Ei/BQ
         8hlJi+ypZZjoR9rHTcsq72lfoIF84F/xjk1jsH1pmOuLFfiuf9FzhdVoy3GWgZILvjiU
         Ldw61pozoQJ56Kj5yjak3jf8fCkZGugMY7qZVR32kCz2987MsTjZYHRJ2XtGMmhNQ9pt
         bx6wKbPeGnREWvFmCtTw0pTCQy9UCTF23dv7ZRhi8t4rfQTFGeLDPDMfHKjFI6EAManW
         VzMw==
X-Forwarded-Encrypted: i=1; AJvYcCW7cCYQkSGM5qatQwFIVE+pr9dmjL5OSG6tq9uKoAkkYDZjQlaBeUTgR5xqww656WohIx0WIZGRiN6Kbw==@linaro.org
X-Gm-Message-State: AOJu0YwdYgdg6niz+/6k8E43YGOHeZ+1A48oi9XXlPXrPPEmM6Z7lZJ9
	v2yxYiaKVQvOXq93szGIDCF9mRfkGzpQwql6DZwrokl/iU37HsNdSpGAj4pyTe9jaA==
X-Gm-Gg: ASbGncuSxTCgLXUouha6u3enOZs0OW8/qykTxBFbZUyEkBMM6HFJn7EaZSbe1OchCcs
	6+0zLDxLgVAVIqiWzvulJKUNwBr2Ydi9NwlZzgXmT27/FeGgQd066w6vJomPKvNWAV6a0YXIZu4
	ZaiigJzRzDtoTUup4/VUHX2OSMHcAFmquF9NTOVfMjc3UYetaFIV1F/imGw+SwZvdDtw1kJ4L65
	M1WlLb+vKnmhXQdpQZFcUPHfnZn57s2Xn5pWFU7AKn0UoOGsbibmiDMXmaaAgnWo5wLUUYTTskg
	/r9MHrlgIqU4SnkrQZmodVs6Rz0M0xbLsCGlR3pZq/nRdgNbc+Bq4epqpCrp5KE/8DQutjUNJ71
	QX+3lQiU=
X-Google-Smtp-Source: AGHT+IFoBxe2DZWgkVAHcucJCGrG3ZLN/dT4JrPNYQVEAuSwRAoP0fHb5trrXL+sMuISG7evBmLnFg==
X-Received: by 2002:a05:6a21:3390:b0:1f5:6d6f:28e with SMTP id adf61e73a8af0-20bd8644d34mr3612391637.42.1746113535710;
        Thu, 01 May 2025 08:32:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb11b6sm946606b3a.2.2025.05.01.08.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:32:15 -0700 (PDT)
Message-ID: <0f81e684-4da0-4e6e-8e88-7a9f9fde24f8@linaro.org>
Date: Thu, 1 May 2025 08:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/33] target/arm/ptw: replace target_ulong with
 uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: q8C2uGTQ7Pna

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index d0a53d0987f..424d1b54275 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>       uint64_t ttbr;
>       hwaddr descaddr, indexmask, indexmask_grainsize;
>       uint32_t tableattrs;
> -    target_ulong page_size;
> +    uint64_t page_size;
>       uint64_t attrs;
>       int32_t stride;
>       int addrsize, inputsize, outputsize;
> @@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>        * validation to do here.
>        */
>       if (inputsize < addrsize) {
> -        target_ulong top_bits = sextract64(address, inputsize,
> +        uint64_t top_bits = sextract64(address, inputsize,
>                                              addrsize - inputsize);
>           if (-top_bits != param.select) {
>               /* The gap between the two regions is a Translation fault */

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
