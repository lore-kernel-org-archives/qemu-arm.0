Received: by 10.25.44.15 with SMTP id s15csp3202685lfs;
        Fri, 7 Jul 2017 04:14:17 -0700 (PDT)
X-Received: by 10.223.132.7 with SMTP id 7mr483112wrf.187.1499426057731;
        Fri, 07 Jul 2017 04:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499426057; cv=none;
        d=google.com; s=arc-20160816;
        b=PLE5OhQ212NK56lq2c9nIdF84muLteZ04K4kRsGUZyq1JSO5mrO9p8tDlg899gmErv
         6Da92tF9o2r1c8k90x/U5//T2FAhDxZod3XKjSfFsDbWwdvocScwGYul5DLBYnIL27BO
         XKNpoER0DO9V9UVohKcxPDn9ezfEQ+GW4Tpdsp+891heXz8BHSoWOmUPpfSGpvHzbDyh
         +gG29pjlq4+8GUoVdsQI4to97fUAiYwqdDeA0yIv71pDF2VlJiuhhK8eF/byVgKQcU9p
         FUO7u50w6wwIPReSMmGk7ulRlFykf7O5O7LEgPQXVF/g//16RWksy9s9nb+QG8isziaR
         Xj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=JrQCP06wfqiaMjCi+JBYmSxqiEe5mw7D64SSagi7fOY=;
        b=IOAUabGVn175YmlhKqp8E6nV37PVZ7EIavmr2ZUps9y86IaEQpMftl4s3g4SVyxlak
         1hJrXMkrPk7SVnpIUa3DkOYJUDWiH6N3tVaPuKGqlgPzt+Mp9/Mh9lg9z4q4WitSMGWo
         JjLJdILeNJc4lFPmeBpqWCgHyuX1nVC06yf8IkMB+RcDL1woEhh6TfeI/y5idu75o73s
         QGWZfKVS/37vA8lUebDLDbXLkI4764ZmVSP9oF4FcaCLfZkDVbW0vmuchd53vsl4W4dR
         gAPVUskW9W5XJKb1GdbK9HzH82gggYPPd6nibEXSLTqo1Bp/s7BwKx+AqPLs0rxT+x0Q
         FxrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id f86si2796449wmh.99.2017.07.07.04.14.17;
        Fri, 07 Jul 2017 04:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67BEDnD018999;
	Fri, 7 Jul 2017 13:14:13 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 8CE37E9;
	Fri,  7 Jul 2017 13:14:08 +0200 (CEST)
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
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 13:13:57 +0200
In-Reply-To: <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net> (Richard
	Henderson's message of "Sat, 1 Jul 2017 18:34:17 -0700")
Message-ID: <87podcebyi.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1LENNN7w/Mei

Richard Henderson writes:

> On 06/28/2017 06:49 AM, Llu=C3=ADs Vilanova wrote:
>> +        /* We want to stop the TB if the next insn starts in a new page,
>> +         * or if it spans between this page and the next. This means th=
at
>> +         * if we're looking at the last halfword in the page we need to
>> +         * see if it's a 16-bit Thumb insn (which will fit in this TB)
>> +         * or a 32-bit Thumb insn (which won't).
>> +         * This is to avoid generating a silly TB with a single 16-bit =
insn
>> +         * in it at the end of this page (which would execute correctly
>> +         * but isn't very efficient).
>> +         */
>> +        return DISAS_PAGE_CROSS;

> Any reason to introduce a new name as opposed to TOO_MANY?  As far as I c=
an tell
> they're the same....

Yes, DISAS_SS and DISAS_PAGE_CROSS turned out to be remnants of previous se=
ries.


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

> This is surely DISAS_EXC -- see gen_step_complete_exception.
> Why introduce a new name?

The original code goes straight to done_generating here, and that's the pur=
pose
of DISAS_SKIP (skip the code executed between the end of the loop and the
done_generating label).


Thanks,
  Lluis
