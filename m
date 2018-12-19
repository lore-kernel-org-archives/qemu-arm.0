Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t12sm9522288wrr.65.2018.12.19.10.45.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Dec 2018 10:45:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id ADC703E0380;
	Wed, 19 Dec 2018 18:45:54 +0000 (GMT)
References: <20181210152850.435-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Emit barriers for A32/T32 load-acquire/store-release insns
In-reply-to: <20181210152850.435-1-peter.maydell@linaro.org>
Date: Wed, 19 Dec 2018 18:45:54 +0000
Message-ID: <87h8f99wyl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +/3mvLh4N35W


Peter Maydell <peter.maydell@linaro.org> writes:

> Now that MTTCG is here, the comment in the 32-bit Arm decoder that
> "Since the emulation does not have barriers, the acquire/release
> semantics need no special handling" is no longer true. Emit the
> correct barriers for the load-acquire/store-release insns, as
> we already do in the A64 decoder.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I've not run into this in practice, and there's very little
> aarch32 code out there that is built to use the new-in-v8
> instructions as far as I'm aware, but since it would be very
> painful to track down this bug if we ran into it in the
> wild it seems worth fixing...

There should be a patch in reply to this that ports my barrier tests to
a linux-user tcg test case. However I've been unable to get the "mp"
test to fail under translation, even on aarch64 hosts
(ThunderX/qemu-test) which are nominally out of order. x86 hosts are
pretty forgiving anyway. The SynQuacer being A53 based is stubbornly
in-order so won't fail anyway. If you have access to any fancy OoO
AArch32 hardware to confirm the test is good please let me know.

Anyway I can at least confirm that when running the mp_acqrel test case
that the correct barrier ops are emitted. All the barrier tests pass
so:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
[by inspection]
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  target/arm/translate.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 7c4675ffd8a..e8fd824f3f5 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9733,6 +9733,8 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>                      rd =3D (insn >> 12) & 0xf;
>                      if (insn & (1 << 23)) {
>                          /* load/store exclusive */
> +                        bool is_ld =3D extract32(insn, 20, 1);
> +                        bool is_lasr =3D !extract32(insn, 8, 1);
>                          int op2 =3D (insn >> 8) & 3;
>                          op1 =3D (insn >> 21) & 0x3;
>
> @@ -9760,11 +9762,12 @@ static void disas_arm_insn(DisasContext *s, unsig=
ned int insn)
>                          addr =3D tcg_temp_local_new_i32();
>                          load_reg_var(s, addr, rn);
>
> -                        /* Since the emulation does not have barriers,
> -                           the acquire/release semantics need no special
> -                           handling */
> +                        if (is_lasr && !is_ld) {
> +                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +                        }
> +
>                          if (op2 =3D=3D 0) {
> -                            if (insn & (1 << 20)) {
> +                            if (is_ld) {
>                                  tmp =3D tcg_temp_new_i32();
>                                  switch (op1) {
>                                  case 0: /* lda */
> @@ -9810,7 +9813,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>                                  }
>                                  tcg_temp_free_i32(tmp);
>                              }
> -                        } else if (insn & (1 << 20)) {
> +                        } else if (is_ld) {
>                              switch (op1) {
>                              case 0: /* ldrex */
>                                  gen_load_exclusive(s, rd, 15, addr, 2);
> @@ -9847,6 +9850,10 @@ static void disas_arm_insn(DisasContext *s, unsign=
ed int insn)
>                              }
>                          }
>                          tcg_temp_free_i32(addr);
> +
> +                        if (is_lasr && is_ld) {
> +                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +                        }
>                      } else if ((insn & 0x00300f00) =3D=3D 0) {
>                          /* 0bcccc_0001_0x00_xxxx_xxxx_0000_1001_xxxx
>                          *  - SWP, SWPB
> @@ -10862,6 +10869,8 @@ static void disas_thumb2_insn(DisasContext *s, ui=
nt32_t insn)
>                  tcg_gen_addi_i32(tmp, tmp, s->pc);
>                  store_reg(s, 15, tmp);
>              } else {
> +                bool is_lasr =3D false;
> +                bool is_ld =3D extract32(insn, 20, 1);
>                  int op2 =3D (insn >> 6) & 0x3;
>                  op =3D (insn >> 4) & 0x3;
>                  switch (op2) {
> @@ -10883,12 +10892,18 @@ static void disas_thumb2_insn(DisasContext *s, =
uint32_t insn)
>                  case 3:
>                      /* Load-acquire/store-release exclusive */
>                      ARCH(8);
> +                    is_lasr =3D true;
>                      break;
>                  }
> +
> +                if (is_lasr && !is_ld) {
> +                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +                }
> +
>                  addr =3D tcg_temp_local_new_i32();
>                  load_reg_var(s, addr, rn);
>                  if (!(op2 & 1)) {
> -                    if (insn & (1 << 20)) {
> +                    if (is_ld) {
>                          tmp =3D tcg_temp_new_i32();
>                          switch (op) {
>                          case 0: /* ldab */
> @@ -10927,12 +10942,16 @@ static void disas_thumb2_insn(DisasContext *s, =
uint32_t insn)
>                          }
>                          tcg_temp_free_i32(tmp);
>                      }
> -                } else if (insn & (1 << 20)) {
> +                } else if (is_ld) {
>                      gen_load_exclusive(s, rs, rd, addr, op);
>                  } else {
>                      gen_store_exclusive(s, rm, rs, rd, addr, op);
>                  }
>                  tcg_temp_free_i32(addr);
> +
> +                if (is_lasr && is_ld) {
> +                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +                }
>              }
>          } else {
>              /* Load/store multiple, RFE, SRS.  */


--
Alex Benn=C3=A9e
