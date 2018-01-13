Received: by 10.28.173.206 with SMTP id w197csp72098wme;
        Fri, 12 Jan 2018 16:53:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBou33VwNG7xvv0GZeviVYIitCuwn8I7aYsnioX0Sv40nGddLVmoPCOeVMCjHqfQPpOBy0DlR
X-Received: by 10.37.74.132 with SMTP id x126mr8730840yba.91.1515804818318;
        Fri, 12 Jan 2018 16:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515804818; cv=none;
        d=google.com; s=arc-20160816;
        b=w8w8r4kZynQMJ8NZNGREZQRoUEsSF/K/TLx9ZFdeGXuqZbcVo2DL7rGfwpdg8hz+R9
         ZhuSRctvLm7Ze78oJhiZ5zhZ8FkhdsSNGkPoeohhZuaMzpnZ23c/Wls2Bzf8Mv1fuT91
         2/C3MNbZMfSmF8x0BtjDo2fL+uTZck5W//hqn6+cIwYUMnsHA+7J+pTXdaYYF3tiHJuu
         S2eYDY5aCE8/4kRUfTAaOWtH56k5F5ZuhY2KFV3qsbReF4/4jUiqqISY5AUqr/FwsGkR
         g/aAQBNwSIbKMUfcL31X/EUlUf+2srqaGto7VUF89NQUzlDhdqUD0MLu/EAMWpdaytOD
         nfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fQCCmIBP7nWDlkow+wBnrrAXy6qHtIIH425CWbdiDp0=;
        b=zQjvMcaukckF7ckUAloAdb3EsaHIjDoe4MW71EzV+Wrb9PAIZmClOkAT2RWEcaLV21
         Tm4WS0YrV4QduC0uPHXS1b98lPgb3/zj8ZfjWKeiNzQ1oK0CWM78TGYkdFO9ueZEpZCo
         FzBxlOus2dUn44RRE1Sc7jsaKc1CPgYQQScDpqCTtEUd4du6yBpIwby0bZevXntPtbqp
         YEoMjMB5pvh13Fb3eKT+Z8R+NmoFemGEEocAtm/0JsQB+XoIQDb5MHhp+wMiP9Wd9pUc
         zFNSyxvsJII6zbH3R6ajDadlXFhBBjWwKtXfQmNXFPXHH5WTqdjGcbMlAcWMDni4I6NN
         Zyeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gxNKh5tX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7si4708642ybd.42.2018.01.12.16.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 16:53:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gxNKh5tX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaA4n-0002SP-R2
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 19:53:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaA3U-0001gp-DQ
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 19:52:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaA3T-0004m5-Eo
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 19:52:16 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eaA3T-0004kw-79; Fri, 12 Jan 2018 19:52:15 -0500
Received: by mail-wr0-x243.google.com with SMTP id g38so3548610wrd.2;
	Fri, 12 Jan 2018 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=fQCCmIBP7nWDlkow+wBnrrAXy6qHtIIH425CWbdiDp0=;
	b=gxNKh5tXMX/oHXBmHSRHWjTqBzL3ZI/ckhXtcbZB051g8GbHQyAlWOZD8Y+nyOpEas
	A12p2F8ep8hUHBK2X2yfQmxpvZtO3gMsjRTJB9j/6mtmeOgk6LTl89DzwIZ5UN64E6/k
	kmzpn/qBq3bhSaIANHDHccyh/boTtnqbE01rSXrR9sXcDWuyhXNAQi197gSztn5MG9fL
	aGugfx5NfxpKL9Lj7Ansk85Qgx0CxTXOtwlR8cbVbrS96P633eowEvdiDEIWwZYld94C
	47t7CYzksQJvrd1QRNiMue3KHLC8WWYkUWIryfQW7nxTowtLyfPR1uYLRiUGV6zixCX0
	MXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=fQCCmIBP7nWDlkow+wBnrrAXy6qHtIIH425CWbdiDp0=;
	b=YbqIFkPTtblsWEqgxigPMO8/Isipt7dLU+vTEjZZt2S4lIa2LQ5jZjqx9l1aQEHaJx
	BiB91jhWfJ8DfoA5xEAg/IAC7i3o2ZafrnL3NXzjEsolvrMlnMZAPeRhvzZC05wM3b8n
	GotVEjS1v0CrfoyLlLDaa5fKoan/jAmt5FH6bsZDKeuiinYh4Koe7w3L/azMXjB6TZaX
	jC/XWrov/+grcAafJrpoNbjwH4DWxrqIzR4isUfyztR7JOe8YdI22y9ej4KxkTeD34iP
	gVj8/Cr3F90D5qo6+EmULiTP5OC2m9wZUes+1f7TP8wh6XCpmNoXdinohRsAhiO3rkEn
	iHQA==
X-Gm-Message-State: AKGB3mKszjtlggFME3Dhw//KZ+fLxhDn+aLoB3U3SS9SMCcLly0UTqnu
	qA0tSa+g8cKwI2Z8EL4yP/KqMXCuG5kwqxe3Oxw=
X-Received: by 10.223.158.144 with SMTP id a16mr26480334wrf.83.1515804733992; 
	Fri, 12 Jan 2018 16:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 16:51:43 -0800 (PST)
In-Reply-To: <20180111205626.23291-16-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-16-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 16:51:43 -0800
X-Google-Sender-Auth: 0mT6oiSHWz_M22SgMfYDVkJCztA
Message-ID: <CAKmqyKNWsr6JjSHSTgpEaCnzZi2btJ4by_og-Ueyodzxy+HJoA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-devel] [PATCH v6 15/21] hw/arm/xilinx_zynqmp: implement
 SDHCI Spec v3
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
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4OizncdV1QMl

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..dacf89c566 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -381,22 +381,38 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
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
> +         *
> +         * Host clock rate variable between 0 and 208 MHz
> +         * Transfers the data in SDR104, SDR50, DDR50 modes
> +         * (SDR104 mode: up to 832Mbits/s using 4 parallel data lines)
> +         * Transfers the data in 1 bit and 4 bit SD modes
> +         * UHS speed modes, 1.8V
> +         * voltage switch, tuning commands
> +         */
> +        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
> +        object_property_set_bool(sdhci, true, "suspend", &err);
> +        object_property_set_bool(sdhci, true, "1v8", &err);
> +        object_property_set_bool(sdhci, true, "64bit", &err);
> +        object_property_set_uint(sdhci, 0b111, "bus-speed", &err);
> +        object_property_set_uint(sdhci, 0b111, "driver-strength", &err);
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
