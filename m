Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1013150wro;
        Thu, 25 Oct 2018 10:51:27 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dr6KCasOXOAIF4wOlPKumkCijqn79mLWyz6E3ZcIbblSeP238H6rtV2S0r7GrrPCXft8Ae
X-Received: by 2002:a37:2008:: with SMTP id g8mr214022qkg.120.1540489887427;
        Thu, 25 Oct 2018 10:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540489887; cv=none;
        d=google.com; s=arc-20160816;
        b=dv6jCLKhKk/F9NpAE0j36DJuv+jo2a33BtBzaPuYfY0aPWE2o+A7gwMZXkrsQMU1ME
         MH6zElh4zoVkU41DMFa7ihQPTh2Thp4p3DgFT6TcLmOuhopMiyg3Y6dZE/1odgOdmovi
         I3KesSz0IEWnvL8FeK5KS2clH/uASA2c5Afo3ht4It13oPQ79CH236/GanwV0gjaP7SR
         OFe6Yo6cM25BdkVmROPzR/GFbLE9HWTB3/vQFT9WhHCJLYHyr08Os5xMB5T0oj9DNvaA
         0YcZjPxgBL0Ns7kH1YPcH3GxwUHGHPGOmwcVcx66hBJD/zm67J7w839CwfYGNNbsiuYr
         /Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=dlPkFB8G0+XVPayRz2T6TnWdpLFfNoPB1K+WzUZaKdk=;
        b=ezRrYnQtSdwzpXlB0MfzGUjp2GE9b3OzABQBPO0c3SHuzr4xtx6nrN2pQGtjwdA/Wh
         b6FiZ5rhBrkD3Q9JFSNucaI0GEdw746wX9FJy4y/cIHoh5dUVes7VmMR/R2NshAXmbKQ
         LTmzMQiWC52HHi5kpoAVKK47ZsHviUo1ipk0cBopFk2okBM89pc0Mp9lr3vh1Tb25rDj
         oulqVmO9qkuLaohFAzALN5gcML/qaYBJgdmRpQM3734n2St4Y62dWOMRT01Ei0JT/gOV
         eFlso9nkxD2i/McYf7LHF/KqsJyGHXgDV00mHQXud46CafbKzw4uSabOvIk026JF8jPN
         xhSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EQX6jacz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 57-v6si7218626qtr.28.2018.10.25.10.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 10:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=EQX6jacz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFjn4-00026P-RB
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 13:51:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gFjKr-0006hv-6m
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 13:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gFjJ8-00085e-08
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 13:20:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34931)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gFjIy-0007xo-AY; Thu, 25 Oct 2018 13:20:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42gv5P0y9mz9sDF; Fri, 26 Oct 2018 04:20:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540488009;
	bh=FYWXIU3D0p3z5GaJI6kXzFoGLQU9kdCJMVjvLbX29RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQX6jacz89E2/O94pnTeKNyQBPy7o//Oy6dC3l070ecIw+BVxQo0zeNPsfGF6Evhs
	Cu/q/t2/M+uNYtYj+Qz4RHSmqz3D6AYZdQDE7Z8AiwFa8k61QGl7ROQuU2aYzGkFJY
	PS/G5FF2p8zkXb2f7qm+LjvU74u2MiFCQmSNgVSU=
Date: Thu, 25 Oct 2018 18:17:59 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181025171759.GG2697@umbus.hotspot.internet-for-guests.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
	<20181025133301.16578-6-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline
In-Reply-To: <20181025133301.16578-6-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL v2 05/43] hw/timer/sun4v-rtc: Convert from
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QbRiKO6Ks9Df


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2018 at 10:32:23AM -0300, Eduardo Habkost wrote:
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

Uh.. as in v1, it looks like this should be trace_sun4v_rtc_write().

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

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvR+sUACgkQbDjKyiDZ
s5IjihAAycOrLvJAAjv8H+wZEeCx0QpYlntXHq0oEbs5cur0D2LihCguyJx+PI8j
3iSLVkG8uFEBuvIE6wVMlrDt+S4HReo58hYPgZkdvedHuOozb5JgSRB45e6SzO7x
Q8SRbnZWazgHNq8Cm+5sFCbND2tF5vVVgbH3+6SrWjrgy6d/C4HYLfIgGRqH4JtD
peiOzs9nEYvzHGLQcwqLR8TxbMrB+5Qu8YmV7UwSQSaFenILkWX4sx+W7LA8Zqdx
2OG4rI57dDnc8lv/3UneShTicqyx0i/2Xwyu1rZHzkPCgiXEKfIcmkULRUH1tXM5
8qWrtqk+IlLFMKLwUwQRuXTnk/aHx4pFJ3pxad+yzler6CGIK+CEutgs1EDOoYxg
BPc86uF/jc+yDeFTmuqKTsoR14GEyR4HhsHsErQxQLvxQZi50Q5ERoei59seBmYH
W8UXEaq6vAL36EXsegPS9xC4B7sVkMBHeRGtRuHnVO/2veAWRPnzBtBhmCT0+JC3
YZU6voRcn7Kz8fmRrSqxw+4Cd+dFEjMfZOmyV0ZEDARF2t8gVMRCVqxmOIA+e2gM
mybkLaiY1kNlqdXCoedcwOsNsuEvlskwYA5ywiMAXh/dXeKkeFgXpnQk8Xd0wh99
VKT3SJzluQg8EZJOmXf83jjIbNiRqY+AH0Bot2zw6fmv7kJ0Smk=
=8+nS
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
