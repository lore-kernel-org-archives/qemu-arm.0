Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3763921lfc;
        Thu, 14 Oct 2021 00:37:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1wvqHQU9p5OoyHSCSF+0BPDV+fH9kMe6jEW/P8mSxzdUd2rYlTeLrI+Zo/kqnkh5vYsL3
X-Received: by 2002:a25:4646:: with SMTP id t67mr4546900yba.321.1634197049386;
        Thu, 14 Oct 2021 00:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634197049; cv=none;
        d=google.com; s=arc-20160816;
        b=uUa8vVKMsxMrkKPiB6yO8XQEM28jMY5iIdTDEZC7N9iajrmq0GU1vwZ7IDinSImOux
         5C9syVByAzFjjl8gPGnaAoy8m88ksDOIvKReIG8ax1h+/EadfpK36PtAPRxQ18a6die7
         y8Yhu5VGSvyDUgQOfwB1gxJKXxJX2tgmucw5qtPzeyixbHy8xbmwQmiDgo/cHKtR/oP8
         0ebwOc02q88p9Lbg/7kxzI6GiY/vNKqkrSSNq6VUvNlNUrvFZTVzS07K/eq1T74QnLGh
         J3YIDc0hscU56C5Jjy0jVQHvaZzP5oTIkpeajHHklOx3m90QLiGGWltykefCtbQ3yqJ5
         YEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xIDRpzMMokNBZ8kazCj4UniRV23Bp7SWvxZHOpNFRsI=;
        b=X/wGcqIIU3Nh8P0hAexj98KyI4pgxE1Oxle+v0suesI8P6gXegpEdj69LgSdr520cS
         sUqGY/rEIBR8MJeEWizFm0Bh/wOBYc8HiegyTmN6m7naBSBcBbmA3LHwQgyV0gnzObNS
         2chE4NmuL+nypiHlF9Gl3j3mPG4UNKt0rJqiV8bAR7xbCa4wnHxtFkyfyYZ04q+MSazl
         uvolGxsDZZfEpf9BTYKN2OKENBHzuPFdAYAdA5LuIDFLRQQBYns6PT49+7crvOKI6qDg
         axAZTZal9NP847FRajovXz1MYtZZ6oYDfXyek7S6Q1B9XFz1ZLOSP+l/TCPzX+W5m404
         Zp0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=bLOIUY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si2015423ybb.328.2021.10.14.00.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 00:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=bLOIUY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mavIu-0002Fi-MT
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 03:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1mavIT-0002AZ-DV; Thu, 14 Oct 2021 03:37:01 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1mavIR-0002or-2j; Thu, 14 Oct 2021 03:37:01 -0400
Received: by mail-ua1-x941.google.com with SMTP id h4so9561287uaw.1;
 Thu, 14 Oct 2021 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xIDRpzMMokNBZ8kazCj4UniRV23Bp7SWvxZHOpNFRsI=;
 b=bLOIUY7AV4rcN4WUYFc//dZNCvyuwKwfNZ/B8+KaLoGG8KcQN9k3XoKUI9eb9LGUOx
 RxAo5jhGACyQPunH3IEdqF2GicMXVv5wXTiuCXfivUnNjNfTtK7tawgaU/84gXC8rHsv
 pDLCerKTV7fs0hBtmCjfbKRfwNsmew89Qh33+kMR8vEgbKc5QMtPiEy7O4DdkbJEKwFV
 gRn8eXk1r2qELItUDA1//DlC0GL5u3C6Nbwdx26W9frJJZWJGcQG1tnIyJpo+o62ZmCi
 rrw63RUuwVeBFUVjLkmMzG+OWJ/iJQRqfHDZIHJ+7Zkb8qRbXs5zSqT3yWWLlMfjz2W8
 WjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xIDRpzMMokNBZ8kazCj4UniRV23Bp7SWvxZHOpNFRsI=;
 b=MPe0ZQPtAR4o1zlOBj/URhVr13F0YcZ+4R92yNd7Q/zHtCtn5PvJvVex/EMN/+TeVd
 HAqAJMXkVBRPOlszTP1LIsFC3A42EigafK5croYzy9f0BT0/AUGr6SnjboYpIxzCDfkg
 c8WbpAFHHI+8Tgthk8+wblbjTBFu4iiB+MUsv+ZJhnLuP1IjlVFA756Izl8/7gQ/bQau
 4gWNjQD9+fdJ2XD6czyIPm6I/E0WCS8ljYhOqrn7sPNDK/SRdLERH4PL4W0ZifTXB74Z
 fRpPCToUuGUFFQ3cKDwYeV9/0J7u0h6lHua6PvDzPnt0YRZeszCiy1C2PzOz4Ui+Gm9U
 78mw==
X-Gm-Message-State: AOAM5311X3+FDxp3CEbpw1AoCMkpzCsYgnM8ROQSOcx6B83YkyEpDNVN
 oUZIaWfsas0I6cCZODgC4amEw8C5Y8uE3BT6VqE=
X-Received: by 2002:a05:6102:38c6:: with SMTP id
 k6mr4943415vst.59.1634197017047; 
 Thu, 14 Oct 2021 00:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211014064548.934799-1-wangzhiqiang02@inspur.com>
 <f636c41c-30dd-85ba-1654-dafb0f65d0d3@kaod.org>
In-Reply-To: <f636c41c-30dd-85ba-1654-dafb0f65d0d3@kaod.org>
From: John Wang <wangzq.jn@gmail.com>
Date: Thu, 14 Oct 2021 15:36:44 +0800
Message-ID: <CAHwNHZVifJnSSs2b0npg52bBd38Mxqfe7A+uYCihiUq+E_7GLw@mail.gmail.com>
Subject: Re: [PATCH v2] aspeed: Add support for the fp5280g2-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=wangzq.jn@gmail.com; helo=mail-ua1-x941.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, lintao.lc@inspur.com,
 duanzhijia01@inspur.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, liuxiwei@inspur.com,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAd8mrE+uG5k

C=C3=A9dric Le Goater <clg@kaod.org> =E4=BA=8E2021=E5=B9=B410=E6=9C=8814=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=883:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/14/21 08:45, John Wang wrote:
> > The fp5280g2-bmc is supported by OpenBMC, It's
> > based on the following device tree
> >
> > https://github.com/openbmc/linux/blob/dev-5.10/arch/arm/boot/dts/aspeed=
-bmc-inspur-fp5280g2.dts
> >
> > Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
>
> Is a flash image available so that we can give this new machine a try ?

I've tested. here is the image:
https://drive.google.com/file/d/1lAQ7nG2sq0FfAVydjSlF1zHmnKlgFCVq/view?usp=
=3Dsharing

it can be built on openbmc/openbmc with
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47824

>
> LGTM.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> > ---
> >   hw/arm/aspeed.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 74 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 01c1747972..21b690334e 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -141,6 +141,21 @@ struct AspeedMachineState {
> >           SCU_AST2500_HW_STRAP_ACPI_ENABLE |                           =
   \
> >           SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
> >
> > +/* FP5280G2 hardware value: 0XF100D286 */
> > +#define FP5280G2_BMC_HW_STRAP1 (                                      =
\
> > +        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                   =
  \
> > +        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                      =
  \
> > +        SCU_AST2500_HW_STRAP_UART_DEBUG |                             =
  \
> > +        SCU_AST2500_HW_STRAP_RESERVED28 |                             =
  \
> > +        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                            =
  \
> > +        SCU_HW_STRAP_VGA_CLASS_CODE |                                 =
  \
> > +        SCU_HW_STRAP_LPC_RESET_PIN |                                  =
  \
> > +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |              =
  \
> > +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |   =
  \
> > +        SCU_HW_STRAP_MAC1_RGMII |                                     =
  \
> > +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                     =
  \
> > +        SCU_AST2500_HW_STRAP_RESERVED1)
> > +
> >   /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition=
) */
> >   #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> >
> > @@ -456,6 +471,15 @@ static void aspeed_machine_init(MachineState *mach=
ine)
> >       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo)=
;
> >   }
> >
> > +static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsiz=
e)
> > +{
> > +    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> > +    DeviceState *dev =3D DEVICE(i2c_dev);
> > +
> > +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> > +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> > +}
> > +
> >   static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc =3D &bmc->soc;
> > @@ -717,6 +741,34 @@ static void g220a_bmc_i2c_init(AspeedMachineState =
*bmc)
> >                             eeprom_buf);
> >   }
> >
> > +static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
> > +{
> > +    AspeedSoCState *soc =3D &bmc->soc;
> > +    I2CSlave *i2c_mux;
> > +
> > +    /* The at24c256 */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
> > +
> > +    /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP=
105,
> > +                     0x48);
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP=
105,
> > +                     0x49);
> > +
> > +    i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, =
2),
> > +                     "pca9546", 0x70);
> > +    /* It expects a TMP112 but a TMP105 is compatible */
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), TYPE_TMP1=
05,
> > +                     0x4a);
> > +
> > +    /* It expects a ds3232 but a ds1338 is good enough */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "ds1338"=
, 0x68);
> > +
> > +    /* It expects a pca9555 but a pca9552 is compatible */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_PCA=
9552,
> > +                     0x20);
> > +}
> > +
> >   static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> >   {
> >       AspeedSoCState *soc =3D &bmc->soc;
> > @@ -1082,6 +1134,24 @@ static void aspeed_machine_g220a_class_init(Obje=
ctClass *oc, void *data)
> >           aspeed_soc_num_cpus(amc->soc_name);
> >   };
> >
> > +static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *=
data)
> > +{
> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc       =3D "Inspur FP5280G2 BMC (ARM1176)";
> > +    amc->soc_name  =3D "ast2500-a1";
> > +    amc->hw_strap1 =3D FP5280G2_BMC_HW_STRAP1;
> > +    amc->fmc_model =3D "n25q512a";
> > +    amc->spi_model =3D "mx25l25635e";
> > +    amc->num_cs    =3D 2;
> > +    amc->macs_mask  =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> > +    amc->i2c_init  =3D fp5280g2_bmc_i2c_init;
> > +    mc->default_ram_size =3D 512 * MiB;
> > +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > +        aspeed_soc_num_cpus(amc->soc_name);
> > +};
> > +
> >   static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *=
data)
> >   {
> >       MachineClass *mc =3D MACHINE_CLASS(oc);
> > @@ -1146,6 +1216,10 @@ static const TypeInfo aspeed_machine_types[] =3D=
 {
> >           .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
> >           .class_init    =3D aspeed_machine_g220a_class_init,
> > +    }, {
> > +        .name          =3D MACHINE_TYPE_NAME("fp5280g2-bmc"),
> > +        .parent        =3D TYPE_ASPEED_MACHINE,
> > +        .class_init    =3D aspeed_machine_fp5280g2_class_init,
> >       }, {
> >           .name          =3D MACHINE_TYPE_NAME("quanta-q71l-bmc"),
> >           .parent        =3D TYPE_ASPEED_MACHINE,
> >
>
