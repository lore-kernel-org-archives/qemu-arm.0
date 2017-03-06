Received: by 10.25.0.147 with SMTP id 141csp1459864lfa;
        Mon, 6 Mar 2017 08:55:27 -0800 (PST)
X-Received: by 10.55.186.67 with SMTP id k64mr16434468qkf.232.1488819327803;
        Mon, 06 Mar 2017 08:55:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si15887925qtc.42.2017.03.06.08.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 08:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckvuv-0006xB-6F
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 11:55:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ckvuq-0006x2-2d
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 11:55:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ckvum-0003QR-5x
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 11:55:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ckvul-0003Q6-TN; Mon, 06 Mar 2017 11:55:16 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD86261BA5;
	Mon,  6 Mar 2017 16:55:15 +0000 (UTC)
Received: from [10.10.124.84] (ovpn-124-84.rdu2.redhat.com [10.10.124.84] (may
	be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v26GtEGv025382; Mon, 6 Mar 2017 11:55:14 -0500
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170305214857.9510-1-krzk@kernel.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f441f1d9-b312-5f96-0fbf-53a46a8b16a8@redhat.com>
Date: Mon, 6 Mar 2017 10:55:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170305214857.9510-1-krzk@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XduqJM5unoi09FuBBwo3kCEsnQkTOEsv5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 06 Mar 2017 16:55:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/exynos: Convert
 fprintf to error_report()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tp/8yEe/YBuk

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XduqJM5unoi09FuBBwo3kCEsnQkTOEsv5
Content-Type: multipart/mixed; boundary="d002ScOsEhlvBQhjauPGElBlx2b9VvrxU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Message-ID: <f441f1d9-b312-5f96-0fbf-53a46a8b16a8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] hw/arm/exynos: Convert fprintf to
 error_report()
References: <20170305214857.9510-1-krzk@kernel.org>
In-Reply-To: <20170305214857.9510-1-krzk@kernel.org>

--d002ScOsEhlvBQhjauPGElBlx2b9VvrxU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/05/2017 03:48 PM, Krzysztof Kozlowski wrote:
> error_report() is preferred over fprintf() for logging errors.  Also
> remove square brackets [] and additional new line characters in printed=

> messages.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

I don't see a 0/3 cover letter. When sending multiple patches, it's
always best to package them in-reply-to the cover letter ('git config
format.coverLetter auto' makes it easy to remember).


> @@ -101,9 +102,8 @@ static Exynos4210State *exynos4_boards_init_common(=
MachineState *machine,
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> =20
>      if (smp_cpus !=3D EXYNOS4210_NCPUS && !qtest_enabled()) {
> -        fprintf(stderr, "%s board supports only %d CPU cores. Ignoring=
 smp_cpus"
> -                " value.\n",
> -                mc->name, EXYNOS4210_NCPUS);
> +        error_report("%s board supports only %d CPU cores. Ignoring sm=
p_cpus value.",

Most uses of error_report() avoid trailing dot.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--d002ScOsEhlvBQhjauPGElBlx2b9VvrxU--

--XduqJM5unoi09FuBBwo3kCEsnQkTOEsv5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYvZRwAAoJEKeha0olJ0Nqke8H/0d9WaPKCNPvEmj8RA2a6G+c
a+6QIct0bZjKggUu3P2YuLgBUdj7wOKBWwpCvTHTfSaQt6JXgvfxeMLymHO4vIfp
gnV4xc2K8LhR9/oFSUb8WFhveovCsIyfR/GL5ZXS8Mj6in0ZssLjcbDDNm0WfBju
Th2qBQrMm42yUJd/mwZMIt43oHg/5e+Bj53eSvbGLbiK6hKNYFv4wDfcpWpQRJF6
VTEp8QncjiX1SjS3aSNlKZ6TikBvNOOgmOJQX9Kpx7y0AZ7zXFX2ZA94i3tRIDPp
JtFoQzmByDxgYUD2NYButzPXxYsFWTYT7/wjuOSJlNPrwk8Rukw2SBrEUi3fKMY=
=aSXV
-----END PGP SIGNATURE-----

--XduqJM5unoi09FuBBwo3kCEsnQkTOEsv5--
