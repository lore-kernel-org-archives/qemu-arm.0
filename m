Received: by 10.25.44.15 with SMTP id s15csp940308lfs;
        Fri, 21 Jul 2017 10:43:07 -0700 (PDT)
X-Received: by 10.223.173.102 with SMTP id p93mr11518647wrc.56.1500658987294;
        Fri, 21 Jul 2017 10:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500658987; cv=none;
        d=google.com; s=arc-20160816;
        b=wSQvr9fX2FfUz4457VpTnp1TqKQMGQNrLkNBEZ/tK9PgI04yCXo6QOK5d/9L9PGz7Q
         iLib55EUlVoRRALsz7PF/EzPgbGBKYPoqvqWzx3tKjqWTSnkzV62A5QTX54Cxe0qcZE6
         sadnVM0aeiaHpR6hlhbDisV+4PKHFKDsvOG9fq2KDFHgH2Up34LoP0p55NT3Q5H1LRM1
         D5O8gxvacq6vDla3BBHUYWvYDgQvb1cNhStWug5o/pnRjQNuF9o0Roqk19LBfi/Ax1Te
         EWpWnlrnM9z3z1H9Eb49STwWe37djUy1vi3JCSz3yiOsLMOZK5EDQoZzC13Ac4YPKgsa
         IJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=OLx8otzjwK6y+GjIUuo4VN02nA9fiBHLqh6AkN+VT8k=;
        b=pundflZeCZK5dTc685YMC+0xW9fgRI37pwiV0TBxsX6DpDyzpcfl5ZiOHKCukaHSSv
         QAhcSFxpHmi2zEqkfr4J34fJCmNxd3TgwfC3aqxS3rtJus4CyJH1hzl+MVUyp0b2ACU+
         /atMGDWXUdGhwb0BFpumemTIUZ/Jb4R0aPHEo/VCP8koxwIX+KueQV1HORKd+71fxDW9
         IFRCvf2D0ZQsA7o6YWn2heBA8Vi+hXXzHzC7ZuVfJCK52uSmtpFZhZLuJahkfWOdKko1
         ezdSfIAouPgi+K1GpYAoKS+UwVRdWxCmVFOMuN+rHOuhCKnmIo4lT2VO+N1mE0J8mPxE
         xrBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Return-Path: <aurelien@aurel32.net>
Received: from hall.aurel32.net (hall.aurel32.net. [2001:bc8:30d7:100::1])
        by mx.google.com with ESMTPS id j132si1379423wmf.117.2017.07.21.10.43.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2017 10:43:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) client-ip=2001:bc8:30d7:100::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYbxC-0004iV-18; Fri, 21 Jul 2017 19:43:06 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYbx9-00045t-Tm; Fri, 21 Jul 2017 19:43:03 +0200
Date: Fri, 21 Jul 2017 19:43:03 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 12/23]
 target/arm/translate-a64.c: add FP16 FAGCT to AdvSIMD 3 Same
Message-ID: <20170721174303.bhzslryhi53uevfp@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-13-alex.bennee@linaro.org>
 <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
 <87tw266rm3.fsf@linaro.org>
 <20170721132140.xy2uqronprhzjiga@aurel32.net>
 <87mv7x7vbq.fsf@linaro.org>
 <CAFEAcA9kEa2PCjEKn1A=-bM7jjFhZc8pjef2J_c9qL8p4bLdaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFEAcA9kEa2PCjEKn1A=-bM7jjFhZc8pjef2J_c9qL8p4bLdaQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: cGmq10rAu3wm

On 2017-07-21 14:58, Peter Maydell wrote:
> On 21 July 2017 at 14:50, Alex Benn=E9e <alex.bennee@linaro.org> wrote:
> > Aurelien Jarno <aurelien@aurel32.net> writes:
> >> As said in another email, some architectures actually use more than one
> >> float_status. We therefore need to implement a solution like the one
> >> proposed by Richard.
> >
> > Ahh you mean more than one float_status for a given vCPU context?
>=20
> Yep. ARM's cpu state struct has
>         float_status fp_status;
>         float_status standard_fp_status;
>=20
> which we use to handle (1) operations which use the state
> controlled by the FPSCR value and (2) operations which
> ignore the FPSCR and use the "Standard FPSCR Value" (generally
> Neon ops). More info in the comment in cpu.h...

Indeed. This is also the case on:
- i386: one float_status for the x87 FPU, one for MMX and one for SSE.
- mips: one for the FPU and one for the MSA FP (SIMD operations).
- ppc: one for the FPU instructions and one for the VEC instructions.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
