Received: by 10.28.71.27 with SMTP id u27csp5336724wma;
        Tue, 27 Feb 2018 14:33:58 -0800 (PST)
X-Google-Smtp-Source: AH8x2246yTJGetfDKJMm9U7MgkQnH8qSJ4Xb5Z1BAQAOxve1TH+s2QK0rCYe490/ltqABSfrv2/r
X-Received: by 10.129.174.20 with SMTP id m20mr10868751ywh.401.1519770838537;
        Tue, 27 Feb 2018 14:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519770838; cv=none;
        d=google.com; s=arc-20160816;
        b=abYB5X4kGH91DoO6ZKsI0ajg65X9dGGSeipSCGLCNLbM+LbmYFgTGla17EedXsmrp/
         eVJ64bUD7QGebiuPRYOx2aRX/vQSoh/QwlvQ/QapDzFImxq6kYYP7gaLTS847VyS/E19
         3P4LLQDf7Z1OvWFVh6HYiTcAaDHb9yk0LXa2xAJWDbcc4OkpNxidaZd4npzwb8iQGWJb
         kSwsxN2Vkz6l+lupUtKtzMguJs9cK1L2kQfUrderklb0dN5zb136VmDEGhhSZwtIrm7c
         7RRhR1+VDMvnNxyMkIXVOhjs/s4r77rnUkx9OUe705pNPQCrLb1HhyrVd75Yelo/QV6K
         gRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=57adKdu0hKOE4+GLSIE7Z0q25u9QsxkiN+PVgeZW+/0=;
        b=DXH6X2/kP3F7Ab3a5zX95wMP94aLPezEvdRf9nfyD4L/7Hc9usngRwUXSG4cAaEskA
         Z8D4fzU8y+PGG5ouLT6SY9FNOR7BxNegOm2eufEuCnTIqjqQeHxrRYZXO9+fnYZ/v/Ps
         J6DTJReBQItooU7QktGhQnuzf3aLgTt61u8Sg2LUQsReSltqN/tAKzX2NXEPr0S3/xUI
         uKiQHE0w43F/iu2gd+eKhYxc96I6Sq4pvZRQWDwMm6rixM/jHRBCaPZxQmIRJbSaV3UU
         Ct0ItHb8mGO0XabktQBr2ivx55VUb0xseo+bYaJA++R2W9CE2qo+CB2wYp/+73SNL+XX
         b58g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QI63XTkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f82-v6si33793ybc.476.2018.02.27.14.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 14:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QI63XTkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqnos-0001Tz-1z
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 17:33:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eqnol-0001Tk-3C
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:33:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eqnoj-0003no-SY
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:33:51 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:42092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eqnoj-0003nA-Hr; Tue, 27 Feb 2018 17:33:49 -0500
Received: by mail-lf0-x242.google.com with SMTP id t204so616945lff.9;
	Tue, 27 Feb 2018 14:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=57adKdu0hKOE4+GLSIE7Z0q25u9QsxkiN+PVgeZW+/0=;
	b=QI63XTkC2mBbXtYtsFaBm4EwYhDVFOaW9jSMRAS7TI28N4noH1U/kHHrnCTprBDsbD
	Hx4Uv8WsF0L++ob0xWh0D2Ym91bAzeg97uuSqgseUpE56IlHrABoYREWRUb7EwLn/LiD
	LcuF8NRECjZdXcjA5gEKdmh8jX1W1H2Su2oE9bfFHkaa+73oYV196JJAvJ9eCnOv0VsG
	phc8flYbPQTtCMX+W8g1HBcZfd6G9/u6tYI/GqFQjAMKOWLJU6rHPDYiWT9r2Y4f6zul
	0wfpP500z5ihRwxZ1BWDPus6jxtoXNC+gPSzPwnPJAFVtUvYMEOpc0kNses33hde2eFm
	Ooow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=57adKdu0hKOE4+GLSIE7Z0q25u9QsxkiN+PVgeZW+/0=;
	b=nNkXNF5VYv7aiT1czLn6RPmuwRx4T6S1+c8tp02w0KHgsnJPrbnY/mNotXn23cZSri
	wQGSDoJO+a4H5sdpAB/9tTqDXmB+E+xjQ3CHyMkkP+rzU8U3lN2Y7XSGikNrjsGOA3JK
	bZAeuiD5mt7NEFHiA6adxkG5/dhEriMZols4t3UoZ9XKvsYNCGu211GAxV+7oAVvehpF
	DUKrN64gYecvIJu9VsdjwUK9aQaDSIIoco5Jt4SIAdYoJUMY6DrUHn1rsPlfdiEzMkmD
	HRUnOCLISMOpGdWwBTinjKKrflJJGszrNq9g28tK69PtIQNiRB+ytyVj08ZKyqWQaE7b
	/5lQ==
X-Gm-Message-State: APf1xPA35pMw2LFWlqqVNDa6bdbvju0s9pMfhW4rL+aRIq/2vmk3jw6O
	kqQx7oU6V58NxwU4Z96SbhBBVJ0bdSc7ejZaaJ8=
X-Received: by 10.46.7.80 with SMTP id i16mr8258236ljd.78.1519770828266; Tue,
	27 Feb 2018 14:33:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.32.215 with HTTP; Tue, 27 Feb 2018 14:33:17 -0800 (PST)
In-Reply-To: <20170922171323.10348-4-f4bug@amsat.org>
References: <20170922171323.10348-1-f4bug@amsat.org>
	<20170922171323.10348-4-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 27 Feb 2018 14:33:17 -0800
X-Google-Sender-Auth: gDRFDkh0_OFkQ9-WUXGNyVsrR8o
Message-ID: <CAKmqyKMnvTe5xQ8vTH28voRh+K5jxjcPJ1X8MBSKX--HUhxA2g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 3/7] hw/mdio: Generalize phy
 initialization routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Grant Likely <grant.likely@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c4/Llx41fMzI

On Fri, Sep 22, 2017 at 10:13 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> From: Grant Likely <grant.likely@arm.com>
>
> There really isn't anything tdk-specific about tdk_init() other than the
> phy id registers. The function should instead be generalized for any
> phy, at least as far as the ID registers are concerned. For the most
> part the read/write behaviour should be very similar across PHYs.
>
> This patch renames tdk_{read,write,init}() to mdio_phy_*() so it can be
> used for any PHY.
>
> More work definitely needs to be done here to make it easy to override
> the default behaviour for specific PHYs, but this at least is a
> reasonable start.
>
> Signed-off-by: Grant Likely <grant.likely@arm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: just rebased]
> ---
>  include/hw/net/mdio.h   |  2 +-
>  hw/net/etraxfs_eth.c    |  2 +-
>  hw/net/mdio.c           | 14 +++++++-------
>  hw/net/xilinx_axienet.c |  2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/net/mdio.h b/include/hw/net/mdio.h
> index 7ffa4389b9..b3b4f497c0 100644
> --- a/include/hw/net/mdio.h
> +++ b/include/hw/net/mdio.h
> @@ -86,7 +86,7 @@ struct qemu_mdio {
>      struct qemu_phy *devs[32];
>  };
>
> -void tdk_init(struct qemu_phy *phy);
> +void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2);
>  void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy,
>                   unsigned int addr);
>  uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req)=
;
> diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
> index f8d8f8441d..4c5415771f 100644
> --- a/hw/net/etraxfs_eth.c
> +++ b/hw/net/etraxfs_eth.c
> @@ -333,7 +333,7 @@ static int fs_eth_init(SysBusDevice *sbd)
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>
>
> -    tdk_init(&s->phy);
> +    mdio_phy_init(&s->phy, 0x0300, 0xe400);
>      mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
>      return 0;
>  }
> diff --git a/hw/net/mdio.c b/hw/net/mdio.c
> index 3d70d99077..33bfbb4623 100644
> --- a/hw/net/mdio.c
> +++ b/hw/net/mdio.c
> @@ -43,7 +43,7 @@
>   * linux driver (PHYID and Diagnostics reg).
>   * TODO: Add friendly names for the register nums.
>   */
> -static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
> +static unsigned int mdio_phy_read(struct qemu_phy *phy, unsigned int req=
)
>  {
>      int regnum;
>      unsigned r =3D 0;
> @@ -107,7 +107,7 @@ static unsigned int tdk_read(struct qemu_phy *phy, un=
signed int req)
>      return r;
>  }
>
> -static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned i=
nt data)
> +static void mdio_phy_write(struct qemu_phy *phy, unsigned int req, unsig=
ned int data)
>  {
>      int regnum;
>
> @@ -120,18 +120,18 @@ static void tdk_write(struct qemu_phy *phy, unsigne=
d int req, unsigned int data)
>      }
>  }
>
> -void tdk_init(struct qemu_phy *phy)
> +void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2)
>  {
>      phy->regs[PHY_CTRL] =3D 0x3100;
>      /* PHY Id. */
> -    phy->regs[PHY_ID1] =3D 0x0300;
> -    phy->regs[PHY_ID2] =3D 0xe400;
> +    phy->regs[PHY_ID1] =3D id1;
> +    phy->regs[PHY_ID2] =3D id2;

These should be set by QEMU properties instead of values to the init() func=
tion.

Alistair

>      /* Autonegotiation advertisement reg. */
>      phy->regs[PHY_AUTONEG_ADV] =3D 0x01e1;
>      phy->link =3D 1;
>
> -    phy->read =3D tdk_read;
> -    phy->write =3D tdk_write;
> +    phy->read =3D mdio_phy_read;
> +    phy->write =3D mdio_phy_write;
>  }
>
>  void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned i=
nt addr)
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 1e859fdaae..408cd6e675 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -791,7 +791,7 @@ static void xilinx_enet_realize(DeviceState *dev, Err=
or **errp)
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>
> -    tdk_init(&s->TEMAC.phy);
> +    mdio_phy_init(&s->TEMAC.phy, 0x0300, 0xe400);
>      mdio_attach(&s->TEMAC.mdio_bus, &s->TEMAC.phy, s->c_phyaddr);
>
>      s->TEMAC.parent =3D s;
> --
> 2.14.1
>
>
