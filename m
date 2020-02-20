Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp113511lfg;
        Wed, 19 Feb 2020 20:05:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAVxu5cGrnPpJU7CKT2698dIxMDX0lmqIZ4w+V8+rGbL4nw+kVMmo86JYhh8+yuBdWtVNK
X-Received: by 2002:ae9:eb4b:: with SMTP id b72mr25379293qkg.316.1582171534160;
        Wed, 19 Feb 2020 20:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582171534; cv=none;
        d=google.com; s=arc-20160816;
        b=UVF3mfEd/OgDzVPL4wwOjNweB93FgSHDx4R06OXHNXv/1KIzK0ojpAzcNRRrBQmuRc
         urKiC8CvKwl0UxrHTTmrnqSxEc+8NNc9vkehbswk4pXOiJ2rKt28pUJTqFXz1H0v1fEe
         Af05dHNZ/qd9/cObo3j4dokpfJ1+zMdk0eScuAA/zIgU6l8Y1LIJb3nfQUJyfyNikkRe
         7QtxcrxOPKh3ikmCnEUf1qQvPBOfcEphp9JbLgfB/YUVZTiFqibEa/+iYli7Quw3tqpd
         ENWiHHaqk4A3VV4mZR/z9gXvPkSUlEGc3NDTx3UmOeaNfA4WmhSZ6Ba4LMQ/sxPUysHr
         9OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:from:date:references:in-reply-to:message-id:mime-version
         :user-agent:dkim-signature:dkim-signature;
        bh=PD+gM0ElJbI4B37LGwqyR+rpEQp/gBM3Hg6vW0ULoiM=;
        b=TPz86oSQ0y17FykgOIwQTszCK4whaOjxNbtb0v1lwiBRyQTAex+efrTWf3zBjICTC7
         +Bx7TIo8rnRgP9jgAuy9hk8BDXz6AvXk5Fnrgjp8Rsd8MO0NN7qpJYbjuoAowszehLOS
         OLbp84b7lLR6zr1Zx4p6NelIMMTI0Rlo+zSAka2Y/jvbx0ouKKrlgWSX7CIxnbS2H/YU
         F8oAFGCpf5X6lmfXOySxfpOggpkkU8U7RzsRmiItf9SYmbLbjdX2rif9zI7UdsnqQf+E
         gM5ugOmgqsWjEYg/RvTmxx07DgUVzFxR579fIKFOSpsP+NKK0gxQmkJ8wsCwEp0pYsSm
         OWHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=EYFwl+yL;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=ns52S2fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h202si633388qke.128.2020.02.19.20.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 20:05:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=EYFwl+yL;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=ns52S2fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4d5h-0001n8-Ic
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 23:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1j4d5Y-0001iO-HJ
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 23:05:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1j4d5X-00054y-H3
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 23:05:24 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50841)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1j4d5X-00054W-Cb; Wed, 19 Feb 2020 23:05:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CADD121AFB;
 Wed, 19 Feb 2020 23:05:22 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 Feb 2020 23:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=PD+gM
 0ElJbI4B37LGwqyR+rpEQp/gBM3Hg6vW0ULoiM=; b=EYFwl+yLWU/CU2N2Wx8Gk
 YLxdxF+aK2c/NYld8GtnJfgo8QzPfpcYS2dfphSp8JdWNtRKJtPH6ztV7oSmMDbh
 fEFVWrDuY5gQlENF372sgo/IEpiZzay36vYfbgPno/154ls7jG0SV1I2FxZdheic
 2D5m7eKJ8+f14ihnaB324CK87MJ2w9FLO8/bhcTygB9Om04P8cmgsBvvWGOKX22/
 U3uuOgZurq2SrxLLtNsV6JXoGkwcBb+ms2PqNmIAGShlyfMgBvrxR1k4qym4z6by
 EttnCDUuXH4IyPpgBzt0MWyNZ1RceppJ6/PVd/2DFTimHRGPDhaANZeI4X5BsNAX
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=PD+gM0ElJbI4B37LGwqyR+rpEQp/gBM3Hg6vW0ULo
 iM=; b=ns52S2frYD/ZDkBm/UqFNQ0+cSng7IDlSL8BDH6CTdBtwIaUOnDlHA+I4
 UH34TEh54IwSgGLEt6CaX4HxietYa2pQem/ziK0aNwDwUwAo5ymqDRZJeIIXbltN
 CiXxVB58Ws16Zgwp1jSWRYq1th5xJRvWb42o2SKxKvDXuI+NES6OU1diGIk4Aa9V
 cNA6aRSfV/X7YgJoLeRRyH/xaCFQGpOqaOxE4EORwob0zmCpHRKxpbioXCGYXmJQ
 10OOkju9CauKPV1uXBK57qLHatnS59VkIr8LzPhvJCsZsMXULlqGTNBKmj3OeU4q
 eIwyY/yfN7yz+aaTq8rX5lmlynxKg==
X-ME-Sender: <xms:ggVOXlgeNjGlzLzuttJDZmD6DlJvnLNDzIky77uVTWVz2pCqTUx-ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedugdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:ggVOXlgCRjPdU_uIOTmfODin-v7-TGzhEVDkA4GrwHJQby9X9U2ZiQ>
 <xmx:ggVOXrHGuhsknf9RDP7Xprpajwd1APALREzXF9-HjpHjV-hj8PH07Q>
 <xmx:ggVOXoB0vXx4ld8SCIM-1NdK1V3GhC54iAgab3HkuIzAHuVHCBzWGA>
 <xmx:ggVOXkVJHTM18gyauwVu4WPe6k8k8jAMp-GL5nWUrel8vRfzCgThMQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16015E00B2; Wed, 19 Feb 2020 23:05:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <c3173616-45ed-4307-92c7-53e6c8db696a@www.fastmail.com>
In-Reply-To: <20200206112645.21275-3-clg@kaod.org>
References: <20200206112645.21275-1-clg@kaod.org>
 <20200206112645.21275-3-clg@kaod.org>
Date: Thu, 20 Feb 2020 14:35:15 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] aspeed/smc: Fix User mode select/unselect scheme
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.25
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
Cc: Andrew Geissler <geissonator@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8N/uSbVFgdxO



On Thu, 6 Feb 2020, at 21:56, C=C3=A9dric Le Goater wrote:
> The Aspeed SMC Controller can operate in different modes : Read, Fast
> Read, Write and User modes. When the User mode is configured, it
> selects automatically the SPI slave device until the CE_STOP_ACTIVE
> bit is set to 1. When any other modes are configured the device is
> unselected. The HW logic handles the chip select automatically when
> the flash is accessed through its AHB window.
>=20
> When configuring the CEx Control Register, the User mode logic to
> select and unselect the slave is incorrect and data corruption can be
> seen on machines using two chips, witherspoon and romulus.
>=20
> Rework the handler setting the CEx Control Register to fix this issue.=

>=20
> Fixes: 7c1c69bca43c ("ast2400: add SMC controllers (FMC and SPI)")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Champion!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
