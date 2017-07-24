Received: by 10.25.44.15 with SMTP id s15csp4348445lfs;
        Mon, 24 Jul 2017 14:53:47 -0700 (PDT)
X-Received: by 10.200.50.53 with SMTP id x50mr18068082qta.135.1500933227717;
        Mon, 24 Jul 2017 14:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500933227; cv=none;
        d=google.com; s=arc-20160816;
        b=m3ZsHMPyrpP6e3EBxLRhb4v0jC39DaMUuXjypxy+sq3Czfim/3WeNQcKUpJMAg1ICH
         3lxrOWziVUxKwtfx4Fp6qNQjWhvda0kYM01+rg2aPq3KjDIdkMoJGgY0/tRr7rTAGQ+F
         ayn1U2hIb9C5FaKmratTuSIjdwF/SWbgghNOHP69NF+0koKuL96dQ2y0gVF8iPQk1ljY
         v4vfb7/yNRj6PH0KDnlUuHaZ0pqcmfMzRTzDj4wBRddM0Y95kPTxlnZAkvwKFbAEOm6i
         bTAKFw0un3E3t5Hh7HZ8pRST3b8A+tqOSRjH19C0mpw1xClx7jfcmxi+h2h8zFftALuY
         tK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=PROGel0cY3Yb2CmPTuR9umVAm4u5/aOo/ZW/PUG4ML4=;
        b=zIgG2ejQXyWrhazgI4vg9hvEyzpvj293Pl8Fl9M8aQXORnkCD0G/MDBC+ynI1eTT8j
         O5b71Zhq4slGmQkqZ2yWOafL7wJLTRSJVSWAElhyUsrxRKJ2W9hdju914AgQ0NGAUMGa
         t3N7bKoz0dAZ1KcQBEA/W/ovbMvcNHMkoWNx4okn+2w4waGE30n/kVn43ZZV4G10A/Ci
         ADTmZSyHgmGRzMuAQu29FZor9STAhkwmlAQlcfPInqyrOSKdNUPmfe3USljwHlyQjQCQ
         aMeeuWZUm8+dIlHhdm6E66YhxptRVCIuDH9RddSqAFGYN2VyHnvtN8MVwkVGoj/rv6OT
         SefA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si9779751qkd.460.2017.07.24.14.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZlIP-0000m9-1x
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:53:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZlH0-0008Ue-R1
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 17:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZlGz-00011N-QH
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 17:52:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZlGu-0000wt-EI; Mon, 24 Jul 2017 17:52:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50BAD8046A;
	Mon, 24 Jul 2017 21:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 50BAD8046A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 50BAD8046A
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EF04600C0;
	Mon, 24 Jul 2017 21:52:10 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
	<ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
Date: Mon, 24 Jul 2017 16:52:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="l9RFM3AgJNSNcte6CEQxSIlxWFvq3fLSQ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 24 Jul 2017 21:52:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eImKOXVtrPdJ

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l9RFM3AgJNSNcte6CEQxSIlxWFvq3fLSQ
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Message-ID: <e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
Subject: Re: [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null pointer
 dereference
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-22-f4bug@amsat.org>
 <CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
 <ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
In-Reply-To: <ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 04:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 07/24/2017 06:09 PM, Peter Maydell wrote:
>> On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>>> Use error_report() + exit() instead of error_setg(&error_fatal).
>>>
>>> hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable
>>> 'node_path') results in a null pointer dereference
>>>      if (node_path[1]) {
>>>          ^~~~~~~~~~~~
>>
>> I don't understand what this warning is trying to say.
>> We can't get to this point with a NULL node_path,
>> because of the previous conditional, which is using
>> error_setg(&error_fatal).
>=20
> Ok I see, Clang is unaware than error_setg(&error_fatal) is a noreturn.=


Indeed, and that's because error_setg(&error_fatal) is not in preferred
form.

>=20
> Patch dropped.

That's a shame.  Rather, we should patch this file (and others) to avoid
all the inconsistent uses of error_setg(&error_*), to comply with the
error.h documentation.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--l9RFM3AgJNSNcte6CEQxSIlxWFvq3fLSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2bAkACgkQp6FrSiUn
Q2rVvgf/aejekJz3XvoPgk6p5kJ6tkS6bhEhtudG7/yMKOByAjF5aQpw/kO5/iQe
r13Ij7wBdFcnuvaU7RT2PWdTbli4eyhH2McJAx6QB7Kc0ENRollGiswPaYVJmuzk
P+IttKEkIAwNE8HfKBVKnaMiGzUnQWVhgsTw1pgABw/XuePpEy6zjkXNqVVX+YBI
mbKAy+0W3m/XFmDPGFj2UG33UQqHbwkHVTEtBxNj/ikcRmxqmaLTgrO6GJ2fJRpL
iF3twolzITZ4Cxcwyi7Pe7Lr87zP9JVQrb/bZUKfvqylboOqqpaAlNqRwDvkSHne
A/5vavexjDBxky2TrLSJL4Uz0UaQjA==
=8cWt
-----END PGP SIGNATURE-----

--l9RFM3AgJNSNcte6CEQxSIlxWFvq3fLSQ--
