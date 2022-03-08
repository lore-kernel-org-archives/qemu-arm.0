Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2519079lfo;
        Tue, 8 Mar 2022 09:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwE4yQtkQbazDsNP4FI3ZnbigclrhuggLvCYpBhucO9CPsB9D1a/zgmB1KCkZZS11Gk4jB
X-Received: by 2002:a25:3187:0:b0:61e:5f5:4cb9 with SMTP id x129-20020a253187000000b0061e05f54cb9mr12984473ybx.544.1646760529013;
        Tue, 08 Mar 2022 09:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646760529; cv=none;
        d=google.com; s=arc-20160816;
        b=AODiVSMkVzPFe/btnMi0AAq5E1YfABoa8yoMrf0hO1SagWOmZ6WhpX0+NSz5e1yt8W
         5G4USDAlhw/xMKOpGnst1UlFLozs2INR9k1d9gm/L9NVpEOUzD3Z4mpOrdt0alXxZYZA
         dBoa32D+zcU0jBYRsHiLJmFwMZKVLg3F/cVHonF9+7NhcfQzc/xBnXDQmCaQt0hp5URR
         QrCL+aGTG1jhpuL82oQJxCQcBCCwqegEi9o1lacntCn2A8c4B1HiDvqLhR8t/n6pHdl9
         h+Q4TJT/nl0gMXDvAAjnPG73GHIHFAgcqtrEDQSg6IsBoN4N5n85IIzBZn4WDVZTiOqz
         S+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=PblPKJKnQsWifKsz1wXrgpG1CM9B25GQuj8v8peIu+w=;
        b=SxDY/PK23B7QUhkFurLG7ThiB80vjTPbrkwr33rThTze9IhokXMTXF1klo9Mf6n4W/
         /rsbyHzGEX47xnwRqTWEi/QFGgfV2DRRLWvLGbIQoazZNqXS6zUiZ62bpFaYUOUNkytS
         WJ5nBz0Xp/f0/y9ktw1nqsgnB9ug4bkU7szq8ExTtM6lpB8xOuPDwsZxVPAo/1mjfbsz
         l2KkjCmRimMbUxtlMCZ/AM3WdWoG0es2264bp4RF4Ga8CIgvZAHreZOVb2k1YgU7D2v9
         sM5VYfqdU8MvxIP3BO02fXLZfeGT9/s7Gpo/DQIBtqmERRyaIcnGo56Gv+jgrl8Ly/fA
         5Ljw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=f+QfS0dS;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OUM+5bNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g63-20020a812042000000b002dbf9179146si11270836ywg.547.2022.03.08.09.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 09:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=f+QfS0dS;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OUM+5bNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRddg-0003DI-DQ
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 12:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nRdYu-0007tm-CL; Tue, 08 Mar 2022 12:23:52 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nRdYs-0001J4-20; Tue, 08 Mar 2022 12:23:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A96775C023B;
 Tue,  8 Mar 2022 12:23:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 12:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=PblPKJKnQsWifKsz1wXrgpG1CM9B25GQuj8v8p
 eIu+w=; b=f+QfS0dSexZ2Dnp7XForvH8kzgYIr/ATtuM1pvUtEdZDE+b3/caowR
 G2md4XB+nL0iTUgf8mzMG8Wr4oyBAkia+7iz0/ZdOfQI5hwbzU4aPM6GyoGzrZX2
 plLSJgkp9Kij2hw2hWBAWEClbb9AZZ+bQubOqNKS+GGUH7NUZlrwtrfkuMKbaxdx
 Ld6gHMwGXK/XNCHVR3gSMtkZ5Dqv8NQHQKmvkNCnCDYONvZr0cbMe5JmHqol6FT7
 1RBVmPYwQTej7XCOuOu2obl+IUtPpGKRzl98fj0jxemJFSXI9U5mj024kgOGI8M6
 2veAyJ+KkMPWhCZfvLIKauC3sq/MPu7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PblPKJKnQsWifKsz1
 wXrgpG1CM9B25GQuj8v8peIu+w=; b=OUM+5bNEPCvzS1T1fhW2WfLFwd5Jmx0HH
 zg0dtD+Icw0DlPqvJLJKTOgupawG3QK5F4uWMhUVXYuP5aatjBjEECRx+kH53qAR
 MQIydyh4BFExnFmEpu96fCrBmOA40COHz9MhpjXm6LPQ5eidZUwELN6br1bdjw8I
 vCHxIvazLkemrMxIRlmE8nhW308dp9XtsO019BsjORR9xNOgcfPf2CT+LLk/Z3m9
 LxBxs1EuBqYYXnDizYhGzcqp2M0Vso754zjmIcouU9PV5j3PqUiNmsd0NxgZn7FK
 vxpzztkJlgchQU+NinvozfH7++8duSKEL2kbCm+mXuahJparuNdug==
X-ME-Sender: <xms:JJEnYr99-ni-ocBBpDMS8R2iO-_cJMQ5XmscKKAghWsvsQX7EHxhvg>
 <xme:JJEnYntAq2UZV4E_ZfhWXGQLMAQMK8frmF-H3h-V8IhHwbDOqEAQzXFzLEqpRP-2r
 7P9nxkf9k-8NcqLMj8>
X-ME-Received: <xmr:JJEnYpBOnTjGuxQSehPCcPVxJV-1pjj0wieCPSkafuXx4EO0SlELj7cXXn_F3xNrHtnYY9LDlFgXwUlu9ludz3yqxqN8-w45>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvddvgedtudffiedugffgveffiefh
 ieevteegieegvdejvdfhgffhudfhgeegfefhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:JJEnYnc_MwFgfN7YnSRT33jXK3YTX4cczeXyg9RSsmKBQHJoMMwO0g>
 <xmx:JJEnYgO0zn2TAhkZSfkBdWajwJDUD6huJkQLYLYsuCmLmx-lIcpZ9Q>
 <xmx:JJEnYpnzZ1QY7tF-g7Pq3nbgw1Gc74r4P7B7izo936WFDYW3RtkjIQ>
 <xmx:JJEnYtp4cy3Lyoup6YU9HsGNjAKvk4_NqNxdX3AnwUOwipQjFrDICw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 12:23:47 -0500 (EST)
Date: Tue, 8 Mar 2022 11:23:46 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
Message-ID: <YieRIkiREVhRUXxZ@heinlein>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
 <20220305000656.1944589-2-patrick@stwcx.xyz>
 <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org>
 <YiZySh+cdxL7ddKI@heinlein>
 <2b9aed65-5cdf-0647-dc25-7cc9d488aaa6@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EwE2bW6bcZ26nGcO"
Content-Disposition: inline
In-Reply-To: <2b9aed65-5cdf-0647-dc25-7cc9d488aaa6@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IyTO+71RjR/O


--EwE2bW6bcZ26nGcO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 09:14:07AM +0100, C=E9dric Le Goater wrote:
>=20
> >> There are two flash devices on the FMC. I can fix it inline since
> >> it is the only change I would request.
> >=20
> > Yes, there are.  I think all of the Facebook systems have dual FMC, for
> > redundancy in hardware, but we can get by in QEMU with just a single on=
e.
>=20
> yes, the kernel will complain though and I don't know how robust
> the spi-nor based driver is. I think you sent a patch for a related
> issue.
>=20
> The newer spi-mem driver should be fine.

Oh yes.  I already forgot that I'm running with that patch since Joel added=
 it
to our backport 5.15 branch.  One of the reasons I wrote that patch was to =
make
QEMU not kpanic. :(

>  =20
> > I'll see however you fix it up and see I can update all the other syste=
ms as
> > well. =20
>=20
> ok. may be for 7.1 then.
>=20
> > We have an internal patch to expand the CS on FMC to 2 but we haven't
> > upstreamed it yet and I'm worried it will break some users w.r.t. the C=
LI
> > changing for adding images. =20
>=20
> Yes. That's the problem. I am afraid some CI systems will break with
> these change in a newer QEMU. The command line options will need to
> adapt.

My recollection is that the Romulus CI uses a branch of QEMU that at this p=
oint
is rather old anyhow.  We should be able to fix up the CI scripts at the sa=
me
time we upgrade.

Are you or Andrew J maintaining that branch?

> > My recollection is that the Romulus CI on OpenBMC relies on the PNOR=20
> > being the 2nd argument.
>=20
> That's the initial assumption made years ago. First mtd device is FMC,
> second is the PNOR. It is reaching its limits.
>=20
> I am looking at improving the command line argument to support:
>=20
>    -drive file=3D<file>,format=3Draw,id=3Ddrive0 -device mx66l1g45g,bus=
=3Dssi.0,drive=3Ddrive0
>=20
> which we would clearly define the topology. Adding a cs=3D[0-5] or and
> addr=3D[0-5] is the next step.

Seems fine to me.

--=20
Patrick Williams

--EwE2bW6bcZ26nGcO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmInkSAACgkQqwNHzC0A
wRkw6xAAgPgCGRzRydtSJERruguu810ew1LX32fV8Eqtq82BIOVO3WRc2J4fU8Ah
Lfa2LamrS261G270uE/udu2Idzv7fxtA2x7hBzUumW+luwR7qE8gvLKCrc1gOPFi
Zux3I7uOIfnDouuh8X9Is43470HyQTP564JoGUzPjGZ33iZiMABhLmhfKXsZcRj7
vsuT/cAOxJ6B0EA8e/6G6Z9DZJaC1cPVQdyIkQKwpd24rioPT0sTnjjXUm5aWBpA
IeKvDg6FXaRvyp6OFz3CyoPUyJiG0gHi3LoNEGCeuDE/HnYgteETFVhs26M+tg4G
BaV+/eW8QuuzErRTVrMe6ztIYZvQKD+x8Bqu9ETqKPwVYKX9AgKhezHHxldF9NEt
Z07x463l7Abcs13N4yrFP7iQ2Yyxbpo8bEFVkF1Y8l54dHRnLn4dsU6rbBS6xwVR
HAbMVViTdFT2sWuF1nVvxXMQHq6wJIofXGJlC9Na0EA1wgoj2b4jn8yut2pj23nn
HPu+4UZMkTcLoliZ6gFBAxDwdbOY7FDKPaUx7r80exy6PzPe5O8CJXo07QRCm3rA
T/eoOKdi58xXBIdUx3EKY38lZFrgCRxhnFtVUjOglgZuwymK1aUa3YujveNE6RmC
QTsctzWmf39JO+Uia/bDQqpiiDliWXLR9GRH7HtfbaqJhdVl38s=
=QCQj
-----END PGP SIGNATURE-----

--EwE2bW6bcZ26nGcO--
