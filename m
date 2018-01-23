Received: by 10.28.71.27 with SMTP id u27csp12667wma;
        Tue, 23 Jan 2018 14:52:08 -0800 (PST)
X-Google-Smtp-Source: AH8x224Ku9GlcxUSJH8TYzlXJYzglYrWyz7VStP/o4NsDrlPIwFaxpZTcMv9sd3WDai4GMvhpD6I
X-Received: by 10.129.169.202 with SMTP id g193mr3958861ywh.500.1516747928650;
        Tue, 23 Jan 2018 14:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516747928; cv=none;
        d=google.com; s=arc-20160816;
        b=KYT/NIoVbbTR2hMnWYQqWg8P0nYbLZNzfunpYuXCe/PJjrxuNTXVCMsTGRcnKjWTXU
         gfh37nhzB2ApnDxE2TIwTpmwdIT0uRUinqCnwMvMJBhkzj+mKYi9DT6HJGlfmNhkbRgt
         rXpC9kFNlNMAgovAEJHbx8VQcQx/e5gyHEv/m3Xd7XIVFjS58AD6WDfuXATlrs/uglqB
         qoYjqM5a6auDzCAsPgVIwkly4Rk1P2NGkz1DCJKazlgF4l92KgHaK4usxWNdH1NiXPlb
         cmxIPJMjO1l1FO7HiUWTGYtsTyHNdTG7hFMN8DtLsUmDt1VKPfUaXSbtSo56tBE+i88B
         m+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=IWmQjk+S81lwOeS/1ASJ7bzOQPEnSlEtyI+Hxm3sjSg=;
        b=Nj+Rk2tXu51c8XoT3ek7igUEJWKh0PLlWXCpfPJyRE9XY4ZSvnYHquT1HrCj82fjZ6
         1p/yTdP4eHpRm8dtEuZ+3/nMFzgkJm9KDN5AG6F5f/QWeIpIJ2xWdoNWcwSsJvSOCnE/
         o8TIDDPh1PsH0OlL8PoA2JhgnwiIarZwlY4j2MdDHZORp7UIxUX0St8oaIlBCJphMdiM
         CquX0R5vD3csDAiMGfHiIc4geU5pjrMkaoseUtgwub6OaoVIJTT/Bqei9Yt/S082du7+
         AQpUZZtJf1eLgFQHIMNN2tw7ACOvmUiSCst8Zpw+bxpoJNxaegftkmq++uNQdDzbB1qQ
         CX+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gNwqW7pZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si2529184yba.59.2018.01.23.14.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gNwqW7pZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7QG-0008Qu-48
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:52:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7NC-0006Nl-SY
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7N9-0006mw-OA
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:48:58 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:37240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee7N9-0006kk-BZ; Tue, 23 Jan 2018 17:48:55 -0500
Received: by mail-lf0-x243.google.com with SMTP id f3so2699972lfe.4;
	Tue, 23 Jan 2018 14:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=IWmQjk+S81lwOeS/1ASJ7bzOQPEnSlEtyI+Hxm3sjSg=;
	b=gNwqW7pZq9xZb+zwIO+LaGKhmYSvFUxf5hstVG5xnGOb7omFDZsyr8biPQGDL8RXuv
	lGYOHjnN3dTIYZDD095BTjAvBXtZCKSe9CQjrwUVNsEb1WSyJAcyJREymn7Hl5o+JOd+
	aJJjxuOQK5WXdh206taVC02/FfDh+b49B+Nfli4KtVqRPWRZtNkNGRJ6k+S0wU/V8fFC
	0yZKssG6PJUYthk4kcXutm6dEVW1MNf+Dhv1Aj0FOxIoYdIqw9adeYhK33Mf0xqcr+4D
	p7m/PTpjVYfVns6zm0Xi9I/xMEfL5P5M7H/lj+Yrn39DpBex2Tdzz6aWJIhrh8WV58Gw
	9upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=IWmQjk+S81lwOeS/1ASJ7bzOQPEnSlEtyI+Hxm3sjSg=;
	b=huTkscfBC+I3seFACuXPKRhGSjlWqj5Kz72RPTvi0kLu/tF3FOVTZoKw6LiM41zmYf
	E7lLrApdxJZhBhPBzXPkthv+RNDaeDfYo6sWM6yZM4EzS+lGCpPyDWwi+itv6/sIVAAD
	I5XFVxzNfOYXHejQnFVvBSbzk8WUo1L7C2E3laTTBCxKfiGg+ggETGHn4FbFZKdZTOW0
	lQ8rXnTp8pD0Fp+56xCwhx4nSchxaMMX7kL/U7Qwq+++obZaQrPOj/148dGIhvY6VH7M
	pqL6DmrwoJXMOk3Ih/IZJBBhQO46ZhArthqkdeOH2edCSmubTtvmqC+7ChVhgfrOcoSs
	0E0w==
X-Gm-Message-State: AKwxytfzYxEKejx9athVscarbLTsGYPVm9NBxQC3RYH33C/S3IdKBN6j
	aZktlkz2Dl5KyA196rq0DC7v8Jt4d02rQqUnUI4=
X-Received: by 10.46.2.221 with SMTP id y90mr2120017lje.39.1516747734022; Tue,
	23 Jan 2018 14:48:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 14:48:23 -0800 (PST)
In-Reply-To: <20180123030630.26613-11-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
	<20180123030630.26613-11-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 14:48:23 -0800
X-Google-Sender-Auth: xChdQ-udtLwja-WNRfqDdltKqn8
Message-ID: <CAKmqyKN-XiVF754_6vOYZqh3pQx9LP+NdV7vdNxKU4V3Y1W1aA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH v8 10/14] hw/arm/xilinx_zynqmp: fix the
 capabilities/spec version to match the datasheet
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: di2691jyOXz1

On Mon, Jan 22, 2018 at 7:06 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> checking Xilinx datasheet "UG1085" (v1.7)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..33d5fe53d8 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -50,6 +50,8 @@
>  #define DPDMA_ADDR          0xfd4c0000
>  #define DPDMA_IRQ           116
>
> +#define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) *=
/
> +
>  static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] =3D {
>      0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
>  };
> @@ -381,22 +383,27 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> -        char *bus_name;
> -
> -        object_property_set_bool(OBJECT(&s->sdhci[i]), true,
> -                                 "realized", &err);
> +        char *bus_name =3D g_strdup_printf("sd-bus%d", i);
> +        SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->sdhci[i]);
> +        Object *sdhci =3D OBJECT(&s->sdhci[i]);
> +
> +        /* Compatible with:
> +         * - SD Host Controller Specification Version 3.00
> +         * - SDIO Specification Version 3.0
> +         * - eMMC Specification Version 4.51
> +         */
> +        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
> +        object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &=
err);
> +        object_property_set_bool(sdhci, true, "realized", &err);
>          if (err) {
>              error_propagate(errp, err);
>              return;
>          }
> -        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
> -                        sdhci_addr[i]);
> -        sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
> -                           gic_spi[sdhci_intr[i]]);
> +        sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
> +        sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
> +
>          /* Alias controller SD bus to the SoC itself */
> -        bus_name =3D g_strdup_printf("sd-bus%d", i);
> -        object_property_add_alias(OBJECT(s), bus_name,
> -                                  OBJECT(&s->sdhci[i]), "sd-bus",
> +        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
>                                    &error_abort);
>          g_free(bus_name);
>      }
> --
> 2.15.1
>
>
