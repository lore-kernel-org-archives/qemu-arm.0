Received: by 10.25.21.96 with SMTP id l93csp303601lfi;
        Fri, 1 Jul 2016 06:49:51 -0700 (PDT)
X-Received: by 10.200.38.120 with SMTP id v53mr32756218qtv.90.1467380991502;
        Fri, 01 Jul 2016 06:49:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n185si2407178qkd.242.2016.07.01.06.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 06:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIypK-0000S0-VG
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 09:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bIypI-0000Rk-32
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bIypE-0008A5-AF
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 09:49:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bIypE-00088w-1l; Fri, 01 Jul 2016 09:49:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C146C0624B0;
	Fri,  1 Jul 2016 13:49:41 +0000 (UTC)
Received: from [10.3.116.56] (ovpn-116-56.phx2.redhat.com [10.3.116.56])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u61Dnc8Z025831; Fri, 1 Jul 2016 09:49:39 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <577674F2.8000409@redhat.com>
Date: Fri, 1 Jul 2016 07:49:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="evTGCKf964JCvWQxnOXWp8Qw6MpAj3qVJ"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 01 Jul 2016 13:49:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.7] aux: Rename aux.[ch] to auxbus.[ch]
 for the benefit of Windows
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <fred.konrad@greensocs.com>,
	=?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JrRg9GA0LPQsNC9?= <akurgan@yandex.ru>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7JDSbYIch4n

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--evTGCKf964JCvWQxnOXWp8Qw6MpAj3qVJ
Content-Type: multipart/mixed; boundary="OwUBHG2nJkSLnE6BDNsv4wWTA4pGFeOvO"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JrRg9GA0LPQsNC9?=
 <akurgan@yandex.ru>, KONRAD Frederic <fred.konrad@greensocs.com>,
 Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <577674F2.8000409@redhat.com>
Subject: Re: [PATCH for-2.7] aux: Rename aux.[ch] to auxbus.[ch] for the
 benefit of Windows
References: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1467377145-32385-1-git-send-email-peter.maydell@linaro.org>

--OwUBHG2nJkSLnE6BDNsv4wWTA4pGFeOvO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/01/2016 06:45 AM, Peter Maydell wrote:
> On Windows 'aux.*' is a reserved name and cannot be used for
> filenames; see
>   https://msdn.microsoft.com/en-gb/library/windows/desktop/aa365247(v=3D=
vs.85).aspx
>=20
> This prevents cloning the QEMU git repo on Windows:
>=20
> C:\Java\sources\kvm> git clone https://github.com/qemu/qemu.git
> Cloning into 'qemu'...
> remote: Counting objects: 279563, done.
> remote: Total 279563 (delta 0), reused 0 (delta 0), pack-reused 279563R=

> Receiving objects: 100% (279563/279563), 122.45 MiB | 3.52 MiB/s, done.=

> Resolving deltas: 100% (221942/221942), done.
> Checking connectivity... done.
> error: unable to create file hw/misc/aux.c (No such file or directory)
> error: unable to create file include/hw/misc/aux.h (No such file or dir=
ectory)
> Checking out files: 100% (4795/4795), done.
> fatal: unable to checkout working tree
> warning: Clone succeeded, but checkout failed.
> You can inspect what was checked out with 'git status'
> and retry the checkout with 'git checkout -f HEAD'
>=20
> (bug https://bugs.launchpad.net/bugs/1595240)
>=20
> Rename the offending files for the benefit of Windows.
>=20
> Reported-by: =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =D0=9A=D1=83=D1=
=80=D0=B3=D0=B0=D0=BD <akurgan@yandex.ru>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--OwUBHG2nJkSLnE6BDNsv4wWTA4pGFeOvO--

--evTGCKf964JCvWQxnOXWp8Qw6MpAj3qVJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXdnTyAAoJEKeha0olJ0Nqj20IAI7VYow/IQ0CeBUpbif4eW49
3VN9IEoMUnAAsPVlBscrbXmGF3U2trgjYYxAVXDhPfNs0HL+lxPQFFxGXFpxHJAq
o3GgDaTdMtZgPF7C1cu4g39RkqMu7ohhuKkBK487w34RTiJssnq9eahXbI6NcLpz
oZgxB6lGai+wOTXOMAvTW6X7FMNFHlpTu4cNqG1wQGFqVqOFPY0ERdeV0tUkj2x4
SVUls5Qt7Th/phmb2XL1qipZdvoxN757NSr40wstekwmEHe4fF/8MvnezVbyglQz
DDaGrxdZ4DaPlO2kcUbK1H4lsvB1+Ke1RE7oM7hogcPhNqNvF8RhRa0bq9BZWnU=
=kq1w
-----END PGP SIGNATURE-----

--evTGCKf964JCvWQxnOXWp8Qw6MpAj3qVJ--
