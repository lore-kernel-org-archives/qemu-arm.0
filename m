Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3732947wrt;
        Mon, 4 Feb 2019 07:56:04 -0800 (PST)
X-Received: by 2002:aca:52d4:: with SMTP id g203mr36429oib.14.1549295764330;
        Mon, 04 Feb 2019 07:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549295764; cv=none;
        d=google.com; s=arc-20160816;
        b=lXl3kOceZzGjdgkH97s5gU9GD8MqPHaiDm83PkgqYy7GPSwETFtnH2zxlOPvFSZol6
         aH3kOJXsY212XIz558qpqt9D+nh8XoGWumAzI8zmm6JOCgZJE1eCmXj7lrxzot6muYrB
         x4tOPiIf8MkSUgLwGH8YM/OlEgWXsc1fJwMIQBU0hDpXg0M6zoNSugnzEO1dwzkfEy3A
         pO5TlkQvPR3Krm1oi6nE5WMlzMigRXvt6FLyJTDpiAyEIOqsYsuXRVrq6rJ4XNNGojaT
         RC9KXyMdpmAu+yaTCjWMWEtuvDRsUa8ZzHaPYmCqArqx+e/irHkS/fH7Etryg78AzmDI
         O1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8Oy6bvXU2lRAC+lP3k2BYw7sExiHMsyI/5LsLVqdm4=;
        b=tOh89itWJeAlBeEgezB0iN4uqO+rkCY+e27G2MhVqN7FIgTf4Y+gBBCm+5Ob8RoRD8
         HsVa2avmX5U4gLi0ukynPd3x95pUOryyHjX5vIEXZR8HUhzdxd1GGuzix36yiVAlCC1z
         iyHDAMvJO3guCiVIf1s5ezuBZfm/8ltBBL23skSt+C6Yv2HR+3lRkspzSe8b6iqHa/9V
         AhGAlRZJ+g7NeQBd5YdAWAapljujcEyGHgdM5XsZWiI14L4P4LU6nIVbom/jdfgbfmAK
         1yk1l20UizE4Gu52Bu+d1d/vmjSpzJ1iqQ11spSd6dPRcCRZ6ax8VOl/LQYg4I6X9MoE
         +QDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtrlnZf2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 71sor10012227oia.141.2019.02.04.07.56.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Feb 2019 07:56:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtrlnZf2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/8Oy6bvXU2lRAC+lP3k2BYw7sExiHMsyI/5LsLVqdm4=;
        b=JtrlnZf2ZlKFVv5NBsbwp8FFRIUe5ag22j/RXb4hKJmqC88nZ7ne0fu6imvzDRnWZf
         DZLt/QM7b0VWUMBplw2D4Jz4S4NAmDlJ93iKOU5BSMwZ2l8Q8TpCOv7H+Tm0/n+C9rUy
         /acPxKhxrE3BAcgk4XY67rZpSsiD9W/oMOAP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/8Oy6bvXU2lRAC+lP3k2BYw7sExiHMsyI/5LsLVqdm4=;
        b=J7LnVeFVhbKAQwblnJmt59PdduWy95+lXNZV5L3N/flTqZMd07TMWcRWlHYuH8JvtF
         FUYghaKhcgeNB4t5bScRuhF2Te6a9O/6mC/5NMG4XZkXul0bIDnFRIO1BVLiXl7ygBZi
         smiyGED4uWZE6s3cvcE3z8Uex/YGfyeS9KSh7FlqOTqV1pm6gYGixPBjyKCWDScNw/CA
         bZjbh6bXgidUqAgLYUwXpelf2Q0yhosCt3B2jm1DS0OqDW81rDO24whNPittWDA51xFG
         8ZuXHiPeiWGNCxc6VswUr0UTcafEipnOMRe0rN2ipLEjnqKS7A7470vwtkTkErnHl5+a
         fwXg==
X-Gm-Message-State: AHQUAub9KOIpXPW00MOlpRdL9u8kYQNn2mpl4cm9tr+xensaB3Kr5S8l
	5T+M6Vft3vZB9AldAGjb86qYN6G3b6SsmyWuXnkL89awap/Pdw==
X-Google-Smtp-Source: AHgI3IbzRQfpFiAz9efkYewHmDihCtk7cGG7Gc+uB6mGtm3XgA/kDAdLew0X+/YOg33OeI3AiZvSgaB3L4N6giVLlng=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr25822oib.146.1549295763609;
 Mon, 04 Feb 2019 07:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20190128173940.25813-1-alex.bennee@linaro.org>
 <20190128173940.25813-3-alex.bennee@linaro.org> <CAFEAcA9fD_bju_+QM3D+088rKJffQ66HBPYUB-cDknKmPikhaQ@mail.gmail.com>
 <87munb4lgv.fsf@zen.linaroharston>
In-Reply-To: <87munb4lgv.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Feb 2019 15:55:52 +0000
Message-ID: <CAFEAcA__N6kPPzems0DS0oLLvqp0VoBjdbB6vvRNywQi8uw0nw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] target/arm: expose CPUID registers to userspace
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YU2AqitRj/gU

On Mon, 4 Feb 2019 at 15:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > This doesn't seem right -- I think ID_AA64DFR0_EL1 should be exposed
> > as zero, not whatever the underlying register value is.
>
> Under a kernel I'm seeing numbers reported so I don't think it's totally
> squashed:
>
>   id_aa64dfr0_el1     : 0x0000000000000006
>   id_aa64dfr1_el1     : 0x0000000000000000
>
> Confusingly the kernel does:
>
> static const struct arm64_ftr_bits ftr_id_aa64dfr0[] =3D {
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, 36, 28, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64=
DFR0_PMSVER_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR=
0_CTX_CMPS_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR=
0_WRPS_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR=
0_BRPS_SHIFT, 4, 0),
>         /*
>          * We can instantiate multiple PMU instances with different level=
s
>          * of support.
>          */
>         S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR=
0_PMUVER_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_TRA=
CEVER_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEB=
UGVER_SHIFT, 4, 0x6),
>         ARM64_FTR_END,
> };
>
> So I'm not sure if that is intentional as the line:
>
>   ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEBUGVER_=
SHIFT, 4, 0x6)
>
> implies the DEBUGVER is hidden but actually 0x6?

I think this is because the field in the register is architecturally
defined to have a restricted set of permitted values, of which 0 is
not one. (6 means "ARMv8 debug architecture" so is the effective minimum.)

> > More generally, this ifdeffing of "maybe mask the values" doesn't
> > seem very future-proof. If we add something to one of the cpu-id_*
> > values, that should be masked out to zero by default for linux-user,
> > not defaulting to passed through.
>
> Do you mean setting cpu->id_foo during cpu_init? I wasn't sure if that
> might interact badly with the recent changes to base our features off
> what's actually set in them.

No, I meant having something where we either:
 (a) have a separate set of cpreg structs for the userspace visible version=
s,
or (b) have some code which modifies the cpreg structs in v8_idregs[] (it's
not const) before handing it to define_arm_cp_regs().
(b) sounds better to me -- the ideal here I think would be something where =
we:
 * mark all the regs in the space the kernel covers as PL0U_R with a bit
   of code rather than by changing all the cpreg structs
 * default them to "no bits of the real value are exposed, all bits 0"
 * have a hopefully short list of overrides, probably defined in a special
   purpose array with entries like
 { /* ID_AA64DFR0_EL1 */, .crm =3D 5, .opc2 =3D 0, .passbits =3D 0x0,
.fixedbits =3D 0x6 },
Or we could match the override entries with cpreg values by register name,
which would let you say
 { "ID_AA64DFR0_EL1", .passbits =3D 0x0, .fixedbits =3D 0x6 },
and avoid having to repeat the encoding values, which might be neater.

thanks
-- PMM
