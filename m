Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1563072njc;
        Sun, 23 Mar 2025 12:48:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuv9+1Vm73Fd4RiUZlK3xlV7aHcL8e6z66VjzqqrFUDozfAyB/tl8VeJuqZGYhQ5dAOqLF+7P5b0kIQg==@linaro.org
X-Received: by 2002:a05:6a00:84b:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-7390594180dmr18852115b3a.3.1742759295183;
        Sun, 23 Mar 2025 12:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759295; cv=none;
        d=google.com; s=arc-20240605;
        b=d2OQRb+Ep6Vcj1omT/LlIrAeJvmoXApTYc9zJBJA9Healdkmzv8O/V9nbNDM+6Y+s6
         jVr8IvxkZkcfEnfttPc7vBT0X1c+39u0O660JdZaOfxSttAu3PQ1+uuzeaN009uB18BK
         KYWB+HYhcKb5e4zPR8rSw25oEoFTU6NCEDuVdlIhgy+CT/4aDlHt9B9oAkPljcZ9jX8c
         YEnCg5IMSbKLqjI1dqMgL2TBU2wICg0yqQboMjCrXXGC5SReHG1ZPVZxix5nUaaaQnbV
         /9bxKgbvyMYJu1WvzOyXs/hFW91p3UvRFbouAzV1BcxSx0NZGX7OfomimRKP4ix5+hRO
         ailA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sPEVhKH/q/YiDuR1n0MgtydSqyeu2nSJ5etPmOtkAlg=;
        fh=W8S/6SwKWNX4p7kc6utWLh/r6QQPKMyAQw0OT90b9tY=;
        b=MHagRdzc3iqT9UO3HphVqUQDqP03+0eaCpZDvQF3zPZwIfq54Wscsa0OnJyrp7qqQP
         c9lUzVAGdnPCsu7uEDnUk4umI814H5lrub2OUke65SQih5r3lbMMktXYzzY52CPNu4s1
         iKyoRzQ9HM69rT9tI3Xo//gIyuLMFtJKF/ebErseHB3qGHWFL8vmH1FHtLdgcyIxlyGR
         zNcxrxI78NUxMQvOw2VBodCmoO47VlAaiTxqvGshZAiNJXAautOTWEsUqfHd1qII7pGx
         bnH1cwFKQ3hUbehyhCxsDgZ9vuX+zMPse2Wxd6vR5YUzkZyj8Y5GT4eByjQLgXUmMzVk
         jfIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jz2f+x5t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7390602be7bsor2768429b3a.7.2025.03.23.12.48.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jz2f+x5t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759295; x=1743364095; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPEVhKH/q/YiDuR1n0MgtydSqyeu2nSJ5etPmOtkAlg=;
        b=Jz2f+x5tiggTTmJS97HF1UrS/HsW6iFR/StfFfSaMSBIV7HMC8O8ijM2OUP0nyJR7X
         YHmRfzjTc2aEhMrChI2XdULd98fURxfA9Pc2OHDNSacnSP3gxoD3AGRAV8TOhMANkZCP
         Hisfgcd/WR0ETytkw24Bxs1nNizjzQ4hmHn69tKTkSOW6KLu3Mn0krV+QtYPbephO3VY
         d7BViXBNPkO3qrqwe/0QXRtDtdOrXu7wJq2/5hVSvnYJ+bta/vk7QN+/MTfUVpswU+k2
         O/8DtK0mpmcxWUFJUl5pI7nqiL1STnSjbfGSnPyV6RZnG9YBSXtB+vbqAXHditjzlcmA
         Eo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759295; x=1743364095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPEVhKH/q/YiDuR1n0MgtydSqyeu2nSJ5etPmOtkAlg=;
        b=wZHLAWzQVd131osJpL45hskgmWTPSigi6QqOKE1EzZ85eQUncNZtv+FPM7lyU9aiNw
         AypbIE9OgUAzt7hxfyhMgjW7m4n8VyXZFJAWg65/ZdbnMA5QWBlDL5VoFS/LKa8Upnk7
         iqu9hDBIeVmmwEwLLSkNDTE1xFpZdMr0IC26frTJ9neIvRmYpqrzY8ahYhF+fo2HV8IR
         4wg31EjLHH5i38beFUPrE63upTkg1ZcPRsUuWkMfTnij5rtOZmXdQPWfvpzvZ9l/hIcj
         47o/fP4w4dFVDp1EpSgIISbsOdIiQkVFUES+agr9kt/Q5z+VDwPXW0VLJTJ2NF/oZUm+
         pMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnhIvBwHHxghU+7YiXQdye3vNf4JG3B0QQqa7HdxlPBYVDzpWA9gIh48kcyu+MaoNHCuQiw15CZfOE0Q==@linaro.org
X-Gm-Message-State: AOJu0YzePMLkphGgeXYBZupvO0Fa0TBF8gxWTVn3anJ6It4O8LQUlVY6
	UPyN45uv6TYa5cB/SJfGoQ4iq3HhYsvEULgPt12SyJYegea/+/De4SzgpgPhvKYX+Q==
X-Gm-Gg: ASbGncumQ9UhHVphSQ1XEAGlhnuQOWh/ouibeJ6WybCYTgootIPjrCP8r2XWqUOH5L7
	Izb5QpTJPVAid7drBABiNu3L2RZitcZu9oklZNM6q9ZT0IdCXyJg2c6ITcUZbFVdXsz3ipn+uV4
	xFd2ei72Kn8luWvyLfdlxJYfq+Vj2l3OOA5X8S5PfMLORBLyBJyO+3dK2nz1NNxP7OXOc7a5vRW
	yVcfzUS47OTX7o23ajbDi5evcvTG2mGO7LUiF8HIztHdGLdS4cQVMa2T3I+LgSjbpZFy3liXNEa
	QsjUCzXkhcJzqlMeGYezwKQBj3GMDEx12ekgvHsJIssVqC6O2ffR7pBjGwhyEXfxxtKWz7mjCDp
	OmLZMdfH0
X-Google-Smtp-Source: AGHT+IGS/XGShXsVnp9yePf8yBN/4F6cSRZ2vjCDtT3evXQqeQKUz31RxiGg0cYlDNvMmndLkLVSVw==
X-Received: by 2002:a05:6a20:430d:b0:1f5:8d8f:27aa with SMTP id adf61e73a8af0-1fe42f08eb7mr16397454637.8.1742759294672;
        Sun, 23 Mar 2025 12:48:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a25dfcsm5566435a12.58.2025.03.23.12.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:48:14 -0700 (PDT)
Message-ID: <0c9055a3-2650-4802-a28c-e5d79052bc81@linaro.org>
Date: Sun, 23 Mar 2025 12:48:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/30] hw/arm/armv7m: prepare compilation unit to be
 common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: K2svuLQWpHrn

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/armv7m.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 98a69846119..c367c2dcb99 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -139,8 +139,9 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
>       if (attrs.secure) {
>           /* S accesses to the alias act like NS accesses to the real region */
>           attrs.secure = 0;
> +        MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
>           return memory_region_dispatch_write(mr, addr, value,
> -                                            size_memop(size) | MO_TE, attrs);
> +                                            size_memop(size) | end, attrs);

target_words_bigendian() is always false for arm system mode.
Just s/TE/LE/.


r~
