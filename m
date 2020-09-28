Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3633474lfq;
        Mon, 28 Sep 2020 06:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyDKAqDZ0ddtiCgiF3hSuVPjdNHJ4+JSIS1zp7BnBTz3H6cXbqqF7I70MJb0qYF7MZU0gM
X-Received: by 2002:a25:d815:: with SMTP id p21mr1976345ybg.473.1601299264604;
        Mon, 28 Sep 2020 06:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601299264; cv=none;
        d=google.com; s=arc-20160816;
        b=FalBZ/2unJ07peHy/jQ5aUCF2cA3EGLhOA9OxuPnAW+28MG02THu0gvN3U39BX7QQm
         GaGZy4rCi20tpioCOBdxC/9FhDL7I3OJWpn36gE1DWQ+IPt9GzXrUo7xEUWZr9s9usE4
         b5RPj/ueFCjSdftqVqpamzjhDeHMVacZAj6abbDCfGFs3qs6MFSkzAQCgzMAULBmdhzf
         4azeTqlYnbixFONU0VO7jQajeW5i2GaWSIMrzmnc8dm9c/mUCs/KR0vpp58koXn/Fpps
         LWCOl7N+GRi2Fz8mJBLNqOGi72qAQesPhRTCizLjLQxZ/XMvbYtpsYPvsWxCPUP7+14g
         TUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3qLrdCzFYgtP9BgQ7Rm5nWG5qkmajwgHh/VsOeGeiWE=;
        b=Xkn+iiTDLueOsq85UjpJEEuFKis8/Yuf0ICW7p8WFBqdsTMVRxwydI7MM1/jLd9No6
         uOqDbcjviKhQ107pYDG4gCl6A0MZWAtpt+L8OTYnODFKfddUHhOwkS++lhue7tL3R89e
         fCZrJIQV7CM+MUXQa2ifvJ6MGCllnQW4/0Q5jXiJ6J+gvmBN6RFKz7usLfhrwg84dP57
         rKOsVuanVECNFaZRHWYGQhFGw53j3ROnjq/NZew831nG+XzbyK7cUE9lP/daoxsd5Tn5
         eTRzRxLf+jpaXyLLiRI7BoqF4V/OHRiHJOFhAD2OX4D9oNNy6sBtUoKRKSQBzLuagCJL
         yVGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=DQEOWlxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35si734649ybi.281.2020.09.28.06.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 06:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=DQEOWlxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMt5T-0001ZL-Tx
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 09:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kMpJ7-0006Kx-Ba
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:18:54 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kMpJ3-0002lD-E6
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:18:50 -0400
Received: by mail-oi1-x244.google.com with SMTP id v20so588899oiv.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3qLrdCzFYgtP9BgQ7Rm5nWG5qkmajwgHh/VsOeGeiWE=;
 b=DQEOWlxK0yXLynLjaBRoOQkecEd+1secO6ximlmfXSPYd4HuR7Wkgj01H8WbXDbr00
 Fs1c5E12SPAVWmIENksQGcB3RZjXcX76YslO8/MlSpr+VjdP8rtQ7ifTWh9ybeCNDO3W
 wBJR7rOXr4xOyMq9aTIeFAsDN62V+EVxd+shklXA0gSMZU3/MEKbrAYZC2TlqzeNLEPn
 3rAoa4KRrkGiNRIK44hoX4o7wz0HiLp6c9kSv+oj2GfX0zQ17QLE8QE032r239ZPbZKT
 qYw6zRr+itI26svsKt9fLHL/Zfsclk9dFZP2oAhMGm7i58hTQ2RaHdvdmycp92xbn1Pq
 PmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3qLrdCzFYgtP9BgQ7Rm5nWG5qkmajwgHh/VsOeGeiWE=;
 b=Te2HtPqkJ17sLQsqKV69j+OmS053zQ88Ty/XzgXl/4NsEyYXZFzqWj3pcqoQbAOb7K
 tqqun4WpDm/ugmgMRnvD0F355Jyp5gvVms8jWIFTLRAAyn3DylVpABMhSIU4l919dQki
 XA3MHSpOZ9ztRtDCKihs7JzLnd0or1jLZ2svM//SD5NwPrag+ZwrgcnzNMPBWuRQzFeH
 ElOoCWkathaDMnpbX6l/WqKAit7EUipoE61aMxJSQ7eusmqh1k7+8Q7byGeuOiO5vOCw
 uMoJM6z2RFHTlVwo72Vr720/7Xqu5BD5sJmNG6QWCYGSIVipq/rloRs9OaUXL2Oh2lur
 GGOg==
X-Gm-Message-State: AOAM533wGSDkCPEEWOKbv4Gy2c5dgkVy1FVOeosqhvcbCby6H+HPKL69
 zl1qtBQSbeQD17K5GZQ0YypHmihpRGA4yT//UmA3zg==
X-Received: by 2002:aca:bd8a:: with SMTP id n132mr323861oif.100.1601284727634; 
 Mon, 28 Sep 2020 02:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200928061201.1601-1-wangzhiqiang.bj@bytedance.com>
 <d6cf7464-a0bf-2748-7e4c-732208881711@kaod.org>
In-Reply-To: <d6cf7464-a0bf-2748-7e4c-732208881711@kaod.org>
From: =?UTF-8?B?546L5b+X5by6?= <wangzhiqiang.bj@bytedance.com>
Date: Mon, 28 Sep 2020 17:18:37 +0800
Message-ID: <CAH0XSJtDEPnf8qLNuT_Ev3TkGQw_68cZ5KGgY_aLBThMQwU9sQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] aspeed: Add support for the g220a-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2020 09:12:06 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 yulei.sh@bytedance.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 xuxiaohan@bytedance.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: enByxfdWM3GX

C=C3=A9dric Le Goater,

Sorry, I did not reply to all, this email is the same as the previous one.


On Mon, Sep 28, 2020 at 3:55 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/28/20 8:12 AM, John Wang wrote:
> > G220A is a 2 socket x86 motherboard supported by OpenBMC.
> > Strapping configuration was obtained from hardware.
> >
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>> ---
> >  hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index bdb981d2f8..1de61f7d4f 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -120,6 +120,20 @@ struct AspeedMachineState {
> >          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                            =
  \
> >          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
> >
> > +#define G220A_BMC_HW_STRAP1 (                                      \
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
> > +        SCU_HW_STRAP_2ND_BOOT_WDT |                                   =
  \
> > +        SCU_HW_STRAP_VGA_CLASS_CODE |                                 =
  \
> > +        SCU_HW_STRAP_LPC_RESET_PIN |                                  =
  \
> > +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |              =
  \
> > +        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |   =
  \
> > +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                     =
  \
> > +        SCU_AST2500_HW_STRAP_RESERVED1)
> > +
> >  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition)=
 */
> >  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> >
> > @@ -798,6 +812,23 @@ static void aspeed_machine_tacoma_class_init(Objec=
tClass *oc, void *data)
> >          aspeed_soc_num_cpus(amc->soc_name);
> >  };
> >
> > +static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *dat=
a)
> > +{
> > +    MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> > +
> > +    mc->desc       =3D "Bytedance G220A BMC (ARM1176)";
> > +    amc->soc_name  =3D "ast2500-a1";
> > +    amc->hw_strap1 =3D G220A_BMC_HW_STRAP1;
> > +    amc->fmc_model =3D "n25q512a";
> > +    amc->spi_model =3D "mx25l25635e";
> > +    amc->num_cs    =3D 2;
>
> 'macs_mask' is missing. You won't get network.

Will Fix


>
> > +    amc->i2c_init  =3D NULL;
>
> Isn't it possible to add some default I2C devices ? temperature sensors ?

hmm, G220A BMC uses emc1413 as the temperature sensor. I can not find
it in qemu.
I can't find an i2c chip that qemu has and that the g220a uses. :(

>
> Thanks,
>
> C.
>
> > +    mc->default_ram_size =3D 1024 * MiB;
> > +    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> > +        aspeed_soc_num_cpus(amc->soc_name);
> > +};
> > +
> >  static const TypeInfo aspeed_machine_types[] =3D {
> >      {
> >          .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
> > @@ -835,6 +866,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
> >          .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
> >          .parent        =3D TYPE_ASPEED_MACHINE,
> >          .class_init    =3D aspeed_machine_tacoma_class_init,
> > +    }, {
> > +        .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
> > +        .parent        =3D TYPE_ASPEED_MACHINE,
> > +        .class_init    =3D aspeed_machine_g220a_class_init,
> >      }, {
> >          .name          =3D TYPE_ASPEED_MACHINE,
> >          .parent        =3D TYPE_MACHINE,
> >
>
