Received: by 10.25.21.156 with SMTP id 28csp1247299lfv;
        Sun, 10 Jul 2016 19:19:03 -0700 (PDT)
X-Received: by 10.55.197.149 with SMTP id k21mr22567023qkl.89.1468203543304;
        Sun, 10 Jul 2016 19:19:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b63si1567596qke.125.2016.07.10.19.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jul 2016 19:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMQoI-0002zj-PK
	for alex.bennee@linaro.org; Sun, 10 Jul 2016 22:19:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bMQoE-0002zA-BH
	for qemu-arm@nongnu.org; Sun, 10 Jul 2016 22:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bMQoC-0002Gf-C7
	for qemu-arm@nongnu.org; Sun, 10 Jul 2016 22:18:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bMQoB-0002FL-Vs; Sun, 10 Jul 2016 22:18:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rnpgF3dNJz9t0m; Mon, 11 Jul 2016 12:18:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468203529;
	bh=nUGKUunY2rNHBsVPrYD9aOp28RUKteirJaoLwgLYmSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1lOe9fNYFsS4jqya/0kKg6NHhR1ewqGU1UJX3TTE9Ejp5AkbgTEoc+eeFWZdr2YZ
	jbazMI+Y9kcCgHuo7R67X1jkHom0fPikun5/YObTtHtpyTot/7inCPpUftcYejGaUa
	pFO+VR1gYPhgQaG8zeG6Vv+WNycOAdA4VsnzEIsE=
Date: Mon, 11 Jul 2016 11:57:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Sergey Sorokin <afarallax@ya.ru>
Message-ID: <20160711015718.GH16355@voom.fritz.box>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
	<767251467993130@web25h.yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mhjHhnbe5PrRcwjY"
Content-Disposition: inline
In-Reply-To: <767251467993130@web25h.yandex.ru>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2] Fix confusing argument names in some
 common functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5InOI5D+MhHr


--mhjHhnbe5PrRcwjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm afraid your mailer has turned this into an unreadable HTML mess.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mhjHhnbe5PrRcwjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgvz9AAoJEGw4ysog2bOSpO8P/RG3lQYQKFC2PI6TbAR4H96R
dfzctF8QT0lBXS1jjdQOVNrrxWt7NNT8LULHIHmtztB4ZKQW+//dFvfnKAcacfzN
mZLycpoEa/V4McTn+KWwm3YcMXX5Aev/bSmvq7PleQ+veCUnUHQdS5WP6Ak3FzXv
++u4GiuhivoD3jg2kUaB8OttgMGKxNnAKzUtsZkD/6Yn1yW2/iZaI3j3N3AtzTf3
5E37a+cIQtUQiG0WmheDQv93TsyPLurwC4zWRy2dfGloU6Lrxmk9YgYCN+41Ipn6
sNR3OjkhCQ4fwpfluVtqf4UxKlez+tcYDGCMjFRQKrd45O40XnC/BTkmpK/gnGOk
RXIIjN4dA2ByeG1SkfimVk0gmP9JvHexbOu13Upn3FBAcuTQb9Zz2EJGzS2d0Sad
pgFEu2sxQBRTR20wfQ4vKxeM4NaR2XRHiph0hzAsdhON5suKSEzf1e3CvAeuMtVo
yAlU+Snuzas9zmHO9LWcop83fjcWEpDZWqhTBkdqK6tFNltTBnmbW3KmW+601A/2
SqX15pjc+CM4VzrC4BdJmKGZAIEuAQB9kek9DmI7i5M4G+cghKUpU3yj2fySTU1u
C6WviQTWmU5/71auqz6qxvOli5MPzoN9YxsIDBVklg4Lkgi2YMQ91jQFDyAeC9rG
fcf0vPETCK3IgnlAG//p
=P4CZ
-----END PGP SIGNATURE-----

--mhjHhnbe5PrRcwjY--
