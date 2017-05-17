Received: by 10.25.0.6 with SMTP id 6csp420453lfa;
        Wed, 17 May 2017 14:15:38 -0700 (PDT)
X-Received: by 10.55.124.3 with SMTP id x3mr788673qkc.308.1495055738018;
        Wed, 17 May 2017 14:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495055738; cv=none;
        d=google.com; s=arc-20160816;
        b=HzHezX9XZx1Qx6q0SiZsKtF2Jigw1i0LStEf3FIjmBABUaL0mFnBJdRkxfNd1XAXMP
         Avywh6rR4n190yE+GTlWK/qvId5gxbUZSVUB23EBEqx/0QTiS/RsgteWBaT7bhiwVQQB
         UPMhp1cbgNWPgIF8R0J7N6dG/DddnqcSzr5oR30JHulbOQ5Wk49zsnGf5xhz9fKvfo2d
         ui8oSLuHiq+HOTRJ1L5bj+9+7ww3EcKkh7RCC7yX0/n7DcKdxNCPuoVKBqXmrWzB0jvl
         kipRJQopHkj9THBsb55YndR+D2WVIA5yxliEmGJxFOxtsfFRwGUCSYDNg9CRzVuwQRr2
         0LVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=KxpEpDdwiSaniu0T/NJ6SurcfGr3W1ehoUJyNHsz+/4=;
        b=wRqBpdGdDEMcYYzFY1v245IkVJWC1m6U2MDdt92qk/u7eGGdawI1VV4oaWLAX2sXi5
         V7egpZSwglcmyG883keFK3pRe33OIhSw+N5gVgwRripeBedd46NDfQ2COHe7KH9Mjt1H
         GnbgX3kJT/4dqb096QzGuueFD139T9IkxDtyB2jyqpknGiPYp9opk0koRml1EdGUin5V
         bzZnwPmnd1qinZzPW7/4D7fnPwo0zl8BahnWR+HntukWbZHQOFSvVIsw4W/P3nxzx4mh
         25ZDDQHvsJxq5QNyPQbQ2peXwvIiTMoPsbDYCjmpjYm2L9qzYCrK2ddSrAsc/My9iwRt
         KiuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si343511qkl.27.2017.05.17.14.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 14:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB6ID-00083b-F1
	for alex.bennee@linaro.org; Wed, 17 May 2017 17:15:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB6I5-00083Q-2x
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB6I1-00030D-2K
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:15:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dB6I0-0002zy-PD; Wed, 17 May 2017 17:15:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 214A361B91;
	Wed, 17 May 2017 21:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 214A361B91
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 214A361B91
Received: from [10.10.121.107] (ovpn-121-107.rdu2.redhat.com [10.10.121.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D459179E3;
	Wed, 17 May 2017 21:15:21 +0000 (UTC)
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
	<1832071588.99743.1495054408073@mail.yahoo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
Date: Wed, 17 May 2017 16:15:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1832071588.99743.1495054408073@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="g2p7tSP9KIq00pA8heec073LSiF2DgKp8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 17 May 2017 21:15:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3OiK6UmdCO0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g2p7tSP9KIq00pA8heec073LSiF2DgKp8
Content-Type: multipart/mixed; boundary="VKDWPKlFqQOM9RcnQ5OTulR6qQP45dDN4";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Bradley <flypie1@yahoo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: John Bradley <flypie@rocketmail.com>, Laurent Vivier
 <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Geert Martin Ijewski <gm.ijewski@web.de>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
Subject: Re: [Qemu-devel] Add Markus Armbrusters code for Broadcom Perhiperals
 for ARM.
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
 <684185116.2952708.1495044580181@mail.yahoo.com>
 <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
 <107015620.2969780.1495046091978@mail.yahoo.com>
 <5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
 <1832071588.99743.1495054408073@mail.yahoo.com>
In-Reply-To: <1832071588.99743.1495054408073@mail.yahoo.com>

--VKDWPKlFqQOM9RcnQ5OTulR6qQP45dDN4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2017 03:53 PM, John Bradley wrote:
> Andrew Baumann has and others have release the code under GNU General P=
ublic License version 2 (GPLv2), the same as QEMU that allows me to added=
 it to QEMU as it is under the same license, by signing it off this is wh=
at I am certifying.=20

See this document linked from the SubmitAPatch link (it describes the
kernel meaning of S-o-b tags, although the qemu meaning is the same):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d81=
57f#n297

Yes, your Signed-off-by: asserts that you are okay releasing your
portions of the patch (bullets a, d) and that you chased down that
portions that you did not write are properly licensed (bullet b), but
what you are missing is that when you modify someone else's patch, we
also need that someone's assertion of intent that their work (whether or
not modified by you) meets the same standards (bullet c).  In other
words, when modifying a patch, S-o-b lines should be additive in nature,
rather than replacing his by yours (or, if his is missing in the source
you originally copied from, then we really need to Andrew to chime in
and add one); this is so that there is a full chain of custody on who
wrote portions of the commit.


>  John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hi=
ll Liverpool L7 7AF=20

Your mailer is sending very poor formatting when rendered as plain text
(and we frown on html mail on this list).

>=20
>     On Wednesday, 17 May 2017, 20:11, Eric Blake <eblake@redhat.com> wr=
ote:
> =20
>=20
>  On 05/17/2017 01:34 PM, John Bradley wrote:
>> This is especial true as I meant Andrew Baumann 0xabu (Andrew Baumann)=

>=20
> Top-posting is not nice on technical lists.

And yet, in spite of me mentioning it, you still top-posted. :(

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--VKDWPKlFqQOM9RcnQ5OTulR6qQP45dDN4--

--g2p7tSP9KIq00pA8heec073LSiF2DgKp8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZHL1oAAoJEKeha0olJ0NqPJwH/RVEkX33BLb2V2yrHcYzT7fw
2dcUHFKsllClAAxli/b+zesgraH08zxGRYcLEmgBtqmR1ptvx+EIhEm824n8kRXa
BWvJ+KABJRTZ1mMWSt6o2vcexKL6GMKlDmU5iocyjb7TDkLIcvqf7JA0S22T6C20
qnt69lO4u8DsWvRCOGZ8QlVh4z8Nc9+Q38CbOJItifjq0k8Fs2oafg6x+0jtVUIW
O0WBqeC3GOTBEMzPIF8IRs68cFkzkP7cRL0hRgm4XO+hF6UVEXd8fYKUl9IZuc7e
1PiKLNn188yxQuWddFEMoM6jAr22rnDPyh2OEnRcq+P3GBJ0Whzy8FrnPsGBtVM=
=4uUx
-----END PGP SIGNATURE-----

--g2p7tSP9KIq00pA8heec073LSiF2DgKp8--
