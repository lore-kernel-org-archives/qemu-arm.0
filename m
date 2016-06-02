Received: by 10.25.27.66 with SMTP id b63csp917704lfb;
        Thu, 2 Jun 2016 14:07:14 -0700 (PDT)
X-Received: by 10.237.50.165 with SMTP id z34mr172044qtd.97.1464901634692;
        Thu, 02 Jun 2016 14:07:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i62si1508442qtd.83.2016.06.02.14.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 14:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Zpi-0006Qz-7G
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 17:07:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b8Zpe-0006Qa-04
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 17:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b8Zpc-0001J0-ON
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 17:07:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b8Zpc-0001It-IV; Thu, 02 Jun 2016 17:07:08 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACD8D128292;
	Thu,  2 Jun 2016 21:07:07 +0000 (UTC)
Received: from [10.3.116.150] (ovpn-116-150.phx2.redhat.com [10.3.116.150])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52L76c8027200; Thu, 2 Jun 2016 17:07:06 -0400
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
	<20160602145322.GG19055@thinpad.lan.raisama.net>
	<20160602183203.4814e984@nial.brq.redhat.com>
	<20160602165520.GH19055@thinpad.lan.raisama.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57509FFA.4060905@redhat.com>
Date: Thu, 2 Jun 2016 15:07:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160602165520.GH19055@thinpad.lan.raisama.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="k3LVEhlhjdoOq2hnr3ANIL20xKDm4IX5d"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 02 Jun 2016 21:07:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [libvirt] [PATCH] target-i386: Remove xlevel &
 hv-spinlocks option fixups
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
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
	libvir-list@redhat.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ety9ubmacroU

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k3LVEhlhjdoOq2hnr3ANIL20xKDm4IX5d
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/02/2016 10:55 AM, Eduardo Habkost wrote:
> The "fixup will be removed in future versions" warnings are
> present since QEMU 1.7.0, at least, so users should have fixed
> their scripts and configurations, already.
>=20
> In the case of libvirt users, libvirt doesn't use the "xlevel"
> option, and already rejects HyperV spinlock retry count < 0xFFF.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Igor, feel free to include this in the beginning of your series.
> I believe it will help making the patches simpler.
> ---
>  target-i386/cpu.c | 35 +----------------------------------
>  1 file changed, 1 insertion(+), 34 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--k3LVEhlhjdoOq2hnr3ANIL20xKDm4IX5d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXUJ/6AAoJEKeha0olJ0NqXQIH/1O8annhKSvEli/d6iVHQ/FC
fijPlZsIdImYA+W5fXurwFRFRSWXscSKPccnKXcSks4gEdPOsamLmkY6DrixBM+p
2it0IHBwtbmw2RZJUQSNmffEy7C+D7YH1YzsaRTrEj/Xy/PZ/iqZaqVxrqtRjF5H
Ubrerz5KlWmUQHDFa/+zfJsjJGWL1Sv0qSbaM0fHwyMhki46RwPqXbb05n28sZ+E
7rt4G5otQb3z4dcecUlliARZ+PKZ1hz+7mgJOvNKO9/tAKGrDzvwxpsP4vl/xA/u
qnf+/mFuXLs7pAgSB1ShUe+7fxkhMijT45WLGesw2/5RGMsYN00tf0txHnTE/Dg=
=Lvii
-----END PGP SIGNATURE-----

--k3LVEhlhjdoOq2hnr3ANIL20xKDm4IX5d--
