Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1966405njc;
        Mon, 4 Nov 2024 00:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsSaLnskTp7NjLZMHSM+gVGs77F638nVsg3Bc9S1ycYZEkEiYvDd/OzyJ+TV2EzdQPYMJZ15onGPISyA==@linaro.org
X-Google-Smtp-Source: AGHT+IELdEa4k4Q3xf1hIkwZSP4i7NxLO46meCwZie6Yfx+mH3oYUfEwGol11dgXCHskmRhs2qfG
X-Received: by 2002:a05:6102:32ca:b0:4a4:7609:35f with SMTP id ada2fe7eead31-4a8cfd6d7bemr26412551137.24.1730710230888;
        Mon, 04 Nov 2024 00:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730710230; cv=none;
        d=google.com; s=arc-20240605;
        b=iB/pebYXH+xDgEWPdGpZAdBBEO9LdBufl1+PVRRQYIxV/odirYNZYPhFP3slsHm+eZ
         40JPQTKDsWeZwTyrm5NSkJ6rruSbcpC2YFowtbov/pjisi0tB76oV5e29Tw4UsuWoT3u
         q7/Bc0wiMD2dSXbaCVoF1BY/pnAOX17aG1watuuSup32Js42hotdTrWWqx6WNO91E6Kg
         XJ0uDWsex9LnJ0YnYGfi88dIvZNau1wWBpTG1j4EJ8w+omFsWx5jQ9e670yKq56DCvoW
         +R7MWAPLv3mlg4vbNkmENVvfqeQxHlWuEgO4cWMkTrM0+rup/g+Ihc55BwcE0Zsvwp3j
         OO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id;
        bh=uCS4b7T4UCt6ZVv4i6KnabekVaNZzc5DxxH2aMHHZ3k=;
        fh=rmQsTAwe9wNi+R5V2shMGkhFztzQmGwp9RZVnibn9xo=;
        b=DE6d4+BJmR5pZrA3sHUJpHPU29tzhUsRy2GXVfObM4qbExBsES9kqw1Ej+LQpbX+DQ
         7y9/PFhlQkDzDRTVZXXjmU/ooF9+SMsH31wupttemk6pDG/FnX5jUIA6WG7ba3g5Y7Nk
         Ty6kkGzbrmj55uYpjAl9HGQyDS1yigul+30CAsHnlqJZB6deZiSzrm7qQZVafxz12ZHZ
         L9Lj2/iKYcLpagQyJvtm1SOk6OY0bHTV9DFCIfKJP6/3zrl1o/4T2HFUS+BUoTTX1AqB
         QctSrpyJn4wdm3KXRvbKEN+tuRs8EO2Qsp22G/evPPKQL3FCwi/e0JhhrzGf6wDoIDbn
         NPdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1a129asi100133161cf.248.2024.11.04.00.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 00:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7smv-0001ja-3Q; Mon, 04 Nov 2024 03:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t7smt-0001iq-Jn
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 03:50:15 -0500
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t7smq-0000GW-QV
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 03:50:15 -0500
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1t7sml-00046v-Ej; Mon, 04 Nov 2024 09:50:07 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t7smh-001wuk-3C;
 Mon, 04 Nov 2024 09:50:04 +0100
Received: from localhost ([127.0.0.1])
 by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t7smh-00CnxU-0o;
 Mon, 04 Nov 2024 09:50:03 +0100
Message-ID: <2c4972ed05dd3764301d5c6dead79f0528dee9e5.camel@pengutronix.de>
Subject: Re: [PATCH] aspeed: Don't set always boot properties of the emmc
 device
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Steven Lee	
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin	
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Guenter Roeck	 <linux@roeck-us.net>
Date: Mon, 04 Nov 2024 09:50:03 +0100
In-Reply-To: <20241102143943.1929177-1-clg@redhat.com>
References: <20241102143943.1929177-1-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-devel@nongnu.org
Received-SPF: pass client-ip=2a0a:edc0:2:b01:1d::104;
 envelope-from=jlu@pengutronix.de; helo=metis.whiteo.stw.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PFO167sz7gc2

On Sat, 2024-11-02 at 15:39 +0100, C=C3=A9dric Le Goater wrote:
> Commit e554e45b4478 ("aspeed: Tune eMMC device properties to reflect
> HW strapping") added support to boot from an eMMC device by setting
> the boot properties of the eMMC device. This change made the
> assumption that the device always has boot areas.
>=20
> However, if the machine boots from the flash device (or -kernel) and
> uses an eMMC device without boot areas, support would be broken. This
> impacts the ast2600-evb machine which can choose to boot from flash or
> eMMC using the "boot-emmc" machine option.
>=20
> To provide some flexibility for Aspeed machine users to use different
> flavors of eMMC devices (with or without boot areas), do not set the
> eMMC device boot properties when the machine is not configured to boot
> from eMMC. However, this approach makes another assumption about eMMC
> devices, namely that eMMC devices from which the machine does not boot
> do not have boot areas.
>=20
> A preferable alternative would be to add support for user creatable
> eMMC devices and define the device boot properties on the QEMU command
> line :
>=20
> =C2=A0 -blockdev node-name=3Demmc0,driver=3Dfile,filename=3Dmmc-ast2600-e=
vb.raw \
> =C2=A0 -device emmc,bus=3Dsdhci-bus.2,drive=3Demmc0,boot-partition-size=
=3D1048576,boot-config=3D8
>=20
> This is a global change requiring more thinking. Nevertheless, in the
> case of the ast2600-evb machine booting from an eMMC device and when
> default devices are created, the proposed change still makes sense
> since the device is required to have boot areas.
>=20
> Cc: Jan Luebbe <jlu@pengutronix.de>
> Fixes: e554e45b4478 ("aspeed: Tune eMMC device properties to reflect
> HW strapping")
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> ---
> =C2=A0hw/arm/aspeed.c | 13 ++++++++++++-
> =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e161e6b1c582..ac6d8dde71b3 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -338,7 +338,18 @@ static void sdhci_attach_drive(SDHCIState *sdhci, Dr=
iveInfo *dinfo, bool emmc,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 card =3D qdev_new(emmc ?=
 TYPE_EMMC : TYPE_SD_CARD);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (emmc) {
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Force the boot proper=
ties of the eMMC device only when the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * machine is strapped t=
o boot from eMMC. Without these
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * settings, the machine=
 would not boot.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This also allows the =
machine to use an eMMC device without
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * boot areas when booti=
ng from the flash device (or -kernel)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ideally, the device a=
nd its properties should be defined on
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the command line.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (emmc && boot_emmc) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qdev_prop_set_uint64(card, "boot-partition-size", 1 * MiB);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
qdev_prop_set_uint8(card, "boot-config",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_emmc ? 0x1 << 3 : 0x0);

With the change proposed by Guenter, this looks good to me.

Thanks,
Jan
--=20
Pengutronix e.K.                        |                             |
Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |


