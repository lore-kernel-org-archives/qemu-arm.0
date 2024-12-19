Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1729701njk;
        Thu, 19 Dec 2024 07:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/8gafvTwuNiLgA5zmqC8aG09/fI+nVIOWTG0EhL7jBLT4irxzajuviyoBdGkf1hX8BBcsHW3ggE5JwA==@linaro.org
X-Google-Smtp-Source: AGHT+IFtAvZP/G4LvemV1QPk+6VgfGcKZU4DH3HLl3X2reJ01WH/FO8kl6aDsPmc9YVOTb1w8Evk
X-Received: by 2002:a05:6102:2912:b0:4af:4974:a489 with SMTP id ada2fe7eead31-4b2ae824a99mr8188613137.20.1734622920195;
        Thu, 19 Dec 2024 07:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734622920; cv=none;
        d=google.com; s=arc-20240605;
        b=TD4442vADSc+jDf3SoIzdnaX8SWTWnavcYz9Jwdk7qTDXp3ZWff9iN/1cGIkcaVYO2
         qamth3paBy8xsXyjD18bba+mw8OHS10OVfWNMaw7taqRs5RDha4B1IAXUnfCqP5spki9
         /CDm1NRat/Ulk3cPA2k16wFc2iujVJw+d+0XopnlpCGaUADBo+f9w5xMpQLrSiAkBi8k
         6tqk6EnyO7HO9aaU3PGFH1jJtIqv4oolBGc1UaP1QqDoUdcdlCardyk14HQBOQnjvKsi
         slCNgskbKUiK3j2WKlEB0YFMkR2MCIniK934vGx/NgklM4sdFkYcyDT6/ye/qwlay6S6
         sSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:dkim-signature;
        bh=cFocAlp7SU3rm5NZrr6OkSkfGpQPsZr1ds62zeppwuE=;
        fh=lI7Iko9g2aHKLBt1gNdWHXeaCjlEDenZquMsaPC+VK8=;
        b=OE3+jXX/3P6s8Hyr3WvHKRpkJooye6VAYvwn4G00fxviUe4siTpRj1lz8wJ8eji/oc
         p2Twut61+8De0rYq2RThaBr+imbeHuSTETzCVHU+jqgwzrX3DJwmyYDeCyDJMEu1qQfp
         XNqg3B/wG4NJdWlrhwtrQHI+D/ctHcyne+STrga0jwFSCTK0v9y6u7+EObBmbblIXerb
         pU8gyIHTCWhN60KUcw4+UgjxOR7mBtHLXPCKtho0b/NJ94O6k1qLEdui7d6Ermrq9arV
         2ivcA98IHMjlXCPCKREhIi64Oujybc50orcfd97lJ9DX7LA1eedFxS/fY2fNwcnaAGwB
         5/HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YtuUEpUr;
       spf=pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [147.75.193.91])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8610ac331aesi512169241.66.2024.12.19.07.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 07:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) client-ip=147.75.193.91;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YtuUEpUr;
       spf=pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 311EAA42009;
	Thu, 19 Dec 2024 15:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F5EC4CECE;
	Thu, 19 Dec 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734622919;
	bh=JT6efBVKqubwl6mff1iO/fWWnelB4X1FDGSeUIpzVXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YtuUEpUrjVn8+lKZ7otJAzgavXmA+SvAYu0KyW4vdH1VbreJ1cJKqVJvuq9QP16fW
	 0UKeGlyTG3T/66OwubbvqpUfWa7xSwzAKORIbC/qVSavLi9/uaRWFUPTrHxoAwFCBW
	 anOTfhikMvHolmG8is56+dzfppsoWEXGLd1eXrl2pzw1/MQD1QSkF297wpqR3pr3Od
	 yoK/0qenK7+PdmErk4OM1dpVQASpd8sbfVGaPKk+DIOu3cNo/5W6AC9rQKDMm+rDai
	 aCUyWcbSsxSF1Eb+uZH9X1qium+y6ToYTTAhR/5KfgwYDAVJhfml3gsm1HXQBvahnU
	 JgemaMgfiWVqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOIez-005J4X-4n;
	Thu, 19 Dec 2024 15:41:57 +0000
Date: Thu, 19 Dec 2024 15:41:56 +0000
Message-ID: <86zfkrptmj.wl-maz@kernel.org>
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
In-Reply-To: <Z2Q2rWj9cV0W_XVq@gezellig>
References: <20241206112213.88394-1-cohuck@redhat.com>
	<edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
	<Z1qoa8yXscTSAJ9e@redhat.com>
	<8734it1bv6.fsf@redhat.com>
	<1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
	<Z2QE9AqZnpGM5sWD@gezellig>
	<8634ijrh8q.wl-maz@kernel.org>
	<Z2Q2rWj9cV0W_XVq@gezellig>
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
X-TUID: p3/aw3IJENhs

On Thu, 19 Dec 2024 15:07:25 +0000,
Kashyap Chamarthy <kchamart@redhat.com> wrote:
>=20
> On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
> > On Thu, 19 Dec 2024 11:35:16 +0000,
> > Kashyap Chamarthy <kchamart@redhat.com> wrote:
>=20
> [...]
>=20
> > > Consider this:
> > >=20
> > > Say, there's a serious security issue in a released ARM CPU.  As part=
 of
> > > the fix, two new CPU flags need to be exposed to the guest OS, call t=
hem
> > > "secflag1" and "secflag2".  Here, the user is configuring a baseline
> > > model + two extra CPU flags, not to get close to some other CPU model
> > > but to mitigate itself against a serious security flaw.
> >=20
> > If there's such a security issue, that the hypervisor's job to do so,
> > not userspace.=20
>=20
> I don't disagree.  Probably that has always been the case on ARM.  I
> asked the above based on how QEMU on x86 handles it today.
>=20
> > See what KVM does for CSV3, for example (and all the
> > rest of the side-channel stuff).
>=20
> Noted.  From a quick look in the kernel tree, I assume you're referring
> to these commits[1].
>=20
> > You can't rely on userspace for security, that'd be completely
> > ludicrous.
>=20
> As Dan Berrang=C3=A9 points out, it's the bog-standard way QEMU deals with
> some of the CPU-related issues on x86 today.  See this "important CPU
> flags"[2] section in the QEMU docs.

I had a look, and we do things quite differently. For example, the
spec-ctrl equivalent in implemented in FW and in KVM, and is exposed
by default if the HW is vulnerable. Userspace could hide that the
mitigation is there, but that's the extent of the configurability.

>=20
> Mind you, I'm _not_ saying this is how ARM should do it.  I don't know
> enough about ARM to make such remarks.
>=20
>     * * *
>=20
> To reply to your other question on this thread[3] about "which ABI?"  I
> think Dan is talking about the *guest* ABI: the virtual "chipset" that
> is exposed to a guest (e.g. PCI(e) topology, ACPI tables, CPU model,
> etc).  As I understand it, this "guest ABI" should remain predictable,
> regardless of:
>=20
>   - whether you're updating KVM, QEMU, or the underlying physical
>     hardware itself; or
>   - if the guest is migrated, live or offline
>=20
> (As you might know, QEMU's "machine types" concept allows to create a
> stable guest ABI.)

All of this is under control of QEMU, *except* for the "maximum" of
the architectural features exposed to the guest. All you can do is
*downgrade* from there, and only to a limited extent.

That, in turn has a direct impact on what you call the "CPU model",
which for the ARM architecture really doesn't exist. All we have is a
bag of discrete features, with intricate dependencies between them.

Even ignoring virtualisation: you can readily find two machines using
the same CPUs (let's say Neoverse-N1), integrated by the same vendor
(let's say, Ampere), in SoCs that bear the same name (Altra), and
realise that they have a different feature set. Fun, isn't it?

That's why I don't see CPU models as a viable thing in terms of ABI.
They are an approximation of what you could have, but the ABI is
elsewhere.

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
