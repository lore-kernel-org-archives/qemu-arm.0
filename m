Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3216850wrt;
        Mon, 7 Jan 2019 00:45:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7I2gWQ3ekMMckzEqcIzhiHSasglfn9Ek5wb8JHDHThiJBZgHChzxBac5JruoUMVFUaFhPd
X-Received: by 2002:adf:d4c9:: with SMTP id w9mr51166613wrk.119.1546850718464;
        Mon, 07 Jan 2019 00:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546850718; cv=none;
        d=google.com; s=arc-20160816;
        b=fcrVfhHITYF5EaYj+aB7pdpRo9B74ctaUbg1YIs0hizz9/3d4ZFQS2fMFB8Ad+UpO5
         uuIkVQm2luobFUWfrD2uZHKb4wTg9/mVz9l2lrUuRHVaDSwbkO5GvloWzqyo2MMUrAok
         31Nxql3gGG9lVBC4gGXzPOt3IcRRU2OzRs8hT3iaH+PmCKIEyFoNVaPNa4z84I6114wh
         TPHGVsC7b5bYVEq3gbgLwZqcmG26LQ1S3a2R3wOmhQ+gIoCMzDlOutcIPvgzsg5slT6c
         0bvVSEQFzfS1CpDA7AhFnxT73cAFcgnN6Al5BTisjKdoXHHl3gooKznmMtF4HBLvaWfB
         vm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature;
        bh=JuxjOQH5Xk8ideG6+cyYd97fu9EvKK+YFj27v0+zX0o=;
        b=JKzfJ5yufJc07qTfX3QHwrVaiyGrolHms3t56dLHgC7riqs8xtIjSp038/lZlmgR4H
         5W3fOft3dU1mUPIzyqVpygTw7SPXjOd0Mrrev8MYWjJyVJxZQxtNQxcPtPHzosLHzIs9
         VdX/3ChEa9vSWNOzHiURH1QVVIdJ6/zCt5fWS5aX7UXPTQ/G/8nmPD9Ob9jt05EWNG/d
         R8UkmrX1CJTYJr6Ekq0RIWhayzpe1mAUwbew/3CeaL9uMR1RjFCN36VSp/jAXWE6cwko
         Mk0So9Oeb4Px9SjcohT6bVfOhQBzx8O482VSFfvSUZ0pyyl1/cBn0zwyHJLpPqgNb92O
         VChw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="QfP/9qqE";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="PO72uO/0";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="PO72uO/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si37839179wrg.151.2019.01.07.00.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="QfP/9qqE";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="PO72uO/0";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="PO72uO/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggQX7-0001IK-He
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:45:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQWv-0001IE-0I
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:45:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ggQWt-0005Y3-U1
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:45:04 -0500
Received: from greensocs.com ([193.104.36.180]:43948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ggQWs-0005Uh-TT; Mon, 07 Jan 2019 03:45:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 68E95641419;
	Mon,  7 Jan 2019 09:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850686;
	bh=bv2J7qCSkwJe30G4rj4rDNcqHC15QlaxHtU79GI0+wk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=QfP/9qqE7bpqWdg5mTGayuSsI2euvAXrwHHEQ6LlHAyLOvkeBnIXM92eJ3UnlDGz7
	VheXccLWFyAPMsFAuS9GC4dZYgyNYwUM5n7qKTwFJR5t/bEshGzhUrr832b/6TMpET
	+hCBxgSviJ7nVBRXAylHt6KYwFa3GHNWbt7qVqsw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PO72uO/0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PO72uO/0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6FHxu-ZuSBd; Mon,  7 Jan 2019 09:44:45 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 8AD4364140F; Mon,  7 Jan 2019 09:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850685;
	bh=bv2J7qCSkwJe30G4rj4rDNcqHC15QlaxHtU79GI0+wk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=PO72uO/0t02SvZiwRaKhB1KAKpZgccm8QKo/cPQtu5JsVjQ/femNJFfRfOxIuarsB
	FVfnwAy0uEiKV3orACfY83Q152r9WWkBGwDVgM4ZhLqtSKmBGOw3uE4EA3Zs5KaKhz
	83slxoFnbeu5hs7RxiaLXTn1X820nV3OVvg4wugc=
Received: from [172.16.11.100] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1ABFA6413EF;
	Mon,  7 Jan 2019 09:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1546850685;
	bh=bv2J7qCSkwJe30G4rj4rDNcqHC15QlaxHtU79GI0+wk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=PO72uO/0t02SvZiwRaKhB1KAKpZgccm8QKo/cPQtu5JsVjQ/femNJFfRfOxIuarsB
	FVfnwAy0uEiKV3orACfY83Q152r9WWkBGwDVgM4ZhLqtSKmBGOw3uE4EA3Zs5KaKhz
	83slxoFnbeu5hs7RxiaLXTn1X820nV3OVvg4wugc=
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
	<20190104142812.20444-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9675af33-37b0-55c7-9f81-511f0916abb9@greensocs.com>
Date: Mon, 7 Jan 2019 09:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190104142812.20444-2-edgar.iglesias@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="U80yTnc5JATO2gsn35zfrZUEAsBcxfqZD"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v1 1/2] hw/microblaze: s3adsp1800: Create an
 unimplemented GPIO area
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGR4gjVxhTa2

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U80yTnc5JATO2gsn35zfrZUEAsBcxfqZD
Content-Type: multipart/mixed; boundary="QjZgW7ZrhWOSXxrpCk9vBm5tJQQWawsSF";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, frederic.konrad@adacore.com,
 alistair@alistair23.me, philmd@redhat.com, frasse.iglesias@gmail.com,
 figlesia@xilinx.com, sstabellini@kernel.org, sai.pavan.boddu@xilinx.com,
 edgar.iglesias@xilinx.com
Message-ID: <9675af33-37b0-55c7-9f81-511f0916abb9@greensocs.com>
Subject: Re: [PATCH v1 1/2] hw/microblaze: s3adsp1800: Create an unimplemented
 GPIO area
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
 <20190104142812.20444-2-edgar.iglesias@gmail.com>
In-Reply-To: <20190104142812.20444-2-edgar.iglesias@gmail.com>

--QjZgW7ZrhWOSXxrpCk9vBm5tJQQWawsSF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/4/19 3:28 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>=20
> Create an unimplemented GPIO area instead of leaving it unassigned.
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/p=
etalogix_s3adsp1800_mmu.c
> index 5cf7b84c79..b9f0b0d06e 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/devices.h"
>  #include "hw/boards.h"
> +#include "hw/misc/unimp.h"
>  #include "exec/address-spaces.h"
>  #include "hw/char/xilinx_uartlite.h"
> =20
> @@ -47,6 +48,7 @@
> =20
>  #define MEMORY_BASEADDR 0x90000000
>  #define FLASH_BASEADDR 0xa0000000
> +#define GPIO_BASEADDR 0x81400000
>  #define INTC_BASEADDR 0x81800000
>  #define TIMER_BASEADDR 0x83c00000
>  #define UARTLITE_BASEADDR 0x84000000
> @@ -122,6 +124,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
> =20
> +    create_unimplemented_device("gpio", GPIO_BASEADDR, 0x10000);
> +
>      microblaze_load_kernel(cpu, ddr_base, ram_size,
>                             machine->initrd_filename,
>                             BINARY_DEVICE_TREE_FILE,
>=20


--QjZgW7ZrhWOSXxrpCk9vBm5tJQQWawsSF--

--U80yTnc5JATO2gsn35zfrZUEAsBcxfqZD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlwzEXwACgkQd8knW3Qn
Tr41vQ//Wrras38Hz22rnTb2J9YkYTqJ4Z7oxkbjLINwtwejbILt4lh72ua1drmd
N56QyPDhvzXBNNYksqfvJ62K4xDUc5S7euLMeHWhZ0lpsurxS74mEqYjOHUrUPKG
E8u28bxaBY07b9rYTDkRMCBGSMUAFT3adHEp5aIjZa+smU2UpVdgGd+xHrrdQqoA
mEhdqDlCQpiF59Tg3stoQxioODlF7gx0553dpxAZFoo4VY103nZPKqRoHecrSoYO
mLUd8OE7O01DzkqSE9yFcePJYZkvn4uoNu/8XEApsBWH3WeDNa8eO+Q5OGnQ0pNa
AeP+3E89Gd8P2kKh9YB4/Y0uE8znWfonGCZZV4rnNqotNMSSWznPJlNiH1hwl8Mw
5ZI0QP6BV39F7GkDtmL4VcR1JD1ccUpjHpuoufWf3SE/lG67hUWXWc4Zd/ywJ/J9
5Dp/BsNKarmDyiVFQJUU4CcUMoxosRl7TybEFv2E+KFhWhIID+MiBjYeCRdiX7LB
PMLWzTNYMvfcuUKC5rvrl915GCe4bansFi/Xyx8UhkYiNlXOwQ4/BpactAtBR6YR
7hXJyZ8JAOef+gJRi7HZMT9Kjjz0kaJRcgDNOUKAXNG8XL1FRJUhs5TnsahjRsiN
+fglcFNJKFTctyt7ocFnd+xQXT1sHqwRMyf3BQLl8Bp8YvctJZY=
=whE6
-----END PGP SIGNATURE-----

--U80yTnc5JATO2gsn35zfrZUEAsBcxfqZD--
