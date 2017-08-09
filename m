Received: by 10.25.221.202 with SMTP id w71csp512918lfi;
        Tue, 8 Aug 2017 23:39:24 -0700 (PDT)
X-Received: by 10.55.92.199 with SMTP id q190mr9023800qkb.127.1502260764368;
        Tue, 08 Aug 2017 23:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502260764; cv=none;
        d=google.com; s=arc-20160816;
        b=T8H3rLTAgbZY4R8VQQHbwcxgV7Hk3YuoUrxvcWcown1Jo2TjrXGcvsUdHZPi8G3xRv
         8HJFBfntv1zbYXp+jRBD5d4mZoKNU5Cj6YkNBewzFT3qB0WDq+AePBebpYlQHsWPsEqB
         KrAFDjmq0K/7jYPNmKnPgieLGMeDyCVpv7BAMh6GdWlmAjkqu5vHUl3PnK8N+Bfrcqnb
         ouLUb/GEXJEpK3RL56p6Aexf7Hy2JoIacdCluuhJq7tEXuQrePl/mW7wMvrOhp79S21+
         lwgT44jHFxvRYWtRmVkejioWruS3cBGzVUcAfJrnfM3k/wQZs3TiUstY3YDSZ+lcPXf1
         u0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=fccj3QHexLSa662Fsy3J4criB8vmHNmfWeTGXmsmFhU=;
        b=YSEGdZRqyTPFEplhtwKnDkfNvQMgAq1WA+fOL7sFNf680fRbkuJg2ZMEUys0Q5enyr
         d0k0tkrwG8btIbTPR3uyXxVzMnUIisJEn7fw7biEKu2jbaV7R2pkB1bdOl+72vN86si7
         WCQ8vVj8uo7/S2Kpwc4H5L6R8ydaoT7CrX8PwmevtzBhcZB90bTRXWskbpYbG3xwE34m
         41eM1STf8CX2MeqAnYlHGvAed02EEsmmooZ7ugM+myQtIgMQEVgfqlDF2vYyblTvmfcm
         BEkSxtuqfi8qrcZa8saWYb3nVGeFUP0TeqZSWVR8TkObfiESfZcTRn4mzs/IgbcKJZmf
         nztQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=AA4XBctT;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=p6pixRA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si2536398qtm.509.2017.08.08.23.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 23:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=AA4XBctT;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=p6pixRA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfKeH-0001PF-OO
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 02:39:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKe9-0001P9-Cw
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKe6-0005RQ-7l
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:39:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55525)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfKe6-0005RA-2l; Wed, 09 Aug 2017 02:39:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9243821C22;
	Wed,  9 Aug 2017 02:39:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=fccj3QHexLSa662Fsy3J4criB8vmHNmfWeTGXmsmF
	hU=; b=AA4XBctT20L+J7MmoIyjMo3iMARE6zZkJ113gG94Gsle2gzinNOonl4P7
	NISSWN1kwxrKt8nb2y/cWDKtx10Wei5tdgiwy4gDmgVdrXTHPf5y/9EA0CDFIu5q
	f3zxZ6/w/kxV4KHQ1DddNaw7mMUei8oQSvHUwRPC0jabLLAjOuaCbNnBZctltg7e
	hgWGCotadWAQk8jUI9s/hF8USN1omhd1NFZFJ8+uGPhZQEps4sSb3sXnYcsXIy1F
	3R0bOSxRQsY4zKNJZKVsp6fjZdlnVFXs3NEdRv8BtgYuUsczdrrh5iBiHNpcSvTG
	LK0J7h46lF7v7p4a/HQtZPoshOUYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=fccj3QHexLSa662Fsy
	3J4criB8vmHNmfWeTGXmsmFhU=; b=p6pixRA7RYckcm4bK40ivKtkCo9FlNpSO2
	OsHw7rI93X+HTAxQ5ohmvXB6PArroOBiGVfSPkUoEk+FqlSsxS9FSfMx9S4aNyY/
	5IwaVTV7sa0mHIx5gNwVjQYdE5tPzB1+VRqinfxgQ5L5KmBuzvMmEO8/ggrTo50C
	ZRok3yjKh6fPfXCELYP5dDoCX9S4rrC8mkpREdLQmwj6kXMkrz5YOxwhTIr6nSqJ
	kqEFbwtZY2a8w7BWhe9QNz5d2LNj2YY3+yJnnM+reEF7VnYsomF4qGEbB1T+xQBh
	CHuYqIRAXRGrLGVe/7Vl6F/+VIKgylUjdp2wfdTlyU+hUoLY1PKw==
X-ME-Sender: <xms:C66KWenxXf1RCk3mk1li-wjIZjgoV8SHcIiJTEhnn9vaUHj__8kB2w>
X-Sasl-enc: qcrieKU9CsN922CVtMCUS8AHGh1Cim7WQEBZT7uUgiv3 1502260746
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 43E81244B4;
	Wed,  9 Aug 2017 02:39:03 -0400 (EDT)
Message-ID: <1502260737.7946.8.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Wed, 09 Aug 2017 16:08:57 +0930
In-Reply-To: <20170809062828.3673-3-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
	<20170809062828.3673-3-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8XhJjBNpGSdVp8W+1GiW"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate
 silicon-rev to watchdog
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	openbmc@lists.ozlabs.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +C8tRrnLuc/6


--=-8XhJjBNpGSdVp8W+1GiW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ugh, disregard this one; I changed the subject and reissued `git
format-patch`, which naturally doesn't overwrite any existing patch in
the output directory and so the old one got sent as well.

Andrew

On Wed, 2017-08-09 at 15:58 +0930, Andrew Jeffery wrote:
> This is required to configure differences in behaviour between the
> AST2400 and AST2500 watchdog IPs.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0hw/arm/aspeed_soc.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3034849c80bf..79804e1ee652 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&=
s->wdt[i], sizeof(s->wdt[i]),
> TYPE_ASPEED_WDT);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add=
_child(obj, "wdt[*]", OBJECT(&s->wdt[i]),=20
> NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus=
(DEVICE(&s->wdt[i]),
> sysbus_get_default());
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop_set_uint32(DEV=
ICE(&s->wdt[i]), "silicon-rev",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sc->in=
fo->silicon_rev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->ftgmac100, sizeof(s->=
ftgmac100),
> TYPE_FTGMAC100);
--=-8XhJjBNpGSdVp8W+1GiW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZiq4BAAoJEJ0dnzgO5LT5tA4P/065hV+GiIoAUi6VRVPPiKoA
KxXA3jfMAELdwniWC2XhCIBPr2pFXMLqLOGTwqRBs8tDR/+RF9/0EnyfxA9rDB2S
PmNyFfHiwmRlDn8nD9Sn7kYzM/JzHGQuKMjlLZHLSfU+B+y8mWUMdvujkp7NoFwx
MoNvJsq9y0eqDUsk4VEZd/MqJNhhuNylLmVd1ptsQRGDpHYSk+5dSvyq2/y4FjRU
OYY/5Dt9m86WA70Yiesyr0UgPaQ2u+/F9hCzienHLwnWgdJGaCVsCbIWQDZ9eDRi
IcpFUhVBcfjF4xwV5U0iuo2mbUBXdPtFU32EJJmVtaSMbD5PpGgFjOYd1sK4TEsu
SLRaQQ8TRMLfXqyS5hlrD3cEmF2aicJFpriLzVFJYFqtb8eX26hsTjPglbQC2DBg
OSyybGeU3YSiZvkzzQym4kktsxgQ1hM5NSLzqlxQjwWfc440fLgkPK3Iq0tNm6w8
eEKFEnfzB41mZ7zgVlJu8wB47ZP/pKNJZuZO8520bSRuiMuUC+NvqWQhoRV707jp
INWX7JDilvqDF/0VpETfEAatslAoRmbSItOrNbxwv6CTzyApmR4tqhbGeH9Upmj7
/t0jH9P4DjC9JX3g94Fz73rVimh0DzhMrcICeWnChqygcIBTo2B1LwXS7oc9W7nc
nQFRyMwa+RWGaFZo/uf5
=sEhT
-----END PGP SIGNATURE-----

--=-8XhJjBNpGSdVp8W+1GiW--

