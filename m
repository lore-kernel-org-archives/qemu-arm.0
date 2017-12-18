Received: by 10.223.159.74 with SMTP id f10csp2783960wrg;
        Mon, 18 Dec 2017 07:28:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotz1+TtHkup5Zxhnu1PpJohtavJDSI1nUMijHT6WJ+087LJuBUpaww42r7QBGWGuiMffplU
X-Received: by 10.37.183.136 with SMTP id n8mr132117ybh.40.1513610911537;
        Mon, 18 Dec 2017 07:28:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513610911; cv=none;
        d=google.com; s=arc-20160816;
        b=gDt0tpP/OIbv2wzzkQweoB+LAJSBW6DUvwdbluoBMyTBx8uDP+/bEiiXLERcJzfCBN
         Ov5IwExJbq09Cfv5lcwQqlQDUWufddGIHA27KNic4BPlDW06NfPTNUZ/tDa03KDU3pdF
         UtGO262RMAVBZkVAehOmpSwNrWmSd4C/aP38poAmPo7nGg6lH06U4Ub//2A45x85JcR+
         QDb3sX7j6Jflv+/yZ+viJrbZ+5Hs+fd4qOq4LxliDfsU5p2zmcXo+EAT07o0u0126jjF
         4lwSK+rWPj6Sg2jgfIF4N3TJ2D89lGoMxeIvV0KhZWrzLfYGOXBlnSWc0zt2ynnlOdA8
         j3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Zg3fZQ9AXGMhvgu+PzIAeQKMFmcjsgdEsC8VtmFSeLo=;
        b=j+xItVA3JWpo64DN5hE7HhOvLq4w2QOuY/GbJru3rTIKwOjDO/4IwSiFPpUMYR/myb
         ctitiiW63eynDgt1frB9CE8V+tlchmepRXvteT1FUmtFViCAPQc3tgNuZ0oj8KaMs0sa
         Z2pRO2KKxSu2ZdFfG8LkklYLm96w60V9DKL6IwcooU5D5twPq/qd1lzrsgmpr9/9V0c7
         OBROVOmzUvbFSCAPhtF/7g6PehJJEWp8R9tj/aJvF83wJ8m7lmLbaADUJvBTgB7aBt7z
         /NF5Uws1ND6Y7jnSurLnfcoGvsaGkH3TaVvdYju7947TPrr6b1mqbDxwIARGzMIoS2Y+
         9yUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29si2484562ywh.547.2017.12.18.07.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 07:28:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQxLC-0008LX-VQ
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 10:28:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQxKb-0008FE-FL
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 10:27:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQxKR-000202-Kx
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 10:27:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eQxKL-0001tq-9W; Mon, 18 Dec 2017 10:27:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60E4B806AB;
	Mon, 18 Dec 2017 15:27:36 +0000 (UTC)
Received: from localhost (ovpn-116-227.ams2.redhat.com [10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2D7C69297;
	Mon, 18 Dec 2017 15:27:35 +0000 (UTC)
Date: Mon, 18 Dec 2017 15:27:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171218152734.GP16653@stefanha-x1.localdomain>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-17-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jXoUnAu9pZeaHebo"
Content-Disposition: inline
In-Reply-To: <20171215031547.31006-17-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 18 Dec 2017 15:27:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 16/20] sdhci: add qtest to check the SD
 Spec version
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4xCWO6gRB4a6


--jXoUnAu9pZeaHebo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 12:15:43AM -0300, Philippe Mathieu-Daud=E9 wrote:
> with check_specs_version()
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/sdhci-test.c     | 74 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/Makefile.include |  2 ++
>  2 files changed, 76 insertions(+)
>  create mode 100644 tests/sdhci-test.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jXoUnAu9pZeaHebo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaN95mAAoJEJykq7OBq3PI7uwH/02/UvWBSHJCYy2Ivsgj5nVS
7Z/Cr0YHl7Z7PgMpwX1IGnYaLf3/R9GDBFQh1wqZ88k4yCkEm/UG2bu5S2yMiM/1
AnItQYhTjHy4kCygQONq2fm3gRrHvSarYW3jv8D8od93zOejDawCPDlizcHbn90i
rMwtxopxetdaP3wxS1Zh8kJqvCWFBi+iTKrmWzkoP0MMpcGy389GFuwnGUJ5YADk
pvIYdv+AHBa4wo8lJF9qTVR2gl/OmETnDPnGY7SKJ84+V+kywX6IRw3GQXKNEcKq
8xQsiDcB9W1TTbKH3Gts6nU50egw0o7FEg8S+EUyaiEfbdA9hVZfgviKiSFsnpY=
=ZStG
-----END PGP SIGNATURE-----

--jXoUnAu9pZeaHebo--
