Received: by 10.25.227.6 with SMTP id a6csp2952833lfh;
        Wed, 28 Jun 2017 04:48:29 -0700 (PDT)
X-Received: by 10.46.69.198 with SMTP id s189mr3142650lja.0.1498650509488;
        Wed, 28 Jun 2017 04:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498650509; cv=none;
        d=google.com; s=arc-20160816;
        b=BIFECItiVAmDvEAGdlvod4/I/CyA/wynTWw+q8X3p//oQ1OVj8VsQ6GNQ38DCXHCQD
         zFtzH7OzkWnIBGuafs0jUp9BGbWOO2vpYyAOubWi7sToNix93VX77+jroDkAvyKB29LG
         Jb0pyqJaLAuXmo8rqtTBCekMvVRwCAbhPT7ZQ7LUKfZK6YpSOmweYep/pE4VOtGRGbjs
         3f+pRlqD1sCwf0J9KsIEB8Vum8P1j5FJqlx59FN0WyRW26nmr8T+L4k3vla00QVmkbDW
         W3Q69dUdZX5kElXmqfgZ2rBP06HLfUFxMgDDvvYOvcohzAI0Y6kRCRnHfMb5m5+wfw5C
         PvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=m0SrYdu8iL/mNziIyWs5DsY59ChDahKazpkCcd7YxqY=;
        b=e0spGx0phuM2te3fnm3PVVR39XxPWy3qZv8y0EhWFXcO5l+29/Wc2mbSHrpAzqTcdP
         1bnMhh9XE13I9tAuU4W0T8G4ZVk5CUcWQtZeLJSJoA/Hv8qXuFbx+WOk0UREn3eOQyGj
         HbtD1bfuol06NBS8Ky363ATrULkaeW7NdbucemoT30bvJZs2k8QQeiZpS/t4dkr5LipL
         JJ3Mbjywz/h5/qIwCdzNmNernkxEGVRVpJBnnW/+E/LOJbA8PAfNCUxrIxIhdghRitTp
         pIlum6LYumgAT4bOYTJstQKc6nn0nOCxu6LDIzFBKcMyhx0BrG67k1JYKhHhZ72zJ/bW
         o/Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id h131si956787lfe.482.2017.06.28.04.48.29;
        Wed, 28 Jun 2017 04:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SBmSCk024500;
	Wed, 28 Jun 2017 13:48:28 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 081985EE;
	Wed, 28 Jun 2017 13:48:08 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Peter
 Crosthwaite <crosthwaite.peter@gmail.com>,
        "open list\:ARM"
 <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v9 21/26] target: [tcg, arm] Port to insn_start
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
	<149838531005.6497.12362377034456580175.stgit@frigg.lan>
	<c43f4c84-debd-ffbe-7d48-97c74a0b8bd0@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>
Date: Wed, 28 Jun 2017 14:48:07 +0300
In-Reply-To: <c43f4c84-debd-ffbe-7d48-97c74a0b8bd0@twiddle.net> (Richard
	Henderson's message of "Mon, 26 Jun 2017 20:33:08 -0700")
Message-ID: <87podocozs.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Kj1Esp2oAEvH

Richard Henderson writes:

> On 06/25/2017 03:08 AM, Llu=C3=ADs Vilanova wrote:
>> +static void arm_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
>> +{
>> +    DisasContext *dc =3D container_of(db, DisasContext, base);
>> +
>> +    dc->insn_start_idx =3D tcg_op_buf_count();
>> +    tcg_gen_insn_start(dc->pc,
>> +                       (dc->condexec_cond << 4) | (dc->condexec_mask >>=
 1),
>> +                       0);
>> +
>> +#ifdef CONFIG_USER_ONLY
>> +    /* Intercept jump to the magic kernel page.  */
>> +    if (dc->pc >=3D 0xffff0000) {
>> +        /* We always get here via a jump, so know we are not in a
>> +           conditional execution block.  */
>> +        gen_exception_internal(EXCP_KERNEL_TRAP);
>> +        dc->is_jmp =3D DJ_EXC;
>> +    }
>> +#endif
>> +}

> I think this DJ_EXC block is better placed at the start of disas_insn.

> It is, however, the answer to one of my questions re patch 4/26.

It cannot, because DJ_EXC make the generic code break out of trasnlation be=
fore
doing anything else, which is what the original code does.

Cheers,
  Lluis
