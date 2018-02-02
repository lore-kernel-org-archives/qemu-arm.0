Received: by 10.28.71.27 with SMTP id u27csp1098613wma;
        Fri, 2 Feb 2018 11:36:26 -0800 (PST)
X-Google-Smtp-Source: AH8x2272S7rupJCAJtP/2FITRGP/LQ/73cKTdkht+I71SnpsZmsQkDCuxTrwEX6wZintc82TevVW
X-Received: by 10.129.125.134 with SMTP id y128mr4958399ywc.146.1517600186524;
        Fri, 02 Feb 2018 11:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517600186; cv=none;
        d=google.com; s=arc-20160816;
        b=J9a66wQfBlYPrPf/04U0QUK6dJn9YYhnk13OzWYIl7Hc4O3Ul+h1DGnrLV1l3xc6OQ
         XtkkgXalZLJWuMDatTo/wOfATmaFeAk+joyz0Dhd3amkDSjXtcfSHF6v6XGQwriXt7QZ
         u5+MPujVEHyQ5RrLZ+uxOY1sYfEorOx7RgZpxkJWW8zVli2zKKP3hlFFM7z3qdihmtaW
         noeq70VpDthhjb6seHuSbQgfiupW91zJ2eoSY35K3BQtczMQYPJuR+LwyO2YZPrNpuUz
         EscGCtg5NLndKmPN+luuRUeBxi76fv53ZvXtXKUOfcxpezOLwEAidPnGrLoYOmJXEUpi
         0v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:arc-authentication-results;
        bh=FwfGyHfucW4zLIRgS2E6eDfh5zXUusAxX/bIAbIZ8WU=;
        b=etJqC4QiBIc1/j47ET+6tpErswS27l4NM5kEi4NxdB24adKoqvGlvTMJqk4nvhk357
         wKonHNrkLf2KGTat/xoK0Lq48WG4mZVx2RAhlMG/YPLnjw3tAQUAro4GdgikAeLSS1IX
         uxoBYBEsCSFB6ru/fNYUSab37Qx6wcGxHWIClb7FRSHyTULBS4GmOsI6kDnjro8RV023
         838UP3ECqOGdtIA8LXTS8aFqc7RLO+2WGbzf7MfYfNVuZaAsDT3wtSaHb/rPT3IUMSxW
         4cofy4d87GJExCvrI02gTpQC5h6THf0EtmxDMq0CalyB0cvWFY264aTx/HGJp67Eudl9
         W6QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c63si522530ybh.278.2018.02.02.11.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Feb 2018 11:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehh8L-00064z-Ti
	for alex.bennee@linaro.org; Fri, 02 Feb 2018 14:36:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ehh7x-00062x-Uh
	for qemu-devel@nongnu.org; Fri, 02 Feb 2018 14:36:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ehh7w-0006TE-RE
	for qemu-devel@nongnu.org; Fri, 02 Feb 2018 14:36:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ehh7r-00064v-7V; Fri, 02 Feb 2018 14:35:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 570245D68B;
	Fri,  2 Feb 2018 19:35:54 +0000 (UTC)
Received: from [10.10.120.51] (ovpn-120-51.rdu2.redhat.com [10.10.120.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B28F75521;
	Fri,  2 Feb 2018 19:35:53 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20180202183731.29990-1-armbru@redhat.com>
	<20180202183731.29990-3-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <11be568a-8c6d-3d45-8c32-dc41ea70c352@redhat.com>
Date: Fri, 2 Feb 2018 13:35:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180202183731.29990-3-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CGw1kQo0fq6QKF1oZjfwCzJcecJx55nuA"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 02 Feb 2018 19:35:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v7 02/15] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3QDmVgAGy8F

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CGw1kQo0fq6QKF1oZjfwCzJcecJx55nuA
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair.francis@xilinx.com
Message-ID: <11be568a-8c6d-3d45-8c32-dc41ea70c352@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v7 02/15] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
References: <20180202183731.29990-1-armbru@redhat.com>
 <20180202183731.29990-3-armbru@redhat.com>
In-Reply-To: <20180202183731.29990-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/02/2018 12:37 PM, Markus Armbruster wrote:
> From: Alistair Francis <alistair.francis@xilinx.com>
>=20
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then=

> compiler issues where manually fixed.
>=20

>=20
> Some lines where then manually tweaked to pass checkpatch.
>=20
> The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-arm@nongnu.org
>=20
> Conversions that aren't followed by exit() dropped, because they might
> be inappropriate.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/hw/arm/gumstix.c
> @@ -35,6 +35,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/hw.h"
>  #include "hw/arm/pxa.h"
>  #include "net/net.h"
> @@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
> =20
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      if (!dinfo && !qtest_enabled()) {
> -        fprintf(stderr, "A flash image must be given with the "
> -                "'pflash' parameter\n");
> +        error_report("A flash image must be given with the "
> +                     "'pflash' parameter");
>          exit(1);
>      }
> =20
> @@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
>                                 dinfo ? blk_by_legacy_dinfo(dinfo) : NU=
LL,
>                                 sector_len, connex_rom / sector_len,
>                                 2, 0, 0, 0, 0, be)) {
> -        fprintf(stderr, "qemu: Error registering flash memory.\n");
> +        error_report("Error registering flash memory.");

Do we care about consistency on trailing dots in these conversions?

At any rate, all of these are sane rewrites of existing patterns;
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--CGw1kQo0fq6QKF1oZjfwCzJcecJx55nuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlp0vZgACgkQp6FrSiUn
Q2rpOwf/dUEhAAL1i9cw+bW5Uj6njN4qg9Be9hbNIdmXIV6AQLQI1DKRZrjg9It3
isRCe4kOmCtUvCRoqiQvjBI/eRJLqoS+5RtPTyumuyVqOdzOfy+m5oO4ewBIOFd/
3JNT6fvlXj1BE81lfXuBHy57NUi4QFIhKuO/9Gzl6RZ4YHe+GgmMV7cotaaAj3i3
h9BFsS8Smd0aUBQmworWnmDhFkX73d0AhBkhCJJ6PIr+f+BPLLJ1p/hcXZwmP6o3
v1uxw7/lnqCzNEyQa7lzoq9YyyKxoplN1tH3ER6YuG7ezhBJz0ZhxhfcPi4yh6Hl
oiQDgAYeT5naBjD3Nc5UpQzjoooStA==
=9lWO
-----END PGP SIGNATURE-----

--CGw1kQo0fq6QKF1oZjfwCzJcecJx55nuA--
