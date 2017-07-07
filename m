Received: by 10.25.44.15 with SMTP id s15csp346771lfs;
        Fri, 7 Jul 2017 10:18:43 -0700 (PDT)
X-Received: by 10.28.87.205 with SMTP id l196mr3114533wmb.121.1499447923186;
        Fri, 07 Jul 2017 10:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499447923; cv=none;
        d=google.com; s=arc-20160816;
        b=r7H5+qOjOUvwjxChkGlBQVdd8ys+R6ESBIYzkLV4ymJraFMFLkfD//rU7GffxQFFqV
         kt24stLRfs3L36wrirQFI9U8cZB6bOiGEFI044tYHT7b7HvYzzKtLWF9GtMItMV1aw1M
         J1wvtMdzznAaGZiNvZiZ/mouWkDtFT9PNvCjheqxnwFb6awcgXtYQhukrTDmRQ4zarZt
         xFUEpGNHqIUkvJpiokgfzg199vMg9mXPgFYLNZAcWRcqdsDv+nBNi8x8vIOvZsFQofKM
         Eax91lYFA6JB/07KLQWe5Bgu7X3cTf6GcyJa1LvK8rbJ4yEHrd72gIEq34e9IUW4bQ9S
         zzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=VHzE+mHv8Rt/Ok+zRrhsm0kA31axKbANdSBXQHhjZCE=;
        b=MRoAcx2d0yOSeVMfmF8Ji4BOsGfmoTumM1BxekWbo16Rzs29yXTrFCBKHMlYO69m5E
         H2huaXt1rvvpiYgJtczOfHz4tdJ4QyxZqAQMryzZ++uF2pgXiP9Y7cIxuhlE+Rc52xog
         mZLmrYOY97E/nSLk+BPVTfW0nATTdYsFKmLL0oBuaGs/wNWhbAj/UaDjKkyYTX2RH1vY
         S0EABCFI64cYvDchq5m3DZVosa9Zy0FRxJsWigQw3DJvllykoDATVYkOcE+IxfopFcfx
         O+AjO+1+i+gfiODmMYJnqURBQV4qA2EnVNF1GjPQFwRmU661hFkQcsd9fXlWM5Uy6zeX
         D85Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id k12si2511879wrc.386.2017.07.07.10.18.43;
        Fri, 07 Jul 2017 10:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67HIdOe029021;
	Fri, 7 Jul 2017 19:18:39 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 730D313C;
	Fri,  7 Jul 2017 19:18:34 +0200 (CEST)
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
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to translate_insn
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
	<149865776960.17063.4875279139522061160.stgit@frigg.lan>
	<2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net>
	<87podcebyi.fsf@frigg.lan>
	<3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 19:18:28 +0200
In-Reply-To: <3745ae02-3fb0-1503-9c99-98dce369f697@twiddle.net> (Richard
	Henderson's message of "Fri, 7 Jul 2017 05:26:03 -1000")
Message-ID: <87lgo0cgij.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9/SfydhtIEpr

Richard Henderson writes:

> On 07/07/2017 01:13 AM, Llu=C3=ADs Vilanova wrote:
>>>> +    if (dc->ss_active && !dc->pstate_ss) {
>>>> +        /* Singlestep state is Active-pending.
>>>> +         * If we're in this state at the start of a TB then either
>>>> +         *  a) we just took an exception to an EL which is being debu=
gged
>>>> +         *     and this is the first insn in the exception handler
>>>> +         *  b) debug exceptions were masked and we just unmasked them
>>>> +         *     without changing EL (eg by clearing PSTATE.D)
>>>> +         * In either case we're going to take a swstep exception in t=
he
>>>> +         * "did not step an insn" case, and so the syndrome ISV and EX
>>>> +         * bits should be zero.
>>>> +         */
>>>> +        assert(dc->base.num_insns =3D=3D 1);
>>>> +        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
>>>> +                      default_exception_el(dc));
>>>> +        dc->base.is_jmp =3D DISAS_SKIP;
>>=20
>>> This is surely DISAS_EXC -- see gen_step_complete_exception.
>>> Why introduce a new name?
>>=20
>> The original code goes straight to done_generating here, and that's the =
purpose
>> of DISAS_SKIP (skip the code executed between the end of the loop and the
>> done_generating label).

> That is the purpose of DISAS_EXC too.  We've called a noreturn helper to =
raise
> an exception and all following code is unreached.  If there *was* any cod=
e being
> emitted afterward, that is arguably a bug.

There was no code being generated after this specific case, but I haven't
checked if DISAS_EXC is set in any other place that is not immediately foll=
owed
by a "goto done_generating".

Does this mean DISAS_EXC should be on the generic code and do a "goto
done_generating" whenever it is found? And if so, what are the correct plac=
es to
check for this? After ops->insn_start, ops->translate_insn, ops->tb_stop?


Thanks,
  Lluis
