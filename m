Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4416795ejb;
        Tue, 13 Dec 2022 09:23:18 -0800 (PST)
X-Received: by 2002:a17:902:d510:b0:185:441e:90ae with SMTP id b16-20020a170902d51000b00185441e90aemr30156552plg.20.1670952198169;
        Tue, 13 Dec 2022 09:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670952198; cv=none;
        d=google.com; s=arc-20160816;
        b=FVUCoxrpCHHISrJ5+ffOyGXB63sRyoHvjTk4oudADXEjZqm1e1MJtae47qsU7j+uLt
         N8OYyRqaNHjSQil5hs0mY6sj44DnoCeozSWoWGhAmSP7gdHcGwC7YcDmV6scNxDTwXMA
         wWoXhg5V5NVht8BDT/muZTN2YEyGzISbARC8+Oxvpc8HIB9eqc7q0T18ABMhSvZMa65e
         WJs7yDU4yjn8fH3RHze7GUiIns43ifVx05i2CI30Dx5zsSNc3XLOw6fwaqqEomAfkIMD
         ATHMt4KOmO8X9FPE/Z9YHU76v1E3ynloveh2ouI3AQHudqYxJ2T9r1ee8j1bC+mHZoKl
         5bNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6Zcpq2s8VpF6eJ1dPsGB/2R2qJRfZgfoCzYv+ByQpQ=;
        b=a8+gURBIAYzVPUUYs9vjRjOXuYr9SpoyJsS6FjMj9CP/CfEmr/PXB7IzqEoAXxNpWh
         XFgdZ7aiQfiM2MucgRBSx1PBPqQHjzqX9Qj7QuiXfd+pM9yYu3jFcJiUzI7lVdfibH6M
         3uRP7aqHXL4548jdzQyQz31R2KIUq4G1Y+rC5aPqadsSmdDwlJuIAa26oxjA6KDxeaWs
         KW5POIdx5a0BqrRNrwcp+TeH9VQxWs7SDRq2XfIzyKCGCcPaUyOhp/xvo3tKFrfNcdt/
         /S3EXo2fQkKLK1j+oDtKuVP1qcUM5WyKrcNgy3++HlT7UjC66FWeRsMvK5cLzLCX2CGp
         8Mwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qK/5KUG1";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m18-20020a170902f21200b00189b97cdfeesor258268plc.13.2022.12.13.09.23.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 09:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qK/5KUG1";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6Zcpq2s8VpF6eJ1dPsGB/2R2qJRfZgfoCzYv+ByQpQ=;
        b=qK/5KUG1yHm3L3t36D1EChGRR8/MfDZnQOW8VXN35M6g/9z8crlEpuD8+n08NANL8Z
         SwK1XRscQBaCs7VijfgCtg6iIybnHcc/d92ieDaDXtj414kzxNl1DLKWKF07kEjDwXMu
         9tNzi7HbraljOVBTxdv7IiPqewk3myIvGQbTEqx/KUHSTBiofrO0y3AqYwG4MVS3rfT9
         x+YyjYLmtqHiRwytq1P78yor4A0m5ZXhgnT5GZ6O/1ziWxHMowdjA0H12lLNlXjj5jBW
         inCFSX/RGJh2d4XPdNRidibOXreJBnxSIqegTfaK4MRBmXg+1wd83ZWLTctKwC8E+XV0
         CJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6Zcpq2s8VpF6eJ1dPsGB/2R2qJRfZgfoCzYv+ByQpQ=;
        b=OgGWLZiMwErKwdJxDCN7xWsv/q/p4WFGpUefWg3KI7QpMpmNSZuxgBRkqzrcZHb3AH
         IvPOBeGRB7hHCaEjjC/RQcr/IpdpjJO2fniDFPK37NAwzUBmGRl541AhOj72+UHU2mVV
         f/FgFodi57EG8AFex3zPYc3NTIR1IpaDvYl1f6JVavxcrDTqkqpAMLXxP1+5OE/Ks4RN
         slZT03SUaYNi+Sm0NQW77d3H7XHtdKzwe0QaJzG7i3bzWJZEBXnIbq6zMp0DKR7/Wdjz
         CKWUAyc9DFqVVxzfohu6TLtWhbWBFeaRmqezwD4o3Xxx6R2FiDoN1N0CKh7JhMLaZfOF
         6QnA==
X-Gm-Message-State: ANoB5pkKMwfpf4eCuwF95/CUiHS9iheD4VipIywVHxDxNUn6nk2aNsy9
	hfq52XzN5frfhtzMjTLxHZCL8Xf5yIHyDKZZgFUANURI
X-Google-Smtp-Source: AA0mqf6quY/yd0EZ3LkHHd+lZKc5MyeFAI2oqpza+bqWkzJTzQB8aSGl9UGFpDZth8cDAaPaKeff2NtdCdykBT6TkUw=
X-Received: by 2002:a17:90a:7c4d:b0:219:9874:c7d3 with SMTP id
 e13-20020a17090a7c4d00b002199874c7d3mr462459pjl.221.1670952197532; Tue, 13
 Dec 2022 09:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org> <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org> <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org> <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
In-Reply-To: <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 17:23:06 +0000
Message-ID: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A1eJY7m9nbrM

On Tue, 13 Dec 2022 at 16:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/13/22 17:27, Richard Henderson wrote:
> > On 12/13/22 10:21, Peter Maydell wrote:
> >> It does seem odd, though. We have a value in host endianness
> >> (the EPAPR_MAGIC constant, which is host-endian by virtue of
> >> being a C constant). But we're storing it to env->gpr[], which
> >> is to say the CPUPPCState general purpose register array. Isn't
> >> that array *also* kept in host endianness order?
> >
> > Yes indeed.
> >
> >> If so, then the right thing here is "don't swap at all",
> >
> > So it would seem...
> >
> >> i.e. just "env->gpr[6] =3D EPAPR_MAGIC;". But that would imply
> >> that the current code is setting the wrong value for the GPR
> >> on little-endian hosts, which seems a bit unlikely...
> >
> > ... unless this board has only been tested on matching hosts.
>
> But these are register default values. Endianness doesn't apply
> there. Doesn't it ?

Any time you have a value that's more than 1 byte wide,
endianness applies in some sense :-) We choose for our
emulated CPUs typically to keep register values in struct
fields and variables in the C code in host endianness. This
is the "obvious" choice given that you want to be able to
do things like do a simple host add to emulate a guest CPU
add, but in theory you could store the values the other
way around if you wanted (then "store register into RAM"
would be trivial, and "add 1 to register" would require
extra effort; currently it's the other way round.)

Anyway, I think that in the virtex_ml507 and sam460ex code
the use of tswap32() should be removed. In hw/ppc/e500.c
we get this right:
    env->gpr[6] =3D EPAPR_MAGIC;

We have a Linux kernel boot test in the avocado tests for
virtex_ml507 -- we really do set up this magic value wrongly
afaict, but it seems like the kernel doesn't check it (the
test passes regardless of whether we swap the value or not).

I think what has happened here is that this bit of code is
setting up CPU registers for an EPAPR style boot, but the
test kernel at least doesn't expect that. It boots via the
code in arch/powerpc/kernel/head_44x.S. That file claims
in a comment that it expects
 *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
 *   r4 - Starting address of the init RAM disk
 *   r5 - Ending address of the init RAM disk
 *   r6 - Start of kernel command line string (e.g. "mem=3D128")
 *   r7 - End of kernel command line string

but actually it only cares that r3 =3D=3D device-tree-blob.

Documentation/powerpc/booting.rst says the expectation
(for a non-OpenFirmware boot) is:
                r3 : physical pointer to the device-tree block
                (defined in chapter II) in RAM

                r4 : physical pointer to the kernel itself. This is
                used by the assembly code to properly disable the MMU
                in case you are entering the kernel with MMU enabled
                and a non-1:1 mapping.

                r5 : NULL (as to differentiate with method a)

which isn't the same as what the kernel code actually cares about
or what the kernel's comment says it cares about...

So my guess about what's happening here is that the intention
was that these boards should be able to boot both kernels built
to be entered directly in the way booting.rst says, and also
kernels and other guest programs built to assume boot by
EPAPR firmware, but this bug means that we're only currently
supporting the first of these two categories. The reason nobody's
noticed before is presumably that in practice nobody's trying to
boot the "built to boot from EPAPR firmware" type binary on
these two boards.

TLDR: we should drop the "tswap32()" entirely from both files.

thanks
-- PMM
