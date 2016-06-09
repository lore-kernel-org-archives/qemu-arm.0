Received: by 10.25.27.66 with SMTP id b63csp486261lfb;
        Thu, 9 Jun 2016 12:40:18 -0700 (PDT)
X-Received: by 10.200.46.189 with SMTP id h58mr11734253qta.65.1465501218815;
        Thu, 09 Jun 2016 12:40:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si4232536qhk.124.2016.06.09.12.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 12:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB5oQ-0007uy-84
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 15:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bB5nq-0007Jv-K9
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 15:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bB5nk-0005nV-NV
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 15:39:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bB5nk-0005ms-Gp; Thu, 09 Jun 2016 15:39:36 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08C85C04D2AD;
	Thu,  9 Jun 2016 19:39:36 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59JdZ1w017739; Thu, 9 Jun 2016 15:39:35 -0400
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-2-git-send-email-imammedo@redhat.com>
	<20160609172900.GV18662@thinpad.lan.raisama.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5759C5F6.4020405@redhat.com>
Date: Thu, 9 Jun 2016 13:39:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160609172900.GV18662@thinpad.lan.raisama.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8WsL3jq1GORPOmgBVc140PfKIEoMd0RVG"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 09 Jun 2016 19:39:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] target-i386: cpu:
 consolidate calls of object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5uf6zPaaK6C

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8WsL3jq1GORPOmgBVc140PfKIEoMd0RVG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/09/2016 11:29 AM, Eduardo Habkost wrote:
> On Thu, Jun 09, 2016 at 07:10:58PM +0200, Igor Mammedov wrote:
> [...]
>> +
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>>      }
>=20
> error_propagate() already ignores local_err=3D=3DNULL so you don't
> need to check it first.

In fact, if the ONLY reason you are doing an 'if (local_err)'
conditional is to decide if an error was set, then you don't care about
the error locally, and could have passed errp instead of &local_err in
the first place.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8WsL3jq1GORPOmgBVc140PfKIEoMd0RVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXWcX2AAoJEKeha0olJ0Nqr8sH+wUrsy+YgzZ8ImQxyKsGns1U
GouVKlYvPi47st6PEbpKvuqlCY5ST8qdwqp+SBA1Kb5gXRoHF+jKVAgpa4ChgBRq
qKNQ9LCdhmbmjE/JV9VuhHR5WHWBH9ADpY40kw0D3D3Bohjs8b1CDfGqyYrsaORw
w99DC1JRqi35EQQKN0W+2CmVUgdet+BLusK9OoNi36vtrzPJ7wxlUmHzg9ryDoxZ
SDH4a35Hhr/Myz6V8vXhJ5CN4gw92MLtSsaeo2Eb4j0Y2gsC3f39LVlkR7vdDgDk
SwrLIwT+e+3F5Afdq1RhhgcB3huxGXfgQ292TLgzDLagUySUdY2HzsGGb/XcJAw=
=RGCb
-----END PGP SIGNATURE-----

--8WsL3jq1GORPOmgBVc140PfKIEoMd0RVG--
