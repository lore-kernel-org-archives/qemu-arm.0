Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1608250njf;
        Mon, 28 Oct 2024 09:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbllNu/rplEy/2zqMHldXnY+bAGE6B1ipjwCXMePRIXinC3P/u38j2rwI/8YH+kGoI+o8UA0tJ7FiF8w==@linaro.org
X-Received: by 2002:a05:6402:849:b0:5ca:e5d:f187 with SMTP id 4fb4d7f45d1cf-5cbbf8b4f45mr7747367a12.17.1730134109688;
        Mon, 28 Oct 2024 09:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730134109; cv=none;
        d=google.com; s=arc-20240605;
        b=L6g7RE5GhVH4sft4Fry3v67cVdIeTddlWMwFJ/4eLgkAMWT0jimxhP+ue2ZZmxTjTs
         2vw3jPRCiYfZWMgJZw1rTYZ/rW8fZK7fCt1oum2IcrWLoJ+mzfAMQ2TrqEg23vjoVujd
         GyHVFga5ImaP4juKzwCIFUfFZuphO3KzCnEopZgvrKGQ4VONtMZcyk/phflXly26CRk+
         5l2dBniXWji8AgTmR7caCS0HvypPhrTkR2yBMe9WB5OqdXM5d7+pUv7z/uqubnROmsXu
         JOXREei6gIZHiURmBeGMHSHRQH/oCq/egwHWh56K/QoyUj37sEJ7qjzK6o3N2I8SMOyD
         W0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KnUNLueAKjDgxYCEbUwQTT/VPUr4XHGzj00PvTOp+E=;
        fh=hpIyrFCCUlWGyJXyd6czSG02EMuYP84any+5ZoHcnYo=;
        b=OxC4YOkl+YTFZPXeCEDoEQMpU+VNKXU7MGFJLrPBFDSb2fVYiQ5LfYDbM5vg2vfFD0
         Qj74Rxc8HkeKzs5Jn2wdQMiYNKPjON5mc/gSzq08gNG1qAl9Iomdd3NxYNMejyaGTUZk
         B2fxpPjrqbvVCKy51cY6bPdXcv+Y1YB4rynYU8QQjjCoBeHb+ZSaC6bEBIrBgbyD8v9E
         Cg7vwVvsgxrAH1wGPQHrZYPtlcOoee9S8Y6HZSZS3VQK+GWFRBvgLKEV+DPH/E01kSMQ
         8jbpGF+KTBjTT7GP1NT77BNXrv8LyZIAnz2R8mLSyZYJKenu9io5D2UauYBEZykuoQgL
         Yg5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kNeo/0xj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5cbb63806fdsor2222043a12.10.2024.10.28.09.48.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 09:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kNeo/0xj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730134109; x=1730738909; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KnUNLueAKjDgxYCEbUwQTT/VPUr4XHGzj00PvTOp+E=;
        b=kNeo/0xjRPQNUVzaVdE7HAY90BEqb5P9dj3dowv9MfUINc4rscM+Dt4DzUgSf2D6fS
         hU4kVWQZh5hBwu+uTgVxR0y6x1qeYbta+kpGaAjQhLrB3mNU3LpzKailRmVeSHMkusdJ
         qYhPyQB9Pt/n9jpzIdKfE9cIPiJbbNTYJDaiHumUrFEy26cqUfJ62KTpJq2xOoPtXlJH
         U06tf1DCMGU4hGgS9K1vCpi9TsDj98SyIyzSRAbHJ4pbN3unVirsK49mgpxcZcK9k6TH
         LTlBvNXyj9dxbRLUj8xFKOcZoj/jt8Y9j+WqG+RCq3JohF+5ps7pPRzxs1O8i8qA7Eau
         CUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730134109; x=1730738909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KnUNLueAKjDgxYCEbUwQTT/VPUr4XHGzj00PvTOp+E=;
        b=dleKOT8SGKeZo1vzEjwxj3DwlM1sE1y43fqPOvjnBR1yP+u7+haE4DTVPMiWPTjBME
         kRwk80QwlJ1ib1u5AyfpqhgVogYLwcIpwazG51rxShgLjtTRUQaBjBIZdYSLWq1uMa7C
         oB5J+leCoTXC7YHr763LtNhfxUxZuolEXOfBA9nylaSKxz59lMhDZ4ZlOicD19DFohq5
         hnp84SOBgrbyZxmvVPG9ECk9aHMF2aEaSMGhjlUge1xD2X0TiXEqBsFr75NiWPlXUXf9
         Yymh71rIt/91Kcbbzwj9MizPfQ66cX+/s0U5cNGehZsKl2tdrnHcA55syFeG1NSmhV27
         QWUA==
X-Forwarded-Encrypted: i=1; AJvYcCX6eNvtyguwMZ+HLHmcrwFC1dnLATujrCtgP0QX2O28TW30j2edGVK4+qyvRHm6Y+4gsk/zx8JupETAiQ==@linaro.org
X-Gm-Message-State: AOJu0YxEojoaX5gFhrjo0b51ng9ErYd8ArkKYcGcyo4Q0yCgEmS4GVdL
	X+Y2IaJdey4H+BIrUY5vpxLB2bPEQb+2nUflCjlotkgNauenTXSfY2NlEdE9BFvMyIcekFBab9H
	0UNBNrmLClXn3/0MjNp9zyH0YuyaNY37A8nZ+kEK6
X-Google-Smtp-Source: AGHT+IGfJV04ZqowAK9zEadNBVsMz49bjr9g5V5cwHxrCIWiztesrHX+uwsDooy37BW15MpUHvqKweovZtxtaKLQHXA=
X-Received: by 2002:a05:6402:26c9:b0:5cb:69be:db47 with SMTP id
 4fb4d7f45d1cf-5cbbf922bb5mr7338589a12.28.1730134108942; Mon, 28 Oct 2024
 09:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com> <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com> <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com> <Zx-9WxXkmkMuGIlQ@redhat.com>
In-Reply-To: <Zx-9WxXkmkMuGIlQ@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Oct 2024 16:48:18 +0000
Message-ID: <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, cohuck@redhat.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, 
	richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, 
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
	philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: h89Oe5F5lXV7

On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
> > On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
> > > > On 10/25/24 15:06, Daniel P. Berrang=C3=A9 wrote:
> > > > > Also, is this naming convention really the same one that users
> > > > > will see when they look at /proc/cpuinfo to view features ? It
> > > > No it is not. I do agree that the custom cpu model is very low leve=
l. It
> > > > is very well suited to test all series turning ID regs as writable =
but
> > > > this would require an extra layer that adapts /proc/cpuinfo feature
> > > > level to this regid/field abstraction.
> > > >
> > > > In /cpu/proc you will see somethink like:
> > > >  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics f=
php
> > > > asimdhp cpuid asimdrdm lrcpc dcpop asimddp
> > >
> > > Right, IMHO, this is the terminology that QEMU must use in user
> > > facing APIs.
> >
> > /proc/cpuinfo's naming is rather weird for historical
> > reasons (for instance there is only one FEAT_FP16 feature
> > but cpuinfo lists "fphp" and "asimdhp" separately).
>
> There's plenty of wierd history in x86 too. In this
> case I might suggest just picking one of the two
> common names, and ignoring the other.
>
> If we really wanted to, we could alias the 2nd name
> to the first, but its likely not worth the bother.

Or we could use the standard set of architectural
feature names, and not have the problem at all, and not
have to document what we mean by our nonstandard names.
(cpuinfo names do actually mostly line up with the
standard names, just not 100%. Similarly gcc/clang command
line options are mostly the architectural feature name.)

thanks
-- PMM
