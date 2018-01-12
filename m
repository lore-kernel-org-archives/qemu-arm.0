Received: by 10.28.173.206 with SMTP id w197csp29425wme;
        Fri, 12 Jan 2018 15:56:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBou/Tbos0+IDhXJ+JDQ7d6eomx3+gEzPiJgZ4jqd3r1QUWc6PXt57WNN6DCLaAlxrTtWkQF2
X-Received: by 10.129.85.3 with SMTP id j3mr17437693ywb.351.1515801393373;
        Fri, 12 Jan 2018 15:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515801393; cv=none;
        d=google.com; s=arc-20160816;
        b=OkS66tywrm4VvEyamn+YlyFeb9h+0mqGCZlU5BvgFNM2pq4AhPOsdpFevHC/bepsye
         tvvImh86YSlo1q3/v+ODoBnlbw0kR4EpRQAj3yzixL/Hd0d2w8KzENW9uby1FKkxw6kj
         4fy8U9SFrN+7AO37wnwAZd6CXcjq+SGuzADhFlEiY8E89Ks8V/2OAYJGr2D9m9VM9bLK
         KmnXsQchp05ySz9R8+tohiVRtrZL37yMSCAgvbg6CVOXroSEL1HJhqmJYPBKsrcpAs7q
         MYX3qfdktV+sYwDuTTBnEQBfoMJ4Lc4eIGIOn20mnAwclyQfh5EHAjrm3cman7uVOT+U
         /JBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5z+O5MkXxY3uwA6T31XFygpa1LbmcKUXa2Dk9w22PwM=;
        b=h9BDgbcDzrEPfXj/0y0iTFuF2kIdlK5PCj9zFdajoGcWx+1WFCRMQbfvCQ+lbRH7hD
         932QXlzu23gmm7rSez2I4uXyJ6wWg6tz7G2qqzKVp0kZP546zTmSuVj8wxRtYc/e0eog
         kmhsmMkZz2eQqpmbWpizxpmJKHPCHSjmIXIOFIG33kuT7rOMj5pL/NwO90aD/9+zx4Ky
         lOl9zT+9VhCIxiKW5p5PiTE157X/qLRmHkQm589NVXEstEVzoCJIYuTHVvwISCpSm4r9
         BcMVGxJkax4NcCkzcJXeyzypOuzKMvFN9l8SHPXvKt5/L/Y7/vklmIhHHO51K+AMyTcS
         iXiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y0lHzjcU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s189si2616975ywc.720.2018.01.12.15.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 15:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y0lHzjcU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea9BY-0005d3-St
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 18:56:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9BK-0005ch-3M
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 18:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9BJ-0005GV-18
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 18:56:18 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:35582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ea9BI-0005EV-N8; Fri, 12 Jan 2018 18:56:16 -0500
Received: by mail-wr0-x241.google.com with SMTP id g38so3480194wrd.2;
	Fri, 12 Jan 2018 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=5z+O5MkXxY3uwA6T31XFygpa1LbmcKUXa2Dk9w22PwM=;
	b=Y0lHzjcUzsPREl9DPPYjYJNkBzrsFAb+wgauiB60XC2/Uu0ZDsCxcHMwXDcgrdkKTp
	hacBw9xKwj7zcEs/W3Ja8frwXjzVd1N2VNTrrFe+TOQpMANJdPfVrmIn9XFR5y2VLsK/
	RPBHV+xyc33iLfES2cFSRzlpjcMXdKNlAbwVrIb+1EC6JPeFiwZqWlqkktEf0ZENwo5N
	t3htUw/yzbaOQurb+LQWKJGyxJVopx227QJQO5ahXh59TUKBy5wDEiaD0yMrjyB30nYX
	Cr3uv9fX1sz/UdVWXVQbxtbK4ZeS/o9Qge8FTebMM5Lqu91C+zQeb2NeSBTrrWt26QCt
	77Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=5z+O5MkXxY3uwA6T31XFygpa1LbmcKUXa2Dk9w22PwM=;
	b=Vjtlztggy8YhuvY0/wKCUws6Bn62TOh8NH6yQpDEO8fZaRI3rgk3CzFJz199VxOmAw
	0vW+F1QrDe4W08KWUgDN/NDrg6JPhsetQK91u03EY3RT+vqowNnKxlzxuhHRAXG5D/r7
	NzJQlLTpcSFqeqXAnErjguOmYUz2Nb1ZbsPHrgijucqeSKoBwawMbi+smxgQPb5ubMpW
	ej4rPTENR0B3Sfjx8cQtDPCqWcOdPeybZj0cW+W1Cc5OB7OmjfoafxPfqw5P8rbmOEDL
	03YD6i4/bHfY3cyBn1PBG0bnMp/p9ZwYmDd1/935LOeejJdq5dGChXFiIUIANbyRqXoa
	N/rg==
X-Gm-Message-State: AKwxytdEfKp3BBWr7H1tYHssjjJSIEhJ4NSD67URi9idOCihRU2IfKoD
	W/hbmZt35d35hAoArIrXXV8Og8igXa3rjdGNVvg=
X-Received: by 10.223.196.147 with SMTP id m19mr14581647wrf.56.1515801375426; 
	Fri, 12 Jan 2018 15:56:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 15:55:44 -0800 (PST)
In-Reply-To: <20180111205626.23291-5-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 15:55:44 -0800
X-Google-Sender-Auth: BTUp0tbMBEtivtVrWEt6iVB95nE
Message-ID: <CAKmqyKOgVniY+v=GDkcmGD-e9BgasuD36wyKHKtMccJMC9+Ffg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [PATCH v6 04/21] sdhci: add clock capabilities
 (Spec v1)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8io2Q7Nr9HtZ

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/sd/sdhci.h |  2 ++
>  hw/sd/sdhci.c         | 53 ++++++++++++++++++++++++++++++++-------------=
------
>  2 files changed, 35 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index b61953f7c5..b5b4e411ff 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -93,6 +93,8 @@ typedef struct SDHCIState {
>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int=
 */
>      uint8_t spec_version;
>      struct {
> +        uint8_t timeout_clk_freq, base_clk_freq_mhz;
> +        bool timeout_clk_in_mhz;
>          uint16_t max_blk_len;
>          bool suspend;
>          bool high_speed;
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 54c1411d19..4c1fcf2c32 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -46,36 +46,32 @@
>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Suppor=
t */
>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
> -/* Maximum clock frequency for SDclock in MHz
> - * value in range 10-63 MHz, 0 - not defined */
> -#define SDHC_CAPAB_BASECLKFREQ    52ul
> -#define SDHC_CAPAB_TOUNIT         1ul  /* Timeout clock unit 0 - kHz, 1 =
- MHz */
> -/* Timeout clock frequency 1-63, 0 - not defined */
> -#define SDHC_CAPAB_TOCLKFREQ      52ul
>
>  /* Now check all parameters and calculate CAPABILITIES REGISTER value */
> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 =
> 1 || \
> -    SDHC_CAPAB_TOUNIT > 1
> +#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 =
> 1
>  #error Capabilities features can have value 0 or 1 only!
>  #endif
>
> -#if (SDHC_CAPAB_BASECLKFREQ > 0 && SDHC_CAPAB_BASECLKFREQ < 10) || \
> -    SDHC_CAPAB_BASECLKFREQ > 63
> -#error SDclock frequency can have value in range 0, 10-63 only!
> -#endif
> -
> -#if SDHC_CAPAB_TOCLKFREQ > 63
> -#error Timeout clock frequency can have value in range 0-63 only!
> -#endif
> -
>  #define SDHC_CAPAB_REG_DEFAULT                                 \
>     ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
> -    (SDHC_CAPAB_ADMA2 << 19) |                                 \
> -    (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
> -    (SDHC_CAPAB_TOCLKFREQ))
> +    (SDHC_CAPAB_ADMA2 << 19))
>
>  #define MASKED_WRITE(reg, mask, val)  (reg =3D (reg & (mask)) | (val))
>
> +static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc=
,
> +                                         uint8_t freq, Error **errp)
> +{
> +    switch (freq) {
> +    case 0:
> +    case 10 ... 63:
> +        break;
> +    default:
> +        error_setg(errp, "SD %s clock frequency can have value"
> +                   "in range 0-63 only", desc);
> +        return;
> +    }
> +}
> +
>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>  {
>      uint64_t capareg =3D 0;
> @@ -86,6 +82,16 @@ static void sdhci_init_capareg(SDHCIState *s, Error **=
errp)
>
>      /* fallback */
>      case 1:
> +        sdhci_check_capab_freq_range(s, "Timeout", s->cap.timeout_clk_fr=
eq,
> +                                     errp);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, TOCLKFREQ,
> +                             s->cap.timeout_clk_freq);
> +        sdhci_check_capab_freq_range(s, "Base", s->cap.base_clk_freq_mhz=
, errp);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, BASECLKFREQ,
> +                             s->cap.base_clk_freq_mhz);
> +        capareg =3D FIELD_DP64(capareg, SDHC_CAPAB, TOUNIT,
> +                             s->cap.timeout_clk_in_mhz);
> +
>          val =3D ctz32(s->cap.max_blk_len >> 9);
>          if (val >=3D 0b11) {
>              error_setg(errp, "block size can be 512, 1024 or 2048 only")=
;
> @@ -1299,6 +1305,13 @@ const VMStateDescription sdhci_vmstate =3D {
>  static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
>
> +    /* Timeout clock frequency 1-63, 0 - not defined */
> +    DEFINE_PROP_UINT8("timeout-freq", SDHCIState, cap.timeout_clk_freq, =
0),
> +    /* Timeout clock unit 0 - kHz, 1 - MHz */
> +    DEFINE_PROP_BOOL("freq-in-mhz", SDHCIState, cap.timeout_clk_in_mhz, =
true),
> +    /* Maximum base clock frequency for SD clock in MHz (range 10-63 MHz=
, 0) */
> +    DEFINE_PROP_UINT8("max-frequency", SDHCIState, cap.base_clk_freq_mhz=
, 0),

Haven't all the defaults changed? Needs to be mentioned in the commit
message if that is on purpose.

Alistair

> +
>      /* Maximum host controller R/W buffers size
>       * Possible values: 512, 1024, 2048 bytes */
>      DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, =
512),
> --
> 2.15.1
>
>
