Received: by 10.28.71.27 with SMTP id u27csp5334717wma;
        Tue, 27 Feb 2018 14:31:25 -0800 (PST)
X-Google-Smtp-Source: AH8x225dR8hVWLPLOVW4jDO6pKBz38r1gT8slb4y/yxHouy1zzkBWm7Y8zFxoBn9+ERVuNPpULtM
X-Received: by 10.13.218.2 with SMTP id c2mr10590646ywe.13.1519770685725;
        Tue, 27 Feb 2018 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519770685; cv=none;
        d=google.com; s=arc-20160816;
        b=Nib2EBAxl3qJSFR4qtOB3Ybgqe1c3hldKijeUzu5ZGxXHxIYcZmlqy0Hmdfz1Q/hFl
         8Sh675vmjGOm8BUaPEUQv8xrl+8sn8oFoLNTNmkbPLLsGCG9B/EDU0OGnR8wh91R3Hnv
         6PR9BDVQjhQcYQbs4+Xke+VDc3l/p6mwAN9LlNQMg8DujF+adCVN3r1BVjQFI61OzDGM
         3NJ/frACzHhY6bUDcF7AKjZs3sG8u2HqsuS41OrSJKMB+D2GgyJGJZL7JYWeDUO8vUbw
         VQekK4BZfW5jZc55cuiLTGgpzkFzp0uqXrPSn4Gq2z+beSVhufi1L2oSMP0yIc1LeSSA
         pwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=dcrbLUEgi7mF/jaOya4/XcFfr2mI/jHP8CiNeqKyXjg=;
        b=bd4IpDu2Zq5G/7rYT5EVVgRZRVQDJrxnDY1Y+IhBAeGqR/ebFHCvDBfnl3H4ngVmIj
         Gdhuu9Fae22b19Ay3+2NxnXhpMYLXuzMGtxP0tl2yngS3YSGm5wp9bF+edagltk5l92O
         sIqdHuOq19yRm3z3eE0FTZepsawGuHcoVWxfL2AhStfd1T5PrY1dY7LOM8AoF9e0ZOoJ
         n7bjN2KQuib1aajROIifE1yoAA1l2vIi40r7+DCCtlewRe41IbGR7J6GnhEWY+P7OTfG
         euZYE4NmcxnkPqqFQOJPa31u3gOLMWn4r8e9qNAoohblr8QDIdCCV3K9aFfNwPa0poSG
         egvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=STJBN9FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65-v6si33346yby.381.2018.02.27.14.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 14:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=STJBN9FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqnmP-0008VU-5q
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 17:31:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eqnmC-0008Ux-HB
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:31:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eqnm9-0001pr-H0
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:31:12 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:41677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eqnm9-0001pX-0X; Tue, 27 Feb 2018 17:31:09 -0500
Received: by mail-lf0-x244.google.com with SMTP id m69so612548lfe.8;
	Tue, 27 Feb 2018 14:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=dcrbLUEgi7mF/jaOya4/XcFfr2mI/jHP8CiNeqKyXjg=;
	b=STJBN9FNWhUXL7Qyt9SKCUz1ZyUJNi8L6HacxwlwnH+S/XpOebwosvFFCCCj/jawJw
	Xqco6+Qkp8P5y4HGUiRoCU5sTiS606NbRDHXU5rwal14Zs/0C2QGah1CCSRjaoiv+dq3
	N5/+t5a/AGnPrpCIvIGj2ZV6rJkWS6YAnZJ+MlAnP8Z1THk2tQlsLR9/5NVXPpSYvEqQ
	HcEU6qc7dkiplfYWSWCdCBZdxzhmMiFqYOzZ+Kl8rt+Gnz2VdBybCWpHOXtqAYu8tQiy
	MTS/i90f1tEgQc2URaZyy4Cp0QNIpY5x9JUCpuFe+HlZPrTSJxzdNCBzqKuLAWnnMugd
	6WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=dcrbLUEgi7mF/jaOya4/XcFfr2mI/jHP8CiNeqKyXjg=;
	b=dWWPLB8lv9tQ4bhdXLx1ZJJ2dRSt2xLfeI8Q1XFELcl0vPWbeywQcm0GpFZGTg5MGr
	Qs6amZUzsst0XshyK2Bla874fqa11lpmFrzGSqd4DvSSyYYzkaflgyH/G3FCfZYoM2Jj
	hQQbt8fbyIysEi4q7D5zpDeqp2tuc6FPv88iSGFO8T0BniUjLsJ9gUteIKXRFapqicKw
	tGdBmU1YS2qqpgKqS/PVw91ajup4/8xO6YzgzWx6EPftnmdvPul38l/HktELuBVYmHYu
	n0nXMyq4KkT0ST+Cp+kRBrprYWm0e34jr/roeUFasnBEJEU4a4AHKDTJT/6YKIENN5ug
	IbNg==
X-Gm-Message-State: APf1xPC5U/3aCQoDn/L35nn4FlcwS5VR1rHnoMc/JeMm/7jeMpQd4Tfv
	m1+9bP3C5LCA8zurU+4dcu1vWZcrNFariMOrMZI=
X-Received: by 10.25.170.144 with SMTP id t138mr2990453lfe.71.1519770667214;
	Tue, 27 Feb 2018 14:31:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.32.215 with HTTP; Tue, 27 Feb 2018 14:30:36 -0800 (PST)
In-Reply-To: <20170922171323.10348-2-f4bug@amsat.org>
References: <20170922171323.10348-1-f4bug@amsat.org>
	<20170922171323.10348-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 27 Feb 2018 14:30:36 -0800
X-Google-Sender-Auth: UAAG7YEK6V00IRbHaY-MDzbS2Ik
Message-ID: <CAKmqyKPK9qCkZC0V_UpZrYVhK2GXj53MkUwNhM2SMRfeH=RMjg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/7] hw/mdio: Generalize
 etraxfs MDIO bitbanging emulation
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
X-TUID: T3mrmjQzLAua

On Fri, Sep 22, 2017 at 10:13 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> From: Grant Likely <grant.likely@arm.com>
>
> The etraxfs and Xilinx axienet Ethernet models implement quite a nice
> MDIO core that supports both bitbanging and direct register access. This
> change factors the common code out into a separate file. There are no
> functional changes here, just movement of code.
>
> The etraxfs and axienet are slightly different. The etraxfs version
> includes the bitbang state processing, but the axienet version has a
> minor enhancement for read/write of phy registers without using bitbang
> state variables.  This patch generalizes the etraxfs version, with the
> axienet change backported in.
>
> Signed-off-by: Grant Likely <grant.likely@arm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: rebased with a minor checkpatch fix]
> ---
>  include/hw/net/mdio.h   |  76 +++++++++++++
>  hw/net/etraxfs_eth.c    | 278 +-----------------------------------------=
------
>  hw/net/mdio.c           | 262 ++++++++++++++++++++++++++++++++++++++++++=
+++
>  hw/net/xilinx_axienet.c | 187 +-------------------------------
>  hw/net/Makefile.objs    |   2 +
>  5 files changed, 344 insertions(+), 461 deletions(-)
>  create mode 100644 include/hw/net/mdio.h
>  create mode 100644 hw/net/mdio.c
>
> diff --git a/include/hw/net/mdio.h b/include/hw/net/mdio.h
> new file mode 100644
> index 0000000000..ac36aed3c3
> --- /dev/null
> +++ b/include/hw/net/mdio.h
> @@ -0,0 +1,76 @@
> +#ifndef BITBANG_MDIO_H
> +#define BITBANG_MDIO_H
> +
> +/*
> + * QEMU Bitbang Ethernet MDIO bus & PHY controllers.
> + *
> + * Copyright (c) 2008 Edgar E. Iglesias, Axis Communications AB.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +/* PHY Advertisement control register */
> +#define PHY_ADVERTISE_10HALF    0x0020  /* Try for 10mbps half-duplex  *=
/
> +#define PHY_ADVERTISE_10FULL    0x0040  /* Try for 10mbps full-duplex  *=
/
> +#define PHY_ADVERTISE_100HALF   0x0080  /* Try for 100mbps half-duplex *=
/
> +#define PHY_ADVERTISE_100FULL   0x0100  /* Try for 100mbps full-duplex *=
/
> +
> +struct qemu_phy {
> +    uint32_t regs[32];
> +
> +    int link;
> +
> +    unsigned int (*read)(struct qemu_phy *phy, unsigned int req);
> +    void (*write)(struct qemu_phy *phy, unsigned int req, unsigned int d=
ata);
> +};
> +
> +struct qemu_mdio {
> +    /* bus. */
> +    int mdc;
> +    int mdio;
> +
> +    /* decoder.  */
> +    enum {
> +        PREAMBLE,
> +        SOF,
> +        OPC,
> +        ADDR,
> +        REQ,
> +        TURNAROUND,
> +        DATA
> +    } state;
> +    unsigned int drive;
> +
> +    unsigned int cnt;
> +    unsigned int addr;
> +    unsigned int opc;
> +    unsigned int req;
> +    unsigned int data;
> +
> +    struct qemu_phy *devs[32];
> +};
> +
> +void tdk_init(struct qemu_phy *phy);
> +void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy,
> +                 unsigned int addr);
> +uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req)=
;
> +void mdio_write_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req, ui=
nt16_t data);
> +void mdio_cycle(struct qemu_mdio *bus);
> +
> +#endif
> diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
> index 013c8d0a41..f8d8f8441d 100644
> --- a/hw/net/etraxfs_eth.c
> +++ b/hw/net/etraxfs_eth.c
> @@ -26,287 +26,11 @@
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "hw/cris/etraxfs.h"
> +#include "hw/net/mdio.h"
>  #include "qemu/error-report.h"
>
>  #define D(x)
>
> -/* Advertisement control register. */
> -#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  *=
/
> -#define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  *=
/
> -#define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex *=
/
> -#define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex *=
/
> -
> -/*
> - * The MDIO extensions in the TDK PHY model were reversed engineered fro=
m the
> - * linux driver (PHYID and Diagnostics reg).
> - * TODO: Add friendly names for the register nums.
> - */
> -struct qemu_phy
> -{
> -    uint32_t regs[32];
> -
> -    int link;
> -
> -    unsigned int (*read)(struct qemu_phy *phy, unsigned int req);
> -    void (*write)(struct qemu_phy *phy, unsigned int req, unsigned int d=
ata);
> -};
> -
> -static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
> -{
> -    int regnum;
> -    unsigned r =3D 0;
> -
> -    regnum =3D req & 0x1f;
> -
> -    switch (regnum) {
> -    case 1:
> -        if (!phy->link) {
> -            break;
> -        }
> -        /* MR1.     */
> -        /* Speeds and modes.  */
> -        r |=3D (1 << 13) | (1 << 14);
> -        r |=3D (1 << 11) | (1 << 12);
> -        r |=3D (1 << 5); /* Autoneg complete.  */
> -        r |=3D (1 << 3); /* Autoneg able.     */
> -        r |=3D (1 << 2); /* link.     */
> -        break;
> -    case 5:
> -        /* Link partner ability.
> -           We are kind; always agree with whatever best mode
> -           the guest advertises.  */
> -        r =3D 1 << 14; /* Success.  */
> -        /* Copy advertised modes.  */
> -        r |=3D phy->regs[4] & (15 << 5);
> -        /* Autoneg support.  */
> -        r |=3D 1;
> -        break;
> -    case 18:
> -    {
> -        /* Diagnostics reg.  */
> -        int duplex =3D 0;
> -        int speed_100 =3D 0;
> -
> -        if (!phy->link) {
> -            break;
> -        }
> -
> -        /* Are we advertising 100 half or 100 duplex ? */
> -        speed_100 =3D !!(phy->regs[4] & ADVERTISE_100HALF);
> -        speed_100 |=3D !!(phy->regs[4] & ADVERTISE_100FULL);
> -
> -        /* Are we advertising 10 duplex or 100 duplex ? */
> -        duplex =3D !!(phy->regs[4] & ADVERTISE_100FULL);
> -        duplex |=3D !!(phy->regs[4] & ADVERTISE_10FULL);
> -        r =3D (speed_100 << 10) | (duplex << 11);
> -    }
> -    break;
> -
> -    default:
> -        r =3D phy->regs[regnum];
> -        break;
> -    }
> -    D(printf("\n%s %x =3D reg[%d]\n", __func__, r, regnum));
> -    return r;
> -}
> -
> -static void
> -tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
> -{
> -    int regnum;
> -
> -    regnum =3D req & 0x1f;
> -    D(printf("%s reg[%d] =3D %x\n", __func__, regnum, data));
> -    switch (regnum) {
> -    default:
> -        phy->regs[regnum] =3D data;
> -        break;
> -    }
> -}
> -
> -static void
> -tdk_init(struct qemu_phy *phy)
> -{
> -    phy->regs[0] =3D 0x3100;
> -    /* PHY Id.  */
> -    phy->regs[2] =3D 0x0300;
> -    phy->regs[3] =3D 0xe400;
> -    /* Autonegotiation advertisement reg.  */
> -    phy->regs[4] =3D 0x01E1;
> -    phy->link =3D 1;
> -
> -    phy->read =3D tdk_read;
> -    phy->write =3D tdk_write;
> -}
> -
> -struct qemu_mdio
> -{
> -    /* bus.     */
> -    int mdc;
> -    int mdio;
> -
> -    /* decoder.  */
> -    enum {
> -        PREAMBLE,
> -        SOF,
> -        OPC,
> -        ADDR,
> -        REQ,
> -        TURNAROUND,
> -        DATA
> -    } state;
> -    unsigned int drive;
> -
> -    unsigned int cnt;
> -    unsigned int addr;
> -    unsigned int opc;
> -    unsigned int req;
> -    unsigned int data;
> -
> -    struct qemu_phy *devs[32];
> -};
> -
> -static void
> -mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int ad=
dr)
> -{
> -    bus->devs[addr & 0x1f] =3D phy;
> -}
> -
> -#ifdef USE_THIS_DEAD_CODE
> -static void
> -mdio_detach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int ad=
dr)
> -{
> -    bus->devs[addr & 0x1f] =3D NULL;
> -}
> -#endif
> -
> -static void mdio_read_req(struct qemu_mdio *bus)
> -{
> -    struct qemu_phy *phy;
> -
> -    phy =3D bus->devs[bus->addr];
> -    if (phy && phy->read) {
> -        bus->data =3D phy->read(phy, bus->req);
> -    } else {
> -        bus->data =3D 0xffff;
> -    }
> -}
> -
> -static void mdio_write_req(struct qemu_mdio *bus)
> -{
> -    struct qemu_phy *phy;
> -
> -    phy =3D bus->devs[bus->addr];
> -    if (phy && phy->write) {
> -        phy->write(phy, bus->req, bus->data);
> -    }
> -}
> -
> -static void mdio_cycle(struct qemu_mdio *bus)
> -{
> -    bus->cnt++;
> -
> -    D(printf("mdc=3D%d mdio=3D%d state=3D%d cnt=3D%d drv=3D%d\n",
> -        bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive));
> -#if 0
> -    if (bus->mdc) {
> -        printf("%d", bus->mdio);
> -    }
> -#endif
> -    switch (bus->state) {
> -    case PREAMBLE:
> -        if (bus->mdc) {
> -            if (bus->cnt >=3D (32 * 2) && !bus->mdio) {
> -                bus->cnt =3D 0;
> -                bus->state =3D SOF;
> -                bus->data =3D 0;
> -            }
> -        }
> -        break;
> -    case SOF:
> -        if (bus->mdc) {
> -            if (bus->mdio !=3D 1) {
> -                printf("WARNING: no SOF\n");
> -            }
> -            if (bus->cnt =3D=3D 1*2) {
> -                bus->cnt =3D 0;
> -                bus->opc =3D 0;
> -                bus->state =3D OPC;
> -            }
> -        }
> -        break;
> -    case OPC:
> -        if (bus->mdc) {
> -            bus->opc <<=3D 1;
> -            bus->opc |=3D bus->mdio & 1;
> -            if (bus->cnt =3D=3D 2*2) {
> -                bus->cnt =3D 0;
> -                bus->addr =3D 0;
> -                bus->state =3D ADDR;
> -            }
> -        }
> -        break;
> -    case ADDR:
> -        if (bus->mdc) {
> -            bus->addr <<=3D 1;
> -            bus->addr |=3D bus->mdio & 1;
> -
> -            if (bus->cnt =3D=3D 5*2) {
> -                bus->cnt =3D 0;
> -                bus->req =3D 0;
> -                bus->state =3D REQ;
> -            }
> -        }
> -        break;
> -    case REQ:
> -        if (bus->mdc) {
> -            bus->req <<=3D 1;
> -            bus->req |=3D bus->mdio & 1;
> -            if (bus->cnt =3D=3D 5*2) {
> -                bus->cnt =3D 0;
> -                bus->state =3D TURNAROUND;
> -            }
> -        }
> -        break;
> -    case TURNAROUND:
> -        if (bus->mdc && bus->cnt =3D=3D 2*2) {
> -            bus->mdio =3D 0;
> -            bus->cnt =3D 0;
> -
> -            if (bus->opc =3D=3D 2) {
> -                bus->drive =3D 1;
> -                mdio_read_req(bus);
> -                bus->mdio =3D bus->data & 1;
> -            }
> -            bus->state =3D DATA;
> -        }
> -        break;
> -    case DATA:
> -        if (!bus->mdc) {
> -            if (bus->drive) {
> -                bus->mdio =3D !!(bus->data & (1 << 15));
> -                bus->data <<=3D 1;
> -            }
> -        } else {
> -            if (!bus->drive) {
> -                bus->data <<=3D 1;
> -                bus->data |=3D bus->mdio;
> -            }
> -            if (bus->cnt =3D=3D 16 * 2) {
> -                bus->cnt =3D 0;
> -                bus->state =3D PREAMBLE;
> -                if (!bus->drive) {
> -                    mdio_write_req(bus);
> -                }
> -                bus->drive =3D 0;
> -            }
> -        }
> -        break;
> -    default:
> -        break;
> -    }
> -}
> -
>  /* ETRAX-FS Ethernet MAC block starts here.  */
>
>  #define RW_MA0_LO      0x00
> diff --git a/hw/net/mdio.c b/hw/net/mdio.c
> new file mode 100644
> index 0000000000..3763fcc8af
> --- /dev/null
> +++ b/hw/net/mdio.c
> @@ -0,0 +1,262 @@
> +/*
> + * QEMU Ethernet MDIO bus & PHY models
> + *
> + * Copyright (c) 2008 Edgar E. Iglesias, Axis Communications AB.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + *
> + * This is a generic MDIO implementation.
> + *
> + * TODO:
> + * - Split PHYs out as separate device models so they can be defined and
> + *   instantiated separately from the MDIO bus.
> + * - Split out bitbang state machine into a separate model. Mostly this =
consists
> + *   of the mdio_cycle() routine and the bitbang state data in struct qe=
mu_mdio
> + * - Use the GPIO interface for driving bitbang
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/log.h"
> +#include "hw/net/mdio.h"
> +
> +#define D(x)

This should be updated to the new way to handle QEMU logging.

Otherwise this patch looks fine to me.

Alistair

> +
> +/*
> + * The MDIO extensions in the TDK PHY model were reversed engineered fro=
m the
> + * linux driver (PHYID and Diagnostics reg).
> + * TODO: Add friendly names for the register nums.
> + */
> +static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
> +{
> +    int regnum;
> +    unsigned r =3D 0;
> +
> +    regnum =3D req & 0x1f;
> +
> +    switch (regnum) {
> +    case 1:
> +        if (!phy->link) {
> +            break;
> +        }
> +        /* MR1.     */
> +        /* Speeds and modes.  */
> +        r |=3D (1 << 13) | (1 << 14);
> +        r |=3D (1 << 11) | (1 << 12);
> +        r |=3D (1 << 5); /* Autoneg complete.  */
> +        r |=3D (1 << 3); /* Autoneg able.     */
> +        r |=3D (1 << 2); /* link.     */
> +        r |=3D (1 << 1); /* link.     */
> +        break;
> +    case 5:
> +        /* Link partner ability.
> +           We are kind; always agree with whatever best mode
> +           the guest advertises.  */
> +        r =3D 1 << 14; /* Success.  */
> +        /* Copy advertised modes.  */
> +        r |=3D phy->regs[4] & (15 << 5);
> +        /* Autoneg support.  */
> +        r |=3D 1;
> +        break;
> +    case 17:
> +        /* Marvel PHY on many xilinx boards. */
> +        r =3D 0x8000; /* 1000Mb */
> +        break;
> +    case 18:
> +    {
> +        /* Diagnostics reg.  */
> +        int duplex =3D 0;
> +        int speed_100 =3D 0;
> +
> +        if (!phy->link) {
> +            break;
> +        }
> +
> +        /* Are we advertising 100 half or 100 duplex ? */
> +        speed_100 =3D !!(phy->regs[4] & PHY_ADVERTISE_100HALF);
> +        speed_100 |=3D !!(phy->regs[4] & PHY_ADVERTISE_100FULL);
> +
> +        /* Are we advertising 10 duplex or 100 duplex ? */
> +        duplex =3D !!(phy->regs[4] & PHY_ADVERTISE_100FULL);
> +        duplex |=3D !!(phy->regs[4] & PHY_ADVERTISE_10FULL);
> +        r =3D (speed_100 << 10) | (duplex << 11);
> +    }
> +    break;
> +
> +    default:
> +        r =3D phy->regs[regnum];
> +        break;
> +    }
> +    D(printf("\n%s %x =3D reg[%d]\n", __func__, r, regnum));
> +    return r;
> +}
> +
> +static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned i=
nt data)
> +{
> +    int regnum;
> +
> +    regnum =3D req & 0x1f;
> +    D(printf("%s reg[%d] =3D %x\n", __func__, regnum, data));
> +    switch (regnum) {
> +    default:
> +        phy->regs[regnum] =3D data;
> +        break;
> +    }
> +}
> +
> +void tdk_init(struct qemu_phy *phy)
> +{
> +    phy->regs[0] =3D 0x3100;
> +    /* PHY Id. */
> +    phy->regs[2] =3D 0x0300;
> +    phy->regs[3] =3D 0xe400;
> +    /* Autonegotiation advertisement reg. */
> +    phy->regs[4] =3D 0x01e1;
> +    phy->link =3D 1;
> +
> +    phy->read =3D tdk_read;
> +    phy->write =3D tdk_write;
> +}
> +
> +void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned i=
nt addr)
> +{
> +    bus->devs[addr & 0x1f] =3D phy;
> +}
> +
> +uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req)
> +{
> +    struct qemu_phy *phy;
> +
> +    phy =3D bus->devs[bus->addr];
> +    if (phy && phy->read) {
> +        return phy->read(phy, req);
> +    }
> +    return 0xffff;
> +}
> +
> +void mdio_write_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req,
> +                    uint16_t data)
> +{
> +    struct qemu_phy *phy;
> +
> +    phy =3D bus->devs[bus->addr];
> +    if (phy && phy->write) {
> +        phy->write(phy, req, data);
> +    }
> +}
> +
> +void mdio_cycle(struct qemu_mdio *bus)
> +{
> +    bus->cnt++;
> +
> +    D(printf("mdc=3D%d mdio=3D%d state=3D%d cnt=3D%d drv=3D%d\n",
> +             bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive));
> +    switch (bus->state) {
> +    case PREAMBLE:
> +        if (bus->mdc) {
> +            if (bus->cnt >=3D (32 * 2) && !bus->mdio) {
> +                bus->cnt =3D 0;
> +                bus->state =3D SOF;
> +                bus->data =3D 0;
> +            }
> +        }
> +        break;
> +    case SOF:
> +        if (bus->mdc) {
> +            if (bus->mdio !=3D 1) {
> +                printf("WARNING: no SOF\n");
> +            }
> +            if (bus->cnt =3D=3D 1 * 2) {
> +                bus->cnt =3D 0;
> +                bus->opc =3D 0;
> +                bus->state =3D OPC;
> +            }
> +        }
> +        break;
> +    case OPC:
> +        if (bus->mdc) {
> +            bus->opc <<=3D 1;
> +            bus->opc |=3D bus->mdio & 1;
> +            if (bus->cnt =3D=3D 2 * 2) {
> +                bus->cnt =3D 0;
> +                bus->addr =3D 0;
> +                bus->state =3D ADDR;
> +            }
> +        }
> +        break;
> +    case ADDR:
> +        if (bus->mdc) {
> +            bus->addr <<=3D 1;
> +            bus->addr |=3D bus->mdio & 1;
> +
> +            if (bus->cnt =3D=3D 5 * 2) {
> +                bus->cnt =3D 0;
> +                bus->req =3D 0;
> +                bus->state =3D REQ;
> +            }
> +        }
> +        break;
> +    case REQ:
> +        if (bus->mdc) {
> +            bus->req <<=3D 1;
> +            bus->req |=3D bus->mdio & 1;
> +            if (bus->cnt =3D=3D 5 * 2) {
> +                bus->cnt =3D 0;
> +                bus->state =3D TURNAROUND;
> +            }
> +        }
> +        break;
> +    case TURNAROUND:
> +        if (bus->mdc && bus->cnt =3D=3D 2 * 2) {
> +            bus->mdio =3D 0;
> +            bus->cnt =3D 0;
> +
> +            if (bus->opc =3D=3D 2) {
> +                bus->drive =3D 1;
> +                bus->data =3D mdio_read_req(bus, bus->addr, bus->req);
> +                bus->mdio =3D bus->data & 1;
> +            }
> +            bus->state =3D DATA;
> +        }
> +        break;
> +    case DATA:
> +        if (!bus->mdc) {
> +            if (bus->drive) {
> +                bus->mdio =3D !!(bus->data & (1 << 15));
> +                bus->data <<=3D 1;
> +            }
> +        } else {
> +            if (!bus->drive) {
> +                bus->data <<=3D 1;
> +                bus->data |=3D bus->mdio;
> +            }
> +            if (bus->cnt =3D=3D 16 * 2) {
> +                bus->cnt =3D 0;
> +                bus->state =3D PREAMBLE;
> +                if (!bus->drive) {
> +                    mdio_write_req(bus, bus->addr, bus->req, bus->data);
> +                }
> +                bus->drive =3D 0;
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index d4c2c89dc1..1e859fdaae 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -26,13 +26,12 @@
>  #include "hw/sysbus.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "hw/net/mdio.h"
>  #include "net/net.h"
>  #include "net/checksum.h"
>
>  #include "hw/stream.h"
>
> -#define DPHY(x)
> -
>  #define TYPE_XILINX_AXI_ENET "xlnx.axi-ethernet"
>  #define TYPE_XILINX_AXI_ENET_DATA_STREAM "xilinx-axienet-data-stream"
>  #define TYPE_XILINX_AXI_ENET_CONTROL_STREAM "xilinx-axienet-control-stre=
am"
> @@ -48,189 +47,9 @@
>       OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>
> -/* Advertisement control register. */
> -#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  *=
/
> -#define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  *=
/
> -#define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex *=
/
> -#define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex *=
/
> -
>  #define CONTROL_PAYLOAD_WORDS 5
>  #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t))=
)
>
> -struct PHY {
> -    uint32_t regs[32];
> -
> -    int link;
> -
> -    unsigned int (*read)(struct PHY *phy, unsigned int req);
> -    void (*write)(struct PHY *phy, unsigned int req,
> -                  unsigned int data);
> -};
> -
> -static unsigned int tdk_read(struct PHY *phy, unsigned int req)
> -{
> -    int regnum;
> -    unsigned r =3D 0;
> -
> -    regnum =3D req & 0x1f;
> -
> -    switch (regnum) {
> -        case 1:
> -            if (!phy->link) {
> -                break;
> -            }
> -            /* MR1.  */
> -            /* Speeds and modes.  */
> -            r |=3D (1 << 13) | (1 << 14);
> -            r |=3D (1 << 11) | (1 << 12);
> -            r |=3D (1 << 5); /* Autoneg complete.  */
> -            r |=3D (1 << 3); /* Autoneg able.  */
> -            r |=3D (1 << 2); /* link.  */
> -            r |=3D (1 << 1); /* link.  */
> -            break;
> -        case 5:
> -            /* Link partner ability.
> -               We are kind; always agree with whatever best mode
> -               the guest advertises.  */
> -            r =3D 1 << 14; /* Success.  */
> -            /* Copy advertised modes.  */
> -            r |=3D phy->regs[4] & (15 << 5);
> -            /* Autoneg support.  */
> -            r |=3D 1;
> -            break;
> -        case 17:
> -            /* Marvell PHY on many xilinx boards.  */
> -            r =3D 0x8000; /* 1000Mb  */
> -            break;
> -        case 18:
> -            {
> -                /* Diagnostics reg.  */
> -                int duplex =3D 0;
> -                int speed_100 =3D 0;
> -
> -                if (!phy->link) {
> -                    break;
> -                }
> -
> -                /* Are we advertising 100 half or 100 duplex ? */
> -                speed_100 =3D !!(phy->regs[4] & ADVERTISE_100HALF);
> -                speed_100 |=3D !!(phy->regs[4] & ADVERTISE_100FULL);
> -
> -                /* Are we advertising 10 duplex or 100 duplex ? */
> -                duplex =3D !!(phy->regs[4] & ADVERTISE_100FULL);
> -                duplex |=3D !!(phy->regs[4] & ADVERTISE_10FULL);
> -                r =3D (speed_100 << 10) | (duplex << 11);
> -            }
> -            break;
> -
> -        default:
> -            r =3D phy->regs[regnum];
> -            break;
> -    }
> -    DPHY(qemu_log("\n%s %x =3D reg[%d]\n", __func__, r, regnum));
> -    return r;
> -}
> -
> -static void
> -tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
> -{
> -    int regnum;
> -
> -    regnum =3D req & 0x1f;
> -    DPHY(qemu_log("%s reg[%d] =3D %x\n", __func__, regnum, data));
> -    switch (regnum) {
> -        default:
> -            phy->regs[regnum] =3D data;
> -            break;
> -    }
> -
> -    /* Unconditionally clear regs[BMCR][BMCR_RESET] */
> -    phy->regs[0] &=3D ~0x8000;
> -}
> -
> -static void
> -tdk_init(struct PHY *phy)
> -{
> -    phy->regs[0] =3D 0x3100;
> -    /* PHY Id.  */
> -    phy->regs[2] =3D 0x0300;
> -    phy->regs[3] =3D 0xe400;
> -    /* Autonegotiation advertisement reg.  */
> -    phy->regs[4] =3D 0x01E1;
> -    phy->link =3D 1;
> -
> -    phy->read =3D tdk_read;
> -    phy->write =3D tdk_write;
> -}
> -
> -struct MDIOBus {
> -    /* bus.  */
> -    int mdc;
> -    int mdio;
> -
> -    /* decoder.  */
> -    enum {
> -        PREAMBLE,
> -        SOF,
> -        OPC,
> -        ADDR,
> -        REQ,
> -        TURNAROUND,
> -        DATA
> -    } state;
> -    unsigned int drive;
> -
> -    unsigned int cnt;
> -    unsigned int addr;
> -    unsigned int opc;
> -    unsigned int req;
> -    unsigned int data;
> -
> -    struct PHY *devs[32];
> -};
> -
> -static void
> -mdio_attach(struct MDIOBus *bus, struct PHY *phy, unsigned int addr)
> -{
> -    bus->devs[addr & 0x1f] =3D phy;
> -}
> -
> -#ifdef USE_THIS_DEAD_CODE
> -static void
> -mdio_detach(struct MDIOBus *bus, struct PHY *phy, unsigned int addr)
> -{
> -    bus->devs[addr & 0x1f] =3D NULL;
> -}
> -#endif
> -
> -static uint16_t mdio_read_req(struct MDIOBus *bus, unsigned int addr,
> -                  unsigned int reg)
> -{
> -    struct PHY *phy;
> -    uint16_t data;
> -
> -    phy =3D bus->devs[addr];
> -    if (phy && phy->read) {
> -        data =3D phy->read(phy, reg);
> -    } else {
> -        data =3D 0xffff;
> -    }
> -    DPHY(qemu_log("%s addr=3D%d reg=3D%d data=3D%x\n", __func__, addr, r=
eg, data));
> -    return data;
> -}
> -
> -static void mdio_write_req(struct MDIOBus *bus, unsigned int addr,
> -               unsigned int reg, uint16_t data)
> -{
> -    struct PHY *phy;
> -
> -    DPHY(qemu_log("%s addr=3D%d reg=3D%d data=3D%x\n", __func__, addr, r=
eg, data));
> -    phy =3D bus->devs[addr];
> -    if (phy && phy->write) {
> -        phy->write(phy, reg, data);
> -    }
> -}
> -
>  #define DENET(x)
>
>  #define R_RAF      (0x000 / 4)
> @@ -322,8 +141,8 @@ enum {
>
>  /* Indirect registers.  */
>  struct TEMAC  {
> -    struct MDIOBus mdio_bus;
> -    struct PHY phy;
> +    struct qemu_mdio mdio_bus;
> +    struct qemu_phy phy;
>
>      void *parent;
>  };
> diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
> index 4171af0b5d..a020963d10 100644
> --- a/hw/net/Makefile.objs
> +++ b/hw/net/Makefile.objs
> @@ -30,6 +30,8 @@ common-obj-$(CONFIG_SUNHME) +=3D sunhme.o
>  common-obj-$(CONFIG_FTGMAC100) +=3D ftgmac100.o
>  common-obj-$(CONFIG_SUNGEM) +=3D sungem.o
>
> +common-obj-y +=3D mdio.o
> +
>  obj-$(CONFIG_ETRAXFS) +=3D etraxfs_eth.o
>  obj-$(CONFIG_COLDFIRE) +=3D mcf_fec.o
>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-minimac2.o
> --
> 2.14.1
>
>
