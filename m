Received: by 10.25.44.15 with SMTP id s15csp3427459lfs;
        Mon, 10 Jul 2017 06:47:50 -0700 (PDT)
X-Received: by 10.223.139.70 with SMTP id v6mr7694052wra.97.1499694470505;
        Mon, 10 Jul 2017 06:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499694470; cv=none;
        d=google.com; s=arc-20160816;
        b=U0WhCFByattdJ2Yh9wvnNMl+Eg2iN/WbbkR5LIYKV/a3YZLorJCMJaMAXu1Th3kpNl
         2TnwA3+Igd5wHWiQlUN/1VQ5Wf+S1Y2TgINRPO8mm1hKYywzN4UGWnq0qEmsn/nzwSp+
         2ZiewVRQUIyjyAKN6cG2hIEVk+t3dusZ36jdiskFpdtFmzowKSn4NYPZ/eqHXTQbGeFg
         DVtiGOSopN8u+EQru6Zc3V6NBvh9977b5J0rnyi8RzJonJ1++38FKrr7iemayLSxsHAV
         4UXomSeUQ0BAqY0BUwHwpz1FoYXGUVYEnCL7jJy8WNspwqQMiSOjHUrJvBcc+mvtjLcd
         LNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=jB+lgTJeUb4MlW/HwfdD2My5tQmA3c88DHfJbCE6puw=;
        b=Y0tz7efSOakoJHvF90bGPJ/j+N+O//VpZgYgXLOABqf486coLOWKJ1lp9LYJ4rSULw
         ZDNvAApD2YY3F8vqOaZ8+MgAoFJ6gngLs/KEoj6sAVUlnkHksuaUDgb8gmA2+jVPesuu
         NxVyk1SndCkVf7ZEp7At10i/qcO1V0iAgk+O7tk1skqWvpHJOfh2HduA1BIB3zz9CQrf
         kdxkH4YZTfkkVH3f8rRy5jnMxy3yJbc5Q5iGydwEjMWLSGoF4LT8ws1TySdWcO8xFqtR
         RMLdas6p3FVbdiF0fGg+lafrZahm9/MY6mxnnj5pDFRnL1IgEWsH2QCgpY/PS9DSNrgG
         k+xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id n185si6615360wmn.63.2017.07.10.06.47.50;
        Mon, 10 Jul 2017 06:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6ADljFF006674;
	Mon, 10 Jul 2017 15:47:45 +0200
Received: from localhost (unknown [132.68.50.62])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id EEB8445B;
	Mon, 10 Jul 2017 15:47:39 +0200 (CEST)
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
	<87lgo0cgij.fsf@frigg.lan>
	<260addd5-45fe-ad10-5208-35906fd3f197@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Mon, 10 Jul 2017 16:47:38 +0300
In-Reply-To: <260addd5-45fe-ad10-5208-35906fd3f197@twiddle.net> (Richard
	Henderson's message of "Fri, 7 Jul 2017 07:38:26 -1000")
Message-ID: <87k23gl7yd.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 70D0SGmv5W97

Richard Henderson writes:

> On 07/07/2017 07:18 AM, Llu=C3=ADs Vilanova wrote:
>> There was no code being generated after this specific case, but I haven't
>> checked if DISAS_EXC is set in any other place that is not immediately f=
ollowed
>> by a "goto done_generating".

> Typically we haven't actually done a goto, but simply exit the loop and e=
mit
> nothing within the final cleanup (tb_stop?).

The case handled by DISAS_SKIP ignores tb_stop() (the target code can simply
return when DISAS_EXC is found instead of DISAS_SKIP) *and* gen_io_end(); t=
his
last one is never omitted when DISAS_EXC is found now, and theoretically
DISAS_EXC can be set by any target-specific hook. Thus my question if the
generic call to gen_io_end() should check for DISAS_EXC too (I have no idea=
 if
it would be an error to call it with DISAS_EXC set, or whether it makes sen=
se to
for a target to set it so that gen_io_start() is called but gen_io_end() is=
 then
skipped by a DISAS_EXC set in ops->translate_insn()).


>> Does this mean DISAS_EXC should be on the generic code and do a "goto
>> done_generating" whenever it is found? And if so, what are the correct p=
laces to
>> check for this? After ops->insn_start, ops->translate_insn, ops->tb_stop?

> Yes, this should be handled generically, since all targets need it.

> That said, I would prefer a better name like DISAS_NORETURN, which does n=
ot
> imply that an actual exception has been raised, but explicitly says that =
all
> following code is dead.

I can use that name.

And in fact, generalizing DISAS_NORETURN will allow dropping the enum resul=
t of
breakpoint_check(), and instead simply return a bool (whether a breakpoint =
did
hit). Targets can then set DISAS_NORETURN and return true instead of return=
ing
BC_HIT_TB (simply returning true is equivalent to the previous BC_HIT_INSN).


Cheers,
  Lluis
