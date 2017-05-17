Received: by 10.25.0.6 with SMTP id 6csp433424lfa;
        Wed, 17 May 2017 14:55:55 -0700 (PDT)
X-Received: by 10.55.217.146 with SMTP id q18mr912500qkl.249.1495058155274;
        Wed, 17 May 2017 14:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495058155; cv=none;
        d=google.com; s=arc-20160816;
        b=Kl0/v7FDgcT+v4G0IJCwFlDvQoh6/ZRk1qcZNxtk0xdP6VGaqOwS/nxclz37P3HPek
         BL2kIz0U+huyHrIApn+ok/5Py6fhQrFpdHQGdM5XVDPUfSMpBAMYisM9wfIoC5CZwhIE
         +Q6OFYmLd5JGCrcGmXQldBRPMfpIylbM+tE6CQVdRYVaPqpQe8pKyIpZoGez/IRQzRPf
         FEoYIUQSe2qwcO7BPWNSr6nuCCQaYO/3KGEHsA75paAwoKKSRMn2ERqb7nCxNo2ox9KW
         0NG4Jh26Hk2tuXcNKwVK16vYgbA2Q0o5J//RhyH7WIrQN+TOwf9rXEHi+tur/e3REBej
         FWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=xNHOklcFztl1hsqjJPH2VQYZqlTQnmXxDZaes6vx8Wc=;
        b=LITSghtpfL34DRU8GvuaJ/24wXd6CF8a96uKv6bvKQMzC1ZPFW0ilM2TucdZ7c8R27
         o65ELzm0MQANDEXIzHi5aGeGFeFdYn2XDu5UTPd/G4aC97V3SAfJRWh+VCKaQimdkkux
         H3lXAkqOtD62p9yXrNH9bhM0jvkYhW8Lx511BSwDxEPlLENO5qoNL32Y8yC5RdIzFNO/
         Kl9yh5shZrpiHl9vuEtdBOJVF8/FXa1yNX7zPRaTtcHwocwugPtsbyurI6pVvj/rnB8D
         OrT0NQ/DUs6YvOFJeQ/EbSplbjU2qm4u2Cee1V8D286heHot/7iGIEBWIljsHQXSIXQ/
         RQgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p19si3276341qtg.171.2017.05.17.14.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 14:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB6vC-0001RS-NE
	for alex.bennee@linaro.org; Wed, 17 May 2017 17:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB6v4-0001OP-R2
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:55:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB6v3-0002O1-O3
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:55:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dB6v3-0002Ne-ET; Wed, 17 May 2017 17:55:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FD764E4CD;
	Wed, 17 May 2017 21:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1FD764E4CD
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1FD764E4CD
Received: from [10.10.121.107] (ovpn-121-107.rdu2.redhat.com [10.10.121.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6434B18660;
	Wed, 17 May 2017 21:55:42 +0000 (UTC)
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
	<1832071588.99743.1495054408073@mail.yahoo.com>
	<bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
	<968647832.156883.1495056309814@mail.yahoo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d7324134-4eb5-0ca2-2a13-6fd5c5479b49@redhat.com>
Date: Wed, 17 May 2017 16:55:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <968647832.156883.1495056309814@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EaKpOq8SvgUbA8I5hnDHCiceSTj5P7eVu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 17 May 2017 21:55:44 +0000 (UTC)
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
X-TUID: XbuJGqtAOYhy

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EaKpOq8SvgUbA8I5hnDHCiceSTj5P7eVu
Content-Type: multipart/mixed; boundary="ibwbh6ri3J4awKh407OaruDrUrtwc0FdV";
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
Message-ID: <d7324134-4eb5-0ca2-2a13-6fd5c5479b49@redhat.com>
Subject: Re: [Qemu-devel] Add Markus Armbrusters code for Broadcom Perhiperals
 for ARM.
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
 <684185116.2952708.1495044580181@mail.yahoo.com>
 <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
 <107015620.2969780.1495046091978@mail.yahoo.com>
 <5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
 <1832071588.99743.1495054408073@mail.yahoo.com>
 <bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
 <968647832.156883.1495056309814@mail.yahoo.com>
In-Reply-To: <968647832.156883.1495056309814@mail.yahoo.com>

--ibwbh6ri3J4awKh407OaruDrUrtwc0FdV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2017 04:25 PM, John Bradley wrote:
> Well unfortunately Eric. I don't understand your "top posted" slang.

To learn what top-posting is:
http://lmgtfy.com/?q=3Dwhat+is+top-posting

and why we don't like it on technical lists:
http://www.caliburn.nl/topposting.html

Or more humorously:

A: Yes.
> >Q: Are you sure?
>> >>A: Because it reverses the logical flow of conversation.
>>> >>>Q: Why is top posting frowned upon?

>=20
> As for his "intent", it is quite irrelevant as I have gone over the cod=
e line by line and what every he intended to do, he has succeed, as far a=
s I can tell , in matching you standards, to such an extent that I am hap=
py that=20

You are correct that the GPL gives us legal rights to use Andrew's code
without his permission.  And yes, YOU can fork qemu, and take whatever
GPL patches you want without attribution, and you are probably still
just fine legally (as long as you still abide by the GPL in that you
distribute sources to anyone that has your binary).

But our project rules do not allow us to live by just GPL (in part,
because the license of qemu is sometimes tricky to determine due to a
mix of GPLv2-only code and non-GPL code, even though most new code is
GPLv2+).  Also, if we ever had a reason to change license (supposing it
is even possible, although it might require ripping out or
reimplementing portions of the code base), having S-o-b means that we
cannot be accused of applying a license that someone did not agree to.

Therefore, it is easier, pragmatically, even if not legally necessary,
to enforce proper chain of authorship by getting Signed-off-by: tags on
ALL patches, especially where a patch asserts a copyright owner, insofar
as the original copyright owner is still alive and able to assent to the
action.  It is not just about legalities, it is also about risk-avoidance=
=2E

It may sound like we are being hard-nosed (and so be it), but there's a
reason that we list proper Signed-off-by: rules as our number 1 item on
the SubmitAPatch page.
http://wiki.qemu.org/Contribute/SubmitAPatch

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--ibwbh6ri3J4awKh407OaruDrUrtwc0FdV--

--EaKpOq8SvgUbA8I5hnDHCiceSTj5P7eVu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZHMbdAAoJEKeha0olJ0NqMTMH/3rmjWw3uJ7m0I94r+JWi4yb
EHU8Gq6WOR3ijxZp66szfvP/dE7IaG8Z8JdlFUizAPc3siBVjjmEGDmz/3/2b1fN
ffaO8tBtfhEYpn/CfsOo//+dRTnSBeijSEY8VW5SjMARgFBOX3gNWvTXD1l3eoxu
0WIXydKpatAcCfS9FES+FPDq/2xZ+oRXFUrgggOIuH1Cr23jGIDDvxpU+d1e+7Z6
lEzdO3Esw0dyQAN5+1BSR89D9Z4bmjw9xkYzYGb/mrPyI6UQ4XVlU8AXXVJfAe+P
2mJIdur6ZRfJKEHFf2JJ6dJUtO4o5RloeHnbpHxkKAPWG+FD2wzACrwjKj5DysI=
=v7Aw
-----END PGP SIGNATURE-----

--EaKpOq8SvgUbA8I5hnDHCiceSTj5P7eVu--
