Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462336njb;
        Thu, 5 Dec 2024 14:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcsvX90C3EmF8B6oaPGZrRYop3fRFezpJEYiJrgtK4BtEyDxKZXKXPjQe6yI6nYpsdTEmIcoyIL7VVfA==@linaro.org
X-Received: by 2002:a05:600c:46c5:b0:434:a160:3647 with SMTP id 5b1f17b1804b1-434ddeb43c0mr7700165e9.12.1733437392488;
        Thu, 05 Dec 2024 14:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437392; cv=none;
        d=google.com; s=arc-20240605;
        b=VDrLDjmN7oN3SAK7gAprHkusO23pqNxPu8Vf3W+OBbRoCOg3zEnhn0gzlT0l9UN4il
         CVFiwkDtygDi5tQLdTp+T1iXdnIwpuMdxUM+mp4owwuQkLU9BNNSjn0v2R31+CiMM9uQ
         eiAXz3PVLgZEJ8zeHMx9eQdaO64uEA14EOqNBlmatbCWHMo7GO0Jcg9fEAzzpDtq0zrY
         0aUPmYT9mBILRvrYbcbDqFKysEzgF/W1IJA5gqBKc6DZWilx4ORDM8Xt/cp045jsL8ER
         1Dy98YUvfo5JZ3P/Db1V58yCLyTHo21Zj3P+BC2/MIeSRhS2EXxTDWTo0e1obHGNMyu4
         hGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jjEy9XAcN6y2V7r9qJdG8tlarDEayd1oY0lUiCyQNYc=;
        fh=3auHjpsEjA9fP+0idzXK81j1uoSjV1krGYIPMBDevDA=;
        b=WP7RKt+5PClxDD73paSZOgjaF1OuXW32xI9WsDv4yq0Cdh6E34b5NbmIdSm+uO2euF
         uGsV0Q106GBLmSLaAS9P1pIVk+HoMdLH0x1eWusxUpQElyTNG8Bv+Zp29WWE9ZKodpOI
         ZmZTInmw312xsFMzqtnrO0Fx5nPwn+zruZVO8p0Br4ZwMyBJcICrBdv9gUocNxuqVh5Y
         mEYSOawOn+G1RdHwm3Eowa2DQkknP00FeauIqpDHZzolbzyE27z++TvHNb4/H6R100zN
         eg5tjCnp58j6vrutssPI+nJSCqEeSMKaNd8FRvph6MstnArfX4sDT8qytJXiCT4o7gxD
         G5rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWaCbCqq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434d9fab5e2sor10237685e9.8.2024.12.05.14.23.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:23:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWaCbCqq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437392; x=1734042192; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjEy9XAcN6y2V7r9qJdG8tlarDEayd1oY0lUiCyQNYc=;
        b=SWaCbCqqFR9WxMpA9edk5t8YcWVEfS9jkT4OnGVbA/WeXWshtcfywoKJYC/PT/2md4
         B2BdB65+ENXB9IRPthEtB444uPT8mX1pFz/KIH46aAarxeKDmL9zo4gC8dTHV03VFQI5
         MUNeQiDn8R3tD3keCcMKsEpifbz8lbBPd5yO4SXAyxpa60SWIffPlzi/9hcnl6u91xMb
         AbUyWpQHXnLGM+pz4cND/OjpsH60OEXvh/xojAJYYNvg2CDZ2MTZkJR5913aga7vHfJv
         mgUgTidoqSYB5TVZiCBTjcirT2lk8T+kf7TswqUcoCKqfKILkjKmORrmLx5jbzXQma8s
         UPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437392; x=1734042192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjEy9XAcN6y2V7r9qJdG8tlarDEayd1oY0lUiCyQNYc=;
        b=MD4iVGIzI0+PrfQZsmMDtesotCoTFzI+G6vKOV7avzInkZyCNQwLXN71EpWZNt10l+
         JjSGUqm3vn340NCinEIA9VkLIMcXWt5WSdO1zJz3dykXJZAp7EQU/S/7+CrUB7msfG3l
         fsjX69zz6qfxM3HzMZMMF3fAW9PMLOdTioSRhxAlrGJWLR43nQDj54i/0JAosJZVDKmw
         Igx8nIYbXasZ8Yjkw5LuHo7LdFqA9alWNQzy/IXMi7FtbyVInjd9IaqhMPqKd+FIhCzT
         DcHeXtW5ChjxYz2+tE0toO2/oQPw9FlOEO7iLQYE1NjnOorXseG7HsL3eC4dcvX7v1Xk
         zY/A==
X-Forwarded-Encrypted: i=1; AJvYcCUtxWLS/gYpy/JEfv6j5LRxR9lInxQgEWQXLx2hrW7sVpCISmuyj9AXJN09o1YmfR2Gz1rD4hL4A7w3sw==@linaro.org
X-Gm-Message-State: AOJu0YxaCpqcXH8Dr1QxeqIKIP3fKdMKEPIiy9+QckBHFXxVWc0Rx1db
	GFnADooYpb3MceI/2a3e3Zgv/nOt2Pby2j0h5SDNeWMSUXhwC2GszExRYK405UORsQ==
X-Gm-Gg: ASbGnctBdH1EanDP9Igmp8h5WHkGOXQihMosin9SO3kZh8G97GDznvkoav/+Souar1l
	x3/m+oDk4mrtA+uWJdcijVPnfLXYjPFqHUOkr/7GV57MsYbyKd3hzbIvk3jOYnK8u4J5GtKxGXS
	J662LL/QH7y+nkYmae8Y4fdqD0L1cVaOs7LbamGfA0hnZugjvyJcaKWNmAiHaSatWGgEijEOZ54
	d56jQ/r5qFbaulHuMjlDP0zb7Gk2BCq1M0r/RCzXVS2cvvMr7y0ty+4hnMhMDdrnKDyrTskchFO
	Uj8a/mu/hoyWJjTOKA==
X-Google-Smtp-Source: AGHT+IEwiDNtXRDBMfSzag4lgR8m6pRSmbDvnu7TGo5QlLRVTLPEybjuH4gExpvfOIOv3yL+/1MgyA==
X-Received: by 2002:a05:6000:2cd:b0:385:e877:c035 with SMTP id ffacd0b85a97d-3862b3f5655mr574759f8f.53.1733437392018;
        Thu, 05 Dec 2024 14:23:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd46cdesm3058947f8f.57.2024.12.05.14.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 14:23:11 -0800 (PST)
Message-ID: <edae9f1e-1f80-4f22-9340-c88f440a5523@linaro.org>
Date: Thu, 5 Dec 2024 23:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 26/26] hw/arm/virt: Add measurement log for
 confidential boot
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-28-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-28-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: D0UrwoHFr96v

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> Create a measurement log describing operations performed by QEMU to
> initialize the guest, and load it into guest memory above the DTB.
> 
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: New
> ---
>   include/hw/arm/boot.h |  3 +++
>   include/hw/arm/virt.h |  1 +
>   hw/arm/boot.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
>   hw/arm/virt.c         | 23 +++++++++++++++++++++
>   4 files changed, 74 insertions(+)
> 
> diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
> index 5fcbaa2625..f2518c4e81 100644
> --- a/include/hw/arm/boot.h
> +++ b/include/hw/arm/boot.h
> @@ -147,6 +147,9 @@ struct arm_boot_info {
>        * Confidential guest boot loads everything into RAM so it can be measured.
>        */
>       bool confidential;
> +    /* measurement log location in guest memory */
> +    hwaddr log_start;

One expects a stop/end after "start", maybe 'log_paddr'?

> +    size_t log_size;
>   };
