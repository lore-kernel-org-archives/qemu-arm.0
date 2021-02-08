Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e4sm27559080wrw.96.2021.02.08.00.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 00:48:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BE51B1FF7E;
	Mon,  8 Feb 2021 08:48:21 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
Date: Mon, 08 Feb 2021 08:42:57 +0000
In-reply-to: <20210207232310.2505283-6-f4bug@amsat.org>
Message-ID: <87im73aqsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BOWe3rmDNUOx


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> What this code does is out of my league, but refactoring it allow
> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
> patch.

The assertion that the table entry is current is just a simple
housekeeping one. The details of how the MTE implementation uses
(abuses?) the iotlb entries requires a closer reading of the code.

> ---
>  include/exec/exec-all.h |  9 +++++++++
>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>  target/arm/mte_helper.c | 11 ++---------
>  target/arm/sve_helper.c | 10 ++--------
>  4 files changed, 27 insertions(+), 17 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index f933c74c446..c5e8e355b7f 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_u=
long vaddr,
>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
> +
> +/*
> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
> + * because we just found the mapping.
> + */
> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_m=
mu_idx,
> +                                            uint64_t ptr,
> +                                            MMUAccessType ptr_access,
> +                                            uintptr_t index);

Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
case so we can eliminate the call to an empty function.

>  #else
>  static inline void tlb_init(CPUState *cpu)
>  {
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 8a7b779270a..a6247da34a0 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>  }
>=20=20
> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_m=
mu_idx,
> +                                            uint64_t ptr,
> +                                            MMUAccessType ptr_access,
> +                                            uintptr_t index)
> +{
> +#ifdef CONFIG_DEBUG_TCG
> +    CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
> +    target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
> +                               ? entry->addr_read
> +                               : tlb_addr_write(entry));
> +    g_assert(tlb_hit(comparator, ptr));
> +#endif
> +}
> +
>  static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
>                                        target_ulong page, target_ulong ma=
sk)
>  {
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 6cea9d1b506..f47d3b4570e 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env,=
 int ptr_mmu_idx,
>       * matching tlb entry + iotlb entry.
>       */
>      index =3D tlb_index(env, ptr_mmu_idx, ptr);
> -# ifdef CONFIG_DEBUG_TCG
> -    {
> -        CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
> -        target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
> -                                   ? entry->addr_read
> -                                   : tlb_addr_write(entry));
> -        g_assert(tlb_hit(comparator, ptr));
> -    }
> -# endif
> +    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
> +                                           ptr_access, index);
>      iotlbentry =3D &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
>=20=20
>      /* If the virtual page MemAttr !=3D Tagged, access unchecked. */
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index c8cdf7618eb..a5708da0f2f 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bool=
 nofault,
>      {
>          uintptr_t index =3D tlb_index(env, mmu_idx, addr);
>=20=20
> -# ifdef CONFIG_DEBUG_TCG
> -        CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, addr);
> -        target_ulong comparator =3D (access_type =3D=3D MMU_DATA_LOAD
> -                                   ? entry->addr_read
> -                                   : tlb_addr_write(entry));
> -        g_assert(tlb_hit(comparator, addr));
> -# endif
> -
> +        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
> +                                               access_type, index);
>          CPUIOTLBEntry *iotlbentry =3D &env_tlb(env)->d[mmu_idx].iotlb[in=
dex];
>          info->attrs =3D iotlbentry->attrs;
>      }

with the inline fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
