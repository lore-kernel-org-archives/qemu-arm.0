Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2453578wrt;
        Sun, 13 Jan 2019 14:53:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7XfTFnioIYiVa+MMZouebHBNQC7SbVNX6H2jA4EdH3+S3crryzhODds2qod33OdrRrS4B3
X-Received: by 2002:adf:ca13:: with SMTP id o19mr21610302wrh.148.1547419995231;
        Sun, 13 Jan 2019 14:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547419995; cv=none;
        d=google.com; s=arc-20160816;
        b=mCTubOYpLgv/WGDV683RqpitjJ4x7rO3pED+IKDdaxGuOCvbZ4yrtUHs1LpZJkzgCx
         PA83QqOmT3oc+kAX4c9ku7HrIayW4REV6a5MNAEyC1ihnif+ND6MDBKlvv31DALzJB2G
         no9XjZ8SW6Xu8VUn9brJoXifcP1k3aDc/XEg4nTdzmAkQTC2TUrkEiTlMMvP19XSyGKP
         OcDNT91OpnPxq5iFmKYVxiMt1ef3Xub+B8Xd1WSQA0oxHMUa9NAJSfhAZj/OTMPGT0Mo
         uky+cMLd/oORbLxFXWmtTaUKmJBSG0+O+21GFMIUlwGg9j5qztcO21YumjoShAYDK3jd
         XToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:date
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature;
        bh=MlB9fy72D3v4gaAasUVTRmtMUijfU37oYs6QbPJZNhU=;
        b=G5HqsxXT2rHtWIeeebrAgc7VmD5cQ7PMLnCnAhov6ZDjqwX2dcXvM9sNv4Y+KtbgmS
         81xb2QnK/L/5fLXOajx1N3T/wAOf5S8JeA8hDRYm6fB0IMDC+7cTU9ocDtrt5L1Ou+Wd
         M9E+y8S5kiT3bOCz8BbM1cLO65bJbmae8XNZb9BpRGge09bxO3unJaUvO7R1NZSCDBAJ
         rOS1Fy0U2vsP+xnQvWztJWpN7xDUWYXmtQlc/ETEe801SF6uLPv65Az3pI0tErbkccnT
         IA1QIS4i7Hibpzybs1G5F21vxbliPXl98uBNsXFv+ZnJy2Aub03SASGl9m0EsY7+38E2
         toew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=XjdnIAUQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mSWyBmTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si21233670wrg.424.2019.01.13.14.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 14:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=XjdnIAUQ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mSWyBmTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giod0-0007fl-6C
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 17:53:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1giocc-0007ci-8Y
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 17:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1gioca-00016U-6g
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 17:52:50 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50313)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1giocZ-00014R-TH; Sun, 13 Jan 2019 17:52:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7CED828B03;
	Sun, 13 Jan 2019 17:52:45 -0500 (EST)
Received: from web3 ([10.202.2.213])
	by compute4.internal (MEProxy); Sun, 13 Jan 2019 17:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	message-id:from:to:cc:mime-version:content-transfer-encoding
	:content-type:references:subject:date:in-reply-to; s=fm1; bh=MlB
	9fy72D3v4gaAasUVTRmtMUijfU37oYs6QbPJZNhU=; b=XjdnIAUQSsuDUlD6GKY
	lc56BwidZkeqZmXTidvVWBoZU0ZUnXrvX2RfQh2uVcgpwjQsuOPTeFfY6Hbex83R
	68qGfPaWUbqVDeQaULvUJ3ztCx6ecUmWrsld7NwZaYn4C/dcL43UtjNuo97dcfwz
	oxHcfYerZ1e9mzCaD/4Qq7vm49OI20E7Kqpf+aOmIAgSAjvfpoTJiS2S2eWgdHD1
	/ctWn8cB6mKOgEbwN9/kb60+ekxs0HVg0PGc7ClT4uh7b3ffigqdSJDRmkbKQ1Nx
	YTeR0S+16+lYIHDu7sAEurjJgHCtPkAq7z7idtBofnmxeOr3YucB4g5D4VNpdorm
	kYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=MlB9fy72D3v4gaAasUVTRmtMUijfU37oYs6QbPJZN
	hU=; b=mSWyBmTC4jnhRMqpoNPQrA8E6R0UrjNb5qVX2bAX7sDtD9vIIt0l/9Mmp
	HaMqrGCR9P+ADhC/HN4eICg7LT+TPvciCQqYqaIYSkYiWMLGIGtRfCPRmsbW1Nl0
	gxBzWTDmKu6xIqO11UHc/pfE30alfSlxYeoegsbucWVHSqfU9I+Vosy9eSFd+ZhZ
	bOTiy0xm+DyQZ0RXt8q8dt0fp3RVa959xGqswZ6FTGyoyRSJEwA4acId6cfI1drx
	DIV+iPoY46XWmt7XcOr/+cjlm7AMlswuSuGozleaXe1iRs93DIN26vSJXhzH3TlZ
	gers5SpGxz++UPvGbRC36H8+G8jRg==
X-ME-Sender: <xms:PME7XLEy2Fr-idVOfU9-6-nCpWpTy3g4BG7CMIAbJNrw0DaZ1q9I_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgddtfecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
	hfufffjgesthhqredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
	rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
	gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:PME7XMmQ6cUe-umudhCSXv7yZC-jFq3aqzwdbY0XwfGWH0xdKKSUjg>
	<xmx:PME7XIIofqVQ-L-bsVKZVzOkZ4jKiNofEpwXS8m-RD5w-RHf5zYsTg>
	<xmx:PME7XNYU8_H5A8ZPoiNMtmVvz75QBftkiWekaRa1_s_KfOZK5M87ww>
	<xmx:PcE7XBU4WmbOCQ5mGHXYn-TpO_FQfFUYm2e1HlqYSG3TAXC1JblU3w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 48F479E564; Sun, 13 Jan 2019 17:52:44 -0500 (EST)
Message-Id: <1547419964.2320441.1633570656.2776A395@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
References: <20190111125759.31577-1-clg@kaod.org>
Date: Mon, 14 Jan 2019 09:22:44 +1030
In-Reply-To: <20190111125759.31577-1-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH] ftgmac100: implement the new MDIO interface
 on Aspeed SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hCdswCnKaYFr



On Fri, 11 Jan 2019, at 23:27, C=C3=A9dric Le Goater wrote:
> The PHY behind the MAC of an Aspeed SoC can be controlled using two
> different MDC/MDIO interfaces. The same registers PHYCR (MAC60) and
> PHYDATA (MAC64) are involved but they have a different layout.
>=20
> BIT31 of the Feature Register (MAC40) controls which MDC/MDIO
> interface is active.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/net/ftgmac100.c | 80 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 68 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 909c1182eebe..790430346b51 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -89,6 +89,18 @@
>  #define FTGMAC100_PHYDATA_MIIWDATA(x)       ((x) & 0xffff)
>  #define FTGMAC100_PHYDATA_MIIRDATA(x)       (((x) >> 16) & 0xffff)
>=20=20
> +/*
> + * PHY control register - New MDC/MDIO interface
> + */
> +#define FTGMAC100_PHYCR_NEW_DATA(x)     (((x) >> 16) & 0xffff)
> +#define FTGMAC100_PHYCR_NEW_FIRE        (1 << 15)
> +#define FTGMAC100_PHYCR_NEW_ST_22       (1 << 12)
> +#define FTGMAC100_PHYCR_NEW_OP(x)       (((x) >> 10) & 3)
> +#define   FTGMAC100_PHYCR_NEW_OP_WRITE    0x1
> +#define   FTGMAC100_PHYCR_NEW_OP_READ     0x2
> +#define FTGMAC100_PHYCR_NEW_DEV(x)      (((x) >> 5) & 0x1f)
> +#define FTGMAC100_PHYCR_NEW_REG(x)      ((x) & 0x1f)
> +
>  /*
>   * Feature Register
>   */
> @@ -269,9 +281,9 @@ static void phy_reset(FTGMAC100State *s)
>      s->phy_int =3D 0;
>  }
>=20=20
> -static uint32_t do_phy_read(FTGMAC100State *s, int reg)
> +static uint16_t do_phy_read(FTGMAC100State *s, uint8_t reg)
>  {
> -    uint32_t val;
> +    uint16_t val;
>=20=20
>      switch (reg) {
>      case MII_BMCR: /* Basic Control */
> @@ -336,7 +348,7 @@ static uint32_t do_phy_read(FTGMAC100State *s, int re=
g)
>                         MII_BMCR_FD | MII_BMCR_CTST)
>  #define MII_ANAR_MASK 0x2d7f
>=20=20
> -static void do_phy_write(FTGMAC100State *s, int reg, uint32_t val)
> +static void do_phy_write(FTGMAC100State *s, uint8_t reg, uint16_t val)
>  {
>      switch (reg) {
>      case MII_BMCR:     /* Basic Control */
> @@ -373,6 +385,55 @@ static void do_phy_write(FTGMAC100State *s, int=20
> reg, uint32_t val)
>      }
>  }
>=20=20
> +static void do_phy_new_ctl(FTGMAC100State *s)
> +{
> +    uint8_t reg;
> +    uint16_t data;
> +
> +    if (!(s->phycr & FTGMAC100_PHYCR_NEW_ST_22)) {
> +        qemu_log_mask(LOG_UNIMP, "%s: unsupported ST code\n", __func__);
> +        return;
> +    }
> +
> +    /* Nothing to do */
> +    if (!(s->phycr & FTGMAC100_PHYCR_NEW_FIRE)) {
> +        return;
> +    }
> +
> +    reg =3D FTGMAC100_PHYCR_NEW_REG(s->phycr);
> +    data =3D FTGMAC100_PHYCR_NEW_DATA(s->phycr);
> +
> +    switch (FTGMAC100_PHYCR_NEW_OP(s->phycr)) {
> +    case FTGMAC100_PHYCR_NEW_OP_WRITE:
> +        do_phy_write(s, reg, data);
> +        break;
> +    case FTGMAC100_PHYCR_NEW_OP_READ:
> +        s->phydata =3D do_phy_read(s, reg) & 0xffff;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid OP code %08x\n",
> +                      __func__, s->phycr);
> +    }
> +
> +    s->phycr &=3D ~FTGMAC100_PHYCR_NEW_FIRE;
> +}
> +
> +static void do_phy_ctl(FTGMAC100State *s)
> +{
> +    uint8_t reg =3D FTGMAC100_PHYCR_REG(s->phycr);
> +
> +    if (s->phycr & FTGMAC100_PHYCR_MIIWR) {
> +        do_phy_write(s, reg, s->phydata & 0xffff);
> +        s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
> +    } else if (s->phycr & FTGMAC100_PHYCR_MIIRD) {
> +        s->phydata =3D do_phy_read(s, reg) << 16;
> +        s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no OP code %08x\n",
> +                      __func__, s->phycr);
> +    }
> +}
> +
>  static int ftgmac100_read_bd(FTGMAC100Desc *bd, dma_addr_t addr)
>  {
>      if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))) {
> @@ -628,7 +689,6 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
>                            uint64_t value, unsigned size)
>  {
>      FTGMAC100State *s =3D FTGMAC100(opaque);
> -    int reg;
>=20=20
>      switch (addr & 0xff) {
>      case FTGMAC100_ISR: /* Interrupt status */
> @@ -711,14 +771,11 @@ static void ftgmac100_write(void *opaque, hwaddr ad=
dr,
>          break;
>=20=20
>      case FTGMAC100_PHYCR:  /* PHY Device control */
> -        reg =3D FTGMAC100_PHYCR_REG(value);
>          s->phycr =3D value;
> -        if (value & FTGMAC100_PHYCR_MIIWR) {
> -            do_phy_write(s, reg, s->phydata & 0xffff);
> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
> +        if (s->revr & FTGMAC100_REVR_NEW_MDIO_INTERFACE) {
> +            do_phy_new_ctl(s);
>          } else {
> -            s->phydata =3D do_phy_read(s, reg) << 16;
> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
> +            do_phy_ctl(s);
>          }
>          break;
>      case FTGMAC100_PHYDATA:
> @@ -728,8 +785,7 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
>          s->dblac =3D value;
>          break;
>      case FTGMAC100_REVR:  /* Feature Register */
> -        /* TODO: Only Old MDIO interface is supported */
> -        s->revr =3D value & ~FTGMAC100_REVR_NEW_MDIO_INTERFACE;
> +        s->revr =3D value;
>          break;
>      case FTGMAC100_FEAR1: /* Feature Register 1 */
>          s->fear1 =3D value;
> --=20
> 2.20.1
>=20
