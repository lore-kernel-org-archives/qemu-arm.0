Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g13sm3136830wrr.9.2021.04.08.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:04:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8D2771FF7E;
	Thu,  8 Apr 2021 10:04:32 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 04/12] target/arm: Split out mte_probe_int
Date: Thu, 08 Apr 2021 10:01:39 +0100
In-reply-to: <20210406174031.64299-5-richard.henderson@linaro.org>
Message-ID: <87v98xtae7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tOzv6UsA2Fk6


Richard Henderson <richard.henderson@linaro.org> writes:

> Split out a helper function from mte_checkN to perform
> all of the checking and address manpulation.  So far,
> just use this in mte_checkN itself.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index c87717127c..144bfa4a51 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, i=
nt count)
>      return n;
>  }
>=20=20
> -uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
> -                    uint64_t ptr, uintptr_t ra)
> +/*
> + * mte_probe_int:

nit: you might as well go full kernel-doc here as you are documenting
the helper:

/**
 * mte_probe_int() - helper for mte_probe and mte_check

> + * @env: CPU environment
> + * @desc: MTEDESC descriptor
> + * @ptr: virtual address of the base of the access
> + * @fault: return virtual address of the first check failure
> + *
> + * Internal routine for both mte_probe and mte_check.
> + * Return zero on failure, filling in *fault.
> + * Return negative on trivial success for tbi disabled.
> + * Return positive on success with tbi enabled.
> + */
> +static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
> +                         uintptr_t ra, uint32_t total, uint64_t *fault)
>  {
>      int mmu_idx, ptr_tag, bit55;
>      uint64_t ptr_last, prev_page, next_page;
>      uint64_t tag_first, tag_last;
>      uint64_t tag_byte_first, tag_byte_last;
> -    uint32_t total, tag_count, tag_size, n, c;
> +    uint32_t tag_count, tag_size, n, c;
>      uint8_t *mem1, *mem2;
>      MMUAccessType type;
>=20=20
>      bit55 =3D extract64(ptr, 55, 1);
> +    *fault =3D ptr;
>=20=20
>      /* If TBI is disabled, the access is unchecked, and ptr is not dirty=
. */
>      if (unlikely(!tbi_check(desc, bit55))) {
> -        return ptr;
> +        return -1;
>      }
>=20=20
>      ptr_tag =3D allocation_tag_from_addr(ptr);
>=20=20
>      if (tcma_check(desc, bit55, ptr_tag)) {
> -        goto done;
> +        return 1;
>      }
>=20=20
>      mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
>      type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
>=20=20
>      /* Find the addr of the end of the access, and of the last element. =
*/
>      ptr_last =3D ptr + total - 1;
> @@ -803,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, total,
>                                    MMU_DATA_LOAD, tag_size, ra);
>          if (!mem1) {
> -            goto done;
> +            return 1;
>          }
>          /* Perform all of the comparisons. */
>          n =3D checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
> @@ -829,23 +841,39 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          }
>          if (n =3D=3D c) {
>              if (!mem2) {
> -                goto done;
> +                return 1;
>              }
>              n +=3D checkN(mem2, 0, ptr_tag, tag_count - c);
>          }
>      }
>=20=20
> +    if (likely(n =3D=3D tag_count)) {
> +        return 1;
> +    }
> +
>      /*
>       * If we failed, we know which granule.  For the first granule, the
>       * failure address is @ptr, the first byte accessed.  Otherwise the
>       * failure address is the first byte of the nth granule.
>       */
> -    if (unlikely(n < tag_count)) {
> -        uint64_t fault =3D (n =3D=3D 0 ? ptr : tag_first + n * TAG_GRANU=
LE);
> -        mte_check_fail(env, desc, fault, ra);
> +    if (n > 0) {
> +        *fault =3D tag_first + n * TAG_GRANULE;
>      }
> +    return 0;
> +}
>=20=20
> - done:
> +uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
> +                    uint64_t ptr, uintptr_t ra)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, ra, total, &fault);
> +
> +    if (unlikely(ret =3D=3D 0)) {
> +        mte_check_fail(env, desc, fault, ra);
> +    } else if (ret < 0) {
> +        return ptr;
> +    }
>      return useronly_clean_ptr(ptr);
>  }

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
