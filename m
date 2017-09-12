Received: by 10.223.172.38 with SMTP id v35csp7172007wrc;
        Tue, 12 Sep 2017 07:51:51 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDRYRwzWA+9SctuJ61koGkiW5Hw7ydh5WH1+SCmgRQmWhJPPQ/Je/5/fEusWprG/iZkeY3X
X-Received: by 10.200.8.143 with SMTP id v15mr20461391qth.314.1505227911106;
        Tue, 12 Sep 2017 07:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505227911; cv=none;
        d=google.com; s=arc-20160816;
        b=hJb80y+xZv0Jrn6F0tiaDAJizYWGUgtaxv4yllOCkpKydURoot7UNBw34l5riwbBMs
         fMosb3SxTlFwmGWW220Z1a6Kfz5CEHx3SZJQj9pFNZmEKif053KgHTPiMRmA1r/eemRg
         KyWYn34x9+ABjFQKEs4+lP3iKkJQLq3eek/s+OA3rbylyk/UTxuToxjLheB1GcpG4nXI
         bh4JoOggPcqRLaYe8rzA/zgr+nTxZytYHF1pdgwmUA25oI0o7iJBKrOSnfNj2kkl1bF9
         9wQ7rAXo2qa9/HjXkVbbfBxk6UITlX09cVmoGRkBJtEJXbLifl/kUyt9L7sA+djqLnB6
         3L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=55/1w0rizwpqmVZoJ3PCwmBtLfR+aK5al4vaaxcS4bU=;
        b=hxatgSJY4OcV+xTM9GasNFRGFmiZct09EVcu1S3HRAGSJAP86Z0JxQIiR7GXGNnEHh
         fB0YHkBHn1CJqBr2RrZxrE/WzCcYg8mGVYBrXB3BSAnGHRX486oSt5zsKhG84mkf62dW
         bNZLXI6trXxszRSV0UFc59FWcCIS+7JRAqxmzu8E2nAGfxU0Ey/Y/VXDTWw1xg9m/Nw0
         YIDofYg5PN4+WtaQ459Vr2/DRueBCS2QHQq3ZiJZ1eV0x+H18qHgt7B/1i9njHYDwixk
         KbLjYOkU54ZOV2BF84r3xeRIgF51vpb+HX67VZhq6eqjDt4iC3n1GYYGFngZh9+3Ait3
         Q5wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e27si12354448qkj.374.2017.09.12.07.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drmXU-00016N-MM
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:51:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmUe-00079w-FT
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drmUZ-0003fo-KI
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:48:52 -0400
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:58932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1drmUZ-0003fP-DF
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:48:47 -0400
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 641E59393F
	for <qemu-arm@nongnu.org>; Tue, 12 Sep 2017 16:48:44 +0200 (CEST)
Received: from bahia.lan (deibp9eh1--blueice1n3.emea.ibm.com [195.212.29.165])
	(Authenticated sender: groug@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 39F77260080;
	Tue, 12 Sep 2017 16:48:34 +0200 (CEST)
Date: Tue, 12 Sep 2017 16:48:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170912164832.35b68417@bahia.lan>
In-Reply-To: <20170912140149.7692-2-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/jqtcadcRQMkQGk4UPCRiE62";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17567416247460075814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.43.205
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
X-TUID: Sz/gO/tPbAQe

--Sig_/jqtcadcRQMkQGk4UPCRiE62
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Sep 2017 16:01:47 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Running QEMU with
>     qemu-system-ppc64 -M none -nographic -m 256
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

>  target/ppc/arch_dump.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 8e9397aa58..95b9ab6f29 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks)
>  {
> -    PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    PowerPCCPU *cpu;
> +    PowerPCCPUClass *pcc;
> +
> +    if (first_cpu =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    cpu =3D POWERPC_CPU(first_cpu);
> +    pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> =20
>      info->d_machine =3D PPC_ELF_MACHINE;
>      info->d_class =3D ELFCLASS;


--Sig_/jqtcadcRQMkQGk4UPCRiE62
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQr1DtEU17Ap5iU26IC/DrrAQHbwgUCWbfzwAAKCRAC/DrrAQHb
wqBwAJ90lFddadvGcupLE5e3kOQJWtFSSgCcDBbqQTejKNwuKBqZARHprZFNtbQ=
=I5w/
-----END PGP SIGNATURE-----

--Sig_/jqtcadcRQMkQGk4UPCRiE62--
