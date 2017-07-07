Received: by 10.25.44.15 with SMTP id s15csp359235lfs;
        Fri, 7 Jul 2017 10:32:43 -0700 (PDT)
X-Received: by 10.223.130.36 with SMTP id 33mr1436342wrb.111.1499448763716;
        Fri, 07 Jul 2017 10:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499448763; cv=none;
        d=google.com; s=arc-20160816;
        b=a1nYBDp75B2AjMM+xNjgqqIYX9xzB6S57bgQS15LVu3+1HEoVriC/KP19ZMwne+7xT
         8H04KN7B0rhmoZDBQOZCMsBbfUtuniwFOkCpHvE57gJfGudpU13La/IucGbeySTSzcuV
         qkLFO327Ke27X6b/fKSnlrGywdck3BtQesoQo0KWJmM6A/kHSolIHR1MWHAXCCG7L7Ju
         03/mhYApN5rxlvW11yYx1r+XS83d9tjxK4XGT3u+BOdjZnIts1mGH1Ho8YMPvezMBRpz
         LisRA3CBdrus+MDA5q5Un1iCNU710Wdx9PVRZHG5iW7NYavFSXB5E42P1SM8pO0hO2ca
         vrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=ulSHCXsrP8n0gzaAf0Fk+w3RldgNS0ZtWo1VUzYuLys=;
        b=dEa/N0RQ0ylNUdQBMANnk6z3L+0XF2g5Z6SC+Rpi8yWi6zFZQb8ozkLme38IRheLW0
         aVLGqj7AGIqMbpqjXAMF+zADhi7WixozCGYhkMI73hqy7fglmSL5vxacB8pLHafUrSMy
         kdCcc0IDcoYeDOTfj8nmmPt9lfqw7G4+vXdcMBGlZPkpcSdoJ/HbDMPNcRvXkKOJdHow
         pVG1zO96SLgkGS3mlqKkEGZlwy4q9l1Zew/XxqTcQbCxNueYS9y+rQnz25Zh5mNts+gZ
         +PIgXZOGRASrLqbBDA6VgLjhMWI2WeHjPUCpzqv9w2MDQF1GA7dUvqm3vnlghUkhcO8l
         wXlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 12si2635353wru.267.2017.07.07.10.32.43;
        Fri, 07 Jul 2017 10:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67HWeHa029490;
	Fri, 7 Jul 2017 19:32:40 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 1CBA3E9;
	Fri,  7 Jul 2017 19:32:35 +0200 (CEST)
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
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to translate_insn
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
	<149865801156.17063.15618379976159104550.stgit@frigg.lan>
	<244b5aab-8863-3139-f252-09cc02333eda@twiddle.net>
	<87inj4ebqn.fsf@frigg.lan>
	<c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 19:32:29 +0200
In-Reply-To: <c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net> (Richard
	Henderson's message of "Fri, 7 Jul 2017 05:46:19 -1000")
Message-ID: <87a84gcfv6.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NUeot5lq+PSi

Richard Henderson writes:

> On 07/07/2017 01:18 AM, Llu=C3=ADs Vilanova wrote:
>>>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>>>> index 9c870f6d07..586a01a2de 100644
>>>> --- a/target/arm/translate-a64.c
>>>> +++ b/target/arm/translate-a64.c
>>>> @@ -11244,6 +11244,9 @@ static void aarch64_trblock_init_disas_context=
(DisasContextBase *dcbase,
dc-> is_ldex =3D false;
dc-> ss_same_el =3D (arm_debug_target_el(env) =3D=3D dc->current_el);
>>>> +    dc->next_page_start =3D
>>>> +        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
>>=20
>>> I think a better solution for a fixed-length ISA is to adjust max_insns=
. Perhaps
>>> the init_disas_context hook should be able to modify it?
>>=20
>> ARM has the thumb instructions, so it really isn't a fixed-length ISA.

> From the filename above we're talking about AArch64 here.
> Whcih is most definitely a fixed-width ISA.


> That said, even for AArch32 we know by the TB flags whether or not we're =
going
> to be generating arm or thumb code.  I think that these hooks will allow =
arm and
> thumb mode to finally be split apart cleanly, instead of the tangle that =
they
> are now.

> I see arm's gen_intermediate_code eventually looking like

>   const TranslatorOps *ops =3D &arm_translator_ops;
>   if (ARM_TBFLAG_THUMB(tb->flags)) {
>     ops =3D &thumb_translator_ops;
>   }
> #ifdef TARGET_AARCH64
>   if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
>     ops =3D &aarch64_translator_ops;
>   }
> #endif
>   translator_loop(ops, &dc.base, cpu, tb);

> There would certainly be some amount of shared code, but it would also al=
low
> quite a few of the existing dc->thumb checks to be eliminated.

Does this really need to be addressed on this series?


>>> And, while I'm thinking of it -- why is the init_globals hook separate?=
 There's
>>> nothing in between the two hook calls, and the more modern target front=
 ends
>>> won't need it.
>>=20
>> You mean merging init_disas_context and init_globals? I wanted to keep
>> semantically different code on separate hooks, but I can pull the init_g=
lobals
>> code into init_disas_context (hoping that as targets get modernized, the=
y won't
>> initialize any global there).

> I suppose you can leave the two hooks separate for now.  It doesn't hurt,=
 and
> it's kind of a reminder of things that need cleaning up.

Well, I've sent a (too rushed) v12 that features the merge. Since I'll have=
 to
send a v13, I can split them again if you want.


> I do wonder if we should provide a generic empty hook, so that a target t=
hat
> does not need a particular hook need not define an empty function.  It co=
uld
> just put e.g. "translator_noop" into the structure.  Ok, maybe a better n=
ame
> than that...

I'm not really sure it's worth the effort. The original version trated NULL=
s as
a "skip this operation" (as Emilio suggests to revive), but after discussin=
g the
approach it was decided that defining an empty function was not too much ef=
fort,
so that's what I went for.

I can restore the NULL approach or add a default empty hook implementation
(translator_ignored_op?) if there's a strong feeling to change it.


Cheers,
  Lluis
