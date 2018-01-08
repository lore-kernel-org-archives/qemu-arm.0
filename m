Received: by 10.28.173.206 with SMTP id w197csp2991876wme;
        Mon, 8 Jan 2018 14:25:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBoseD1yJA+4EVUxK985M5MlFqd0O3sQeXJY4kA2batguIxBj4jC2kuBVu76B0fAUqfRE8YEQ
X-Received: by 10.13.208.2 with SMTP id s2mr3389342ywd.62.1515450324969;
        Mon, 08 Jan 2018 14:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515450324; cv=none;
        d=google.com; s=arc-20160816;
        b=JrYw6agSwP0YDS5X0dsoA4Su15VEEZkIbZ4iTsj+urhM30CZ/K3boa+DNlAPwBYvDF
         ooKZw1L2EjQf9PImVfYSnrD0GWZ0KoES5TspD8xvaYm+lBLivMlT9Cn00DNcD74L3oCe
         9TE+K9WsndJ9FWM//c6XnMFtJ/B2Kpdg2KlI5SQsoSRb/D+/dwJJqVaawWi+e2seXMWA
         5h6rpxyC+P3306DJLO2s0XeONqZSJGmRaaq1xMkUnUXRLP+F0PE0AWpRGSkpaN6Q1DdI
         UM6TvW2cEavNFAYyJ4wuqt5Tfn5CmVgH+p5o6Y1agLY5RK/PujHDKL62EnRFRU4t5fOR
         1cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=j4hBJ/kwriKG9bnCmF4tTQpq8x5nHRYG3f7C2oMynl8=;
        b=fsDVYEimrSvVrwL3YjUCaJG43896Lra38+l5tMjAOr6vdfIl41pYrDNhh+iIWS10CL
         v14rOhHrAoi9N2L8fpCEA9DYjZUUfU9aMUyHFPQK30PKSQt397XR/M2NV09vRNDxDTCR
         3RAPPxaIj/88nktlsVrERWsZKyMhisHsY+o4+D1kxTy+//imKKExEfokd2EfvAR3JA+0
         XFx+3PICDZ9QzEgszkYSW1z6Qzs2INc4o6MREkY8JgyhAufwri6VE+S7loRLk5NW6m5i
         1sCrmye8MCHIUJPsxwek5dF1iH6wpX0XH0XaxHqKy7DwShZHhzSOAVZ74HR1oyy4jtJA
         sIwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h8IjaBI9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d65si2690115ybf.651.2018.01.08.14.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 14:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h8IjaBI9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfrA-0006zX-ES
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 17:25:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfoz-0005mm-MR
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 17:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfoy-0000TU-KC
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 17:23:09 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:43005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfoy-0000TA-Bg; Mon, 08 Jan 2018 17:23:08 -0500
Received: by mail-wm0-x244.google.com with SMTP id b141so17035030wme.1;
	Mon, 08 Jan 2018 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=j4hBJ/kwriKG9bnCmF4tTQpq8x5nHRYG3f7C2oMynl8=;
	b=h8IjaBI9PB3A+qyhFtyZb6hECMQjPJ8d1umePIH6XagzTERR9OrznMzK4zptFXpT6H
	AXvobJG750S5SBaI3AKKPvbIHzJih3hs+ML/ie25735QaghMFz4I6Y4zJ2LzqZCpXXSP
	t9SBt2Sp0+H29haOFqTCABUJgcmTK7nJbZMtwkbP4Pw4uTe5Vnujibq5OLFWt09UpdDy
	KutdkkMpxRgp1emmy4opHY447ZcyXvXasN2LiC93qEcRykbTWbwgKwHocPMxSzxgFIZL
	exS0nhAdmks9pLktmtbkLlW9NTW4YEVwcFSP7eEl0azwPbE9XiEg41gtVDnCHj/5cSR6
	YWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=j4hBJ/kwriKG9bnCmF4tTQpq8x5nHRYG3f7C2oMynl8=;
	b=aRt0CM0r/OkwkKhcVBYbhazn/II57K8AE/sFT9+mA/i5mLNx6LDk91Fzff3nBgisqM
	WwDCD0m28HPvRjwqdOMDLOL2mryHT67fIJmN3JvQ359ClqoSz67mvtE1TpphO91dvRQb
	Zx2v3ZJiOqkqeSbc5WJe1xm+XYSJZzxA35/6sCeYasVNvoPW7LvICzc3P0XOyRPPxaWY
	XNV6Mdg0M7Bf6YcdE6+f6Ns8RpR4PI1wYjDWcp3YRf3T1i399XqxT6uAWiGp0r31KLgW
	FxHa5m0OHSEGceRkWVwQV8eK4w54llST54B7RbeCBm97SZs3FMtXmR61xtfUQcVDauIo
	TCNw==
X-Gm-Message-State: AKGB3mLUezM2lbEdb3SwDON+tT8ph6akEhD2N5Pr6J6cqf7I1Bv/6hJz
	gHiQGZe/s07kOJHpyErLZB/gPCExgllfwhJGnSw=
X-Received: by 10.28.231.8 with SMTP id e8mr9615582wmh.16.1515450187323; Mon,
	08 Jan 2018 14:23:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 14:22:36 -0800 (PST)
In-Reply-To: <20180108154303.6522-5-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 14:22:36 -0800
X-Google-Sender-Auth: MMik_ScsVIIkxVCTmPnD56TgC78
Message-ID: <CAKmqyKMbf9RxyfqE2s1fvcUGp+t-Ywdwjx5CEQvKO_Pe9HnEFw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PATCH v5 04/31] sdhci: add clock capabilities
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
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g5lc5BhAqooM

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/sd/sdhci.h |  2 ++
>  hw/sd/sdhci.c         | 52 +++++++++++++++++++++++++++++++--------------=
------
>  2 files changed, 34 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 2703da1d5a..c1602becd2 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -103,6 +103,8 @@ typedef struct SDHCIState {
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
> index c78643fe54..05681c86d6 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -46,36 +46,31 @@
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

You are missing a default here.

Alistair

> +        error_setg(errp, "SD %s clock frequency can have value"
> +                   "in range 0-63 only", desc);
> +        return;
> +    }
> +}
> +
>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>  {
>      uint64_t capareg =3D 0;
> @@ -83,6 +78,16 @@ static void sdhci_init_capareg(SDHCIState *s, Error **=
errp)
>
>      switch (s->spec_version) {
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
> @@ -1304,6 +1309,13 @@ const VMStateDescription sdhci_vmstate =3D {
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
> +
>      /* Maximum host controller R/W buffers size
>       * Possible values: 512, 1024, 2048 bytes */
>      DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, =
512),
> --
> 2.15.1
>
>
