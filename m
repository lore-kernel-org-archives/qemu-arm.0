Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1159079njm;
        Wed, 30 Apr 2025 11:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUM03pl1VIkYIv8IQN9CYkofOCHFrp9kr6D5SZvjN1SRzLDw5VA7Uf7g6E93cWmXIdQQQM7YYjFLKxLg==@linaro.org
X-Received: by 2002:a05:6a00:3c96:b0:736:a8db:93b8 with SMTP id d2e1a72fcca58-7404775cdc7mr73931b3a.3.1746038715257;
        Wed, 30 Apr 2025 11:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038715; cv=none;
        d=google.com; s=arc-20240605;
        b=hPfz+ojP5aPRaCRyW1KCBDmzscrSjmOH22Kww1lgQN0onR30SQlG8trfAzEg1S9Ykp
         25Y8oVWz3Utog8aTt9w+gIFZBUsgNelDOlIzxiy3csZqL8jiw7yRZvEwpfZ2JB80RFga
         DLmCtMgq3z+mIUyrfzqr1jlddTgZgfdjHyczQBa9YpKQddRBpH5TBWEYJ6E4BW3tap4H
         TNAYxmSF/pp7vsgja7Jq5s6+XsBplBNwudD05EiDD5IUpDZIDUQkHDpkJNx1CcQCndwy
         A67dBatnhboVQI7e/nuN1XQF/gaXWcJLa8tgZarMaQqyBSskOOPgP+AzC1pJfRi9Lwdr
         Sytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fsQTa6aM8pUm6+W+yQoeVEUdk05s2En8LozWleTdmgY=;
        fh=hcVSrphBJiQ4w14QQWpGA5ftbCxnwM0DbmGSyHZtIVc=;
        b=UPUTKIs9Gm3CwekkEdhAuXjMbCrGu2VF1SDu6AUptZGEQWqTg3e+KIjAqqlJuQoiXq
         DHqvT2dBed6a/X0JMDQVZf9ehoPdtuP/O9zc6tBuoOPjBh/PtBFFlC/3CmelpP+sb9eC
         t8VfRBWlgppcSdCEkCXT1VToijg0s2KAteyhIlzgwyhiQjlBrUVsS5df/jhr9ofWoJWe
         OApq3LNy7vrXd8/6+5/eMPNtOL+9dgmiAsu/Qz/cfDq8rvcivYeYJYmXQJX6ibtDQUqs
         qKZwGFWlgRMeMYumbreL8U44Sd8Ewc2qsVRWphIt4q8PkC7aIK4kJf0rs2tdD2TxJCSZ
         yKwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZMpJ3oc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e25a61c4bsor11803365b3a.9.2025.04.30.11.45.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZMpJ3oc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038715; x=1746643515; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsQTa6aM8pUm6+W+yQoeVEUdk05s2En8LozWleTdmgY=;
        b=SZMpJ3oclmLpy25PlgWsIbv0J6LcaFQr21WXLESF4ngTycTJ+1F+cNxngs0glHozYJ
         rXVBMKQtenXV6AM7vPbZt4mG+ZDQKEpE8u7cthaVI3aWhvWcWDfTkyqsdJAgna0DmB+K
         0gKI7WH03QGY+9a3ByLrb6PGa1HbNih5j/K3jdeW3UUyIb/1l2ofZ4AL8tAFZQaPQdXW
         muy/IhblnvJ5dEw4IJZ0lyYWQ8+pq/L84NXTdPCQ/x1fWp96TxBTFIJX0mMrBFMRqpvp
         3amJviMtKQ4kC9a5xbIAG4oUNWRcXBO5RuPxqRQeuMrnbMS15S+b4LxP/fnRxpoJsk/s
         BrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038715; x=1746643515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsQTa6aM8pUm6+W+yQoeVEUdk05s2En8LozWleTdmgY=;
        b=cGxsY7yxW5379TTLTLf2/NYSxh5k6qc1Eog10UpfjNWu9KuZnQ+a219AU3lkK9X7EK
         w1KsXGkm0GOu6C11GiVhE/WP46lD3eUjeGBwpylpuU9wcnac5WCQpVV+fcTN/jxadtdz
         Z5l/Bk3lypBjUw/g5y0CZoi5WqbTF/+PNWl8AZqYHlifIdQkT95zNui1h1pT+nSGFA34
         ASw8dsFWy1gb+pw/dKx2k0s/9YEehcrrkledH/FJvK5TboBWsK1FD0sq14cizjW7lRqi
         jznW62U9W6nioG3Neil/AHB/WGn12OPhBoIYJ4SOIZbwJQiTsJI1mYssikfyi0C5zEWg
         eyLg==
X-Forwarded-Encrypted: i=1; AJvYcCVVM71P91Cz3ppsHYlH+/XeRKuq6JNibgJywl6vx28J1NHt7uR2oIVfo30MHWWq8ifNvVwYsUaAEbjSDw==@linaro.org
X-Gm-Message-State: AOJu0YxJY2ymrqMlNS6sjwL6NbXH17Y8xVe1wjxtxGhxw2egVDrfIv55
	Hfguvhv7dS4xkHiX74AVuwrvuumMt1vFOfVZva3DBlLeef6aJYvMtZHjjj3NYMs1rQ==
X-Gm-Gg: ASbGncv2L1SMZIlcAITl/fp2XYso+m583OydEnb5ddrVHoebRkVH6+pSFl/z5yH+/8h
	cU+6pjpE+c92FrBm5PTEJcqRsTFcZfar7Mw2DvLuU1utZLkzrFmIk8Dg4+T2KhPf146ZqpHy8kS
	Y+2o+ybQsTBuXb1Vivqt6TCb99jB/qLUS/LfUFlLJmxE4g8m+htRMGjjpWObaX6DtKV35pP+Dep
	ii+MkI1gu6p7tActvgIpH94p+r5qwiT0Kz+x2r28CIX87fgYS4eOXUixK0vay5lL7ezb+cqAvQC
	v8di3gdmYl6+LLI7dfLMaQr8bTAE1i5W4H4O39xkh1nUudBaPHtq0TAVHwE3YqmmiT1i3Oy4K4e
	16TzDWyY=
X-Google-Smtp-Source: AGHT+IHtC2XOyb5ncAh/Gm1bPrXbAXsePWuOtbVjsr2pTjPf8jIhNQ0VPaT8JV5fxgSAeyHrhuC3lA==
X-Received: by 2002:a05:6a00:1312:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-7404790137cmr19770b3a.19.1746038714831;
        Wed, 30 Apr 2025 11:45:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9a6csm2038201b3a.7.2025.04.30.11.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:45:14 -0700 (PDT)
Message-ID: <f076ffe9-09fa-4704-a816-98c5bae61dbc@linaro.org>
Date: Wed, 30 Apr 2025 11:45:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] target/arm/cpu: remove TARGET_AARCH64 around
 aarch64_cpu_dump_state common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1FXCGAAGxNg9

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 11 -----------
>   1 file changed, 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

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
