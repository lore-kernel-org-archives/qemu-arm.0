Received: by 10.28.173.206 with SMTP id w197csp2988826wme;
        Mon, 8 Jan 2018 14:21:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBose5Es7Vab7n/yfB7Yc4kVSD/qAW+CtSJJtuiT3LfFdsdksnspY3lilfB0PeF2OlMHpW8fJ
X-Received: by 10.129.109.18 with SMTP id i18mr12465470ywc.380.1515450104933;
        Mon, 08 Jan 2018 14:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515450104; cv=none;
        d=google.com; s=arc-20160816;
        b=xRqd3yB8q1sFP6s/YsHLfdY6YsTojQ/88bVPI32xWYBcOxtzdNbBmpyUhjAJ0HmzwS
         B3nr611Wxaj6srAQagkvqyA5mXLlXQOYNO2ELQuwIbTi5H0N93JEi7Hb1gj1uXqHT+DH
         k6YdrWM7C6rQ/8HsatEIh7msYyUyxAPMdyeCr0HLKYQHP4zmZop+RJtX1Yj4tq7ORcti
         GQ7Plwv+qx963YjTm7KCxddUe8UF5Fbi/F4kWEx41DNOK9niI7vEYGbX0fvxiL10SQyu
         YTxmlK9bSLJSEb+OuK9l7XGPQThvgD9xT0CumhgIOvAKxHP1SKixBobFub5FOe3kGlqK
         atQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=4TwBg68BWiudvvIYbSVuQnrjl0s5XoAQxT9HNok0/NY=;
        b=GBueGCwhdAuDT6djEd4DyJ8eB1AVUHwssBuFVpax4C/1MAjIZrOR0PbubbmdUmbidV
         MgFtjnphsB5Cl2mktJCT2kGwzFS7M/Q2iJ9HhgjoM1YkEwPrrUfKBYaIhyLJY2UbVyuM
         t7wdr6gFSXnyaDShQQ0Jnw9GigZsjXoXNSDRQP+KsWZR6SYTN3J/etYq+ohfWQzB8BJi
         4DrNv+53D3UMu6Vwm7HgJZzYKJYaiKiBBFxJ4+O6i1YSyVOhyX1TXKZtKqAezD2WgB97
         AUxLX4/KaxnbSAS+BtgrFBTUbyYFivoucMadyjR0I7VHA638uMl8udU3ywDSqhLrYC4C
         OPLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kdkXKgYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i11si371479ybj.769.2018.01.08.14.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 14:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kdkXKgYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfnc-0004oG-Cg
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 17:21:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfnQ-0004m7-LD
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfnO-0007tW-Ei
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:21:32 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:41072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfnK-0007mI-UE; Mon, 08 Jan 2018 17:21:27 -0500
Received: by mail-wm0-x242.google.com with SMTP id g75so17028671wme.0;
	Mon, 08 Jan 2018 14:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=4TwBg68BWiudvvIYbSVuQnrjl0s5XoAQxT9HNok0/NY=;
	b=kdkXKgYKDBrhSyTAQqh4/dP28cH7cT4zxSx1bRlhXdVw7mdm3ZLb2tpvxSpW8GA/NF
	wt1ZLlp1niMM+QPCXAH6HNqMkPeF5vivbRywTgM4F2+NM4Nf7LPn5KPugjx4I3EJcxeC
	BGHhM3OAtVyWubuPsAYjtlwRus4iJ2uvo+ivYameIpRgKGOVdMIN6l7ZORb9ewEn+sED
	iBWGIF3wMWCB1gaznTmCS1VLGAmPQ8MeBR/wW5gVzhio/BxDtjuNBqKKWAHpKSuut84H
	jTmuHdRq1RoltnrISH3Yfpl+Drc3rYETJeQyAzXPF4ifrPwXSORC0RMt7MjkjmhVLLn7
	HOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=4TwBg68BWiudvvIYbSVuQnrjl0s5XoAQxT9HNok0/NY=;
	b=nMGMKdh4xkVi2mPM3F8c88WnsQMjHHcmQNxBcae16YX9v4GvkL/5rzFTAVn28+yaT3
	aAvWKRI8E2LpyGqbtArF5j5GbHfaD34+XOQx36EgPneOzsmjabYE9Dk/Lr3QQV9rifNB
	y0EsQSQKcR3+bPpF9ZWtKbuUKD83QWgW9Ft6Fv2UwxUCWId9MyvqDJ8Z+jLwY1KaEf+i
	Av0/EbPUUWFrHuqooGZ6KL/eY6DYvc6qFVTPSnHGUojkYOnDY0AD4d+B5yiZNRjT/3hc
	K+lJl425wpTAOHm2nrOvBKK/dLHzZXooMJIAevm06wTDIRNz2T1wkhIZeFf/1JyOxfl9
	X+pA==
X-Gm-Message-State: AKGB3mJmai1Co0win7YBkGpJjYxeTlpmIVvrxMMrJw4rGZ86GTGpclfR
	qJX4Z+kJqdbp7Io3oPIFsXA2k8RzzXDh2rVmbLc=
X-Received: by 10.28.69.8 with SMTP id s8mr9055793wma.25.1515450085824; Mon,
	08 Jan 2018 14:21:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 14:20:55 -0800 (PST)
In-Reply-To: <20180108154303.6522-4-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-4-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 14:20:55 -0800
X-Google-Sender-Auth: 5z8JG4P_7rF_LTfJF62aBNDXFJ4
Message-ID: <CAKmqyKM010adN0rTP0GWzEg=SNWf4HH7h-zMQviVZCSWhadZNA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 03/31] sdhci: add
 max-block-length capability (Spec v1)
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
X-TUID: vlcplv8x5jyD

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci-internal.h |  1 -
>  include/hw/sd/sdhci.h  |  1 +
>  hw/sd/sdhci.c          | 38 +++++++++++++-------------------------
>  3 files changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 6944fcaf00..0561e6eaf7 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -188,7 +188,6 @@ FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
>  #define SDHC_CAN_DO_ADMA2              0x00080000
>  #define SDHC_CAN_DO_ADMA1              0x00100000
>  #define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
> -#define SDHC_CAPAB_BLOCKSIZE(x)        (((x) >> 16) & 0x3)
>  FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
>  FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
>  FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 266030dc8d..2703da1d5a 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -103,6 +103,7 @@ typedef struct SDHCIState {
>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
>      uint8_t spec_version;
>      struct {
> +        uint16_t max_blk_len;
>          bool suspend;
>          bool high_speed;
>          bool sdma;
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e7dbab2fdc..c78643fe54 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -46,9 +46,6 @@
>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Suppor=
t */
>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
> -/* Maximum host controller R/W buffers size
> - * Possible values: 512, 1024, 2048 bytes */
> -#define SDHC_CAPAB_MAXBLOCKLENGTH 512ul
>  /* Maximum clock frequency for SDclock in MHz
>   * value in range 10-63 MHz, 0 - not defined */
>  #define SDHC_CAPAB_BASECLKFREQ    52ul
> @@ -62,16 +59,6 @@
>  #error Capabilities features can have value 0 or 1 only!
>  #endif
>
> -#if SDHC_CAPAB_MAXBLOCKLENGTH =3D=3D 512
> -#define MAX_BLOCK_LENGTH 0ul
> -#elif SDHC_CAPAB_MAXBLOCKLENGTH =3D=3D 1024
> -#define MAX_BLOCK_LENGTH 1ul
> -#elif SDHC_CAPAB_MAXBLOCKLENGTH =3D=3D 2048
> -#define MAX_BLOCK_LENGTH 2ul
> -#else
> -#error Max host controller block size can have value 512, 1024 or 2048 o=
nly!
> -#endif
> -
>  #if (SDHC_CAPAB_BASECLKFREQ > 0 && SDHC_CAPAB_BASECLKFREQ < 10) || \
>      SDHC_CAPAB_BASECLKFREQ > 63
>  #error SDclock frequency can have value in range 0, 10-63 only!
> @@ -83,7 +70,7 @@
>
>  #define SDHC_CAPAB_REG_DEFAULT                                 \
>     ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
> -    (SDHC_CAPAB_ADMA2 << 19) | (MAX_BLOCK_LENGTH << 16) |      \
> +    (SDHC_CAPAB_ADMA2 << 19) |                                 \
>      (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
>      (SDHC_CAPAB_TOCLKFREQ))
>
> @@ -92,9 +79,17 @@
>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>  {
>      uint64_t capareg =3D 0;
> +    uint32_t val;
>
>      switch (s->spec_version) {
>      case 1:
> +        val =3D ctz32(s->cap.max_blk_len >> 9);
> +        if (val >=3D 0b11) {
> +            error_setg(errp, "block size can be 512, 1024 or 2048 only")=
;
> +            return;
> +        }
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, MAXBLOCKLENGTH, val)=
;
> +
>          capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.hi=
gh_speed);
>          capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
>          capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.s=
uspend);
> @@ -1175,17 +1170,7 @@ static const MemoryRegionOps sdhci_mmio_ops =3D {
>
>  static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
>  {
> -    switch (SDHC_CAPAB_BLOCKSIZE(s->capareg)) {
> -    case 0:
> -        return 512;
> -    case 1:
> -        return 1024;
> -    case 2:
> -        return 2048;
> -    default:
> -        hw_error("SDHC: unsupported value for maximum block size\n");
> -        return 0;
> -    }
> +    return 1 << (9 + FIELD_EX32(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH))=
;
>  }
>
>  static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
> @@ -1319,6 +1304,9 @@ const VMStateDescription sdhci_vmstate =3D {
>  static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
>
> +    /* Maximum host controller R/W buffers size
> +     * Possible values: 512, 1024, 2048 bytes */
> +    DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, =
512),
>      /* DMA */
>      DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
>      /* Suspend/resume support */
> --
> 2.15.1
>
>
