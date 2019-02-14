Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1039663wrp;
        Thu, 14 Feb 2019 06:24:24 -0800 (PST)
X-Received: by 2002:aca:ed81:: with SMTP id l123mr2375775oih.139.1550154264889;
        Thu, 14 Feb 2019 06:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550154264; cv=none;
        d=google.com; s=arc-20160816;
        b=dQnKvWEyceA1LykVp1mw3PJfL4cqfBC2OuVaKSnZmkq6WHfLZgi+o+tf7BLbElVVg0
         hliNYmmja9/2Hkb9Q4/OtDz5pSxR7wXWjKkOHCM6UCEbfs4wNqDexe4jWZeL100UIRPJ
         l3EHf/rqys4Bv12xATcdiQ9X7nH9SuRiZq6nsggK9NGDTFVCUS8nj1QYpe3S4tmeqglA
         wUHO/1S4A4S1pQhvhJIDHmjtxJei2wmBqbUO9+2iUs3n0BMUO04JpgUCva0lH9VHmsSH
         niK/vvF5vK1FAROdGeLEVzjLE99tdK2zoVZh6sf0woM9Jr83fDwCseOpttShdZzI0jVS
         wHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZeMM78YTWIzK8wBU7X6pPNQxK3QZZoIjakh2J/oNCc=;
        b=SM9ZkojKgit2OFtc5/gDO5MZFCDBrjRFnHT4Ms97MGeCS733gU2M6qG7BCrNHXZHnl
         6IxiqulO8Am63bnDh7JgkvifZWrgriu5G29B9Ko5U9BMgr9f5pNBA0z6H0tVlSiTWkVK
         Kwh7ydD0xLDN+i+P2G6Fy5ixm+NpCDmRrwIGoAINcqFNeFu2/0Wq72ZrFxOQkJuJ+WVe
         9ESF0khvJgq/eGhD14/xqbJmWyVsO5YX9vFsggiyW5TtATQC6xp7qmd4519H0emMoYsa
         5XVe1xyxrIm5ItTAXf5TNo04q+odt6x9YeRDOebOekLd/ZxljIlvQ+uFlHx+f30mV2Zi
         HTPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HygWViMU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b188sor1333037oia.9.2019.02.14.06.24.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Feb 2019 06:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HygWViMU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RZeMM78YTWIzK8wBU7X6pPNQxK3QZZoIjakh2J/oNCc=;
        b=HygWViMUt4IHQP9mOMGKIHMNkMWhZdKNeznqMw2aDAURWg/XNOHJzaTxAN8KZVvb9B
         HbAVkUd2eaVOHveVksRx6uxSeSqqNWvWK7kyEKJc+0LKPB3x8Mf3MVnH7E1ECL7EZnrr
         lv5bJuYss6gB+/2k3cMjXRN+EGl6Mi+cvGPNdoKuR2M6xosve4cKXj5JOpqHmDMmzH4b
         Wyu5WSnrsT/FPna3dcog4S3xOwyNvdAWWlHEm2pYQfYlrQ9DYJOYaVyOxJnle5Celufh
         2cM6Hcmqo4fJFBLgT7WYY0FvJ6DhnX8HBS5wt2BS3+dbgfQ1PVeMlXdnb3hpcHLIAezj
         iO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RZeMM78YTWIzK8wBU7X6pPNQxK3QZZoIjakh2J/oNCc=;
        b=OIyIVPCu5zZOmVBWIvJBfD1GzW56Qj2bo8wOcBQZY6/Ojz2lDkTGiedLFF69jglEUn
         Or2hmSmk0q72aRTDdM+hjZxb4ZXwpg9vbcA0BEXbrzc+oYZlsb+OBXwUV8Cx+r9ZTLgh
         yp8g4NvT3wJVlufyb0+oTq9L/xHqBnxdypHYIKQzrY1YlzcUwH8w58hVr7Gc7zFH9Q5d
         9FvjMb5RNQvzVPTqL4Cq25F2cXTzycj3V0HThXuEuEkN+EOgsPQjZI1DiV37pL4BAkNb
         O2X8vCzB3kObf25c6esctMo589PdE1Nrj6KHPVArYFDfKJuNDPnReSg17c6I+7zlIq1n
         sIdg==
X-Gm-Message-State: AHQUAuYdx7CCAz9leM2q/3UM9crtSF8LEQE2zZObJpNLYCuY6SLdrj7P
	pu/fNxuTYfwbNLJgzb5C5hx1ivjRhi5lLEHvzM700H3BSJY0ww==
X-Google-Smtp-Source: AHgI3IauaHcGxjBo0q8OZ/mNelTvqCDwpbj8O+WJ2RpTxLXInGi3Avr4JfdnqTGJVPyNy1ZyC269NW1i6AqAEDbceIo=
X-Received: by 2002:aca:b341:: with SMTP id c62mr2349458oif.112.1550154264156;
 Thu, 14 Feb 2019 06:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20190205190224.2198-1-alex.bennee@linaro.org>
In-Reply-To: <20190205190224.2198-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 14:24:13 +0000
Message-ID: <CAFEAcA_FdK2HsFto8zBZnoZQWyrnKLtskOz6Sb42n_qBw-qV=Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 0/6] HWCAP_CPUID registers for aarch64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: odtdsMAwZePH

On Tue, 5 Feb 2019 at 20:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi,
>
> I've re-spun the cpuid patches with the changes suggested by Peter's
> review. The biggest change is the squashing of bits is now all data
> driven with ARMCPRegUserSpaceInfo being used to control how bits are
> altered for userspace presentation. This includes using glob matching
> to set whole bunches to RAZ.
>
> The testcase isn't as comprehensive as it could be because you need a
> fairly new compiler (binutils) to emit all the various system register
> id's to test. I did look into upgrading debian-arm64-cross with Buster
> but I managed to find a bug in Debian's dependencies which rules out
> upgrading for now.
>
> checkpatch is complaining about the _m macro I used to group together
> words in the masks I defined. I'm not sure adding the spaces makes it
> as readable though.
>
> The following patches need review:
>  patch 0001/target arm relax permission checks for HWCAP_CPUI.patch
>  patch 0002/target arm expose CPUID registers to userspace.patch
>  patch 0003/target arm expose MPIDR_EL1 to userspace.patch
>  patch 0004/target arm expose remaining CPUID registers as RA.patch
>  patch 0006/tests tcg aarch64 userspace system register test.patch

I'll take 1-5 into target-arm.next, but 6 breaks 'make check-tcg'
for me:

  BUILD   aarch64 guest-tests with aarch64-linux-gnu-gcc
cc1: error: invalid feature modifier in =E2=80=98-march=3Darmv8.1-a+sve=E2=
=80=99

I imagine you're assuming a newer binutils than Ubuntu ships.
You should probably go for just encoding the insns rather than using
their names -- binutils should accept "S<op0>_<op1>_<Cn>_<Cm>_<op2>"
as a register name for mrs and msr insn.

It would also be nice to test some of the sysreg cases which
go through your "glob the register name" code path -- I think
at the moment you are only testing the ones which use the
specific-match case ? (Ideally we'd loop through and test that
we could read everything in the defined-to-be-exposed encoding
range, though that would require some slightly tedious preprocessor
macro effort.)

thanks
-- PMM
