Received: by 10.223.172.38 with SMTP id v35csp7177049wrc;
        Tue, 12 Sep 2017 07:55:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCB9aJ2LN4oVMeStWyY1XF53/Fh2nPI1sNnoSgPZorv6IzF1rCVRQlSRxbPvVbdSL8ACfCH
X-Received: by 10.233.230.1 with SMTP id z1mr15271367qkf.22.1505228145579;
        Tue, 12 Sep 2017 07:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505228145; cv=none;
        d=google.com; s=arc-20160816;
        b=tESfVJVzq0in2+dvryNjhmpouypx2iJPtUSUxmgqQ+5FAkaw4F5ijcN+hKRuHJLZot
         C36EQB49qLYJI2pp8wUsA/x9HfDmkBeyYJbD9VoWUBnaZTET5oijFhKy1zSLZb9fJdxF
         V24ASpuTOWxHYcVn4Fu3p7aQWZ8tOweYbfuk97Wuk/FaDWz26wmAh5fMbBeU3+4dYAbt
         quQiGCjffHjiYPJsndBoepLaZOXEn0eJP1KkZBlZwj7piI4lWKuIAjGieXuAwZmOaX9K
         ujQFADWAIBRmdG9tx6UHPnE2gOsorrABehRb5fbX5CfK5k0cEWi9+D97IyuxqDw2heCl
         +SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=jAqyOSQqMgHp/FBs4/c8ixOa1+ssanQlWFQ7AxsZHuM=;
        b=r7Kh3Druo3MHkMXmgK6ODs9rxGKwtT8/TqPtyOnB9UkBUor+QkiAOFNNZ6es8FPmM/
         vKG8kETXmVLxfTbFqYGeb0SeXm+Dr5RcfN+nvV6WtIELx76k0E2d9rr4fWcIvx+g6tCc
         7BG7ErXkL6ZN5S/Q9Av1qcw+jzDyNS5zl2Y3wkD+Bzy/fKrRjZzpjEz4h1nMe6ucINWV
         ZbRKXvxTjd/A6+vWcoDC6x8zJNaQVEdLvmR4LQe2q15wzhI7erYE7R8yCPPaGgIY70Le
         mB8fFa8TSMJ3bMsJ68SkEd8EDrOsdw+SxCvWMt6lfbsEImQFaDqRiGPQMPRU9ynLEStN
         sJKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a47si2187022qte.86.2017.09.12.07.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drmbH-0004Qm-Ah
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:55:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmWW-0000UQ-Nl
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmWR-0004Zs-Q9
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:50:48 -0400
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:42394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1drmWR-0004Xt-2C
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:50:43 -0400
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 896D48C1E8
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 16:50:41 +0200 (CEST)
Received: from bahia.lan (deibp9eh1--blueice1n3.emea.ibm.com [195.212.29.165])
	(Authenticated sender: groug@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id CA3A526007F;
	Tue, 12 Sep 2017 16:50:31 +0200 (CEST)
Date: Tue, 12 Sep 2017 16:50:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170912165028.11ab5489@bahia.lan>
In-Reply-To: <20170912140149.7692-3-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-3-lvivier@redhat.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/YIvikDq8zcY.vXy0KTjgMs/";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17600348819179870502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.38.232
Subject: Re: [Qemu-arm] [PATCH v3 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/wGdtQyu691

--Sig_/YIvikDq8zcY.vXy0KTjgMs/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Sep 2017 16:01:48 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Running QEMU with
>     qemu-system-aarch64 -M none -nographic -m 256
> and executing
>     dump-guest-memory /dev/null 0 8192
> results in segfault
>=20
> Fix by checking if we have CPU, and exit with
> error if there is no CPU:
>=20
>     (qemu) dump-guest-memory /dev/null
>     this feature or command is not currently supported
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/arm/arch_dump.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 1a9861f69b..9e5b2fb31c 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -273,11 +273,18 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction =
f, CPUState *cs,
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const GuestPhysBlockList *guest_phys_blocks)
>  {
> -    ARMCPU *cpu =3D ARM_CPU(first_cpu);
> -    CPUARMState *env =3D &cpu->env;
> +    ARMCPU *cpu;
> +    CPUARMState *env;
>      GuestPhysBlock *block;
>      hwaddr lowest_addr =3D ULLONG_MAX;
> =20
> +    if (first_cpu =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    cpu =3D ARM_CPU(first_cpu);
> +    env =3D &cpu->env;
> +
>      /* Take a best guess at the phys_base. If we get it wrong then crash
>       * will need '--machdep phys_offset=3D<phys-offset>' added to its co=
mmand
>       * line, which isn't any worse than assuming we can use zero, but be=
ing


--Sig_/YIvikDq8zcY.vXy0KTjgMs/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQr1DtEU17Ap5iU26IC/DrrAQHbwgUCWbf0NAAKCRAC/DrrAQHb
wvwVAKCisrHB4G8tqrBeOEOPkbKZ9SJm6ACgp5XA/YUNgvi4CHc/X5FTe3KwHMM=
=nu4D
-----END PGP SIGNATURE-----

--Sig_/YIvikDq8zcY.vXy0KTjgMs/--
