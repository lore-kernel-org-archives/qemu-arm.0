Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2608966njj;
        Mon, 5 May 2025 10:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJvkPZt3S++X/WgRwaxR/Ux3jhDNvmMFQbXAWWnOrp6iTxg3LJnR6yeHAa9SP6d7id798/SwCOz7GWzQ==@linaro.org
X-Received: by 2002:a05:6a00:e1b:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-7406f0d9ef8mr10950663b3a.13.1746466897532;
        Mon, 05 May 2025 10:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746466897; cv=none;
        d=google.com; s=arc-20240605;
        b=Zs0PjzjdjNSRDJGr52PXYd/mpveT8YLY1wu2x+2dI+TjQzbq96wGRNfmPM3eeBaq2a
         8salka3QONOio0E4JEL9221W/e5t4Nk6y+b/EhiYPQXQsO1tLRw2XS6XMEwXUHHz0QlE
         tOd2ZP2OZGe+L6j/+YFrpqWtQUCj4tfcys647zjGHT5olTy+SqMrqUKkUPXANlstl1dD
         4WjuRV+7/+34lfsmnRlyPB/OGx13SYFNIAqDychmto1bcVUSlJq/2rQrx6kMNLkiA7fa
         C7lEU8hIWd2xDOFyBEX3WXeOQL9OukG/yhx5AmBxGBBqCc+TuekwTMH+OzS0/ZB53HFb
         cmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ew70U3lTDz5hC+3m9yRbzo9z4bHliR8+n+FYQbakwuQ=;
        fh=SMBzZxGr2EU5dqQUDvXHEcrPXLOEk5SbJBv6yHeYvFo=;
        b=eGhYjQNwVz97neXPJ22eapCzGgAukbnpyGnxmKcEPaWTukecZ4W/SXFGz0b4CqAkqP
         OM6bMgEWb0jGAjod3FLuNZJODTdzWzan7G+ck9JwiwxKvMy1z8z035j3hbeS7gXmdisE
         poxYNvSlaa9rbsKbnfRLRgi2CVMEv1VGIXlL0r9x5YtDZBVIGor0JkKFrD98MVlxS0kB
         yQdHS0RBrKOT4KiI+S1t5afWtD9w2uFexgOcIyq0YzTVSBo8f4bkvIoeGGzsGwPuRBov
         3XvzuRTmSdRZrqUbayO5yyGLazedLzjWv4fdVGBO9Fj69dXBC+Tnw6U/RGiS9G/yGT0i
         cvwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHMv6M4C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5a32e7sor3845411b3a.0.2025.05.05.10.41.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 10:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHMv6M4C;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746466897; x=1747071697; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew70U3lTDz5hC+3m9yRbzo9z4bHliR8+n+FYQbakwuQ=;
        b=uHMv6M4CQH4WFXWs7Hu4ibWyaGgMvuHNHLysFqc3HUJDLP5oDtUbOV0lr9hd47lT+9
         0Ky4jGDO/aEwxfmyFiqFMeWRA6cu7DDSV09e5gVckaitKSFMdxqWqlAdP/X1O+eJEoQd
         gp1+aEDUfnyWV07X0RHLqHxXFXOinDsG0v9rj800qG4dpaeux8mqTqFGR+D9vf1cnvxO
         4h8OD0OFc9fZXARGyDJh9/ogiN63jyz1JkuJFX/bD+0YmRprzdGgIPZGSKq4XyvN8B0Z
         WPrxmQyLzD47IjKJBMEYaxGzAdcj+W3IDzhL9viHFpyPlMN3v8Y6+bZAlqskUw3CoFQb
         wCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746466897; x=1747071697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew70U3lTDz5hC+3m9yRbzo9z4bHliR8+n+FYQbakwuQ=;
        b=DXsld5Kzdynow5gBqkXd8mVPQ4yeS+fEdQiX4lZquKfpZFuKxANYHTY3pIA9Rtvrhk
         nrDnwYGqOcIaALyBNqXNLim6ub9H1pfxmRx9eqx2rwoozcOvwNWfab6Rv6y8bv0RHmPk
         35M0IGpkn6TYMqPmySoa6IfvvlEKnPuu2WwqOLKB+67l56prV65fjeyD+JmtANU7gGLf
         +FSMLs8znqzkaHGPFy00qs6NM5r9Plm3gtqjzkvbUCvGuJ/oyYCWr3M9RPC1odkUplJZ
         igLgbTBYbu4Hc5V6I85+xfnF2ZpvSpBPtbFaVhgv2q1aey/DYDF7RtSEeuoh1CqmrTfh
         9O1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8/861jnAPRfHKOMFmmWY7DQnOF1nsn65+ZaikdhSkT+YPsQZsVN9P054E1RowOO9keBcN9/XVxB6B9w==@linaro.org
X-Gm-Message-State: AOJu0YzTKDuCo8t9UFAZfidjvfo06Qyq/k+o2VHp3Z7LyIw7hX6t74rd
	hWrF1ZybSpwxnm79dJvrsVQtpXOWDUQdrhd/npiYH7OXROlzxo3WaXrhfhyAzZae9w==
X-Gm-Gg: ASbGncs6TX6Zyup5upnkxpZnXi4HQTiyzsWxrHn2K4qGLD+2F94MpN9Ij5dwn0Zkwtv
	cimYoYb1aDkmLM1eYHNCpOUZICF3t6oSqQoSnrKPgYg7vlCpK0u7YXDLN+UyHEvPd+beuZzQzBM
	SkEDTYz6dOXeB8+1RUQ/sNrvayqR+6ABeu6/MkHJm/uf0XGaLml0UZZZYK5iKlnK/sRBfaMzWpa
	grsuQZXIS6dkkGCrA8sGw1Dn9GbP269pnYTR0B59MiQFDP5Q+OFgAYnouBYpgf1pDKmNnfYWXV1
	lHQfJRMwk0gAc2AyJTdgJ0qjrbZ5WqXQe+Hcx4ovt+PP3/Si1CLlnQ==
X-Google-Smtp-Source: AGHT+IFXaEzxiofDDELYqsPn04eZnaz8QiBcTf59KURdaK3Y2tALU7ijUKo8RT9o0LZf1B9L0ObdVw==
X-Received: by 2002:a05:6a00:1d8f:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-7406f0d9ea2mr9996738b3a.11.1746466897088;
        Mon, 05 May 2025 10:41:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590238f5sm7100162b3a.88.2025.05.05.10.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 10:41:36 -0700 (PDT)
Message-ID: <4e7c2d18-dec2-4a49-9f1c-35e057ba8874@linaro.org>
Date: Mon, 5 May 2025 10:41:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/48] meson: apply target config for picking files
 from libsystem and libuser
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-5-pierrick.bouvier@linaro.org>
 <857f0b9f-e58b-48a1-87af-49c3c52b379a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <857f0b9f-e58b-48a1-87af-49c3c52b379a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9NSzq0Sdx8FY

On 5/5/25 9:59 AM, Richard Henderson wrote:
> On 5/4/25 18:51, Pierrick Bouvier wrote:
>> semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
>> However, this is a target configuration, so we need to apply it to the
>> libsystem libuser source sets.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    meson.build | 26 ++++++++++++++------------
>>    1 file changed, 14 insertions(+), 12 deletions(-)
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I'm not quite sure how this is supposed to work.  It appears this compiles everything in
> libsystem_ss, and then later selects whether the individual objects should be included in
> the link.  This is fine for internal CONFIG like SEMIHOSTING, but won't be fine for a
> CONFIG that implies external dependencies like VNC.
>

The trick used in our build system is that static libraries are never 
fully compiled (no archive is created), but everything is done by 
extracting objects matching sources available after config. It's a bit 
weird, but it works. I understand it was done this way to avoid creating 
specific static libraries per QEMU target.

Before this patch libsystem was including all object files by default 
(thus the link error with --disable-tcg in Philippe series), while now, 
it selects them based on target config, so it's a subset.

In short: Static libraries in QEMU build system are just virtual sets of 
files (sharing flags and dependencies), and only a subset is included in 
each binary based on target config.

> I guess we can think about externals later, if it becomes an issue.
> 

Most of our external dependencies are not set as required, so if no 
object files selected uses it, it should link fine without the 
dependency being present on linker command line.

> 
> r~
> 
