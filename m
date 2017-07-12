Received: by 10.25.44.15 with SMTP id s15csp641889lfs;
        Wed, 12 Jul 2017 03:57:13 -0700 (PDT)
X-Received: by 10.223.155.150 with SMTP id d22mr2581721wrc.193.1499857033574;
        Wed, 12 Jul 2017 03:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499857033; cv=none;
        d=google.com; s=arc-20160816;
        b=gCCUjJIhPssvqmmpZHcmsnUv8FEiUrQlNVoKpsNiios6InPJgYxm2vppqR/qF5ceYT
         403+T4pSNZ0eT37qbtGNYAJOsKzGSHh5g4Br/VVVns85ZtzGMzz5cna9H/Ad1g5KUKss
         FdbtbORucGJCvsA3JPELRBeu8nhBapT+KuDvsuq7hxMu5F+6xjdwlwatwi5YoHMQQZyk
         R40/ZaDoHa5Q9brhxsO/3NKRMk9ClpjbU5sVmB0HKFQiBzM2GQLX+/TxDIBvSX8jnW1v
         dwSAclt2NwtAttbktx5nm7hf6BAKQ82Cm/ptcYOUd26ec0I1/fNFanuDGCoa30dqVU/m
         RUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=ZZiGXzItudTf7NTX+ciEogYhq7yzm3NkEkQDnJiBMYw=;
        b=FLnromGa7yicathvtN5aKKsWprJ67wGALtBuxVZRt5Sn6M1Vyq1DyK91hZnh76qZ3P
         IAkHH6x3AxUtJeBpeJHwmBRKWh7LqEg8GxbUUBCukbewJRVr9r57oVbJwXyx6BlbbulL
         /nmKnaFHEFF+zGPMObmHT0+7Qn9h7/LbgaZahYfWC6XBCavtkehTbLytmvxgggswl/L5
         TBlepqzZs7AQllnV4h27EAoSe+08Ps3gFuKyBNcji6ZIRcJwgFcDqKjzUM2uQcx6CXdP
         cdojs283WGb7J9DbPa4MLDlZlvGtC7hIDT2U34CO4Xlcv2Lk9OeOiRvOfF7R0ErwM7Pp
         Rp9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id o107si1622053wrc.134.2017.07.12.03.57.13;
        Wed, 12 Jul 2017 03:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6CAv4BO007024;
	Wed, 12 Jul 2017 12:57:04 +0200
Received: from localhost (unknown [132.68.137.33])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id DAC0888F;
	Wed, 12 Jul 2017 12:56:58 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Alexander Graf <agraf@suse.de>, Chris Wulff <crwulff@gmail.com>,
        qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
        Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
        "Emilio G. Cota" <cota@braap.org>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v12 03/27] target: [tcg] Use a generic enum for DISAS_ values
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
	<149942834870.8972.2146924083027836035.stgit@frigg.lan>
	<87bmoq9g13.fsf@linaro.org>
Mail-Followup-To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut
	<marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>, Eduardo
	Habkost <ehabkost@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Alexander Graf <agraf@suse.de>, Chris
	Wulff <crwulff@gmail.com>, qemu-devel@nongnu.org, Laurent Vivier
	<laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, Michael Walle
	<michael@walle.cc>, "Emilio G. Cota" <cota@braap.org>, "open list\:ARM"
	<qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne
	<shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Richard
	Henderson <rth@twiddle.net>
Date: Wed, 12 Jul 2017 13:56:57 +0300
In-Reply-To: <87bmoq9g13.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 12
	Jul 2017 10:10:48 +0100")
Message-ID: <87wp7dexdy.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LxsqqoKsps/N

Alex Benn=C3=A9e writes:

> Llu=C3=ADs Vilanova <vilanova@ac.upc.edu> writes:

>> Used later. An enum makes expected values explicit and bounds the value =
space of
>> switches.
>>=20
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> Reviewed-by: Emilio G. Cota <cota@braap.org>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>> include/exec/exec-all.h       |    6 ------
>> include/exec/translator.h     |   39 +++++++++++++++++++++++++++++++++++=
++++
>> target/arm/translate.h        |   26 ++++++++++++++++----------
>> target/cris/translate.c       |    7 ++++++-
>> target/i386/translate.c       |    4 ++++
>> target/lm32/translate.c       |    6 ++++++
>> target/m68k/translate.c       |    7 ++++++-
>> target/microblaze/translate.c |    6 ++++++
>> target/nios2/translate.c      |    6 ++++++
>> target/openrisc/translate.c   |    6 ++++++
>> target/s390x/translate.c      |    3 ++-
>> target/unicore32/translate.c  |    7 ++++++-
>> target/xtensa/translate.c     |    4 ++++
>> 13 files changed, 107 insertions(+), 20 deletions(-)
>> create mode 100644 include/exec/translator.h
>>=20
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 0826894ec5..27498cf740 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -35,12 +35,6 @@ typedef abi_ulong tb_page_addr_t;
>> typedef ram_addr_t tb_page_addr_t;
>> #endif
>>=20
>> -/* is_jmp field values */
>> -#define DISAS_NEXT    0 /* next instruction can be analyzed */
>> -#define DISAS_JUMP    1 /* only pc was modified dynamically */
>> -#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
>> -#define DISAS_TB_JUMP 3 /* only pc was modified statically */
>> -
>> #include "qemu/log.h"
>>=20
>> void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb);
>> diff --git a/include/exec/translator.h b/include/exec/translator.h
>> new file mode 100644
>> index 0000000000..1f9697dd31
>> --- /dev/null
>> +++ b/include/exec/translator.h
>> @@ -0,0 +1,39 @@
>> +/*
>> + * Generic intermediate code generation.
>> + *
>> + * Copyright (C) 2016-2017 Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef EXEC__TRANSLATOR_H
>> +#define EXEC__TRANSLATOR_H
>> +
>> +/**
>> + * DisasJumpType:
>> + * @DISAS_NEXT: Next instruction in program order.
>> + * @DISAS_TOO_MANY: Too many instructions translated.
>> + * @DISAS_TARGET: Start of target-specific conditions.
>> + *
>> + * What instruction to disassemble next.
>> + */
>> +typedef enum DisasJumpType {
>> +    DISAS_NEXT,
>> +    DISAS_TOO_MANY,

> Is DISAS_TOO_MANY really a useful distinction. Sure we have ended the
> loop because of an instruction limit but the more important information
> is what it means for the epilogue code and how we go to the next block.

You mean this is just the sae as DISAS_NEXT? Could be, I don't know about a=
ll
the other targets.

> The recent work on fixing eret on ARM[1] has had me thinking about the
> semantics of exit conditions and how much commonality we have across the
> translators. I don't think we'll ever have a comprehensive DisasJumpType
> that all translators will only use the common exits but I think we could
> stand to have a few more.

> I think the cases we want to cover are:

>   DISAS_JUMP - the block ends with a jump to the next block (either
>                computed via PC or hard-coded with patched branch to next =
TB)

>   DISAS_NORETURN - the block exits via a helper or some other mechanism
>                   (for example cpu_loop_exit from helper)

>   DISAS_EXIT_LOOP - we need to return to the main loop before we enter
>                     again (typically to deal with IRQ issues)


> [1] https://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg02963.html

Right now (v13 that I will send after this round of reviews) it only has
DISAS_TOO_MANY and DISAS_NORETURN because these are the only ones used in t=
he
generic code.

I'm not that familiar with the internals of the disassembly process of all =
the
many targets in QEMU, and so I prefer to stick to the bare minimum we clear=
ly
need now, and only later refactor target-specific DISAS_* values into gener=
ic
ones.

If you provide me a rename mapping from i386 and arm to the values you're
proposing, I can send it for v13, but would otherwise prefer to stick to the
current state of affairs.


>> +    DISAS_TARGET_0,
>> +    DISAS_TARGET_1,
>> +    DISAS_TARGET_2,
>> +    DISAS_TARGET_3,
>> +    DISAS_TARGET_4,
>> +    DISAS_TARGET_5,
>> +    DISAS_TARGET_6,
>> +    DISAS_TARGET_7,
>> +    DISAS_TARGET_8,
>> +    DISAS_TARGET_9,
>> +    DISAS_TARGET_10,
>> +    DISAS_TARGET_11,
>> +    DISAS_TARGET_12,
>> +} DisasJumpType;
>> +
>> +#endif  /* EXEC__TRANSLATOR_H */
>> diff --git a/target/arm/translate.h b/target/arm/translate.h
>> index e5da614db5..aba3f44c9f 100644
>> --- a/target/arm/translate.h
>> +++ b/target/arm/translate.h
>> @@ -1,6 +1,9 @@
>> #ifndef TARGET_ARM_TRANSLATE_H
>> #define TARGET_ARM_TRANSLATE_H
>>=20
>> +#include "exec/translator.h"
>> +
>> +
>> /* internal defines */
>> typedef struct DisasContext {
>> target_ulong pc;
>> @@ -119,30 +122,33 @@ static void disas_set_insn_syndrome(DisasContext *=
s, uint32_t syn)
s-> insn_start_idx =3D 0;
>> }
>>=20
>> -/* target-specific extra values for is_jmp */
>> +/* is_jmp field values */
>> +#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamicall=
y */
>> +#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamica=
lly */
>> +#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically=
 */
>> /* These instructions trap after executing, so the A32/T32 decoder must
>> * defer them until after the conditional execution state has been update=
d.
>> * WFI also needs special handling when single-stepping.
>> */
>> -#define DISAS_WFI 4
>> -#define DISAS_SWI 5

> So in the new model for example we only really need the special handling
> for things like WFI/SWI onwards.

And how do the previous ones map to the generic ones? And what about the i3=
86
target?


Thanks,
  Lluis
