Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s200-v6sm1686568wmb.44.2018.06.28.07.04.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jun 2018 07:04:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 04F983E07DD;
	Thu, 28 Jun 2018 15:04:58 +0100 (BST)
References: <20180627043328.11531-1-richard.henderson@linaro.org> <20180627043328.11531-34-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot product (indexed)
In-reply-to: <20180627043328.11531-34-richard.henderson@linaro.org>
Date: Thu, 28 Jun 2018 15:04:57 +0100
Message-ID: <87sh57uhva.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BxmJoYvmpqw6


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v6: Rearrange the loops.  The compiler does well with this form
>     and hopefully they are also easier to read.
> ---
>  target/arm/helper.h        |   5 ++
>  target/arm/translate-sve.c |  18 ++++++
>  target/arm/vec_helper.c    | 124 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |   8 ++-
>  4 files changed, 154 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index e23ce7ff19..59e8c3bd1b 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -588,6 +588,11 @@ DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, voi=
d, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i3=
2)
>  DEF_HELPER_FLAGS_4(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i3=
2)
>
> +DEF_HELPER_FLAGS_4(gvec_sdot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr=
, i32)
> +DEF_HELPER_FLAGS_4(gvec_udot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr=
, i32)
> +DEF_HELPER_FLAGS_4(gvec_sdot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr=
, i32)
> +DEF_HELPER_FLAGS_4(gvec_udot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr=
, i32)
> +
>  DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 8a2bd1f8c5..3cff71cae8 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3440,6 +3440,24 @@ static bool trans_DOT_zzz(DisasContext *s, arg_DOT=
_zzz *a, uint32_t insn)
>      return true;
>  }
>
> +static bool trans_DOT_zzx(DisasContext *s, arg_DOT_zzx *a, uint32_t insn)
> +{
> +    static gen_helper_gvec_3 * const fns[2][2] =3D {
> +        { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
> +        { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
> +    };
> +
> +    if (sve_access_check(s)) {
> +        unsigned vsz =3D vec_full_reg_size(s);
> +        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
> +                           vec_full_reg_offset(s, a->rn),
> +                           vec_full_reg_offset(s, a->rm),
> +                           vsz, vsz, a->index, fns[a->u][a->sz]);
> +    }
> +    return true;
> +}
> +
> +
>  /*
>   *** SVE Floating Point Multiply-Add Indexed Group
>   */
> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index c16a30c3b5..37f338732e 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -261,6 +261,130 @@ void HELPER(gvec_udot_h)(void *vd, void *vn, void *=
vm, uint32_t desc)
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
>
> +void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, segend, opr_sz =3D simd_oprsz(desc), opr_sz_4 =3D opr_sz=
 / 4;
> +    intptr_t index =3D simd_data(desc);
> +    uint32_t *d =3D vd;
> +    int8_t *n =3D vn;
> +    int8_t *m_indexed =3D (int8_t *)vm + index * 4;
> +
> +    /* Notice the special case of opr_sz =3D=3D 8, from aa64/aa32 advsim=
d.
> +     * Otherwise opr_sz is a multiple of 16.
> +     */
> +    segend =3D MIN(4, opr_sz_4);
> +    i =3D 0;
> +    do {
> +        int8_t m0 =3D m_indexed[i * 4 + 0];
> +        int8_t m1 =3D m_indexed[i * 4 + 1];
> +        int8_t m2 =3D m_indexed[i * 4 + 2];
> +        int8_t m3 =3D m_indexed[i * 4 + 3];
> +
> +        do {
> +            d[i] +=3D n[i * 4 + 0] * m0
> +                  + n[i * 4 + 1] * m1
> +                  + n[i * 4 + 2] * m2
> +                  + n[i * 4 + 3] * m3;
> +        } while (++i < segend);
> +        segend =3D i + 4;
> +    } while (i < opr_sz_4);
> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, segend, opr_sz =3D simd_oprsz(desc), opr_sz_4 =3D opr_sz=
 / 4;
> +    intptr_t index =3D simd_data(desc);
> +    uint32_t *d =3D vd;
> +    uint8_t *n =3D vn;
> +    uint8_t *m_indexed =3D (uint8_t *)vm + index * 4;
> +
> +    /* Notice the special case of opr_sz =3D=3D 8, from aa64/aa32 advsim=
d.
> +     * Otherwise opr_sz is a multiple of 16.
> +     */
> +    segend =3D MIN(4, opr_sz_4);
> +    i =3D 0;
> +    do {
> +        uint8_t m0 =3D m_indexed[i * 4 + 0];
> +        uint8_t m1 =3D m_indexed[i * 4 + 1];
> +        uint8_t m2 =3D m_indexed[i * 4 + 2];
> +        uint8_t m3 =3D m_indexed[i * 4 + 3];
> +
> +        do {
> +            d[i] +=3D n[i * 4 + 0] * m0
> +                  + n[i * 4 + 1] * m1
> +                  + n[i * 4 + 2] * m2
> +                  + n[i * 4 + 3] * m3;
> +        } while (++i < segend);
> +        segend =3D i + 4;
> +    } while (i < opr_sz_4);
> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, opr_sz =3D simd_oprsz(desc), opr_sz_8 =3D opr_sz / 8;
> +    intptr_t index =3D simd_data(desc);
> +    uint64_t *d =3D vd;
> +    int16_t *n =3D vn;
> +    int16_t *m_indexed =3D (int16_t *)vm + index * 4;
> +
> +    /* This is supported by SVE only, so opr_sz is always a multiple of =
16.
> +     * Process the entire segment all at once, writing back the results
> +     * only after we've consumed all of the inputs.
> +     */
> +    for (i =3D 0; i < opr_sz_8 ; i +=3D 2) {
> +        uint64_t d0, d1;
> +
> +        d0  =3D n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
> +        d0 +=3D n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
> +        d0 +=3D n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
> +        d0 +=3D n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
> +        d1  =3D n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
> +        d1 +=3D n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
> +        d1 +=3D n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
> +        d1 +=3D n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
> +
> +        d[i + 0] +=3D d0;
> +        d[i + 1] +=3D d1;
> +    }

Looking at the dissembler output I guess the metrics don't make it worth
the compiler vectorising any of this which is a shame.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, opr_sz =3D simd_oprsz(desc), opr_sz_8 =3D opr_sz / 8;
> +    intptr_t index =3D simd_data(desc);
> +    uint64_t *d =3D vd;
> +    uint16_t *n =3D vn;
> +    uint16_t *m_indexed =3D (uint16_t *)vm + index * 4;
> +
> +    /* This is supported by SVE only, so opr_sz is always a multiple of =
16.
> +     * Process the entire segment all at once, writing back the results
> +     * only after we've consumed all of the inputs.
> +     */
> +    for (i =3D 0; i < opr_sz_8 ; i +=3D 2) {
> +        uint64_t d0, d1;
> +
> +        d0  =3D n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
> +        d0 +=3D n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
> +        d0 +=3D n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
> +        d0 +=3D n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
> +        d1  =3D n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
> +        d1 +=3D n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
> +        d1 +=3D n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
> +        d1 +=3D n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
> +
> +        d[i + 0] +=3D d0;
> +        d[i + 1] +=3D d1;
> +    }
> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
>  void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
>                           void *vfpst, uint32_t desc)
>  {
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 35415bfb6c..e10b689454 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -726,7 +726,13 @@ UMIN_zzi        00100101 .. 101 011 110 ........ ...=
..          @rdn_i8u
>  MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
>
>  # SVE integer dot product (unpredicated)
> -DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
> +DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5      ra=3D%re=
g_movprfx
> +
> +# SVE integer dot product (indexed)
> +DOT_zzx         01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
> +                sz=3D0 ra=3D%reg_movprfx
> +DOT_zzx         01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
> +                sz=3D1 ra=3D%reg_movprfx
>
>  # SVE floating-point complex add (predicated)
>  FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \


--
Alex Benn=C3=A9e
