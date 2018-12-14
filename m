Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2268255wrt;
        Fri, 14 Dec 2018 08:41:03 -0800 (PST)
X-Received: by 2002:a02:9804:: with SMTP id t4mr3177308jaj.68.1544805663608;
        Fri, 14 Dec 2018 08:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544805663; cv=none;
        d=google.com; s=arc-20160816;
        b=GK0+YLfTtFFgYlBhzs/m/K+RBzjLDym4RgUFy7ev130Q/JizN3WGYZY535YDyHT1HQ
         +3R6jzvk3cLjNoH30lLHChgNCja63xTPAe5ENOqi6ONfs9qbONHnfJVgUR7F6L5+9qD0
         QKBhG+F0B+HzjCF9GPK/ZCjsVPKW292U6y/SJm3kr1dV1ejaJDImAg2GDmni45N4Wp8l
         oAWCtg8Kwk/Kq3sNBiyltMZinl3zR3yBR7ep4kpvgqNXlYGK9Wq3PR7p0Tr2FIfsx3dV
         Hm+UXs0ICR2X/p3E3DaVZyDFIhGFqIxLU7nZXBAesKxPXVrudYSMhjYSe2RuBRX2cYai
         ujTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4DqS420MOh4BPBLz0KTkdmedReulvYw836HtumxJQE=;
        b=IkFsJ0s4RfVLgfPFWzUI5lTbPM8oMdD9DpuEB4K/5Kuai8/6cJsWSDT34zir+znQdF
         AROICxHTnfT7yjXPQFS5sB9TEe1T1kw7N9dR4TMt07grHn4p9ivVjn44OqvPpb9nbr85
         eyWBKh73PTctW94RmRyiejuyOQQfnoh36rbcbI8Z+dugqrhRKdFFdd+WNp3j3mm+3gaH
         zlebGs3vnd5gxMoYmPA0cJH/ZJGGvnPZkERG4kRmE3KvCUKz/MDIgdvr5fwkl1535UUQ
         sx/zDdVjF9+D1n8cboPNQxPsNcJ+VTHFLBkwFm1ZZK/F4IcDIWXmDAVtMXmz7PAK+nuF
         d6Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBMtdjgD;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p140sor10071472itp.36.2018.12.14.08.41.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Dec 2018 08:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBMtdjgD;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a4DqS420MOh4BPBLz0KTkdmedReulvYw836HtumxJQE=;
        b=fBMtdjgDMp/uc85v3iBvIFdRo5EKIP9poYnWZVwh40hZgxpbRgvaZ/Mjkupvh/yz9Z
         ATi1RKiYfm3CdctfUHZCnbvbVjYY5N2OF3eo4jKUhkwKcoWltMk6g7dmdEmt+dAQb8xt
         Zx2dnB/rz8WvQQ0sIty/T0TMkHiJtk+rhyOYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a4DqS420MOh4BPBLz0KTkdmedReulvYw836HtumxJQE=;
        b=B4wiS8wEbheLNFxtPdeWW5sb/9jCeuWaf4VnHbyz33UNiFWJgYVcBpIafHm5ZDMhNy
         /L2xacrgy17UFnxJwgOlTG3xVKXDMYIvZI+QcIvvAyMF+gf2YhJwHuqlCguYCEMYdUf2
         Ls4amQJbEXT39jg9keldJJFod8IcnhhyNcLYv0OMxTcxjn3ts4f8HTAlNtPJjQBaJ5o2
         E0s2+Yq9YbT5FBD7YotGvw0tYQ7nWHtKMoRHKlxEGb5Wh+gp6BNF5dDJezv23mMxfWX8
         eKMXzmEKSPdESyeq/3oPPIoZUNiOyI4yC5qMhicvJYVTw+uDZrARKDypQ76xuA2+A4tB
         Odmw==
X-Gm-Message-State: AA+aEWZQiVZ2bDnwTyDJHlbkwg0DcGRbyQPHi4Pq29ldJYLQeqxwCPRh
	VzJL0U3hjd/DIhBEJMzwi8hBgu38QDng/Y3qcyTmleVyxK/qGw==
X-Google-Smtp-Source: AFSGD/U8pPtw0OcfGxnybKBMul8L5xfVfwPiDzTuDBf9SVkeamcV1Fw11oEb8cdkyHqjC4NDcBdhdUGKLKfgpRUVVgc=
X-Received: by 2002:a05:660c:4b:: with SMTP id p11mr3873550itk.71.1544805662861;
 Fri, 14 Dec 2018 08:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20181213115503.24188-1-alex.bennee@linaro.org>
 <20181213115503.24188-2-alex.bennee@linaro.org> <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com>
 <87mup91nox.fsf@linaro.org> <a78b697f-4bb8-f54e-28a9-34ecf6a40f29@linaro.org> <87ftv013dr.fsf@linaro.org>
In-Reply-To: <87ftv013dr.fsf@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 14 Dec 2018 17:40:51 +0100
Message-ID: <CAKv+Gu-2tfeNXmjPcbXPRaByFhq3fFGkvL-YAthP=X=nCpEpLg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target/arm: kvm64 make guest debug
 AA32 break point aware
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FyTTq3aNhV5+

On Fri, 14 Dec 2018 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 12/13/18 8:55 AM, Alex Benn=C3=A9e wrote:
> >>
> >> Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:
> >>
> >>> Hi Alex,
> >>>
> >>> Thanks again for looking into this.
> >>>
> >>> On Thu, 13 Dec 2018 at 12:55, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >> <snip>
> >>>
> >>>>
> >>>>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_break=
point *bp)
> >>>>  {
> >>>> +    CPUARMState *env =3D &ARM_CPU(cs)->env;
> >>>> +    int el =3D arm_current_el(env);
> >>>> +    bool is_aa64 =3D arm_el_is_aa64(env, el);
> >>>> +    const uint32_t *bpi =3D is_aa64 ? &brk_insn : &bkpt_insn;
> >>>> +
> >>>>      if (have_guest_debug) {
> >>>>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_i=
nsn, 4, 0) ||
> >>>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4=
, 1)) {
> >>>> +            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) =
{
> >>>
> >>> Should we be dealing with endianness here?
> >>>
> >> <snip>
> >>
> >> I don't think so - everything eventually ends up (ld|st)n_p which deal=
s
> >> with the endianness details.
> >
> > I think Ard is right.  You need to consider dynamic endianness with
> >
> >     bswap_code(arm_sctlr_b(env))
>
> *sigh* I guess. It of course still a heuristic that can break because we
> don't know if the system will have switched mode by the time it gets to
> the breakpoint.
>

Actually, I was referring to the QEMU/host side. Instruction encodings
are always little endian in ARMv7 and v8 (which is all KVM cares about
in any case), but I guess it is [theoretically?] possible that we are
running a BE QEMU?
