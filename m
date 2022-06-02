Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4727794lfh;
        Thu, 2 Jun 2022 00:43:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEuh7/6jp5GbeuB2PvIjjeMR+/0hJlDVDFteYkMzaa7CZiKs+19S7SB63WfqB+OD+Cig6r
X-Received: by 2002:a37:305:0:b0:6a3:48bd:2ce1 with SMTP id 5-20020a370305000000b006a348bd2ce1mr2237308qkd.697.1654155791431;
        Thu, 02 Jun 2022 00:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654155791; cv=none;
        d=google.com; s=arc-20160816;
        b=S2o75fpWU17+iZtqiFkm0uIbCSh9ccsFSraY73wNePR1BSPiEAt0Q6RXN+UnJTFha5
         MS1Jv1TJbbYO0lCpb1sAtUIeQEFIAIUQRlG7zlO9pA6Gy2TMV10wTeanBI58+g1dZPSp
         KeVbhR0Jla/kK8kNd0XR/3Z3inNk9ICnvzQgpthDlkhW/ZovjkQx8bfKQ8wEAAz6HiaC
         1Mfb4AU1uNC/Sbqzao+XcaOyjaE5lRpcJj4d2hAlrWxRaZ/3Jz8t3ZV2nTKEPTGtaM4d
         R7Cd0v7EM4stu3IGTreTusxFa+vd7a4mPRH41/UrkeJuTYT/JRMNMBZN0u1LjhlQk7uV
         Bvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=esxvLE4BPWDGsMBZkG7nPL192IjbXXvsfGvQR0oA+7g=;
        b=u5wsgXPVu+sLXVLACu5rAcU1hWsTKYoDjyTPtX3n0Elol4L10Pg9VTC0bol1mL6Wo+
         0qoVhjK7D1Jx2VVd0ZQmkAGn6aEqMPUR3QD8dUZs0mke1GeY+V1VG0rNaNBo+msp0DEw
         2yQTan99ELah1W66KEt+vcPik3FAj94EOSN2jWgvtJuEOm2/Vj6ngnksGnnJsy1dHzUo
         Ij9E18EIp+IkH0bd0Zb4ZZ5ldFLjIbV2MswHf4giGQJFn5WWkesYf9Q39HL1g33SrRby
         38Y2yaUWCYf9vA+PT/+epPJlRGqznbPTDmVE1GNghQiLbN+/6qNY/7bB5zSssTxq7Ycs
         jP6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Ep9fmehQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TgBxXs1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05622a05c600b002f3c92534f4si2003398qtb.473.2022.06.02.00.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 00:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Ep9fmehQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TgBxXs1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwfU6-0007xc-PJ
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 03:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwfMt-0002Qr-GC; Thu, 02 Jun 2022 03:35:44 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwfMr-0005f9-NI; Thu, 02 Jun 2022 03:35:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 03791320094B;
 Thu,  2 Jun 2022 03:35:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 02 Jun 2022 03:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654155338; x=1654241738; bh=es
 xvLE4BPWDGsMBZkG7nPL192IjbXXvsfGvQR0oA+7g=; b=Ep9fmehQ13gNNMHGYJ
 MzkVihVDjtbo4e25jGj+8KfSuD7wFdOhzQz62M/lwTIu0Y4WHEcy1cAx3lvzrLBd
 wYFldt0YkBPF2Q/QQbZyOclf9eAITyDgGuX4Vl+XG5kphHfjO1wZOPmLFk9GZsvV
 wJp6ZWVsiDsptvVwJNprL0Ng23yifgn6wvhxI7a6Zt5P2gQWNxN1z3x9e4Pp97y+
 +Qu/e0NakKv6WscDC4H4m/9DOp8PGIMpeTKbFvZ2MSv+ovJ/T8BsfmasAmgkF/xW
 ECbSuxguCFX2+czM/3tzn9RgpKXUiwyS8DdxYfUXSvvwxnZSyYnuRFs1Yvb/o/rj
 ++Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654155338; x=1654241738; bh=esxvLE4BPWDGsMBZkG7nPL192Ijb
 XXvsfGvQR0oA+7g=; b=TgBxXs1VtqYRRyN03EFclwooHWOPeEmD0eqD4Beq6zPd
 q9AyuXJydevOO4npFIN+FK12O3WlT0sQleTDQUWgs/WNJpew1Ia+6BALWsVkinFj
 si+XQxSnFIw8FEHMeWNxEtqlRcmu8j/j0IlGz9fNSVY6jSauX07kfOmM1IJ2r0d/
 RVXhe5oJE3VAdodN/Bpv56OSXgV9d/hlY9Xy6Yv4dOy4UTUysu6aLUMTXywUm83t
 NT9m6lf3u/SUEL/iasJ2nelfVkmOgtNgz86uLj9rQ7pwDmrCnn9Gmk1lMzP75D+o
 AkxXzs86eRoXVx93FraCPT7nN+mNkKmDMYEbIRR9MA==
X-ME-Sender: <xms:SWiYYnUxGfiArmt4V7TxDKaOCNQnGysCFEZkF70pm1nkzwtJNz1h8A>
 <xme:SWiYYvlI-5rHw_5Tlp9mn4LwvpsgmkECTQRNHNSeArsco7bFS3haZDevbDmntsQiV
 PsBuv5ilK3SAJ5MO7o>
X-ME-Received: <xmr:SWiYYjYgeusm2QqKvTR-uZLM1ufhYL7u-VxVzs70RbGBTWiUhFpKoOACv82K2_XqRi99G09FpndymsE4UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SWiYYiWnm8b86dEBsgGLAtvYDdSkIEVu2S8b_OezCn81P3MLWzu0IA>
 <xmx:SWiYYhkt0dBKMqj0qvcZLJm-6F_V580Ml9rT8whgrUPopuguCE9wAg>
 <xmx:SWiYYvdFh5lvzZGTJqwSSAap1P4nIvqhaLOMi75_joNdgQ-e7cOazw>
 <xmx:SmiYYk8UwySRLvXRH3A5qH4rIYZoPw-yu8QOSqwVnOpOzxDJnykvTQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 03:35:35 -0400 (EDT)
Date: Thu, 2 Jun 2022 09:35:34 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: cminyard@mvista.com, qemu-devel@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [RFC PATCH v2 4/6] hw/i2c: add asynchronous send
Message-ID: <YphoRhdvNHyuV8+N@apples>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-5-its@irrelevant.dk>
 <20220601220521.GS2554462@minyard.net>
 <fc01e3f2-1533-0ff7-6294-b3f7cf3cb351@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wd0o59QLkii3PIZN"
Content-Disposition: inline
In-Reply-To: <fc01e3f2-1533-0ff7-6294-b3f7cf3cb351@kaod.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
X-TUID: +xr9jUdpTqCL


--wd0o59QLkii3PIZN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 09:32, C=C3=A9dric Le Goater wrote:
> On 6/2/22 00:05, Corey Minyard wrote:
> > On Wed, Jun 01, 2022 at 11:08:29PM +0200, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > Add an asynchronous version of i2c_send() that requires the slave to
> > > explicitly acknowledge on the bus with i2c_ack().
> > >=20
> > > The current master must use the new i2c_start_send_async() to indicate
> > > that it wants to do an asynchronous transfer. This allows the i2c core
> > > to check if the target slave supports this or not. This approach reli=
es
> > > on adding a new enum i2c_event member, which is why a bunch of other
> > > devices needs changes in their event handling switches.
> >=20
> > This would be easier to read if you split out the default return of -1
> > in all the devices to a separate patch.
>=20
> yes and please drop ibm-cffps.c and ir35221.c which are not in mainline.
> I will address them myself.
>=20

Roger.

--wd0o59QLkii3PIZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKYaEQACgkQTeGvMW1P
DemkkwgAlrlwQ2jD0ei9cmKWMWePCjYb87nmJEhpxy3OIBdyDGsEHPoQ2DgrY89l
XXSIkJKrejQVB5J7dIRmUTJ98Mc32U4AEyRQxU/NkFWzBXHTWjpyRxeVuYCdre01
srv7KI5W4rJWxTPpfzMNVGGKZvttwpCWkqHvl24TvDZ509mIYbg5JS0hf/0BBgKK
Ghg9Y2huKXM7hNtURxTk11OgoAv20IjXS0V8Vx2kdbxFxizevgI9SL2VKgmqZuch
gsB2VwIf7i2+yDiq8VvYMhuBWzpYbKCFj9nUxeehqMVFfkFXKM7yvU6sMCG1wLKz
zmgPv7Ujs3PBAzSuHnkxmJj48U2ynA==
=EUzg
-----END PGP SIGNATURE-----

--wd0o59QLkii3PIZN--
