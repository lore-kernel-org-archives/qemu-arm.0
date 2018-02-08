Received: by 10.28.71.27 with SMTP id u27csp2524291wma;
        Thu, 8 Feb 2018 12:42:32 -0800 (PST)
X-Received: by 10.36.172.91 with SMTP id m27mr609363iti.143.1518122552520;
        Thu, 08 Feb 2018 12:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122552; cv=none;
        d=google.com; s=arc-20160816;
        b=MYT3sr/1vQfjip2tYHfA6VfZbq8qtKrebJvXBX5DykAztV7FYq+elS0/AHSezMSNbf
         BivJvlhxLCLXeLoq6h95qCLHhP5Sn57nZH2cutaEpuQ8s7h21zbdJuZxM9t8/zby9vxs
         yIUdmAv8unqY6o5DLlWxU9aijCSHHQbhPlfAi/hpx2yK0jVM0djWopZgnTLEkew4P6le
         vHdOAXDV0gbFtCXWqC5XpsbNby4t4YuVWeHZb4GWMvJqfvO56YDtiqij1eoUx/rR2xq8
         Fs1HkG3rATobjKT8yAlcgj3xW3lsrFNcYa99VubKgbobJq91Ek38WVJLKScVzCEeIKeg
         Y2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Sgyk54Q8kUe/2wkS6DdUSqfhGnfoGNxpNTQdZ0lMf5w=;
        b=G1A9kRhXDwO+5INXuQ7S3r8i4HVIU5a5kk9KzSdVwa/GIYO3Em6ThWmjp85zpDI93R
         1WNtPQptyyl3p8kJ1Qib8YEWz/49Ki5n+ZeMQtawKJKPhTM4/dQ319IpQgGW5AnUdGVy
         oDEjDpke6c9OkGHmR6yExe1eSf9ijBVBEta5GxeLBaUjsKKsGc6daqA/m4LuuTFt2Y7a
         FyV6N3eQ6aePS4ucYhqghQDJrRwMLz6tXNaagI+csTeFFDyZ99RqBWyqDAwyetXWAp/N
         uKi7NkNCotBf+HVDDr7gZ4ZhXxsJvGCBPpGv6yVbm1oHfIpwVNSzET+sPDHSfna0mWri
         jcSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CulkvbEA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 142sor464274ioe.136.2018.02.08.12.42.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CulkvbEA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sgyk54Q8kUe/2wkS6DdUSqfhGnfoGNxpNTQdZ0lMf5w=;
        b=CulkvbEAmeSq9A+vJCYfguFUYqjrOUh9BzhCtIJxoh2CXiJ5uf3BuP28dtH2GXzwwB
         ktgTdG/lNiz/r73zCUFL4IqD93tst1oG3k/TZmQIiFYQWrZQFjwJobfDSCoI3Y5WVe2/
         owV2DxtcpVWE4wK0TroXHzfwmZO0SPILyuNLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sgyk54Q8kUe/2wkS6DdUSqfhGnfoGNxpNTQdZ0lMf5w=;
        b=aj8xnBAxgtpTaXw3lTM8SmKzyM6KiEb7dyp+feKZwOAl5Vh6S1I4RD1PAUEkqfwyf+
         WSTCahQh38pBoHC/LGy0aiswEXxrWD/+luHeoSFInin5+v1BwddmxdFmnTTvoRX00n2S
         cwLeOBSy11W/0Opp0b/RKHxv4oIjnLBZBFrlcJqrp7KRD3E7eT1WtIs/TQJ40Kq1AziL
         WKy18dYpVuAm3LXeKofgiv2hvSWJgG93pRDlUqfiwVdS9PKZzTII2Wd5wMkpc6fNpFW/
         WQhCRwNVwy22ZDFB0vKA1TOcy7LxJyQh4eWNFvFUYihn0cYi5u/ORgYPMBs7Q0YSD5L/
         Cv2Q==
X-Gm-Message-State: APf1xPBxmvLnrYjqFeMjRHHVdrJ/9wvXNvgCBiGeC/P/yGtKxxdqYhZ8
	yoDEgj5ArnRlEVsu3PpC+9Ly0JJbLQ2pHg==
X-Google-Smtp-Source: AH8x225a6ZHyPjPR00CxHCo+eUZXpjvUoUalscWhyFlrYpwjv0aSVPPOwV/UdlvlPQ3uJsXEFR+oSQ==
X-Received: by 10.107.168.25 with SMTP id r25mr451022ioe.16.1518122551991;
        Thu, 08 Feb 2018 12:42:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id m21sm583445itb.43.2018.02.08.12.42.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:42:31 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 05/32] target/arm/cpu.h: add additional
 float_status flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14861ad3-ae8b-662c-4d61-0b17914c9ae8@linaro.org>
Date: Thu, 8 Feb 2018 12:42:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: r+gi5FNXddBE

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> @@ -10750,15 +10751,22 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>          }
>          set_float_rounding_mode(i, &env->vfp.fp_status);
>      }
> -    if (changed & (1 << 24)) {
> +    if (changed & (1 << 19)) { /* FPCR:FZ16 */
> +        set_flush_to_zero((val & (1 << 19)) != 0, &env->vfp.fp_status_f16);
> +        set_flush_inputs_to_zero((val & (1 << 19)) != 0,
> +                                 &env->vfp.fp_status_f16);
> +    }
> +    if (changed & (1 << 24)) { /* FPCR:FZ */
>          set_flush_to_zero((val & (1 << 24)) != 0, &env->vfp.fp_status);
>          set_flush_inputs_to_zero((val & (1 << 24)) != 0, &env->vfp.fp_status);
>      }
> -    if (changed & (1 << 25))
> +    if (changed & (1 << 25)) { /* FPCR:DN */
>          set_default_nan_mode((val & (1 << 25)) != 0, &env->vfp.fp_status);
> +    }

This misses changing rounding mode and default_nan_mode for fp_status_f16.

>      set_float_exception_flags(i, &env->vfp.fp_status);
> +    set_float_exception_flags(i, &env->vfp.fp_status_f16);
>      set_float_exception_flags(0, &env->vfp.standard_fp_status);

I think you should store 0 into fp_status_f16 here.  The exception flags are
OR'ed together when reading; there's not too much point in replicating it out.


r~
