Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3212602njc;
        Wed, 16 Apr 2025 02:37:50 -0700 (PDT)
X-Received: by 2002:a05:600c:1d9e:b0:43d:fa59:bced with SMTP id 5b1f17b1804b1-4405d6cc4e5mr12842135e9.32.1744796269723;
        Wed, 16 Apr 2025 02:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744796269; cv=none;
        d=google.com; s=arc-20240605;
        b=G5OFOt2hDrVfiIijG6nWRaxRnBfWTaNJH4WuWwwUbF3awv/Qv+1y/7HGdBYFEXX9Mo
         8/RUEMAnC0FRxVTpUOGFJVz10eAUHkVQMhM82/qQ5I8ysexy3SdctlhqUdCuB0EKt7Zz
         PR4ki/ccXzVVt4/GN50ooxsER6OsL0K6Q1H/Qu5vhfs7LD3rb94NEbcwBSeDyuTwwle4
         ABfV2wDS4zKwoA5ei8AEFBgCxSP5GIj2xtX5OzrDONHO/VIkVfH3Up121P6UsxQIsIhX
         EPD1c+SOQKDK9YF6r6k7mIqumhtFctsbztoHzaqV4UMwnAvuEmZzDu5g8cBS9DnZyh0d
         0Dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sQOBlieVx7DwZK+XD/QwOsduptdXBd3npEDwZEx3ATA=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=co9PWiVybo55m7ljiby4ScfPbkRYKTRGfVcXnAAnvOz6iSZZ9CvBAM4vzCYCmqlntZ
         SE8yG8Wh+HDYd+CvGjw+dwsjaCNyIE9FQdS3BJwQhCukTes4DElb+49648h5Cgdg2Ufg
         tT3soXwcVUkq5hxTmZ8KEavrlg2m1RHiBDY3VIQdp69rUtiovsZA/bH0JS5UF9d2c+fG
         IhHr7AFT0n2ym3IMRmSY6IZmpENXi2XE5HADvEKDxyYInz73pyxHPMoiqQFRpnYtWH6A
         N00sk7v0R+Q9ZvjZOnYt0yoJBh/D8u/zs122O0u6Ux8DKHkZToAEUOw+M0NOk3KHwGvk
         LWyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDozfdPL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f30aa7160sor49645075e9.7.2025.04.16.02.37.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDozfdPL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744796269; x=1745401069; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQOBlieVx7DwZK+XD/QwOsduptdXBd3npEDwZEx3ATA=;
        b=SDozfdPLVQ4GFSITlNw/Fv/Xi4x8L4wRsjx9BHRIHD5nPo64DjIYfrhdimiPpGLodc
         5jHVt1SWtU7EqTlVzmKblSSOfBkepvXydbuIfIqPey/jjSqfqyos4G/kSKXsPHCpv7Pp
         jZP94jFovH7nROp8C2M9xeoXf+NNOc6bSm7rh7G6OsVNrKQ+9GO4BWxNNOQXCfBwMTTh
         /xkQF2fv7JyNOtUW2fpdeqMJf1ecw+LYfQRDYeNn/fCB2/sCyM6Ee5K4FWf0yS9/5Ivv
         H4gsg1YxiyWUqQdTn4Z0JvZHHQLHu8RlVgfyzpmWi6jC+1VIQ0XwQva7jOsq7LEgfS4I
         VZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796269; x=1745401069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQOBlieVx7DwZK+XD/QwOsduptdXBd3npEDwZEx3ATA=;
        b=PZ3svA8xDGUREEhL4k14Dg9DfopFyFndKPHaW11sictEYQXpywxhETOvZKJ1mqQtpT
         f2aDXYrHloe1nn/bLxBrRAuNeLdEDnYHGMKZkVFfUVSiop41GAD6d7b2deck0RhP4Fgh
         hUE7YVe9CTYcIf5LufPjf6PcxDArnavIexJeUKEQhWh1b3HD8teL7zs7eZoQ29m0JF79
         l9gV42v8RvB+EobZiUbycbXvvjQhLLF/42iWRD9UgGNBRis01KK6Q4GeICFV0CL9/NAg
         QvzyDvsx6SQUG7lW90jYGruZpqE0hL8b83pZ7fXViYuTjoAwT9hOkSjG2DqEZn88dH2V
         PIFg==
X-Gm-Message-State: AOJu0Yz0UzTEshNEJsdCQqkAVd+GuZ+oplQL0OqphLqIFuz0gIBEokcw
	5TPa0ZLO1Ld6kgfVFaI5igxEJePPwUByBFttYxRZi1VV13W/dQhBu6hotvL+2D8qUA==
X-Gm-Gg: ASbGncvUZ1iMPMzcr3bPN9bG2KNh2Ldsr5fS9JXaelykJPis8+ryuUjqmfefP+r4vvU
	akcmHpurIskjqCSiNgjYoSlRPgVa1AQPBLwXXAhr4+9naoXwntql6WRTJKXgc2wqxZfnCjInFBu
	6ccMTKAd5gY9x3uQ6SoOjlwb1Qtc003Y99Fa3nbifRmBp/nc/6Em0eFKBh7P9wPPiYtGKA3gXK2
	Pw+TRaICOZ7nW4ZL/JMi/vmzISl1ns5kv/+Ajzaa0wNiK8rJ6FBRNer6PeXbnhChim9jpGxhxGC
	sULwzr8m8+zteZxX47yy88yr2vahhZgIIknNSxTcXL575J93UNXl61SsGMdrYKRAtY7qU1qMzEz
	16W+Z8e/o/QtC+g==
X-Google-Smtp-Source: AGHT+IEbSJP+SdgI0tcHZOmu0kOzUlAeAcfUCVoNz3lD99jqt3F6Q/0K0L5eP2XrHzbEXTRek9UMRg==
X-Received: by 2002:a5d:6485:0:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-39ee5b37b83mr1219460f8f.27.1744796269150;
        Wed, 16 Apr 2025 02:37:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979615sm17040199f8f.54.2025.04.16.02.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:37:48 -0700 (PDT)
Message-ID: <29330430-61a8-42c8-a87c-259f0cdbefe0@linaro.org>
Date: Wed, 16 Apr 2025 11:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] util/cacheflush.c: Update cache flushing mechanism
 for Emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <97a2164b3f428265136bb1c01615a16b516138c2.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <97a2164b3f428265136bb1c01615a16b516138c2.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FiXyhNzhGbdZ

The "why?" isn't clearly described.

On 16/4/25 10:14, Kohei Tokunaga wrote:
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/qemu/cacheflush.h | 3 ++-
>   util/cacheflush.c         | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
> index ae20bcda73..84969801e3 100644
> --- a/include/qemu/cacheflush.h
> +++ b/include/qemu/cacheflush.h
> @@ -19,7 +19,8 @@
>    * mappings of the same physical page(s).
>    */
>   
> -#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) \
> +    || defined(EMSCRIPTEN)
>   
>   static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
>   {
> diff --git a/util/cacheflush.c b/util/cacheflush.c
> index 1d12899a39..e5aa256cd8 100644
> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -225,7 +225,8 @@ static void __attribute__((constructor)) init_cache_info(void)
>    * Architecture (+ OS) specific cache flushing mechanisms.
>    */
>   
> -#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) || \
> +    defined(EMSCRIPTEN)
>   
>   /* Caches are coherent and do not require flushing; symbol inline. */
>   
