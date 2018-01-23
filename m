Received: by 10.28.71.27 with SMTP id u27csp3921290wma;
        Tue, 23 Jan 2018 03:15:52 -0800 (PST)
X-Google-Smtp-Source: AH8x225G04HKK3AYW3xG7ytfCpVWX5gbp3WcH4lvMahD+LtQR3R8dSMv1j6rBRhKkLuSMvSfEShn
X-Received: by 10.37.187.14 with SMTP id z14mr1989986ybg.486.1516706152460;
        Tue, 23 Jan 2018 03:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516706152; cv=none;
        d=google.com; s=arc-20160816;
        b=fXJJEQFuiRnSRrR8eKvt1av4lBP+VXxeIMIlfCsNXydusfYW/tKeYcjECHg+WH3pAj
         KYWXJZCMXxZNfy/66GbKt8wXIXLv/eaBbt6BaihtBn+PrlOR0Ba6qcInZ/7z8qV0YG89
         NQGY5dJ3mbjiiTFmyF0tDGyxtIikd3HUiaArGjQY7IlGNuc/pUQHMbRRtgk9ADX6YZO3
         bil4NUuzhajhyJ+pfDFHPSnR7CE7B3Glniov4jog/18DK07VrvpMmB3d5uQCsEphq/em
         xMK2kQFSrUvo+jU/1cn2EEHn9T368eiZe4Q7pfT6eEsSlT2pqPz8er8nC386ODNmEbzW
         XQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=+PSUibgA1IDNMMn/aMqIy6lYs3VlfahZ/mL0ec6hOUI=;
        b=Mku5BxElkwKTQWKDJWaGPk9VUFXCjabJzfCXxyYD7HBHRHVKNNhVyDltBFlK0zXE9N
         sIK2xguhePP2jkESWLVYrDsur16sRs+NMLLscBprsKlEr8BJnTm4PqvzNfWZUEjWxxoV
         PFqs3FrMOFV2O3BXzfbFItu+G3YDocPxd+EKhkG82xmjOaJEKM4zaKyjzNr7gl0hoUf4
         nb3YqYCImcsMUy7LGVkbd8V5nMx3dW9qP3kdFRvuv7ARCgwIhmxT5waCMymTAdhkkOBa
         ebIC2uUPX6a5JnwX09kF537eV4pD21y+h/fYfyzuuCVmXRDgcN/XGupUmxixvKNefBvk
         W+SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QIOPr9Ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p202si872680ybc.710.2018.01.23.03.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 03:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=QIOPr9Ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edwYR-0004Zv-R0
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 06:15:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1edwYC-0004Y2-2I
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:15:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1edwY7-0005X2-2h
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:15:36 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:59235)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1edwY6-0005WC-DB; Tue, 23 Jan 2018 06:15:31 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3zQm1W0lZ3z9sRm; Tue, 23 Jan 2018 22:15:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1516706127;
	bh=iOXgFEJO5pAGoUM9b+/7kx1S2b6lYhOqKxzAXwxMORM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIOPr9NypBXUcd5fb4ZeLax1sbcYjuMhqfcD37ua2M8ghdveGrRhUHFlVDEYZmoRz
	YSyZfERQBgFOyRjRQkyrRHhb6EVLX+8KyU4rtieMqjQHXIMG6zASjSuYMpP/WR1655
	ji54TX3KDalglysqXorSxl9ZjLG34xy7CDnSpXYU=
Date: Tue, 23 Jan 2018 22:14:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180123111455.GG11419@umbus>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-15-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline
In-Reply-To: <1516694904-64879-15-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v3 14/25] ppc: cpu: add CPU_RESOLVING_TYPE
 macro
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
Cc: Alexander Graf <agraf@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KO3L/UWdwg10


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2018 at 09:08:13AM +0100, Igor Mammedov wrote:
> it will be used for providing to cpu name resolving class for
> parsing cpu model for system and user emulation code.
>=20
> Along with change add target to null-machine test, so
> that when switch to CPU_RESOLVING_TYPE happens,
> test would ensure that null-mchine usecase still works.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> CC: Laurent Vivier <laurent@vivier.eu>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Alexander Graf <agraf@suse.de>
> CC: qemu-ppc@nongnu.org
> ---
>  target/ppc/cpu.h          | 1 +
>  tests/machine-none-test.c | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 603a38c..d5f2f3d 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1380,6 +1380,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, ui=
nt32_t val);
> =20
>  #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
>  #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
> +#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
> =20
>  #define cpu_signal_handler cpu_ppc_signal_handler
>  #define cpu_list ppc_cpu_list
> diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
> index 160aa13..052b8c0 100644
> --- a/tests/machine-none-test.c
> +++ b/tests/machine-none-test.c
> @@ -41,6 +41,9 @@ static struct arch2cpu cpus_map[] =3D {
>      { "moxie", "MoxieLite" },
>      { "nios2", "FIXME" },
>      { "or1k", "or1200" },
> +    { "ppc", "604" },
> +    { "ppc64", "power8e_v2.1" },
> +    { "ppcemb", "440epb" },
>  };
> =20
>  static const char *get_cpu_model_by_arch(const char *arch)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpnGSwACgkQbDjKyiDZ
s5JRLhAAxEVU/ehkcA7Z6vjLebfc2d57XtHdlrp+gRcpcoEtDxKhYDKocJlU0HDL
FbAujmeQjQoZJwC3X51y/eSRAUo0JliTl8JnACyVRQBK85geYxIqxZZWcJo4MOmX
Dl2JgYWnfVJ91VrKDDqsdcaI8VpRn+9VdSNeBN4hDU/2MjET9XUrIG0/+Y/3Pemw
uBoRT4jxb+w+sW7Q/46erYE2GRUEJD7aBLufaAy3pFp8P9lEjN9CIVNrah4A/zSi
RCv3BVKCJKb5BKulfReQor+okW0Py8NrYebBoBTygMAoyIHre5yU+mVGLJghh/ZQ
7wvu86AHRmJc8ui9eirsV63CkhBcx6dOwmTfnkKtIsnz8TungZGN29AqtYlCpWap
Ybdgj1z2PuCHt+jdgrGS7rOLZHdiS5hO9atAASBuq9CETMuK4XPwVSmPSTP/YkQD
0ZZNETb3l01xk7ziIdUAncICG2p/39pUE0PIkrxyO9Qbvt14xuLDLWgB7VIQnbph
tDc4EcgBrKvCIQjouOt4tIp+30YDztDGRVQOhq2OCmvXDuved7QPmXkG7bW+2cRU
k/X6uKSOE7AQkjEnMHjQ2AWCIJuB+4n8vTZxTljG53awoK/fZATxp2wPAXJDHnsd
Jwt4B9xMAlN++exkv3jLHAZL4p2zBBRee69y1YwrEZoSL1LS33I=
=BbwF
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
