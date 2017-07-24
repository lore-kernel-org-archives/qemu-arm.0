Received: by 10.25.44.15 with SMTP id s15csp4351081lfs;
        Mon, 24 Jul 2017 14:57:38 -0700 (PDT)
X-Received: by 10.200.56.104 with SMTP id r37mr4001422qtb.129.1500933458121;
        Mon, 24 Jul 2017 14:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500933458; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2h/9t0o0O2SAZo57Vm2CIFkIghrGCtxAuE0ThtkE7IfeXv/uHGdaRxTldIKa6K1RF
         jlbYoLQlW2HrHwvWzSKjQjDdOcJWZaaC+OrOYRRdHX7gvNKb1CBj6bj9wXrVl0jnnz49
         sIvbJC3zjiQ6LZyGdI32kkmAa7qjLxRfkUoqOUups6t/5kE9EfyUFHLsTdesipDhkK6o
         P9LG8glT/KNObMe5cHAYL1CFjGsEFOTpXdcLAdwrTeZQKED47Id00Yu+OW8pM6UwQaIR
         7d8+xq6jwRbL3/sq9fNzHnupT05KIl8dkiCOR5WM3Shd3TA/0k1oa56Xhq4n9VZ2vAnq
         ikGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=n9Ds+e7tyMPSPXJaP2xD4ZS6/NPASdyNDfrEx6rYd48=;
        b=hGPC3StimZKQIejJ30+inlDg6jDhejq5dzyT8AYBY61t4sJNGEVpeuvTaC+ZZJ9cpF
         RBDvpd69vxQwRrrzeXacv8oDrzkamtbPDgiKsMaTxpu4Ss51aJN7Vjg1suL9pXgDjGqZ
         B4V68+awypifzdDtyXHtBkRtjh26dgyiRTO2yAk3egzRyClfOr6ICV00oe7wt2Z8wbAz
         BTE/5HvWSFNY9ufhK/C0gk6aYfnRA+AlmGSfyYSuK0Xo0g7D1JzKYUpslXVH6l/i5qcl
         u2VrQyhpA+Q/3xl3qa/mpq73b3+FBWHwEf5v2YfmbVilyoJGiLkgHoMFteeGb4QT41yP
         kPvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q55si9763033qtq.264.2017.07.24.14.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZlM7-0002eD-FA
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZlM4-0002e6-QR
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:57:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZlM0-0005k8-Nq
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:57:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZlM0-0005iN-EF; Mon, 24 Jul 2017 17:57:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C3EC85540;
	Mon, 24 Jul 2017 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3C3EC85540
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3C3EC85540
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D20E7D9B7;
	Mon, 24 Jul 2017 21:57:24 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
	<ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
	<e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c1078250-30a0-0d4c-d830-88591fb6ba43@redhat.com>
Date: Mon, 24 Jul 2017 16:57:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="UuM0Tu06NIUC2HMBF20BUwnENd9njpm3b"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 24 Jul 2017 21:57:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt:
 fix null pointer dereference
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cx1qiOMbi3HO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UuM0Tu06NIUC2HMBF20BUwnENd9njpm3b
Content-Type: multipart/mixed; boundary="1VdXhChcd9PwGp4A1F5sulVLO32xR6AVM";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <c1078250-30a0-0d4c-d830-88591fb6ba43@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-22-f4bug@amsat.org>
 <CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
 <ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
 <e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
In-Reply-To: <e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>

--1VdXhChcd9PwGp4A1F5sulVLO32xR6AVM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 04:52 PM, Eric Blake wrote:
> On 07/24/2017 04:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 07/24/2017 06:09 PM, Peter Maydell wrote:
>>> On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>>> Use error_report() + exit() instead of error_setg(&error_fatal).
>>>>
>>>> hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable
>>>> 'node_path') results in a null pointer dereference
>>>>      if (node_path[1]) {
>>>>          ^~~~~~~~~~~~
>>>
>>> I don't understand what this warning is trying to say.
>>> We can't get to this point with a NULL node_path,
>>> because of the previous conditional, which is using
>>> error_setg(&error_fatal).
>>
>> Ok I see, Clang is unaware than error_setg(&error_fatal) is a noreturn=
=2E
>=20
> Indeed, and that's because error_setg(&error_fatal) is not in preferred=

> form.
>=20
>>
>> Patch dropped.
>=20
> That's a shame.  Rather, we should patch this file (and others) to avoi=
d
> all the inconsistent uses of error_setg(&error_*), to comply with the
> error.h documentation.

In other words, switching to the preferred spelling in the following file=
s:
device_tree.c
hw/arm/sysbus-fdt.c
hw/block/fdc.c
hw/ppc/spapr_drc.c

is desirable, and has the added benefit of also silencing a Coverity
false positive.  But it should be done in terms of switching to the
preferred spelling, as it touches more instances than just the one that
shuts up Coverity.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--1VdXhChcd9PwGp4A1F5sulVLO32xR6AVM--

--UuM0Tu06NIUC2HMBF20BUwnENd9njpm3b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2bT4ACgkQp6FrSiUn
Q2pokggAphLmlsdXFNxF//VMyJjkgoD1HN7lpy1rM+HYZclyEaasn1AUatSL7amx
8JGC2XcmDKglkBEa4IRRWkI4G+xtWHEgdTDAfI98H07CpYPzneXAijivu+sBv/P7
MNpHr8jjcHrvvAsIALinaCyFDdOWt5QnI6ZxN1g0MuBfiviPsN6yEHJdneiZ0YKl
isZ/EN2xa50I9rmbM+LladwSIX3/v3yIp5S+/+nCzXSBScGpfUGKO1og9dgSBhgA
YPtuE+js1Q+YGb/K+ojhIDibdJw54GjlhK7arHaBRO3+Lov3swu/aLGOqXVWpTet
wzQKQ0vpl5ue007pIG7Qk7UlcmU5Og==
=WF4E
-----END PGP SIGNATURE-----

--UuM0Tu06NIUC2HMBF20BUwnENd9njpm3b--
