Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s8sm16175150wra.55.2019.06.17.07.12.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:12:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2A69C1FF87;
	Mon, 17 Jun 2019 15:12:05 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-15-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Subject: Re: [Qemu-arm] [PATCH v2 14/23] target/arm: Move the DC ZVA helper into op_helper
In-reply-to: <20190615154352.26824-15-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:12:05 +0100
Message-ID: <87muig9u8a.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BUte3Icc/7N4


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Samuel Ortiz <sameo@linux.intel.com>
>
> Those helpers are a software implementation of the ARM v8 memory zeroing
> op code. They should be moved to the op helper file, which is going to
> eventually be built only when TCG is enabled.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c    | 92 -----------------------------------------
>  target/arm/op_helper.c | 93 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 92 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 24d88eef17..673ada1e86 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10674,98 +10674,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,
>  #endif
>  }
>
> -void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
> -{
> -    /*
> -     * Implement DC ZVA, which zeroes a fixed-length block of memory.
> -     * Note that we do not implement the (architecturally mandated)
> -     * alignment fault for attempts to use this on Device memory
> -     * (which matches the usual QEMU behaviour of not implementing either
> -     * alignment faults or any memory attribute handling).
> -     */
> -
> -    ARMCPU *cpu =3D env_archcpu(env);
> -    uint64_t blocklen =3D 4 << cpu->dcz_blocksize;
> -    uint64_t vaddr =3D vaddr_in & ~(blocklen - 1);
> -
> -#ifndef CONFIG_USER_ONLY
> -    {
> -        /*
> -         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
> -         * the block size so we might have to do more than one TLB looku=
p.
> -         * We know that in fact for any v8 CPU the page size is at least=
 4K
> -         * and the block size must be 2K or less, but TARGET_PAGE_SIZE i=
s only
> -         * 1K as an artefact of legacy v5 subpage support being present =
in the
> -         * same QEMU executable. So in practice the hostaddr[] array has
> -         * two entries, given the current setting of TARGET_PAGE_BITS_MI=
N.
> -         */
> -        int maxidx =3D DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
> -        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
> -        int try, i;
> -        unsigned mmu_idx =3D cpu_mmu_index(env, false);
> -        TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
> -
> -        assert(maxidx <=3D ARRAY_SIZE(hostaddr));
> -
> -        for (try =3D 0; try < 2; try++) {
> -
> -            for (i =3D 0; i < maxidx; i++) {
> -                hostaddr[i] =3D tlb_vaddr_to_host(env,
> -                                                vaddr + TARGET_PAGE_SIZE=
 * i,
> -                                                1, mmu_idx);
> -                if (!hostaddr[i]) {
> -                    break;
> -                }
> -            }
> -            if (i =3D=3D maxidx) {
> -                /*
> -                 * If it's all in the TLB it's fair game for just writin=
g to;
> -                 * we know we don't need to update dirty status, etc.
> -                 */
> -                for (i =3D 0; i < maxidx - 1; i++) {
> -                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
> -                }
> -                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE)=
);
> -                return;
> -            }
> -            /*
> -             * OK, try a store and see if we can populate the tlb. This
> -             * might cause an exception if the memory isn't writable,
> -             * in which case we will longjmp out of here. We must for
> -             * this purpose use the actual register value passed to us
> -             * so that we get the fault address right.
> -             */
> -            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
> -            /* Now we can populate the other TLB entries, if any */
> -            for (i =3D 0; i < maxidx; i++) {
> -                uint64_t va =3D vaddr + TARGET_PAGE_SIZE * i;
> -                if (va !=3D (vaddr_in & TARGET_PAGE_MASK)) {
> -                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
> -                }
> -            }
> -        }
> -
> -        /*
> -         * Slow path (probably attempt to do this to an I/O device or
> -         * similar, or clearing of a block of code we have translations
> -         * cached for). Just do a series of byte writes as the architect=
ure
> -         * demands. It's not worth trying to use a cpu_physical_memory_m=
ap(),
> -         * memset(), unmap() sequence here because:
> -         *  + we'd need to account for the blocksize being larger than a=
 page
> -         *  + the direct-RAM access case is almost always going to be de=
alt
> -         *    with in the fastpath code above, so there's no speed benef=
it
> -         *  + we would have to deal with the map returning NULL because =
the
> -         *    bounce buffer was in use
> -         */
> -        for (i =3D 0; i < blocklen; i++) {
> -            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
> -        }
> -    }
> -#else
> -    memset(g2h(vaddr), 0, blocklen);
> -#endif
> -}
> -
>  /* Note that signed overflow is undefined in C.  The following routines =
are
>     careful to use unsigned types where modulo arithmetic is required.
>     Failure to do so _will_ break on newer gcc.  */
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index db4254a67b..29b56039e5 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -17,6 +17,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> @@ -1316,3 +1317,95 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t=
 x, uint32_t i)
>          return ((uint32_t)x >> shift) | (x << (32 - shift));
>      }
>  }
> +
> +void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
> +{
> +    /*
> +     * Implement DC ZVA, which zeroes a fixed-length block of memory.
> +     * Note that we do not implement the (architecturally mandated)
> +     * alignment fault for attempts to use this on Device memory
> +     * (which matches the usual QEMU behaviour of not implementing either
> +     * alignment faults or any memory attribute handling).
> +     */
> +
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    uint64_t blocklen =3D 4 << cpu->dcz_blocksize;
> +    uint64_t vaddr =3D vaddr_in & ~(blocklen - 1);
> +
> +#ifndef CONFIG_USER_ONLY
> +    {
> +        /*
> +         * Slightly awkwardly, QEMU's TARGET_PAGE_SIZE may be less than
> +         * the block size so we might have to do more than one TLB looku=
p.
> +         * We know that in fact for any v8 CPU the page size is at least=
 4K
> +         * and the block size must be 2K or less, but TARGET_PAGE_SIZE i=
s only
> +         * 1K as an artefact of legacy v5 subpage support being present =
in the
> +         * same QEMU executable. So in practice the hostaddr[] array has
> +         * two entries, given the current setting of TARGET_PAGE_BITS_MI=
N.
> +         */
> +        int maxidx =3D DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
> +        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
> +        int try, i;
> +        unsigned mmu_idx =3D cpu_mmu_index(env, false);
> +        TCGMemOpIdx oi =3D make_memop_idx(MO_UB, mmu_idx);
> +
> +        assert(maxidx <=3D ARRAY_SIZE(hostaddr));
> +
> +        for (try =3D 0; try < 2; try++) {
> +
> +            for (i =3D 0; i < maxidx; i++) {
> +                hostaddr[i] =3D tlb_vaddr_to_host(env,
> +                                                vaddr + TARGET_PAGE_SIZE=
 * i,
> +                                                1, mmu_idx);
> +                if (!hostaddr[i]) {
> +                    break;
> +                }
> +            }
> +            if (i =3D=3D maxidx) {
> +                /*
> +                 * If it's all in the TLB it's fair game for just writin=
g to;
> +                 * we know we don't need to update dirty status, etc.
> +                 */
> +                for (i =3D 0; i < maxidx - 1; i++) {
> +                    memset(hostaddr[i], 0, TARGET_PAGE_SIZE);
> +                }
> +                memset(hostaddr[i], 0, blocklen - (i * TARGET_PAGE_SIZE)=
);
> +                return;
> +            }
> +            /*
> +             * OK, try a store and see if we can populate the tlb. This
> +             * might cause an exception if the memory isn't writable,
> +             * in which case we will longjmp out of here. We must for
> +             * this purpose use the actual register value passed to us
> +             * so that we get the fault address right.
> +             */
> +            helper_ret_stb_mmu(env, vaddr_in, 0, oi, GETPC());
> +            /* Now we can populate the other TLB entries, if any */
> +            for (i =3D 0; i < maxidx; i++) {
> +                uint64_t va =3D vaddr + TARGET_PAGE_SIZE * i;
> +                if (va !=3D (vaddr_in & TARGET_PAGE_MASK)) {
> +                    helper_ret_stb_mmu(env, va, 0, oi, GETPC());
> +                }
> +            }
> +        }
> +
> +        /*
> +         * Slow path (probably attempt to do this to an I/O device or
> +         * similar, or clearing of a block of code we have translations
> +         * cached for). Just do a series of byte writes as the architect=
ure
> +         * demands. It's not worth trying to use a cpu_physical_memory_m=
ap(),
> +         * memset(), unmap() sequence here because:
> +         *  + we'd need to account for the blocksize being larger than a=
 page
> +         *  + the direct-RAM access case is almost always going to be de=
alt
> +         *    with in the fastpath code above, so there's no speed benef=
it
> +         *  + we would have to deal with the map returning NULL because =
the
> +         *    bounce buffer was in use
> +         */
> +        for (i =3D 0; i < blocklen; i++) {
> +            helper_ret_stb_mmu(env, vaddr + i, 0, oi, GETPC());
> +        }
> +    }
> +#else
> +    memset(g2h(vaddr), 0, blocklen);
> +#endif
> +}


--
Alex Benn=C3=A9e
