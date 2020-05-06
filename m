Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1240180lfb;
        Wed, 6 May 2020 11:28:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIiAscM3Z4Y0cE9r8AsgSsymMNQsMRU3k3L6epeTkgi293DXR6iHJoMHJta+tJhMA9fMH8c
X-Received: by 2002:a0c:bec4:: with SMTP id f4mr9528840qvj.26.1588789705812;
        Wed, 06 May 2020 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588789705; cv=none;
        d=google.com; s=arc-20160816;
        b=p3D3EnDD0nZjzrbq4bRGZACrUlmJ7PvzmUjl5SI8Ckm59IxvZ4mZz1WwGmTiOR5PFf
         dvevrmDT84wrTHv8EHKFMSH79EWPD5gzKba6yc2Zh2+tg2kinV6KsnLWrwbQ5AsDcktR
         Xq3Mm4BbvbAPP0tC627bFIqmyVljKLum004gWGuhK/6L9AcCRmPHOlyW2cn9JxXVbGwj
         gtGgjCYvjWXc5aC5dSUFhryvj5SUNQz1vQPqwLXtf3p29g6in2p5RtnmWmj/zgiNMZYR
         9NaFpHgrRtdb8R3Gbs8TJFmGtDzYkWUHwZFHxIJYnLpNa/ohdG2RhLnuTJal0Gze8lKU
         kksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=AX7UfPLCTkOWi7qZeHN4nqghVrbz9XIDaJmmCTU8fsg=;
        b=wFyMNrQH9bVB1GkS+/dXlhxP1aYwVU0UTtdTwBuEtH0I8ELJwKz0IvI/8DOmjnb0bx
         Hm/Ckueb9H/Zhb4PG7KpUo+XX8lCwVDtpAD1NM+2euazro7nIouBL1XgGghJy4NuYGIF
         yNXbM7nfY/A8W+c6v2Y8PVQ0pCBts/BvzZMxnbQgQCfHROqauuBqa7Xpb7bVra84HvOs
         ZkCKAL2m0Uzg7rlKBvk57cYKeFR+VC3RJAePFECkXeOQT01uDWsY+HzFKZ7Ahc8ltwfB
         qIxDQa8kXs2yPfqPiQSEKBelbw9LnBdJXzyCoo/qleVhpxMiDP31rkLU5Yd38SCnX3yi
         ulVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=B9IPoh76;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=phCOjsOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j47si945762qta.346.2020.05.06.11.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 11:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=B9IPoh76;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=phCOjsOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWOmP-0002jW-7m
	for alex.bennee@linaro.org; Wed, 06 May 2020 14:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1jWOmH-0002i1-AK; Wed, 06 May 2020 14:28:17 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:52769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1jWOmF-0000mb-UU; Wed, 06 May 2020 14:28:16 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 54BA85C4;
 Wed,  6 May 2020 14:28:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 06 May 2020 14:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AX7UfPLCTkOWi7qZeHN4nqghVrb
 z9XIDaJmmCTU8fsg=; b=B9IPoh76L88RP+G1BwXWwXjaM8oFIGYQQdkn458hx0i
 SNguNpSZNCSpql4GxDoPRMMKecnS/yRP+b1Kd0BF4rFIbaxCY9oHjZOhUVKLkdET
 G4NfAAF5I5Jo2Un68ue6TE+uJ0vbYbOT/fStHVHwJVMDfnRfnEXQU5nKUABjHd6b
 gXUHTvbGnMsDDi9hEpf+lGVS5sdSLwZ1zRGbiagqJB7ziwIOtPuNJazO0JRiWRL2
 x02knD/L3TzaVzE3r2YpycYiYPzGOggxcCJluU5vCaXapZ+4bHMYf+zg7I8wP6YY
 rucadQ7Yw/FOFwLlh8oY4c+Khq597JMa+lDXk9mpnag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AX7UfP
 LCTkOWi7qZeHN4nqghVrbz9XIDaJmmCTU8fsg=; b=phCOjsOAbmsCX6VSdymIIq
 vfy2fJalfcV6XL7dMmiFa1rV+DnUluCvk5u54Ur/ltSBerYMEgA+JE74qVct+4RJ
 qwxkDc1egCpoAdw8dROmWhCMmOufutuDiAsm6CvFbcYyAcXhVVFYmvTmXIbl7blW
 nbdjhXoP2il0L7YkX4m6tN6L45lwMG6b2waB0ubYbgaFEk66iENWiZ0v6QWtn6yB
 2seugFQkYzDFcUl+nutmYpO5v+h6ebGas34FSZOaVPHhWYfKCk+UpTU0G2RLWv8t
 J5gCuJwB0fT4TtyqRgBOLCZAbXo79Lr+zzrKFVI5kITj6aYYPMzl1vFFTKVUc8Iw
 ==
X-ME-Sender: <xms:uwGzXprbHDNToNM1CODxM_w2JKeBuJ8iV5wYZAi7DWOSTpDpDm-QGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeekgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeduieeirddujeeirdduvdefrd
 dvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:uwGzXhJzGPV3j8rs5iKOyfL-kvWhKkb9lJLgKeKWnvRmnMvfEVrNfg>
 <xmx:uwGzXlT8YS4q92TWyOTb8gxD64bHSX2LkUtKAeJltv-5c1h5LkWxoQ>
 <xmx:uwGzXpP1dAcUvvM85oEyuXYg5Xi1Dt-M30ue1WTlmlKroN0n6YDsAw>
 <xmx:vAGzXsOnqROJNpYXdT69l3NHhjXBGQWiUUCTEzUPQGDfdHz80b78Iw>
Received: from localhost (mobile-166-176-123-220.mycingular.net
 [166.176.123.220])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68CDE3066118;
 Wed,  6 May 2020 14:28:11 -0400 (EDT)
Date: Wed, 6 May 2020 13:28:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH v2] aspeed: Add support for the sonorapass-bmc board
Message-ID: <20200506182810.GB4865@heinlein>
References: <20200501113704.2240698-1-patrick@stwcx.xyz>
 <20200506173035.2154053-1-patrick@stwcx.xyz>
 <BYAPR15MB2823122DCA19E2E831257DD6B2A40@BYAPR15MB2823.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <BYAPR15MB2823122DCA19E2E831257DD6B2A40@BYAPR15MB2823.namprd15.prod.outlook.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=patrick@stwcx.xyz;
 helo=wout3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 13:30:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Vijay Khemka <vijaykhemka@fb.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v0dG7XRMyaCs


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 06:06:34PM +0000, Amithash Prasad wrote:
> >> +=A0=A0=A0 mc->desc=A0=A0=A0=A0=A0=A0 =3D "OpenPOWER SonoraPass BMC (A=
RM1176)";
> Open Compute Project?

Oops.  Yeah, this is not an OpenPOWER machine.  Will send a v3.

--=20
Patrick Williams

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6zAbgACgkQqwNHzC0A
wRlzqA/9HhZ8aBxQ4OhRfbLpZK84Ug0Sedqy3WMpjItQFkpNBW9dXriq8XUy9Lkw
12CkF0B+UA9yiwliSBakzzvE2NB7aONsrJEyjoLCfUErVQnb0Kpv2T1EU0QyUVvD
5yKujT0ofSP+WTH3cmF5IX3/LlW7Hk0DLbUZtMMzWk5uCGp8nYHw4HFW2Kd0U6sW
F2w4H9lmFK7u2SIdSCwvOs8IsRKyAhvZUKyX+YmDHKT22kJRe4TrGIre/QtSCTvx
7MfBuxoic0sxv1902e5xaVv4ilvLs6Bk7MxCfcZe6EkQfXz/mZE9U9vO4sCjxUdQ
+qvM7oZje7OJ8ymzzvTvSVKQ/5KauwMxz+GKOmicMrZ0RCfu+iD28w13eoRWXAii
iABRZr1iWHrcHAvt9sZIEwyBVPYsf76D226WaCOjU0xOPsm9Gae+oXyqSBS+rBOQ
g2vZZWlR3SweHzCUg/0woF+TsIfgWYZ/nSLIApd1PJ05zMgE3GfGlbLTEC1BcsMI
pvJFKXW3/dCIc2kKyUA963DsagE5rKjig7QuXDI0PXL8ws6ry+bmRn1raU6/zjLj
ERn76h/peVH1uTAF/FHollZ3v8tASDn5YkgsdkftRMp2kNEACFJX21pbSFryWlOi
BqoWBAIIy25eycBqR06XcYz7+14LSa1XzkAUc3JnK5EaCI6W4R0=
=13rE
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
