Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp411807njj;
        Thu, 1 May 2025 12:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDH8iyyULFW+VzRt0xDj4N4Pdfy/gNYPF+fQB+xhJz0btyeTPzmsom/++7k2yCALLrvsIJQN5cksTw5Q==@linaro.org
X-Received: by 2002:a05:6e02:3792:b0:3d1:97dc:2f93 with SMTP id e9e14a558f8ab-3d97c253b87mr389205ab.20.1746126382211;
        Thu, 01 May 2025 12:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746126382; cv=none;
        d=google.com; s=arc-20240605;
        b=ICds5p+9gs0Gk5uXIInA/JT8uMlOfLZxhFVF/YzxPMb6OoNycjUPZLdp9dZN50Fpov
         nRN2h1CcFh6VGC7Gw2Bu1R5rVSx28gGe0gENyC2IPGiRDtAFoN4nmZ/d+OM3cV8V89Su
         +MAB52h6gm13wOjaKYzKmbnCVVJFJJDuQPO8YI62JYZhZl3Rm+UJuvJVzb8HG5purctl
         l+TRVehPDnPQ2tRPdR1reJkbZP67VOJzQFnY1qO5SlYg5iMmdNZFjghwfS3aEuSXGe75
         6XjvU1xKLk1bFKcmVxN4zuhtUc4N4rNmG+P2ApLg8e+C1lb9+wJXP11mZc422H1wMEiz
         udKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qj22zgHL05O6e85jZdMZPreQfGsPPd3ympYXool2RfE=;
        fh=mHYJoDbF8KFk949b1aQTTfyG+WkP9FVa4Tvj/qWMDOs=;
        b=eiYAm2R7JFUpq52jZ8UPk0kxGRVSIXW6miUP9FC7WcknzbBezmVBFW58DZsaSfqHRh
         ituHDqmlZuaMCRz06lXrKnZIPuj76VQ4ekeeFvzd+cd4p2p32B8iESm6YNcGxFTixe2G
         MfOT8CUb0uEUplYRnx+PFfQzBsMP5ln1FOpUVU9CRXVqDplG58mAIbYAAp7Prm4G+Zli
         7ufVaGOA1sy68Gc12OgDDkLUDxtkoePyf7hX8rbVfmAKPvzM7eaY3V6ytUVYrc/QB1NM
         I+N0CckW0HDyqNO1UKy7IwAHNapHfh0wZVEtxRa4XHZ4RoBtj4S3rLLtnkUDWWaYxbSG
         /anw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MXcOh+hN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3d975f68fe3sor5881785ab.11.2025.05.01.12.06.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MXcOh+hN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746126382; x=1746731182; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qj22zgHL05O6e85jZdMZPreQfGsPPd3ympYXool2RfE=;
        b=MXcOh+hNC/Erj2V7LMyNZNg7c2o3bh4mICsDixuLIbtyiqdC2LoIBkzseC+vzljoFC
         s3nckSVJw8VSCJhpSJ5Tmm7z9aA00PfASgzNBWef2V442GCwhYYVaCMyQdcyItQtSL6a
         RhMnaGfRhr8ISXnsJp0GrU5kAxvzu5WbY0stcrdzA3VUAvpguYf2/mxMpyFdsYDZT9k4
         m/nrCYxdXfGZS4XUDAprCRtvyn2Rj1o7TS+V7aoihnhqoEkaXni0tU4FhWt+Flay+5Nm
         qetkf++AKZXT8xEftgLtoMQhgkkv5YMj6tYmRYUF/XViGxWhAyyeGJWcf7MERKjtx6F7
         M6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126382; x=1746731182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj22zgHL05O6e85jZdMZPreQfGsPPd3ympYXool2RfE=;
        b=YSem9nkws6LVynYHipYdWy02D5b4Ag9mgbJqEAnr41HcLmkxOquHoW8y62yHlcoNzP
         6FrhNsdkoHsE6EekLul3Rwaf/MXwLMKKUfeOoHIL9slD23nk9WbSNRXxYWtzy1+LDORk
         RNkkIeXaew9YICk4Kh3D/OhDvZs6ZYv+iJbEceYAOoKl5wRlD/yDTbOMJjszxli+cCfs
         zCoXrVdZJ5tnF6FgSSRW64V/J7tHr9MQ3NH0yd06UgCcen1eLWfeRZFX+gM2G2YJxUh3
         klW50hq1SarO0rOmM4fGhn5Jz17lpCGjW8SCZz28r8mckflX2DbH+MSXEz36Oa2BkUsc
         mGMw==
X-Forwarded-Encrypted: i=1; AJvYcCVJOrl8UMpb2O3PeWBUv6UqLjuiRnidGmh4m+iC26zbKUJ9mMc4qAjkxV0ZVWEeLy6PWqtC2Bv+hplSqw==@linaro.org
X-Gm-Message-State: AOJu0YyuImBdw0Ri+RTA2MinNY+TYgT95J0qe0kKazDYHjdWwEW3X7Tg
	HO4JWiKHHyx3fjHzhFTn94LahwDTEztSCsig7G4bHFYOYditAqdsd4dW1mNVjiQS01ysjpT42YE
	5bR0=
X-Gm-Gg: ASbGnctMaD0xBKILdOhPYDPnzgI+g+vx/5wkbIJGeJm/UzUVr1snHSUS/C5DCKkCIC7
	cpm6iqX2An4UHRvKNu2r0atlpgzIdLBpD0HcfcyMYcefkpApOTyHSuQvtXIN1DtanQ58e62/OIi
	skk4K6/N403tx5CQkKn5r6G3W9fnyTwdSIUBCWE3Yt2+d8ET2yXv86UgBWCFoN/wXJjs0CLnRFa
	GYdoUxarCiGpQruroe0JD4rPZHt5S7oQmT8Bbv1R6uIv/H1zvpUAUndvRD7biPuIOmmqphJy9k8
	CskjbrsvcDuM1DO4pzLrNkgkXSgglRCLwPr59E+g76tl2gFl4XBfDlmQiMuc/xWBlr/elxw8aGT
	dZemiLY1nh4W/Ug==
X-Google-Smtp-Source: AGHT+IEmRiAS2i9D2r6MeZjyjnR/NC+zjy6ATHPXH1vxn6/jW+cvSw68CoxCLQSSGuusRfck9NKyEg==
X-Received: by 2002:a05:6e02:218c:b0:3d8:1b0b:c930 with SMTP id e9e14a558f8ab-3d97c129edbmr736955ab.5.1746126381678;
        Thu, 01 May 2025 12:06:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975e27c99sm2745345ab.5.2025.05.01.12.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:06:21 -0700 (PDT)
Message-ID: <24662e56-d6cf-4c17-b792-e4d1ece6e241@linaro.org>
Date: Thu, 1 May 2025 21:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/33] target/arm/cpu: remove TARGET_AARCH64 around
 aarch64_cpu_dump_state common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250501062344.2526061-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: j7VgzWMN8KW9

Missing the "Why?". Answer, because it is guarded by is_a64().

Should we assert on is_a64() on entry?

On 1/5/25 08:23, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 37b11e8866f..00ae2778058 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1183,8 +1183,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>   #endif
>   }
>   
> -#ifdef TARGET_AARCH64
> -
>   static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> @@ -1342,15 +1340,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       }
>   }
>   
> -#else
> -
> -static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> -{
> -    g_assert_not_reached();
> -}
> -
> -#endif
> -
>   static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
