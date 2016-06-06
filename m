Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id lr9sm20104448wjb.39.2016.06.06.05.47.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 05:47:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 751043E0358;
	Mon,  6 Jun 2016 13:47:50 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 02/10] arm64: fix get_"sysreg32" and make MPIDR 64bit
In-reply-to: <1465064165-14885-3-git-send-email-drjones@redhat.com>
Date: Mon, 06 Jun 2016 13:47:50 +0100
Message-ID: <87bn3eiivd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: k9lK7I5RtObW


Andrew Jones <drjones@redhat.com> writes:

> mrs is always 64bit, so we should always use a 64bit register.
> Sometimes we'll only want to return the lower 32, but not for
> MPIDR, as that does define fields in the upper 32.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/arm64/asm/processor.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 84d5c7ce752b0..9a208ff729b7e 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -66,14 +66,17 @@ static inline unsigned long current_level(void)
>  	return el & 0xc;
>  }
>
> -#define DEFINE_GET_SYSREG32(reg)				\
> -static inline unsigned int get_##reg(void)			\
> +#define DEFINE_GET_SYSREG(reg, type)				\
> +static inline type get_##reg(void)				\
>  {								\
> -	unsigned int reg;					\
> -	asm volatile("mrs %0, " #reg "_el1" : "=r" (reg));	\
> -	return reg;						\
> +	unsigned long r;					\
> +	asm volatile("mrs %0, " #reg "_el1" : "=r" (r));	\
> +	return (type)r;						\
>  }
> -DEFINE_GET_SYSREG32(mpidr)
> +#define DEFINE_GET_SYSREG32(reg) DEFINE_GET_SYSREG(reg, unsigned int)
> +#define DEFINE_GET_SYSREG64(reg) DEFINE_GET_SYSREG(reg, unsigned long)

I guess this is a hang-over the kernel style to use int/long over
u32/u64?

Otherwise:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> +
> +DEFINE_GET_SYSREG64(mpidr)
>
>  /* Only support Aff0 for now, gicv2 only */
>  #define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))


--
Alex Bennée
