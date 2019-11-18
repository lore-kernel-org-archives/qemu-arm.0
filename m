Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2501748lfq;
        Sun, 17 Nov 2019 23:19:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSdOYDDO2cKtOEgQFwO4FueALSLanVWHzicRlii9fRvegDJ8S4Q2vPVWvJHCxRSsfn0top
X-Received: by 2002:a17:906:4bd7:: with SMTP id x23mr24283897ejv.245.1574061553979;
        Sun, 17 Nov 2019 23:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574061553; cv=none;
        d=google.com; s=arc-20160816;
        b=GRetayNBdktCuA870qurFlRM2cu/MuB54emlxtIwMui9nEwzBBzvPjlglUAOOOctyX
         eBTR4WcC9pCs5bGOfLxuQbcKl3YiNPwCklptag50wJYWIt8zAcHfuh7bwJJeF3uFxlt5
         fIPFpX3XGlSnVkStb0LnoZojEQdyLXb5ZLPmgK85f8b7cypZa1S4zxWpLTNQURyAT6Ru
         esisb9YR7iSSZXq2i5RwMLLkCrKPkltdssGCbkp7DIDlwUDzXJF+sxOEGnUWXC0bdp44
         txwYMmjUNORZf93M0Uj1f3xv0qeW7lfSd3Y1x6DpJ3mvlWQzVPcV+hiNzIh9R1tu7BAX
         0APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NZ2GeUeHNt/52CpBf+crfk0LyOpqaH9a1cPQxNNY6tk=;
        b=sSP6xnQ+M8BfCD9/z4wchG9m0w1+39ReUkyPHzqSpUukliP1vSZuv5k4EcsYovy28q
         dClcqsyYUVCBrlHrTDWvOSSmb62jP9mxO1JoRVTlnxbW1HHPe3mjcatTDGJcttnA2DDV
         /ouKGeuf9aMYoBs2oncl1DPSRJed/sacvqlNyrGF1HJUdB98dtSZkRrgDGzOMj5gp2Fe
         HhOB52Jxw5P10fpHlo8qPunCA5gr45JCz/Pqfx0F5S/vB/S11oA65Mi4tbe2vYHe1CSD
         8bhPT6qvY3oYhbsQgwfoHsh56qMMDBH5+7S2/g49meYVbTpqc1HWTZibniDyPUkuX0wC
         sLuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NF6gjWWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si466559eda.164.2019.11.17.23.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 23:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NF6gjWWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWbJY-0002JT-T1
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 02:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iWbJF-0002HY-1P
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iWbJD-0001Qb-RT
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:18:52 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:38924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iWbJD-0001QP-N8; Mon, 18 Nov 2019 02:18:51 -0500
Received: by mail-qv1-xf42.google.com with SMTP id v16so6108653qvq.6;
 Sun, 17 Nov 2019 23:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NZ2GeUeHNt/52CpBf+crfk0LyOpqaH9a1cPQxNNY6tk=;
 b=NF6gjWWQvgMn+C4d2iDjXym0cR5sHK3OU5vf84Gg/nDojYABUGyF/Vwahj+AzOwFPa
 82amJ4neKybzPMZGp/ArRJr839tlwQXRM1PLUs1PKmH7c0NKRxnRz40DMeFizE4vmAeu
 n95PI0FoLH5Rm93QjO+vULqhPN1QjuhAu0VZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NZ2GeUeHNt/52CpBf+crfk0LyOpqaH9a1cPQxNNY6tk=;
 b=ROwxnAZJc/Z1ScVg4wU7t3k+4DwCBicfg7lr/0Ovtn1itnIogClt2iCjeKjXRLi7mP
 AlNjIS2WRmOMMWLxkRSBIf3AwGW628e5M14gDyBvApPbZocqOCnPVP7qmxiAhIFE5x1k
 gdsAHjTmbB9M2X+bm03A59dCgxs16SgNBZnUirbnSq24rWoEqZqt1SKrvRjS1L54WVyJ
 V9v8DV239YdtEShqAiSBQMKgeQQXWqkZY7DxseJNCgrZN2n9QP/95804hOaNkKa6+gKP
 eBItrGBpahtY0lL34ABvDw90v0CfmjQNmymZPF92ycofU67lcE1UIU5Uifoz8UYxkHRd
 WeeA==
X-Gm-Message-State: APjAAAWoNE3BiSUIV3X+AnwMoqIHUztgZTUKB4yMZPkERepBuVoxlBNA
 3GM4CUraJAHr0MBbzG3KuG++gOM37lXGCf01NUc=
X-Received: by 2002:a05:6214:2c2:: with SMTP id
 g2mr23864514qvu.210.1574061531054; 
 Sun, 17 Nov 2019 23:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20191114094544.30114-1-clg@kaod.org>
 <20191114094544.30114-6-clg@kaod.org>
In-Reply-To: <20191114094544.30114-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Nov 2019 07:18:39 +0000
Message-ID: <CACPK8Xf7d7HOiVK=A9SZS32iZyJt5hC-JD4q9DrqvoT4yK88dg@mail.gmail.com>
Subject: Re: [PATCH 5/5] aspeed: Add support for the tacoma-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ui1z75XBffZH

On Thu, 14 Nov 2019 at 09:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Tacoma BMC board is replacement board for the BMC of the OpenPOWER
> Witherspoon system. It uses a AST2600 SoC instead of a AST2500 and is
> used for HW bringup.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e34e6787430b..729f2e79cd79 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -92,6 +92,10 @@ struct AspeedBoardState {
>  #define AST2600_EVB_HW_STRAP1 0x000000C0
>  #define AST2600_EVB_HW_STRAP2 0x00000003
>
> +/* Tacoma hardware value */
> +#define TACOMA_BMC_HW_STRAP1  0x00000000
> +#define TACOMA_BMC_HW_STRAP2  0x00000000
> +
>  /*
>   * The max ram region is for firmwares that scan the address space
>   * with load/store to guess how much RAM the SoC has.
> @@ -167,6 +171,34 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
>      }
>  }
>
> +static void tacoma_bmc_i2c_init(AspeedBoardState *bmc)

This should be identical to witherspoon. Do you want to use the same callba=
ck?

Either way,

Reviewed-by: Joel Stanley <joel@jms.id.au>


> +{
> +    AspeedSoCState *soc =3D &bmc->soc;
> +    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
> +
> +    /* Bus 3: TODO bmp280@77 */
> +    /* Bus 3: TODO max31785@52 */
> +    /* Bus 3: TODO dps310@76 */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
> +
> +    /* The tacoma expects a TMP275 but a TMP105 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TMP1=
05,
> +                     0x4a);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
> +                     0x60);
> +    /* The tacoma expects Epson RX8900 RTC but a ds1338 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
,
> +                     0x32);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
> +                          eeprom_buf);
> +    /* Bus 11: TODO ucd90160@64 */
> +}
> +
>  static void aspeed_machine_init(MachineState *machine)
>  {
>      AspeedBoardState *bmc;
> @@ -485,6 +517,22 @@ static void aspeed_machine_ast2600_evb_class_init(Ob=
jectClass *oc, void *data)
>      mc->default_ram_size =3D 1 * GiB;
>  };
>
> +static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data=
)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       =3D "Aspeed AST2600 EVB (Cortex A7)";
> +    amc->soc_name  =3D "ast2600-a0";
> +    amc->hw_strap1 =3D TACOMA_BMC_HW_STRAP1;
> +    amc->hw_strap2 =3D TACOMA_BMC_HW_STRAP2;
> +    amc->fmc_model =3D "mx66l1g45g";
> +    amc->spi_model =3D "mx66l1g45g";
> +    amc->num_cs    =3D 2;
> +    amc->i2c_init  =3D tacoma_bmc_i2c_init;
> +    mc->default_ram_size =3D 1 * GiB;
> +};
> +
>  static const TypeInfo aspeed_machine_types[] =3D {
>      {
>          .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -510,6 +558,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("ast2600-evb"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
>          .class_init    =3D aspeed_machine_ast2600_evb_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
> +        .parent        =3D TYPE_ASPEED_MACHINE,
> +        .class_init    =3D aspeed_machine_tacoma_class_init,
>      }, {
>          .name          =3D TYPE_ASPEED_MACHINE,
>          .parent        =3D TYPE_MACHINE,
> --
> 2.21.0
>
