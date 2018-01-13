Received: by 10.28.173.206 with SMTP id w197csp32983wme;
        Fri, 12 Jan 2018 16:01:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBouaYHVn/fA9ldzxOC0JCBSN36HHO2bfG7HiOGmovfN2BpiGg4PX4YwSyq9fv+A9S5/TOi3I
X-Received: by 10.37.47.215 with SMTP id v206mr10331645ybv.462.1515801669992;
        Fri, 12 Jan 2018 16:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515801669; cv=none;
        d=google.com; s=arc-20160816;
        b=lal6ULCIJHIV7iQ7+9VjZTeLf8ogPTmMGAupRiI4WbtK/AmgulwnEFdeA7VHSNTOmw
         t/WjYrRMU5C9LPNa/yoof+6Pi7EgpWWORgS2nF7y4XYHGZKT935/OSwBWF8L14ID4FSq
         2zhXbYHtbt5CGuPpNmJzufICFgcdqjvXZcP9Y4DtvyKxJoswZg1DzC4YJhGlLrur2R4G
         512lrfhl8N7z51yoG0BiN/EgeZNvQNbodKCiZzXnkDFxEImKpYuKCeD2P7l5iZfhDbPH
         eezYI300h92JZJR6VelhrTKEpBqy8bx+oGzItyMlvXdKdGm6UclpsQYltYidB6c4F1fi
         74Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=9a1SvhEG0Xtd31WxOMiG8VKnGw+MubFsSHOKBz6efcM=;
        b=dmGEbjWnkmglCSHa86MZcGhoGpNctQU5GkbOL4UiKwpM6NDn39Vuu26goNaO9I8yYa
         cO6gyBZtybi8TO4eLGqucEglFb9Wxi+JmfOLFUqD0x+6MayAu5qX59hAYZ+ZBfiXvSXp
         mOEH/z7O9WhL2356C6fnzFzSY1Wo6F1I8rGJ4Ew+wAfbvgXYJTMYovYEiSx5Wt6s+0S8
         mRS7lDIuvbB/CGmvWADGEdtGaH+8gN9BtgQkjpf0grWHOAMKo+dojXz4GZQVpwSndTbD
         ggMO3NRgJ9dmFcI9gF7qQcDoZftsfbY1UtW4qcpiIraRrFUEsRE3km3c1IA7PXhd3ChF
         ul0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rAbjj1HD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b127si2158358ywf.644.2018.01.12.16.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 16:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rAbjj1HD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea9G1-0008Cs-Fp
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 19:01:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9Fr-0008AZ-1S
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 19:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9Fp-0001Im-Fy
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 19:00:59 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:44717)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ea9Fl-0001G0-Pm; Fri, 12 Jan 2018 19:00:54 -0500
Received: by mail-wr0-x241.google.com with SMTP id w50so6652987wrc.11;
	Fri, 12 Jan 2018 16:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=9a1SvhEG0Xtd31WxOMiG8VKnGw+MubFsSHOKBz6efcM=;
	b=rAbjj1HDvT0vF+Wezk+C1EcK9VPtV1NtnkFTPdA0kLMElj7bN5vt4o2rncvaUhhawv
	nwjsKKROOcxJUzxOxYhTYMPD83Q4Iq0zeYuTWIADTXifqrOWY/A/gTh8H/4pPeKfhzRv
	bUp2NC2BJgdTg8WyG7SpZiHMwuPUYUvB8Cumgi6izKMtMJbxmYe15Cgugcn8EfwlDtlH
	L/MJIIfrxSHaBBEh2zqEIwhtgiM3e3rp0Famf9MABR0ZFj/klDoKV/B3FFYcxw5nrHQ6
	LHbZSj7r6R2Zk16HBwWO4WCk9gY02rqa4JkTGcINm8p8IQx5Y+UBVkeVwUdrWN4hbQ/N
	35bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=9a1SvhEG0Xtd31WxOMiG8VKnGw+MubFsSHOKBz6efcM=;
	b=I8AdaZAyXu4Q0jGH7FAQIffp5Xu/haiNViHvIM08HnF8descDZ/9b6cydP/1ckgPOC
	Zeld+RjJRTJNGEkmi2z66WSWhUQx3CviHC847+R2KObqcbv7kUD3VXmHrjeU0FM3ggaJ
	foHj+7uiqKSD1mxveKTOs+E+x8K/H1NkA6l+ZANlE9TaWywYL8Dg4dwGcn1csFjzKZn+
	zE4HadIccOw7d5RNidKs4keJNeqG5j8x4G9mlUjdKX/5h3senXSgEyQhRA2rRGkyI5QL
	BcB4uQXzxpNkLl4JLWnG8fTLWh7XRQanODrEK5iM5MDAO7RQ9ANIWa2quhhsOAhLF8rX
	Wy/g==
X-Gm-Message-State: AKGB3mIfbBKsSp2B8mylHSf33RVrdl+x7Bz1w/RayMw7t+3G5inzc3Jx
	DlM2Wh8sPvVJJczI46iwWxUA280uNc9O8P47nww=
X-Received: by 10.223.197.69 with SMTP id s5mr26234313wrf.96.1515801652531;
	Fri, 12 Jan 2018 16:00:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 16:00:21 -0800 (PST)
In-Reply-To: <20180111205626.23291-3-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 16:00:21 -0800
X-Google-Sender-Auth: UOEoIb8Z9qeDHMoU8OG4PgYqpoQ
Message-ID: <CAKmqyKM7Jk6tVhYET8Uv_BowOV+FB7oDKJcpHwhMjVfH4p6Muw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 02/21] sdhci: add basic Spec
 v1 capabilities
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H9rkIwgrm6w9

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> (Note than Spec v2 is supported by default)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci-internal.h | 24 +++++++++++++++++++-
>  include/hw/sd/sdhci.h  |  6 +++++
>  hw/sd/sdhci.c          | 61 +++++++++++++++++++++++++++++++++++++-------=
------
>  3 files changed, 74 insertions(+), 17 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index b7751c815f..9acafe7b01 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -24,6 +24,8 @@
>  #ifndef SDHCI_INTERNAL_H
>  #define SDHCI_INTERNAL_H
>
> +#include "hw/registerfields.h"
> +
>  /* R/W SDMA System Address register 0x0 */
>  #define SDHC_SYSAD                     0x00
>
> @@ -84,6 +86,9 @@
>
>  /* R/W Host control Register 0x0 */
>  #define SDHC_HOSTCTL                   0x28
> +FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
> +FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
> +FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>  #define SDHC_CTRL_SDMA                 0x00
>  #define SDHC_CTRL_ADMA1_32             0x08
> @@ -94,6 +99,7 @@
>  /* R/W Power Control Register 0x0 */
>  #define SDHC_PWRCON                    0x29
>  #define SDHC_POWER_ON                  (1 << 0)
> +FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
>
>  /* R/W Block Gap Control Register 0x0 */
>  #define SDHC_BLKGAP                    0x2A
> @@ -116,6 +122,7 @@
>
>  /* R/W Timeout Control Register 0x0 */
>  #define SDHC_TIMEOUTCON                0x2E
> +FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
>
>  /* R/W Software Reset Register 0x0 */
>  #define SDHC_SWRST                     0x2F
> @@ -172,17 +179,32 @@
>
>  /* ROC Auto CMD12 error status register 0x0 */
>  #define SDHC_ACMD12ERRSTS              0x3C
> +FIELD(SDHC_ACMD12ERRSTS, TIMEOUT_ERR,  1, 1);
> +FIELD(SDHC_ACMD12ERRSTS, CRC_ERR,      2, 1);
> +FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
>
>  /* HWInit Capabilities Register 0x05E80080 */
>  #define SDHC_CAPAB                     0x40
> -#define SDHC_CAN_DO_DMA                0x00400000
>  #define SDHC_CAN_DO_ADMA2              0x00080000
>  #define SDHC_CAN_DO_ADMA1              0x00100000
>  #define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
>  #define SDHC_CAPAB_BLOCKSIZE(x)        (((x) >> 16) & 0x3)
> +FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
> +FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
> +FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
> +FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
> +FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
> +FIELD(SDHC_CAPAB, SDMA,               22, 1);
> +FIELD(SDHC_CAPAB, SUSPRESUME,         23, 1);
> +FIELD(SDHC_CAPAB, V33,                24, 1);
> +FIELD(SDHC_CAPAB, V30,                25, 1);
> +FIELD(SDHC_CAPAB, V18,                26, 1);
>
>  /* HWInit Maximum Current Capabilities Register 0x0 */
>  #define SDHC_MAXCURR                   0x48
> +FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
> +FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
> +FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
>
>  /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
>  #define SDHC_FEAER                     0x50
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 8786676ac8..09b756eb7a 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -92,6 +92,12 @@ typedef struct SDHCIState {
>      /* Configurable properties */
>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
>      uint8_t spec_version;
> +    struct {
> +        bool suspend;
> +        bool high_speed;
> +        bool sdma;
> +        bool v33, v30, v18;
> +    } cap;
>  } SDHCIState;
>
>  #define TYPE_PCI_SDHCI "sdhci-pci"
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index c8f750451e..d26ea821d0 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -44,12 +44,6 @@
>   * 0 - not supported, 1 - supported, other - prohibited.
>   */
>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Suppor=
t */
> -#define SDHC_CAPAB_18V            1ul        /* Voltage support 1.8v */
> -#define SDHC_CAPAB_30V            0ul        /* Voltage support 3.0v */
> -#define SDHC_CAPAB_33V            1ul        /* Voltage support 3.3v */
> -#define SDHC_CAPAB_SUSPRESUME     0ul        /* Suspend/resume support *=
/
> -#define SDHC_CAPAB_SDMA           1ul        /* SDMA support */
> -#define SDHC_CAPAB_HIGHSPEED      1ul        /* High speed support */
>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
>  /* Maximum host controller R/W buffers size
> @@ -63,9 +57,7 @@
>  #define SDHC_CAPAB_TOCLKFREQ      52ul
>
>  /* Now check all parameters and calculate CAPABILITIES REGISTER value */
> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_18V > 1 || SDHC_CAPAB_30V > 1 =
||     \
> -    SDHC_CAPAB_33V > 1 || SDHC_CAPAB_SUSPRESUME > 1 || SDHC_CAPAB_SDMA >=
 1 ||  \
> -    SDHC_CAPAB_HIGHSPEED > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1=
 > 1 ||\
> +#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 =
> 1 || \
>      SDHC_CAPAB_TOUNIT > 1
>  #error Capabilities features can have value 0 or 1 only!
>  #endif
> @@ -90,16 +82,36 @@
>  #endif
>
>  #define SDHC_CAPAB_REG_DEFAULT                                 \
> -   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_18V << 26) |     \
> -    (SDHC_CAPAB_30V << 25) | (SDHC_CAPAB_33V << 24) |          \
> -    (SDHC_CAPAB_SUSPRESUME << 23) | (SDHC_CAPAB_SDMA << 22) |  \
> -    (SDHC_CAPAB_HIGHSPEED << 21) | (SDHC_CAPAB_ADMA1 << 20) |  \
> +   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
>      (SDHC_CAPAB_ADMA2 << 19) | (MAX_BLOCK_LENGTH << 16) |      \
>      (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
>      (SDHC_CAPAB_TOCLKFREQ))
>
>  #define MASKED_WRITE(reg, mask, val)  (reg =3D (reg & (mask)) | (val))
>
> +static void sdhci_init_capareg(SDHCIState *s, Error **errp)
> +{
> +    uint64_t capareg =3D 0;
> +
> +    switch (s->spec_version) {
> +    case 2: /* default version */
> +
> +    /* fallback */
> +    case 1:
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.hi=
gh_speed);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.s=
uspend);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V33, s->cap.v33);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V30, s->cap.v30);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, V18, s->cap.v18);
> +        break;
> +
> +    default:
> +        error_setg(errp, "Unsupported spec version: %u", s->spec_version=
);

Probably best to have a return here, encase some logic added below
later relies on this being successful.


> +    }
> +    s->capareg =3D capareg;
> +}
> +
>  static uint8_t sdhci_slotint(SDHCIState *s)
>  {
>      return (s->norintsts & s->norintsigen) || (s->errintsts & s->errints=
igen) ||
> @@ -1026,7 +1038,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>      case SDHC_TRNMOD:
>          /* DMA can be enabled only if it is supported as indicated by
>           * capabilities register */
> -        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
> +        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
>              value &=3D ~SDHC_TRNS_DMA;
>          }
>          MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
> @@ -1181,6 +1193,10 @@ static void sdhci_init_readonly_registers(SDHCISta=
te *s, Error **errp)
>          return;
>      }
>      s->version =3D (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
> +
> +    if (s->capareg =3D=3D UINT64_MAX) {
> +        sdhci_init_capareg(s, errp);
> +    }
>  }
>
>  static void sdhci_initfn(SDHCIState *s)
> @@ -1297,8 +1313,21 @@ const VMStateDescription sdhci_vmstate =3D {
>   * specific host controller implementation */
>  static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
> -    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
> -            SDHC_CAPAB_REG_DEFAULT),
> +
> +    /* DMA */
> +    DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
> +    /* Suspend/resume support */
> +    DEFINE_PROP_BOOL("suspend", SDHCIState, cap.suspend, false),
> +    /* High speed support */
> +    DEFINE_PROP_BOOL("high-speed", SDHCIState, cap.high_speed, true),
> +    /* Voltage support 3.3/3.0/1.8V */
> +    DEFINE_PROP_BOOL("3v3", SDHCIState, cap.v33, true),
> +    DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
> +    DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),

This is a change of the default value.

I think you really need to specify specific changes in the commit
message. That way is the defaults cause breakages we will be able to
bisect it in the future.

Alistair

> +
> +    /* capareg: deprecated */
> +    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
> +
>      DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
>                       false),
> --
> 2.15.1
>
>
