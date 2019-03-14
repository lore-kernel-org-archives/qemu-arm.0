Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u8sm1868470wml.22.2019.03.14.03.51.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2019 03:51:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AF97A1FF87;
	Thu, 14 Mar 2019 10:51:00 +0000 (UTC)
References: <1552488086-4025-1-git-send-email-amir.charif@cea.fr> <0d61f67b-26b2-33e0-cf4d-13c7d998eed8@linaro.org> <82FD2C51B435F943BACD9C947966BF2F0A0E3ACA@EXDAG0-A1.intra.cea.fr>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, "qemu-arm\@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] Re-evaluate SVE vector length everytime ADDVL is executed
In-reply-to: <82FD2C51B435F943BACD9C947966BF2F0A0E3ACA@EXDAG0-A1.intra.cea.fr>
Date: Thu, 14 Mar 2019 10:51:00 +0000
Message-ID: <87va0l4tm3.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7+MZxn3FqAwk


Amir CHARIF <amir.charif@cea.fr> writes:

> Hello,
> Thanks for your answer.
>
> The wrong size was definitely being stored in the TB, and, it only affect=
ed ADDVL/RDVL/ADDPL (i.e. not all instructions are wrong). Here is what I t=
hink was happening:
>
> - The kernel disables SVE in EL0 (ZEN=3D 01).
> - When the user space application is entered, the TB containing ADDVL has=
 its length set to 0 (16 bytes), as we are in EL0 (so sve_exception_el!=3D0=
), and FP is enabled.
> - ADDVL is executed (without trapping) on the basis of the current
> length (16). (Nested function calls in the same context will cause a
> ton of ADDVL instructions to be executed with a vecsize of 16.)

So this looks like the error. Certainly the pseudo code says:

  CheckSVEEnabled();
  bits(64) operand1 =3D if n =3D=3D 31 then SP[] else X[n];
  bits(64) result =3D operand1 + (imm * (VL DIV 8));

  if d =3D=3D 31 then
      SP[] =3D result;
  else
      X[d] =3D result;

so we should trap to the kernel and we won't without sve_access_check()

> - The next different SVE instruction traps as it should and the size is a=
djusted for the rest of the execution (but the stack space that was initial=
ly allocated is wrong so execution fails).
>
> So another fix would be to allow these instructions to trap by calling sv=
e_access_check(), as is done with the rest of SVE instructions.
>
> I'm not that familiar with the instruction set, so could you please let m=
e know if it is correct to call sve_access_check() in these instructions ?
>
> Thanks in advance,
>
> Best regards,
> Amir
>
> -----Message d'origine-----
> De : Richard Henderson <richard.henderson@linaro.org>
> Envoy=C3=A9 : mercredi 13 mars 2019 17:35
> =C3=80 : Amir CHARIF <amir.charif@cea.fr>; qemu-devel@nongnu.org
> Cc : qemu-arm@nongnu.org
> Objet : Re: [Qemu-devel] [PATCH] Re-evaluate SVE vector length everytime =
ADDVL is executed
>
> On 3/13/19 7:41 AM, Amir Charif wrote:
>> In system emulation mode, the kernel may internally use 16-byte vectors.
>> If this size is saved in the DisasContext before entering a userspace
>> app that uses higher SVE sizes, the wrong size may be allocated on the
>> stack resulting in corruption (segfaults in user space).
>> This fix evaluates the vector size at runtime (as opposed to
>> translation time) to always allocate the correct size on the stack (when=
 ADDVL is used).
>
> This is wrong.
>
> In particular, if the computation of VL is wrong for ADDVL, it is wrong f=
or every other SVE instruction as well.  Most of which cannot have VL compu=
ted at runtime like this.
>
> That is why we break the TB at every change to VL.
>
> Where do we "enter a userspace app" without breaking the TB and recomputi=
ng?
> As far as I know this must have executed an ERET to return from EL1 to EL=
0, which most definitely happens between TBs, or else no system calls would=
 work at all.
>
> Do you have an example that provokes this failure?
>
>
> r~


--
Alex Benn=C3=A9e
