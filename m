Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o13sm23781164wra.92.2019.06.17.07.19.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:19:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E557E1FF87;
	Mon, 17 Jun 2019 15:19:52 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-17-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 16/23] target/arm: Make arm_deliver_fault() static
In-reply-to: <20190615154352.26824-17-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:19:52 +0100
Message-ID: <87k1dk9tvb.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rscHszxrNafv


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> This function is now only called within op_helper.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

(although if we move the tlb related bits that might be different)

> ---
>  target/arm/internals.h | 3 ---
>  target/arm/op_helper.c | 5 +++--
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 37ca493635..06e676bf62 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -767,9 +767,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>                        bool probe, uintptr_t retaddr);
>  #endif
>
> -void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
> -                       int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
> -
>  /* Return true if the stage 1 translation regime is using LPAE format pa=
ge
>   * tables */
>  bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx=
);
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index e43c99ebf0..63bce32810 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -127,8 +127,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t =
template_syn,
>      return syn;
>  }
>
> -void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
> -                       int mmu_idx, ARMMMUFaultInfo *fi)
> +static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
> +                                            MMUAccessType access_type,
> +                                            int mmu_idx, ARMMMUFaultInfo=
 *fi)
>  {
>      CPUARMState *env =3D &cpu->env;
>      int target_el;


--
Alex Benn=C3=A9e
