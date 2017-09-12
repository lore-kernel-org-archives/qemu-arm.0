Received: by 10.223.172.38 with SMTP id v35csp7172897wrc;
        Tue, 12 Sep 2017 07:52:31 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCL3GM0PpICsezUTEGZFNOujGmwOaTqtb5enlfnAi+7K5JSFMzjRBdj+6fHvvjW7bbnzHOU
X-Received: by 10.237.63.153 with SMTP id s25mr20937541qth.134.1505227950977;
        Tue, 12 Sep 2017 07:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505227950; cv=none;
        d=google.com; s=arc-20160816;
        b=li6Qe8CZM7bA/agO7kNpgWUhezxtYzRwUzmBndwNWoMGEYXetxAR/WMQF3jSsCmXq6
         KauGGIVpYhBOzEMgtLpwrLysEpTftDuLvibAhY6q/fP5PEtXgUWhFfXHMnFylUxX3wcm
         84oVSJeIKne3X5U2oAc2VX084MCw1nhHaY4ypeGkPA8N95NCWIWVnzOINzMdkt4rnk6R
         5Uq1HsfcBTtw+T1wVVeacFlSvFuKz+4xo9RQ61oU/2m0mqtq8jBnm7Y3UxqF4eDPfhpV
         MwAnyDIAL1q8bGGZlOsVyk5jLNa+qM6T3x6BDQFvIZKMVwkSNQwXHXE4CXCvpaTdDbXn
         ZTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=pYyBgysbdRGyDIvYRti2jal92DACXUGqGEj/HfcLaek=;
        b=Y9TsNeXPXIlimm91dn6tg2ZqZRDz19dIDLW0T9mH6/MbM23QcJvkT90vFMgHYdCiCd
         9PoEYBtjJSwlIx9owLw/c+0yPhlysqnZzGCCmHpZkdslLq2dFUllRZsp/D52DWnh9bgX
         TnfRVTv2eo0DH03c7JF+vqlJUjwVakELpFoDMi6Jji1OMT1PfFMshPz7AxIZn3Ut33ik
         LmMogWLLGIuBWSWlqvNlQ4OO3URNaCBKmV0pRdaUhVNmnkqE1p0CAWZnLuNWkUvBvOpV
         7bmMSV23saLnqFz/hQ85rL8o1yPqhUheLTTrgMx8ictoEA9LIdVV/H2eP1E6QIxV1v4Y
         3rhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k68si12205332qkl.212.2017.09.12.07.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drmY8-0001kD-Kb
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:52:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmT3-0005YU-IH
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmSy-0002xj-MX
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:47:13 -0400
Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72]:58451)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1drmSy-0002tA-Gb
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:47:08 -0400
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id F390193796
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 16:47:05 +0200 (CEST)
Received: from bahia.lan (deibp9eh1--blueice1n3.emea.ibm.com [195.212.29.165])
	(Authenticated sender: groug@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id BA8FA260094;
	Tue, 12 Sep 2017 16:46:49 +0200 (CEST)
Date: Tue, 12 Sep 2017 16:46:44 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170912164644.2a0b6977@bahia.lan>
In-Reply-To: <20170912140149.7692-1-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/i.ApcJMV0GdXfvlPdJ1DGjK";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17539550224604305702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.35.72
Subject: Re: [Qemu-arm] [PATCH v3 0/3] hmp: fix "dump-quest-memory" segfault
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	dgilbert@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZGDCdUCvOPW

--Sig_/i.ApcJMV0GdXfvlPdJ1DGjK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Sep 2017 16:01:46 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Fix aarch64 and ppc when dump-guest-memory is
> used with none machine type and no CPU.
>=20
> The other machine types don't have the problem.
>=20
> Update test-hmp, to test none machine type
> with (2 MB) and without memory, and add a test
> to test dump-quest-memory without filter parameters
> (it needs the fix from Cornelia Huck to work)
>=20
> v3:
>   - remove blank line after a comment
>   - forbid memory dump when there is no CPU
>=20

So in the end, we would forbid dump on aarch64 and
ppc, while it is allowed on i386... I don't really
care about which behavior is more appropriate but
I guess they should be consistent at least.

Cc'ing some x86 and HMP people.

> v2:
>   - add arm fix
>   - update test-hmp
>=20
> Laurent Vivier (3):
>   hmp: fix "dump-quest-memory" segfault (ppc)
>   hmp: fix "dump-quest-memory" segfault (arm)
>   tests/hmp: test "none" machine with memory
>=20
>  target/arm/arch_dump.c | 11 +++++++++--
>  target/ppc/arch_dump.c | 11 +++++++++--
>  tests/test-hmp.c       |  4 ++++
>  3 files changed, 22 insertions(+), 4 deletions(-)
>=20


--Sig_/i.ApcJMV0GdXfvlPdJ1DGjK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQr1DtEU17Ap5iU26IC/DrrAQHbwgUCWbfzVQAKCRAC/DrrAQHb
wsbCAJ0Qtc/uTwfheyO5xyrUL30XOwEmvgCghh8Pc0TnfWH2C64EDkHscryirA0=
=C7p7
-----END PGP SIGNATURE-----

--Sig_/i.ApcJMV0GdXfvlPdJ1DGjK--
