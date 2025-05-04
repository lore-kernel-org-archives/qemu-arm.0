Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1990607njj;
        Sun, 4 May 2025 09:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQWTzEizFFxmYWLcdB046eDubLKSvAokqBPXiTBdXTSgLrxILOttYZLXT58RRHmXrw7wdDxxzOiOhNiA==@linaro.org
X-Received: by 2002:a17:90b:2703:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-30a6199f2d8mr7690121a91.18.1746375428460;
        Sun, 04 May 2025 09:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375428; cv=none;
        d=google.com; s=arc-20240605;
        b=XxquyoMrdqtnzLQw/fwVozFTu6IUFg/2ElTX4gODOwKu24evZFOdxbGEjpB9UJrW9Y
         ZESTTtqqa60pb1AnjCKMnhCWHuhkrlH226MmzjM4jtp7bU/YUSaoum73BoHxN2nCkSRF
         brr852jCmqby7rxjjvV+9X0CF8AiOlTwtedWoWT1fq03GFAYUIQHXppeKTYVeXZOs9RP
         xF7BEG8NS5W8HY0pIGMAIBlqNgqfqJk+vJ/xRmH/HOxYQnjMvf/QIi3DVW70sjw5GGhi
         KSROmrryWSQ5K+QenlA3b3Mjvbk96nDnI4osNzpgn20ZJpa6Mjr0GN3f0un1FIGGrNtp
         pYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gPGn+MwZnc8xQd76t/xYLdPoUTnlVwwJ6Dg5FznPQUQ=;
        fh=hdLS74AjOYn3KaD8BrjhZbaonkyeT/deJ68Maw/7UEs=;
        b=e0B3dBr8F7hxGCs787UFqPKKBIlyLZtbrH9GMs0csUmZ8VlpwtW+FcWlk9NvtYen2O
         P8uVBlSEIz2uxLi6o5TDS90/ovviJ5qrumZrQzlNJO4ZxlxZptmnZE7hH1aAfPAf16mM
         GoOg/QUZxN6OudacOawqdtErmcs3MMga+KkK4G0xgqUYR4nvNA+Sq40tPQC8ftaq6fDb
         jKIXFEI/ax+62bJ4ORC9MePcYoTiJTyR0jH6zlRB9gOEvTFjgdEaVef3o9XAtuxJrxBG
         ZlA4lgt0wTVZj9foDDTzf27RemKjWf9DtKTR+33R0fQrLCPVkXoULT2q9hk1dW4+5qP3
         jiaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o42ObaXU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d6403bdsor3528363a12.6.2025.05.04.09.17.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o42ObaXU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375428; x=1746980228; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPGn+MwZnc8xQd76t/xYLdPoUTnlVwwJ6Dg5FznPQUQ=;
        b=o42ObaXUivyVFIcwRiRKgc2Ivz81faZOjBCfJfKhfo7v+T/5YoHWYJFJzPZnIhDMoX
         i9qxhkTWsw5uzEGM1IMj+11x4JtCDPT6SJDNVoGF8wWwanUGrcmrOTLjgZjc77I1NkzY
         84r7Nj2M8hUnNBB/SjQEn6yN/6XG0A5NSvhdNUXh9Jo4UnYmVxPrnnr4sPRgQErHgfnP
         fDEzcCK+5yQp2sW1N6VzTbj6XYuK80oD5tVVtbcYeydqChM7+FshSNoynTEUwqf0M7u4
         NrpBEtIDArl81dIen1py6GGD84BYAB4xN4okkG5h4+d7mxGrb38DElVu/LwsVJgERSnk
         eanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375428; x=1746980228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPGn+MwZnc8xQd76t/xYLdPoUTnlVwwJ6Dg5FznPQUQ=;
        b=aWbIicl3GRgwheTGCbyEK4tx7PawzTllKuc86pFsTU7ozBrUy8QTdyyVwOB3z6GQsy
         nQCm1v5UxZzcBmii5kU7yaW+pyEevPovIJzB4bSpyP7weNln1atnzx8VAjiQaEXAaYUp
         GlKUUkMmpXYa/nsFpgG2YnGgqX+IbAxQ6T9LydQ8zSNz0GnEJjSBBQ22tk2RwUchWJ3x
         GO2uhgG+3JHNhLUFAoXJy4iFfrWrpoa5YJPzRpS+gr/Ubk1FnLVCv66aejQGrZneLul9
         a8p/zhU8dGd6nBbIuCWyoXCc34TErl8YAqgBa7nVEVapB4XnLAHtI2my1PzW4LZz2r2e
         xuxA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ext6JiL2lQcTkK30/UJWgvlCrqVgUoXtr93CxzUvtnxuzEWA2ZBsg1ykhvxRTWrjV6LY7Ilr0DNfqg==@linaro.org
X-Gm-Message-State: AOJu0YzeHPxcrm1u/9XOBK2M8yfW4U3l68sBMw/x9iykcoUGSq/I6rnF
	Are7+ttGxpspd7J6FIcJ5wSPy8PJnZbAFq0hn+9UNhz6zm1/uX7E2XpzDISyVPwi9A==
X-Gm-Gg: ASbGncsJTdMuCsqm/lFEGaozypMpbniUQ+AKkxMl5OcytCu6DknDcIPaaKJisJPCF9x
	BAfC9IqTOgl31+tlo6gUT3alxAay3ruaHXOFAJwS3tf7/bodN+xMUVPhxx5l2mBOSGC0izNM/9x
	GC6uSXIW1H7taeej7B1+l6CXbEHol4iJzYQnS0hLhwrwYUgtUi9z+SQT+B7b6Dhy6BTTu6azWc+
	2bW4g5wpV8OLoKGAW41EXJ7WEZkMF0ZBsr6B0m/RZZ9RHtR8BjweOuhBf8tgR9+ypid+FNuDO8x
	lFbBrL0ds5BdRvigKDhQrgtSUH/e3gXLoay59ZLfSIwEUavO1fIBCY0pww00tG2hjsu7FOXrAcE
	6KB6tis0=
X-Google-Smtp-Source: AGHT+IF3G5/bfGBl5sy8J3dBUbGQQ6KrLbeTzkDrhzSDPBYgiKocLSfoMUYlYUoHUsjZG5gmsH1W8g==
X-Received: by 2002:a05:6a21:9614:b0:1f5:769a:a4bf with SMTP id adf61e73a8af0-20e97eaa02amr6564145637.36.1746375428049;
        Sun, 04 May 2025 09:17:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7afd4sm3293173a12.33.2025.05.04.09.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:17:07 -0700 (PDT)
Message-ID: <5b152664-a752-4be8-aa15-8c71c040b026@linaro.org>
Date: Sun, 4 May 2025 09:17:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/40] target/arm/helper: use vaddr instead of
 target_ulong for probe_access
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-17-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-17-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iEUuB2srbpEx

On 5/3/25 22:28, Pierrick Bouvier wrote:
> +++ b/target/arm/tcg/translate-a64.c
> @@ -258,7 +258,7 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
>   static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
>                                MMUAccessType acc, int log2_size)
>   {
> -    gen_helper_probe_access(tcg_env, ptr,
> +    gen_helper_probe_access(tcg_env, (TCGv_vaddr) ptr,
>                               tcg_constant_i32(acc),
>                               tcg_constant_i32(get_mem_index(s)),
>                               tcg_constant_i32(1 << log2_size));

This cast is incorrect.
You need something akin to tcg_gen_trunc_i64_ptr.

Alternately, do not create TCGv_vaddr as a distinct type,
but simply a #define for either TCGv_{i32,i64}.

In this case, it'll be TCGv_i64 and everything will match.


r~

