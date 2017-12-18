Received: by 10.223.159.74 with SMTP id f10csp2884134wrg;
        Mon, 18 Dec 2017 09:02:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBovpct/3hu1c4x3Y4Sj+9Sq/QUHQGhCVGNznDA+1RNCXd3b2k1rz7ZnY49nRtYWKfpffGn9W
X-Received: by 10.37.39.73 with SMTP id n70mr352994ybn.478.1513616551488;
        Mon, 18 Dec 2017 09:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513616551; cv=none;
        d=google.com; s=arc-20160816;
        b=IHZ6AyrkV3EoG2cs5MUp6KInH2DU5zAoNKsyiBH1Z9MghvdbaqNhQWubnY3iEOXq4G
         0IECichfTzBE9L+Gl8MKjBe4aQz2gFBLAx3uYMLFHKtuFJW01w3KWWcg/Htp1nuizWUV
         95xQSBI+T3CGoUyp3+Htx7sFaAbaJu1kwf5RrCh9d0ghKAL7EeQOFk6V4SW5MW3g5RES
         n11RLpBKbOuM32sNjkh3QwMkiDf5gDZLKJi5yvqhWlFAhP4dujZKKr6/q7yJSuxFg4B6
         fhMTr4oqfn9aVGPHqQA49J440GWwvhqVcDFKHVU2ORMZrhQcUNYhRsom3fgc571N9dKE
         XorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=yqpwtRDcC9k98VKa3huGTRCdO409tjNE32Yh8yGzOyo=;
        b=VJuH9ZiZ1aY2Z2hrqJOVyK1FjmfzK5w0OzI9tE3Or6hvHBTvs8w3jQ3nGSCkNlXbrt
         5euOnpULPCHl6eiQNCJc13v8LM/gnoZ5/HTSg1J17pQuKF2c1RFwIf0RCthZmnLxWEJG
         4+Ma/2bdpttzlKinccJY189AnvN/rBNuagrHh1OcK54lm3wKXj+7kEzZYbAfBD1KLbAq
         QL3uX7C7cPfohBhWDHILfc4bj4QeCisnVKVHvr1uLTbCZPI07dGPKtOuBPzdhjsbKt7H
         xgS0HtJKnyo+ndJbvdGmTxaIOhlBusCiiIbD+xvQsk/l4+TwXz1/Xs4vRgNeRiLER0P0
         9ptg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t145si2542721ywe.197.2017.12.18.09.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQyoB-0004lY-0d
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:02:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQymB-0003AI-Ek
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:00:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQym5-0006ya-MS
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:00:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eQym5-0006vr-FZ; Mon, 18 Dec 2017 12:00:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1D54C0587F3;
	Mon, 18 Dec 2017 17:00:19 +0000 (UTC)
Received: from localhost (ovpn-116-227.ams2.redhat.com [10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E88680932;
	Mon, 18 Dec 2017 17:00:18 +0000 (UTC)
Date: Mon, 18 Dec 2017 17:00:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171218170018.GQ16653@stefanha-x1.localdomain>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-18-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eBTWNsZZiigckDWV"
Content-Disposition: inline
In-Reply-To: <20171215031547.31006-18-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 18 Dec 2017 17:00:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 17/20] sdhci: add check_capab_readonly()
 qtest
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y/YRnq7G2tRz


--eBTWNsZZiigckDWV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 12:15:44AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/sdhci-test.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eBTWNsZZiigckDWV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaN/QhAAoJEJykq7OBq3PIp9UH/3fGuMOEB5akGkizycl8k6dx
bG+4Wz6cCXvz5QeYagKqGYr7IXbMFrs/8CSSU65lrwkLjRPUcIHU6BbVRO5tP/1A
DVysv918MyNqckwEnajnxMI5s+Af+hPke41TMEUSv80D72c7HcO8fkIMLt7x+wa6
6i29YuotSffsd5OMqx91fpVXRTqbsWmtcp+YttI4/3v0VJ7GFaL3+a4N5QOQoLFE
GulOo5P6gVWSL2CTxqGU9CadGrVRxBNcvpEs2sX6r4/oVricf5FI7ZIbdSg2O1Br
y3un0aEh7jcOCuvQqozJ2DSRNyu9yUaDbbmJVdnqQ7V4EAdeDYc0PkMv0/EapwM=
=91+5
-----END PGP SIGNATURE-----

--eBTWNsZZiigckDWV--
