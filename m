Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3435588wrq;
        Sun, 24 Jun 2018 23:02:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLTY2selDTyM0Y6mAT4yidLmjh6e76FChzdln7Oyd8QNUt57eqby0LzJF7bxarRWNL3Bb0F
X-Received: by 2002:a37:258f:: with SMTP id l15-v6mr9544192qkl.88.1529906547408;
        Sun, 24 Jun 2018 23:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529906547; cv=none;
        d=google.com; s=arc-20160816;
        b=x8mWuvogg2kezQop/Qc2ni6UDWgDRN8ME1KKrMXYRVLMlM/8J/9wZQY6QrGsbz6ftL
         pTXLGR/MfnmqPf5pEEG9K/VTEp7eLJvLS4OtZKAAjhEfCCBrm8oWteK4jKe3OTvpnGH2
         goF0iqrHqcT8OQiFsg7WtwVQFa9AZTxJ0giMrdvm3paWLL3irvOFx5TZinbrcKNkmic3
         gPChW2COd30u7dvDaVCi7Fo2q/fFxznYVrxVj69hTphHXwuvMW/Ea/qAQ/Ff4/tFLXe5
         mmJSWovIDeFUtNtEv/vH3Q+PenvNgcTwGHPOrhQFHF7hrWtFiLcOy2n2Q9GbZjta8Bky
         mpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:date:in-reply-to
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=nZvqnyHaRaZCusEE1iM3savG+PYxrvnRs8PelDwhzcc=;
        b=o11LSGvC/zt28tdweHwZp3QLQGFhrhrg5lBe/yF4YH4/3Q4tIerZOPOQIrv9T/nDy3
         1l/Jku6SmSFYuh4DBitvcfZdKo9Tl450FVHfFqkI72bomY+fuZhc78LTCncg7sUdBYcu
         0GDo7Sa3ZaGEzo0Nm9qWReRvkkS3Z7eqF3IOL79g4D8DkW/8zlXKD8rUbKQddItcxkpZ
         SnZwtRMpuZXSCKKP1DN/oJ3OdVDHPVogPrAU5TWEfqmJ8lbrRACN88yCOUHXxdKwT/0W
         E56aVEdqlUsHoV89As48P1bOFAibvemZLoC3oVlsV/cqVu5/D2HryTvRynyqQZ87nJjn
         hgKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aj.id.au header.s=fm3 header.b=CHjPVlvo;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b="WXQe/pzM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47-v6si13336737qtp.296.2018.06.24.23.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 23:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aj.id.au header.s=fm3 header.b=CHjPVlvo;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b="WXQe/pzM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXKa2-0006ht-U8
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 02:02:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKZq-0006he-Qo
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKZn-0001Kl-ME
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:02:14 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:57801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXKZn-0001KM-F0; Mon, 25 Jun 2018 02:02:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 869C621B01;
	Mon, 25 Jun 2018 02:02:10 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Mon, 25 Jun 2018 02:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=nZvqnyHaRaZCusEE1iM3savG+PYxr
	vnRs8PelDwhzcc=; b=CHjPVlvoBekN/1mQkY6uF26WYNrlMAE1N742be3eMNrIo
	Erd4FUjzlx6eYKGNluCTVxikvlXgXA4xaQlrDGgQkGDJ4PzMBMUsIO46xDUbArtB
	kcbNZq1NRmjWnePAgGrU9ynDg9nqS93G33Nwc0USkAjXraQULB3lqVWE7G65HtcF
	rjLBLWo0eLOhWtQ34xieDLV23dflqytqT6yqX6bdaT5vTh2L8R0fpbDsZQVuTf0H
	xbsdvdG6N/hcrMfnRK+UV2xK5SQyhdYfeJyKK074b46rJDMhV0fMytFkaoTPcRme
	/oOk+8P744lbpZw7RIXcR4+PRHlqjWG2patYkCRUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nZvqny
	HaRaZCusEE1iM3savG+PYxrvnRs8PelDwhzcc=; b=WXQe/pzMgJMSVAGyQzJw2Z
	5+V1hpVaPu8/OI5f21I3u1t/bz+ciKfm4aEpGhRArlYKrIs0f2/FDNFCHv1rnbHU
	YE8wggwi7Qp2Bw99uJFKo//Tw6jb5A+hVCI2xZ3Jn1Cx14Gd5SabRLsZskLY1Uc2
	fDgqKZ4MLOReUSPaRwTtQH52sAQCgolVMx/yL5f5u1NGykpF+qk87kUYE+Csj80O
	7tnRFDYjNALkR90i5RtPOs5/OuOteJuHo0Q3cUvLwa24gvnpJYHqKGt9QCm+gZgB
	PWhplNkRkxfz4+MHAlMj4V/Llsl6KYx4U3Hi9SDyC80JBwcnVKaybrLcuxPZuyJg
	==
X-ME-Proxy: <xmx:YoUwW5EgaRTWBMtwsQPq3q54-FJGWUpx0M5AsZrcQC_Jt-D237IRtg>
	<xmx:YoUwW-y5Ty3Q6VRFKj66_v-VXnrOaqdUYlbrZ9jI2Esfw0BlBMXjMA>
	<xmx:YoUwWyB0XtQ8hdTw0--YLJImMWyElTGG7OMCcHBy-y8aUBuU9DMB8Q>
	<xmx:YoUwW1WhH22u1NA7LWfT7hCNpSbgzgkzhbsTjDDxAqSiqamr_-kMaQ>
	<xmx:YoUwW8jJmlOGExBtNJV91-sigGllBrBfnqJMYaNmGRp9mO1usW08CA>
	<xmx:YoUwW51iuNaId43DFvZtWBZ1Wp044YrD2BjRb8CF2A0IktxUgYi3gw>
X-ME-Sender: <xms:YoUwW4oL7pnzMRVkNgqnInp2VA29N2297KHQR7gE8C_HtfHbe2useg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 04888BA43D; Mon, 25 Jun 2018 02:02:09 -0400 (EDT)
Message-Id: <1529906529.2292427.1419115928.6C7BD1D2@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
References: <20180612065716.10587-1-clg@kaod.org>
	<20180612065716.10587-2-clg@kaod.org>
In-Reply-To: <20180612065716.10587-2-clg@kaod.org>
Date: Mon, 25 Jun 2018 15:32:09 +0930
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed/smc: fix dummy cycles count when
 in dual IO mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QIRVDyxT2PIE

On Tue, 12 Jun 2018, at 16:27, C=C3=A9dric Le Goater wrote:
> When configured in dual I/O mode, address and data are sent in dual
> mode, including the dummy byte cycles in between. Adapt the count to
> the IO setting.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 5059396bc623..fce126e6ee92 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -66,6 +66,8 @@
>=20=20
>  /* CEx Control Register */
>  #define R_CTRL0           (0x10 / 4)
> +#define   CTRL_IO_DUAL_DATA        (1 << 29)
> +#define   CTRL_IO_DUAL_ADDR_DATA   (1 << 28) /* Includes dummies */
>  #define   CTRL_CMD_SHIFT           16
>  #define   CTRL_CMD_MASK            0xff
>  #define   CTRL_DUMMY_HIGH_SHIFT    14
> @@ -492,8 +494,13 @@ static int aspeed_smc_flash_dummies(const=20
> AspeedSMCFlash *fl)
>      uint32_t r_ctrl0 =3D s->regs[s->r_ctrl0 + fl->id];
>      uint32_t dummy_high =3D (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
>      uint32_t dummy_low =3D (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
> +    uint32_t dummies =3D ((dummy_high << 2) | dummy_low) * 8;
>=20=20
> -    return ((dummy_high << 2) | dummy_low) * 8;
> +    if (r_ctrl0 & CTRL_IO_DUAL_ADDR_DATA) {
> +        dummies /=3D 2;
> +    }
> +
> +    return dummies;
>  }
>=20=20
>  static void aspeed_smc_flash_send_addr(AspeedSMCFlash *fl, uint32_t addr)
> --=20
> 2.13.6
>=20
>=20
