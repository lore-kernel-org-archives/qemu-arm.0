Received: by 10.223.159.74 with SMTP id f10csp2884624wrg;
        Mon, 18 Dec 2017 09:02:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBouEVuk4cbvJ82ViW+/Nc8FpFpgiWi3ANnrwCxdhWEE+fmOleLz9p9fs1qVSv2BD3/6PTRg7
X-Received: by 10.129.93.6 with SMTP id r6mr353235ywb.95.1513616569453;
        Mon, 18 Dec 2017 09:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513616569; cv=none;
        d=google.com; s=arc-20160816;
        b=ked+hVsiDG2T/84JNa+oJRTJR9Qg5HuRGSamHtAu86FmDL+Vbq2tRB5p0OIxG+RoT6
         OLMRRFXO5Q0G6SvefSlocNX6ogTw7JeciZfWTm/3J6XYfKj/l6GcTAhGgWbbTKpmrhVj
         joAyI+i+ygjze8bn5hd/h9Iql+Ms7ayHKoijz+HvT9qfx50Ho+/xy257i5pJ0VRiPK1i
         s4z3AnZcL+830oneHRZn8mMrCSZ97RM0JRGhaRugQKhZYzWJkZztSP/TXzi+xNx3wH4r
         d/ltzTcSCoYKKfWZHlD0yPK3LiJW30hB9WBp4LqGh/9Xc0p+q84pGGTGIRBDXujirpdO
         fKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=kEQacy1v8B4oB/uYFOnDlXkCbqErmgylu6hxrILtWvU=;
        b=lGuHsq2V+mRE6Y+aGTwW9zkqfF0vtrTqWQBVKLQnvd8GvHcryTqrRMtAW2nHE3t8DV
         i6cysh/2DJbGkpygKODkHYv5GHyxUS3Su+IiP4e7J/iiZc8YD7zyG24UiGs+hHw/JJ44
         zCBMu2jbYbVAtcEIvpO+BUIbTAC0zCbsmYhvdKM3GaETRIWh81pLGWcX7XHRSXWOG4QF
         1zD2/aX/9pGJHALmlfZo6gK66tPC5JHAVUmXYKOc7NEwOGhw58QvSXLwpPIOyagzCB9L
         H6xVEWTyrLzwJiITo7Y+NDHY+ZacTaMALWKD0nOHJBq0SlgSaXjNY9711OM0MOGyeNVz
         swRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si2487922ybk.336.2017.12.18.09.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:02:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQyoS-0004yX-UQ
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:02:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQymi-0003dE-63
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eQymd-0008Ai-7m
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:01:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eQymd-000893-10; Mon, 18 Dec 2017 12:00:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 107ED2D269A;
	Mon, 18 Dec 2017 17:00:54 +0000 (UTC)
Received: from localhost (ovpn-116-227.ams2.redhat.com [10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 953B918823;
	Mon, 18 Dec 2017 17:00:53 +0000 (UTC)
Date: Mon, 18 Dec 2017 17:00:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171218170052.GR16653@stefanha-x1.localdomain>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-19-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9uazBBczf8QSjDPd"
Content-Disposition: inline
In-Reply-To: <20171215031547.31006-19-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 18 Dec 2017 17:00:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 18/20] sdhci: add a
 check_capab_baseclock() qtest
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
X-TUID: RlMY5Et54+Cp


--9uazBBczf8QSjDPd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2017 at 12:15:45AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/sdhci-test.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9uazBBczf8QSjDPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaN/REAAoJEJykq7OBq3PIAQ4H/Rzdv3xXGy7hK+YmAD1nxMdn
Mf73YtgxYHNlQ0Rs9x9oPX8uYAQWC5GKTJSEgz+JYTUcF7P1Yy6BKV/cgbJti/h7
KUsJb0dcD6vvuyVW2v83tgokqP8qxCov/vB8ud+30eCMBJn49jWJXtd54UJsndLM
29yviAgzRVXJ5JB2XT4Y6NBzLlGzVEzlCgOwWqUZzWNvn8ob5MKcT8eJKo3AxHGG
YGTouwY343F+R2f7sL79qPmHzSql67vN87+VFioqFChV5+Qjmq/ZYNkJI4QydNlh
qqkPYdzAgfMqDIjLYaCzcURzrua1rkdlBiG3l3gT1DgfR6pNwDNiBoKRj0tWUuM=
=nHxE
-----END PGP SIGNATURE-----

--9uazBBczf8QSjDPd--
