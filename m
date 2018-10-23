Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4704287wrt;
        Tue, 23 Oct 2018 08:49:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fxBBwvQzIuAfTT6gx9XaA/hl3jLRRe7hCwlBPUxdgbz35dC9i5i9OGmxNYDE+HmuGqsf3G
X-Received: by 2002:aed:3523:: with SMTP id a32-v6mr13233812qte.153.1540309785368;
        Tue, 23 Oct 2018 08:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309785; cv=none;
        d=google.com; s=arc-20160816;
        b=k/8vR65cSCpNxgSJcO0J/doLr0GYKX3Z07zwM4W9X0Ig/e7aWTXEBXPH5wWqzge44i
         gShiUW0vQuu3LUApa1zZ52dv1W0JgytMKwRiOWFLfwrVzK+hUUvEgOVNoSHwd2+XuqKd
         jYoYtS41PMzYbX4Y++plAf/G3nk8rYfKzz3q+RDZyBSdZJSEbkEO/U3CmZqKB6lqsmaP
         ftJmEIDUTHfzI215avxKxR6P+Y1woW0xRQgg/jmNwLCD4WleSiEC0RxkaLYCVSf/8L4b
         HG3IHvGnsENeF1S+tUMzQ0CFd9PsgNJNNIoT9nhp+BZs2UAJvzHvV19Eb5wdB7Z8Fa94
         z5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=scX8pyTeSnHJOAdV0rVFo6B/WTrHgGDOO4CyE9gfBCg=;
        b=wbtCYPKBZZtRNjzSh8bfJy2H4pRo1ARfh9Y4c2TS4uhQ2NPBqnFLuNBWYLkygOK1HH
         pY54CgC0wbgpIFY3tZupeuvywYJ2MI5QaTmCJCHL+ZMNvX1/jnVOHjIke9OspDyQPjWG
         LrgBg/lU8KDW5tJSke54bfF5eMOnlu9ceY1uFaRNCTmgzlIRoombI1wjYjXPTuIdb+K6
         f0X8x8QD1p10CAClvg+0QXNgOk93NK9VV8mF2r0krQ8NMA4sWqHXgg7ZDhVZjG7rEsow
         BXLiIT5h9FlpbfpBpUD6rT+a1H/fO8M6Mp5IIrni5rEQSLNk0W6BUFen8rjBovvm6IHO
         ToQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EGiLoCLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si1381406qkh.88.2018.10.23.08.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EGiLoCLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEywC-0005AP-Ed
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:49:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhh-0007C3-Gd
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybQ-0006ej-Cg
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:20 -0400
Received: from ozlabs.org ([203.11.71.1]:34027)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybP-0006c2-1w; Tue, 23 Oct 2018 11:28:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj64cVpz9sDX; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308490;
	bh=z18lo7sKLZnjH6IWyp3p49lzFe0Ymz8CJ2hPgGo6OOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGiLoCLmErdOeTyPwu731Cn2d6MkF85hnhi4L+PeGkcgM8Rew7ynlwg0dRZFHVioE
	3TjejsT45E6ktrUrFHr2TR0EzImwdba29DNRelKanuQLay74560BtQbswfD0QOej1z
	1SNJ5lU3MejhvZnICi3yLlYug2VZXeEvl8PNmrPI=
Date: Tue, 23 Oct 2018 16:09:05 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023150905.GE12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-7-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-7-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [PULL 06/45] hw/timer/sun4v-rtc: Convert from
 DPRINTF() macro to trace events
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SRoNT5YlTp3m


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:43PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181002212522.23303-3-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/timer/sun4v-rtc.c  | 13 +++----------
>  hw/timer/trace-events |  4 ++++
>  2 files changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
> index 310523225f..13be94f8da 100644
> --- a/hw/timer/sun4v-rtc.c
> +++ b/hw/timer/sun4v-rtc.c
> @@ -14,15 +14,8 @@
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/timer/sun4v-rtc.h"
> +#include "trace.h"
> =20
> -//#define DEBUG_SUN4V_RTC
> -
> -#ifdef DEBUG_SUN4V_RTC
> -#define DPRINTF(fmt, ...)                                       \
> -    do { printf("sun4v_rtc: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do {} while (0)
> -#endif
> =20
>  #define TYPE_SUN4V_RTC "sun4v_rtc"
>  #define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
> @@ -41,14 +34,14 @@ static uint64_t sun4v_rtc_read(void *opaque, hwaddr a=
ddr,
>          /* accessing the high 32 bits */
>          val >>=3D 32;
>      }
> -    DPRINTF("read from " TARGET_FMT_plx " val %lx\n", addr, val);
> +    trace_sun4v_rtc_read(addr, val);
>      return val;
>  }
> =20
>  static void sun4v_rtc_write(void *opaque, hwaddr addr,
>                               uint64_t val, unsigned size)
>  {
> -    DPRINTF("write 0x%x to " TARGET_FMT_plx "\n", (unsigned)val, addr);
> +    trace_sun4v_rtc_read(addr, val);

This should be trace_sun4v_rtc_write(), no?

>  }
> =20
>  static const MemoryRegionOps sun4v_rtc_ops =3D {
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index ca9ad6321a..75bd3b1042 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -66,5 +66,9 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data=
, unsigned size) "CMSDK A
>  cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
>  cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
> =20
> +# hw/timer/sun4v-rtc.c
> +sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
> +sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
> +
>  # hw/timer/xlnx-zynqmp-rtc.c
>  xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOZEACgkQbDjKyiDZ
s5JW6BAA5cO+mOufqVr94/AU4aapvcEuhvl0KzNkXy09uJhjLZZn6zG4Aj9BJHB7
8KiDX+Y2Tgsw8ze8o45xMCx5N/vfi0YYFidrs7PwLC9+F9E/Vf8XQ5aUlSm52Xt9
TWqBQ+I40EHOuw0+h00mrVqVOo/FPX2gAg8WFTlKDZ59T/v4PV0irc/wwBKrVX1R
lu18qVzlAilZzvpihWr8Rn7M4qhiuYzOJ+S6HvAtM0mZcHnEfbzicdr0pQw7HR1V
YxiUDfmFN4BYiNzB/+OJACZgz/vsmKyAFQzGP9+pzx8skbMqEOxK7MuBtDX/5VtX
olTNBRpoBAD0LHMhPZo1UA6tHl8BjdGdJ8BCDo70Fag1cI6TuSa+opuzdtC+V42C
n5JIZI629GgJhhXSvqXVZ3UbqZoZNvZ4KjkjCY0TRZ0BlDWZBx4eqHjBIkNfCfm/
1BIdVKeMXt3FUcpSJNHMpAJSLEDkbO2K8we3IMC5zf81fWF2a2IQ5iT7rTizJA1b
xG4FgKViPPAZ2ytZsq9Y60sFjYHyv7cpWMRpE7qYisAQ7l3YeVuU/c9QqXsFQSO5
gZYwI0S588JZxFURVCg0hVmvD99VfxBqetebsuB47RrVLEcNN5dkAfQ607S3ZEiz
g1c8ZGry6xzZIzZN8gwCzdDwha08xWIOtcb9JGmR5LfQdKCIPBg=
=sDxs
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
