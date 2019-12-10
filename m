Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6438706lff;
        Tue, 10 Dec 2019 14:16:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGkiSBn48DakX+h72WEWFD0zvI0W8De6zHVt5397pNAu7HufyIN8n6/ViIVCFWktlWaAoV
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr212833oic.131.1576016206394;
        Tue, 10 Dec 2019 14:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576016206; cv=none;
        d=google.com; s=arc-20160816;
        b=0fX38KTbnCz7QECX8Nt6JOfiEiSf9l0idTnTNAZ3CvIU2O/Tbzni4RUUvo4w1RTj7p
         2tU2yKq7DUjJc471vKFIDwxoCtv2u03hcQcz4kKM9IagVrzlU4VbPEuZYwafFUwsC5d9
         Cj2dJqM6LokeJsyrk9HfnDK2NsnSPvMerg7WgLw7zF8lemMLaSwb+v/s/o/TGcLcrN5Y
         Bc4RI9gHsycLhAnzmdWbqVsqe2YIvbiH9G4tc5c48nqaufzB6+njJ+RP4z4OQefB3rZy
         R08XLgSVvXruKVSgeFFwAagaUjaL/b4ncgZ7JjQRjK9wLTu1uk8pFrmUt93GXQ2RRry1
         J/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=o3/w28DcUaCOTUMXgSPrVlQr0SfHyxTg5qkRp+tl6uc=;
        b=g0qt5jIQYD7qM5J9CxDaT0ama8wRkP4L6AsQImEI6vtkTZgEvQw9pEC9N9a8Hr+Ls8
         t9nEpA6zAoyMrrO1dDvhvbY4KtPpM4sUMB7+OFYu8YXitTZ9he320uK0QPYpVh/Wli+W
         CjmLo5+sQLCAn56t662KixilRnj7y59ts5Fq+JOkh7zcXbU56OSBY9KESnio06zKsxeJ
         eqYjTWKpQZyxFB0ODm2gx8uujvnDYK2+pZAxJU/BoPMCwE3P+u3dbM74lrqCTH4pIDSv
         EXY1vZ6p4m4fj1ceczQwfA1qWZKY7IwBfrGqB8AxNzDEb3dyITlBGqcGvzlLIA9SymoX
         gbUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="U7jBl7/R";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=botsc4e4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si2577632oih.89.2019.12.10.14.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 14:16:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b="U7jBl7/R";
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=botsc4e4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ienoD-0007Nq-A8
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 17:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iennj-0007KJ-6c
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 17:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iennh-00050y-UD
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 17:16:15 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46433)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iennh-0004yv-Hi; Tue, 10 Dec 2019 17:16:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B5E4AED3;
 Tue, 10 Dec 2019 17:16:11 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 17:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=o3/w2
 8DcUaCOTUMXgSPrVlQr0SfHyxTg5qkRp+tl6uc=; b=U7jBl7/RB/bZWlk+DKnMi
 Nk5UWkXR00ZoTNs5uJlKVH07CTT5lySk2m7PwScT7eFGyOtr8mBPE/zAMt3NvupV
 iMFL8sghteoEHp5rZjQiHcasP8JfZxKWSKvibS1Ixot0Zaqte4xqVq09SXZahKaI
 11Em55qluxEw1z3NppUqtrbLgN6ITguKS2gpcIp3/OQUQ0+d7/dSNRbk/wgnylbe
 8v5rk2+d6UUnJnvpBrOXXeqmWMS66f1gkHliJWYR/D+EHFS4FmPcyHkPid0Ilbxm
 bbHOUCgamQMqVVndAUy+nypSCY/VyYnaPC4Lgpcr/B1a6NXPJMqJcaSGrJg2ejri
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=o3/w28DcUaCOTUMXgSPrVlQr0SfHyxTg5qkRp+tl6
 uc=; b=botsc4e4CfHucumguvrs5rYd/5kgA4EVTA2XlM4U9Mq2Ec+5hV/o0zc8W
 Vhm3lQ4EmWlUJy158Wvmy8GJuwz0CnGLxbqNiUz92yxtdQ0phmVRWOzFwvypn5a/
 MqpuBhKf/gilCPQWL3Q8jjbEVpmTaPIHm3n0hzsq/1Y7U1D4ESczEddqKSCTFSMX
 KYMZOdbiD4ebuifYJ8R5LTHLztJbUf55r4539erekhG9KZQFTKk7sOonqg505iQP
 vzbB3cq/MEfExfhxtQlWpTL57Sb0zEHdm8ylG9gHhoxgQnyFcd0xc1adlUvI4hpC
 42HVatkme13u42/3SNIHwxjE2khaA==
X-ME-Sender: <xms:KhnwXTeM-hg7RAfk84F8dr0YprhPY38KPR40YYB3YKluy3WWQehWoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhs
 thgvrhfuihiivgepud
X-ME-Proxy: <xmx:KhnwXSKbIZvXtE88xIKhkUzg6GlQUJGhu76_1RNaJ7kINRvCy7a27A>
 <xmx:KhnwXeeEn1vY0t1ugO4djX0O8_2Az86ZCQSgzZ-0ti1sQJlvwwjwpA>
 <xmx:KhnwXR3T2wbQTZw4iJgcD2yHoTknsZDG1vD0-BK5_F8wI7Ko9MywPw>
 <xmx:KxnwXV-VuAwDr_04-d3nJEMON6G1eOg_wyH_r8WAWRNWPoaO3YT5yA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A3F98E00A2; Tue, 10 Dec 2019 17:16:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <27aa4292-cc3b-4a9b-a13d-ab1eced3f952@www.fastmail.com>
In-Reply-To: <c49584df-016d-9a84-b96e-6a3b2e98c6a1@kaod.org>
References: <cover.da2612e7c1835c563b20851f0ac26c7b175428fc.1575938234.git-series.andrew@aj.id.au>
 <11e1d38d2374a48996a3496c906db215de246583.1575938234.git-series.andrew@aj.id.au>
 <c49584df-016d-9a84-b96e-6a3b2e98c6a1@kaod.org>
Date: Wed, 11 Dec 2019 08:47:50 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_hw/sd:_Configure_number_of_slots_exposed_by_th?=
 =?UTF-8?Q?e_ASPEED_SDHCI_model?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.24
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsqG0KBX2qBb



On Tue, 10 Dec 2019, at 19:26, C=C3=A9dric Le Goater wrote:
> On 10/12/2019 01:52, Andrew Jeffery wrote:
> > The AST2600 includes a second cut-down version of the SD/MMC control=
ler
> > found in the AST2500, named the eMMC controller. It's cut down in th=
e
> > sense that it only supports one slot rather than two, but it brings =
the
> > total number of slots supported by the AST2600 to three.
> >=20
> > The existing code assumed that the SD controller always provided two=

> > slots. Rework the SDHCI object to expose the number of slots as a
> > property to be set by the SoC configuration.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> One minor question below.
>=20
>=20
> > ---
> >  hw/arm/aspeed.c              |  2 +-
> >  hw/arm/aspeed_ast2600.c      |  2 ++
> >  hw/arm/aspeed_soc.c          |  3 +++
> >  hw/sd/aspeed_sdhci.c         | 11 +++++++++--
> >  include/hw/sd/aspeed_sdhci.h |  1 +
> >  5 files changed, 16 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 028191ff36fc..862549b1f3a9 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -259,7 +259,7 @@ static void aspeed_board_init(MachineState *mach=
ine,
> >          cfg->i2c_init(bmc);
> >      }
> > =20
> > -    for (i =3D 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
> > +    for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
> >          SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
> >          DriveInfo *dinfo =3D drive_get_next(IF_SD);
> >          BlockBackend *blk;
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 931887ac681f..931ee5aae183 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -208,6 +208,8 @@ static void aspeed_soc_ast2600_init(Object *obj)=

> >      sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->=
sdhci),
> >                            TYPE_ASPEED_SDHCI);
> > =20
> > +    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &err=
or_abort);
>=20
> OK. This defines 2 SDHCI slots for the ast2600 SoC, but
>=20
> > +
> >      /* Init sd card slot class here so that they're under the corre=
ct parent */
> >      for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
> >          sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slo=
ts[i]),
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index f4fe243458fd..3498f55603f2 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -215,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
> >      sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->=
sdhci),
> >                            TYPE_ASPEED_SDHCI);
> > =20
> > +    object_property_set_int(OBJECT(&s->sdhci), ASPEED_SDHCI_NUM_SLO=
TS,
> > +                            "num-slots", &error_abort);
>=20
>=20
> why use ASPEED_SDHCI_NUM_SLOTS here ?

No good reason. I'll just switch it to '2' like in the 2600.

Andrew
