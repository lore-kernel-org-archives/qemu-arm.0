Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2433147njc;
        Thu, 12 Jun 2025 08:39:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV17lNrI1fcgFM9v15p9rJheHE3EEZb5CXjyHJ9jbtfdbKUH5O2+jG215VCyVBbOoWh0yIoF1++bAc2YA==@linaro.org
X-Received: by 2002:a05:690c:48c1:b0:70d:f47a:7e40 with SMTP id 00721157ae682-71161e58e55mr6680567b3.16.1749742758288;
        Thu, 12 Jun 2025 08:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742758; cv=none;
        d=google.com; s=arc-20240605;
        b=iaQOHojk3wBfPdGsIBTTHyBEnEYJ/RUd38srfHAADhFdKxgLYGkG1gGjcPxR4q3jrS
         6Su5EacyB6vDkfs1SO+z/Ubg7d65kzsQq8XRHjwradzSml1zDWVvqaqrngr+3IjI6nr7
         4/xjP3Ps/h5Tu9xE0X/0u0ah4uMOYmg/hSWeCKw6JjpX2W+lH3bVJAL39b3Pb9zHi1Pr
         vc48y37DXy1qb0L+6LYff1GlHFEfgVfDDniTdUeslGYkyp6J2cwGntY0Pz0aGQ4sO3Ec
         Uv7PREAJgZ0RPv2d6rl/EjT2fEn1G1GoqfyEHpRXAbHN+PhDOz3ll5cB5b/DMAmZKN4j
         +CiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JXT9+xCu2kLTPNMjKZBijcIVT4PBIX3CMqzxcmCHJhc=;
        fh=CpypKbFir7a1gl59Q42EK4KELaMIDCA1nJlAN+u+JHU=;
        b=gIiv3fHNmse1FmU4R80QiNvDpNYIHI9M5eqOIt7wxz+NNsMXjbquDGKlhKD5rz0kNd
         +Q2IiFsCGy6uCCzb/xbKXujy4aQN2vHq55G6FC2U40t/T5Qvh4YM2dRLWB/TLtkN0DcP
         DITJMC87qNua5iKiyXFSmluaQt5mA4Ie4vrc1sFkbgds+O/agO9vKRaBYIUslVc4HNCh
         crbx7AI621ZWFTrJSS1ICcGcOfD7LLCnXmOA0wv4c+LpWzssmnNuV2Nb7onAV8TDCaW4
         Xj+jpyRr1PKWLCIGYM1aBOfpSByRXXQLJNGP8shddsQE/jcCIA4c/elLzScOX7apvbP+
         wkdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwU2LY3h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711513dd03csor11735257b3.0.2025.06.12.08.39.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pwU2LY3h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742757; x=1750347557; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXT9+xCu2kLTPNMjKZBijcIVT4PBIX3CMqzxcmCHJhc=;
        b=pwU2LY3hCHMtTIPJN02m0ZDKFUBjdsxfk/a3olZ39jz4y+PMZAXelAz0NJUgKUlaPo
         uE/dTOTB5bEGh95jQFk3TpsmaP+g9aUY3uRJHLZVb/FDaM6l4lKGsv2THtR1Em3NBdEx
         VV6hlvL0BRWVDDYixT+NLePhXeazly+JZ6PJPzXYZfZySgLYpTgcE/Jyix9LghVBIWkk
         6MbG8PSAEtJvmmEPpc498fFDJQqid0+FGNMZU9J49dMwNQqzOG8C1l05mudjRPlm9fC5
         YIyBzZFRP/jO1JMm5RIBpVfgk3S6t28vKxMtay5+L246aynqZAVRckVYStdNyZIi9sk2
         06gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742757; x=1750347557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXT9+xCu2kLTPNMjKZBijcIVT4PBIX3CMqzxcmCHJhc=;
        b=ElBkPsR4PfeRvtHj1aCPERaB1g1R1P4NVHMTnYxQBAp4Q2ZNrwy2GdgbPf2J2BEdom
         JKpSS7rIKXdbrzFuhPWA3tlrRw4Q+2ZRmnyodAl4+Xdw2bUkcJfxMXvafB33+HjnrCiN
         VK42AgZzODtvhLcWy9gd0hzKBspcgRlY0b5N/oNS/1hz5K1g6mYVLn9eMThPBlWPBald
         oHV2jB2OkN2tsLftlIMAznB7NvKsh3K2UdVlJd3C1ofgRw5jPAn4qJkHH5zKu482ehYk
         GEo2aVNhCGAEpE+mKTwWvAk1zcnHj/nlDxn4O5ioZuJtXmhitQkpFSK/gc5Zna9rrt/e
         J1QA==
X-Forwarded-Encrypted: i=1; AJvYcCX1F7qZ7J941OX7GmVHEprIVehiQr2bwp6Z6/THDCXxERK/sCyrbY6cQBnsBYnSoeirQRkkM10x3S2qVA==@linaro.org
X-Gm-Message-State: AOJu0YxW4EaOH9+jrIcGZKk2rhzHDgWRvO81xIE2cXe9VTZOTQBopwm6
	t2lceAbZO/Rff+xowAvGyTcYuXitjmOuzx1I8oAdJlAa2Xlvbv0+j2V0XhLuT8ACi+S7CYACyIp
	KGrnEaFlWeLgL3T0DQYfdrrL/QJoQfIa150WpKCP1JMxf
X-Gm-Gg: ASbGncurHktbUmofZPc8WYSAU1vobjbCytPt+pISswZK5zRej/CqR4Ypop4IEuktJEA
	oPFjPozMPmrbeakw1/HbFCNQ9bM2wUWWsijimmNT2+BJu68/wVCtGsuSQvzhAzdmiRntwM4ZvS9
	uIBcngLzlm9/YGr1TKKXo6pNB3F6FId1dPml4DAXKTbGJ1
X-Google-Smtp-Source: AGHT+IHlkIH86GpFkBYLnTKRfBrIjt+QS7YNu/3E5ZRMJuF1GJLPYhHPNq89j0URmxtX1O2VULTTrxcSXSpqiX18NXM=
X-Received: by 2002:a05:690c:907:b0:70e:143:b827 with SMTP id
 00721157ae682-71161e26ee3mr5727027b3.8.1749742757338; Thu, 12 Jun 2025
 08:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-9-cohuck@redhat.com>
 <CAFEAcA-c=EaE-Y4DMVz_meVd2cbxuCyFGFOXET-COOgMWHXWWA@mail.gmail.com> <87a56d9dlb.fsf@redhat.com>
In-Reply-To: <87a56d9dlb.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:39:04 +0100
X-Gm-Features: AX0GCFuzI2YyCIMD8vpl4ErMfb7p-rmxq7r54GM8puuwIMjmPs8pzpmH3mOQeEs
Message-ID: <CAFEAcA-rYNaaZ3LFFkhek0duptPeMXUBbPbBnWa7teNPM+c6ug@mail.gmail.com>
Subject: Re: [PATCH v7 08/14] arm/cpu: Store id_isar0-7 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: x3nrgh186/v2

On Thu, 12 Jun 2025 at 16:36, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> From: Eric Auger <eric.auger@redhat.com>
> >>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  hw/intc/armv7m_nvic.c     |  12 ++--
> >>  target/arm/cpu-features.h |  36 +++++-----
> >>  target/arm/cpu.c          |  24 +++----
> >>  target/arm/cpu.h          |   7 --
> >>  target/arm/cpu64.c        |  28 ++++----
> >>  target/arm/helper.c       |  14 ++--
> >>  target/arm/kvm.c          |  21 ++----
> >>  target/arm/tcg/cpu-v7m.c  |  90 +++++++++++++-----------
> >>  target/arm/tcg/cpu32.c    | 144 +++++++++++++++++++++-----------------
> >>  target/arm/tcg/cpu64.c    | 108 ++++++++++++++--------------
> >>  10 files changed, 243 insertions(+), 241 deletions(-)
> >
> > This doesn't compile:
> >
> > ../../target/arm/tcg/cpu-v7m.c:70:5: error: incompatible pointer types
> > initializing 'ARMISARe
> > gisters *' (aka 'struct ARMISARegisters *') with an expression of type
> > 'uint64_t *' (aka 'unsigned long *')
> > [-Werror,-Wincompatible-pointer-types]
> >    70 |     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
> >   875 |         ARMISARegisters *i_ = (ISAR);
> >          \
> >       |                          ^    ~~~~~~
> > ../../target/arm/tcg/cpu-v7m.c:71:5: error: incompatible pointer types
> > initializing 'ARMISARegisters *' (aka 'struct ARMISARegisters *') with
> > an expression of type 'uint64_t *' (aka 'unsigned long *')
> > [-Werror,-Wincompatible-pointer-types]
> >    71 |     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
> >   875 |         ARMISARegisters *i_ = (ISAR);
> >          \
> >       |                          ^    ~~~~~~
> >
> > (and more similar errors until the compiler gives up).
>
> What configs/compiler are you using? I obviously would have fixed that
> if I had hit it...

This is clang 18.1.3 (1ubuntu1) on x86-64 Linux, configured with

'../../configure' '--cc=clang' '--cxx=clang++' '--enable-ubsan'
'--target-list=arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user'

Whatever the problem is, it goes away on a later patch, so probably
it's just that some fragment in a later patch needs to move into
this one.

thanks
-- PMM
