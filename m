Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp990341njd;
        Sat, 29 Mar 2025 00:51:24 -0700 (PDT)
X-Received: by 2002:a17:902:e550:b0:224:b60:3cd3 with SMTP id d9443c01a7336-2292f95f452mr34635955ad.19.1743234683972;
        Sat, 29 Mar 2025 00:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743234683; cv=none;
        d=google.com; s=arc-20240605;
        b=EJjkinsMETcncBofuCP7PoR2FWzRGrurH77oIw4hzmun8hBCjSwYb4ixCpQeOvvZvg
         PKpSY/gU3Jr70VkyNk3eDszUgHmyesKtBr+W6IsaFqWV8A3kqx2fSELD9xKDt/7I2mfz
         fRZPew2/hvwXPo13R0cra/vz8Su1GrPLwpP59NdwvarYbFM4JzhS8h4FgGP8avzRLS2u
         CNx7F+X0VkOzRqukTg1d8ctdigbMoY2E4kQ/KFa8vt90H49TcTolzRjdKM3/a3zumy10
         Ub6S9SP5/IVtjL59LNicbQhdgsXYv4XyLYOuKx8a0465rcK24sqobjfPpgx3q2DdQxfU
         3x1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qcF8OmGivMT1Fh1TuMbmPEQzijbAh+4wxNOe4QmmO0Y=;
        fh=FfO0sAvOg/exZUxVE6Ib8yUyPJ/kXDBIJGz9lr8bbZk=;
        b=dhrNieDZUz/kP7Ph22k6G8jORTCaOb/HKaV7cextLt0t1oydNSe7xrzqm2SbV8DTkQ
         /quz3kQUX0CPFTg7KkdmqYzUFIhSFRWP2imGltoQFo2GEDeiA/B0YSdzZi6gZAZb90Jm
         2F5eOJVLTQxxF5WytlkTsLD7/yXDxyQR5XIxmEtckrY5U33t0NPsNffBQZOoHmQRdEqN
         mFXf2pO0lgvUbQrRkgobJdLVX8z7bSysGRxm4PXmIDPfEw4iLnptHGVLlqXiXWBSh5c3
         RGPqjaYBJKuu/khtdKPUOSn0pfTMl6b6m29i8RDGBFMCG0+dRB3aAg26CzpGus3GdpAR
         Ap5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=lmrlAcS9;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2292b64a6e7sor10185205ad.1.2025.03.29.00.51.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Mar 2025 00:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=lmrlAcS9;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1743234683; x=1743839483; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcF8OmGivMT1Fh1TuMbmPEQzijbAh+4wxNOe4QmmO0Y=;
        b=lmrlAcS9mSh925deLPzuuQQGxpWmNUypeO/dfxCEOAXee72RybEa0g4ky6m3yZsK+8
         yQrD1yrSpOqFZcyrQ1/zYpx7ETKXzeZ4DbZOSY0st7oKAR3IfuK17sMgNSfIiuiAzGE4
         jXTFf6Apk2i2H1QyP6BioCgriQqgCC3DXxlPxgQUvHaSqifyonTZc5uuiTX5AVAxz8yy
         xm0Ufrn6Z9yPf31AgiTDB9tsAsXkwVZPYGmM8kGXKDQxs0nL/3TTUS4lEIL9ONRj/z2y
         MzFfbr9tUJlzDbgYDLcVeGrydAg6S+RhhZq+LH5qLqbcsv9TQoTVCnsDCX8iO2JPe+DT
         cQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743234683; x=1743839483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcF8OmGivMT1Fh1TuMbmPEQzijbAh+4wxNOe4QmmO0Y=;
        b=jnL0vCbef4UynxgkfO+kuyFjqX2M+3xSGWORSws1/UlxpL0gx5llnyQefZbfi1jKsu
         hMS2dtQ0wd467YiefSsztjX8LV8OvRshxLGwdlbgzU3IPNUo4C4yQxm5ZoumtTGOESXX
         cKiF6a2B/bVNnWwN34s5wlUebzzvzBOAdW8cdrquyIpEkyLY6OQDU17RMUP3c8tq7Xz2
         WjRPzt8hUVNEgbhK8KfP4Q/bdiSIowbHWco8eBZszpPBcZVQspa05gc0B9Z0J9mZdfka
         itK/zMIWdE/ALStjhU20/JldVj4Ico54ukdKhf/64n7NHqR9JAcP3TFP1Q1CzbtpcPr2
         /V2A==
X-Gm-Message-State: AOJu0YwvVGn8KuAUwXavyWy9hqFng3UzHJUM2dVwvWZa7eRLAWk1I2gS
	SzFFgT8G+PB6q0ZQPLpxubfqPQyk3FDndFL7jKslIgoE/ZqutEBAdj380bxSkEvo7G6EIlG67rq
	ZM10=
X-Gm-Gg: ASbGncsuQ6NLRAE7t/rqIX4IRsszVrfhCqq+CDiFppBqgR3E+gorqVSUfJms0c55g2R
	D9e6nd0aoYex6AL9O4zIVyrla7NYfsTPxaO6sXsLbvPiguwUl3pi9HoEOC5va8ajPuKYoJq5Mqu
	l66pH7rPjOGXBfpOuHtid5YPzs++SaqBsFc8SlX0tQeraqoh2a68oYX0YKUIMbkPmF4vRp5KCiC
	JG5mnh0e7A0cZbkNCkuCDooHJZge5CA+mZgY7by/ty7OUu+xSt92mNFY8/9/L38BiitRX8fstKN
	A3BmCCLUbv3AXSz+5sf0bLXNpDVkFGrfbtLmjlWvTUl39TFFmo/43RZQGIY1DeqxNSd8
X-Google-Smtp-Source: AGHT+IETu2LVoe0FLEe6PzNMHojLQ+yXSu0SS7vq+2nk/QQ2Mo9lQk4Pcc+Hw+nn7zTVyOEI69oFmQ==
X-Received: by 2002:a17:90b:51c5:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-30531e89edbmr3830613a91.0.1743234683123;
        Sat, 29 Mar 2025 00:51:23 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305175ca98asm3454180a91.45.2025.03.29.00.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 00:51:22 -0700 (PDT)
Message-ID: <4fbe53ce-047e-4efc-a0a6-f59342e1f3ea@daynix.com>
Date: Sat, 29 Mar 2025 16:51:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] include/exec: fix assert in size_memop
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-2-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250324102142.67022-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4xe7g59VmT9l

On 2025/03/24 19:21, Alex Bennée wrote:
> We can handle larger sized memops now, expand the range of the assert.
> 
> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - instead of 128 use 1 << MO_SIZE for future proofing
> ---
>   include/exec/memop.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 407a47d82c..6afe50a7d0 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
>   static inline MemOp size_memop(unsigned size)
>   {
>   #ifdef CONFIG_DEBUG_TCG
> -    /* Power of 2 up to 8.  */
> -    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
> +    /* Power of 2 up to 128.  */

It may be better to avoid writing the literal number (128) in the 
comment too.

Perhaps it is easier to simply remove the comment instead of updating it 
to explain the assertion without the literal number.
(size & (size - 1)) == 0 looks cryptic, but it can be replaced with 
is_power_of_2(), which is more obvious and will not need an explanation.

Regards,
Akihiko Odaki

> +    assert((size & (size - 1)) == 0 && size >= 1 && size <= (1 << MO_SIZE));
>   #endif
>       return (MemOp)ctz32(size);
>   }
