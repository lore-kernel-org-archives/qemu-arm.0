Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp600550lfm;
        Wed, 15 Jul 2020 07:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnmeOCQ4rZ4NA0kP/8N9zrs1ski24TOtZlzBOyrrgdsRekPJ8uim3NXeHmz/UpbsIriCu5
X-Received: by 2002:a25:804b:: with SMTP id a11mr10938119ybn.363.1594824616879;
        Wed, 15 Jul 2020 07:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594824616; cv=none;
        d=google.com; s=arc-20160816;
        b=IncKWN1gnbTeK9iZZcm7m/DCvOWUm/HcYXydnpjSEQDGYo+EQPdz/08luk90Gdk9ZN
         RY2ZSbiBi5nYs3V0/6gxALpj06yUym3UlCWsnNuggRDAxv/eOBa8YTyq9Et6RQKxhIst
         DqS+Wpusb0KZh+O+h0BtBTyUMui0DTxuLoD5fFGFm6iSqQ1+Y/boIY1Ml//kbyy4CPnt
         WO8aJ+xGOjQGr9oFn2xNIsGoaPsMoBpPICadtile7VW7BQywIXi3zMGG8/12dUlfGogW
         xu7iP8d1I6Aakn10c/Vvx42J21Y1TeFRJ4nyQPgX12eZN9lEP8r9fTLW/AGLWRbGA7A0
         QRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwF5kLecPGbFx7XOkpIQGvxC60yxwFLvNgeE86muLgE=;
        b=0I/LGXYa+HNUYpGRDKaaCVPhm1+g+3hAahJoSKj+YIrqQOlhmE4jcyldKtbQhJPsni
         PvkK9wTcl2ncN/+7hpk+wJLG8jyFB9TiYZAgnUsitke86HVL1oRgNPmKkIQkjIL5drV3
         hsVN3ZnUpeagYm/2AKBUr6LzqbvGxPEeHnVM2sVTATEZ6FUeGYLEgRFGz33RpUiQR5Ed
         qIfGAduDVEqg2kZZN+Ninu+R8zqgOEtsgXu+2M4eUy1E8Y8snjVGE/fiRGjkDQ2LJi4V
         kFPFfbAOyhtzZbutjhmKucyO/fyhD9jYglGt+MkdDaqIRU7J43/jfOr1aK7WzCkAUo6A
         EAtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlHACp3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w127si2920447ybe.10.2020.07.15.07.50.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 07:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlHACp3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvijg-0000Qj-8a
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 10:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jvijR-0000P3-M8; Wed, 15 Jul 2020 10:50:01 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jvijP-0000yL-HA; Wed, 15 Jul 2020 10:50:01 -0400
Received: by mail-io1-xd44.google.com with SMTP id l17so2492288iok.7;
 Wed, 15 Jul 2020 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwF5kLecPGbFx7XOkpIQGvxC60yxwFLvNgeE86muLgE=;
 b=TlHACp3x5i9hsSwEYd5uZlRy2gy8E+87mlYM+q+5Guzr5HR72CAwU7y60b5WKBmbzH
 1GeqG8K6sdZloe8KoS5ENliBn2iTZhUN9TLe1bdtMPd0DFieiZ8Jj4uJk5eV+ssnIPa7
 Ef4QYgbGsV94DOHiEC5psLnS7j1GkA12OjgZDIr8YIPVkKdgPrlU1Hyldrhtropnw9rV
 dJKhOUmC2tM8Oln+tAGBPzSLkWBFMNBngUGlybZJ3SV2778oU47QJfuwvbSvC5Wwo50e
 m6avdTxv+134xNHSz1uCufpd+PQMQzCmXPZBDLhP/GBbvlvpkHuSjxE1rISIpjcmdKbv
 qTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwF5kLecPGbFx7XOkpIQGvxC60yxwFLvNgeE86muLgE=;
 b=WswVbJc8gs7V5o1duh8zfJFCBJ1mScbxd2zPO0FvKlktq1SIVTo15sUb16UxpMpUCI
 UEyCtL1flgIW/GdxjF02V7yYHZ/rr1LM/p6mGgf1ibsQY7PNliMgMgYXm6tUf9DBXN5o
 ojvheSmq/qVBPwuTcr39UA3r2STDseAnjjBbrn2hlLMq87lL/qgLEFjRtZAmuIzE6NgD
 uKEVNFggXZr9XocyZ8PeCWmOgxLF3MiP/gcgAKesFo+yzoaPCPIdsBC0fVdymhOYTn6C
 zp9jBDBOSWUvazbz/R/DScqXbYUhz17SuMzaNekPxci67V+KvUmmKgFDVM2Cxbesblxd
 ivKg==
X-Gm-Message-State: AOAM532sKt5U0m2KKB8TPIh+b019oxPmZmsmtmO5//UpgtKYP0xE5zm9
 86SdBbMmLgV0m6m8Sp/CyWbfbzmxICIn2I7Fc3E=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr10611822ion.105.1594824597354; 
 Wed, 15 Jul 2020 07:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-3-armbru@redhat.com>
In-Reply-To: <20200715140440.3540942-3-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Jul 2020 07:39:56 -0700
Message-ID: <CAKmqyKPuNqq+CrxQ7uqJNKNW54MLbjV-nXHh-yj=LsTObBjBBw@mail.gmail.com>
Subject: Re: [PATCH for-5.1 2/2] hw: Mark nd_table[] misuse in realize methods
 FIXME
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9pezGI9Fqlyy

On Wed, Jul 15, 2020 at 7:06 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> nd_table[] contains NIC configuration for boards to pick up.  Device
> code has no business looking there.  Several devices do it anyway.
> Two of them already have a suitable FIXME comment: "allwinner-a10" and
> "msf2-soc".  Copy it to the others: "allwinner-h3", "xlnx-versal",
> "xlnx,zynqmp", "sparc32-ledma", "riscv.sifive.u.soc".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/allwinner-h3.c | 1 +
>  hw/arm/xlnx-versal.c  | 1 +
>  hw/arm/xlnx-zynqmp.c  | 1 +
>  hw/dma/sparc32_dma.c  | 1 +
>  hw/riscv/sifive_u.c   | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 8e09468e86..ff92ded82c 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -358,6 +358,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>                                "sd-bus");
>
>      /* EMAC */
> +    /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd_table[0].used) {
>          qemu_check_nic_model(&nd_table[0], TYPE_AW_SUN8I_EMAC);
>          qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index ead038b971..e3aa4bd1e5 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -160,6 +160,7 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
>          object_initialize_child(OBJECT(s), name, &s->lpd.iou.gem[i],
>                                  TYPE_CADENCE_GEM);
>          dev = DEVICE(&s->lpd.iou.gem[i]);
> +        /* FIXME use qdev NIC properties instead of nd_table[] */
>          if (nd->used) {
>              qemu_check_nic_model(nd, "cadence_gem");
>              qdev_set_nic_properties(dev, nd);
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 772cfa3771..5855e5d5bf 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -455,6 +455,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
>          NICInfo *nd = &nd_table[i];
>
> +        /* FIXME use qdev NIC properties instead of nd_table[] */
>          if (nd->used) {
>              qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>              qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
> diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
> index 9459178866..bcd1626fbd 100644
> --- a/hw/dma/sparc32_dma.c
> +++ b/hw/dma/sparc32_dma.c
> @@ -341,6 +341,7 @@ static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
>      DeviceState *d;
>      NICInfo *nd = &nd_table[0];
>
> +    /* FIXME use qdev NIC properties instead of nd_table[] */
>      qemu_check_nic_model(nd, TYPE_LANCE);
>
>      d = qdev_new(TYPE_LANCE);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 19a976c9a6..e5682c38a9 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -714,6 +714,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
>
> +    /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd->used) {
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(DEVICE(&s->gem), nd);
> --
> 2.26.2
>
>
