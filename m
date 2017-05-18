Received: by 10.25.0.6 with SMTP id 6csp499049lfa;
        Wed, 17 May 2017 18:52:46 -0700 (PDT)
X-Received: by 10.200.34.162 with SMTP id f31mr1704176qta.65.1495072366839;
        Wed, 17 May 2017 18:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495072366; cv=none;
        d=google.com; s=arc-20160816;
        b=WfX6UdBNVE0ViotjSB/PcV1/OvcuplaXUsCEcm0aIRLbo5L0NVJF6e3jp83nrpf0L6
         WTRIHxDUsfU7EWnF3+gFaxFnyQ0uRHjBLrlaPkPVjLAYd/xXvF4F5mh9KjZ9tA0vE6MQ
         APgrXv7j9AkhjCeeIOCq6iCs1uit1KV8h5Ckd/CGjJXxbfQsxzGQttX4JU771R1H1TEs
         gEqFg+no+0lWh2rs9iQw4VMZEtQJeOFuxyirX2/CyiN/NnxKkaZ6tUfhfuheTsSKLPw6
         hFWhOzhLdfES1c9iwdbgH5+NcFL4Foq5A6G3yFlLAGfOfZ2+PjJMWejttn3jdOnaM4aG
         2HwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=KG3Eo33upseEfPBqE5XztGl8oiX0Axrrv0ewwocgC/o=;
        b=R+dndOO55jAGyqdHUos4SYP61uhLZiD0Pg9Wtt6h6PNRpo3g9VuH3d5ijailhI6ybl
         ebUgzVA76i5R9TOD5LF7kPvXrDInJ/qt2RrghaO9ZILk9z5RnqOAJMbhwpWAZofhi/F8
         C03QlzoJ6CU2TpUbIVGjcA58nNfEb1njE+vVcN56GZalohBi0jE2lWqD544M5XKWi/VT
         UZBj5EcFnm8dI/Cd8b+Wnonj+wx841q5w7VVdNtuWFds8KQKusbPcHUEVdb78KGAzWyQ
         uvUxJ4OK0EnUGq1BVjZeo3oIPqno+dmoHMcSD/2BetsdPJ5WIcPVNsOLRIrGIH2xxdDN
         l9Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q23si3910828qkq.30.2017.05.17.18.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 18:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBAcQ-0004QF-6F
	for alex.bennee@linaro.org; Wed, 17 May 2017 21:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dBAcH-0004Ps-U1
	for qemu-arm@nongnu.org; Wed, 17 May 2017 21:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dBAcE-0004Of-3G
	for qemu-arm@nongnu.org; Wed, 17 May 2017 21:52:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dBAcD-0004Nu-Ps; Wed, 17 May 2017 21:52:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50E6780C0B;
	Thu, 18 May 2017 01:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 50E6780C0B
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 50E6780C0B
Received: from [10.10.121.107] (ovpn-121-107.rdu2.redhat.com [10.10.121.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 921EB18344;
	Thu, 18 May 2017 01:52:30 +0000 (UTC)
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <39e1208c-9ed4-6c56-76d1-e5a7e46a409d@redhat.com>
Date: Wed, 17 May 2017 20:52:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <684185116.2952708.1495044580181@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Ab7OoWov7s3lQXSlLpw97E9oBWsMWiKi5"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 May 2017 01:52:32 +0000 (UTC)
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
X-TUID: qonKxUs7fZXq

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ab7OoWov7s3lQXSlLpw97E9oBWsMWiKi5
Content-Type: multipart/mixed; boundary="94BXwmV0rpOfAF6E7DxTN2AB5XfvEKLfi";
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
Message-ID: <39e1208c-9ed4-6c56-76d1-e5a7e46a409d@redhat.com>
Subject: Re: [Qemu-devel] Add Markus Armbrusters code for Broadcom Perhiperals
 for ARM.
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
 <684185116.2952708.1495044580181@mail.yahoo.com>
In-Reply-To: <684185116.2952708.1495044580181@mail.yahoo.com>

--94BXwmV0rpOfAF6E7DxTN2AB5XfvEKLfi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2017 01:09 PM, John Bradley via Qemu-devel wrote:
> Also available at=20
>=20
> https://www.dropbox.com/s/gwuquw0kirstw7a/0001-Add-Markus-Armbrusters-c=
ode-for-Broadcom-Perhiperals.patch?dl=3D0
>=20
> Following suggestions split my original patch up. This the largest mono=
lithic chunk is=20
> additional BCM device support from Markus Armbruster.
>=20
>=20
>>>From 0b39a04030d5a2cea4fcd2159d365580ca155b78 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Wed, 17 May 2017 18:57:21 +0100
> Subject: [PATCH] Add Markus Armbrusters code for Broadcom Perhiperals f=
or ARM.
>=20
> Signed-off-by: John Bradley <flypie@rocketmail.com>
> ---

After a break from the keyboard (always a good idea), I've re-read my
comments on this thread so far.  As usual, email is a lousy medium for
conveying emotion and intent, and I can see how my curt replies merely
pointing out ways that you can improve your patch can easily be
misconstrued as negative advice or rejection of the idea in general.  So
let me take this time to apologize if I've come across as over-harsh,
and give you a big thanks for your efforts to contribute; your additions
have the potential to make qemu better.  I hope that we do not scare you
off with advice on improving your contributions up to community
standard, but that you feel welcome to contribute to the community, as
well as using the give-and-take iteration of review to make your first
patch great.  Writing a first patch series can be especially daunting
when you are new to an unfamiliar process, and while we were all once at
your point, it takes effort to remember that not everyone is as familiar
with open source ways, and how it felt on our own first patch submission.=


A big hint: the great way to get a patch accepted on ANY project is to
first offer reviews on other patches being submitted to the list.
Review backlog is always present, but it gets especially bad if there
are more contributors than reviewers.  Plus, reviewing code that other
people write can give you a feel for what constitutes a typical patch
for the project, which will let you model your own submissions in the
same style.

Good luck!

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--94BXwmV0rpOfAF6E7DxTN2AB5XfvEKLfi--

--Ab7OoWov7s3lQXSlLpw97E9oBWsMWiKi5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZHP5dAAoJEKeha0olJ0Nq974H/i6CnFdxCx6faHkmGafVXGOG
4BVlU3ZYSS40FERS5stGkss3T4DDmZ9l1WYa60YoTCXpYKlvDRcouKUay0tD9anA
ticiQQ8jvRRDOVLhtd11Gn6ZGOIxgVD010qNt3tRal+yRgNZmbbnm9Ss8OiAx+Vk
411b6uxgwm9IMNLFjjLVRtW+AkRYx6Z6+lxLXLTljB2tCudSCF67kfn0U0/WHu0+
FY8d56VIrn7vUg88TiqDvV8fzfdVkaWs2QZcuXmy29F/x67QLJugj0yUsLfwpE7l
/DsF6QS/9+HhZZyxemEds+iyfGGPxl16eCZuLyQwmZhTCoNweV9Han+4wEWRmZY=
=Mqhi
-----END PGP SIGNATURE-----

--Ab7OoWov7s3lQXSlLpw97E9oBWsMWiKi5--
