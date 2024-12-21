Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp3039231njk;
        Sat, 21 Dec 2024 06:45:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlpXFFmn8wO6JEXLkoSIXKBjPiuw7UXZ/lgDvuktXwn4yxJhJR3GCdCSfSvxkV85+eJ1tV3K3vd+Z5GQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFyqr+pwgZv/LibRHDXUVfh8xhG83WmP1HIZnWz6m1tK/FJmZwwWuslPXwmPEWNKOI16IrN
X-Received: by 2002:a05:6808:3c89:b0:3eb:75b2:1e1d with SMTP id 5614622812f47-3ed88f0657fmr3775818b6e.12.1734792307635;
        Sat, 21 Dec 2024 06:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734792307; cv=none;
        d=google.com; s=arc-20240605;
        b=OozneB7su9GaFYaQVoSkxe9Ti4oibM6awzrrraGm9MV8442gG9zsrBqfgrwUOuopgr
         kzvu0YDpF3EOOLM15/7E7qSH3pNq+DkdgZ2KfmNlIM+SadnAKgt/ZSdSYyRppj1kkMMS
         hP+rJd2jit7Av8wPai4JSDBMkyf59xeA5NaWuAmgyDyOpIvrDXs909M25GYLqD2S0/dD
         +pUJZv8QPqexsoI8BNFYz4dewlJysM3dcH1dZ3msDls3GIXwGf2WOw7CUKMml/akled6
         Gz4excjPcM4G8t+/ROEFD1smYx2bcgeCCye5NxITF9bxaEs/orvUPazdBKnEzJ9ufEUy
         4pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:dkim-signature;
        bh=71Y6SWJocUYbf0kYTtLoB9PU4A+6mPfp7PCzYlHKD/M=;
        fh=lI7Iko9g2aHKLBt1gNdWHXeaCjlEDenZquMsaPC+VK8=;
        b=PClFnsPjqdeBFHtqwsvSGrtDrl/9kEDwtliMxbkOV4Gov8GTr/BpTkor44eEQhP/gA
         hjI5zHih8e6a4UIPzfDBg3wRA8B7/hU4xMuHSNhJnu26zV+0Ezk+KnVw4po7vt5qm4QJ
         El9LLe4gZQ0akvDI1H+8SBffLyJ3IoMk9ehrtpZoeao6I98iBnZgeRLX5wHn92/bIOtD
         Xn4eJFDAuzeNHZNeSIr/cjrgQXsx0f46rucLgcgAQnyfy4pXTnh5TAA6UCAgrbEM41t3
         M7049exIDf8yql9G/Y3/xvhcU0W4oxa43hA96+V5YXcgfJ5CrfZq//KMUcDruVkwoiYF
         Wk5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qIcKCcyr;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id 5614622812f47-3ece247d966si3966804b6e.97.2024.12.21.06.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 06:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qIcKCcyr;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DA6E5C0501;
	Sat, 21 Dec 2024 14:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC18C4CECE;
	Sat, 21 Dec 2024 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734792307;
	bh=RTxtRLIzNICSkFSsFrtMnneEz9Nx55H3GX4PCepvgTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qIcKCcyrV5Xt9uX6Ze4j3ef5rc4a7tjlNFm1GJAlY06VlFE98bqA3yId7jM2NHJdf
	 vbpDcB4HWTkYkIxwZS24LnpRHo8t5dChFIz+pkF4A6llYH6tzkJz0AlfdEpu3Sw3M5
	 FMx9Z79DjLqI9IlY7HfAVVV5s+sx8IIH+QIsBjiOJFe4d2xLBPZGHiicC+kc4nrxDX
	 YWMG9VqLmQ3bZhPmmA47+bmCoT+eP18TrHUjMNbZdDRzTx3IpLGHvHCPJ4dQVYOx3+
	 neQRnUhoN99zp/cMUCmQrlkX3zLoJpyqdctyo6lfoDOdQVgIipksnXcTNC71tro4cK
	 NVfiHCqxiLTOQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tP0j2-005wV5-Ir;
	Sat, 21 Dec 2024 14:45:04 +0000
Date: Sat, 21 Dec 2024 14:45:03 +0000
Message-ID: <86o715p028.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>,	Cornelia Huck <cohuck@redhat.com>,
	Daniel =?UTF-8?B?IlAuIEJlcnJhbmfDqSI=?= <berrange@redhat.com>,
	eric.auger.pro@gmail.com,	qemu-devel@nongnu.org,	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,	peter.maydell@linaro.org,
	richard.henderson@linaro.org,	alex.bennee@linaro.org,
	oliver.upton@linux.dev,	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,	armbru@redhat.com,
	abologna@redhat.com,	jdenemar@redhat.com,	shahuang@redhat.com,
	mark.rutland@arm.com,	philmd@linaro.org,	pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM host model
In-Reply-To: <Z2Vak-hbCMaxm-JJ@gezellig>
References: <20241206112213.88394-1-cohuck@redhat.com>
	<edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
	<Z1qoa8yXscTSAJ9e@redhat.com>
	<8734it1bv6.fsf@redhat.com>
	<1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
	<Z2QE9AqZnpGM5sWD@gezellig>
	<8634ijrh8q.wl-maz@kernel.org>
	<Z2Q2rWj9cV0W_XVq@gezellig>
	<86zfkrptmj.wl-maz@kernel.org>
	<Z2Vak-hbCMaxm-JJ@gezellig>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kchamart@redhat.com, eric.auger@redhat.com, cohuck@redhat.com, berrange@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: EX5KZNaUK/Ru

On Fri, 20 Dec 2024 11:52:51 +0000,
Kashyap Chamarthy <kchamart@redhat.com> wrote:
>=20
> On Thu, Dec 19, 2024 at 03:41:56PM +0000, Marc Zyngier wrote:
> > On Thu, 19 Dec 2024 15:07:25 +0000,
> > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > >=20
> > > On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
> > > > On Thu, 19 Dec 2024 11:35:16 +0000,
> > > > Kashyap Chamarthy <kchamart@redhat.com> wrote:
>=20
> [...]
>=20
> > > > You can't rely on userspace for security, that'd be completely
> > > > ludicrous.
> > >=20
> > > As Dan Berrang=C3=A9 points out, it's the bog-standard way QEMU deals=
 with
> > > some of the CPU-related issues on x86 today.  See this "important CPU
> > > flags"[2] section in the QEMU docs.
> >=20
> > I had a look, and we do things quite differently. For example, the
> > spec-ctrl equivalent in implemented in FW and in KVM, and is exposed
> > by default if the HW is vulnerable. Userspace could hide that the
> > mitigation is there, but that's the extent of the configurability.
>=20
> Noted.  As Dan says, as long as QEMU can toggle the feature on/off, then
> that might be sufficient in the context of migratability.
>=20
> [...]
>=20
> > > To reply to your other question on this thread[3] about "which ABI?" =
 I
> > > think Dan is talking about the *guest* ABI: the virtual "chipset" that
> > > is exposed to a guest (e.g. PCI(e) topology, ACPI tables, CPU model,
> > > etc).  As I understand it, this "guest ABI" should remain predictable,
> > > regardless of:
> > >=20
> > >   - whether you're updating KVM, QEMU, or the underlying physical
> > >     hardware itself; or
> > >   - if the guest is migrated, live or offline
> > >=20
> > > (As you might know, QEMU's "machine types" concept allows to create a
> > > stable guest ABI.)
> >=20
> > All of this is under control of QEMU, *except* for the "maximum" of
> > the architectural features exposed to the guest. All you can do is
> > *downgrade* from there, and only to a limited extent.
> >=20
> > That, in turn has a direct impact on what you call the "CPU model",
> > which for the ARM architecture really doesn't exist. All we have is a
> > bag of discrete features, with intricate dependencies between them.
>=20
> I see; thanks for this explanation.  Your last sentence above is the
> shortest summary of the CPU features situation on ARM I've ever read so
> far.=20
>=20
> So, I infer this from what you're saying (do correct if it's wrong):
>=20
>   =E2=80=A2 Currently it is impractical (not feasible?) to pull together a
>     minimal-and-usable set of CPU features + their dependencies on ARM
>     to come up with a "CPU model" that can work across a reasonable set
>     of hardware.

It isn't quite that. It *is* technically possible, and KVM does give
you the tools you need for that. In practice, the diversity of the
ecosystem is so huge that you can only rely on some very basic stuff
unless the implementations are already very close. And that "small
details" such as the timer frequency are strictly identical.

>=20
>   =E2=80=A2 If the above is true, then the ability to toggle CPU features=
 on and
>     off might become even more important for QEMU =E2=80=94 if it wants t=
o be
>     able to support live migration across mixed set of hardware on ARM.  =


Turning CPU features off is not always possible. Hiding them is
generally possible, with a number of exceptions. We try our best to
provide both, but it's... complicated.

[...]

> Related tangent on CPU feature discoverability on ARM:
>=20
> Speaking of "Neoverse-N1", looking at a system that I have access to,
> the `lscpu` output does not say anything about who the integrator is; it
> only says:
>=20
>     ...
>     Vendor ID:                ARM
>     Model name:             Neoverse-N1
>     ...
>=20
> I realize, `lscpu` displays only whatever the kernel knows.  Nothing in
> `dmidecode` either.

The kernel does not know anything about the "Neoverse-N1" string. It
can match some MIDR_EL1 values for errata workaround purposes, but
doesn't gives two hoots about a human readable string.

Every other year, we get asked to add a full database of strings in
the kernel. The answer is a simple, polite, and final "no way". This
serves no purpose at all. lscpu does have that database, and that's
the right place to do it.

When it comes to integration, the firmware can optionally report some
information, which is the EL3 version of a commercial break (see the
SOC_ID stuff). This isn't wildly deployed, thankfully.

> Also, it looks like there's no equivalent of a "CPUID" instruction (I
> realize it is x86-specific) on ARM.  Although, I came across a Google
> Git repo that seems to implement a bespoke, "aarch64_cpuid".  From a
> what I see, it seems to fetch the "Main ID Register" (MIDR_EL1) - I
> don't know enough about it to understand its implications:
>=20
>     https://github.com/google/cpu_features/blob/main/src/impl_aarch64_cpu=
id.c

MIDR_EL1 doesn't give you much, and you cannot assume anything about
the the feature set from it. Linux already allows you to inspect the
ID registers from userspace (by trapping, emulating, and sanitising
the result). That's the only reliable source of information.

>
> > That's why I don't see CPU models as a viable thing in terms of ABI.
> > They are an approximation of what you could have, but the ABI is
> > elsewhere.
>=20
> Hmm, this is "significant new information" for me.  If CPU models can't
> be part of the guest ABI on ARM, then the whole "migratability across
> heterogenous hardware" on QEMU requires deeper thinking.

As I said all along, the only source of truth is the set of ID
registers. Nothing else. You can build a "model" on top of that, but
not the other way around.

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
