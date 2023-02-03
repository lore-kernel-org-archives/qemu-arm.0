Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1546569ejb;
        Fri, 3 Feb 2023 08:22:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8Keo3mKzmF+x2SegltcbG+6thyupmLFQ8FPMhwBeIuT4o4eRBbuDFj0QRCJ1CffVww3hvD
X-Received: by 2002:a05:622a:11d5:b0:3b8:251f:4cda with SMTP id n21-20020a05622a11d500b003b8251f4cdamr18731068qtk.58.1675441337125;
        Fri, 03 Feb 2023 08:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675441337; cv=none;
        d=google.com; s=arc-20160816;
        b=oJO4oLNXj96AE2uX41QuK4kzIQj18OqAduj9SNZeGWTt6SrmCZmaHDKTeG8fmUQ/hh
         3XqJg0ThIRE/eDsblZB2xFr3p7dtaPZCf9SQaLEZFrFWTfD2h5qso71E3V+amguN2jZk
         hMWY86lvMjgrYjuBgnFwsISZTUYhOKXx4pM2gPDJ4dZnux3AjO0leDLErO6WUvVxOScP
         PGO0Tc9b1WZ8vX/1Dmwfqw8dRQs8dOup+NyHGX7VTyFxtHzANaUNtZ6lBXz3tN9FZZG1
         wKTd8NJ2I0hy/ZSRti8YPq/91OKfvnA2n6f9I83BrJ3Afwbl+dftjklRFlsbFjFWmQez
         yquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=R9yyxpc2rHSMEAH2nAE8RUvbBd8EiCnRC/1bRS0oKGs=;
        b=g1xRwV04h/X8+X/hWqmTpb3i35Fp5sA7J9Z2OJHhh3i+JtpZ5E9DB0e2LaB19HiQBE
         eNe2Cf9gGGJmPsrKEn8CDPkh4uqY95xAwcqrO0YhIJthSmzhyM5h5qfb98TvXwmAotQ8
         1ynHRt7R+KfTnvOTxfQHrq/OHnI0narOaK1YzDWM1CBTa+Sd2jZ4J2qzp9mELFNxLEsN
         7urWEjiAnmgwAlOHEzolbLc41fFKpBn4fJlRkjbUHjMpwT8n1Vc2a0cAHtxlInNUkrw+
         cIGrSb9xY2a+lJz/wZBlh410QVrMVkA1HIE7nlVqVJ0ehHkxLJWTHglyBFDMpcnD6izO
         DwDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05620a424b00b00720e0ab6c46si2703345qko.542.2023.02.03.08.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 08:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyp9-00052f-2R; Fri, 03 Feb 2023 11:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNyp4-00051Y-2k; Fri, 03 Feb 2023 11:22:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNyp2-0005Ef-Af; Fri, 03 Feb 2023 11:21:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C3E85746D65;
 Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8615E746705; Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 841E974645F;
 Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Date: Fri, 3 Feb 2023 17:19:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 11/15] hw/display/sm501: Alias 'dma-offset' QOM property
 in chipset object
In-Reply-To: <20230203145536.17585-12-philmd@linaro.org>
Message-ID: <bf870b22-9c8f-177c-346a-9a1b1e8aa113@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-870387613-1675441165=:20219"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
X-TUID: oyUqc2B8vWTP

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-870387613-1675441165=:20219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> No need to use an intermediate 'dma-offset' property in the
> chipset object. Alias the property, so when the machine (here
> r2d-plus) sets the value on the chipset, it is propagated to
> the OHCI object.
>
> Note we can rename the chipset 'base' property as 'dma-offset'
> since the object is a non-user-creatable sysbus type.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 7 ++-----
> hw/sh4/r2d.c       | 2 +-
> 2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 0f7e09d7e2..efebd93f1e 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1943,7 +1943,6 @@ struct SM501SysBusState {
>     /*< public >*/
>     SM501State state;
>     uint32_t vram_size;
> -    uint32_t base;
>     SerialMM serial;
>     OHCISysBusState ohci;
> };
> @@ -1964,7 +1963,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>     /* bridge to usb host emulation module */
> -    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
>     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
>                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
> @@ -1979,7 +1977,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>
> static Property sm501_sysbus_properties[] = {
>     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> -    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
> @@ -2019,6 +2016,7 @@ static void sm501_sysbus_init(Object *o)
>     SerialMM *smm = &sm501->serial;
>
>     object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
> +    object_property_add_alias(o, "dma-offset", OBJECT(ohci), "dma-offset");
>     qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
>
>     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
> @@ -2026,8 +2024,7 @@ static void sm501_sysbus_init(Object *o)
>     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
>     qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
>
> -    object_property_add_alias(o, "chardev",
> -                              OBJECT(smm), "chardev");
> +    object_property_add_alias(o, "chardev", OBJECT(smm), "chardev");
> }
>
> static const TypeInfo sm501_sysbus_info = {
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 39fc4f19d9..d7020d6d2b 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -274,7 +274,7 @@ static void r2d_init(MachineState *machine)
>     dev = qdev_new("sysbus-sm501");
>     busdev = SYS_BUS_DEVICE(dev);
>     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
> -    qdev_prop_set_uint32(dev, "base", 0x10000000);
> +    qdev_prop_set_uint64(dev, "dma-offset", 0x10000000);
>     qdev_prop_set_chr(dev, "chardev", serial_hd(2));
>     sysbus_realize_and_unref(busdev, &error_fatal);
>     sysbus_mmio_map(busdev, 0, 0x10000000);
>
--3866299591-870387613-1675441165=:20219--
