Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1794387lfo;
        Mon, 7 Mar 2022 13:00:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUbRUMLk5AnBQurln0U71UAR/pD58U0TejpCoBBUjcZKtVhmEUyamIqgusFVpDeVSRZvvK
X-Received: by 2002:a25:6b4e:0:b0:629:187d:e1bb with SMTP id o14-20020a256b4e000000b00629187de1bbmr8648365ybm.525.1646686820432;
        Mon, 07 Mar 2022 13:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646686820; cv=none;
        d=google.com; s=arc-20160816;
        b=UGeoohlj3LLjKvgDcPvYxJJWPXkHKflpkcWVrw2FFtSQkk6VS4MZ8zqhR0VkMJA857
         AuqRjfJaw2DUe7t3G/VgAjz+HAK4+iWPPF6crgQF0VdSFos3EIqYg+FWdhPVmaG7ljGI
         i3CAxew2E4WKl72FXIK4dTj6l0fYTb4WvYB6OA4CAFJx99i3iPoQwAHiC6cLyIlMwACN
         HdMRnDSveOcnJHrln8H7ZcwEsiq+QoDHzCahUtAZe05Ahmc2qMd88RT7Jy4Uewft791z
         rG4cxzrDh0VFcQ6HYfyBT1ju2qDDa7FKkuBOVMcytQkhtUJiCYdUwwjx2dexKz5UfAGQ
         B8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=VfF/lfkCnVIztWt1SfQiW6wBMzSe3jDAyVa65GmXEXo=;
        b=ldmycG/csnqjfeBUZqX2fWhtFzDnX5n2GBKAp1TC8HU/UkyDz61qrpEHHE0peInn1y
         Aj/hnLGZqipVnfi2gK6f6KPp531S7tMgXFa0z5WtmZzWzv79IODzqtvKvv447yEftoz8
         0HxVXwtePjHll6gkM1AXfqbrJF/Dipi3rSrJHvImP2dH8BBkR0byID8gHPjJg2T+8sLl
         GcPIruvzI4HGezGpBCfzaw36sigLg+yCgNLUjOHknsqCEPXJKac0TjLEDbDog/ioFBtn
         iiIFQKqnu+a4vzQ9nbCoxZ2RojzDnln3JZxycMMg88+jc1LaYOvfWMT1mC14LkN+IL+o
         anEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=wv0X+Ep2;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=NweEEM01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a25db0d000000b00628758d78f4si9513915ybf.590.2022.03.07.13.00.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 13:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=wv0X+Ep2;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=NweEEM01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRKSp-0000Pi-BL
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 16:00:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nRKSa-0000PC-7s; Mon, 07 Mar 2022 16:00:04 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nRKSX-00065I-LU; Mon, 07 Mar 2022 16:00:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AC7573201591;
 Mon,  7 Mar 2022 15:59:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Mar 2022 15:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=VfF/lfkCnVIztWt1SfQiW6wBMzSe3jDAyVa65G
 mXEXo=; b=wv0X+Ep26ezFc4zFs/WSsyOtvJC7B3G8B+VfXb6BFtPLBfMlCJ+seV
 BpygneL6M/087XpsmgW9mpoj93e0VCh65l/MtfJ7sjz4w3WaUMzcXNftvzfd4tKJ
 QTFkDcD/5eKdHTOWyirTJEj190fvalwFX5hqUihnBJdtZ3tEHbqe2qKsb0oueHF7
 RxGn7guj+N2Lo+H7TFKPibsUXKgG3Agat2D/vw5leJLK0LI6wEGyPN3F4XuTrmms
 B4yvRnS46f3DIYNfuaAfFfgbyp5cjZySGn6CmyH1ZPsQmSyJfFL+JErYdL0h3YXL
 e3d5EF7pSglpXIwXIuJJGWfYhzsmDaSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VfF/lfkCnVIztWt1S
 fQiW6wBMzSe3jDAyVa65GmXEXo=; b=NweEEM01m1hOH8LUB4vQF5i+Ya59XU75Y
 fwzvF6MzC58hyznvM2pGjmT+xqFdIeyctCNOBCIKFxpLXsZgMw16iR2S6VAbk86k
 YWxgAQAQR77JW6jb8d3eYyu01Gjs39uunHAZUxk6AqmpQbr+7RrknNPLsdTYg7FG
 vLS2uh+tLZnPogMZ80UcSa753fYn7AmxvKe1oSUzkjU2m0ar4cWSPfgfBUpPzCpr
 GSdfYuhzjk0dxHMHsA3ZRxGVlA1imbjXYPT609dAJWFekC2fhO4Ur7DPXZeI3KnF
 XH70nZxq54sjatLL7Hv6Aja0luNuJoM2U1B2Za1btXpkGTV3d+QAQ==
X-ME-Sender: <xms:THImYgrf17bv6XFXfOl80ZRpsVmkS71Hu3r3hijFn37KJvp9K--GRw>
 <xme:THImYmoPe12nuStzrpIrKXfJ3IkFjl6GgaPNBntMqvm7bFQf47FofgJvpLKlETwt8
 ph0OoR_xkEhOjxs33o>
X-ME-Received: <xmr:THImYlMkV3au5gp9FBTX7RQa0i-xkdlgT6Dh5rUIMv2HYr3UGHW6HhCONs0RJ1dUduMhgD5yJ4GLxWYnQzm14l_GGur1WZj6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehgfektdefuedvvdffgeevleej
 vddvgeeltedtfedutdeuheeljeduveeiudeileenucffohhmrghinhepohiilhgrsghsrd
 horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:THImYn51JGn50WR8d0X8Pem2YrV-fKDZdEa4O3yKINFSFz6IWfL0qQ>
 <xmx:THImYv7-gFaEyGxreW02Zx2F38aL8Z1vkEA86kfJ47TPnZ1d6LdaMQ>
 <xmx:THImYnhiE5HR_G1YFlJDXH7UOVtfNRicffErencFsElX6M2La4ggJA>
 <xmx:TXImYi3TW2aPXA5yHZ_HpxjjxlGAUiasTw75M7qR3E3_74Z27qzMUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Mar 2022 15:59:56 -0500 (EST)
Date: Mon, 7 Mar 2022 14:59:54 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
Message-ID: <YiZySh+cdxL7ddKI@heinlein>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
 <20220305000656.1944589-2-patrick@stwcx.xyz>
 <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hqE6ApmCJkxtP0qK"
Content-Disposition: inline
In-Reply-To: <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=patrick@stwcx.xyz;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 0mM4n+O6x/1Z


--hqE6ApmCJkxtP0qK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 05, 2022 at 08:57:47AM +0100, C=E9dric Le Goater wrote:
> On 3/5/22 01:06, Patrick Williams wrote:
> > +    mc->desc       =3D "Facebook Bletchley BMC (Cortex-A7)";
> > +    amc->soc_name  =3D "ast2600-a3";
> > +    amc->hw_strap1 =3D BLETCHLEY_BMC_HW_STRAP1;
> > +    amc->hw_strap2 =3D BLETCHLEY_BMC_HW_STRAP2;
> > +    amc->fmc_model =3D "w25q01jvq";
>=20
> So we need this patch :
>=20
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20220304180920.17809=
92-1-patrick@stwcx.xyz/
>=20
> May be I can take it through my queue.

Yes, it does.  I had sent that one earlier and probably should have been cl=
ear
on the dependency.

> > +    amc->spi_model =3D NULL;
> > +    amc->num_cs    =3D 1;
>=20
> There are two flash devices on the FMC. I can fix it inline since
> it is the only change I would request.

Yes, there are.  I think all of the Facebook systems have dual FMC, for
redundancy in hardware, but we can get by in QEMU with just a single one.

I'll see however you fix it up and see I can update all the other systems as
well.  We have an internal patch to expand the CS on FMC to 2 but we haven't
upstreamed it yet and I'm worried it will break some users w.r.t. the CLI
changing for adding images.  My recollection is that the Romulus CI on Open=
BMC
relies on the PNOR being the 2nd argument.

> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thank you Cedric!

--=20
Patrick Williams

--hqE6ApmCJkxtP0qK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmImckgACgkQqwNHzC0A
wRl7Og/+OqDSTEVmC7Ws+xKFMeqW0q1Z26F/e390S9q3rfpj5oObDQuWDZh2fwj7
MeMre1fQS8gdD5R1vJaZeJxedufzDK0Sq0ohe4iajonNYQWGE/Nk8PI8xX1Yl+2Y
AUGM3qdQg/F+/0vUGnZeO2dCMjbu9cG3WlTRNf7i/TIcP7iMCzTosaFl+LKyoxxE
Jee6imCtkMf0K33xdWK56LiOBjU/ycPJJjcXoWMBCX3o0UunzqtjpBa7sXeejvha
YuB0COjcy/oVPacQIS3ajwp58ecPRMMy438XkwCEJ7d0NjB4fNOvmjFoZVojhNK5
VzKtYmU/xd2yxUb+9YT+tQYMFklNn2YkxgYPuwEe5p69YsMcOqKpyWg6DIxk93Th
4HDMSmeoH+LQtPMez9unrafpgccWkbBR1JkAIHkq2uXr+EDeFgZBOCqBz1KdavDO
PcWbFjQxAFokeAlzWglFdELFNoSptvlOLhgoiuzFkbOpvjUNe7wkverrc4NiDc+o
/DE1DuIgLx66OcDc8pkU/iWRnDH29msDuvssoz+SgWchECxdyj0vKYW8E4fFI0tv
qL0qbS86QOS5MkXvMHnP1U5hVab8wZ75nNhMVg1HBx4hWqUdUIYJXxmYWyUumXol
HB7mCkreIULFPuWl5jMyGyyY8vr7tEBp7QEKg/FPi8LC76cRkcY=
=O0z9
-----END PGP SIGNATURE-----

--hqE6ApmCJkxtP0qK--
