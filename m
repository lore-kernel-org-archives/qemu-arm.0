Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4254061wrt;
        Mon, 4 Feb 2019 18:47:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZycMvFJ8Z7j+YvCyq4HsjFT6Zmy1H70L3E1tX3UBJBKnRFjk99pgugmg3/dN5uZc7r7vdM
X-Received: by 2002:a5b:388:: with SMTP id k8mr2111193ybp.122.1549334874792;
        Mon, 04 Feb 2019 18:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549334874; cv=none;
        d=google.com; s=arc-20160816;
        b=OhDsAo/Rfi3XGgiMOrLjF1GMTTVcKgwe2NS76Yo2NuhBLroLoGXNgAvNzaD2mDP9Zq
         f6vqiKt/bRbUXmHZ4rTVd876dGmNBvaLnEWBLUBwglUjGPhXJAKMpfx4mvSZix67cp+C
         zOcpjuJY6fz+clsCeQEhxnSUwfUf3te1dYwC25pqUNz8EI7oluKylx9ma1NLiJYtoEG3
         V183EJ+fJRgrt0FeKsW0qT/dknHP7FY/22gq0uRqhOSZhXMMzyQteGL66Jhtb+lK0PQQ
         h2kIIYKtoDz6Pn3ybuj2bIB4g2dF8w56NjSx5gLYka4KcL8Eh+gOgKMpPv9TChfls8fb
         H/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ZArV8TexUOhmgWvhjJTefOYpvRAmu75n3lwkLY6zTNU=;
        b=AA62TaLUlZrW4kHmnZgFk0hsMSgbt+thmSSHq85GggURWBoqQvbmxdvNn18rjkI6NP
         uhBEwceQBvJCLiClNmTNJ+Yz6So1Bo2tEPW527DfEIwpgdRSfjjn5ZHFX8vUSNMWJ6bc
         9f6KAZRi4T1BWNoo/sDGQ53zOotghykqsX5UsNZDXNvIjHHRwvdqTqcIVbusaGwgmdLD
         mAjflIQbHu9fEVLeCCFbDognZMqVoW+8uzsPphVVpIRj+I9RgQaYbW6/3V0kcx5tVDoY
         WEWGVk8+gJgYYxEtlZO6Al6wLQRVYdn585KxJgMxWGcqUA015TpL3LoWSlNyEuE2OMf4
         iiMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=owWNUwNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g63si1095841ybg.38.2019.02.04.18.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 18:47:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=owWNUwNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqqmA-0002KJ-7u
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 21:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gqqly-0002Jl-GJ
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 21:47:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gqqlo-00016C-55
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 21:47:37 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:52809)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gqqlh-0000wk-4C; Mon, 04 Feb 2019 21:47:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 43tprd0zRcz9sN9; Tue,  5 Feb 2019 13:47:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1549334833;
	bh=dEgJ+YZmoxaW+UdfBU/Z0sxquD82+I6jQ39zxTvc49I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owWNUwNQJVuhQ3IGA/3jc/FxmwGa/z0GnHkUHso97TpKb6jd1q1CBlc1olgSdOkoo
	8BkR7hZJXRIi0eB843id3Q22FhnZnCAaV7BVJD/VrMj8IUn6fVdoWZaZ5rL3bMc8jO
	+2r8oR4S00mtWwjmOdpbEd1AQRtLXG2mvMNjZ9mA=
Date: Tue, 5 Feb 2019 11:42:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190205004235.GA22661@umbus.fritz.box>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20190204231815.29661-3-philmd@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 02/11] hw: Remove unused 'hw/devices.h'
 include
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
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EL0+sA/Ud+Ww


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 12:18:06AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/alpha/typhoon.c                       | 1 -
>  hw/arm/allwinner-a10.c                   | 1 -
>  hw/arm/collie.c                          | 1 -
>  hw/arm/cubieboard.c                      | 1 -
>  hw/arm/highbank.c                        | 1 -
>  hw/arm/mps2-tz.c                         | 1 -
>  hw/arm/musicpal.c                        | 1 -
>  hw/arm/nrf51_soc.c                       | 1 -
>  hw/arm/spitz.c                           | 1 -
>  hw/arm/virt.c                            | 1 -
>  hw/arm/z2.c                              | 1 -
>  hw/display/sm501.c                       | 1 -
>  hw/hppa/dino.c                           | 1 -
>  hw/intc/allwinner-a10-pic.c              | 1 -
>  hw/lm32/lm32_boards.c                    | 1 -
>  hw/lm32/milkymist.c                      | 1 -
>  hw/microblaze/petalogix_ml605_mmu.c      | 1 -
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
>  hw/net/dp8393x.c                         | 1 -
>  hw/ppc/virtex_ml507.c                    | 1 -
>  hw/sh4/r2d.c                             | 1 -
>  hw/tricore/tricore_testboard.c           | 1 -
>  hw/usb/tusb6010.c                        | 1 -
>  23 files changed, 23 deletions(-)
>=20
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 397e2dcdc7..9d57361c67 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -11,7 +11,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> -#include "hw/devices.h"
>  #include "sysemu/sysemu.h"
>  #include "alpha_sys.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index df0d079ad0..06ec6f4dc8 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -20,7 +20,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> -#include "hw/devices.h"
>  #include "hw/arm/allwinner-a10.h"
>  #include "hw/misc/unimp.h"
> =20
> diff --git a/hw/arm/collie.c b/hw/arm/collie.c
> index 48b732c176..3ca4e078fe 100644
> --- a/hw/arm/collie.c
> +++ b/hw/arm/collie.c
> @@ -12,7 +12,6 @@
>  #include "hw/hw.h"
>  #include "hw/sysbus.h"
>  #include "hw/boards.h"
> -#include "hw/devices.h"
>  #include "strongarm.h"
>  #include "hw/arm/arm.h"
>  #include "hw/block/flash.h"
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 32f1edd2fa..84187d3916 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -20,7 +20,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "hw/arm/allwinner-a10.h"
> =20
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index fb9efa02c3..96ccf18d86 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -21,7 +21,6 @@
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> -#include "hw/devices.h"
>  #include "hw/loader.h"
>  #include "net/net.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index f5f0b0e0fa..f79f090a4a 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -56,7 +56,6 @@
>  #include "hw/arm/armsse.h"
>  #include "hw/dma/pl080.h"
>  #include "hw/ssi/pl022.h"
> -#include "hw/devices.h"
>  #include "net/net.h"
>  #include "hw/core/split-irq.h"
> =20
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index d22532a11c..de4a12e496 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -15,7 +15,6 @@
>  #include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> -#include "hw/devices.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index bbaf050103..3e633d160e 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -14,7 +14,6 @@
>  #include "hw/arm/arm.h"
>  #include "hw/sysbus.h"
>  #include "hw/boards.h"
> -#include "hw/devices.h"
>  #include "hw/misc/unimp.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index c4bc3deedf..22f5958b9d 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -21,7 +21,6 @@
>  #include "hw/ssi/ssi.h"
>  #include "hw/block/flash.h"
>  #include "qemu/timer.h"
> -#include "hw/devices.h"
>  #include "hw/arm/sharpsl.h"
>  #include "ui/console.h"
>  #include "hw/audio/wm8750.h"
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 99c2b6e60d..396804f0e5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -37,7 +37,6 @@
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>  #include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/display/ramfb.h"
> -#include "hw/devices.h"
>  #include "net/net.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/numa.h"
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 697a822f1e..7afa352a96 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -15,7 +15,6 @@
>  #include "hw/hw.h"
>  #include "hw/arm/pxa.h"
>  #include "hw/arm/arm.h"
> -#include "hw/devices.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/ssi/ssi.h"
>  #include "hw/boards.h"
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 4a8686f0f5..2122291308 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -32,7 +32,6 @@
>  #include "hw/hw.h"
>  #include "hw/char/serial.h"
>  #include "ui/console.h"
> -#include "hw/devices.h"
>  #include "hw/sysbus.h"
>  #include "hw/pci/pci.h"
>  #include "hw/i2c/i2c.h"
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 31e09942b5..25c3178097 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -15,7 +15,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> -#include "hw/devices.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
> index 11f13663c8..1aa628cbbb 100644
> --- a/hw/intc/allwinner-a10-pic.c
> +++ b/hw/intc/allwinner-a10-pic.c
> @@ -17,7 +17,6 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> -#include "hw/devices.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/intc/allwinner-a10-pic.h"
>  #include "qemu/log.h"
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index fd8eccca14..6b2fac55fb 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -25,7 +25,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/hw.h"
>  #include "hw/block/flash.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 26a2398354..be351d96dc 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -27,7 +27,6 @@
>  #include "hw/block/flash.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index c730878d25..18048d3555 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -35,7 +35,6 @@
>  #include "net/net.h"
>  #include "hw/block/flash.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
> index b9f0b0d06e..a0edaf867c 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -33,7 +33,6 @@
>  #include "net/net.h"
>  #include "hw/block/flash.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "hw/misc/unimp.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index b53fcaa8bc..98cb4e58c7 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -19,7 +19,6 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> -#include "hw/devices.h"
>  #include "net/net.h"
>  #include "qapi/error.h"
>  #include "qemu/timer.h"
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 5177120574..8142d68ca2 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -31,7 +31,6 @@
>  #include "hw/block/flash.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
> -#include "hw/devices.h"
>  #include "hw/boards.h"
>  #include "sysemu/device_tree.h"
>  #include "hw/loader.h"
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 5b399e7161..bbcf3eda33 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -31,7 +31,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/hw.h"
>  #include "hw/sh4/sh.h"
> -#include "hw/devices.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboar=
d.c
> index a58096f05e..364321735a 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -24,7 +24,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> -#include "hw/devices.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
> index 501706e2b2..f76b59afe8 100644
> --- a/hw/usb/tusb6010.c
> +++ b/hw/usb/tusb6010.c
> @@ -24,7 +24,6 @@
>  #include "hw/usb.h"
>  #include "hw/arm/omap.h"
>  #include "hw/irq.h"
> -#include "hw/devices.h"
>  #include "hw/sysbus.h"
> =20
>  #define TYPE_TUSB6010 "tusb6010"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxY2/gACgkQbDjKyiDZ
s5JdWA/+IEYIr0DWMavtahX/Oxtu6SEt1c93jeQCsCmzQtTKPuQyFHKnYPQRqBVu
nljffHOqG0bqK+RbBTJAE9emtTRzczmHiRXDtHd9RlIrR0jWCA6A5k9LUzDXXleK
VhNs8kjd7SpDKHRMSdgOekQkJGeBHwKfBwgZQPshep53wmQXA5DYu5iAxQERmw2f
SwtRdXRl/xw3SZkSErs7ua7W0C7p8JmM7jaE86gCOFVNF/Q+ORKYdCmC9Cyl965w
wmiuIJyrL0+APlbUOAzPL4WcspsVN/R7R93oqqOEUkJvsE+DMi2fj0TBAdcfNQH3
sd4AYx2yzH5s570qXcYXnK54fJrBrAJZkym0dtbRHXnBOmcgLGFl4hNpQ2GOtiNL
E0z2ZG5kXg+qrXwuRFVSSKUOwBM+8Jcz9PghB8p139ZmwyuH1hwAibTf/Us24ZeO
bQTETItg6xbLJN+P9ZhNMTdimmcu40ZnOngdfqQjtGZp8rBhGhvjZXzlu4uzg3Fn
RvR8wVHyh4wssW2jc65HFK0SW+etJkPe3r6AmHPabGRy+4ijVKjLIxqRJnanyx24
t7eqYfULCDtDLl7t0evy4z1+d9C8axhfFw/bf260OUR46pCzNf+qFZfA6dHVKcjp
KyA5N4jFduH/Y1Z7KU4a2eTFRaGvVs20Iqjp0iHYQPeeCLY59+Y=
=Q3C7
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
