Received: by 10.25.44.15 with SMTP id s15csp1966043lfs;
        Sat, 15 Jul 2017 00:46:33 -0700 (PDT)
X-Received: by 10.28.13.145 with SMTP id 139mr344239wmn.49.1500104793508;
        Sat, 15 Jul 2017 00:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500104793; cv=none;
        d=google.com; s=arc-20160816;
        b=nKV41Cd3WuOoKZi1ttkoZ5lbeKvCodQA6YK9wjLSYyUvZnGfZo/hl/pcUlDJO6uBBP
         bjCm7RC76GEak9IX1emxXaCwHiJCF0ugeK84/M7Ls+ZgArXKbFtGvCLMtsTb/WtKcChF
         qpaN9CmOjWEuPU5IqpozsSFeglyDmWjONi8kWNNmdqJTrCxByzRRbEGX87f6/1+qQD8E
         4d8mvdiafLEfrQuz0F1JMszjTrmj3Pmj631Uy199Uax8IG9+TlCaP5HFBrQ8GLiYTEd1
         U3LWi425wk11/Hery7Rw5a98Om1pcLlRzSmnUgzOBWR6mzhTdKUbtGFygG37nkychw+f
         wGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=g7qrZea60wo56/XPxLa2T683pFM5uAYNtJa3rS7+BZg=;
        b=xMNfThlAWSPNjvtyhzmy2ucSvqNUFs0ID6uMb3UhaK9K0d4ubWTtGW1OAolfVtkmFu
         i1G3u+/vhJFKWIhM6htpMC9cllzR5z4IE3u6UsQioABR7K7FgVWwT/VjTSiA6Zf6qk/i
         s3/Mdn48EpjYZbJskL0klvKp7IWLWaj/7DkS31UvRL0wIT4Oni7Nirq5l/XPXR1JYIR7
         4rCsiB5OJr51CmmjK/kbo0spaCJR/JrC8NwGzWK65guUJ+TYirF8eLr0tOZtZ8kEHfF7
         PTrFxCWPNpcd7m3hTlLvmLfBzbQel7gVwef5PBITb2sJZz0pYWv4TTHP8RaDxq3vKm81
         H75w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 63si4895413wra.135.2017.07.15.00.46.33;
        Sat, 15 Jul 2017 00:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6F7kTCC004922;
	Sat, 15 Jul 2017 09:46:30 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 24A283BE;
	Sat, 15 Jul 2017 09:46:24 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Peter Crosthwaite
 <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "open list\:ARM"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v13 18/26] target/arm: [tcg] Port to breakpoint_check
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
	<150002437386.22386.7745855254236101855.stgit@frigg.lan>
	<584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM"
	<qemu-arm@nongnu.org>
Date: Sat, 15 Jul 2017 10:46:22 +0300
In-Reply-To: <584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net> (Richard
	Henderson's message of "Fri, 14 Jul 2017 07:26:01 -1000")
Message-ID: <87k23ab0s1.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fAFwYjdyf0Qo

Richard Henderson writes:

> On 07/13/2017 11:26 PM, Llu=C3=ADs Vilanova wrote:
>> Incrementally paves the way towards using the generic instruction transl=
ation
>> loop.
>>=20
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>> target/arm/translate.c |   53 +++++++++++++++++++++++++++++++-----------=
------
>> 1 file changed, 34 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index b9183fc511..55bef09739 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -11917,6 +11917,33 @@ static void arm_tr_insn_start(DisasContextBase =
*dcbase, CPUState *cpu)
>> #endif
>> }
>> +static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState
>> *cpu,
>> +                                    const CPUBreakpoint *bp)
>> +{
>> +    DisasContext *dc =3D container_of(dcbase, DisasContext, base);
>> +
>> +    if (bp->flags & BP_CPU) {
>> +        gen_set_condexec(dc);
>> +        gen_set_pc_im(dc, dc->pc);
>> +        gen_helper_check_breakpoints(cpu_env);
>> +        /* End the TB early; it's likely not going to be executed */
>> +        dc->base.is_jmp =3D DISAS_UPDATE;
>> +    } else {
>> +        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
>> +        /* The address covered by the breakpoint must be
>> +           included in [tb->pc, tb->pc + tb->size) in order
>> +           to for it to be properly cleared -- thus we
>> +           increment the PC here so that the logic setting
>> +           tb->size below does the right thing.  */
>> +        /* TODO: Advance PC by correct instruction length to
>> +         * avoid disassembler error messages */
>> +        dc->pc +=3D 2;
>> +        dc->base.is_jmp =3D DISAS_NORETURN;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> /* generate intermediate code for basic block 'tb'.  */
>> void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>> {
>> @@ -11965,28 +11992,16 @@ void gen_intermediate_code(CPUState *cs, Trans=
lationBlock *tb)
>> if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>> CPUBreakpoint *bp;
>> QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
>> -                if (bp->pc =3D=3D dc->pc) {
>> -                    if (bp->flags & BP_CPU) {
>> -                        gen_set_condexec(dc);
>> -                        gen_set_pc_im(dc, dc->pc);
>> -                        gen_helper_check_breakpoints(cpu_env);
>> -                        /* End the TB early; it's likely not going to b=
e executed */
>> -                        dc->base.is_jmp =3D DISAS_UPDATE;

> Oh I see what you're doing there in the main loop.
> And I see that you're copying existing behaviour.

> That said, I do wonder if there's a better way.

> Looking back at the original patch (5d98bf8f), there do not
> seem to have been any other side effects intended; simply
> "single step" any insn for which this bp condition is met.

> Another way to handle this would be if we could adjust max_insns =3D num_=
insns.
> That would cause the loop to exit after the current insn, with DISAS_TOO_=
MANY if
> nothing else.

But adjusting num_insns (I guess passed as a pointer to breakpoint_check())=
 will
stop *after* translating the instructions, instead of before as some target=
s do
currently.

I'd really prefer to keep the current behaviour, and if in the end we see t=
hat
the use of DISAS_NORETURN in all targets is safe to switch into DISAS_TOO_M=
ANY,
we can do so in a future patch.

Cheers,
  Lluis
