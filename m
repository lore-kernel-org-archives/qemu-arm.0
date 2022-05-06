Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1597579lfj;
        Thu, 5 May 2022 23:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnk7uPnfxH5ZM19XpkIdRGcblF0pKieSNPhmqhy6HGKv51OuplaIK2tA4mbypQhT9n42zV
X-Received: by 2002:a05:622a:1183:b0:2f3:ba22:5b53 with SMTP id m3-20020a05622a118300b002f3ba225b53mr1490537qtk.203.1651820314437;
        Thu, 05 May 2022 23:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651820314; cv=none;
        d=google.com; s=arc-20160816;
        b=uVGRPmCJcGpcB3Y97XiIdAYbbjh8YapORMwQXrJUiWeA1CAq/C3lU0U8GA5pCtItBf
         8vSYgmfyqUCpcet3ZJ5QPIgOrkdZvzlRquqovlQV1u65wCDQpFXn4WLysq79k7FetdWQ
         bOhzZl+xoIwLf4YyAmNmOyWb/yYw1Kph1IbUuMr7KsEMqxctRMh7OXzA+13j+3AhhhrF
         stA5t9FdcVUPPsdntUYW/bGfaIETTOMHS6A7Hrt8kb5ULu1RDLYPqzcXxuh5DLqWv8sk
         O5PTnV2hNPwdLyCvQhkEKho8Psf7jsaMYSgIRW+gzfLZNWqTd6qC9/gTT0gpE+ekUEia
         Fblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:dkim-signature;
        bh=t0DI5I6H0mncJkfPhLdloXfJz4yFhfRuaPt78y6aNPY=;
        b=fH2XzLW/8Sje3963Ggm3hZi0ZIKWqa1O+TUiqyhqawBi168gO5TWPtoMtYtXGnXaw+
         oFDiL1ZQgjn7eDNas7z3g60XmcbbqBgIyACyi+HK9IDfh6sZZLO7JOpQpm3dvMnFZcSs
         kJtYpRrh1zEVdh3+ubR2qpZiVwOX/cnx/mOKh9oALc/s2mx20zqR1Jz06LBc5RC80Q5x
         oNdbj8rSg5fX9ZrpjtnNlsGUiiy6JgH42sqiwpicF+R3zP5awJJqhgsJOuwpIyDL8FYz
         hCZfqAonxSQ6Pas72YqBwuWcF7sbzMW4Nh+qbhnKLEgawVYv1G3bT/d89LwEv3bJcUOG
         B/Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=QFA76nkK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=qiDrH9qG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24-20020ac84918000000b002f2016e47c3si1554110qtq.741.2022.05.05.23.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 23:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=QFA76nkK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=qiDrH9qG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmrv7-0001pD-Eu
	for alex.bennee@linaro.org; Fri, 06 May 2022 02:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmrst-0001Yu-NS; Fri, 06 May 2022 02:56:16 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmrsr-0004MS-FY; Fri, 06 May 2022 02:56:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5571632002FB;
 Fri,  6 May 2022 02:56:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 02:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651820169; x=1651906569; bh=t0
 DI5I6H0mncJkfPhLdloXfJz4yFhfRuaPt78y6aNPY=; b=QFA76nkKebW5vqDQ4o
 5Mvzb6Ad//33qUzI1mU91+hGlQvVFnAQpiCq9hZMuSFr1uaJSJYbdhx2W8PtzWHl
 NfOohWQxBLEFqhDdvl4ijAXZ1FofuulOco3r1yw6T/tmlyd48X5//hZkM0ZakKOU
 WWjFynzvclJgI0H+IXdGpJl+hqZNMnvsi1ugJOr9J2MfZHC7JUbYNe7N5daBlXFG
 NA8o9D2jEJ7HpIFwdRsvX6VtkmV13Inn1080rzKOocSaag2biXxAeGFDqIg5F5Ec
 P8d8lx+RIi4d6xvyDsyB1//d07ts62C5pIvIioP/Ex3lxOcWbJ5VnWe+LunaSYGK
 gjKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651820169; x=
 1651906569; bh=t0DI5I6H0mncJkfPhLdloXfJz4yFhfRuaPt78y6aNPY=; b=q
 iDrH9qGhn3ZFM3p8Sd3JqClbfRWAxbgX+VurVEMsdefCv4NtVVeNOLkKuhrfzX/o
 HR7KPGNBz95tdh4BPjxHrArOjnLflqhib9A1Q9Z7FANa9ea6LT/Myjpi7eia1l95
 TqnAHR5q4ss2cLNN3IJ9kyJ/5BnftH0YwFBFOVO2DzshZdwYhpQGzUnUDhhWYvCy
 3cft/Y0jBLWrbBqRr9c5MMwhvEKz/2jjUrFsqdjQ/kTEyqo+rBY95lMXrv0OsGQh
 jC6gwN+ScmACQYgsa0OQjqnhkJ8DyTia1Y9t8UCQmwLINvjj/3+zLHPk0kEnmBU5
 UGYaUzhd8igz4WTMDtZVQ==
X-ME-Sender: <xms:icZ0Yvpegmp6PXy43SDegsluQeizrmPRQC1solJYl8_DVcYgfeSPTg>
 <xme:icZ0YpooRR1Xbiq_qSaTde8OKd4tqIrkTqa3oQyPFpcEKZxvO3cEZQNRDKH4VVB-r
 KE0-tsj_RwVu_jLNpk>
X-ME-Received: <xmr:icZ0YsP9RIqLK-PbfiyM-N7B0fF3EHbYd5Oy4ot6C24ciMskOg7p_s_KwJLW6_SKL0Rj9Coupl4YvOzbfkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephefggeeflefhveekvdetgeduveduleekieekueejjefgtdefueffgfeukefh
 geelnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:icZ0Yi6qBCrYejJPmU8DgHgcN48FP14fegt7Cgour8A6kDkj1LkHDw>
 <xmx:icZ0Yu6NjRchbRonMcUdVFPLxyCMJ4HwzZE2N_F5aLyGczSaFRmMDA>
 <xmx:icZ0YqjeF_ERlaTpcLNQpj8wUix-WKPLYjC3cS6hc1mx5fQ7YOsZWQ>
 <xmx:icZ0YgRk0Ri8S7fh9UadI8J09zKw0eEAbflJJeLruyM7tRtoCin5kQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 02:56:07 -0400 (EDT)
Date: Fri, 6 May 2022 08:56:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Message-ID: <YnTGhgkTyZGicQTW@apples>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
 <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CTMYqFe/x7HmZqx+"
Content-Disposition: inline
In-Reply-To: <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
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
X-TUID: UvhHny/HXlfA


--CTMYqFe/x7HmZqx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  6 08:30, C=C3=A9dric Le Goater wrote:
> On 5/4/22 18:34, Peter Delevoryas wrote:
> Nice ! And do you need anything special from the I2C Aspeed models ?
> Apart from :
>=20
>  https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D292928
>=20
> > I=E2=80=99m hoping to help however possible with merging Klaus=E2=80=99=
s changes,
>=20
> They don't need much work. Klaus doesn't have the datasheet, so we
> should help him with the changes requiring some internal knowledge.
>=20

I got a little stuck trying to do some QOM interface stuff, but I'm
picking it up for a v2 now.


Cheers,
Klaus

--CTMYqFe/x7HmZqx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJ0xoEACgkQTeGvMW1P
Den7vAf/b5G3RywLrs8TndB8zti6qNyZFksGE3xKqWUnCK7fjyhAg08hYil7xM2g
ie3O5eLvG03bDlrUnPbi67x1u0W8C/q3mvzGydVuiKx2Jm7Et7AjimGJ/5iQoMI6
nrETNviZAVnqLu1IBPB5cIcMU5u0XQTQwXZNkNBg9Y0/NJ9jyMKOR74Ij4BIfnj7
XYhnGXnFzohCZlbW2DQ8TCkadpupzyu1j9a0AVsUwsLbsDh4SLb6E5rWoi0hTndN
SyHOVds/vM1TnfRS8CETrU/Q0WaASYCjCE6GsJB8xHks6tJq0D/tSyRhejwePfJq
SxSpf5f0YeEDwIRKhLOXHz2lrJ+k7w==
=gJ2M
-----END PGP SIGNATURE-----

--CTMYqFe/x7HmZqx+--
