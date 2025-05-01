Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp426256njj;
        Thu, 1 May 2025 12:35:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPGRBofaAMZeqApOqfjOIdNChuIs9N7gTPcK+uII7a4TFaZwnpCEPx8fX7xqPz1NOHCt5ndQd4VZcHAQ==@linaro.org
X-Received: by 2002:a05:6602:4018:b0:85b:538e:1faf with SMTP id ca18e2360f4ac-866b424e2f0mr61749139f.7.1746128117005;
        Thu, 01 May 2025 12:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746128116; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7FhitkH4OHeTnHhVYFKVKBoTYoBa58qHMNKC5AuuoviPLJDJDCnf+EfbdGvqt/Be9
         ++ysOJRpjU7jguzoLfcPQnAnHXfwUscpP68VE/AJMV6trWmHr89EGBCEI3SZJmuEQJLr
         bMw3sEekph8XzPKaWBApHOclS7jOHCa5zHkIzy9A1/fu8LM2rVSp6c0MyVe8XoO2nXqd
         04KfSZTAY5jdSMjOMg9wkDGVqx0qIcfSEHvWYF7XlBtIzZ5U8KJhlsqohjnRDeH8oKW6
         o9bi4QzjHaRFSXxYpzInQ4XGsvCDMfugzEBRF1OJm2QznyoDPNat794oVPq/g+hDFRix
         Xs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=doptPJHNTX3efdtdZHHQCZKFb5/ogmLoNZ91COmEnTY=;
        fh=n3jeNr+bX+s8N9VREwq8bgXH7xnxJbW+6nwETS6Vmiw=;
        b=M2zltuvHHvgyet1Ir19uwnIDfMRAoh2x+LsRdT2Jg1ERPCiCU4eaw91zE8HLUV59Sn
         snRpzzSjig6jZXXGZ8Jp9YPqb3HaJVuq1GwlTZsXylQaEiplmSevelhCBfkun7460qEV
         KYWJWA8dw+VMQ8h6xeUoY6ZcmsnrnDnC2rohaIeninMNEzpq3rp+eZloAZ3Wpb73ofHR
         1UIe+nzekzGSylWQSCztO/rHrWGhD1ydyF4daarpRIenHMiaci+8JcasJjvjM+QCW59Q
         jnbzp5IuLrrbtY4aaNDC6Dpb11EZK4fVelc4dFyR7pGQ5srRgr5x7T2v5NkxhckMmynE
         1Lmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nS1JdddP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4f882fa018dsor741924173.9.2025.05.01.12.35.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nS1JdddP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746128116; x=1746732916; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doptPJHNTX3efdtdZHHQCZKFb5/ogmLoNZ91COmEnTY=;
        b=nS1JdddPmyojWLUtQISyfWuIXyzM9LyQ8kBrTKuKJawj0DnTaY0tD4lCD7OAj8iTuQ
         JTGZNxDyfXdc4McH1mLbz8LWfQscbOFEdeBZitHaRK3k3wpEpuH1BsjuAACiX1jZygjb
         zNskR01osHSrjEc6K53AfGSdYRBn1W+qlv6LTmDBaH4DVjem3S5b5lXmjiW9YnUW1Bq/
         gC3atxvl46IgkBaLB1WVcvFjl04cWgZmH/6PMbQN5Vlxar7oYODwPeiD8hrYdw7cYZJN
         1GJOVXuXH3Z3koDXWqDPwczpoYt7VG2WnB6+a+BG6VuFqPaNZRzba3A4zf0e4+Z6Yplb
         535w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128116; x=1746732916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doptPJHNTX3efdtdZHHQCZKFb5/ogmLoNZ91COmEnTY=;
        b=s7NIv4qJqKdWvszOjyVpDD2SLQmeB0ENQ1a8oclCc9caDfws3oMxcnw9fVZKePHG9G
         chyHqkvCKldodsWuIz42RJAiFqY4GVRuctAKhYZ56BIikg7fA/er6DUTkiHCUw/CXW6B
         MXUjG80zkI/OqNuLZCERtXH7uDyfU4VI+lmfE2ZbZ6D0P5vZZJThXHhATGvmshDvkyO7
         5b51k+2cDT4l+ndkfNOZ7iStzuXIeHRAObd4wqm/peK48ButpGkHITh0prxfB9SJ/ch2
         Ay6wGz+yjV2cLSpmrNxToXEqccpRRwuYce+dXMpMoPj076vPd6fxEmkxGG7dy4Zv6lM3
         5/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ48wQixBnuG9ehHsU5/SITAnQ/mSHk/pJlLn1lX88KN4OozNfH1dXwA/d+k3RjGVFlH1w2wNS6iZ3Nw==@linaro.org
X-Gm-Message-State: AOJu0Yyc47U3Ep4p4Oa/TZ5HI7vKsp+ASFrIbFw+NxMkDG/JeZTq8eYj
	w+VdnxaBtANks4ImO0NiqkXJMJqqCDxlUb2GOzLalXxHpN6hEFyKMWyEIzwRYwg5rg==
X-Gm-Gg: ASbGncvct2Y8Krl6aFKUBDwc227eKzL+66oJDtTbSbYXLnqm8kxuqJFEA+0Oc1El96x
	vummOuqZqaKVjh4LXG3l43i2PANXB9wm3K5rm9ar2gH7LnbQi9ep4DYP1zwjpqNopWit170EaSJ
	xBjSpE0vUE97MtAja+lnXsjQjImIZy4rFuKjO9Lj1mymjHbBD9t8nZMAV/QCKMgBTAz9II3Kqps
	+GWfzy2dJ3uOvqYlxHD3OAxXmTqMGZpJCOQhKeXqWlv99ASPlLo53eOoxako+DigY4F8cLj6Bpd
	2JSb62B2mmy5j5Sp75aiIlF+RTXz2s9hyndABdnnfBthQmFKzZD2gBC4j1Guk0e2ky9WVuEbuji
	uNX0/CeclHVuxvg==
X-Google-Smtp-Source: AGHT+IEsLtLhUNgdAp+p0rJEpvTqY2CYZqSy/735WowJEunJNXpSHddb1hTwFvyRnYt3F+iH6gsyCw==
X-Received: by 2002:a05:6e02:1b03:b0:3d5:7f32:8d24 with SMTP id e9e14a558f8ab-3d97c2272c5mr2037515ab.15.1746128116614;
        Thu, 01 May 2025 12:35:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa959f9sm9995173.130.2025.05.01.12.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:35:16 -0700 (PDT)
Message-ID: <21d32a4f-8954-4a36-ba0d-6cb7a50f242d@linaro.org>
Date: Thu, 1 May 2025 21:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/33] target/arm/ptw: replace target_ulong with
 uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: B5LqlV337Kvp

On 1/5/25 08:23, Pierrick Bouvier wrote:
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

Alternatively size_t.

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

Maybe use int64_t for signed? Anyway, pre-existing, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           if (-top_bits != param.select) {
>               /* The gap between the two regions is a Translation fault */
