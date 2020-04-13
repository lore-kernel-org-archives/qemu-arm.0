Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4270407lfm;
        Mon, 13 Apr 2020 15:13:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypI7aAn3143du+xnpqxy2X39DZGxbMsP8N2SGLbf2LhOdq8z0Z7teBWLrw/Ya5/WTkeyBkSg
X-Received: by 2002:a37:4f83:: with SMTP id d125mr19374656qkb.296.1586816025967;
        Mon, 13 Apr 2020 15:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586816025; cv=none;
        d=google.com; s=arc-20160816;
        b=BmaKv7QIGfRCQxzxS+C7cF4vDwkpCzE5HoJOMgYvwA0v0MCAI4RnJPC1C9oikSjvdM
         NZDxQICh/HeLayxVxx0KTtRy++SZ5zR/s+Enkmlut3FF5nX4eLlPCGJujvrjkUP8SIky
         O6Xj+9jTsefOK9dkw8Zyje6WSls9VUEun/lw0Z/zeIqVW2G1G9xX4wHllaXjGnN8TqSD
         Q1n1DXRhY4IGs41ijza7GNKZsnVg1DRVJRPEa8LI1oFVyksrUS9+b8GQv7whxP5z2bOT
         DcEbRI50iw8yXfW/AEYW4LVVgJ8b2VEZnijZ1PCSpmoOiqj2w6XQ2F+QcDBDxRg99b59
         4OXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QVGiwzDVXsng6V7wzwCWbfgWJVNp0GqNxsTzRI+mWVU=;
        b=CZPdnBGnxdOrbxpCRsC8f0/uglPolgFTq83QsVZ9SfA9XeJStrASN+RKTcoxc8zWan
         5f3yUb9pO/gItVNc5gtrBZqMat7aM2BMnyacuWbelaAR8loNLp8N/07PrF3pQqXOSBUg
         qs2wuF6z4KodSEbKtMCb5AzSrpHN8t3ys9aDeXNcxuKfrDLhPDFfqpNz4RXMgPJu2n0w
         KC2etzlM4fHeHJrVkMiiE5H6Qc470xovUgVW0ef4h9QSybXa4zRUNDcVBjqtg6D/SlmK
         ITlOdu02tepE+zhnypE2w3ok+lqKvLDzPFrDD+eg6OHMuDLNitMsCIhHS2Lo7VVSLNnu
         ojjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SHANxu50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci9si2717345qvb.18.2020.04.13.15.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SHANxu50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Kr-00009Q-9a
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45095)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Kj-00006s-1K
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Kh-0004aC-EW
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:13:36 -0400
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:37320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Kb-0004ZM-7G; Mon, 13 Apr 2020 18:13:29 -0400
Received: by mail-vk1-xa43.google.com with SMTP id f195so2685126vka.4;
 Mon, 13 Apr 2020 15:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QVGiwzDVXsng6V7wzwCWbfgWJVNp0GqNxsTzRI+mWVU=;
 b=SHANxu50qfI6lch7kjJUabRpcqqwvSlbFIdbI7gWU6b21Ty5/POPVjvhlVzVZikm0C
 aK50aut118wRB2mxwpE8x6OWjbYhsMYgp2TjBUT9buHtBXx448izUympsR+q+hKkbCka
 IG0Bc68ysiltoIVpcZaLouMGXBfYam9h8Rm4uTjR+09ZXDFnNRTaZl+giAGXQt0TE627
 uhsE8ZMoUmCe523HaKA7nYGYHN39R7nv2RHl99qbYDmZF5GgKpqzrKf6MvPSqKJkuLEC
 v2A5gM/I5u46515fzK1dWa+dZREb0APZvkDZhEGalz0CBcBDbh2sI7ElTL3H8XjR/OQ3
 2sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QVGiwzDVXsng6V7wzwCWbfgWJVNp0GqNxsTzRI+mWVU=;
 b=tXpV8wps4BYDEA6AoDPF9jdnA01MiOxMda3aFvQ5aZ+pza/Pz9T/2UO5SDmtT2H77L
 O6Ef8fxrFAwKKOE2mBWW/PxiPO9aqQgTtls16DCjU7bQWNkhlurUGFcsQBnAxRHzKuhd
 u4iwYMszZdZjpdgrmtyUNTRDToSmoHXcB8F+WC4XcauHJnpVmClmvDt0sUUpjV2iqZIj
 hNL/BIctnXYyjvEV6gS5tq9Ysci7mr8uuRzPnnpqmYEzI06LFtXOlmi8eFLLgg3ZYFrk
 Oa+/+F1WKYdFYWqPwdUj6Rd/6q7Q9gCuYDgYmFXKyhsLinf1yoM3LS4w+6dvkDlabq3N
 bjOA==
X-Gm-Message-State: AGi0PuaCsTjXT9fMJ/2Ev7Xn4ZdKRJwXql/T1ip/May/8PxGB7tUJbSo
 DXQ5x7IpdpzR5ds2obDXXLA8aos7NZVZ7+j/hgE=
X-Received: by 2002:a1f:2e8c:: with SMTP id u134mr13001976vku.16.1586816008350; 
 Mon, 13 Apr 2020 15:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-15-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-15-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:05:12 -0700
Message-ID: <CAKmqyKOUZPaERF3VYRDEn1+0g86ULEJP5w-iuE_eOyA3_KXScw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 14/24] hw/arm/xlnx-zynqmp: Use single
 propagate_error() call
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8aovOsbp1T8q

On Sun, Apr 12, 2020 at 3:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle failed at processing this file:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/xlnx-zynqmp.c
>   EXN: Coccinelle_modules.Common.Timeout
>
> We are going to manually add the missing propagate_error() calls.
> As there are many Error* calls used, simplify by using an unique
> call to propagate_error().

I'm not a huge fan of goto's so I'm not sure this is simpler.

Alistair

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/xlnx-zynqmp.c | 61 +++++++++++++++++---------------------------
>  1 file changed, 23 insertions(+), 38 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index b84d153d56..43d57fa7de 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -385,15 +385,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized=
",
>                                   &err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>      }
>
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>
>      assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) =3D=3D XLNX_ZYNQMP_GIC_RE=
GIONS);
> @@ -462,8 +460,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>
>      xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>
>      if (!s->boot_cpu_ptr) {
> @@ -488,8 +485,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>                                  &error_abort);
>          object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &=
err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem[i]), 0, gem_addr[i]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem[i]), 0,
> @@ -500,8 +496,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>          qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
>          object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", =
&err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, uart_addr[i]);
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
> @@ -512,8 +507,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>                              &error_abort);
>      object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sata), 0, SATA_ADDR);
> @@ -531,23 +525,19 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>           */
>          object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &=
err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          object_property_set_uint(sdhci, UHS_I, "uhs", &err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          object_property_set_bool(sdhci, true, "realized", &err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
>          sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
> @@ -564,8 +554,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>
>          object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &=
err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
> @@ -582,8 +571,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>
>      object_property_set_bool(OBJECT(&s->qspi), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
> @@ -605,16 +593,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>
>      object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->dp), 0, DP_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->dp), 0, gic_spi[DP_IRQ]);
>
>      object_property_set_bool(OBJECT(&s->dpdma), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>      object_property_set_link(OBJECT(&s->dp), OBJECT(&s->dpdma), "dpdma",
>                               &error_abort);
> @@ -623,16 +609,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>
>      object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
>
>      object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
>      if (err) {
> -        error_propagate(errp, err);
> -        return;
> +        goto out_propagate_error;
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
> @@ -640,13 +624,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
>          object_property_set_uint(OBJECT(&s->gdma[i]), 128, "bus-width", =
&err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>          object_property_set_bool(OBJECT(&s->gdma[i]), true, "realized", =
&err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->gdma[i]), 0, gdma_ch_addr[i])=
;
> @@ -657,14 +639,17 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
>          object_property_set_bool(OBJECT(&s->adma[i]), true, "realized", =
&err);
>          if (err) {
> -            error_propagate(errp, err);
> -            return;
> +            goto out_propagate_error;
>          }
>
>          sysbus_mmio_map(SYS_BUS_DEVICE(&s->adma[i]), 0, adma_ch_addr[i])=
;
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
>                             gic_spi[adma_ch_intr[i]]);
>      }
> +    return;
> +
> +out_propagate_error:
> +    error_propagate(errp, err);
>  }
>
>  static Property xlnx_zynqmp_props[] =3D {
> --
> 2.21.1
>
>
