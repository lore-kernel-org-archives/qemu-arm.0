Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3251685wrq;
        Sun, 24 Jun 2018 17:54:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcNFNUJV1Zg/S/FtyqFD0chiR5EjtNN3ndaWlMuDs5mVv6mQUuslGp4Xm+TyFJ3SwNp/JJb
X-Received: by 2002:a0c:9547:: with SMTP id m7-v6mr875457qvm.138.1529888065455;
        Sun, 24 Jun 2018 17:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529888065; cv=none;
        d=google.com; s=arc-20160816;
        b=sZ9AImwyoozfpiBWdM5s/nuPx5cJV47Stt5sV2902xNKJIbGBgJ1kqTBASEPScFQuH
         3mDEnTwj/NsN2IE2/OWGZyHGZ6U2F27Kle8nMWKAMoqyrFgMF6Lr6nqxweDQvDjOOp/5
         GflF76flqjyA1bHK7zRgZbhOQ6GGrSPhBbfZM0fcL0OfE8+5gQKKOCWYLIKkA8rfqSUS
         +3dFQrXAUzyAKMKmJiq8C7OMqQIj/YuEHzHzFt+dKIe556se8eSe5os0hMQY0CvFZfZ5
         Kjo04EXMCbWQLvsb1413CB49XHtUB2KE2vpRPGstjH8wNLzSLW3eE1QHhsKiVaXKxuF4
         Qb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:date
         :in-reply-to:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=+Tc+HseoSHdLTPNKiolon0DYdGYcX5iW6CmIEHZshGw=;
        b=TlK+KKCf5haQIbC549rHqULbH9LKDO16pNHvivDI9GW9WBk0E5RKVFKNxhfVESUCZU
         mJMjmciKs7TzWsucebbqNu4l59NN0R54CG2itr5oBtktuFmcYt1AtLDlwqKviX2zYbbV
         r06HAwJdbGjqlEQIB7izGS69RqE+u0HN2UDePkU68fdesqy/VPeq1N7MI4VSkRRVW+pq
         OYddD3yLzaPjv7sco6jaRkK893fvuhFMlJ1ylIhERoa/9P/C/5gQTtlxQiEd/8BS0vMg
         QoFXJ6oTkDLhVUkM0iYpiq6RSWq5zN7CYTqeAyIY8I5/4ALwW8nKZiNui5nXTgXeIlCn
         eyDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=dc3mPDiR;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=dy+BCmqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y47-v6si542633qth.62.2018.06.24.17.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 17:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=dc3mPDiR;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=dy+BCmqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXFlw-0004Kn-Uk
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 20:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFlo-0004KO-B0
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFlk-0002QM-4E
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:54:16 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:32993)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXFlj-0002Q4-UK; Sun, 24 Jun 2018 20:54:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1926221AB0;
	Sun, 24 Jun 2018 20:54:10 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Sun, 24 Jun 2018 20:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=+Tc+HseoSHdLTPNKiolon0DYdGYcX
	5iW6CmIEHZshGw=; b=dc3mPDiRpwznXt/qApOi7snxLDnKXiuteq795UtOBbcoF
	nYCarqc6Hh5XKwjVf6IoUC1EXj7ELMfrpCP62dgAoxt3OKN4nhebyGaSLDdmfv8Y
	wGeINBj8j07biCCrgArMI5bgFYdo3u4KeY2cYI4WLdElf74eeKGjzo+9UldJe93m
	seRDvksfQ5J2HsBFPO44iz0mOKayjIgGh2lGo3hnZQb+MaJBebk51INZEaXI3YQP
	Y34ogy+t+/Nu11Jf2NTHoJnfn/7wR/ehxn6cpyZNiLxrOeic2RbuuFyMBwkJu52T
	lnprMMSveZ7EKkj9ztBjK615b/nzQ7G5z64hWtEDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+Tc+Hs
	eoSHdLTPNKiolon0DYdGYcX5iW6CmIEHZshGw=; b=dy+BCmqod8sWrO02Idcve9
	WxX1GIpbv/orYb9a9yLQ8xHwNGUKvumorxDLlGknDeFjvmZ9Xn5jmtEEMJNwR6fI
	yrVNElM0gLuMOd3Kl3amkqyWdIUjh7ylQeptk6atAt7wqj8TdsqL0XDf4ZqkfZJ1
	72LDJQPzMQSJzgeO8/wyjQiwMq7EuaoVyxx1S2gPrCf7fQqlRaMOUkWqltNkHN7S
	5/HnzeJZKyo912XkHGTOnNPFQMPi8pnsUrWQtNK7k/vm3IeQ3gcMPwIELKQorJaI
	j/HkPBsRpumNZ1qH7XleItXtSKcTVBtCNnv7RJMlokHizVNQl1MwY9ti115+t5gg
	==
X-ME-Proxy: <xmx:MT0wW-lCOK1KCjw6hvq9h8Q3cfkBOMz_ezERSKRe1xfLZxibW8DUfw>
	<xmx:MT0wW5H6iDazimFMW1OcQKYabDwavXzW3CCB03mJOi2Sc0zu5alBGg>
	<xmx:Mj0wWwtirA7xPqHWu1d9M6uE5q1YBT46gF3MHzaBYjdc0veUAIPh-g>
	<xmx:Mj0wW8nbKtTP_qz-MvDUqrrFo3GQjmSkzRj4kIc23CmGj-4ejV03TQ>
	<xmx:Mj0wWww9gL0szuL-M7lulwwkDwrzueEEh-Ba0KdCzCjn5Nzi1BR8Gg>
	<xmx:Mj0wW9pYwyq79bjdjafgevplpCzSmyMIzRdUNv5TsQHilRZTrF4vtQ>
X-ME-Sender: <xms:MT0wW37lBl8FWC02Cp25Zt5zXPw_UcP9yNFVFNAUDaNmCi6w70lO_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id C6561BA43D; Sun, 24 Jun 2018 20:54:09 -0400 (EDT)
Message-Id: <1529888049.2193270.1418936912.0077240B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
In-Reply-To: <20180622075700.5923-2-clg@kaod.org>
Date: Mon, 25 Jun 2018 10:24:09 +0930
References: <20180622075700.5923-1-clg@kaod.org>
	<20180622075700.5923-2-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v2 1/3] aspeed/scu: introduce clock
 frequencies
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +KixZ1o+2/bR

On Fri, 22 Jun 2018, at 17:26, C=C3=A9dric Le Goater wrote:
> All Aspeed SoC clocks are driven by an input source clock which can
> have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
> AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a
> calculation using parameters in the H-PLL Parameter register or from a
> predefined set of frequencies if the setting is strapped by hardware
> (Aspeed AST2400 SoC). The other clocks of the SoC are then defined
> from the H-PLL using dividers.
>=20
> We introduce first the APB clock because it should be used to drive
> the Aspeed timer model.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  include/hw/misc/aspeed_scu.h |  70 ++++++++++++++++++++++++++--
>  hw/misc/aspeed_scu.c         | 106 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 172 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index d70cc0aeca61..f662c38188f4 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -30,6 +30,10 @@ typedef struct AspeedSCUState {
>      uint32_t hw_strap1;
>      uint32_t hw_strap2;
>      uint32_t hw_prot_key;
> +
> +    uint32_t clkin;
> +    uint32_t hpll;
> +    uint32_t apb_freq;
>  } AspeedSCUState;
>=20=20
>  #define AST2400_A0_SILICON_REV   0x02000303U
> @@ -58,7 +62,64 @@ extern bool is_supported_silicon_rev(uint32_t silicon_=
rev);
>   *       1. 2012/12/29 Ryan Chen Create
>   */
>=20=20
> -/* Hardware Strapping Register definition (for Aspeed AST2400 SOC)
> +/* SCU08   Clock Selection Register
> + *
> + *  31     Enable Video Engine clock dynamic slow down
> + *  30:28  Video Engine clock slow down setting
> + *  27     2D Engine GCLK clock source selection
> + *  26     2D Engine GCLK clock throttling enable
> + *  25:23  APB PCLK divider selection
> + *  22:20  LPC Host LHCLK divider selection
> + *  19     LPC Host LHCLK clock generation/output enable control
> + *  18:16  MAC AHB bus clock divider selection
> + *  15     SD/SDIO clock running enable
> + *  14:12  SD/SDIO divider selection
> + *  11     Reserved
> + *  10:8   Video port output clock delay control bit
> + *  7      ARM CPU/AHB clock slow down enable
> + *  6:4    ARM CPU/AHB clock slow down setting
> + *  3:2    ECLK clock source selection
> + *  1      CPU/AHB clock slow down idle timer
> + *  0      CPU/AHB clock dynamic slow down enable (defined in bit[6:4])
> + */
> +#define SCU_CLK_GET_PCLK_DIV(x)                    (((x) >> 23) & 0x7)
> +
> +/* SCU24   H-PLL Parameter Register (for Aspeed AST2400 SOC)
> + *
> + *  18     H-PLL parameter selection
> + *           0: Select H-PLL by strapping resistors
> + *           1: Select H-PLL by the programmed registers (SCU24[17:0])
> + *  17     Enable H-PLL bypass mode
> + *  16     Turn off H-PLL
> + *  10:5   H-PLL Numerator
> + *  4      H-PLL Output Divider
> + *  3:0    H-PLL Denumerator
> + *
> + *  (Output frequency) =3D 24MHz * (2-OD) * [(Numerator+2) / (Denumerator
> +1)]
> + */
> +
> +#define SCU_AST2400_H_PLL_PROGRAMMED               (0x1 << 18)
> +#define SCU_AST2400_H_PLL_BYPASS_EN                (0x1 << 17)
> +#define SCU_AST2400_H_PLL_OFF                      (0x1 << 16)
> +
> +/* SCU24   H-PLL Parameter Register (for Aspeed AST2500 SOC)
> + *
> + *  21     Enable H-PLL reset
> + *  20     Enable H-PLL bypass mode
> + *  19     Turn off H-PLL
> + *  18:13  H-PLL Post Divider
> + *  12:5   H-PLL Numerator (M)
> + *  4:0    H-PLL Denumerator (N)
> + *
> + *  (Output frequency) =3D CLKIN(24MHz) * [(M+1) / (N+1)] / (P+1)
> + *
> + * The default frequency is 792Mhz when CLKIN =3D 24MHz
> + */
> +
> +#define SCU_H_PLL_BYPASS_EN                        (0x1 << 20)
> +#define SCU_H_PLL_OFF                              (0x1 << 19)
> +
> +/* SCU70  Hardware Strapping Register definition (for Aspeed AST2400=20
> SOC)
>   *
>   * 31:29  Software defined strapping registers
>   * 28:27  DRAM size setting (for VGA driver use)
> @@ -107,12 +168,13 @@ extern bool is_supported_silicon_rev(uint32_t=20
> silicon_rev);
>  #define SCU_AST2400_HW_STRAP_GET_CLK_SOURCE(x)     (((((x) >> 23) &=20
> 0x1) << 1) \
>                                                      | (((x) >> 18) &=20
> 0x1))
>  #define SCU_AST2400_HW_STRAP_CLK_SOURCE_MASK       ((0x1 << 23) | (0x1=20
> << 18))
> -#define     AST2400_CLK_25M_IN                         (0x1 << 23)
> +#define SCU_HW_STRAP_CLK_25M_IN                    (0x1 << 23)
>  #define     AST2400_CLK_24M_IN                         0
>  #define     AST2400_CLK_48M_IN                         1
>  #define     AST2400_CLK_25M_IN_24M_USB_CKI             2
>  #define     AST2400_CLK_25M_IN_48M_USB_CKI             3
>=20=20
> +#define SCU_HW_STRAP_CLK_48M_IN                    (0x1 << 18)
>  #define SCU_HW_STRAP_2ND_BOOT_WDT                  (0x1 << 17)
>  #define SCU_HW_STRAP_SUPER_IO_CONFIG               (0x1 << 16)
>  #define SCU_HW_STRAP_VGA_CLASS_CODE                (0x1 << 15)
> @@ -160,8 +222,8 @@ extern bool is_supported_silicon_rev(uint32_t silicon=
_rev);
>  #define     AST2400_DIS_BOOT                           3
>=20=20
>  /*
> - * Hardware strapping register definition (for Aspeed AST2500 SoC and
> - * higher)
> + * SCU70  Hardware strapping register definition (for Aspeed AST2500
> + *        SoC and higher)
>   *
>   * 31     Enable SPI Flash Strap Auto Fetch Mode
>   * 30     Enable GPIO Strap Mode
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 59315010db9a..59333b50abdd 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -168,6 +168,27 @@ static uint32_t aspeed_scu_get_random(void)
>      return num;
>  }
>=20=20
> +static void aspeed_scu_set_apb_freq(AspeedSCUState *s)
> +{
> +    uint32_t apb_divider;
> +
> +    switch (s->silicon_rev) {
> +    case AST2400_A0_SILICON_REV:
> +    case AST2400_A1_SILICON_REV:
> +        apb_divider =3D 2;
> +        break;
> +    case AST2500_A0_SILICON_REV:
> +    case AST2500_A1_SILICON_REV:
> +        apb_divider =3D 4;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    s->apb_freq =3D s->hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) +=
=20
> 1)
> +        / apb_divider;
> +}
> +
>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned=20
> size)
>  {
>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
> @@ -222,6 +243,10 @@ static void aspeed_scu_write(void *opaque, hwaddr=20
> offset, uint64_t data,
>      case PROT_KEY:
>          s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
>          return;
> +    case CLK_SEL:
> +        s->regs[reg] =3D data;
> +        aspeed_scu_set_apb_freq(s);
> +        break;
>=20=20
>      case FREQ_CNTR_EVAL:
>      case VGA_SCRATCH1 ... VGA_SCRATCH8:
> @@ -247,19 +272,93 @@ static const MemoryRegionOps aspeed_scu_ops =3D {
>      .valid.unaligned =3D false,
>  };
>=20=20
> +static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
> +{
> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
> +        return 25000000;
> +    } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
> +        return 48000000;
> +    } else {
> +        return 24000000;
> +    }
> +}
> +
> +/*
> + * Strapped frequencies for the AST2400 in MHz. They depend on the
> + * clkin frequency.
> + */
> +static const uint32_t hpll_ast2400_freqs[][4] =3D {
> +    { 384, 360, 336, 408 }, /* 24MHz or 48MHz */
> +    { 400, 375, 350, 425 }, /* 25MHz */
> +};
> +
> +static uint32_t aspeed_scu_calc_hpll_ast2400(AspeedSCUState *s)
> +{
> +    uint32_t hpll_reg =3D s->regs[HPLL_PARAM];
> +    uint8_t freq_select;
> +    bool clk_25m_in;
> +
> +    if (hpll_reg & SCU_AST2400_H_PLL_OFF) {
> +        return 0;
> +    }
> +
> +    if (hpll_reg & SCU_AST2400_H_PLL_PROGRAMMED) {
> +        uint32_t multiplier =3D 1;
> +
> +        if (!(hpll_reg & SCU_AST2400_H_PLL_BYPASS_EN)) {
> +            uint32_t n  =3D (hpll_reg >> 5) & 0x3f;
> +            uint32_t od =3D (hpll_reg >> 4) & 0x1;
> +            uint32_t d  =3D hpll_reg & 0xf;
> +
> +            multiplier =3D (2 - od) * ((n + 2) / (d + 1));
> +        }
> +
> +        return s->clkin * multiplier;
> +    }
> +
> +    /* HW strapping */
> +    clk_25m_in =3D !!(s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN);
> +    freq_select =3D SCU_AST2400_HW_STRAP_GET_H_PLL_CLK(s->hw_strap1);
> +
> +    return hpll_ast2400_freqs[clk_25m_in][freq_select] * 1000000;
> +}
> +
> +static uint32_t aspeed_scu_calc_hpll_ast2500(AspeedSCUState *s)
> +{
> +    uint32_t hpll_reg   =3D s->regs[HPLL_PARAM];
> +    uint32_t multiplier =3D 1;
> +
> +    if (hpll_reg & SCU_H_PLL_OFF) {
> +        return 0;
> +    }
> +
> +    if (!(hpll_reg & SCU_H_PLL_BYPASS_EN)) {
> +        uint32_t p =3D (hpll_reg >> 13) & 0x3f;
> +        uint32_t m =3D (hpll_reg >> 5) & 0xff;
> +        uint32_t n =3D hpll_reg & 0x1f;
> +
> +        multiplier =3D ((m + 1) / (n + 1)) / (p + 1);
> +    }
> +
> +    return s->clkin * multiplier;
> +}
> +
>  static void aspeed_scu_reset(DeviceState *dev)
>  {
>      AspeedSCUState *s =3D ASPEED_SCU(dev);
>      const uint32_t *reset;
> +    uint32_t (*calc_hpll)(AspeedSCUState *s);
>=20=20
>      switch (s->silicon_rev) {
>      case AST2400_A0_SILICON_REV:
>      case AST2400_A1_SILICON_REV:
>          reset =3D ast2400_a0_resets;
> +        calc_hpll =3D aspeed_scu_calc_hpll_ast2400;
>          break;
>      case AST2500_A0_SILICON_REV:
>      case AST2500_A1_SILICON_REV:
>          reset =3D ast2500_a1_resets;
> +        calc_hpll =3D aspeed_scu_calc_hpll_ast2500;
>          break;
>      default:
>          g_assert_not_reached();
> @@ -270,6 +369,13 @@ static void aspeed_scu_reset(DeviceState *dev)
>      s->regs[HW_STRAP1] =3D s->hw_strap1;
>      s->regs[HW_STRAP2] =3D s->hw_strap2;
>      s->regs[PROT_KEY] =3D s->hw_prot_key;
> +
> +    /*
> +     * All registers are set. Now compute the frequencies of the main cl=
ocks
> +     */
> +    s->clkin =3D aspeed_scu_get_clkin(s);
> +    s->hpll =3D calc_hpll(s);
> +    aspeed_scu_set_apb_freq(s);
>  }
>=20=20
>  static uint32_t aspeed_silicon_revs[] =3D {
> --=20
> 2.13.6
>=20
