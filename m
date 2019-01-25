Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp455643wrt;
        Fri, 25 Jan 2019 07:37:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6A3uzT5hcG6ejTbbH5/Qzo7OXeDGWItGlFBTU88svWvNitsfijG26dQ2E/S9G6v3+WqIyr
X-Received: by 2002:a1c:4301:: with SMTP id q1mr7279001wma.44.1548430667056;
        Fri, 25 Jan 2019 07:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548430667; cv=none;
        d=google.com; s=arc-20160816;
        b=Mg02Dzmx49sdHPBP7iQF2fn2Cvg4HkFdNiviHO2VXVcL24mFhcc7mXDj/iUb77jt+x
         dwhrhd92czsV62lsSzshisboHGHpKSePSyPqtwkHTx9Xv5bF+2p/NZlDsNJuf1AXJXIv
         P3EdKwyA0dd7g2v6UxOKC/jhGZ8BvvVNt7S0H2mAa/5kSC5VywobPyyeyogRcHlSKl3K
         Q75eJxKUTqh0ov5063m4hB22evcoPC0TxbCifoybGVJ2ZjoyXYhJuRYpbFTfK9ioQLBg
         mEJ3nVLy3BIz62vc75+/JRUowG97eY4nH45hKkwUUJT4Q/fnSOOB13aUv20Bd0ey8XPf
         6z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=wa6go2LP5UZvnk+/d3uW+VpjOMd/lS/hlGXZsk/CB4I=;
        b=O64RO9Q9xbOcPI8j7A29dWeC7doBY9G+k4yxvq+Gmga7X3IVATD3mKqZUjKdPg4ha/
         2Jgr4/29tMhSEdH+vJ5LM8dv3ByeDAdyHtD3a4zycnH0MqhZ4nUXiJUFtwYJYauBJy+n
         T8dK+j3zXaE+umfInSt2zVOEH/dO+CpDPI2LBi1o+LByi3wpJV+Pof58HEARHIQbE1w9
         DVIkT/I0t8frZgJ7cJUcDQ8uy+w8TF5FnYzs+hLjUjvezQAN1YOwbALLqb0p/OoNT3dC
         OnPfXsdLHe+MUvY4qsM/3MtAoJt0+cMH9a2eI7BiOiyqm1kOQy967f52aEzdOi3Xj1IL
         Di6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si35140162wrs.375.2019.01.25.07.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 07:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn3YA-0002aS-4V
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 10:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gn3Y0-0002Zv-SU
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 10:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gn3Y0-00056o-2u
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 10:37:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gn3Xy-0004s6-3c; Fri, 25 Jan 2019 10:37:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A54422DD2A;
	Fri, 25 Jan 2019 15:37:25 +0000 (UTC)
Received: from localhost (ovpn-117-242.ams2.redhat.com [10.36.117.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7BFD6E3F2;
	Fri, 25 Jan 2019 15:37:15 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:37:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190125153714.GB305@stefanha-x1.localdomain>
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-3-stefanha@redhat.com>
	<f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
	<20190125102842.GB28305@stefanha-x1.localdomain>
	<CAFEAcA-Dy0B-qCdojx9j49vF_p7OcAyQAiXYMv-_EZq7CCgT1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Dy0B-qCdojx9j49vF_p7OcAyQAiXYMv-_EZq7CCgT1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 25 Jan 2019 15:37:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device
 memory region
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Julia Suvorova <jusual@mail.ru>,
	Qemu-block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Jim Mussared <jim@groklearning.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWOTR0Nue6V8


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 10:36:17AM +0000, Peter Maydell wrote:
> On Fri, 25 Jan 2019 at 10:28, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Thu, Jan 24, 2019 at 12:11:55PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > > The device realize() is also executed before the guest is started, is
> > > this call really necessary?
> >
> > My rationale was that machine init only happens before the guest is
> > started while ->realize() is called by hotplug too.
>=20
> Yes, but before realize the flash memory can't actually be
> visible to the guest, so there's no need to invalidate anything.
>=20
> > That said, can pflash devices be hotplugged?
>=20
> I guess you could have one inside a hotplugged device in theory;
> they can't be directly hotpluggged. (I bet that in practice
> there are leaks though if you did do that, and we don't have
> any devices that do so today.)
>=20
> > If you guys prefer not flushing from pflash ->realize() then I'll drop
> > it.
>=20
> I think it makes more sense not to do a flush in the realize method.

Okay, I'll resend this patch.

Stefan

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcSy0qAAoJEJykq7OBq3PIKz8H/jOHIMRSb+Nz1Hy0qxPEA8Wu
qg338TxsVVQgKLvcr6kMCDuV8MaCHrT29cODfBWocjAqyCR98ReizZfiennDvgjQ
6ovAbvJPHPo+I4vNoNdxvtJJsyYYDJbkvk0c1dqPR1Cyb2S3ZitUBi4QVwcE9A9Z
RqaYfvjOTHQxFTN0QWotTsiu9SyRpIblj0SdhyvTkhUlA3rYt42XnnGem3tV1BDL
iTQ6OcD8kseUFLI3fJtlsDLstZGTZOoGB7//dz9RWHYDpWHVT289g7Lr7F+C2cPh
UxuHOcxggGcJir1oF/Ay72N+nr1Co/h2JwTCeEaWrHnnJaOCnRaDLWM8/7aVLAo=
=mBGV
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
