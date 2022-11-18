Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp44115ejx;
        Thu, 17 Nov 2022 23:59:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UTlAT+vje0BhkNExT+OoZP2AuQgGqNJioL7b6IUYle6kBARURAvKKeUxTW0ao/5uyjpKh
X-Received: by 2002:a0c:e30e:0:b0:4b1:9f75:561c with SMTP id s14-20020a0ce30e000000b004b19f75561cmr5714433qvl.120.1668758346420;
        Thu, 17 Nov 2022 23:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668758346; cv=none;
        d=google.com; s=arc-20160816;
        b=LwwzafAEgoKAJxDFOF+LlhCJUSwyUrn1IDq8DzGelhIiOaouUuVi4UoPQ3eVfx07Ad
         9oNWMwisWTn4Da2iWsHDKrTDcCrabVpBDuBxwBNy2SFztwGK6ZYnYuTgoRslHcxug+3i
         3OULsxT65UDvpiqzI9wjKShQyhAouO3cpDO8j5tqwA/LRB5qFh30Yaq9eBiYogMnbfct
         n5q7LnJcmevBlP3JBMU+3kUYZpoL3IC/2Qpzgn5k5slw2H2kb/0PBtUM54P+p5vegVbQ
         Qo4Tg8u2UK4exZTw4/2cXOEa4/hcJExWqDGUb+cgWJg7SM7zDQ9olC65I7s0qvyPqflp
         LFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=IFpvRnss92cokfHgBZzN5e63/3JL/0sAKClB9uMwWeA=;
        b=m82JuxNQ6Zed+jHowjKSzgE41kBC1fdPEo5dj2/oGGnjY0UDdbAEI57Uv45lMYRUdW
         aO0qoICf2agiY91LC9wsl9CFeAwKOmx+vY/HYmjXE9m7UIMiPkj9eFW009znvIAWxQpu
         tOfH2ZltcvpRCsVK8JmaldET70mJD63xyFPVGaHFQiDZ9IJDXDP3ADOdoLaUJSY4iYJZ
         gyr/ez6jJcQDuCfEC6z6vwHdeaTX4HI95TDSX4Wz3yWo9yrJZRuniBwjEt5DHAVSrxDk
         9OJqOyvPf2uwweevyt5FtlPTdRs8NxRdvA5wpCeL2OsmQgoMpwvKpVjhhctEIkbb6NfZ
         2+LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=VcoLEiWD;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=JiwwbCGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020ac81092000000b0039ce5fe634fsi1565341qtj.240.2022.11.17.23.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Nov 2022 23:59:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=VcoLEiWD;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=JiwwbCGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovwGw-0005Uk-3Z; Fri, 18 Nov 2022 02:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovwGp-0005Ty-Nt; Fri, 18 Nov 2022 02:58:44 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovwGi-00029W-2f; Fri, 18 Nov 2022 02:58:43 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 838C43200406;
 Fri, 18 Nov 2022 02:58:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 18 Nov 2022 02:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668758312; x=1668844712; bh=IF
 pvRnss92cokfHgBZzN5e63/3JL/0sAKClB9uMwWeA=; b=VcoLEiWDFvYtFfd+nb
 U4cSqSZPvNwSPralinFDis3uA8kvvI9s3RrBkj4bGn88pMxVfMvXLxrwS8v1IAVL
 FHHjrvEukDMUmzftUO/44SqhD2P5kK3282oZH+0kI69seCxfFgf0+91pTwuZQK8o
 fm15rK7pW52ySg3M0aEju+12tNepE8j1sHojjFDImZ6NzE6zUKbbDGYMQrYrgVFo
 hekRypLrAjXMs+FZqZ0C/KNPO8WLA8GbYjbyeTYKNtJ9Vdf/ix55un21tJyPcqTK
 zzj73w5fN9uL9SwM1J2r7O9tkV4zqfA/24BonbkRKCPTQibRrKJK4S4XJGIN3Rth
 lkiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668758312; x=1668844712; bh=IFpvRnss92cokfHgBZzN5e63/3JL
 /0sAKClB9uMwWeA=; b=JiwwbCGsmdTUl3p38Z0QFLyM1Otl/U2rsfcq3/a6ni1N
 /o8ryvx2TstidFnsrUXTIUvwQNVNKk03Ecm0zrsMIGFpYllSmhxRlleyjxMfuiLQ
 DpWw8InyN3+28D4UPvPedsru66om3gxiG/T79T+QbaTPZTBve/80RxVucIK8TZKC
 9qi6L3Ct9h7aHJGzHmNK3PzXp+D4PADsY2RNYIEAfX+l2NXZ3mPnN8imBZEtDTwc
 sWZqmHIvPfpiW1jhVL+aFgC4jn0VppRsqIJjHhmmGjUWqOKo8/7yeFEiFyssGcV4
 3N9peLyXK2Sv33URvcrK4eCjjMTxruvhRClYBXBAHw==
X-ME-Sender: <xms:Jzt3Y2BvIhoV7Hb0QwpcRNq4HqyJ1bCH1kEDY8P812ZtI5vfVFI-uA>
 <xme:Jzt3YwjIL0VQrYE1kfPnRmtiXc2v67pDqeE6wMJiAziZObezyJRu1Id6SE0kB7LhV
 1_YA7ce2bZU0hqRFYs>
X-ME-Received: <xmr:Jzt3Y5mzz7Ex7l4Aox7SAEdgh2QlYGV4rLfBfoQVKTln3UBV0GwMP-MpTMC7Z1dIEKOm1k9RyWr9hPe6l1MiibznvUsvHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeelgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Jzt3Y0xautTAHgtCusL9jkPIOI7figwfaJRH30wg2wcz91GdtWMGDA>
 <xmx:Jzt3Y7R-zGJxCIrK973-jho_Wpeb3FcedCz4uEKt9-qYCXjqVt_Ung>
 <xmx:Jzt3Y_ZGvjFvPNiSt9dy2sdoeLy-e9U170YzuWhSr1iYue7R6HDQ2g>
 <xmx:KDt3Y6Jl8ijShE15N1cvDRgPw1AoDWdzm7UTR3lvV2DjlhwtDoo4hg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 02:58:29 -0500 (EST)
Date: Fri, 18 Nov 2022 08:58:27 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH RFC 3/3] hw/nvme: add nvme management interface model
Message-ID: <Y3c7I797OJ+GHz2o@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-4-its@irrelevant.dk>
 <ccb90b66-7e9c-1b6d-b9ce-e0ffd5e39011@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dtq9lZqJG0EqOq0K"
Content-Disposition: inline
In-Reply-To: <ccb90b66-7e9c-1b6d-b9ce-e0ffd5e39011@linaro.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZPoPVH6hfUUm


--dtq9lZqJG0EqOq0K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 18 08:56, Philippe Mathieu-Daud=C3=A9 wrote:
> On 16/11/22 09:43, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add the 'nmi-i2c' device that emulates an NVMe Management Interface
> > controller.
> >=20
> > Initial support is very basic (Read NMI DS, Configuration Get).
> >=20
> > This is based on previously posted code by Padmakar Kalghatgi, Arun
> > Kumar Agasar and Saurav Kumar.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/meson.build  |   1 +
> >   hw/nvme/nmi-i2c.c    | 381 +++++++++++++++++++++++++++++++++++++++++++
> >   hw/nvme/trace-events |   6 +
> >   3 files changed, 388 insertions(+)
> >   create mode 100644 hw/nvme/nmi-i2c.c
>=20
> > +++ b/hw/nvme/nmi-i2c.c
> > @@ -0,0 +1,381 @@
> > +/*
> > + * SPDX-License-Identifier: GPL-2.0-only
>=20
> Just curious, is this restricted license choice on purpose?
>=20

No! That is a mistake!

--dtq9lZqJG0EqOq0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN3OyIACgkQTeGvMW1P
Dek9GQf/eutOJ+p8b3cLO9ew2T9qwJk4OS0lz3Eh8WiS+SSC2DX8XSICMi6UjFFs
H5yHJ4WBg5t1WLv15/tZi1tNfGde3072LEKS//OV51YP9IhUAsP9OgtmDFd0YBsn
AsvIc4/6zInJX4+mk3nOzSmBAwtFP1kHa0fFmOQ+Mqw6kIHunHVRmT+lxqNU8YTs
LWU/EQVt0sAlBL/LH694EgliHlCzF31VtfmdCHLKCv4eOu+88BuQD9ajNP0YOshW
x+Dhpi+2bD9JxJ6lOqKoSJz8Wis4Uk/UHAmfgZAAkzsMKTRWau14fOFRik7yZbxy
Jx/COsjzp8Py90fEJmFNxYiKvgBcsw==
=lb8i
-----END PGP SIGNATURE-----

--dtq9lZqJG0EqOq0K--
