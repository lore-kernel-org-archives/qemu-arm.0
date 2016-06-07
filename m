Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g192sm20183218wme.15.2016.06.07.09.22.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jun 2016 09:22:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1CDB33E0200;
	Tue,  7 Jun 2016 17:22:20 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 05/10] arm/arm64: irq enable/disable
In-reply-to: <1465064165-14885-6-git-send-email-drjones@redhat.com>
Date: Tue, 07 Jun 2016 17:22:20 +0100
Message-ID: <87portge9v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: cw5Pc9X0sPoW


Andrew Jones <drjones@redhat.com> writes:

> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  lib/arm/asm/processor.h   | 10 ++++++++++
>  lib/arm64/asm/processor.h | 10 ++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> index afc903ca7d4ab..75a8d08b89330 100644
> --- a/lib/arm/asm/processor.h
> +++ b/lib/arm/asm/processor.h
> @@ -35,6 +35,16 @@ static inline unsigned long current_cpsr(void)
>
>  #define current_mode() (current_cpsr() & MODE_MASK)
>
> +static inline void local_irq_enable(void)
> +{
> +	asm volatile("cpsie i" : : : "memory", "cc");
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +	asm volatile("cpsid i" : : : "memory", "cc");
> +}
> +
>  static inline unsigned int get_mpidr(void)
>  {
>  	unsigned int mpidr;
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 94f7ce35b65c1..d54a4ed1c1876 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -68,6 +68,16 @@ static inline unsigned long current_level(void)
>  	return el & 0xc;
>  }
>
> +static inline void local_irq_enable(void)
> +{
> +	asm volatile("msr daifclr, #2" : : : "memory");
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +	asm volatile("msr daifset, #2" : : : "memory");
> +}
> +
>  #define DEFINE_GET_SYSREG(reg, type)				\
>  static inline type get_##reg(void)				\
>  {								\


--
Alex Bennée
