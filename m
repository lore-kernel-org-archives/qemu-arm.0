Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1194504ejx;
        Thu, 17 Nov 2022 03:59:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4p4E2GGmFVpBZRJGXVjbOGOPG+C4ZwcE18d4wwRHineCAoc6BGfNIXPQvAeBlYuGOtLRIH
X-Received: by 2002:ae9:ed58:0:b0:6ec:1753:e4e8 with SMTP id c85-20020ae9ed58000000b006ec1753e4e8mr1197597qkg.746.1668686390756;
        Thu, 17 Nov 2022 03:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668686390; cv=none;
        d=google.com; s=arc-20160816;
        b=wFPaim/K7XZIg8DIzqH/DhSrJUWY9PmK1Y/8ulzeJNXUpbFTTLEXnydO9fZl2hWQeB
         g2wVP+5iSsARjaVtOV0ydIs28TDXnWy32UGPUv7GCrkTaJvHpeQkB+Ih6RnQbsQV3Q8P
         GqdeDiHzMjX+QvupAWzc9cbamIql0m/YqSHgR1z4Y7OOJCB38Rx+Q2OK6LE9kIT3lZmu
         KwgkNZXu/n3BNQxll19uNo2mm88o6Tzl12VWfRxWcH9kmikm08BERvzvhxYbBD7j4fdS
         jsmWRqMs6cgnvoUuv+9JiG9fxx1OXuqOz3lUtAnhGae48aPgmfKbw9HO7dmUYj8/TMhh
         UpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=B9V9izZVp+GlJoW++d6rpsz7KDeRiVITAk+pRTZEwwg=;
        b=WkSu7WfUAirrKxkRT0bTMQVwCaeqldGOQZ6WbzVv3NsKc5ZzB9vvXweIp+jlEcoinO
         FZERx8cV24Hu7ULHkvliwpaxHAbhRFh+NXGYL1a56BnRKB8eo2/ADkWrOpwxyc+yQACp
         LWcNqlbSCEmRzxNt1fsjcmV7lGHEKApuADBfYwqA57r8QU38B9LJkFz3wqOhm0/TDx3V
         L1q0QEVEwFNceiTAp5rWMCSu0rhnTHSVTLUpqeQ4fGm+DegPKJAgl+Tj72OCXhKWBkTH
         qgnCttYxf9ezoF8Dza59EcgPTq8haa+iKixIOnKyN75T8G4LSrzomzonGy2Am6rCT4/c
         xylg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=h3DvQXkA;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="w4z/OWAH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx9-20020a0562142b0900b0049904e31195si325618qvb.24.2022.11.17.03.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Nov 2022 03:59:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=h3DvQXkA;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="w4z/OWAH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovdYA-0004mc-Jk; Thu, 17 Nov 2022 06:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovdY4-0004kH-HY; Thu, 17 Nov 2022 06:59:16 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovdXu-0005LT-Fc; Thu, 17 Nov 2022 06:59:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 05A745C0828;
 Thu, 17 Nov 2022 06:59:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 06:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668686343; x=1668772743; bh=B9
 V9izZVp+GlJoW++d6rpsz7KDeRiVITAk+pRTZEwwg=; b=h3DvQXkAkRCrMqmkRQ
 VvL3jyaKkpQjfmvQYz4Oxdn3BzuOGG/ipucXDrxJnNRaM84zm+UUiWtCEuGq3D0i
 GGHJjbNYT7/X11tfqZkiBY7BmXQHoyT2r1MFCrvPN6D9nXmSIaZ2uR/btaNfrsk6
 b/Lg1PxvXmhhRe84c9DcQkIkEHjhJX4QhC4yET+rGTxhOmWtxwOtJK3pprjX2ABx
 7GEl72S1Ei1041gFUy8VlZrPtTrh4BG6ekr3Bz3qKKSXH1ep7T36gKlFdqWy3KYP
 6/wSlFwQ2+i+hGlsjSSTNi1bXA8OmBiZXhSBVAl+rrcQM4z0BCIstSH9Nn6yubUM
 wH0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668686343; x=1668772743; bh=B9V9izZVp+GlJoW++d6rpsz7KDeR
 iVITAk+pRTZEwwg=; b=w4z/OWAHjGpyHZjpS7lc2wk0IiWuIRsOSv3DlMmPuSqp
 e7S7zdzPdzQvTAtlQBEpIehZcWXkLTrofGSg/HJVhsod8yADceJh4QJso6tvcP7m
 OTUH/19zTRtin5h9UUCv0k3SOd2SWg8boacNJ4sLRCXcFP0mvPp2XpT2zmP9f4uE
 Wln943I+HXEcVUvaYeemtQwWhH6l3OxjrjJYltqQ5DDEK44KwX1trYIZ2iMJqLDN
 4NdedsG2NX3k7hMJXdRh9lM5MmWbPurys2XmJCZWdBIaEEimQSWCd6ESGIeFzCBV
 n/6j5r9doXNJeys7YqRIQ5GsS9lChG8/A7uQyqokjg==
X-ME-Sender: <xms:BiJ2Y0JZTbyc4K93DbhxlA_AqBW3iM-6S4KuvXRjXEKkva-dY8BKSA>
 <xme:BiJ2Y0Jp7neNe5eLRPSZYodz9lyXxOFtqGFJcQ26PDYES0CI8y6fyzqSk0iA9--lG
 36dAtEbnXmuek6cUlE>
X-ME-Received: <xmr:BiJ2Y0t1TH9jP_TIKmJgsq8Sgl3RpyNyR-T-lxmPr490MqKMG_M4Q0tfgTYBiw22n6R_NrBBK3qtW4Q6dyP-7_YlfWdq-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BiJ2Yxa_9lTeftNy09lamFfhq_qQ_wXy8xbWWeo1S0Idu7iapwmjbg>
 <xmx:BiJ2Y7bkSFU7F-gGAXz2zFBYkyqhg1uVJSIf3nXJBDkCvf9dvg70wA>
 <xmx:BiJ2Y9CBM_oaUiTnzetoZS3raeP-iTna8uA7P6Mcm6hTLLCBOmeEgw>
 <xmx:ByJ2Y5Co7f43BWSKn0AkdIXny0LaCKxsJlYly1SHxm8aZWZsUUZF-w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 06:58:59 -0500 (EST)
Date: Thu, 17 Nov 2022 12:58:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Message-ID: <Y3YiAhXX1FKuYMoc@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
 <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
 <Y3Xktt8b85RvJ89A@cormorant.local>
 <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8FF7Db+hKOeOPdRA"
Content-Disposition: inline
In-Reply-To: <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: hXMbL+1zNjWA


--8FF7Db+hKOeOPdRA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 09:01, C=C3=A9dric Le Goater wrote:
> On 11/17/22 08:37, Klaus Jensen wrote:
> > On Nov 17 07:56, C=C3=A9dric Le Goater wrote:
> > > On 11/17/22 07:40, Klaus Jensen wrote:
> > > > On Nov 16 16:58, C=C3=A9dric Le Goater wrote:
> > > > > On 11/16/22 09:43, Klaus Jensen wrote:
> > > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > > >=20
> > > > > > It is not given that the current master will release the bus af=
ter a
> > > > > > transfer ends. Only schedule a pending master if the bus is idl=
e.
> > > > > >=20
> > > > > > Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> > > > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > > > ---
> > > > > >     hw/i2c/aspeed_i2c.c  |  2 ++
> > > > > >     hw/i2c/core.c        | 37 ++++++++++++++++++++++-----------=
----
> > > > > >     include/hw/i2c/i2c.h |  2 ++
> > > > > >     3 files changed, 26 insertions(+), 15 deletions(-)
> > > > > >=20
> > > > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > > > index c166fd20fa11..1f071a3811f7 100644
> > > > > > --- a/hw/i2c/aspeed_i2c.c
> > > > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > > > @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(Aspee=
dI2CBus *bus, uint64_t value)
> > > > > >             }
> > > > > >             SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_=
CMD, 0);
> > > > > >             aspeed_i2c_set_state(bus, I2CD_IDLE);
> > > > > > +
> > > > > > +        i2c_schedule_pending_master(bus->bus);
> > > > >=20
> > > > > Shouldn't it be i2c_bus_release() ?
> > > > >=20
> > > >=20
> > > > The reason for having both i2c_bus_release() and
> > > > i2c_schedule_pending_master() is that i2c_bus_release() sort of pai=
rs
> > > > with i2c_bus_master(). They either set or clear the bus->bh member.
> > > >=20
> > > > In the current design, the controller (in this case the Aspeed I2C)=
 is
> > > > an "implicit" master (it does not have a bottom half driving it), so
> > > > there is no bus->bh to clear.
> > > >=20
> > > > I should (and will) write some documentation on the asynchronous AP=
I.
> > >=20
> > > I found the routine names confusing. Thanks for the clarification.
> > >=20
> > > Maybe we could do this rename  :
> > >=20
> > >    i2c_bus_release()             -> i2c_bus_release_and_clear()
> > >    i2c_schedule_pending_master() -> i2c_bus_release()
> > >=20
> > > and keep i2c_schedule_pending_master() internal the I2C core subsyste=
m.
> > >=20
> >=20
> > How about renaming i2c_bus_master to i2c_bus_acquire() such that it
> > pairs with i2c_bus_release().
>=20
> Looks good to me.
>=20
> > And then add an i2c_bus_yield() to be used by the controller? I think we
> > should be able to assert in i2c_bus_yield() that bus->bh is NULL. But
> > I'll take a closer look at that.
>=20
> I am using your i2c-echo slave device to track regressions in the Aspeed
> machines. May be we could merge it for tests ?
>=20

Oh, cool.

Sure, I'd be happy to help "maintain" it ;)

--8FF7Db+hKOeOPdRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN2IgEACgkQTeGvMW1P
Delf7gf+MNJZmJ7V8ZDTkMyvowwhXkgYF7axvZV4y4yjbnQuKROkGw7f0qnys6XB
nojBC3O6nIbIZtfrN0xWHSBG5WqSZfLrKVzFklQfvGHg0bRN0ya1TNlomj2ate9e
SZBnTGO35utjGrop9cZWobZ2aUU6/9KPSenw0b7wFaTqavLVjV2n088gE2yobSoV
pefWg1Zud61hcEmdzGAXHLYyiLbIZ4/DFLKRIzhuyaQtnhq3dRyfDr1wsDPl/HkG
HHp06RtxgvJmKfu429a8DuCefjIsBPexwGZxMHFunt9wVf9yhOHQQmrJpkhAiO6b
x+J8Oj8D1CkIkK02OvDiNyjQwUvTHQ==
=wNto
-----END PGP SIGNATURE-----

--8FF7Db+hKOeOPdRA--
