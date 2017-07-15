Received: by 10.25.44.15 with SMTP id s15csp1973651lfs;
        Sat, 15 Jul 2017 00:56:22 -0700 (PDT)
X-Received: by 10.28.94.13 with SMTP id s13mr301984wmb.33.1500105382426;
        Sat, 15 Jul 2017 00:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500105382; cv=none;
        d=google.com; s=arc-20160816;
        b=YiemlwqbH5U/O1lVEWXrA0McNxaBJJ+9BsfZ5IOPVZWdp7DMc15ikZ21YKxZHydV7V
         +l9Dl2LmCA4GovWdyPBcus7dXc5XiiCt/x7wLBQ9VOAILeEOwJnBWs8DO6ghCzS7oiA/
         kTzNgsXNpgbyttrN+CDeIE35FHZFxPRwbVopsaWOSw15FhIzd2IT4HugiuvUjaXC8/I5
         EfWFfUFOvD3dtz+6Ck0ponJ+i2g37hrEcZixGQtm25iwKNTvsHdBjbKEsTqcsTbl8LdR
         TB423oeir0wi/SWPrU8a4kgfIPLbFlb2+A++nHJAedrm3IDbCnFbAQl2XVy1DclWffCE
         MhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=MG0XNfe4VhqfVNJpgiB7efUikznUjL4Vhb7WrsCcpcc=;
        b=I9kqg9fPHCK/HsluRhna2NPmGDPCHqMHzm9js1den/nvma60FaKCyOSBOcgHHVBvkc
         5+W8jDHc1kj/EOXGeNSZOT9nmpyDXAKnRxhSnDPkxAxGN1HB+wiXfWK/16zc2u13GxOg
         C07RD6xfs24rR48i1XRscni/Qdz7PwinNPfO2NRFkiB79ZK7sr89n3g6xNJk2qwU5B9W
         BiK0cYNpiWKLtoK4eAUH8+byYteaYebsOQePIv14LD0Gk1W9nicP/QKvpRjFK8V8EUzL
         vY4rJBB8EVNd44iXubgTpGqifSMSeRfVAUcVjFmE4zFp4BZKgvdxmBdF4VlP9FpNKaLe
         rWTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id d138si4620197wme.188.2017.07.15.00.56.22;
        Sat, 15 Jul 2017 00:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6F7uIC9005107;
	Sat, 15 Jul 2017 09:56:18 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 4F9EB5D4;
	Sat, 15 Jul 2017 09:56:13 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Peter
 Crosthwaite <crosthwaite.peter@gmail.com>,
        "Emilio G. Cota"
 <cota@braap.org>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        Paolo Bonzini
 <pbonzini@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v13 18/26] target/arm: [tcg] Port to breakpoint_check
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
	<150002437386.22386.7745855254236101855.stgit@frigg.lan>
	<584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
	<a831e072-2a10-d6c5-5d04-f00772b85b5b@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Sat, 15 Jul 2017 10:56:12 +0300
In-Reply-To: <a831e072-2a10-d6c5-5d04-f00772b85b5b@twiddle.net> (Richard
	Henderson's message of "Fri, 14 Jul 2017 07:42:40 -1000")
Message-ID: <87eftib0bn.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: W7q2PznL5NTl

Richard Henderson writes:

> On 07/14/2017 07:26 AM, Richard Henderson wrote:
>> On 07/13/2017 11:26 PM, Llu=C3=ADs Vilanova wrote:
>>> Incrementally paves the way towards using the generic instruction trans=
lation
>>> loop.
>>>=20
>>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>> ---
>>> target/arm/translate.c |   53 +++++++++++++++++++++++++++++++----------=
-------
>>> 1 file changed, 34 insertions(+), 19 deletions(-)
>>>=20
>>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>>> index b9183fc511..55bef09739 100644
>>> --- a/target/arm/translate.c
>>> +++ b/target/arm/translate.c
>>> @@ -11917,6 +11917,33 @@ static void arm_tr_insn_start(DisasContextBase
>>> *dcbase, CPUState *cpu)
>>> #endif
>>> }
>>> +static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState=
 *cpu,
>>> +                                    const CPUBreakpoint *bp)
>>> +{
>>> +    DisasContext *dc =3D container_of(dcbase, DisasContext, base);
>>> +
>>> +    if (bp->flags & BP_CPU) {
>>> +        gen_set_condexec(dc);
>>> +        gen_set_pc_im(dc, dc->pc);
>>> +        gen_helper_check_breakpoints(cpu_env);
>>> +        /* End the TB early; it's likely not going to be executed */
>>> +        dc->base.is_jmp =3D DISAS_UPDATE;
>>> +    } else {
>>> +        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
>>> +        /* The address covered by the breakpoint must be
>>> +           included in [tb->pc, tb->pc + tb->size) in order
>>> +           to for it to be properly cleared -- thus we
>>> +           increment the PC here so that the logic setting
>>> +           tb->size below does the right thing.  */
>>> +        /* TODO: Advance PC by correct instruction length to
>>> +         * avoid disassembler error messages */
>>> +        dc->pc +=3D 2;
>>> +        dc->base.is_jmp =3D DISAS_NORETURN;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> /* generate intermediate code for basic block 'tb'.  */
>>> void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>>> {
>>> @@ -11965,28 +11992,16 @@ void gen_intermediate_code(CPUState *cs,
>>> TranslationBlock *tb)
>>> if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>>> CPUBreakpoint *bp;
>>> QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
>>> -                if (bp->pc =3D=3D dc->pc) {
>>> -                    if (bp->flags & BP_CPU) {
>>> -                        gen_set_condexec(dc);
>>> -                        gen_set_pc_im(dc, dc->pc);
>>> -                        gen_helper_check_breakpoints(cpu_env);
>>> -                        /* End the TB early; it's likely not going to =
be
>>> executed */
>>> -                        dc->base.is_jmp =3D DISAS_UPDATE;
>>=20
>> Oh I see what you're doing there in the main loop.
>> And I see that you're copying existing behaviour.
>>=20
>> That said, I do wonder if there's a better way.
>>=20
>> Looking back at the original patch (5d98bf8f), there do not
>> seem to have been any other side effects intended; simply
>> "single step" any insn for which this bp condition is met.
>>=20
>> Another way to handle this would be if we could adjust max_insns =3D num=
_insns.
>> That would cause the loop to exit after the current insn, with DISAS_TOO=
_MANY
>> if nothing else.

> Another possibility is is_jmp =3D DISAS_TOO_MANY, and exit the translatio=
n loop
> after the breakpoint check only for is_jmp > DISAS_TOO_MANY.  That allows=
 all of
> the DISAS_TARGET_N values to exit as well.

After a quick check, I see that arm uses both (DISAS_NORETURN and
DISAS_TARGET_N) to exit in different points after the breakpoint. Moxie, mi=
ps
and unicore32 use use DISAS_NORETURN, and the rest use DISAS_TARGET_N.

I really don't know if it's safe to unify into a single behaviour. I'm not =
sure
if some targets will need to differentiate between DISAS_NORETURN and
DISAS_TOO_MANY (e.g., in the tb_stop() hook). As I said, I'd prefer to keep=
 the
current approach that can accommodate all cases, and trim it down afterward=
s if
we see it's possible. That is, unless you're sure a new proposal can correc=
tly
cover the cases of all targets.

Thanks,
  Lluis
