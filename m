Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C4E92FD3
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4V-0004HZ-Dc; Mon, 29 Dec 2025 14:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4F-0003w0-6F
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:12 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4D-0000H8-3l
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:10 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso4444641cf.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037087; cv=none;
 d=google.com; s=arc-20240605;
 b=gr9qFIM8QzYuk0LxkbdxxmTPgbbxH6nXtPfPLLIjO+xzs8if5hA6d8fof+naNf9fug
 XfdAVJxfH9PIXSa5+ZKUcmspsNEAFkaym1ND36u/QsayeKAxkjsuTSBoWfVZLLgWHhYX
 gRleqJehcskursqILNmvQXdm9NAyQUgQtOzfB71pI1Z+yPvVY/gdna4bJ/O5QBY7cHs2
 jszH9A4GTvqVqhvZClBojKKaTYkr1fT4ieV+uD4IDiyTEBiq4fw0LyNQAp2hbhOSk1e7
 0aHf9KwfanQsoZ9ATfLDTz7V2mb+/VEiXh0TrgMjs7KRQ1j1HnBOqTrHl5JCKkx46n+x
 ut/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zuTJiWk0L++OdECP3jktqysCn72HNQBRFVZi8vZmRxY=;
 fh=qYB6Z6swtRlDYMqJilOeKElwnRvzKip/VKCKhK2vtaM=;
 b=NrMKIB9kjQhuhxIwLtd/TkGkKif5Rx2DIo7vHt5U8PbzONyZ3yoB440B1PaDcO6Unr
 +C+ABQ4bVywKPO46USR4Ppc4TZrUMhFlwMzgr/Pf2MJbhNj6DjWIROGKe9Fu2fcSOvhl
 1Q4YOSF/LnN+SvcPkhhDSq7fWOK7htSggo9wDSWFxacyMm3aBh0nMaaP13rESbU7RNt0
 ncgAXeOu3U74uR76P83GPA1HZ1sFrMOBBYnFvUvPLn84qVDUEW+FMZiNp/H5de39R/R6
 l2k1DT/lMnum8DFgXWSY07tJDxo5fXqonOQJo/uK9rtclzE3YMgmXTB2XLqFeT4SoB6W
 0UCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037087; x=1767641887; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuTJiWk0L++OdECP3jktqysCn72HNQBRFVZi8vZmRxY=;
 b=KVLi+a3am9aCt2Tzgg1z9vQVjDeZPm8srhHAyxuX0lpdZaDAPMTRXQ7bbBYigLtQqw
 aCfRKMSB4doY3osdtE0X9KrD1i/kx7W0NDDEf8d71Q/wBcbCgSS1harIwX7l6S28QSgH
 WYgb2/4Bco9MT1o701UR0kj6UP59Gi6T/7tTbtCJ+HBYOtLEs/ynwCCy4Hn8lLF52fbM
 rQledspRK019DuE8/mkEWgNtdiGpxMZoOdJQ3iwjCltmsWdQ9gVtxqMSxb0T+NWhRlP2
 7CJ1xRvkKMuT7L4eb3GzdRltQ9R/nIzczaTRVg6mb4Lt5A0cKNOROuUHKGt/GfBsJTSu
 5tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037087; x=1767641887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zuTJiWk0L++OdECP3jktqysCn72HNQBRFVZi8vZmRxY=;
 b=k96xKNZJ8aX11iUztWxk2QVHKc4JNITMjckc1zR/TJQY6mPscxzUJqFIeI3ZxYqYCb
 Tm5tftCot9sCDZz73wIa/2OwcXYAUTREGPV+BKL263kyW5JXKqyjyapc2umGXA+7wUB7
 VDe+Fi0Qw5KqmLSQC1XlabpVBqU8R4iTJYjOEusGFncZj3xLO2qq8GRvhu7XK6wCrasj
 IC5TzKpyXoTZ+/6TIT3x98z0KRPRpz8Bb4QPmhzemp4KDY581iVq5ab4fxWKQ8v6MZIT
 0Vh7aOap/jXAxPDZHWZNvzvSswho8v8+8Aqr+wit2mXw/gblg16yQE2MK/4Ei+V218+9
 ROqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTDLIiau6xYiO4Zl8Tp1Tf9Pt5O/Cv/qo60+Bpzznu7Yi3nFKc0SaEq8gqkjpMX5Li0cKicYwE8A==@nongnu.org
X-Gm-Message-State: AOJu0YyVpDYnFtwrmQ0hChE5rUn2Jf3aOfBUvqmeqDM7EJwYzIr86/BR
 d/F+YELW2WUkBQukIM3VM0qaUEgc8G8nnsJ37KPkZLk0jYwpGY8lRIxTUzreGL033iBE37Tk9Q1
 fMKxmahJyysEWVj2qFdBB0KS6XZ7jby+SgtMW435E
X-Gm-Gg: AY/fxX7NWVIPz2XcbaSZV88fPIRkWXGTs//JgiHXEmYXVuuC94wvuGyhPzqh7tlE+gp
 C85UZ3u0K85vQG0k645EGhpZu0IUz86E68gfAwugg+w+n7XKuDU3ek5j9Xbzo7qqrSwRwuUF+Qs
 qkeZoqjbEUF9npxnihh1aijIwnm/akECxA8QrPKatRF4UjAVRjXPc1aqrzPxbELsDjiwqfri3VG
 l2yqbXL0q8mYAdrI9jnZjNJwTI0bV707btOta10TPx6LZsM+p/RH7CY1CqkGKmXlEERTdmpl/Kj
 1sriL+bNMTTIDBCEBe0TtQO7JA==
X-Google-Smtp-Source: AGHT+IGg7vDbpaWDgP0I7HPKJtytO55GbbdrcdtyCzWIr319iyw21CpRPQGJaxT9XUHY8qndw8khYi5ezYf9Wq7ynME=
X-Received: by 2002:ac8:5ad4:0:b0:4ed:b4e3:cfa9 with SMTP id
 d75a77b69052e-4f4e5f73bb3mr34920711cf.5.1767037086885; Mon, 29 Dec 2025
 11:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-7-kane_chen@aspeedtech.com>
 <8d290ffe-351f-4dee-90f0-05dc1d299872@kaod.org>
In-Reply-To: <8d290ffe-351f-4dee-90f0-05dc1d299872@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:37:55 -0800
X-Gm-Features: AQt7F2pndCu4Eh-PKYuMv8R4soaUtN2IgxEWrjNd4FMSgKvFEIgD5eqRCmg4Gv8
Message-ID: <CA+QoejVUzN0vqyC05R52_jX5vgFcBo0Dxp-91ZDPoff6SBrWsA@mail.gmail.com>
Subject: Re: [PATCH v4 06/19] hw/arm/aspeed: Integrate interrupt controller
 for AST1700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Dec 24, 2025 at 2:39=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 12/24/25 02:41, Kane Chen via wrote:
> > From: Kane-Chen-AS <kane_chen@aspeedtech.com>
> >
> > Connect the AST1700 interrupt lines to the GIC in AST27X0, enabling
> > the propagation of AST1700-originated interrupts to the host SoC.
> >
> > This patch does not implement interrupt sources in AST1700 itself,
> > only the wiring into AST27X0.
> >
> > Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

I agree with the readability notes from Cedric, as for the bus naming,
I feel like that applied to patch 14 more than it does to this one.

>
> Thanks,
>
> C.
>
>
> > ---
> >   include/hw/arm/aspeed_soc.h   |  6 +++-
> >   include/hw/intc/aspeed_intc.h |  2 ++
> >   hw/arm/aspeed_ast27x0.c       | 37 +++++++++++++++++++++
> >   hw/intc/aspeed_intc.c         | 60 ++++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 104 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index f19bab3457..b051d0eb3a 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -58,6 +58,7 @@
> >   #define ASPEED_UARTS_NUM 13
> >   #define ASPEED_JTAG_NUM  2
> >   #define ASPEED_PCIE_NUM  3
> > +#define ASPEED_INTC_NUM  2
> >   #define ASPEED_IOEXP_NUM 2
> >
> >   struct AspeedSoCState {
> > @@ -146,7 +147,8 @@ struct Aspeed27x0SoCState {
> >       AspeedSoCState parent;
> >
> >       ARMCPU cpu[ASPEED_CPUS_NUM];
> > -    AspeedINTCState intc[2];
> > +    AspeedINTCState intc[ASPEED_INTC_NUM];
> > +    AspeedINTCState intcioexp[ASPEED_IOEXP_NUM];
> >       GICv3State gic;
> >       MemoryRegion dram_empty;
> >   };
> > @@ -288,6 +290,8 @@ enum {
> >       ASPEED_DEV_LTPI_CTRL2,
> >       ASPEED_DEV_LTPI_IO0,
> >       ASPEED_DEV_LTPI_IO1,
> > +    ASPEED_DEV_IOEXP0_INTCIO,
> > +    ASPEED_DEV_IOEXP1_INTCIO,
> >   };
> >
> >   const char *aspeed_soc_cpu_type(const char * const *valid_cpu_types);
> > diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_int=
c.h
> > index 51288384a5..4565bbab84 100644
> > --- a/include/hw/intc/aspeed_intc.h
> > +++ b/include/hw/intc/aspeed_intc.h
> > @@ -15,6 +15,8 @@
> >   #define TYPE_ASPEED_INTC "aspeed.intc"
> >   #define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
> >   #define TYPE_ASPEED_2700_INTCIO TYPE_ASPEED_INTC "io-ast2700"
> > +#define TYPE_ASPEED_2700_INTCIOEXP1 TYPE_ASPEED_INTC "ast2700-ioexp1"
> > +#define TYPE_ASPEED_2700_INTCIOEXP2 TYPE_ASPEED_INTC "ast2700-ioexp2"
> >   #define TYPE_ASPEED_2700SSP_INTC TYPE_ASPEED_INTC "-ast2700ssp"
> >   #define TYPE_ASPEED_2700SSP_INTCIO TYPE_ASPEED_INTC "io-ast2700ssp"
> >   #define TYPE_ASPEED_2700TSP_INTC TYPE_ASPEED_INTC "-ast2700tsp"
> > diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> > index de39a3e7eb..678d4eb6d9 100644
> > --- a/hw/arm/aspeed_ast27x0.c
> > +++ b/hw/arm/aspeed_ast27x0.c
> > @@ -91,7 +91,9 @@ static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
> >       [ASPEED_DEV_LTPI_CTRL2] =3D  0x14C35000,
> >       [ASPEED_DEV_WDT]       =3D  0x14C37000,
> >       [ASPEED_DEV_LTPI_IO0]  =3D  0x30000000,
> > +    [ASPEED_DEV_IOEXP0_INTCIO] =3D 0x30C18000,
> >       [ASPEED_DEV_LTPI_IO1]  =3D  0x50000000,
> > +    [ASPEED_DEV_IOEXP1_INTCIO] =3D 0x50C18000,
> >       [ASPEED_DEV_PCIE_MMIO0] =3D 0x60000000,
> >       [ASPEED_DEV_PCIE_MMIO1] =3D 0x80000000,
> >       [ASPEED_DEV_PCIE_MMIO2] =3D 0xA0000000,
> > @@ -511,6 +513,10 @@ static void aspeed_soc_ast2700_init(Object *obj)
> >       object_initialize_child(obj, "intc", &a->intc[0], TYPE_ASPEED_270=
0_INTC);
> >       object_initialize_child(obj, "intcio", &a->intc[1],
> >                               TYPE_ASPEED_2700_INTCIO);
> > +    object_initialize_child(obj, "intcioexp0", &a->intcioexp[0],
> > +                            TYPE_ASPEED_2700_INTCIOEXP1);
> > +    object_initialize_child(obj, "intcioexp1", &a->intcioexp[1],
> > +                            TYPE_ASPEED_2700_INTCIOEXP2);
> >
> >       snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
> >       object_initialize_child(obj, "adc", &s->adc, typename);
> > @@ -755,6 +761,22 @@ static void aspeed_soc_ast2700_realize(DeviceState=
 *dev, Error **errp)
> >       aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(&a->intc[1]), 0,
> >                       sc->memmap[ASPEED_DEV_INTCIO]);
> >
> > +    /* INTCIOEXP0 */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intcioexp[0]), errp)) {
> > +        return;
> > +    }
> > +
> > +    aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(&a->intcioexp[0]), 0,
> > +                    sc->memmap[ASPEED_DEV_IOEXP0_INTCIO]);
> > +
> > +    /* INTCIOEXP1 */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intcioexp[1]), errp)) {
> > +        return;
> > +    }
> > +
> > +    aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(&a->intcioexp[1]), 0,
> > +                    sc->memmap[ASPEED_DEV_IOEXP1_INTCIO]);
> > +
> >       /* irq sources -> orgates -> INTC */
> >       for (i =3D 0; i < ic->num_inpins; i++) {
> >           qdev_connect_gpio_out(DEVICE(&a->intc[0].orgates[i]), 0,
> > @@ -1079,6 +1101,21 @@ static void aspeed_soc_ast2700_realize(DeviceSta=
te *dev, Error **errp)
> >           }
> >           sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioexp[i]), 0,
> >                           sc->memmap[ASPEED_DEV_LTPI_IO0 + i]);
> > +
> > +        icio =3D ASPEED_INTC_GET_CLASS(&a->intcioexp[i]);
> > +        /* INTC_IOEXP internal: orgate[i] -> input[i] */
> > +        for (int j =3D 0; j < icio->num_inpins; j++) {
> > +            irq =3D qdev_get_gpio_in(DEVICE(&a->intcioexp[i]), j);
> > +            qdev_connect_gpio_out(DEVICE(&a->intcioexp[i].orgates[j]),=
 0,
> > +                                  irq);
> > +        }
> > +
> > +        /* INTC_IOEXP output[i] -> INTC0.orgate[0].input[i] */
> > +        for (int j =3D 0; j < icio->num_outpins; j++) {
> > +            irq =3D qdev_get_gpio_in(DEVICE(&a->intc[0].orgates[0]), j=
);
> > +            sysbus_connect_irq(SYS_BUS_DEVICE(&a->intcioexp[i]), j,
> > +                               irq);
> > +        }
> >       }
> >
> >       aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->dpmcu=
),
> > diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> > index 5cd786dee6..a04005ee7c 100644
> > --- a/hw/intc/aspeed_intc.c
> > +++ b/hw/intc/aspeed_intc.c
> > @@ -924,6 +924,64 @@ static const TypeInfo aspeed_2700_intc_info =3D {
> >       .class_init =3D aspeed_2700_intc_class_init,
> >   };
> >
> > +static AspeedINTCIRQ aspeed_2700_intcioexp2_irqs[ASPEED_INTC_MAX_INPIN=
S] =3D {
> > +    {0, 8, 1, R_GICINT192_EN, R_GICINT192_STATUS},
> > +    {1, 9, 1, R_GICINT193_EN, R_GICINT193_STATUS},
> > +};
> > +
> > +static void aspeed_2700_intcioexp2_class_init(ObjectClass *klass,
> > +                                              const void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    AspeedINTCClass *aic =3D ASPEED_INTC_CLASS(klass);
> > +
> > +    dc->desc =3D "ASPEED 2700 IOEXP2 INTC Controller";
> > +    aic->num_lines =3D 32;
> > +    aic->num_inpins =3D 2;
> > +    aic->num_outpins =3D 10;
> > +    aic->mem_size =3D 0x400;
> > +    aic->nr_regs =3D 0x58 >> 2;
> > +    aic->reg_offset =3D 0x100;
> > +    aic->reg_ops =3D &aspeed_intcio_ops;
> > +    aic->irq_table =3D aspeed_2700_intcioexp2_irqs;
> > +    aic->irq_table_count =3D ARRAY_SIZE(aspeed_2700_intcioexp2_irqs);
> > +}
> > +
> > +static const TypeInfo aspeed_2700_intcioexp2_info =3D {
> > +    .name =3D TYPE_ASPEED_2700_INTCIOEXP2,
> > +    .parent =3D TYPE_ASPEED_INTC,
> > +    .class_init =3D aspeed_2700_intcioexp2_class_init,
> > +};
> > +
> > +static AspeedINTCIRQ aspeed_2700_intcioexp1_irqs[ASPEED_INTC_MAX_INPIN=
S] =3D {
> > +    {0, 6, 1, R_GICINT192_EN, R_GICINT192_STATUS},
> > +    {1, 7, 1, R_GICINT193_EN, R_GICINT193_STATUS},
> > +};
> > +
> > +static void aspeed_2700_intcioexp1_class_init(ObjectClass *klass,
> > +                                              const void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    AspeedINTCClass *aic =3D ASPEED_INTC_CLASS(klass);
> > +
> > +    dc->desc =3D "ASPEED 2700 IOEXP1 INTC Controller";
> > +    aic->num_lines =3D 32;
> > +    aic->num_inpins =3D 2;
> > +    aic->num_outpins =3D 10;
> > +    aic->mem_size =3D 0x400;
> > +    aic->nr_regs =3D 0x58 >> 2;
> > +    aic->reg_offset =3D 0x100;
> > +    aic->reg_ops =3D &aspeed_intcio_ops;
> > +    aic->irq_table =3D aspeed_2700_intcioexp1_irqs;
> > +    aic->irq_table_count =3D ARRAY_SIZE(aspeed_2700_intcioexp1_irqs);
> > +}
> > +
> > +static const TypeInfo aspeed_2700_intcioexp1_info =3D {
> > +    .name =3D TYPE_ASPEED_2700_INTCIOEXP1,
> > +    .parent =3D TYPE_ASPEED_INTC,
> > +    .class_init =3D aspeed_2700_intcioexp1_class_init,
> > +};
> > +
> >   static AspeedINTCIRQ aspeed_2700_intcio_irqs[ASPEED_INTC_MAX_INPINS] =
=3D {
> >       {0, 0, 1, R_GICINT192_EN, R_GICINT192_STATUS},
> >       {1, 1, 1, R_GICINT193_EN, R_GICINT193_STATUS},
> > @@ -1099,6 +1157,8 @@ static void aspeed_intc_register_types(void)
> >       type_register_static(&aspeed_intc_info);
> >       type_register_static(&aspeed_2700_intc_info);
> >       type_register_static(&aspeed_2700_intcio_info);
> > +    type_register_static(&aspeed_2700_intcioexp1_info);
> > +    type_register_static(&aspeed_2700_intcioexp2_info);
> >       type_register_static(&aspeed_2700ssp_intc_info);
> >       type_register_static(&aspeed_2700ssp_intcio_info);
> >       type_register_static(&aspeed_2700tsp_intc_info);
>

