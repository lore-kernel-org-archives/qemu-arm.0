Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 109-v6sm13954267wra.32.2018.05.22.02.21.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 02:21:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3241B3E01DB;
	Tue, 22 May 2018 10:21:39 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-3-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 02/27] Make tb_invalidate_phys_addr() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-3-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 10:21:39 +0100
Message-ID: <87muwsujto.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FucNHcFKRvyB


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to tb_invalidate_phys_addr().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/exec-all.h   | 5 +++--
>  accel/tcg/translate-all.c | 2 +-
>  exec.c                    | 2 +-
>  target/xtensa/op_helper.c | 3 ++-
>  4 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index bd68328ed9..4d09eaba72 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -255,7 +255,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ul=
ong vaddr,
>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
> -void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr);
> +void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs a=
ttrs);
>  void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu=
_idx,
>                   uintptr_t retaddr);
>  #else
> @@ -303,7 +303,8 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synce=
d(CPUState *cpu,
>                                                         uint16_t idxmap)
>  {
>  }
> -static inline void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr)
> +static inline void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr,
> +                                           MemTxAttrs attrs)
>  {
>  }
>  #endif
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index f409d42d54..f04a922ef7 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1672,7 +1672,7 @@ static TranslationBlock *tb_find_pc(uintptr_t tc_pt=
r)
>  }
>
>  #if !defined(CONFIG_USER_ONLY)
> -void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr)
> +void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs a=
ttrs)
>  {
>      ram_addr_t ram_addr;
>      MemoryRegion *mr;
> diff --git a/exec.c b/exec.c
> index ffa1099547..c3a197e67b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -898,7 +898,7 @@ static void breakpoint_invalidate(CPUState *cpu, targ=
et_ulong pc)
>      if (phys !=3D -1) {
>          /* Locks grabbed by tb_invalidate_phys_addr */
>          tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
> -                                phys | (pc & ~TARGET_PAGE_MASK));
> +                                phys | (pc & ~TARGET_PAGE_MASK), attrs);
>      }
>  }
>  #endif
> diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
> index e3bcbe10d6..8a8c763c63 100644
> --- a/target/xtensa/op_helper.c
> +++ b/target/xtensa/op_helper.c
> @@ -105,7 +105,8 @@ static void tb_invalidate_virtual_addr(CPUXtensaState=
 *env, uint32_t vaddr)
>      int ret =3D xtensa_get_physical_addr(env, false, vaddr, 2, 0,
>              &paddr, &page_size, &access);
>      if (ret =3D=3D 0) {
> -        tb_invalidate_phys_addr(&address_space_memory, paddr);
> +        tb_invalidate_phys_addr(&address_space_memory, paddr,
> +                                MEMTXATTRS_UNSPECIFIED);
>      }
>  }


--
Alex Benn=C3=A9e
