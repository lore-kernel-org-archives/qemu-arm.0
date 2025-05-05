Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2299941njj;
        Mon, 5 May 2025 01:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNS2FefVzCDXqOvaPeIKC5/m1akOD2e3Flzb0OclSWpR2buKSH4MBG0pOGcpVA8RdAeXejUr7gXK0gNg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8h2QpmujF8HO/hZqLdEem7zKP4IbExI5x+3jMDPzsub+SN79RPoW1OpSmGTXZDJus7+Hp
X-Received: by 2002:a05:6214:2249:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f515730808mr220533296d6.7.1746435474865;
        Mon, 05 May 2025 01:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746435474; cv=none;
        d=google.com; s=arc-20240605;
        b=eB1errbxq606ogJXE1wZ0K6H1GWuLqLOukqEhGXTN6rkSyRLgqxZs30Ed6+84ZkMTM
         0Mbep2RhPY7BrgFu9JfHJxigSwGXk3LX0E3VarLG+wef9X6Ss6uszi+4nJyVpxJfXhDI
         62aSkJIhPhzXjVmRQ4NaI/KgWvdGDlqXgDMjpfo/iiQJesVyFKBh5InaQJVO0POCdS+T
         plxASDukYcIUCi5zImaZ761XPLIWoPzrPNt054w2tM7nu5TqeZTPDmvIv1B14sQ+jYib
         9ts1nFo7jnltGuD6C4RYvHM3fEZ/4FoIIxeuuSsSA+pyCOb9gP+3PlOKNtMQcejc6VIY
         UuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=xWxa5P7luR+paqOHTEZpEHOhd6NdPfg3m21va3t0F3M=;
        fh=RMScUtJiBDbawk2pInzonOlcFxOF5Le/X77FfUonBLw=;
        b=UANY7SnKgR/8ejYJz4VCaNwpZKb5EfCEz/rM867t2egKrv1rhm1iMicRU1Ha28nV1j
         BwyT+D8RrjQXI68bKg2O4s43QTEkDlvdme9oC9dHOCW5kf3sRz7rgfaziXwDA/UrICFt
         9hDHant3GS037ux8hcskyfE44kdpD/qhKnbRUH6AiroTPxs1ahnonje4NjSpGaI/AcUN
         QoVuVVcIqyiiw1farmxq5K5Pv10vEUriGlfGzBvPX3cPvg4M6ii2RFhdJgkfeU+cc7eK
         QFpsIdWIrecwkQJ7LZYzaPWZCZ2jNO1CUAs4fyyiKJ280Pyh/j5RI1CQooGoMZPq5JGM
         FElQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (no key) header.i=@beckhoff.com header.s=mail2022e header.b="a/MEsuMu";
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b=Hsd1aNF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f477178si89696456d6.203.2025.05.05.01.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 01:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (no key) header.i=@beckhoff.com header.s=mail2022e header.b="a/MEsuMu";
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b=Hsd1aNF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrdq-0008GS-5f; Mon, 05 May 2025 04:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1uBrdn-0008Fq-OJ; Mon, 05 May 2025 04:57:35 -0400
Received: from netsrv01.beckhoff.com ([62.159.14.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1uBrdk-0004Ua-Ky; Mon, 05 May 2025 04:57:34 -0400
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022e; 
 t=1746435450; bh=xWxa5P7luR+paqOHTEZpEHOhd6NdPfg3m21va3t0F3M=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=ed25519-sha256; b=
 a/MEsuMu2uwfax2W5qFp+xmvqWejg3ge3UG3qCrBoV99+XNo4XPa5CHnwwFGtX4KKs0BSYf4ZukrEUYNZH8DDw==
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022r; 
 t=1746435450; bh=xWxa5P7luR+paqOHTEZpEHOhd6NdPfg3m21va3t0F3M=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=rsa-sha256; b=
 Hsd1aNF7M6LR43XW72VXTNos22dFzYbZmzmQvEazIoWf+knjG6sHl/2ahbDyMDoxU2ojuhAl8K+n6Df1oHpenbvrkQzyKRF6CjpsXx3PS2bYcFCVYy9DBzdj0Z6vwpB4JW85xpRq3VOReUAJNSldKcje3eNGtm1Ha1Ij/sUBmYBmdRQGW8CaILAuTnukekkfh5kgCaAGEO339Ot+df6+R03FB7+aiTMRlJfd24eoE+QSAEQ6OKN6FeIDrAHESeKIVkndcWSSFUrbPu7+pFET3VmA5/gIoc01QomX7GTq4G9/Ac2rGtmBfut4Hc4s3Ocg+ad5ppAxUMSUEOM3d22E5w==
Received: from 172.17.6.19 by netsrv01.beckhoff.com
 (TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384); Mon, 05 May 2025 08:57:29 GMT
Received: from ex10.beckhoff.com (172.17.2.111) by ex13.beckhoff.com
 (172.17.6.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 5 May
 2025 10:57:28 +0200
Received: from ex10.beckhoff.com ([fe80::3762:2101:fb4e:8ffa]) by
 ex10.beckhoff.com ([fe80::ab7f:9a91:d220:441b%12]) with mapi id
 15.02.1748.010; Mon, 5 May 2025 10:57:28 +0200
From: =?utf-8?B?Q29ydmluIEvDtmhuZQ==?= <C.Koehne@beckhoff.com>
To: "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
CC: =?utf-8?B?WWFubmljayBWb8OfZW4=?= <Y.Vossen@beckhoff.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 00/21] hw/arm: add CX7200 board emulation
Thread-Topic: [PATCH 00/21] hw/arm: add CX7200 board emulation
Thread-Index: AQHbtQZjoxBVL03fhEyFDr1uFHQy2LO0rXSAgA7+agA=
Date: Mon, 5 May 2025 08:57:27 +0000
Message-ID: <ad0470842bc7e1fdc17edc6cc1d13668d916456e.camel@beckhoff.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <b4a0daac7b200e4ffc08879977dbde120a8d5f73.camel@beckhoff.com>
 <aAvpkV1ExuLthoH9@zapote>
In-Reply-To: <aAvpkV1ExuLthoH9@zapote>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.62.149]
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="=-8D6COArMecV0LJbJ0okm"
MIME-Version: 1.0
Received-SPF: pass client-ip=62.159.14.10; envelope-from=C.Koehne@beckhoff.com;
 helo=netsrv01.beckhoff.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +3JKhuDazGhk

--=-8D6COArMecV0LJbJ0okm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-04-25 at 21:59 +0200, Edgar E. Iglesias wrote:
> CAUTION: External Email!!
> On Thu, Apr 24, 2025 at 10:48:17AM +0000, Corvin K=C3=B6hne wrote:
> > On Tue, 2025-03-18 at 14:07 +0100, Corvin K=C3=B6hne wrote:
> > > CAUTION: External Email!!
> > > From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
> > >=20
> > > Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A=
9
> > > platform. This commit series adds the Beckhoff CX7200 as new board va=
riant
> > > to
> > > QEMU.
> > >=20
> > > The emulation is able to successfully boot an CX7200 image. The image
> > > includes
> > > some self tests executed on every boot. Only the cache self test fail=
s due
> > > to
> > > QEMU emulating the cache as always being coherent. The self tests inc=
lude
> > > f.e.:
> > >=20
> > > * Network
> > > * Flash
> > > * CCAT DMA + EEPROM [1]
> > > * TwinCAT (Beckhoff's automation control software [2])
> > >=20
> > > [1] https://github.com/beckhoff/ccat
> > > [2] https://www.beckhoff.com/en-us/products/automation/
> > >=20
> > > Corvin K=C3=B6hne (1):
> > > =C2=A0 MAINTAINERS: add myself as reviewer for Beckhoff devices
> > >=20
> > > YannickV (20):
> > > =C2=A0 hw/timer: Make frequency configurable
> > > =C2=A0 hw/timer: Make PERIPHCLK period configurable
> > > =C2=A0 hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffff=
ffff
> > > =C2=A0 hw/arm/zynq-devcfg: Prevent unintended unlock during initializ=
ation
> > > =C2=A0 hw/dma/zynq: Notify devcfg on FPGA reset via SLCR control
> > > =C2=A0 hw/dma/zynq-devcfg: Simulate dummy PL reset
> > > =C2=A0 hw/dma/zynq-devcfg: Indicate power-up status of PL
> > > =C2=A0 hw/dma/zynq-devcfg: Fix register memory
> > > =C2=A0 hw/misc: Add dummy ZYNQ DDR controller
> > > =C2=A0 hw/misc/zynq_slcr: Add logic for DCI configuration
> > > =C2=A0 hw/misc: Add Beckhoff CCAT device
> > > =C2=A0 hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff C=
X7200
> > > =C2=A0 hw/arm/beckhoff_CX7200: Remove second SD controller
> > > =C2=A0 hw/arm/beckhoff_CX7200: Remove second GEM
> > > =C2=A0 hw/arm/beckhoff_CX7200: Adjust Flashes and Busses
> > > =C2=A0 hw/arm/beckhoff_CX7200: Remove usb interfaces
> > > =C2=A0 hw/arm/beckhoff_CX7200: Remove unimplemented devices
> > > =C2=A0 hw/arm/beckhoff_CX7200: Set CPU frequency and PERIPHCLK period
> > > =C2=A0 hw/arm/beckhoff_CX7200: Add CCAT to CX7200
> > > =C2=A0 hw/arm/beckhoff_CX7200: Add dummy DDR CTRL to CX7200
> > >=20
> > > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 7 +
> > > =C2=A0hw/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
18 ++
> > > =C2=A0hw/arm/beckhoff_CX7200.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 440 ++++++++++++++++++++++++++++++
> > > =C2=A0hw/arm/
> > > https://nospamproxywebp.beckhoff.com/enQsig/link?id=3DBAgAAACF1PqAcgZ=
XNGoAAACSdE
> > > 7DUYKKiipqQsJl32BC_vIVe3kQ23Cr-DKSrQn5Y_I0ZnsAu8qZHVUsGVmYwKL0amQboD-
> > > LYv9rWN-
> > > mvEPUf2y-CZ1qrggzKI9xgbKnOi8XSPZVd2G0Lro-8fGR9tAuNB-
> > > 3CWjEaKli0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0 1 +
> > > =C2=A0hw/dma/xlnx-zynq-devcfg.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 36 ++-
> > > =C2=A0hw/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
6 +
> > > =C2=A0hw/misc/beckhoff_ccat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 365 +++++++++++++++++++++++++
> > > =C2=A0hw/misc/
> > > https://nospamproxywebp.beckhoff.com/enQsig/link?id=3DBAgAAACF1PqAcgZ=
XNGoAAACSdE
> > > 7DUYKKiipqQsJl32BC_vIVe3kQ23Cr-DKSrQn5Y_I0ZnsAu8qZHVUsGVmYwKL0amQboD-
> > > LYv9rWN-
> > > mvEPUf2y-CZ1qrggzKI9xgbKnOi8XSPZVd2G0Lro-8fGR9tAuNB-
> > > 3CWjEaKli0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0 2 +
> > > =C2=A0hw/misc/zynq_ddr-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 331 ++++++++++++++++++++++
> > > =C2=A0hw/misc/zynq_slcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 ++++
> > > =C2=A0hw/timer/a9gtimer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +-
> > > =C2=A0hw/timer/arm_mptimer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 33 ++-
> > > =C2=A0include/hw/dma/xlnx-zynq-devcfg.h |=C2=A0=C2=A0 3 +
> > > =C2=A0include/hw/timer/a9gtimer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +
> > > =C2=A0include/hw/timer/arm_mptimer.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
4 +
> > > =C2=A015 files changed, 1309 insertions(+), 11 deletions(-)
> > > =C2=A0create mode 100644 hw/arm/beckhoff_CX7200.c
> > > =C2=A0create mode 100644 hw/misc/beckhoff_ccat.c
> > > =C2=A0create mode 100644 hw/misc/zynq_ddr-ctrl.c
> >=20
> > Hi,
> >=20
> > any feedback for those commits?
> >=20
>=20
> Hi Corvin,
>=20
> Thanks for the reminder and sorry for the delay! I started reviewing and
> sending comments today. Cool work!
>=20
> It would be great if you could include a patch to docs/system/arm/
> describing how to test this machine.
>=20
> Cheers,
> Edgar

Hi Edgar,

thanks for your review! I'm going to add some instructions in v2.


--=20
Kind regards,
Corvin

--=-8D6COArMecV0LJbJ0okm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgvRSla3m2t/H2U9G2FTaVjFeAmoFAmgYfXYACgkQ2FTaVjFe
AmpInA//XTtzqbwnNAH8aSJb5YJ+MgGBPkDcNENT9UHyFI/1hserPdXfd4V2lb5E
M6JFvGYBIanIo+80oxlErD5KAsq9Y0gFTmvPM/EdN7xrv3CZiE+rzBB9CZ8tvakC
/5TwlWUQ8AN+r6wB10dP1kFNri/svGuDuXdTf2yN/3pOBW6ZjcKlY6PliBSxyDqr
tE/9ViRip+sFrwAt0tef1mk/HBVnDm4OlUTsj1ZbmfX92JEEXcSPMyZEFfQ3tXTr
wCUrWPlNAehCl8W6BlSA+xt2/YcQTF/kEnK6/DkdgCb4lt3lWfm7ZKi1X9RMGxUK
1SbYTOGanzf1wrmFEhVteyWaN6b7TW/8/3SPB2tlP4rs1zCIOZznogF6Xn2IwZw+
PerMF8dsknurRvne7IC0CmIeOUgItIxA2Z5K9MQAK0syt0FemazCyMtCd/Ng+kfK
0AeGfY/jxjqUNoDWvxNFWfvpqKWwXGW/buEPOCU9Mo1XK8/dgJTySYqFBy3JueQc
LJouaLui+eLLwfqdPr5XyJ0usaP8W6cbq9OwENtH3Ph5mcaJ/6Qn4eoDwy9Kv6Ig
j13ihKHJWoMpJiXadsfmlXZZxMP0U/PvtbXBz7mHhGS5Qsabph1Jru77MeXcbEDu
gDYfZ9+izjQiuoXiSUqcWKQGmIeb93rn/uxTMEu8hxO5YJLPpRY=
=iqd7
-----END PGP SIGNATURE-----

--=-8D6COArMecV0LJbJ0okm--

