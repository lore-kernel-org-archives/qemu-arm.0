Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp10348711qvs;
        Thu, 2 Jun 2022 12:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEoPUQmqZ8IT0MXoT1uQtOC7RQ8A2xpq0XtddiJktTq4INvErfi9EwiTL3XVgshWUTTakj
X-Received: by 2002:a05:622a:1ba8:b0:304:9c13:390e with SMTP id bp40-20020a05622a1ba800b003049c13390emr4804012qtb.117.1654197654281;
        Thu, 02 Jun 2022 12:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654197654; cv=none;
        d=google.com; s=arc-20160816;
        b=NUa1lBb8UEWRvNfyikYvy/v8L12hEqcmRyfuUjOyvNK44T/IrmpT7ILpMkOBNY3F5L
         hmAEvDkwE1cHhH5z+5Rvi8NXILh2If/xR/q6g+Lfl5GsluHbP27PvsBD9/+bJ6hDasHW
         2mzRYH+6gO+D1N5omi/v8rbJYeWAe3XhtV0lEbktqEn8H/GL5kQjEs5ZF8xNIfc+ywvw
         foyxzkhFMSOSCR8xx6ESjgvtbXoz2kSYS6vutVdeVipSoXIuWjT7aU6YwXlNhLo/+lcn
         WFkE6R3dZbpvGsnFu2Dgeo17nku8JYkpFf0/esaJsBz7SA681EHKZtU/PQQhwxeXWF5R
         6CpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=mr012aGW6nT4gBeC642BNtp2RVJElYSvK9sVFfDJC/A=;
        b=APeKmIChF+u/qbimHTjSrfk28c9NKiYqhHrTEI8NtFhoP2wJzlo8I7NOWeM972/7ED
         irXG6yzUCDGiDF0xwXniViDYFA1Kq8uvuA1y2iiRPsQ7WYUH8/B3Sn6rSQ5diaPUar3P
         +LtMkL3PUxd3VcUzPrxPaNcUa7rMAhhOingLgZPnHG9HWbRmJk4hoH9NQXD2vDI4MmS0
         srw9dVvf7qjFAFC/ZPYEVboY8vIv5acF1pHllSQJh8AS3PA+NnHcYfLZObxJZvVSpwqt
         CfTBo9ac58XFDnF1TX5SI3VV+aIdB24SkSF+vneRwY66m+gVWYtc7u2Q+sCMd/X0w1Oc
         PylQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b="jJLh6O/U";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ZaEq8gld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d142-20020a376894000000b0069fe87786cdsi2324279qkc.398.2022.06.02.12.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 12:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b="jJLh6O/U";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ZaEq8gld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwqNJ-0005ot-Qc
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 15:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwqMZ-0005mg-P0; Thu, 02 Jun 2022 15:20:10 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwqMX-0005HE-E7; Thu, 02 Jun 2022 15:20:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 03A595C024F;
 Thu,  2 Jun 2022 15:20:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 02 Jun 2022 15:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654197602; x=1654284002; bh=mr
 012aGW6nT4gBeC642BNtp2RVJElYSvK9sVFfDJC/A=; b=jJLh6O/UGomNn++nLS
 /cNHPxejfyZuMDjpDIMDNaXBDl2bL7NshXlr5Kvpck2ZBnXkl/AZo02wBkO8bJCg
 cFkOfDrDI1VrSlJS/pd5AwFyR9LBRnD0Cvdd1zKYuXqE86ya91K/ipK7fgH10CBc
 gGyByEP5tZQt7RnEE+WeKdLWieBSWNIUIgoFBiOFIc+TnCaXcT6gdfT6EnXrjNfo
 TTLnaEN9yc7VB9Qk1UxCBHvEHWS3h7hRF4M+UQiqw3jcXA+Avnc03qbm3dUNk4gl
 jqCBM/wVF+HvZuV4J/iaUZP/UArIe6JV/E/8nIuZy7yj2LbNb/4XBUrdHEggJNKA
 SMYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654197602; x=1654284002; bh=mr012aGW6nT4gBeC642BNtp2RVJE
 lYSvK9sVFfDJC/A=; b=ZaEq8gldZmoxKuE9ZM3oHGy7kN+zNDuNhSF3pAgrDnkM
 Wh1FdeZ0+ejxnJkzUhUnNVCrN1u8ng6jMpE8uBsWHC2LwmsrPHgykFVjfEnFsS93
 rpxtchUuF0mf1ioF1t7G9kqgfryatzUNbuubJq0/4Mqd0/vFSF4LpmjU1wa9Cy9C
 9EhjUNQkiEqZvdL4roHNFf+AN0kUkgTHvJxQr1p4rZbYpSoUJd0jkpa9sOEkI9HQ
 +vquIhRaM3TKcf73YaTZxvBuw6MV+hD6l8+r2NYGcvJ+hzLNMH7HPLi2L+NchSIz
 xbQg54q8XBaFHif3Fc2WxGK8wNoN4OXHYiKGR3+J7A==
X-ME-Sender: <xms:YQ2ZYj6xNR_UTdmom8dkLBUstMpo3ILA6D8b_VnkgJS1ZCLRuoRgmQ>
 <xme:YQ2ZYo5HOPj2Zk9Razn3vpECHF15Na1K4yJ7FGK6pSjgfJP5Bygf83sEbVpToVQn4
 dO4YjedkEbJ0p1UZxU>
X-ME-Received: <xmr:YQ2ZYqdjiFKLfv6Td4Tz0n3Qh47uf6ueYMM-J2v2v-XYl1sIUsd099BNIFVAovmrEVMCw0G-Atsv7lqcgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeggddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YQ2ZYkLkcaJfCAu9a4f8OjdgMksY6SwUoq2XMyUt4QQW4RDH2W86Gg>
 <xmx:YQ2ZYnJArWLIfHEEGv2WG8ga4F3Szy9cbMwfDzpHae_CDXqlPg25DQ>
 <xmx:YQ2ZYtx4qXEuC2nCjR66XnyADwi5GP6EWRFrUOfZ1pUu-jk9AQoS5A>
 <xmx:Yg2ZYphq8eBbw-bX8f6aGA7OByCVYHdGpT2uciOJMEDdcJaoHf1gOQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 15:19:59 -0400 (EDT)
Date: Thu, 2 Jun 2022 21:19:57 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, qemu-devel@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Message-ID: <YpkNXUkafYQ3ZSpT@apples>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org>
 <YphzHGNYErSMEfPw@apples>
 <00e2d10a-20f5-8357-5b13-41791940ce19@kaod.org>
 <5683a737-8a15-20c5-5716-f5216d6c33c8@quicinc.com>
 <c796202d-2e57-32b3-3007-343d37dcdb84@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8agfdVEGsKIvyPAb"
Content-Disposition: inline
In-Reply-To: <c796202d-2e57-32b3-3007-343d37dcdb84@kaod.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqZ2vEKnlc4A


--8agfdVEGsKIvyPAb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 17:40, C=C3=A9dric Le Goater wrote:
> On 6/2/22 16:29, Jae Hyun Yoo wrote:
> > Hi Klaus,
> >=20
> > On 6/2/2022 6:50 AM, C=C3=A9dric Le Goater wrote:
> > > On 6/2/22 10:21, Klaus Jensen wrote:
> > > >=20
> > > > There is an outstanding issue with the SLAVE_ADDR_RX_MATCH interrup=
t bit
> > > > (bit 7). Remember from my first series I had a workaround to make s=
ure
> > > > it wasnt masked.
> > > >=20
> > > > I posted this upstream to linux
> > > >=20
> > > > https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant=
=2Edk/
> > > >=20
> > > > Not sure if that is the right way to fix it.
> > >=20
> > > That's weird. I would have thought it was already enabled [ Adding Ja=
e ]
> >=20
> > Slave mode support in Aspeed I2C driver is already enabled and it has
> > worked well so far. The fix Klaus made in the link is incorrect.
> >=20
> > https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/
> >=20
> > The patch is adding ASPEED_I2CD_INTR_SLAVE_MATCH as a mask bit for
> > I2CD0C (Interrupt Control Register) but actually this bit is part of
> > I2CD10 (Interrupt Status Register). Means that the slave match interrupt
> > can be enabled without enabling any mask bit in I2CD0C.
>=20
> Thanks Jae.
>=20
> So we should enable this interrupt always independently of the
> Interrupt Control Register value.
>=20
> I would simply extend the mask value (bus->regs[intr_ctrl_reg])
> with the SLAVE_ADDR_RX_MATCH bit when interrupts are raised in
> aspeed_i2c_bus_raise_interrupt().
>=20

Alright, so my "workaround" from v1 was actually the right fix - I'll
re-add it ;)


--8agfdVEGsKIvyPAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKZDVwACgkQTeGvMW1P
DeljdQf/Vdk3O/anDVQinA92Q3vkMYEvRWn+KSsqIU9n4UKz6MhJ+2qFvbm1M4YU
SKvk8Vuf1EFlUJrCwoeP03x8xulPWa3u2XTzfqFTsxZ74ctT0bHdcWJ/Jyxjpz9U
uoyj0lycPIYUddU2g9OoRQPKdqOwiPSHEWkya5AdbCgCoUPf/vHPlFf7HWmCMMuj
YsFLNrYPV17d3uJrOvJh3eG6kMLjW70MICl/dfvnwTLnEmiuCDVUEKa3b8lAmmO4
8HkUPACIpj6RDoRrJP9Zt2aIGaazW4BXs4QTBdb0Zv/2qzNvQIbve1QoZSsqvb1B
7aP9L8DckfkhjLdWmhGqR0BewjgURw==
=vfwT
-----END PGP SIGNATURE-----

--8agfdVEGsKIvyPAb--
