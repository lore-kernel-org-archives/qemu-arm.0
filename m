Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp782523wrq;
        Wed, 13 Jun 2018 07:39:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuTVSKyPJFYpQr1rkToUCWqmrQID3i23ZPnEOK60Fj0TqlO9w0XFJXIN2IFqytCc6vS1rb
X-Received: by 2002:ac8:2485:: with SMTP id s5-v6mr4729966qts.350.1528900755370;
        Wed, 13 Jun 2018 07:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528900755; cv=none;
        d=google.com; s=arc-20160816;
        b=kSfO2z0GVQQ16CcEJBXeXEfTw9rpzxzjwXIdqgp2E46ErnxD+qRCP1i1SMa6qhnjcf
         cWlR0obFXJa6+YU1OkisrZySEapxyvZMg3dIloVLprGmw0ekOWho9CipNTZU1xawVDYV
         S7EJvQin7+UPUM7T2DN7ov3QoVTY8iSUjAUIy/x1jlHC5tyNWWlMzB3Veu9r15pDdFBd
         XU07idvuZQUbuHKJXkDOEDH2N2HQz11TT7IDv+kbGUeH7tIza+FRDfKBUZamvMi7grs4
         EBlNrQlVlkotEXEsTkyEegDh0fB/BkQxWYVaHiWyGGlpe0srk46VfZfWr1mLaxueuvfl
         rJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=RKaHtYpQ7znZEISCFjsn1fhD/r7pOZa5vO3Gg1zhny0=;
        b=oZAp3X4h0Hgm7nBtE7F8viBdoTrQlxPnPDAECKsLYCNFcBuhVKdu5HY2d4gMWthtnz
         GrZ6QIg7j3nqZp2KqJFVqCCAPJa8KESfSZVpSaqSLDe0m6ZtQTm0rgYzZwUAKd7J3PJ4
         b3y4lhOgZ/hfEqfmVg0dmSnhH0+Qu53RYRgc+CnEkx3GJXnvouUzTMzvjMKGSGidkvaS
         uSTvS9gGL4XlMxhRTqV5LpxfTB+cns9UlKQChLMKXc7D45K2JVFJcpYL8ZgG4cUDv4ea
         zEYLiPHUFUTXVh/VFQ9btHfAQTf1WAXV0T4CqJ91fvTlk4PIKBFBf+QHgm7MMEHY4XNg
         MICQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e22-v6si716941qkj.71.2018.06.13.07.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 07:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT6va-00070z-TD
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 10:39:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT6vO-0006za-7C
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 10:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT6vK-00018o-Qq
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 10:39:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58234 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT6vK-00017b-Lt; Wed, 13 Jun 2018 10:38:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30CED818BAF3;
	Wed, 13 Jun 2018 14:38:58 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0D20178B8;
	Wed, 13 Jun 2018 14:38:57 +0000 (UTC)
Date: Wed, 13 Jun 2018 15:38:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180613143856.GY24528@stefanha-x1.localdomain>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
	<20180601144328.23817-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lYVfafuUkPqz/tKz"
Content-Disposition: inline
In-Reply-To: <20180601144328.23817-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 14:38:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 14:38:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 1/2] stellaris: Stop using armv7m_init()
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NM4c7mgwhYy5


--lYVfafuUkPqz/tKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2018 at 03:43:27PM +0100, Peter Maydell wrote:
> The stellaris board is still using the legacy armv7m_init() function,
> which predates conversion of the ARMv7M into a proper QOM container
> object. Make the board code directly create the ARMv7M object instead.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/stellaris.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lYVfafuUkPqz/tKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbISyAAAoJEJykq7OBq3PIC/YIAMlH038PrZW0uS7wt54qFRO8
nKuVI7KZD+IJpd7hzSBB5/DBFGSUQAYDCkX/npgb7pjBakV9dDLNqQiik1ft7RCR
ZisTHOJdW8brAPT54WUTm7DRbsznDnRoZy2WdABSzAkM+Loz+nOr47r3lJdXiLr0
WJWvWpj5/StzobkZJTngkLJv725+A2Ncy3bhokQPRks3smO9MG1j78tgxTqA1Zrm
Fkexnje62vv0cgP1PRwaieyV3h9lT2a4JRoYVbtWgxyU80BO8/p6ZOuk8XWJepfa
Y4koRvGQYDjsoCCeo1uRuom0ebLIcrZuFV33bX1LaQcYsNFzpo2E3WIqNjufjjA=
=+alR
-----END PGP SIGNATURE-----

--lYVfafuUkPqz/tKz--
