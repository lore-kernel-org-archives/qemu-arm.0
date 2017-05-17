Received: by 10.25.0.6 with SMTP id 6csp379278lfa;
        Wed, 17 May 2017 12:11:47 -0700 (PDT)
X-Received: by 10.200.3.129 with SMTP id t1mr296436qtg.253.1495048307116;
        Wed, 17 May 2017 12:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495048307; cv=none;
        d=google.com; s=arc-20160816;
        b=rcOqbooNjF+jFOV+UXyKdqMCHuGA2UVkEP6ADme4b7NKD/KSOoqKt68bmE1Wq6MAh9
         lZt6jkXdC/iEyNLoghtfvv3GV8o/kx4tP9OG8JrTsIWW0fzxCvycm88bOE1Bybp8C4TD
         3D7Y/1gk4zUBaT2OfISu+/6P9d+v64mAmo/UYrQvqIshMFWDVWIXEkaBeBaEBqp0VI2/
         DU45Wk6lBTtRhmpMD1PVDLxL/59a3rj5pXFbfaMC+pwLMgqY2y8NkecnPi75PH3Z9MTN
         AvtmId+apEhbaMAQQyakInCJM1JHJ0vO297VGGJDGf/d76YrusDr0BAwOf5BWYcTr3tV
         31GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=c5HehP9oEcJMIFv2UqSzRUi/u57y9fwBQWWK4uk8evE=;
        b=gpcJQIQWinm6nfnJyum9h/PREwaAAcGdY/nzb4whIh0D/qOwUDpjh8FV0QsHCquiUe
         FxhIgDUbDRnEjGkpw5VYnNuAnnhirMw4Ax6ttKPqwWTklPunJu0S4UWVYGQNW73WUuXB
         qZwckDkcoCaGfFTKZO56291wChMuPHWKQkrh9D5se+nOI5S4BvFicanFtkmQzFhlk5p/
         ejnYGvao2Vr6Qs4+Wv/yF136Y/s76Kr3tYNAfqepvVVvjkPXLqWazTnmM3N0+4BGvAMG
         tuOeeh9JKJy7P8qaNk6WBxAoRsYwEQhv4mWSDPUJ9JMyxZdDYc5qttBlQea1VVpsL9xX
         UW3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y54si3025474qtc.329.2017.05.17.12.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 12:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB4MM-0001G6-Ka
	for alex.bennee@linaro.org; Wed, 17 May 2017 15:11:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB4MJ-0001Fz-5Q
	for qemu-arm@nongnu.org; Wed, 17 May 2017 15:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dB4ME-0008EL-LN
	for qemu-arm@nongnu.org; Wed, 17 May 2017 15:11:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dB4ME-0008E9-C4; Wed, 17 May 2017 15:11:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0809380468;
	Wed, 17 May 2017 19:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0809380468
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0809380468
Received: from [10.10.121.107] (ovpn-121-107.rdu2.redhat.com [10.10.121.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE18517AC5;
	Wed, 17 May 2017 19:11:32 +0000 (UTC)
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
Date: Wed, 17 May 2017 14:11:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <107015620.2969780.1495046091978@mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DPfjjcQ19wK2mihQNMBcmAl6d2EMNkmG1"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 17 May 2017 19:11:37 +0000 (UTC)
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
X-TUID: dAJdoR9CrCdJ

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DPfjjcQ19wK2mihQNMBcmAl6d2EMNkmG1
Content-Type: multipart/mixed; boundary="iNACUHe9BVJjEGQeWW10DsgvKqf2AsCRr";
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
Message-ID: <5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
Subject: Re: [Qemu-devel] Add Markus Armbrusters code for Broadcom Perhiperals
 for ARM.
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
 <684185116.2952708.1495044580181@mail.yahoo.com>
 <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
 <107015620.2969780.1495046091978@mail.yahoo.com>
In-Reply-To: <107015620.2969780.1495046091978@mail.yahoo.com>

--iNACUHe9BVJjEGQeWW10DsgvKqf2AsCRr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2017 01:34 PM, John Bradley wrote:
> This is especial true as I meant Andrew Baumann 0xabu (Andrew Baumann)

Top-posting is not nice on technical lists.

> 0xabu (Andrew Baumann)
>  0xabu has 3 repositories available. Follow their code on GitHub.  |   =
|

Using github requires the use of non-free (as in freedom) Javascript.
That's why this list prefers that all patches be sent through the list
as emails, not as github pull requests.  I'm not going to look at what
0xabu's repository contains, but rather at what you send through the
list. But part of the contract of Signed-off-by is that you have
permission to post the patch and agree to the license in use - which
means that if your work is a modified version of Andrew Baumann's work,
then you need Andrew Baumann's sign-off before you can add yours.

Other hints for better patch submission may be found here:
http://wiki.qemu.org/Contribute/SubmitAPatch

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--iNACUHe9BVJjEGQeWW10DsgvKqf2AsCRr--

--DPfjjcQ19wK2mihQNMBcmAl6d2EMNkmG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZHKBkAAoJEKeha0olJ0NqwzEH/iIb0gbYYFT++9USJ+jM5Bj5
HXtxwI5vB3fvVjTxDM34Y+NtrnlUtebna6D57xdhaLQaiakR/EcGyWHhmQ6NbevF
ZlmDpNLqHSAd87ZHJ5gFiFLz9QWxNOTdORip7qdRnxzu3fu4mHvnRTNQ+4zNIIKH
nHxRPDLmg4s6KiSq4s5jPid5GmuKmECiT9eNo+/SWvnpdBOjl7EaR6AujbtI9xE1
4l5IsFjPZOQUBz38EYd1k87jrs2NAv4lMuuaV5VqPR/5VElTgWb5611Q77wEQx3D
4inuMiLhcs1btvKuAxuoWX76NQnnFo58OeRgVOZKXA5Fzxi3OX9QOEh+tcPESOg=
=MTMB
-----END PGP SIGNATURE-----

--DPfjjcQ19wK2mihQNMBcmAl6d2EMNkmG1--
