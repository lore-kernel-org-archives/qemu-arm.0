Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2986922njk;
        Sat, 21 Dec 2024 05:02:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIzUXzlhLAdFcU7VIBJ+Fid6oeuT7Rkb3VoDuDwHDP7YN4Ovvm88mn7sEme1ua7s7C8pXhJnG/rTfcJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE0o6YHM7bmF8nOkhO6KcbvpuJW/DkAaA1MtWWqZq7cP5JAL+GaExeVQD7aYP48fGWqFRpj
X-Received: by 2002:a05:6820:4cc4:b0:5f5:2d91:da61 with SMTP id 006d021491bc7-5f62e78a022mr3026676eaf.8.1734786145105;
        Sat, 21 Dec 2024 05:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734786145; cv=none;
        d=google.com; s=arc-20240605;
        b=bxW2Kko7FmnQGmx0/SMaJFY5FC++WXSkMXENI1gbVQuuO1O0L2ab/Ognbd+T4XqKVS
         AQrst9hS7mltHvA5jm07sFNGlS/dxaDbZqEDAy/uq240W0aBkXVU4EsEcBNxNeubDCES
         l8XsfM0zdvk4JXGIcy8PNtVRtdWHKcABe1I/7VP+qjNNNpcANBfx1M6hckDn82L+DM8q
         DqsJJITTiPZERhnf/zSADQE2J9XYzQmoDGjQwraPDNlCn4qbYan/p3vTpZGKyG24IbD4
         sNILFsxtjCfbOxxDEX44zVSlY01ULRTFUkJnTHV6Pw+Wg+OSHBAB4A5m2qe4TUUZdriY
         UMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:dkim-signature;
        bh=VhrzlW0tsbbw6gC+/bs1sgejXKWM5KibTza37xc2RaQ=;
        fh=45FjGexk0S4m4nmhwVMO3EiHZ/KOlbX+bClyUKLcMJA=;
        b=EMPjmVHshTfZiwaAiJU14HjYI4pUjd983+gLZVfaghUCzpkcMnrZcwm0UOV2EJGPxX
         ++yKG6j+auTyN7vK1QLLhFJGVfxGVWqss2vHsnPeSX5p/LG63NcM8G87K6twC+w9SCMp
         19eIE//3klNcUJl/kC81Ycg1nPDYrKeDwvQnIUY7/lNaKUsedizg0Jc0RCjU4uuIsWEH
         ZeRqADVQw0gQn+LVi+BT/bS0j2qPiiY1ta7A1Wx4i7sbHGHINaZmQO1/SQVk9EewptYd
         hw7sp7cxskasy/IkaaAplurWAHOmP47oJ1a9jqBC0f0NXg2x6crqu/umUBD9xVAUrbEg
         bl4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Na7n0kmR;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id 46e09a7af769-71fc99ddf21si4102196a34.160.2024.12.21.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 05:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Na7n0kmR;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88B7C5C4A54;
	Sat, 21 Dec 2024 13:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04386C4CED6;
	Sat, 21 Dec 2024 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734786144;
	bh=3EWo7emVjASneGQ7QyGa6FJQi3Vp+azIw98Wgkn13mM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Na7n0kmRoQIcVSTmuJXHUUe3jKOzsBefRCJ+n81Y9L5P58oTFPalqUehmreFafB5+
	 8Msc3NzT+pyoh8pBy6nidinmsNJ21Bf2Xag9y1nAJRX0AXznS7UD/wNG/ofivw10Hk
	 Ne2QjCC+EJmXWoGn22wi2rlJbF6mdGONONsS/pvoxXO+wz8ytXz2XkpxOJTbZuy1EK
	 zxCEQBwPg4UxsMDrKgBeJD/HPd1UJw+xayOWEa6EAx3+1NANR+zcrM5wK03u0SYI8T
	 63snwMF4KfdftFLJ6dCCBpe3C9Ch3BHOFpoj/GbbjDIreq5IekUWHkxXLusJK1/Ts5
	 OJdYPMzEW9Sog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOz7d-005vi1-Kd;
	Sat, 21 Dec 2024 13:02:21 +0000
Date: Sat, 21 Dec 2024 13:02:20 +0000
Message-ID: <86plllp4tf.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Daniel =?UTF-8?B?IlAuIEJlcnJhbmfDqSI=?= <berrange@redhat.com>
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM host model
In-Reply-To: <Z2RdMJHydsvPpmdH@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
	<edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
	<Z1qoa8yXscTSAJ9e@redhat.com>
	<8734it1bv6.fsf@redhat.com>
	<1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
	<Z2QE9AqZnpGM5sWD@gezellig>
	<8634ijrh8q.wl-maz@kernel.org>
	<Z2Q2rWj9cV0W_XVq@gezellig>
	<86zfkrptmj.wl-maz@kernel.org>
	<Z2RdMJHydsvPpmdH@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: berrange@redhat.com, kchamart@redhat.com, eric.auger@redhat.com, cohuck@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: trd3lvp9SvTS

On Thu, 19 Dec 2024 17:51:44 +0000,
Daniel "P. Berrang=C3=A9" <berrange@redhat.com> wrote:
>=20
> On Thu, Dec 19, 2024 at 03:41:56PM +0000, Marc Zyngier wrote:
> > On Thu, 19 Dec 2024 15:07:25 +0000,
> > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > >=20
> > > On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
> > > > On Thu, 19 Dec 2024 11:35:16 +0000,
> > > > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > >=20
> > > [...]
> > >=20
> > > > > Consider this:
> > > > >=20
> > > > > Say, there's a serious security issue in a released ARM CPU.  As =
part of
> > > > > the fix, two new CPU flags need to be exposed to the guest OS, ca=
ll them
> > > > > "secflag1" and "secflag2".  Here, the user is configuring a basel=
ine
> > > > > model + two extra CPU flags, not to get close to some other CPU m=
odel
> > > > > but to mitigate itself against a serious security flaw.
> > > >=20
> > > > If there's such a security issue, that the hypervisor's job to do s=
o,
> > > > not userspace.=20
> > >=20
> > > I don't disagree.  Probably that has always been the case on ARM.  I
> > > asked the above based on how QEMU on x86 handles it today.
> > >=20
> > > > See what KVM does for CSV3, for example (and all the
> > > > rest of the side-channel stuff).
> > >=20
> > > Noted.  From a quick look in the kernel tree, I assume you're referri=
ng
> > > to these commits[1].
> > >=20
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
> Whether it is enabled by default or disabled by default isn't a
> totally fatal problem. If QEMU can toggle it to the opposite value,
> we have the same level of configurability in both cases.
>=20
> It does, however, have implications for QEMU as if KVM gained support
> for exposing the new feature by default and QEMU didn't know about
> it, then the guest ABI would have changed without QEMU realizing it.

No. It just imposes that QEMU implements its part of the architecture,
which is that any ID reg it doesn't know about and that is advertised
as writable gets written back to 0, which is (in general, but with a
couple of exceptions) the value indicating that a feature is not
implemented.

The ID register space is architected, and has been unchanged for the
past 13 years.

> IOW, it would imply a requirement for timely QEMU updates to match
> the kernel, which is something we wouldn't need in x86 world where
> the feature is disabled by default. Disable by default is a more
> stable approach from QEMU's POV.

Given the above, I don't see where the burden is. And that ship has
sailed since the beginning of KVM/arm, really. It is also worth
realising that for a very long time, it wasn't really possible to
"disable" new features. Even today, disabling a feature really means
emulating its absence.

>=20
> > > Mind you, I'm _not_ saying this is how ARM should do it.  I don't know
> > > enough about ARM to make such remarks.
> > >=20
> > >     * * *
> > >=20
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
> >=20
> > Even ignoring virtualisation: you can readily find two machines using
> > the same CPUs (let's say Neoverse-N1), integrated by the same vendor
> > (let's say, Ampere), in SoCs that bear the same name (Altra), and
> > realise that they have a different feature set. Fun, isn't it?
>=20
> "Fun" is probably not the word I'd pick :-)

Of course not. "Braindead" is the word I wanted to write, but sarcasm
took over... ;-)

>=20
> > That's why I don't see CPU models as a viable thing in terms of ABI.
> > They are an approximation of what you could have, but the ABI is
> > elsewhere.
>=20
> Right, this makes life quite challenging for QEMU. The premise of named
> CPU models (as opposed to -host), is to facilitate the migration of VMs
> between heterogenous hardware platforms. That assumes it is possible to
> downgrade the CPU on both src + dst, to the common baseline you desire.
>=20
> If we were to define a named CPU model, for that to be usable, QEMU
> would have to be able to query the "maxmimum" architectural features,
> and validate that the delta between the host maximum, and the named
> CPU model is possible to downgrade. Is arm providing sufficient info
> to let QEMU do that ?

I think so. On creating a brand new VM, you get the maximum allowed on
the HW, and the subset of features you can downgrade. The intersection
of these two sets and your model's will tell you whether you can
actually instantiate this model on this host. You can also decide that
it is OK to let a extra features advertised, such as extra page sizes
or 32bit support, which the hypervisor can hide, but not disable.

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
