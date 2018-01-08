Received: by 10.28.173.206 with SMTP id w197csp2970927wme;
        Mon, 8 Jan 2018 14:01:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBouuN3TVgzsNTWeP3jUlKptmdk7qyma6QLjg+PpFHFBB66O5pIlMFxFVWdgCJkkKOqYziX/e
X-Received: by 10.129.87.137 with SMTP id l131mr12329689ywb.401.1515448888949;
        Mon, 08 Jan 2018 14:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515448888; cv=none;
        d=google.com; s=arc-20160816;
        b=HmgTcm8zMbya275kt3zSb3Oy/tnb4DCxKFapuDpLklAc0iZd5ywsLha4UqcpuX+UOK
         yINyXtpqplWSH+zoUAMkDa5bwT7e/SYnJO9/eNvwt8nee303yhtNwNexvSZTRAAvtxK2
         MROK+dv/+xTLlDScGbKI+2E2GuuFGuiZh58r6dcPqiKVv76wZgLqlnBTqX/uZQVmQda6
         aNN2PKVV7xm3mhu6odxu/2TsJWYY8J/S8Uk37YGPxzijqt66fyx7dQduwgST3HQKPgnc
         kpY2theIRFmLaJPyzNGukzK5lK/gF1rQF5yTRPiKOE6V+QkJH9VEdX7l/LT5d3OpHIyZ
         uKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+1vqt3Ub5j8vD6wtMDoJuKN4FhuLNmgmSURPDkZms1A=;
        b=xHBx5eoAEjlR/krShTpn+lUiFSxtuZT6kG5GCqMPP6FDtTYOkpeJGVJSlwcsIvVVfH
         D7j97OysQTQVoEvrLOtHSCKgp05XXRUu0Ozpx17aItKc783U9aNFO+i6j3GLJaqDLIYl
         3y52zi1ZNrT21tstmjla6b0abQcNfd5FAI4iSqgH49kAdpHLeqcQmcEmNR62Eow/7+a6
         qw0yn0A3bAAkLk1pXMdELOxaCGFm9+kLOafaKGDLB7JZ+evQAxz/t9O/PB1TW8Z3+8Yg
         tqJb+qXTbZulpicsz5wgbjIhybbvcMaGkkDDGX9E4ewvfkhkFAGCVlY2lljAAU2K4KXC
         hDXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DxQERb5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si2685429ywm.429.2018.01.08.14.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 14:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DxQERb5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfU0-00010e-E5
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 17:01:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfTk-0000xW-9W
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:01:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfTi-0002ri-Se
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:01:12 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:45936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfTf-0002oZ-Gl; Mon, 08 Jan 2018 17:01:07 -0500
Received: by mail-wm0-x243.google.com with SMTP id i186so578951wmi.4;
	Mon, 08 Jan 2018 14:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=+1vqt3Ub5j8vD6wtMDoJuKN4FhuLNmgmSURPDkZms1A=;
	b=DxQERb5xEEeI7ruqvmVJ8H6x+enzngvgrRppObWtin4o2u/FssHG6inORLaipBJT/K
	1av2JglI2r+ECPQ9IyIWiixIhO4BZozD5Br4rWzXrZtgMWxZDQwa/4ossZ5TlCITZfa2
	9342qyKB0eW1SFnR7paKtSI8EbNDSExnzPXPPPSarWCrLrKnWqNWK0j01CC1XETic8eG
	BRZxplj5gqUVLTX7AmR6A48TMGQi2eUgelu6XsJxmVMZgoJqh/EltLpYDIyq48IckMue
	2t8caFF63YSBKBUZFX75bzXz29FhLLaKWcFxU9xrMvXyixXSzavrOM4zcTdPFOFQ5DUM
	23aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=+1vqt3Ub5j8vD6wtMDoJuKN4FhuLNmgmSURPDkZms1A=;
	b=gaG7cYJUfH9HLyPa/hgcs+yaac+8huj0/auPL0/PTY1+ozx2l+g1RGSO0TWjhtMhxw
	Mg+XZiHg6pEeu12O3J+hr6u9bXK9aEmxwZ9f9pi0wJ1zRkNVNXINqX63107cR4i7G2zL
	qGcCGaD2hLxFkpuIgrfvhBy/WCbpOOzuMr54WKqZj2eHDNaKCjWYgjUta13PVX4Ppv9O
	PbwIa0eFNUjN7swTt6T1Wpm0xtKkGTw9I50QRIKA0tEkJ2sBcIc5AIVkOW+qMsM95HR6
	SAAXRCALldZk/jGVGKI1OIJXawdW5JgDsTN7Ecd9lVjCVwQSI2sdbnk+VmhGj+m1Ix9N
	Etew==
X-Gm-Message-State: AKGB3mLVk0jWzI+hg46OD1RUMhQPCeosHM+Z2o91WO+WJHr12ErGYjT7
	bC+esGyeVN/YLePk2zWffSSJR5u/tBOSmKB+WN0=
X-Received: by 10.28.17.76 with SMTP id 73mr10769488wmr.104.1515448866127;
	Mon, 08 Jan 2018 14:01:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 14:00:35 -0800 (PST)
In-Reply-To: <20180108154303.6522-3-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 14:00:35 -0800
X-Google-Sender-Auth: A5j1_LBR7GRiIsQrCWxjeGaIJG4
Message-ID: <CAKmqyKOH3dsA=8xd6sK6foexSdjmZEijjuJP3uiPRxErKmEJ3Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 02/31] sdhci: add basic Spec
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
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rFdsb9nPDxfo

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci-internal.h | 22 ++++++++++++++++++-
>  include/hw/sd/sdhci.h  |  6 ++++++
>  hw/sd/sdhci.c          | 58 ++++++++++++++++++++++++++++++++++++--------=
------
>  3 files changed, 69 insertions(+), 17 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index cf4a055159..6944fcaf00 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -86,6 +86,9 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>
>  /* R/W Host control Register 0x0 */
>  #define SDHC_HOSTCTL                   0x28
> +FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
> +FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
> +FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
>  #define SDHC_CTRL_DMA_CHECK_MASK       0x18
>  #define SDHC_CTRL_SDMA                 0x00
>  #define SDHC_CTRL_ADMA1_32             0x08
> @@ -96,6 +99,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>  /* R/W Power Control Register 0x0 */
>  #define SDHC_PWRCON                    0x29
>  #define SDHC_POWER_ON                  (1 << 0)
> +FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
>
>  /* R/W Block Gap Control Register 0x0 */
>  #define SDHC_BLKGAP                    0x2A
> @@ -118,6 +122,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
>
>  /* R/W Timeout Control Register 0x0 */
>  #define SDHC_TIMEOUTCON                0x2E
> +FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
>
>  /* R/W Software Reset Register 0x0 */
>  #define SDHC_SWRST                     0x2F
> @@ -174,17 +179,32 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
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
> index ddd5040410..266030dc8d 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -102,6 +102,12 @@ typedef struct SDHCIState {
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
> index cd4a8efdd7..e7dbab2fdc 100644
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
> @@ -90,16 +82,33 @@
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

Don't we need to support v2 here as well? We default to v2 don't we?

Alistair

> +    default:
> +        error_setg(errp, "Unsupported spec version: %u", s->spec_version=
);
> +    }
> +    s->capareg =3D capareg;
> +}
> +
>  static uint8_t sdhci_slotint(SDHCIState *s)
>  {
>      return (s->norintsts & s->norintsigen) || (s->errintsts & s->errints=
igen) ||
> @@ -1032,7 +1041,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>      case SDHC_TRNMOD:
>          /* DMA can be enabled only if it is supported as indicated by
>           * capabilities register */
> -        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
> +        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
>              value &=3D ~SDHC_TRNS_DMA;
>          }
>          MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
> @@ -1186,6 +1195,10 @@ static void sdhci_init_readonly_registers(SDHCISta=
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
> @@ -1305,8 +1318,21 @@ const VMStateDescription sdhci_vmstate =3D {
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
