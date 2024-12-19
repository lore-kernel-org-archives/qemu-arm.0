Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1592517njk;
        Thu, 19 Dec 2024 04:26:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCpagqZJyINrlxFOUwn4/kRbNNL9XHk9KbEpIdk/fqRxudLX5pdWHGXzbCQpohKyTkmZV8AL3E3qbj/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFm5F+XolR+p/lJhD9zaT+/rVGs8XlsPAqtQfVFC9hu+zQNWHCtWv34wHvYGeePqbmhBwAP
X-Received: by 2002:ac8:7f4e:0:b0:461:2616:84c3 with SMTP id d75a77b69052e-46908db069emr106400721cf.8.1734611193338;
        Thu, 19 Dec 2024 04:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734611193; cv=none;
        d=google.com; s=arc-20240605;
        b=fyKSQDauXsBvMhroEbLlJ2DlCFGTVjXI36roF3pvkPwDwDVaMKSeHbBX2SEfMKpxXt
         3yE1IsFJjUyKkdxZQLTbUynS2mkuAJqgyxSSYa62ajlmNrLFXo5gPPC1XkwDttmOwwtx
         fkfpaRRVobUfwPcntdFIk2APF2IF0Zsp2J7nM3WTXLOuRUclZUHREaE7avKHogShpzR2
         o7Q6dpImFyoOBj1UtSnAVs0Qn02wcT6jd7Eipp7uHZhwlG5TrPJ+WNtKcZJPq7PO6yg0
         Kjs0QdU0vEXHxFgIZPagc9ElGzBC2nET/GMTLVHct8kNeIewIFuZOk3a0xFCVc4+ANTo
         QtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:dkim-signature;
        bh=9I4C5OmqE8lEwOV6Yc3X/QJ7BjR+NLYedql+dXhCHU8=;
        fh=lI7Iko9g2aHKLBt1gNdWHXeaCjlEDenZquMsaPC+VK8=;
        b=NnYk1Ul456GoLF4sBA4TObQpaQIed5q9L6GUgJjKQHCbbKGvjQf0+IF7DXidLiwJTV
         Bt5M2q7SExTpyCB224LdjT6FeQKlJ2LlNv9pHORfLptVN/WpejKYiF3RZ5BOLofv+7x5
         yNKxlYOobAVq8vi3J6J71nD7r+LLlws9szhsXkX/3L2qoZvgXSuhgs/hh/zZXf1dJ75P
         QJWhwohjAQ+6W93RbRGamE8Xe2UpjL/Z7NOu0g8+IdSbpu8TTetnhZJ3sq1/TFVVgej2
         yaU72iC26g5bZJSUy+kG+XcoILFfiT9jQpJzPd9mxddg/nKUagi4rtS3wHP5ebUW2CQX
         +cfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Tu9FO8H0;
       spf=pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [147.75.193.91])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ec052b7si12785581cf.669.2024.12.19.04.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:26:33 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) client-ip=147.75.193.91;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Tu9FO8H0;
       spf=pass (google.com: domain of maz@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 625B0A41FF7;
	Thu, 19 Dec 2024 12:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876BBC4CECE;
	Thu, 19 Dec 2024 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734611192;
	bh=04mrj61m5M0eK5uxb9qdhTTuprN8gSJHsEGg321+jug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tu9FO8H01Fn5WM+XuIr+y7JwK+/oOLnvU7jJj6ovl99TvBJD/McqbMYuu/kRbpU5a
	 K2prrYhSmM+4J7InIx/NZQxGvujabU4YHkeem9PDUqPerCX8sIyvrd9wDt2WiAmoQ2
	 fb5WjxJtfKZ26gD6kte0oWo81onM79tkmTEJnMjRZ5XRkB1iJkqM4YuzFw2ql5mCGP
	 qB2yBT57i+/oPAmpWl66JkjZil1tK+3QyEr5m6PFs+YGnu9cz8G49sXcQnLrM00iTb
	 nEpRbn/Iy3XEYXXM5mWr73rY8PXQLZzX3th8PBIFiPC2alQZOdiEVpTWkyI12f8nO5
	 SBIo6VxjVFSWw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOFbq-005GKK-DH;
	Thu, 19 Dec 2024 12:26:30 +0000
Date: Thu, 19 Dec 2024 12:26:29 +0000
Message-ID: <8634ijrh8q.wl-maz@kernel.org>
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
In-Reply-To: <Z2QE9AqZnpGM5sWD@gezellig>
References: <20241206112213.88394-1-cohuck@redhat.com>
	<edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
	<Z1qoa8yXscTSAJ9e@redhat.com>
	<8734it1bv6.fsf@redhat.com>
	<1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
	<Z2QE9AqZnpGM5sWD@gezellig>
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
X-TUID: Qg29UNmVariq

On Thu, 19 Dec 2024 11:35:16 +0000,
Kashyap Chamarthy <kchamart@redhat.com> wrote:
>=20
> On Thu, Dec 12, 2024 at 11:04:30AM +0100, Eric Auger wrote:
>=20
> Hi Eric,
>=20
> > On 12/12/24 10:36, Cornelia Huck wrote:
> > > On Thu, Dec 12 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
>=20
> [...]
>=20
> > >> Consider you mgmt app wants to set a CPU model that's common across
> > >> heterogeneous hardware. They don't neccessarily want/need to be
> > >> able to live migrate between heterogeneous CPUs, but for simplicity
> > >> of configuration desire to set a single named CPU across all guests,
> > >> irrespective of what host hey are launched on. The ARM spec baseline
> > >> named models would give you that config simplicity.
> > > If we use architecture extensions (i.e. Armv8.x/9.x) as baseline, I'm
> > > seeing some drawbacks:
> > > - a lot of work before we can address some specific use cases
> > > - old models can get new optional features
> > > - a specific cpu might have a huge set of optional features on top of
> > >   the baseline model
> > >
> > > Using a reference core such as Neoverse-V2 probably makes more sense
> > > (easier to get started, less feature diff?) It would still make a good
> > > starting point for a simple config.
> > >
> > Actually from a dev point of view I am not sure it changes much to have
> > either ARM spec rev baseline or CPU ref core named model.
> >=20
> > One remark is that if you look at
> > https://developer.arm.com/documentation/109697/2024_09?lang=3Den
> > you will see there are quite a lot of spec revisions and quite a few of
> > them are actually meaningful in the light of currently avaiable and
> > relevant HW we want to address. What I would like to avoid is to be
> > obliged to look at all of them in a generic manner while we just want to
> > address few cpu ref models.
> >=20
> > Also starting from the ARM spec rev baseline the end-user may need to
> > add more feature opt-ins to be close to a specific cpu model. So I
> > foresee extra complexity for the end-user.
>=20
> (Assuming I'm parsing your last para right; correct me if not.)
>=20
> Isn't a user wanting to add extra CPU flags (on top of a baseline) a
> "normal behaviour" and not "extra complexity"?  Besides coming close to
> a specific CPU model, there's the additional important use-case of CPU
> flags that provide security mitigation.
>=20
> Consider this:
>=20
> Say, there's a serious security issue in a released ARM CPU.  As part of
> the fix, two new CPU flags need to be exposed to the guest OS, call them
> "secflag1" and "secflag2".  Here, the user is configuring a baseline
> model + two extra CPU flags, not to get close to some other CPU model
> but to mitigate itself against a serious security flaw.

If there's such a security issue, that the hypervisor's job to do so,
not userspace. See what KVM does for CSV3, for example (and all the
rest of the side-channel stuff).

You can't rely on userspace for security, that'd be completely
ludicrous.

	M.

--=20
Without deviation from the norm, progress is not possible.
