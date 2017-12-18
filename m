Received: by 10.223.159.74 with SMTP id f10csp2890309wrg;
        Mon, 18 Dec 2017 09:07:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBouKOiLGQkPEMzIzy06YFrHPRRRlFMXoBZvvr8QwOTRZIdojSFi9j0jQHflgMe/v4VWQpK2I
X-Received: by 10.129.193.10 with SMTP id f10mr373990ywi.112.1513616845233;
        Mon, 18 Dec 2017 09:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513616845; cv=none;
        d=google.com; s=arc-20160816;
        b=fpFKz96qG/NfnNM7f9VLFSJtV3ho0fR+lzH6/frpL/3zZ9HMEiZvcTt2dGURTrEK1S
         aoC4kfWtHwm5eBhao8ktsTG0EaRN/c/D1hGOpIqgCE01VfEBCMdAZTWdry2M2KBbmUf6
         NXNnheNN2P0HtB920VTVKmEE0kNHYZOlboK65oeQ0ti0HwI6IaWMQ8EZ3wjDXcyAK7eH
         Piu9nJ+v8BtcUA2DpQ5YYc9X9mxRpojTXxMsXo5/d4iJ+wShby+VsyNCLrGvy+M9s4lb
         SJswcN21tphKCNPLPcvX9xdIaNiXmjcD5kyGinl9iiq/V3CbJ/R3zlNFcKUTM9zL8WXp
         5jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=3uKYKCgeGRy90OsFY7w0zfEf8mN9rQPx3afAZRbGwpA=;
        b=WlEn/WaLTQBKfPs+5RYkAWXblsR6dfBAZfCThKY0kPgYWBcMAtRphX3MSEfTBeHDnd
         Fa2k9Sv7kmOAiZ9cYJx9A9z5xV/yjtmE5XsGssTVANz+/sGVJLpB7hBXriJPc0C45OmZ
         pRXW5msT/eWvZQ11a/gqJMcyroj7+lnvlWQMI55sddvRDfqJzwLgboBCqitB++MYjPK6
         UlYA2PDTuvnxd6mB0yZT6aIfTwhdGrEZlRoaJMACwtN4A64NDsyF8ikyc3Q8E6/k4l7N
         bnymx3lDE5eVYcAPVvrmK8JD2kiAXHSlP0vRRolVMZM8Fo84qS5JOVUEV/CaGKscQRIR
         04Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k191si1310767ybk.97.2017.12.18.09.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQysu-0000i6-Mo
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQynI-0004AK-5s
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQynH-0001NN-Ie
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eQynH-0001LW-CA; Mon, 18 Dec 2017 12:01:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56EE025C4E;
	Mon, 18 Dec 2017 17:01:34 +0000 (UTC)
Received: from localhost (ovpn-116-227.ams2.redhat.com [10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E993C7F78D;
	Mon, 18 Dec 2017 17:01:33 +0000 (UTC)
Date: Mon, 18 Dec 2017 17:01:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171218170132.GT16653@stefanha-x1.localdomain>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-21-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dBMBt2YGaTHbdllf"
Content-Disposition: inline
In-Reply-To: <20171215031547.31006-21-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 18 Dec 2017 17:01:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 20/20] sdhci: add a check_capab_v3() qtest
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
X-TUID: huUbzkZqmMXN


--dBMBt2YGaTHbdllf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 12:15:47AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/sdhci-test.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dBMBt2YGaTHbdllf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaN/RsAAoJEJykq7OBq3PITwoH/RFTx27aYr2R/ixEbtKur1cJ
DsZHrFkydQMX8AXqpEftOqkcnBAxhwi3ozm+4YvXzM7YczzSiudS6P8fRhGMjGLg
m3E/9KN3ztRqM2vdPKih/Xzso6HkH4VFq5+fL7FRQoss+R8g+bfLZsHJtk74I4mX
kdHhtGl1jBjoMVsiDmJpCQ59BEiQ9yXV9CFclYz2K7819uBoLCj9A2Si0DmTrvpW
BtS7VguxAYYM9qzGhTidwSPUszGHlKARnP54td3Viil+KKoFuqWcvMYF+MWoXzMr
orB4O0FDcB/t5A19tJMJQMOPcfjjrlonWh4GuFUUhMshC2XtRsK+mdRY//mTmlU=
=rn3n
-----END PGP SIGNATURE-----

--dBMBt2YGaTHbdllf--
