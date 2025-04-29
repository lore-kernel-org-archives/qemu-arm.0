Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp215705njm;
        Tue, 29 Apr 2025 05:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeUZ1C/qpmFzeYQBaOS7rdIr2ry/KYaxMfrFiNlgw70vgvD/Ubo/IRFj8VdBG/QUcBIAgNi2dMruoO/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFNlcwNzTNoZ9dLtk0FGdjyW8Ek3V/jm0ZjGScaTGKmdxfd6zHyxG10VQRXt0YyLcctYI6u
X-Received: by 2002:a05:6000:40c9:b0:3a0:830a:3d63 with SMTP id ffacd0b85a97d-3a0890a518fmr3552159f8f.9.1745929524626;
        Tue, 29 Apr 2025 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745929524; cv=none;
        d=google.com; s=arc-20240605;
        b=ezwID7kwc2mXDX35Hh5gbvpW/uWPEWG3b3O4Hu+6vd/vzNj28EzY8PjZQZsuI3AtGS
         VhYikx7u2cnmvrNTfHToflRe07KwfwRup26MsNVggbdoYi1SZVzK3UsL6AB5QoBLzUr6
         3PLHs9WMC/TUIi0dfPObnxOFA1r/NqJDmVCle06B6SahEcuY8yC5MvQLUwJDk9OZ1vq0
         ATznRIlFm3MxcOzg9H0uBBNcikE/LaxUtdGUV1hckziWcGR0pXCKk4JNI8zFOTDZpbB6
         1Rd5FOa8eLys0PVBLHxRegw1HphXKzEAIO13Gba36kS/mIuRAldUMz4iO64FtuC6qj3h
         A6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FulfBLl+ryoBJvND2Xguk6hmdm7/JzY6FmhA7EIub6k=;
        fh=WHCVTeuvFv6KTNYFpQbVksaIuYjPt0Rc6lPpvmXphI4=;
        b=I/1WxpuIf9qyXB087Y/MpDQS/ZwDI30JDEoYOzZY+Fon6y+1C66UWyIOB7J7rpCfAk
         H7JgbVkhN4kyHrpaKxz8JCr9uQOpHYy9Sxk9UBZKUd231l+IDj14rVsVaGiPJyyAtj8I
         MIl1oDfSyUe9eUUNcqUcWW4qedOq4DWJBUu5pceNBwOeR1Pbv6sE8ayMgFiiQjyIQ517
         9adKMn8HJrZnyK6LCFO4UD9Xzj767E/8MSRcHWGxuI2Dr6VmzAYbHPij8Vk5ANj2c+DO
         YTVnV/YIg5C57Srhv1KZPtyVJ+UUdZK05/YLpsqM0dbfAOUslk8ExgYSSL32CUeU4Na8
         u5vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=P7bOC6ZL;
       spf=pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [94.130.142.21])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a073e5620bsi6602821f8f.549.2025.04.29.05.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) client-ip=94.130.142.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=P7bOC6ZL;
       spf=pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=FulfBLl+ryoBJvND2Xguk6hmdm7/JzY6FmhA7EIub6k=; b=P7bOC6ZLZYKAMHf
	YrU1O3CmQYGrLyMxE02eQxFB+rYGvLad0CFBjOgGqyed7S4z7ALirSv+B9+CcTQZ2/AAC5vwxbUsJ
	8Mnw04MForklBltw44GvEy0YavxagJ/zgtObuTd9qY23OnkpofNMv54IiRWtnLcZuiR2DvcdlCjBL
	Xs=;
Date: Tue, 29 Apr 2025 14:26:30 +0200
From: Anton Johansson <anjo@rev.ng>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	kvm@vger.kernel.org, alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH 09/13] target/arm/cpu: get endianness from cpu state
Message-ID: <bwdflzaiqdpq33uzowvrgjbha3wye6k74puwur755pq27z67eu@mnc2ze4it5cl>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-10-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429050010.971128-10-pierrick.bouvier@linaro.org>
X-TUID: acH00BteKN8M

On 29/04/25, Pierrick Bouvier wrote:
> Remove TARGET_BIG_ENDIAN dependency.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  target/arm/cpu.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e7a15ade8b4..85e886944f6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -67,6 +67,15 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>      }
>  }
>  
> +static bool arm_cpu_is_big_endian(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    cpu_synchronize_state(cs);
> +    return arm_cpu_data_is_big_endian(env);
> +}
> +
>  static vaddr arm_cpu_get_pc(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -1130,15 +1139,6 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>  #endif
>  }
>  
> -static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    cpu_synchronize_state(cs);
> -    return arm_cpu_data_is_big_endian(env);
> -}
> -
>  #ifdef CONFIG_TCG
>  bool arm_cpu_exec_halt(CPUState *cs)
>  {
> @@ -1203,7 +1203,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>  
>      info->endian = BFD_ENDIAN_LITTLE;
>      if (bswap_code(sctlr_b)) {
> -        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
> +        info->endian = arm_cpu_is_big_endian(cpu) ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>      }

I'm not the most familiar with arm but as far as I can tell these are
not equivalent. My understanding is that arm_cpu_is_big_endian() models
data endianness, and TARGET_BIG_ENDIAN instruction endianness.

Also, for user mode where this branch is relevant, bswap_code() still
depends on TARGET_BIG_ENDIAN anyway and the above branch would reduce to
(on arm32)

  if (TARGET_BIG_ENDIAN ^ sctlr_b) {
      info->endian = sctlr_b ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
  }

giving the opposite result to the original code.

-- 
Anton Johansson
rev.ng Labs Srl.
