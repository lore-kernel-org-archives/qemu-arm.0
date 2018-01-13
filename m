Received: by 10.28.173.206 with SMTP id w197csp59646wme;
        Fri, 12 Jan 2018 16:35:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBovi4ok57evnO7rAKxyL4ceCg3Fj/uIsdvZKxwgt70hpFNkc9uIwQYT0dteePT90qVnkOiEb
X-Received: by 10.129.124.215 with SMTP id x206mr14673957ywc.292.1515803748463;
        Fri, 12 Jan 2018 16:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515803748; cv=none;
        d=google.com; s=arc-20160816;
        b=IiqC7zYr+eWbCbWW+SG+DNqzlh4kL+3iogmA6mcIAmQbvPFGvjACTBq22E0l0uxKco
         QuzYC6wnrZJtgvz5mEd6ZUuY9FAsLvPnlWn1DIsZHhokyIwgjPZRNswMwTJQX7EoeNKA
         Y/iL35SKw4GNZP098oX9/kQzeQV5hWxqpqct+FqSv2jx90IMofOVqYqp4tR67M4V3RPx
         Zh5K+Cc48wEcHiUlDjYWFdoMwBeFcf9ORmG35Z6IliT28sFz7j721VABtBd2btXp8AuU
         qAar4ChePFCX9AB/lEIUmm/xSpByHz1IIoxX4mAoxP+ffEYlR9PdGj4tI/1pRu/nLzJK
         08Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+e/9ZUy6dkR6k599qh/mVXENEqbubCNBdtnbLqBSLts=;
        b=GhtjkB5R/eXxYfZpPw7XqwrT7NWq5UX0k0+BaH0j1RwuItiCRPc6N/MzWfzJKjlhhD
         HWlLbEHjgKpCl2Q1Vov+6dV3JNnwj05W831Duk0QSR4/EuYMaWSUcbcuX2Tz5+8pXxrG
         iyD/syY8HYfm+4G3hY8f4T2z5/dYCKkmrqfLxA8Na6VnmBZlo5pIXSfyijPHgkmbdl5Z
         ciX2DgLb1oZ3zeoIN0RodbYB5phvJ19jfsC0na62OCWK523G3Ywvd3SjKdvtepHK22PA
         dxFSqhKeq3ddVkBs1mvaqQmAjwL+AiptFchXB2vQCDmkVKhVODdz/iWxNeO87kk7MwTP
         VlMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=No10H3Ii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i132si2030157ywe.557.2018.01.12.16.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 16:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=No10H3Ii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea9nX-0001eX-Sx
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 19:35:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9nK-0001cn-Mu
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 19:35:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9nJ-0006zt-47
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 19:35:34 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ea9nF-0006xe-KX; Fri, 12 Jan 2018 19:35:29 -0500
Received: by mail-wm0-x243.google.com with SMTP id 81so4489708wmb.1;
	Fri, 12 Jan 2018 16:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=+e/9ZUy6dkR6k599qh/mVXENEqbubCNBdtnbLqBSLts=;
	b=No10H3Iih8dHrgS1vS8J3q3UrZX0DulNKofTUmowbhVbQoAIAwJ998+kiMpwhB7rQ3
	qNsTSCdQleUrVFsRcp2z5qqZxkxagq+XLtrt8/Hiod4ejaW5Y3tvlNSfLz47xE3TtsPo
	yDsMbvntYpeEEeuci8uNyKFPwYUhjFSaAlOrITnakFpCDPeXTCneGmyPTlgYb4qVSJhX
	iqyxYpCKmKE7RNE8t2lFzS1GZH65NNm2ZiG9JqtXiFd5X+vCxAZfHfwo6o4BV+EwAJLY
	93UOij5BEYLiDppO2cDdDcYKa1VkFNqrqRTBoOWmNIricb2SG+PvlM/Ohz0ixWHKQjHI
	ybWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=+e/9ZUy6dkR6k599qh/mVXENEqbubCNBdtnbLqBSLts=;
	b=fugTm0/E9WBdzGNXjaYRqV+ULvOR/9lx2Rm6u65l6w7fuUVFK5wkDeTtwApgkuVKYj
	y5mCvpsV/lecp6kO6dMSB8GEHUTwVvxnoos9KAO3bZzxARvOAPZD07nfgAFQwe27gFUQ
	PDbMwu+Y4bqmq0VSb9aqCR3lgGEglbwkUMIYJrXxg7skKD81HK10uLf6fzDim5TL568X
	3zkU8AqS8m4xevMd1yV5K8mmeQLg5U6buIflML0aQ6z35LV+e7djTHV1EZPeGzhns3eB
	ZzS0JldHKu4osQSNd1bHaDadgvxHj10nOyoNUFh+sQ7z8Gxc/XXEfWEL8FRORq9bQ+fC
	5pTQ==
X-Gm-Message-State: AKwxytcl/y/tNCmeq/8OFL9dsGN3WWboLO5jNtiLKV4qFSN7bffT/mXm
	6jqK4P3QkQd0rkhRlja6S9KEteOER4c/5q10Mdw=
X-Received: by 10.28.105.214 with SMTP id z83mr5615400wmh.77.1515803728138;
	Fri, 12 Jan 2018 16:35:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 16:34:57 -0800 (PST)
In-Reply-To: <20180111205626.23291-6-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-6-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 16:34:57 -0800
X-Google-Sender-Auth: 8rxAN9msoDxAJ3HeoA28J36vhks
Message-ID: <CAKmqyKNrkCQohXX+z8JR8vq0O7-89hbXJTbuyebE3+rkuJytkw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/21] sdhci: add DMA and
 64-bit capabilities (Spec v2)
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
X-TUID: MIfp7wk7hmaL

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> new properties are introduced, with default value to Spec v2:
> - adma1 (disabled, deprecated in v2)
> - adma2 (enabled)
> - 64bit (disabled)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci-internal.h | 14 +++++++-------
>  include/hw/sd/sdhci.h  |  4 ++++
>  hw/sd/sdhci.c          | 36 ++++++++++++++----------------------
>  3 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index c5e26bf8f3..4ed9727ec3 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -89,12 +89,12 @@
>  FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
>  FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
>  FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
> -#define SDHC_CTRL_DMA_CHECK_MASK       0x18
> +FIELD(SDHC_HOSTCTL, DMA,               3, 2);
>  #define SDHC_CTRL_SDMA                 0x00
> -#define SDHC_CTRL_ADMA1_32             0x08
> +#define SDHC_CTRL_ADMA1_32             0x08 /* NOT ALLOWED since v2 */
>  #define SDHC_CTRL_ADMA2_32             0x10
> -#define SDHC_CTRL_ADMA2_64             0x18
> -#define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
> +#define SDHC_CTRL_ADMA2_64             0x18 /* only v1 & v2 (v3 optional=
) */
> +#define SDHC_DMA_TYPE(x)               ((x) & R_SDHC_HOSTCTL_DMA_MASK)
>
>  /* R/W Power Control Register 0x0 */
>  #define SDHC_PWRCON                    0x29
> @@ -185,19 +185,19 @@ FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
>
>  /* HWInit Capabilities Register 0x05E80080 */
>  #define SDHC_CAPAB                     0x40
> -#define SDHC_CAN_DO_ADMA2              0x00080000
> -#define SDHC_CAN_DO_ADMA1              0x00100000
> -#define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
>  FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
>  FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
>  FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
>  FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
> +FIELD(SDHC_CAPAB, ADMA2,              19, 1); /* since v2 */
> +FIELD(SDHC_CAPAB, ADMA1,              20, 1); /* v1 only? */
>  FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
>  FIELD(SDHC_CAPAB, SDMA,               22, 1);
>  FIELD(SDHC_CAPAB, SUSPRESUME,         23, 1);
>  FIELD(SDHC_CAPAB, V33,                24, 1);
>  FIELD(SDHC_CAPAB, V30,                25, 1);
>  FIELD(SDHC_CAPAB, V18,                26, 1);
> +FIELD(SDHC_CAPAB, BUS64BIT,           28, 1); /* since v2 */
>
>  /* HWInit Maximum Current Capabilities Register 0x0 */
>  #define SDHC_MAXCURR                   0x48
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index b5b4e411ff..26b50583af 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -93,6 +93,7 @@ typedef struct SDHCIState {
>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
>      uint8_t spec_version;
>      struct {
> +        /* v1 */
>          uint8_t timeout_clk_freq, base_clk_freq_mhz;
>          bool timeout_clk_in_mhz;
>          uint16_t max_blk_len;
> @@ -100,6 +101,9 @@ typedef struct SDHCIState {
>          bool high_speed;
>          bool sdma;
>          bool v33, v30, v18;
> +        /* v2 */
> +        bool adma1, adma2;
> +        bool bus64;
>      } cap;
>  } SDHCIState;
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 4c1fcf2c32..e2c7ec021d 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -38,24 +38,6 @@
>  #define TYPE_SDHCI_BUS "sdhci-bus"
>  #define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
>
> -/* Default SD/MMC host controller features information, which will be
> - * presented in CAPABILITIES register of generic SD host controller at r=
eset.
> - * If not stated otherwise:
> - * 0 - not supported, 1 - supported, other - prohibited.
> - */
> -#define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Suppor=
t */
> -#define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
> -#define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
> -
> -/* Now check all parameters and calculate CAPABILITIES REGISTER value */
> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 =
> 1
> -#error Capabilities features can have value 0 or 1 only!
> -#endif
> -
> -#define SDHC_CAPAB_REG_DEFAULT                                 \
> -   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
> -    (SDHC_CAPAB_ADMA2 << 19))
> -
>  #define MASKED_WRITE(reg, mask, val)  (reg =3D (reg & (mask)) | (val))
>
>  static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc=
,
> @@ -72,6 +54,8 @@ static void sdhci_check_capab_freq_range(SDHCIState *s,=
 const char *desc,
>      }
>  }
>
> +/* Default SD/MMC host controller features information, which will be
> + * presented in CAPABILITIES register of generic SD host controller at r=
eset. */

*/ should be on a new line.

Once that is fixed:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>  {
>      uint64_t capareg =3D 0;
> @@ -79,6 +63,10 @@ static void sdhci_init_capareg(SDHCIState *s, Error **=
errp)
>
>      switch (s->spec_version) {
>      case 2: /* default version */
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, ADMA1, s->cap.adma1)=
;
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, ADMA2, s->cap.adma2)=
;
> +        /* 64-bit System Bus Support */
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, BUS64BIT, s->cap.bus=
64);
>
>      /* fallback */
>      case 1:
> @@ -792,7 +780,7 @@ static void sdhci_data_transfer(void *opaque)
>
>              break;
>          case SDHC_CTRL_ADMA1_32:
> -            if (!(s->capareg & SDHC_CAN_DO_ADMA1)) {
> +            if (!(s->capareg & R_SDHC_CAPAB_ADMA1_MASK)) {
>                  trace_sdhci_error("ADMA1 not supported");
>                  break;
>              }
> @@ -800,7 +788,7 @@ static void sdhci_data_transfer(void *opaque)
>              sdhci_do_adma(s);
>              break;
>          case SDHC_CTRL_ADMA2_32:
> -            if (!(s->capareg & SDHC_CAN_DO_ADMA2)) {
> +            if (!(s->capareg & R_SDHC_CAPAB_ADMA2_MASK)) {
>                  trace_sdhci_error("ADMA2 not supported");
>                  break;
>              }
> @@ -808,8 +796,8 @@ static void sdhci_data_transfer(void *opaque)
>              sdhci_do_adma(s);
>              break;
>          case SDHC_CTRL_ADMA2_64:
> -            if (!(s->capareg & SDHC_CAN_DO_ADMA2) ||
> -                    !(s->capareg & SDHC_64_BIT_BUS_SUPPORT)) {
> +            if (!(s->capareg & R_SDHC_CAPAB_ADMA2_MASK) ||
> +                    !(s->capareg & R_SDHC_CAPAB_BUS64BIT_MASK)) {
>                  trace_sdhci_error("64 bit ADMA not supported");
>                  break;
>              }
> @@ -1317,6 +1305,8 @@ static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, =
512),
>      /* DMA */
>      DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
> +    DEFINE_PROP_BOOL("adma1", SDHCIState, cap.adma1, false),
> +    DEFINE_PROP_BOOL("adma2", SDHCIState, cap.adma2, true),
>      /* Suspend/resume support */
>      DEFINE_PROP_BOOL("suspend", SDHCIState, cap.suspend, false),
>      /* High speed support */
> @@ -1326,6 +1316,8 @@ static Property sdhci_properties[] =3D {
>      DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
>      DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
>
> +    DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
> +
>      /* capareg: deprecated */
>      DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
>
> --
> 2.15.1
>
>
