Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp422832njj;
        Thu, 1 May 2025 12:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMrng3PJTflABJLkNBH/gPKn+YQ+SW0v7aP/gulGBFjvD5zYV9pZnhAxdqttmUDWRf9rTaUsQ3WOvIuw==@linaro.org
X-Received: by 2002:a92:ca47:0:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3d97c2568a5mr1510835ab.19.1746127698411;
        Thu, 01 May 2025 12:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746127698; cv=none;
        d=google.com; s=arc-20240605;
        b=hq0KfTVpYPrT5VYhj6k5fl1BWmN8+uWrZAOH3RzZP+C/FWCwEDNSfFpcVFQe1knLFB
         T8G7xBmlwSlRWDjxwssj6RbsrAELU5xYxbH4oGeqND0bEFga7m6IEEGEnP845ESxIXaR
         9GrGShAP9Bm9YcTkVlSg6MeMubXRBnt2SjAaW6uFR8evMVpu9a2moen0d1/Xxa3FudT3
         +OH3MptiDCuqEQ3aEolsQs3D0K0iO39Wj+FlB8g5b2xP+PJVvQrlPZV1GkxWYhO8Hec5
         YR3eH0uyRw9vrlyPKp3uKmNlyiWlLO34xRpUkNAb8W5WCr56Eh5FpLSQeQO1OI6VSFRJ
         mZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nE/d6v4IGNsCc5cE6DF/N4iko97FJvkzG6xIWkN6qYI=;
        fh=2x92PckP6BEIWD89ztZzg2QkODv6Zbw5Km2GoaS/FX4=;
        b=R6A3rJ1CM906O3ON68aLtJIsouACZPDIdCBoSJpOiQtlEOuTQibWkl0oWujY2iniPe
         k0FuX2RjmUH4vu+MbNsqWaHbDS0f8MurI0qyPLW5plmbN3ouLwdNAUIQwg18Sny5UoQO
         jaX32ymSVhmtAIynlaZdZUSoFPd31C/GSO3QlgfmUix7NtWLyCEyRrI3QKQByV6+tXkD
         f/teUURTpskkOkJK3Dtd04AIZhFs79rsvdbdj0AcaQutgKKax3UvT2TwDfCNboWh4LWB
         AeITbOD8meLinhDIH+E/x4Scz3bRt7LYREZYgQh2YXuDnfWfeJa6xB1gOabsrbibrsX9
         FIww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+2wI88s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3d975e5e93esor9126385ab.4.2025.05.01.12.28.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+2wI88s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746127698; x=1746732498; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nE/d6v4IGNsCc5cE6DF/N4iko97FJvkzG6xIWkN6qYI=;
        b=t+2wI88sxeTR4xItMxwl0GwC0/oE+dWciUvlKMMT9qw0WinZ+qY63dVby272dpnfgh
         dREXKan0h3ClkC5Ag3AfQWbOHDv4rBIGmbBe39sxizm1Yd8WA4qnlVOudlrEpfPLH6hV
         ZyxOW/izQe6I83RcJPMKBsPAZ8k7QnDTadYF43/BQ5hRz0D14yJ56kCMTBBZuIxgRfsr
         4E7+fb8/dWI2RqIwreauQ7nXQu4lBNYzNyCj+WKQ9DfFMn2Bpfws7hYf6IRM1T52e4sU
         FUkuO1RqO8Wojmq6YXn9GNDp6Zu4QrDXGPsIs1DNBj12CQY2zxTDUGY0KY/HZx9GQgTM
         nI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127698; x=1746732498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nE/d6v4IGNsCc5cE6DF/N4iko97FJvkzG6xIWkN6qYI=;
        b=e7GPXB8KQ4K6F9rEaNkqOjbU2R0/lqoPp3e6TEJhu9Hw7j05MPCuH6odnk/HE7+09g
         vQInwpKann7P2OY50MKF+YFEXtBHkXD9YbS4VgGk2JPln73bp9jIg+xtAh37hSsYABtC
         dYqS6uGmjdIM1xXITf6dje8SdUzIEXnQS8VYjVOuxw6e8Mv+/0mBvmpvDsARO/MhH5fI
         MX/gr1ymHnhbzwmMeA3SVJpW6MOSJAl2Rh84ZaYVhhlw0gdptCdYohX73rr/Wshckk9x
         PG/oUdVbMsX0cG+dftmVYWNGiKIfMrMOsbI4QYhWy/wySf1DcwFxekJauZjZANoRHhHw
         LlEA==
X-Forwarded-Encrypted: i=1; AJvYcCWGT4eNfTsF2gpaDCaWLpOlT1b5VufFKOIa2PHqVOiDo7Eh4xpZnu/VTV/IQ8+s9OxdHSjBUu1HniEz5g==@linaro.org
X-Gm-Message-State: AOJu0YwmZz8CUUsJ+3V5SYNYKEoMKZEp3fYtVEslnFkv4CURKm6FgxBh
	a+vYfAUBh6YkhykpHIY9zZtVlioC49L+gWdjMTEn3WFiLvlpDjog1poWp6sv7w4QyA==
X-Gm-Gg: ASbGncvpFY/rTYhdeJF1M8r6Zas75TcHD0MZbI3QdmkMIbAnT+xMjpX46L1dgah7/9i
	puQZP9soNgM7fUGBGA1AAWyB77W2Gx8VCXsgbZlFEcAUriOdFoYrhDTyLdRF5ZlRpCnN4V5MBKz
	fjqg3HGaaVmr5uYfVom7To92ALYXcNNOKlNtVI2BNuILB4GWaaB0lvZJjzVO3ci2+wGJ4z334Vm
	cz9qqPJWJPG/Gbxi/kIQgbYmlSRT7rug8nr0gDFPmemBomweUwgqJioGwCxDOJQelwXbx4kdSM+
	U2PmedG4NkXi2g/dzcWxDc8699tOX7z407GD0iUu5+L2QyJiwBcSyGw59K1h5C+9pChRPryxmSa
	XFGwdlMf94UoFWvxt4EVXJMUe
X-Google-Smtp-Source: AGHT+IE4RafrimaLP7DXlBAwC7zDUl/SOUxW6inbiqP5la0qzJpi5CZnsNEjOu6aX7DEPEFOg1EwFw==
X-Received: by 2002:a05:6e02:15c8:b0:3d8:1768:242f with SMTP id e9e14a558f8ab-3d97c134260mr1865245ab.2.1746127698075;
        Thu, 01 May 2025 12:28:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aac80f6sm6839173.141.2025.05.01.12.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:28:17 -0700 (PDT)
Message-ID: <a9d29064-e4c7-4536-b918-057951dcc1ac@linaro.org>
Date: Thu, 1 May 2025 21:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/33] target/arm/helper: replace target_ulong by vaddr
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mcoaIU88DWDF

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 085c1656027..595d9334977 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10641,7 +10641,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
>       unsigned int new_el = env->exception.target_el;
> -    target_ulong addr = env->cp15.vbar_el[new_el];
> +    vaddr addr = env->cp15.vbar_el[new_el];

Why not directly use the symbol type (uint64_t)? Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
