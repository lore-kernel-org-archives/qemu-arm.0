Received: by 10.25.44.15 with SMTP id s15csp652148lfs;
        Wed, 12 Jul 2017 04:06:02 -0700 (PDT)
X-Received: by 10.28.170.8 with SMTP id t8mr2222628wme.111.1499857562087;
        Wed, 12 Jul 2017 04:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499857562; cv=none;
        d=google.com; s=arc-20160816;
        b=glsakon+UvFIwTxAvDjpYrefCX1HSaU0Dqk709D76AWjHr6RiwbCuCvxhaXl5JxFtC
         qGxChInMDwGpp1DdPfDy/MboBODojW2hkTVs9n+PMGjj0z1SyWCV07RmJL2Egz2/A1Ge
         wb26DorR3EsiZ/imsY9IN0Dib6OVRimIYgzYdiB4AGCpfV1zTezc5Uu3RQeIfcqkUvU8
         c46os9+oosDtD3CKo4+Q6QcB/RS9CQIjzas73MfgwpyrjoloRKdvoJmJUzNRvZRtRZda
         QPJENHqoLH2pTBGbfpn7JAiTy0PvlV4GoTTYMyEarSZHMKel2rRCa8no8JoCT6YjQ7Nv
         44Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=X8NAnnsJo68efYOK+CpulBroMGu4j/EdII48jtbiMVc=;
        b=cldm9aPxjHcaol/KF+xVsIuIjVa1RZ7A/6/0JryXllyr1kzALO4JHV3FplodzAX7Jr
         +WsYqWGT0SVC6L8i+7+sNr3UWlj5jRhxNJMrRMqBYYOF7BR0u5iPdOb6MK+F3qQnJih1
         4Re2TQ0KCseQmMjBHsDVcUsCSVzoGS0tPwUBHAm/GF6y3j7RvGNeQgkpTYb0HPGHm9DC
         zZndnso3MpB6Kaa6TP0zZCbg9/vj9gW/bcQnNkiiBfFfgsQXnYw/ye11sZMWTBQjgzBH
         um6FuqrDcFUTeyweBiiHJXja4uJTg5+nzit4Kmq1YWdzFtZ9U3QovMBM177QcgTTVUTq
         ouDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id x72si1947650wmf.47.2017.07.12.04.06.01;
        Wed, 12 Jul 2017 04:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6CB5rWB007395;
	Wed, 12 Jul 2017 13:05:53 +0200
Received: from localhost (unknown [132.68.137.33])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 0D5143AF;
	Wed, 12 Jul 2017 13:05:47 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
        "Emilio G. Cota" <cota@braap.org>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v12 21/27] target/arm: [tcg] Port to translate_insn
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
	<149943279497.8972.16033572732296843579.stgit@frigg.lan>
	<87vamy804n.fsf@linaro.org>
Mail-Followup-To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org, "Emilio G. Cota"
	<cota@braap.org>, "open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Date: Wed, 12 Jul 2017 14:05:46 +0300
In-Reply-To: <87vamy804n.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 12
	Jul 2017 10:39:36 +0100")
Message-ID: <87inixewz9.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5B1p0X6LSyVw

Alex Benn=C3=A9e writes:

> Llu=C3=ADs Vilanova <vilanova@ac.upc.edu> writes:

>> Incrementally paves the way towards using the generic instruction transl=
ation
>> loop.
>>=20
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> ---
>> target/arm/translate.c |  148 ++++++++++++++++++++++++++++--------------=
------
>> target/arm/translate.h |    2 +
>> 2 files changed, 87 insertions(+), 63 deletions(-)
>>=20
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 29428b2920..9d033f2fb7 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -11842,6 +11842,9 @@ static void arm_tr_init_disas_context(DisasConte=
xtBase *dcbase,
dc-> is_ldex =3D false;
dc-> ss_same_el =3D false; /* Can't be true since EL_d must be AArch64 */
>>=20
>> +    dc->next_page_start =3D
>> +        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
>> +
>>=20
>> cpu_F0s =3D tcg_temp_new_i32();
>> cpu_F1s =3D tcg_temp_new_i32();
>> @@ -11942,14 +11945,83 @@ static BreakpointCheckType arm_tr_breakpoint_c=
heck(
>> }
>> }
>>=20
>> +static target_ulong arm_tr_translate_insn(DisasContextBase *dcbase,
>> +                                               CPUState *cpu)
>> +{
>> +    DisasContext *dc =3D container_of(dcbase, DisasContext, base);
>> +    CPUARMState *env =3D cpu->env_ptr;
>> +
>> +    if (dc->ss_active && !dc->pstate_ss) {
>> +        /* Singlestep state is Active-pending.
>> +         * If we're in this state at the start of a TB then either
>> +         *  a) we just took an exception to an EL which is being debugg=
ed
>> +         *     and this is the first insn in the exception handler
>> +         *  b) debug exceptions were masked and we just unmasked them
>> +         *     without changing EL (eg by clearing PSTATE.D)
>> +         * In either case we're going to take a swstep exception in the
>> +         * "did not step an insn" case, and so the syndrome ISV and EX
>> +         * bits should be zero.
>> +         */
>> +        assert(dc->base.num_insns =3D=3D 1);
>> +        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
>> +                      default_exception_el(dc));
>> +        dc->base.is_jmp =3D DISAS_SKIP;
>> +        return dc->pc;
>> +    }
>> +
>> +    if (dc->thumb) {
>> +        disas_thumb_insn(env, dc);
>> +        if (dc->condexec_mask) {
>> +            dc->condexec_cond =3D (dc->condexec_cond & 0xe)
>> +                | ((dc->condexec_mask >> 4) & 1);
>> +            dc->condexec_mask =3D (dc->condexec_mask << 1) & 0x1f;
>> +            if (dc->condexec_mask =3D=3D 0) {
>> +                dc->condexec_cond =3D 0;
>> +            }
>> +        }
>> +    } else {
>> +        unsigned int insn =3D arm_ldl_code(env, dc->pc, dc->sctlr_b);
>> +        dc->pc +=3D 4;
>> +        disas_arm_insn(dc, insn);
>> +    }
>> +
>> +    if (dc->condjmp && !dc->base.is_jmp) {
>> +        gen_set_label(dc->condlabel);
>> +        dc->condjmp =3D 0;
>> +    }
>> +
>> +    if (dc->base.is_jmp =3D=3D DISAS_NEXT) {
>> +        /* Translation stops when a conditional branch is encountered.
>> +         * Otherwise the subsequent code could get translated several t=
imes.
>> +         * Also stop translation when a page boundary is reached.  This
>> +         * ensures prefetch aborts occur at the right place.  */
>> +
>> +        if (is_singlestepping(dc)) {
>> +            dc->base.is_jmp =3D DISAS_TOO_MANY;
>> +        } else if ((dc->pc >=3D dc->next_page_start) ||
>> +                   ((dc->pc >=3D dc->next_page_start - 3) &&
>> +                    insn_crosses_page(env, dc))) {
>> +            /* We want to stop the TB if the next insn starts in a new =
page,
>> +             * or if it spans between this page and the next. This mean=
s that
>> +             * if we're looking at the last halfword in the page we nee=
d to
>> +             * see if it's a 16-bit Thumb insn (which will fit in this =
TB)
>> +             * or a 32-bit Thumb insn (which won't).
>> +             * This is to avoid generating a silly TB with a single 16-=
bit insn
>> +             * in it at the end of this page (which would execute corre=
ctly
>> +             * but isn't very efficient).
>> +             */
>> +            dc->base.is_jmp =3D DISAS_TOO_MANY;
>> +        }
>> +    }
>> +
>> +    return dc->pc;
>> +}
>> +
>> /* generate intermediate code for basic block 'tb'.  */
>> void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>> {
>> -    CPUARMState *env =3D cs->env_ptr;
>> DisasContext dc1, *dc =3D &dc1;
>> -    target_ulong next_page_start;
>> int max_insns;
>> -    bool end_of_page;
>>=20
>> /* generate intermediate code */
>>=20
>> @@ -11969,7 +12041,6 @@ void gen_intermediate_code(CPUState *cs, Transla=
tionBlock *tb)
dc-> base.singlestep_enabled =3D cs->singlestep_enabled;
>> arm_tr_init_disas_context(&dc->base, cs);
>>=20
>> -    next_page_start =3D (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET=
_PAGE_SIZE;
>> max_insns =3D tb->cflags & CF_COUNT_MASK;
>> if (max_insns =3D=3D 0) {
>> max_insns =3D CF_COUNT_MASK;
>> @@ -12020,72 +12091,20 @@ void gen_intermediate_code(CPUState *cs, Trans=
lationBlock *tb)
>> gen_io_start();
>> }
>>=20
>> -        if (dc->ss_active && !dc->pstate_ss) {
>> -            /* Singlestep state is Active-pending.
>> -             * If we're in this state at the start of a TB then either
>> -             *  a) we just took an exception to an EL which is being de=
bugged
>> -             *     and this is the first insn in the exception handler
>> -             *  b) debug exceptions were masked and we just unmasked th=
em
>> -             *     without changing EL (eg by clearing PSTATE.D)
>> -             * In either case we're going to take a swstep exception in=
 the
>> -             * "did not step an insn" case, and so the syndrome ISV and=
 EX
>> -             * bits should be zero.
>> -             */
>> -            assert(dc->base.num_insns =3D=3D 1);
>> -            gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
>> -                          default_exception_el(dc));
>> -            goto done_generating;
>> -        }
>> -
>> -        if (dc->thumb) {
>> -            disas_thumb_insn(env, dc);
>> -            if (dc->condexec_mask) {
>> -                dc->condexec_cond =3D (dc->condexec_cond & 0xe)
>> -                                   | ((dc->condexec_mask >> 4) & 1);
>> -                dc->condexec_mask =3D (dc->condexec_mask << 1) & 0x1f;
>> -                if (dc->condexec_mask =3D=3D 0) {
>> -                    dc->condexec_cond =3D 0;
>> -                }
>> -            }
>> -        } else {
>> -            unsigned int insn =3D arm_ldl_code(env, dc->pc, dc->sctlr_b=
);
>> -            dc->pc +=3D 4;
>> -            disas_arm_insn(dc, insn);
>> -        }
>> -
>> -        if (dc->condjmp && !dc->base.is_jmp) {
>> -            gen_set_label(dc->condlabel);
>> -            dc->condjmp =3D 0;
>> -        }
>> +        dc->base.pc_next =3D arm_tr_translate_insn(&dc->base, cs);
>>=20
>> if (tcg_check_temp_count()) {
>> fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
dc-> pc);
>> }
>>=20
>> -        /* Translation stops when a conditional branch is encountered.
>> -         * Otherwise the subsequent code could get translated several t=
imes.
>> -         * Also stop translation when a page boundary is reached.  This
>> -         * ensures prefetch aborts occur at the right place.  */
>> -
>> -        /* We want to stop the TB if the next insn starts in a new page,
>> -         * or if it spans between this page and the next. This means th=
at
>> -         * if we're looking at the last halfword in the page we need to
>> -         * see if it's a 16-bit Thumb insn (which will fit in this TB)
>> -         * or a 32-bit Thumb insn (which won't).
>> -         * This is to avoid generating a silly TB with a single 16-bit =
insn
>> -         * in it at the end of this page (which would execute correctly
>> -         * but isn't very efficient).
>> -         */
>> -        end_of_page =3D (dc->pc >=3D next_page_start) ||
>> -            ((dc->pc >=3D next_page_start - 3) && insn_crosses_page(env=
, dc));
>> -
>> -    } while (!dc->base.is_jmp && !tcg_op_buf_full() &&
>> -             !is_singlestepping(dc) &&
>> -             !singlestep &&
>> -             !end_of_page &&
>> -             dc->base.num_insns < max_insns);
>> +        if (!dc->base.is_jmp && (tcg_op_buf_full() || singlestep ||
>> +                            dc->base.num_insns >=3D max_insns)) {
>> +            dc->base.is_jmp =3D DISAS_TOO_MANY;
>> +        }
>> +    } while (!dc->base.is_jmp);
>>=20
>> +    if (dc->base.is_jmp !=3D DISAS_SKIP) {
>> if (tb->cflags & CF_LAST_IO) {
>> if (dc->condjmp) {
>> /* FIXME:  This can theoretically happen with self-modifying
>> @@ -12123,6 +12142,7 @@ void gen_intermediate_code(CPUState *cs, Transla=
tionBlock *tb)
>> gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
>> break;
>> case DISAS_NEXT:
>> +        case DISAS_TOO_MANY:
>> case DISAS_UPDATE:
>> gen_set_pc_im(dc, dc->pc);
>> /* fall through */
>> @@ -12141,6 +12161,7 @@ void gen_intermediate_code(CPUState *cs, Transla=
tionBlock *tb)
>> */
>> switch(dc->base.is_jmp) {
>> case DISAS_NEXT:
>> +        case DISAS_TOO_MANY:
>> gen_goto_tb(dc, 1, dc->pc);
>> break;
>> case DISAS_UPDATE:
>> @@ -12194,6 +12215,7 @@ void gen_intermediate_code(CPUState *cs, Transla=
tionBlock *tb)
>> gen_goto_tb(dc, 1, dc->pc);
>> }
>> }
>> +    }
>>=20
>> done_generating:
>> gen_tb_end(tb, dc->base.num_insns);
>> diff --git a/target/arm/translate.h b/target/arm/translate.h
>> index 6fe40a344a..83e56dcb08 100644
>> --- a/target/arm/translate.h
>> +++ b/target/arm/translate.h
>> @@ -9,6 +9,7 @@ typedef struct DisasContext {
>> DisasContextBase base;
>>=20
>> target_ulong pc;
>> +    target_ulong next_page_start;
>> uint32_t insn;
>> /* Nonzero if this instruction has been conditionally skipped.  */
>> int condjmp;
>> @@ -148,6 +149,7 @@ static void disas_set_insn_syndrome(DisasContext *s,=
 uint32_t syn)
>> * as opposed to attempting to use lookup_and_goto_ptr.
>> */
>> #define DISAS_EXIT DISAS_TARGET_11
>> +#define DISAS_SKIP DISAS_TARGET_12

> What are the semantics of this new exit condition? This seems a case
> that should be covered a well defined common exit condition rather than
> yet-another-architecture specific one.

Right. As per Richard's suggestion, this is now the generic DISAS_NORETURN =
(on
the future v13).

Cheers,
  Lluis
