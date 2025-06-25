Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp919205dyb;
        Wed, 25 Jun 2025 08:12:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYLYDVsD1Q0CpdAnSXLS8/eou5aSdEVzeR05hjPPWgShwASzg5iG7UmsVwkLKxDWM1CoJytDAbCIN3tQ==@linaro.org
X-Received: by 2002:a05:6a00:2302:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-74ad4410aa8mr5718409b3a.8.1750864337087;
        Wed, 25 Jun 2025 08:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750864337; cv=none;
        d=google.com; s=arc-20240605;
        b=HlWTAQ/t9F5FN8R6FzWZnVaAr8PYwNGy1fLhkEoHROPTM3u8NUIU/cjMZBnCSO8k9E
         YWSz8eergOQUChem5cLBqV047vOaR8URKV77cxEpVsrySGiKwCOIvLR5U43O3Hol6KV9
         SysQgkj6qJKsH8e1eHyXeyu317sKbdzObkprJJjISVu9Pu3DdyTztTAQTVlR3cP8p6Ag
         8/+DZaGnf8ISVn+ZwAcAiHCwmJUcQPtnhalJ83NWgvZ35g8SOErMs1Ix/b0KZrp1hgqN
         tM9d595CW9u0VBkIZnNqJTZIxoVE8l1xtC9UC7jknoe/ZzbKzdfdNT7zhr8W8KjVhHim
         gyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/qMeMhPelSpcJ0gJ14dnSjD3jHGx1/A0gA2Na72Fbwg=;
        fh=ijygVXQcnY2r94QfqIWcERRwDAfgsFDmZusmx7neoKA=;
        b=KI7zsm3n2GFjwisO99I0QmiR6vi9s92NcI7npwhkdi5zok9dO+ua7VjSV4hP+ldHFB
         GA3DxHzkAxcDaT7jt233VsK6sTnnFTruMm2V5SAagxbphsbwl994ZM+yg1B2Hdtv4baY
         cxALzF1v9Xc7ykhUkF3Y8OkqFdDTnbzX+LC1MkMtrS2RTheRpUK7Q1PFy2HzElKA5Um8
         JnM8Zxn9neG/S59C9AqM/nYmn9xPTB45zk1CfIjWdw5HoZvh/pDGGKcIj/ocoEJyXiWz
         G141W+BstDX+rAGRHUbXS0o72YdeC+2XW2xKuIPTm5QKW6QgABEDmRaCQ62lTgWolF8m
         +4MQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrULxGhb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a58b39dsor7253285b3a.8.2025.06.25.08.12.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jun 2025 08:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrULxGhb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864336; x=1751469136; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qMeMhPelSpcJ0gJ14dnSjD3jHGx1/A0gA2Na72Fbwg=;
        b=yrULxGhbxUqM9bATHlbT0qe2rMfRLhdv2O33aOsOxNyRGXiwQeQOy4Xi9Zy9yHIMsC
         vGSVplhuncyBLgWkD0+A0EUtmXtmGet55CT3l5cZ5E6cVNo4U2xyimKdFQ3pMGIM3SQE
         APFWtochAT8Zqh81LZJtqj6fgmkx1vzN8MuXsYZorNGNTuDaGqG9JpZ/D+JoDScsHjP3
         WEAI+WNX2gM8O9Uh7v0rQotPqgKFfVsVA/Twa2l/OF32UHScT7u2sgw6iJnvFink0hmq
         ckVgI+EABW7bnnA5L+K3LHwRtuMpJBT93NCdlAr3YreFz9bPYQSaEIzqd/tSpNgKO0Em
         A6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864336; x=1751469136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qMeMhPelSpcJ0gJ14dnSjD3jHGx1/A0gA2Na72Fbwg=;
        b=vJZRUdNpYgRHgGm1fPJeOq2rFoyw158DkAil7Q0A/HOtZynCPqJkbtqjBquZOZXMwa
         12dZhi1VPapHplB4Pa0241B/ygoJJaUXQLtFeIMuIOQwFxjgWLqT6vXrbWU/MkvLFS+y
         RjhpW/acgtdIHvAgt8IXRBgIdFiK6NAqD4fgCXKrnl9Qr5jW2XzZUvRIPb6HdsA2OTz3
         AdyHIR11as2/jC9ax2XqwbT4Ne2z/tH/cX9BDfS1nZSOxcZtHfRJseSHWUwaVldNITO1
         RyTl/44C3YkYwwt84Fs7O21t4/pie66hKkfa48166GixSaflzySqJfUwE6nRAt1ee+81
         J4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUflaidbq7Z6GzJiyiLOBefi8BJu7DZFmhMZwl20sqH8PWZvobi67W77puaaEpuPsimU4+VpzYwqOJ4rw==@linaro.org
X-Gm-Message-State: AOJu0YzZlKoVSQTzpgeQux1xhjCMqDX+xqg5Hyvqf0Lumt5ntY5iis4g
	UjljvBato0cuPSI/RgujBYkkJCGzCpKc1mlTbV55MFTOtvzMAi6se7rEg2t++nxYoIQWRA==
X-Gm-Gg: ASbGnctZUQ8kWK6o3djOj8vsId0G8rjjPDRF6qYhogVEf2S8d5ER86GC84ld74ZQHIg
	xRDE54RPTQqoY5cIsivSfJ9eFWwQsNiZIFVfOl1p3Hpg7Bw0MS2B8eEP7bwNSuKud1ST0wHZqyI
	wjvYc+xdIxiaVgPoBx9jA228xKrY6Sc+cNDlrqGZcXrSvGuzak2g2/WXMXmvR3O2jmkZEIoJHzS
	Hw/Lw0NomIl82kCJcHfQkp/HUyp9BvaSJlKCpxaYHniNI3RhENoG5VmB5+ic0i7jlXlFhCVia98
	ZVKS5XI/NMPd8yD0OO1e/nxrp0Pu4c0OT9Jw1y/2ihutn7qVU0RFvXhVRpLqQ0r+WwymYmUw4Bn
	esmkvYdwyhA==
X-Google-Smtp-Source: AGHT+IGCI4OltHnjeZ8wmnsoagl2YId79GZjZBNxf6qaTX19UI8dhcybN5J4UzW7CwbjgTdGFziIHg==
X-Received: by 2002:a05:6a00:2302:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-74ad4410aa8mr5718334b3a.8.1750864336323;
        Wed, 25 Jun 2025 08:12:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e09750sm4695867b3a.26.2025.06.25.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:12:15 -0700 (PDT)
Message-ID: <b5005da8-ff10-4644-8815-b288a719e0ee@linaro.org>
Date: Wed, 25 Jun 2025 08:12:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/26] target/arm/hvf: Directly re-lock BQL after
 hv_vcpu_run()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani
 <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250623121845.7214-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JK9VHP4Dklty

On 6/23/25 5:18 AM, Philippe Mathieu-Daudé wrote:
> Keep bql_unlock() / bql_lock() close.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index c1ed8b510db..ef76dcd28de 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1914,7 +1914,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>       flush_cpu_state(cpu);
>   
>       bql_unlock();
> -    assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
> +    r = hv_vcpu_run(cpu->accel->fd);
> +    bql_lock();
> +    assert_hvf_ok(r);
>   
>       /* handle VMEXIT */
>       uint64_t exit_reason = hvf_exit->reason;
> @@ -1922,7 +1924,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>       uint32_t ec = syn_get_ec(syndrome);
>   
>       ret = 0;
> -    bql_lock();
>       switch (exit_reason) {
>       case HV_EXIT_REASON_EXCEPTION:
>           /* This is the main one, handle below. */

Just moves the lock a few lines up, does not impact what is protected.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
