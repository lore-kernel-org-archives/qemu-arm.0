Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1584041ejs;
        Thu, 11 Jan 2024 01:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKQPd4tKVgMrMeljuY3SJCve+W6ss1BztVECiaAnbP6Qahn6JoHH71MZC28bW2wlIVygqh
X-Received: by 2002:a05:6830:18f7:b0:6dd:e0b1:d712 with SMTP id d23-20020a05683018f700b006dde0b1d712mr1153402otf.21.1704966480007;
        Thu, 11 Jan 2024 01:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704966479; cv=none;
        d=google.com; s=arc-20160816;
        b=iMtMKGwhKyiddZCt1qgJyuBdoMnfFjiVEYvdHcnHgVHzKvP67nttgCTsDM1Um8tlxt
         cuLTs45afuWoEd39n92xgY8oFZS8APLGFoKg3m6dY0aBwdKdnxdmAlX4/1M8+lF65cHr
         xCoPuCPMkyJpocaN9nccxc8rpVWgDgqDLQK91UIt13o2Dl353VbgoBORIdI0MaYBEFzq
         KGkZEI1aAS48Wp+n6k0QFbi0/Cw4rZMPXyB7hE9LVUizEz2TFIcmg80uU82NNZ/kvovE
         eUiHwQFzGXgojc5oR2pJhVqQhc1HVXDZXsEoaTzQNuOQlAP/vs+jJde1Sfns88YlaZf5
         lvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:dkim-signature;
        bh=FGDLykZhH1tEFk6+7LbRWRU1Hd+a73nLEXX9WZKwThI=;
        fh=tlVhsylnBhe8jg5rq11QCo3Q1or02avOWDz1MKcq9iY=;
        b=aZOe/m/lFOLYtvNt5XXFHj6ir3ZjBkX3r3uq9d9d/RJY2ybeI/kb1sTi+GAWri+4we
         Y0wqUtZTIEHiu9l8JUS568jiihmY9SQasnbTYMrPSdWhcyybJoPRLW/U7E+EWjEW9mwl
         2WVix/jmuKC4JYlkgxdm1Yx4Sw68dnq01YJOAeIUeP93fmiGe0YX67KadyUICBChwNxg
         OZxqqyuXeC1utqScOms6RimlEUNP9QbnDh+2RcSwGNvbRJ840mnnQjSQ5FephTNR3rJl
         eX/3ewFrZmJZ8x2i9Wi/C3+AojDT1k7ACf4ps2FqhXEi1047WAPPenxe+SQI/ZQUpH13
         9HRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=U19qhGQj;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id z9-20020a056830290900b006de440d5680si218331otu.13.2024.01.11.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 01:47:59 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=U19qhGQj;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9BBD619EC;
	Thu, 11 Jan 2024 09:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD29C433F1;
	Thu, 11 Jan 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704966479;
	bh=sdXGVlU/cbOcnVnihltP6gl3LWUXUYXfMsu8Vi8kA0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U19qhGQjwGHqgoT/AscpE4/Irp6jVLpERHgnwQdh7uZLkhmypHHjck/e3IVZMDZyg
	 fxbWVLtPHq/6CsWnxC3vHJP+DuWk7KAD5+eF6Q1ORb4BDGDb2Be1r2k2ys3ls27zce
	 qC7BA6xAQ/iVsm/mo0i+GtqvCZQE+MZWd4MVhy6eMhMnNp5TPrshvo/yotdWngY/de
	 XOKn1rQqfJvyvxQeUDuLBGwealqC1aIV1C84Wqd7oSRfghSUHmL1TixGKMrTapvpCy
	 q2iZ1G9rTFPNYN7CUNuB2u3s6N1SGIQezeyiuKbg6mgp10kp67uf85rnIi6ei4e7cm
	 Kb1g4HXNsJvbg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rNrfI-00AlsT-MK;
	Thu, 11 Jan 2024 09:47:56 +0000
Date: Thu, 11 Jan 2024 09:47:56 +0000
Message-ID: <865y009p6b.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,	Peter Maydell <peter.maydell@linaro.org>,	Andrew
 Jones <ajones@ventanamicro.com>,	Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,	qemu-arm@nongnu.org,	Kevin Wolf
 <kwolf@redhat.com>,	Igor Mitsyanko <i.mitsyanko@gmail.com>,	Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,	Radoslaw Biernacki
 <rad@semihalf.com>,	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,	Leif
 Lindholm <quic_llindhol@quicinc.com>,	Rob Herring <robh@kernel.org>,	Markus
 Armbruster <armbru@redhat.com>,	Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v3 13/14] hw/arm: Prefer arm_feature(AARCH64) over object_property_find(aarch64)
In-Reply-To: <ff57e1f5-ea78-459e-b51c-48040483bdea@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
	<20240110195329.3995-14-philmd@linaro.org>
	<ff57e1f5-ea78-459e-b51c-48040483bdea@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: philmd@linaro.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, ajones@ventanamicro.com, marcin.juszkiewicz@linaro.org, qemu-arm@nongnu.org, kwolf@redhat.com, i.mitsyanko@gmail.com, alex.bennee@linaro.org, rad@semihalf.com, edgar.iglesias@gmail.com, quic_llindhol@quicinc.com, robh@kernel.org, armbru@redhat.com, alistair@alistair23.me
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: Kbq55h2eaRQH

On Thu, 11 Jan 2024 09:39:18 +0000,
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>=20
> On 10/1/24 20:53, Philippe Mathieu-Daud=C3=A9 wrote:
> > The "aarch64" property is added to ARMCPU when the
> > ARM_FEATURE_AARCH64 feature is available. Rather than
> > checking whether the QOM property is present, directly
> > check the feature.
> >=20
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   hw/arm/virt.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 49ed5309ff..a43e87874c 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2140,7 +2140,7 @@ static void machvirt_init(MachineState *machine)
> >           numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE=
(cpuobj),
> >                             &error_fatal);
> >   -        aarch64 &=3D object_property_get_bool(cpuobj, "aarch64",
> > NULL);
> > +        aarch64 &=3D arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64);
>=20
> So after this patch there are no more use of the ARMCPU "aarch64"
> property from code. Still it is exposed via the qom-tree. Thus it
> can be set (see aarch64_cpu_set_aarch64). I could understand one
> flip this feature to create a custom CPU (as a big-LITTLE setup
> as Marc mentioned on IRC), but I don't understand what is the
> expected behavior when this is flipped at runtime. Can that
> happen in real hardware (how could the guest react to that...)?

I don't think it makes any sense to do that while a guest is running
(and no HW I'm aware of would do this). However, it all depends what
you consider "run time". You could imagine creating a skeletal VM with
all features, and then apply a bunch of changes before the guest
actually runs.

I don't know enough about the qom-tree and dynamic manipulation of
these properties though, and I'm likely to be wrong about the expected
usage model.

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
