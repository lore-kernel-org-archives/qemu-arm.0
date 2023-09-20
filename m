Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp4312795ejb;
        Wed, 20 Sep 2023 06:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvpfDwCn8zQLHTgIwX0NsnOsyWPW6I+PwBX1YSEvTpRM43iCY3iaKOT/t6pLDQNbQTz9KG
X-Received: by 2002:a05:6214:8c7:b0:658:571f:52a7 with SMTP id da7-20020a05621408c700b00658571f52a7mr2416932qvb.51.1695216754802;
        Wed, 20 Sep 2023 06:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695216754; cv=none;
        d=google.com; s=arc-20160816;
        b=C8PtZ2i8o0nLlfsnoLjMgF4jRUVFYwr7utgOEbD7pjDs5hrzI9Z4dY6+pYibqxz7ay
         HD7jvoEKW02Oe0iyF6jbWAx8AY9t7WYGKnRCP6IlpLVJsfyxskbhgnYGpvTmeBPhcQYx
         +IHas4Ds30lHMm/8eLz5JI0vvLLXHXfKCT0aFbgkEyFtBoXF5LoqumXhRUKt7p7dCWCR
         Cp1xne6B9jAfucUOanBgv2vAGvN0S6UZuHew6+KY7+eZv+0X4HcgVQOk8uroksX9NINJ
         zZSKqmmZ6juDV4gZDC03BJS0LPEIemX22DjgSzg+mjEhkEPK2nEU83dgoMmb2CyhV33l
         m0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=tZQMcqnsLomjtKMUubKspSVImZ4ldOdKbjHHEqFFyuo=;
        fh=xrD9OPNwxCJ/oR1UhJcrQu5pQ7bj4BBveq2K6QeSKJU=;
        b=0EotDbEPSWCAP82hw/iwXLNCTgGZ7F79yx7yGTb2bv5HhRGUsRbrzvoYTbp6IV8ilv
         TFvX47fuJ2cHWZGUyeNk/K+/xTM+MFcGFTPIbihOjsYJ3vFIkCxhdjB7Cx//zvnc+2oe
         qeXGjfBeeo1eKvAcnPIGHhLWwoTz0ymw5SH5uGa+PeduelXGTy9XgcK6Ai4vnMi1sicq
         FlnDfUaDNKLdn+8nTHFrL+SAMsmjN6xWv+EhGP0Or6i8dl9pTl0qFlfXCVhHnipWuMOc
         Hx18oeQtJxulSEKlUEs6/7mHh8ihA+0gKz7zACI29NPgRvsZZnwXwDyfexAyxUcxgbAz
         CnZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm1 header.b=e3HfUFl7;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=LNPxf7TS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a0cdc0e000000b0065652d888b1si5330343qvk.14.2023.09.20.06.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Sep 2023 06:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm1 header.b=e3HfUFl7;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=LNPxf7TS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qixIt-0006fl-79; Wed, 20 Sep 2023 09:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1qixIr-0006fG-HU; Wed, 20 Sep 2023 09:31:41 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1qixIp-0003uz-8I; Wed, 20 Sep 2023 09:31:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 99AC23200925;
 Wed, 20 Sep 2023 09:31:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 20 Sep 2023 09:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1695216693; x=
 1695303093; bh=tZQMcqnsLomjtKMUubKspSVImZ4ldOdKbjHHEqFFyuo=; b=e
 3HfUFl7vuzuYydgKExF+1sToKZJJhQv8HhD1GcoBjWsm5FmVEyVC9OqnQovEfTaX
 +z3t393N/GylVoF5C044Hr0PR1vpoDNVjFpm/X/LwYQ9wTEaV6U9t+VH7vO+PRHg
 sppkw9HbCxtae8UJvAQgEgm2zkqn+OVtcRYgQPklL5y5GMNKIxy7Ag/UAADwlSbm
 94+j9kBVeUQPvS5/exlIxr5KTeGF1mPdAqdqOsNZmKsUqYb3XaryEsbpISNJMJ1h
 /gesQfX9s/pY8gxA7YqO7w90FHw5DxkxeryXXtF0hDbhlgBlBZCWApMZy/cFeHYW
 cGtulHdA3PVBeMHZriN5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1695216693; x=1695303093; bh=tZQMcqnsLomjt
 KMUubKspSVImZ4ldOdKbjHHEqFFyuo=; b=LNPxf7TSx11yK+opE+pRz7+hj+Pbw
 CSmilQVjXx9+6Mrkbu6DGBRZSk/udZNt4hV9XLqCCeWBjJi+CmVPS4A6/YLgTZ3K
 K+jDFOOnZL+VESayrp5ziUp8GFJuGFbLBfA+SVT3wNHD+jVCOLAV6+UCyr/jqYuS
 E7HBq2HJqQr33SAsWNW64CrtWQzUacxRznJ/8tZCgpIVhmGO9P2UOltBo9VJP9v0
 2c48wN+G7BEYwxacXdX4Mnncvw6KaRbplGrETTKM04r+J7P4nia/NRQZOYdnRFL1
 V9rnAfksL1pRcbwprDtWxNk+apJbYR8/0gsj1Sx7AAum6C7JDeyV52ZAQ==
X-ME-Sender: <xms:M_QKZRtenyTjxn51ToF5N9kVi50trBrRssqs9J7PjX6dFE6uFd_xhg>
 <xme:M_QKZadvQTlwct4_Ydnv8pFGka420AKDRYa5JCSERWgAZsIm-GpT6qqsnflnUN8Tl
 QUTxn9lrvM9eDc0LGM>
X-ME-Received: <xmr:M_QKZUzsgOITTwoSqZe19S27bqyxs6VOhvTVeVBUMf_bMPFuPZBHiiEZxMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekfedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepveeiheffhfduieeikefghedtudehudduueekiefggeffuedvkefgfeeuheej
 ieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:M_QKZYNQJEhZYquRNrAl2DaTEYGuvVNBFyqyVIpq_T4LT0lUyTQc2Q>
 <xmx:M_QKZR--02Y6h73ua_p9Jj6DOcxLGHszLks318srH45g4nSGrB_ipA>
 <xmx:M_QKZYVpcqylz3WAz2d-zcMBFerKfgxKl-RcBZXP3ZE1DRo0WSFJyQ>
 <xmx:NfQKZQevGUcmmaIKt-VKu9aGdYypPYXIL-RKFIbSxaXPcVsXwTA2mQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Sep 2023 09:31:31 -0400 (EDT)
Date: Wed, 20 Sep 2023 06:31:25 -0700
From: Klaus Jensen <its@irrelevant.dk>
To: Corey Minyard <minyard@acm.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Corey Minyard <cminyard@mvista.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Lior Weintraub <liorw@pliops.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Peter Delevoryas <peter@pjd.dev>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v6 0/3] hw/{i2c,nvme}: mctp endpoint, nvme management
 interface model
Message-ID: <ZQr0LXsSRXGqJ4EL@cormorant.local>
References: <20230914-nmi-i2c-v6-0-11bbb4f74d18@samsung.com>
 <20230920124803.00005ae9@Huawei.com>
 <ZQrrgxHrfzmGyhZU@mail.minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fNhLX4VzuaQ8VWVB"
Content-Disposition: inline
In-Reply-To: <ZQrrgxHrfzmGyhZU@mail.minyard.net>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sX6xzT3QsM2k


--fNhLX4VzuaQ8VWVB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 20 07:54, Corey Minyard wrote:
> On Wed, Sep 20, 2023 at 12:48:03PM +0100, Jonathan Cameron via wrote:
> > On Thu, 14 Sep 2023 11:53:40 +0200
> > Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > > This adds a generic MCTP endpoint model that other devices may derive
> > > from.
> > >=20
> > > Also included is a very basic implementation of an NVMe-MI device,
> > > supporting only a small subset of the required commands.
> > >=20
> > > Since this all relies on i2c target mode, this can currently only be
> > > used with an SoC that includes the Aspeed I2C controller.
> > >=20
> > > The easiest way to get up and running with this, is to grab my buildr=
oot
> > > overlay[1] (aspeed_ast2600evb_nmi_defconfig). It includes modified a
> > > modified dts as well as a couple of required packages.
> > >=20
> > > QEMU can then be launched along these lines:
> > >=20
> > >   qemu-system-arm \
> > >     -nographic \
> > >     -M ast2600-evb \
> > >     -kernel output/images/zImage \
> > >     -initrd output/images/rootfs.cpio \
> > >     -dtb output/images/aspeed-ast2600-evb-nmi.dtb \
> > >     -nic user,hostfwd=3Dtcp::2222-:22 \
> > >     -device nmi-i2c,address=3D0x3a \
> > >     -serial mon:stdio
> > >=20
> > > From within the booted system,
> > >=20
> > >   mctp addr add 8 dev mctpi2c15
> > >   mctp link set mctpi2c15 up
> > >   mctp route add 9 via mctpi2c15
> > >   mctp neigh add 9 dev mctpi2c15 lladdr 0x3a
> > >   mi-mctp 1 9 info
> > >=20
> > > Comments are very welcome!
> > >=20
> > >   [1]: https://github.com/birkelund/hwtests/tree/main/br2-external
> > >=20
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Hi Klaus,
> >=20
> > Silly question, but who is likely to pick this up? + likely to be soon?
> >=20
> > I'm going to post the CXL stuff that makes use of the core support shor=
tly
> > and whilst I can point at this patch set on list, I'd keen to see it up=
stream
> > to reduce the dependencies (it's got 2 sets ahead of it of CXL stuff
> > anyway but that will all hopefully go through Michael Tsirkin's tree
> > for PCI stuff in one go).
>=20
> I can pick it up, but he can just request a merge, too.
>=20
> I did have a question I asked earlier about tests.  It would be unusual
> at this point to add something like this without having some tests,
> especially injecting invalid data.
>=20

Hi all,

Sorry for the late reply. I'm currently at SDC, but I will write up some
tests when I get back to in the office on Monday.

Corey, what kinds of tests would be best here? Avocado "acceptance"
tests or would you like to see something lower level?


Cheers,
Klaus

--fNhLX4VzuaQ8VWVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmUK9CwACgkQTeGvMW1P
DelsJQf/QfcCo+15D4bhHB1FntlBvQSY4trnL6loKAskiJ3jF7H7Fc7jm0mKebbX
EhFK8/xx1tpsX2ZomsasEYwQ2CWaS2LXMbhlkCmTZ4bzInF5F1cFh1tA4ZJvPhjf
KJpTMQSEXtIv5iFuu6czb0CnEcmqaDN3u31UID2od3Fv0jI+2CH2qmxE2UUH9vbg
6SJMAEgJtuWKuZkQJXwEeeUUmF6kYxqwVYuXz+nkwV5WZFNnLHfOcyFZPoRDuYlq
xpBmiuiok5TpBhFJZNMZk4IzBonpC+UauzY+G6X0w1fCQvP0SqkSoqWbNqQqYdtI
GhkOIB0+QATw4F+wFADOfkTQpmNtdA==
=Nws6
-----END PGP SIGNATURE-----

--fNhLX4VzuaQ8VWVB--
