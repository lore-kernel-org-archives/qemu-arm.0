Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q20sm28543491wra.36.2019.06.17.07.16.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:16:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B389E1FF87;
	Mon, 17 Jun 2019 15:16:08 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-16-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>
Subject: Re: [Qemu-arm] [PATCH v2 15/23] target/arm: Make ARM TLB filling routine static
In-reply-to: <20190615154352.26824-16-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:16:08 +0100
Message-ID: <87lfy09u1j.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tssHy99p7Pnt


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Samuel Ortiz <sameo@linux.intel.com>
>
> It's only used in op_helper.c, it does not need to be exported and
> moreover it should only be build when TCG is enabled.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c    | 53 ---------------------------------------
>  target/arm/internals.h |  2 ++
>  target/arm/op_helper.c | 56 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 53 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 673ada1e86..a4af02c984 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10621,59 +10621,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUStat=
e *cs, vaddr addr,
>
>  #endif
>
> -bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -
> -#ifdef CONFIG_USER_ONLY
> -    cpu->env.exception.vaddress =3D address;
> -    if (access_type =3D=3D MMU_INST_FETCH) {
> -        cs->exception_index =3D EXCP_PREFETCH_ABORT;
> -    } else {
> -        cs->exception_index =3D EXCP_DATA_ABORT;
> -    }
> -    cpu_loop_exit_restore(cs, retaddr);
> -#else
> -    hwaddr phys_addr;
> -    target_ulong page_size;
> -    int prot, ret;
> -    MemTxAttrs attrs =3D {};
> -    ARMMMUFaultInfo fi =3D {};
> -
> -    /*
> -     * Walk the page table and (if the mapping exists) add the page
> -     * to the TLB.  On success, return true.  Otherwise, if probing,
> -     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
> -     * register format, and signal the fault.
> -     */
> -    ret =3D get_phys_addr(&cpu->env, address, access_type,
> -                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> -                        &phys_addr, &attrs, &prot, &page_size, &fi,
> NULL);

Shouldn't we be moving the rest of the tlb filling code that gets
referred to here? Maybe we could keep it all together in tlb-helper.c?


> -    if (likely(!ret)) {
> -        /*
> -         * Map a single [sub]page. Regions smaller than our declared
> -         * target page size are handled specially, so for those we
> -         * pass in the exact addresses.
> -         */
> -        if (page_size >=3D TARGET_PAGE_SIZE) {
> -            phys_addr &=3D TARGET_PAGE_MASK;
> -            address &=3D TARGET_PAGE_MASK;
> -        }
> -        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
> -                                prot, mmu_idx, page_size);
> -        return true;
> -    } else if (probe) {
> -        return false;
> -    } else {
> -        /* now we have a real cpu fault */
> -        cpu_restore_state(cs, retaddr, true);
> -        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
> -    }
> -#endif
> -}
> -
>  /* Note that signed overflow is undefined in C.  The following routines =
are
>     careful to use unsigned types where modulo arithmetic is required.
>     Failure to do so _will_ break on newer gcc.  */
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fe9e4665e2..37ca493635 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -761,9 +761,11 @@ static inline bool arm_extabort_type(MemTxResult res=
ult)
>      return result !=3D MEMTX_DECODE_ERROR;
>  }
>
> +#ifdef CONFIG_TCG
>  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> +#endif
>
>  void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
>                         int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 29b56039e5..e43c99ebf0 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -179,6 +179,62 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUA=
ccessType access_type,
>      env->exception.fsr =3D fsr;
>      raise_exception(env, exc, syn, target_el);
>  }
> +#endif
> +
> +bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                      MMUAccessType access_type, int mmu_idx,
> +                      bool probe, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +
> +#ifdef CONFIG_USER_ONLY
> +    cpu->env.exception.vaddress =3D address;
> +    if (access_type =3D=3D MMU_INST_FETCH) {
> +        cs->exception_index =3D EXCP_PREFETCH_ABORT;
> +    } else {
> +        cs->exception_index =3D EXCP_DATA_ABORT;
> +    }
> +    cpu_loop_exit_restore(cs, retaddr);
> +#else
> +    hwaddr phys_addr;
> +    target_ulong page_size;
> +    int prot, ret;
> +    MemTxAttrs attrs =3D {};
> +    ARMMMUFaultInfo fi =3D {};
> +
> +    /*
> +     * Walk the page table and (if the mapping exists) add the page
> +     * to the TLB.  On success, return true.  Otherwise, if probing,
> +     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
> +     * register format, and signal the fault.
> +     */
> +    ret =3D get_phys_addr(&cpu->env, address, access_type,
> +                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> +                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL=
);
> +    if (likely(!ret)) {
> +        /*
> +         * Map a single [sub]page. Regions smaller than our declared
> +         * target page size are handled specially, so for those we
> +         * pass in the exact addresses.
> +         */
> +        if (page_size >=3D TARGET_PAGE_SIZE) {
> +            phys_addr &=3D TARGET_PAGE_MASK;
> +            address &=3D TARGET_PAGE_MASK;
> +        }
> +        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
> +                                prot, mmu_idx, page_size);
> +        return true;
> +    } else if (probe) {
> +        return false;
> +    } else {
> +        /* now we have a real cpu fault */
> +        cpu_restore_state(cs, retaddr, true);
> +        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
> +    }
> +#endif
> +}
> +
> +#if !defined(CONFIG_USER_ONLY)
>
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,


--
Alex Benn=C3=A9e
