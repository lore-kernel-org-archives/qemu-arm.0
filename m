Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2468761njc;
        Tue, 15 Apr 2025 00:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEXneuqXe6xwnaFtH7TqTThLaVms1TvnBj1/Jv+rnXne1O0Jji58oPlzMspzTA/lhsd1Tcx3t9HwdVRg==@linaro.org
X-Received: by 2002:a5d:5f94:0:b0:39c:1f02:44ae with SMTP id ffacd0b85a97d-39ea54fd3d6mr13512791f8f.27.1744700588517;
        Tue, 15 Apr 2025 00:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744700588; cv=none;
        d=google.com; s=arc-20240605;
        b=ZaGaXCwKRLR0iiBaKBU89p0sEoNjidaaGVZFVgBF/YSwy8RiJZ0xsX5cTydcBkW3i3
         zE4raJ4rKJVilz8/fz0yH4FUh6YCHBCWctZeg0Q/L0PeNIBcT9YsnwDPzYJ1aJPHYdXy
         Bfa5Nv17wJ21Kt32UQ8KfGRGE3wmrripi/PJqz24n0eUkG2MJotvfPL/rP+Yn+XRM2CF
         7IlQ/mCGCuVVj0ZgkUIj5SZVb6UCu2IK3iYJn0GQ6+av6lBRfZMbt6mAkv6DNPcxu2Tm
         Gg8M51XwFG3mfSp1xvZDRtwMt6qoPXuGGcTGujR502fS+2KNPm8Q6hIUk30gEBn+4/1y
         hSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gQIZTL9G2c/6upLFkGLhEBR0xC+hQ/0nufe0kTqCXv8=;
        fh=4wwVIo/95iVF1gRkeHgxArmMwWm6RdgQwHZeN6AIDKo=;
        b=QWZ4/kusO952TVu0GgNDAlwbDEK+ytjEtu3VBq5efNJTn9qXfoqhp6ybmhuXncaa+4
         VgpluVUS0KBIfl/2Vg4x7shzsA5Md7QEaZwDAUFNnCOuP5CsBgr5dNfehsyp05ET6uZg
         Mnpvp081uK6XRRnHziRfu0iNtDyKD0yru67OG8GdS9ACAl7pql/r/WwRkY3nIrhETOrp
         RE5WBCaIf65zB3Y7dzQQaDFLcfzpA3lPiH3HIdJVDG7mWuSxgy4ZyzqIpc8+aQdsFJqE
         lZFh4qjOBSANTd1poLkZhMhtaJIRU4IHk8Cdm2NBs2oA0QWx6TMyT1ApXPt4F0hcHIxq
         qPGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqdT7c1b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d89403151sor161912f8f.9.2025.04.15.00.03.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Apr 2025 00:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqdT7c1b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744700588; x=1745305388; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQIZTL9G2c/6upLFkGLhEBR0xC+hQ/0nufe0kTqCXv8=;
        b=eqdT7c1bjOcPsiV1LokFzYDi3c1I8CuwiuLJtEYG3krIVZZpm0L/Rqe17CpbnHz+1y
         3/h2Mq8t1fedZnOy4hPFQGy0E1mz2dZ7cJcFBGuHe10jzdRJ3bSGB8P+86Dy3ZTRaoyH
         82x3MndcAncnYhagjnv4bWEEFzVGwN0Vmsdj7PFgvnsH3PS/ueqhDizPzuvXiNdzDeQA
         SfSVEyXNnemsj3Zs8FJE301iRJn1X+EXdCq02wXTkyqxvy1Cbdanbuw6hbgVA5HS1pFZ
         PdsopQXKQ4mzcepxyt+Sj56dACwo7C2xZ6MtZzqLXGxUZEq8C9iYdksnxAJsR8TSMx7w
         bOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700588; x=1745305388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQIZTL9G2c/6upLFkGLhEBR0xC+hQ/0nufe0kTqCXv8=;
        b=ZreU/5X3e6K191WtXhIUa/i0sf+f3irubLxONViW5Hb/gA0BpsK2F4v3xX2I2Bs2A2
         vihtkDa04J3FCRSi4ZM5d71ufR3nbKeogtxDyAIhRdEU8d/YohPOIldOOb4EVl0BRQHc
         Pv3j82LW6zvcLCMBJiUNezwt/TN0zGDuo5Rx3/XKGVI1oXPMJ3rOoB9CjuGuK94P/xu1
         ffA9nvTUf0t1gqLlchoRWVr4BUXFrWe5lahHcl5oW0CDt1pIgGsSOz6myTATZIdV9hbK
         DNtJLwZuHQSXgL9Hx21LGEXiNwcCQkuwVu6XJKuRM76mVoccATqngHvyOB87ViWuXj3q
         7rAg==
X-Forwarded-Encrypted: i=1; AJvYcCXPfrxNRCVpG0rXAzOlgC+klnn0Yv83ZFzDbYFugoOhH+v3UYGq6wxEejyjqbUO0OmfCqn7jq9/tZ1ZVQ==@linaro.org
X-Gm-Message-State: AOJu0YxE5RaP68DCgbI/sGrBDBoDwyvLwuUbYi1Dbt1LMAxsTKG35rlj
	0sSXBbj6eQmbPTzRDtNRimK/RS7+Ayg06Ojw0XQxvwazZplgcX78zaVYiMpvZAZD+g==
X-Gm-Gg: ASbGnct6L00bIc5omZ7NZ8wd5y4qefupIy6T0M9lkDDaf6K4N4pkGLBpJBHSjmBVbCO
	N3TZYUL9wCdd4OPCDjq6uv/EZV6vGtX3GSKcUYyXKFxy2WP4+OOfEOuZPgWBCK1oTBckV6FYfga
	xuKXFIX6szw2Ykh813Y7p2ltf2Ayz4iGwCdria3PvICEFAaugPk6BW4pGboMzk7pY6UaidTzBzd
	QaxlpWLJJ0sZ9Sj2ZwhRbjdHK1lAfwpjE8oPGwCpm5BNSk1w/jl5nqm4H8q5L4owm0PANa9iAdW
	J2mmiUov1zcadq3mhWZzf2sdUOUHK6xy1O7/OQI+r7a6Nf+ipAMKX4ddamdQcNAIyenTk5sfU/H
	j2kWDtRmf
X-Google-Smtp-Source: AGHT+IFdPTJ8LHSnf9kexPXg9Yw57XSpwMyM9HqLdnmKOqq/iid4dTW/LxIaw775eBPO7mzIdnTsQQ==
X-Received: by 2002:a5d:588a:0:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39ea634bf9amr10517202f8f.29.1744700587920;
        Tue, 15 Apr 2025 00:03:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445315sm13165936f8f.82.2025.04.15.00.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:03:07 -0700 (PDT)
Message-ID: <5f9a4bc5-5569-437f-8e8d-f386dd51e33a@linaro.org>
Date: Tue, 15 Apr 2025 09:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm/kvm: write back modified ID regs to KVM
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-8-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250414163849.321857-8-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: GbkSunNtMos/

On 14/4/25 18:38, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> We want to give a chance to override the value of host ID regs.
> In a previous patch we made sure all their values could be fetched
> through kvm_get_one_reg() calls before their modification. After
> their potential modification we need to make sure we write back
> the values through kvm_set_one_reg() calls.
> 
> Make sure the cpreg_list is modified with updated values and
> transfer those values back to kvm.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c        | 44 ++++++++++++++++++++++++++++++++++++++++-
>   target/arm/trace-events |  1 +
>   2 files changed, 44 insertions(+), 1 deletion(-)


>   void kvm_arm_reset_vcpu(ARMCPU *cpu)
>   {
>       int ret;
> @@ -2050,7 +2083,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>       }
>       cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>   
> -    return kvm_arm_init_cpreg_list(cpu);
> +    ret = kvm_arm_init_cpreg_list(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +    /* overwrite writable ID regs with their updated property values */
> +    kvm_arm_writable_idregs_to_cpreg_list(cpu);
> +
> +    write_list_to_kvmstate(cpu, 3);

s/3/KVM_PUT_FULL_STATE/?

> +
> +    return 0;
>   }
