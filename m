Received: by 10.25.44.15 with SMTP id s15csp6543063lfs;
        Tue, 18 Jul 2017 14:50:20 -0700 (PDT)
X-Received: by 10.200.8.68 with SMTP id x4mr5129106qth.195.1500414620344;
        Tue, 18 Jul 2017 14:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500414620; cv=none;
        d=google.com; s=arc-20160816;
        b=rEVtJTiYGTDE0UwluHlrbDB3mkyswOnTDolgq9QoIsXPXO+B7y/g23f9m8HjUhkVTL
         L+IbG66sNrWq2jhID/6WcE3pv/7ovina34r+w7cCqioF8CKCBqkhgVXcYA8sYnW/Oc9w
         W57nS4a+CJs0blG2L4S9dhlF6AteDl6ZVnABCAiGQwSyKvS2y77SuexFNhAYFCggGCy8
         IoC4Z1SuUgfvv1rSe/yZe2M10fIEnsLERu98OEw10MdspRjbZRIAxKZJvfA5vqWgNS6t
         HQUQPBakCqFdvzn/YIZwphtzFtHeyy9KoBILz1cAgjeBH4mRu7IeeFAXfrG/Skzf9y5M
         PvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=Hx/vUPvJTtW0NppFG3w8DtvG1cMo/+2Tj+JykXm5WDk=;
        b=V0gJ+gfvgJ3f72RlB4mS2KRLW4R5wTaFlKR/+Hy9N8ssQGLjvHI2X50zE9r7tLC2zp
         FshAsNQwuOrtFhowrfArzxyBn1qbcUVeG0Kq0WEHB4t3St2zohUyDDiSZFa+jhyhmAuy
         Z1uwPsB1EcICZk4aYAsVxYbuaNfg2MgPGiYUyMo0L3AGQFEGuQAi7paor8FuUoxvZfog
         h+STPVSqPJmTIcrCeyzcs9A4jg3H0hGJgdKvpZ8szTYh2sM5oXDClBQndTS/38Q1c7Iw
         qjwQoYVaXvkHX3IwaEX1vfWOH9oP1eJhaBGH9oshcPyKfJiopn5G9lpacf8sgCC8UKSu
         Lruw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si3089692qte.192.2017.07.18.14.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 14:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXaNl-0004BZ-Pt
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 17:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXaNg-0004An-4h
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 17:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXaNd-0003GA-1o
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 17:50:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXaNc-0003Ee-PH; Tue, 18 Jul 2017 17:50:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FA547D0E8;
	Tue, 18 Jul 2017 21:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6FA547D0E8
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6FA547D0E8
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36C4B78C04;
	Tue, 18 Jul 2017 21:50:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170718045540.16322-1-f4bug@amsat.org>
	<20170718045540.16322-4-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <0ee89ade-2aae-4259-4c3a-651d1bee42a4@redhat.com>
Date: Tue, 18 Jul 2017 16:50:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718045540.16322-4-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="EOhfRSfjLkDbxG3iASoq2sMvlPR4Fx84r"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 18 Jul 2017 21:50:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 03/10] target/arm: optimize
 aarch64 rev16() using extract op
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
Cc: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1PnEkoCZ6NCp

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EOhfRSfjLkDbxG3iASoq2sMvlPR4Fx84r
Content-Type: multipart/mixed; boundary="KgsHgIbCX7eXM3FJGfoercphLrgFjJ090";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>
Cc: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <0ee89ade-2aae-4259-4c3a-651d1bee42a4@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 03/10] target/arm: optimize aarch64
 rev16() using extract op
References: <20170718045540.16322-1-f4bug@amsat.org>
 <20170718045540.16322-4-f4bug@amsat.org>
In-Reply-To: <20170718045540.16322-4-f4bug@amsat.org>

--KgsHgIbCX7eXM3FJGfoercphLrgFjJ090
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/17/2017 11:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Aurelien Jarno denoted this function could be implemented more effectiv=
ely using
> the aarch32 rev16() pattern.
>   [http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03180.htm=
l]
>=20
> Done with the Coccinelle semantic patch from commit 58daf05d07dd

This commit id is not stable, unless it gets merged as a PULL request
from you.  When submitting a series, it's okay to just refer to "the
previous patch" or "an earlier patch" without a commit id, especially if
you know your patch will go through a different maintainer (and thus
change id's the moment it is modified to add an R-b or S-o-b).

>     (see scripts/coccinelle/tcg_gen_extract.cocci)
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Richard: maybe you need to update 58daf05d07dd to your commit...

Indeed, you already noticed that the maintainer has to do more work to
rewrite any commit messages that refer to mid-series patch ids.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KgsHgIbCX7eXM3FJGfoercphLrgFjJ090--

--EOhfRSfjLkDbxG3iASoq2sMvlPR4Fx84r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllugooACgkQp6FrSiUn
Q2plgQgAld95AtqxbQkLwhG9oauu7DflX3uwb86zylh9rLFPUdokRC2hQYU/GYyC
ylD6I9AjZq+5ZuF2/uKUyoIRNWTl9KhC49FWObwuaN25kFmkcEsNhoOD0/q7RS3U
XFTGLrx/uZuvRpjxgxKoYNsDz7AvN2WSD4XMhVUjdcuKy+rPa1zzNXa+dCWPucXR
oFbN90xreQ68JRLqeP2ACnVB4YA6usLvAw0YNvjgw0eDo/6OdmiFXrRA5V91rukn
vSUFfPMuUgKnlJDyagIX9viGbvuAeRICRT8eGWBXmTc//ThdPNsk7Kr3eCmBumco
+ZaASmdy0zzFxbWKt1R78+1pRRectQ==
=9svZ
-----END PGP SIGNATURE-----

--EOhfRSfjLkDbxG3iASoq2sMvlPR4Fx84r--
