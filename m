Received: by 10.25.44.15 with SMTP id s15csp3206912lfs;
        Fri, 7 Jul 2017 04:18:54 -0700 (PDT)
X-Received: by 10.223.143.77 with SMTP id p71mr489867wrb.3.1499426334818;
        Fri, 07 Jul 2017 04:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499426334; cv=none;
        d=google.com; s=arc-20160816;
        b=QNoEgZ0TreIlmSQ3Gt10vt8coet76jjW2Q6/11ABfkKZgnZ8/EWrz42jQ6rRMMOXvs
         0g7S2yVgq9DimuSNyaF4ooUeVw2VNCwQ3+3AZAgfps3L6PrsRYbv5sScaWO6QX3mAG9R
         6Y8XL/DxFDUzluwYoaiPOzENVN2Mi8E6A7mBOoV2kz7x8Aa7vFi0fXIaYFM4pdVW+yF9
         j04eKbYNOZmCpSMNGJaOdLZ76k8IIB3AgaRqWumw6RRU4li4hbkXNKRpuoT7R2FL6+V4
         2KnNB/aZz4DgIioL3H2Yh1x4SSMXwG8/j8EplUAvM79lFu2sGmmpyiyGx0kQL0oZsVLA
         6zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=JYmilEGKDv3//hk62FVY9cTWiaH221hOcFVtRceJCaQ=;
        b=Hx/G+3RWgGO4zBb0PwQPbOQYElHhakn4zPHdEGAbKI82acOfBVt/J1FQBrZ60Iy+F/
         4FOq6xt1SFDpTsTk13is6NhE4fo1nhv3+SjtbrGBh/bZacYF3Vae5FzEl8DX+8X4nkTB
         /l+AAnXPkWS7rGcheI9KZM4v3/Ul8o4xzZb8rKhJmyLS0aFtyCdFnpfbD297l4169BPC
         2WyC1I7LdrpKn/1r9mZi7vOGu/IcmP9CY8uMiECsCCjsscnA3aRIF6CC/Le6ootx3FCH
         PBMmZqZyh452negmIoCOGRAUS55H+y8vVVIbArQLGZvFh3w0irKwHiflpFHccUC/MHOn
         ST2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 33si2077191wra.196.2017.07.07.04.18.54;
        Fri, 07 Jul 2017 04:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67BIpm5019126;
	Fri, 7 Jul 2017 13:18:51 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id CDAF9DB9;
	Fri,  7 Jul 2017 13:18:45 +0200 (CEST)
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
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 13:18:40 +0200
In-Reply-To: <244b5aab-8863-3139-f252-09cc02333eda@twiddle.net> (Richard
	Henderson's message of "Sat, 1 Jul 2017 18:42:09 -0700")
Message-ID: <87inj4ebqn.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: POyZ5Bs2F3LW

Richard Henderson writes:

> On 06/28/2017 06:53 AM, Llu=C3=ADs Vilanova wrote:
>> Incrementally paves the way towards using the generic instruction transl=
ation
>> loop.
>>=20
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> ---
>> target/arm/translate-a64.c |   74 +++++++++++++++++++++++++++-----------=
------
>> 1 file changed, 46 insertions(+), 28 deletions(-)
>>=20
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 9c870f6d07..586a01a2de 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -11244,6 +11244,9 @@ static void aarch64_trblock_init_disas_context(D=
isasContextBase *dcbase,
dc-> is_ldex =3D false;
dc-> ss_same_el =3D (arm_debug_target_el(env) =3D=3D dc->current_el);
>> +    dc->next_page_start =3D
>> +        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;

> I think a better solution for a fixed-length ISA is to adjust max_insns. =
Perhaps
> the init_disas_context hook should be able to modify it?

ARM has the thumb instructions, so it really isn't a fixed-length ISA.


> And, while I'm thinking of it -- why is the init_globals hook separate? T=
here's
> nothing in between the two hook calls, and the more modern target front e=
nds
> won't need it.

You mean merging init_disas_context and init_globals? I wanted to keep
semantically different code on separate hooks, but I can pull the init_glob=
als
code into init_disas_context (hoping that as targets get modernized, they w=
on't
initialize any global there).


Thanks,
  Lluis
