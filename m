Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp740530lfg;
        Thu, 19 Aug 2021 15:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8/PVIjKCn52DYOMYT8dCSdUyLRptlM2Z6IvLvxIyuIwjODgQeEzGJdtFzaSIyRrr5u5uU
X-Received: by 2002:a6b:8d8a:: with SMTP id p132mr13280818iod.81.1629413476187;
        Thu, 19 Aug 2021 15:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629413476; cv=none;
        d=google.com; s=arc-20160816;
        b=zpiBk5LNutnPax7uvUCoCVnOY81FT5M4G8kiEpyUs302CwbmTUIxApMo+AVD0M94qY
         LGP084/0phStTRs53C4U2jFpP63shDQisKfLPtZyGoKTZ8dfydfv46ITPDX16xAY8sqE
         OcljaiRSzTWmB1UQw20VJvGAGuvTVF5giqIhMyWu3KpSfcTmfU45NwKxiK+lrr0oayoR
         MKYiv9Aju8ruqLdkHquhkA1oJOkbcbYQ6e6DAHbzfbX7614NIvYSnbbpATJLNnom8Mun
         g49G16DsgDWOW8w8AnQFq6+5DW+VFziQEonTwjF4dxIGTAbrV78okJA6Kfho/fcrTC/B
         Aizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LOftkpDKk6mQohXTsd7ZQ8wmGXsKNS5uiJKFMfnXOSw=;
        b=zqSA2M8kQRkeoFZep/lfSmeKI+QgzfwJI5cPZI7E2Hi0CgcC2eCyAOtj9ti7lKI1Hk
         Bs5Gdw/v7oHWryzrdVZmi7OjqdRbm5BY8WB4rDon2BS7Ht2pAW2+z6grHl7LxuVpoA0f
         Wnh6cIzDAomt1S+TQyPVqpvx61ae85hePnYYp6N3ICY0/h643agoIe5JWNk8yjReZSZw
         JjSmAJ23UvOsD0cSp2NWJPNOd+nbvzOgWuYvFNb6dQL6UjubH59o4ikLkQOGBAcOy1A9
         dgrg4YaDumFzHOicwk4NQbM02SIV2xmrCwTHQhBqJxDdMogftv4IwzEM7Lwl4+8AtoG6
         cjTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y7P0vhzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si4422104iot.52.2021.08.19.15.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 15:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y7P0vhzA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGqsV-0002R9-Hl
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 18:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGqsG-0002Qq-Lg; Thu, 19 Aug 2021 18:51:00 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGqsE-0007It-CW; Thu, 19 Aug 2021 18:51:00 -0400
Received: by mail-io1-xd2e.google.com with SMTP id g9so9773567ioq.11;
 Thu, 19 Aug 2021 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOftkpDKk6mQohXTsd7ZQ8wmGXsKNS5uiJKFMfnXOSw=;
 b=Y7P0vhzAlSZYQaPbEgUsQe4NGSD3SodzaPROtQNWf4J0NjWRbcRtkNpYTG6dtOrqcm
 Eufs54Qa3028TTonK5ulXGmqf2JiGuAFQhi7wjBzciXrghKsEZNCZYxtFkvKQTt0cZj1
 XIm6vNXEhHYbTldGCC3N+MyGCfidn1QTjWTt7eDJPS+MPvbicf5pht9QorThbSdOfjo9
 /2113G48fvW5P7Lxmd9M5L/S2FA+UGGMTvpFM19W+oWUp5zXDAx/AV07x1mwhGOC02nD
 oUnNaqv8xBS/logv8zpf8WC7oZzBi/KOx3dNMMf1XnB07h3p2N4mutx2+YIO9B5yfRlZ
 Kzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOftkpDKk6mQohXTsd7ZQ8wmGXsKNS5uiJKFMfnXOSw=;
 b=YxUEDsutVYZ9OPTfdtbqEckghPZ1VSNfTR6Re4pdCb9obNLxAo70fXHPbcio7rWXqE
 BhqCyWxreTHMn+23h82FWxQCqsxdPIuzydoVRdoXpZjnX4gP8IkWvbtUR0RCuapVgEsg
 YRKIf0xetKo0nc868FXTsDTbN4qvs7yLa2TTZxBN9bl9m1zJVGRwXSKArY6OqADpyGlq
 HPZPDCjt0/sFbDMKYK555D+4pkkqlG7g5UTSZxPxKM2wuGgBRMGvVU4ae130FzRJ1qjA
 cpFdK0DpMNbFOupzvH8CJ/TwpBZHz4AARj2Byv6DRcSrF59apkgzW5KOe3uM9svMaFde
 yn5g==
X-Gm-Message-State: AOAM5300H8mm5MebCxOk/e94NKFpDo10thBcB9W08YG99wMe6BXcKMbJ
 SzPmScuGuc6RvTtuOuG9MWlPtqkmhBDlKzSuHNc=
X-Received: by 2002:a6b:610d:: with SMTP id v13mr13145030iob.42.1629413455982; 
 Thu, 19 Aug 2021 15:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
 <20210819163422.2863447-2-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Aug 2021 08:50:30 +1000
Message-ID: <CAKmqyKNvEKT=C04brWRgS4K2bcE642_ZdTutDfeJtpQrEEcMsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/arm/xlnx-zynqmp: Realize qspi controller
 *after* qspi_dma
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fi7IpaYdmOeO

On Fri, Aug 20, 2021 at 2:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> If we link QOM object (a) as a property of QOM object (b),
> we must set the property *before* (b) is realized.
>
> Move QSPI realization *after* QSPI DMA.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 3597e8db4de..9724978761b 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -570,26 +570,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Er=
ror **errp)
>          g_free(bus_name);
>      }
>
> -    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
> -        return;
> -    }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
> -
> -    for (i =3D 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
> -        gchar *bus_name;
> -        gchar *target_bus;
> -
> -        /* Alias controller SPI bus to the SoC itself */
> -        bus_name =3D g_strdup_printf("qspi%d", i);
> -        target_bus =3D g_strdup_printf("spi%d", i);
> -        object_property_add_alias(OBJECT(s), bus_name,
> -                                  OBJECT(&s->qspi), target_bus);
> -        g_free(bus_name);
> -        g_free(target_bus);
> -    }
> -
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->dp), errp)) {
>          return;
>      }
> @@ -646,8 +626,26 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Er=
ror **errp)
>
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ=
]);
> -    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
> -                             OBJECT(&s->qspi_dma), errp);
> +
> +    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dm=
a",
> +                                  OBJECT(&s->qspi_dma), errp)) {
> +         return;
> +    }
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
> +
> +    for (i =3D 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
> +        g_autofree gchar *bus_name =3D g_strdup_printf("qspi%d", i);
> +        g_autofree gchar *target_bus =3D g_strdup_printf("spi%d", i);
> +
> +        /* Alias controller SPI bus to the SoC itself */
> +        object_property_add_alias(OBJECT(s), bus_name,
> +                                  OBJECT(&s->qspi), target_bus);
> +    }
>  }
>
>  static Property xlnx_zynqmp_props[] =3D {
> --
> 2.31.1
>
>
