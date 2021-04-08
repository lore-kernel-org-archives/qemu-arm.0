Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x12sm35588906wrr.7.2021.04.08.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:06:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DE59C1FF7E;
	Thu,  8 Apr 2021 10:06:27 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 05/12] target/arm: Fix unaligned checks for
 mte_check1, mte_probe1
Date: Thu, 08 Apr 2021 10:05:50 +0100
In-reply-to: <20210406174031.64299-6-richard.henderson@linaro.org>
Message-ID: <87sg41tab0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /tz/ofy+DEpk


Richard Henderson <richard.henderson@linaro.org> writes:

> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> We cannot tell a priori whether or not a given scalar access is aligned,
> therefore we must at least check.  Use mte_probe_int, which is already
> set up for checking multiple granules.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

(tested with hand crafted kunit test)

> ---
>  target/arm/mte_helper.c | 109 +++++++++++++---------------------------
>  1 file changed, 35 insertions(+), 74 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 144bfa4a51..619c4b9351 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -617,80 +617,6 @@ static void mte_check_fail(CPUARMState *env, uint32_=
t desc,
>      }
>  }
>=20=20
> -/*
> - * Perform an MTE checked access for a single logical or atomic access.
> - */
> -static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
> -                           uintptr_t ra, int bit55)
> -{
> -    int mem_tag, mmu_idx, ptr_tag, size;
> -    MMUAccessType type;
> -    uint8_t *mem;
> -
> -    ptr_tag =3D allocation_tag_from_addr(ptr);
> -
> -    if (tcma_check(desc, bit55, ptr_tag)) {
> -        return true;
> -    }
> -
> -    mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
> -    type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    size =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> -
> -    mem =3D allocation_tag_mem(env, mmu_idx, ptr, type, size,
> -                             MMU_DATA_LOAD, 1, ra);
> -    if (!mem) {
> -        return true;
> -    }
> -
> -    mem_tag =3D load_tag1(ptr, mem);
> -    return ptr_tag =3D=3D mem_tag;
> -}
> -
> -/*
> - * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
> - * Returns false if the access is Checked and the check failed.  This
> - * is only intended to probe the tag -- the validity of the page must
> - * be checked beforehand.
> - */
> -bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
> -{
> -    int bit55 =3D extract64(ptr, 55, 1);
> -
> -    /* If TBI is disabled, the access is unchecked. */
> -    if (unlikely(!tbi_check(desc, bit55))) {
> -        return true;
> -    }
> -
> -    return mte_probe1_int(env, desc, ptr, 0, bit55);
> -}
> -
> -uint64_t mte_check1(CPUARMState *env, uint32_t desc,
> -                    uint64_t ptr, uintptr_t ra)
> -{
> -    int bit55 =3D extract64(ptr, 55, 1);
> -
> -    /* If TBI is disabled, the access is unchecked, and ptr is not dirty=
. */
> -    if (unlikely(!tbi_check(desc, bit55))) {
> -        return ptr;
> -    }
> -
> -    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
> -        mte_check_fail(env, desc, ptr, ra);
> -    }
> -
> -    return useronly_clean_ptr(ptr);
> -}
> -
> -uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t pt=
r)
> -{
> -    return mte_check1(env, desc, ptr, GETPC());
> -}
> -
> -/*
> - * Perform an MTE checked access for multiple logical accesses.
> - */
> -
>  /**
>   * checkN:
>   * @tag: tag memory to test
> @@ -882,6 +808,41 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32=
_t desc, uint64_t ptr)
>      return mte_checkN(env, desc, ptr, GETPC());
>  }
>=20=20
> +uint64_t mte_check1(CPUARMState *env, uint32_t desc,
> +                    uint64_t ptr, uintptr_t ra)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, ra, total, &fault);
> +
> +    if (unlikely(ret =3D=3D 0)) {
> +        mte_check_fail(env, desc, fault, ra);
> +    } else if (ret < 0) {
> +        return ptr;
> +    }
> +    return useronly_clean_ptr(ptr);
> +}
> +
> +uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t pt=
r)
> +{
> +    return mte_check1(env, desc, ptr, GETPC());
> +}
> +
> +/*
> + * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
> + * Returns false if the access is Checked and the check failed.  This
> + * is only intended to probe the tag -- the validity of the page must
> + * be checked beforehand.
> + */
> +bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, 0, total, &fault);
> +
> +    return ret !=3D 0;
> +}
> +
>  /*
>   * Perform an MTE checked access for DC_ZVA.
>   */


--=20
Alex Benn=C3=A9e
