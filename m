Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp888522pjq;
        Fri, 31 May 2019 09:47:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4GzwI8RZ7m+O9vSz5wuZFaZ9fFEewgb0bEx5RlvjRGxMDB1Oq7pvr0Xc6PcIge/8vYKXW
X-Received: by 2002:aca:47d5:: with SMTP id u204mr6388876oia.83.1559321249976;
        Fri, 31 May 2019 09:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559321249; cv=none;
        d=google.com; s=arc-20160816;
        b=clSc3+1+c8YRspl2sPK8cOvZhDyMDDS2qmQ4L7JNuP23a+K40ETV2G6ClpW7WVV34L
         mKd9YY7ldLtopcfuG7JX9IBat/8i1CiV8iGKUr3PE+pvq+zUjByNDMuxyOHODibbPF7u
         O1FhhTM8QGQoHjT0x5oH2dElT+WSftTvzlbD0MqnzeOIFvbiEiDFpFSIfXr0IPSEwzQo
         136HkT7DMKsYsJqNpIvgyrsD/Vt89cztkg7j5k490/0ZvCz+zkdaCF6uYl/kL9dnax8x
         kuCUB4hWDPNhCtxRm3S4akwwg9HBNi4hTol43J3RZMQ98KiYBAf2A9ufb40B25fzxIpd
         7ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date;
        bh=TjcPmDe3Vb/1PaI2QVSsOWw6zHO6bB9huEHctAr1Dac=;
        b=SqWtYKF+yxOagvKXkd5KtY2RZjO6hmZUPCCB9+Nfrv3tbxzp1xz3hh/JyB6dgLunbB
         o6/8BI0ydzZ3vi6EEPfzoBUE/8gnhePWpVvIeOVfqNeUG1qo+7WlBpGma9JCya3g6a84
         KvGgV+3UH1cpCr87svwITEKH1iiuiBvkbLPvbwYkUscYStY6oY8XFILgz1jI9c1SwqYz
         XlAroZtDVgNZAFLtLkLeVVZnJ+agdEfHUqLjFUoMDm6FibpjZAxelDdRP51O6VqoaEeI
         v9OCK3vDeu4D8gk5BMNLP0PSZ/rt5IOwXYkx2FFKIRqOqTZfVzjjmlKai36QqcqG54gG
         8ThQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mrezanin@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i16si3622973otk.239.2019.05.31.09.47.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 09:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F8E2309C001;
	Fri, 31 May 2019 16:47:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5B1D7E905;
	Fri, 31 May 2019 16:47:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A7B518363C0;
	Fri, 31 May 2019 16:47:22 +0000 (UTC)
Date: Fri, 31 May 2019 12:47:18 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>
Message-ID: <1635661039.25604600.1559321238712.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA9UGSM_eNFErNHtx4vqosgTyPJ85mQ2t=QnnkpnGN7rDg@mail.gmail.com>
References: <20190514155301.16123-1-alex.bennee@linaro.org> <20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com> <87sgsu51bd.fsf@zen.linaroharston> <833530119.25503992.1559302089822.JavaMail.zimbra@redhat.com> <874l5aahmx.fsf@zen.linaroharston> <627031963.25549126.1559311169316.JavaMail.zimbra@redhat.com> <87o93i8zrh.fsf@zen.linaroharston> <CAFEAcA9UGSM_eNFErNHtx4vqosgTyPJ85mQ2t=QnnkpnGN7rDg@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.40.204.19, 10.4.195.14]
Thread-Topic: target/arm: use the common interface for WRITE0/WRITEC in arm-semi
Thread-Index: Okq1lp6pyXAlhtQxliyHe5IuBhqJCA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 31 May 2019 16:47:24 +0000 (UTC)
X-TUID: o1SHdBCF5CM/



----- Original Message -----
> From: "Peter Maydell" <peter.maydell@linaro.org>
> To: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Miroslav Rezanina" <mrezanin@redhat.com>, "QEMU Developers" <qemu-de=
vel@nongnu.org>, "Riku Voipio"
> <riku.voipio@iki.fi>, "qemu-arm" <qemu-arm@nongnu.org>, "Laurent Vivier" =
<laurent@vivier.eu>
> Sent: Friday, May 31, 2019 4:38:04 PM
> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common in=
terface for WRITE0/WRITEC in arm-semi
>=20
> On Fri, 31 May 2019 at 15:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> > Miroslav Rezanina <mrezanin@redhat.com> writes:
> > >From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> > >> OK - so from the upstream source tree CONFIG_SEMIHOSTING is still =
=3Dy
> > >> (but I can see most of them are now =3Dn). Isn't the simplest soluti=
on to
> > >> fix-up your version of the default_config file to include SEMIHOSTIN=
G?
> > >>
> > >
> > > It's fix but it goes against our policy of handling CONFIG options so=
 we
> > > would prefer to have this fixed - otherwise there's no meaning in hav=
ing
> > > config option if you can't disable it.
> >
> > Is that what it means? For my part it means we don't build in
> > CONFIG_SEMIHOSTING for the arches that don't need it (which we were
> > before). Granted it only really simplified the vl.c parsing and dropped
> > support for semihosting for the linux-user targets (except ARM).
>=20
> Yes, that would be my interpretation of it. If we had
> a 'config FOO' stanza for CPUs, then Arm CPUs would
> "select SEMIHOSTING". If RedHat would like it to be possible
> to build Arm CPUs without CONFIG_SEMIHOSTING then they're
> free to submit patches for that, but that's a new feature
> upstream doesn't currently support, not a bug in upstream.
> (Also I'd be a bit dubious because it means that previously working
> guest setups that use semihosting will break.)

I partially agree here - I see difference between disabling
config and omitting it. We are not not disabling CONFIG_SEMIHOSTING,
we just ignore it. So we got error because it is not properly handled.
Proper handling should be either auto-include it as dependency or
successful build with option disabled.

As there's currently no way to auto-include it through dependency,
it would be good to have comment in default_config file next to it stating
that it's required option. This will allow us to see it and
add to our default_config we used instead upstream one.

Mirek
>=20
> PS: if we had a 'config FOO' stanza for CPUs that would also
> allow us to say "building Arm CPUs requires the NVIC" and
> similarly for things which in QEMU are devices but which are
> architecturally tightly-coupled non-optional parts of the CPU.
>=20
> thanks
> -- PMM
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer
