Received: by 10.223.159.74 with SMTP id f10csp148916wrg;
        Fri, 15 Dec 2017 16:12:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBouDsk628l0g89XRWVThuJlEbneS4XU6WvLJOTL6UQXU4imVlJKbOU6NvsWIg+LHvrFlxSoq
X-Received: by 10.13.238.70 with SMTP id x67mr8196775ywe.345.1513383135295;
        Fri, 15 Dec 2017 16:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513383135; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7sgq8cV0SeZRWzsfV9eYB6kmpSOxjzi3QjIK7giefcPkgzfQKvuKytlvW1b5iym0X
         G4qi6B0/dkyeLrsGrBszlp7wTqR0W2YyJry++gAppgEQwhEJsSL2L81MDwKKsFgHCc42
         +oVNXG/c3o8RUvpqpR6HhZZY8mjH36FvWYBGU1fv+NQ5oKAKqHSDcn0YPyiV8XKhND9b
         eCuvSlbMAOK7VhC4EUKYY3yu2A95Qofl2LuryLLs25cpqrIv6P/gGjjoU3QrUroOQnL+
         J2XQ2/fv+4+yJlb04Vvk+UXYvNvH9G+3bzQC6pUcCStSPjUoz2xeaIdt5Bw3egWRwzZy
         KXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ql+PZU/ocnIRueBMo2liBjkyootIXlEVW5npK12nr9E=;
        b=amZqC+wFWlSUyLP/8RRxwArPOvlMvfDeIaxAH3eT2H4z9Nyrd7+764Fn9Eiu8FSb3W
         UtzRVdKpgtR2yn8O/UXtHP70jYECj1apwVXSIhg64Jl613//vZR6VRFUE6hyO1TOh0XG
         jjKQP0w/1Ek/96XSZxqk1vCRXayvXCo1NZm8C8gkVWpI67oLlnmhqajhH/fCsq25yaEJ
         4bMNKprYV4jtXm3u6UsVDCt3U8VbNwSoix1H5FwZoPnWMsBdLtJITpBIYUA+VB9uv0Aa
         aMdXcsoTJLI9m2Grvt4gDCQ30b2BsKcc1DfVgAWWjXp9xIuz9jmMJWpppHo4lf7/ZPm2
         V1rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J6cOViQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14si1539892ybt.71.2017.12.15.16.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 16:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J6cOViQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQ05O-0002rN-K9
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 19:12:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eQ05F-0002r5-Ln
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eQ05E-0008Ub-JX
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:12:05 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:37170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eQ05E-0008TA-9F; Fri, 15 Dec 2017 19:12:04 -0500
Received: by mail-wr0-x242.google.com with SMTP id k61so9397367wrc.4;
	Fri, 15 Dec 2017 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=ql+PZU/ocnIRueBMo2liBjkyootIXlEVW5npK12nr9E=;
	b=J6cOViQVB+EZ+ydnmvVLcM2OVFyppGNDH17T4EYNj+4AcrliN5gcYoy2Z4Sln/01sP
	AF2YhPHb6N1lp9Lx+mfnsbffMvV84Ys1afnvnFypjVDD+njObbGGKXGtAb0VwYWvEKmj
	GS5fw78+GMtUaTXoLBIL0OKNUuWAHhhEcT7ZmWJFcvaYqMuab3gxEsriZ7o2/xwNO3H5
	czWYg2wQuwp8i4ZWSuBHFdRKwwYzOS+XWTy/Ek4TpQMIoICXKE9xXZGtvvY9posIxn7v
	uVyRtsaJYqVBjQlxVRXwlmh3pOTFjVFtNPhJW0ERZSnaLiV05wBmkgxso7Mn+LjRpCge
	3nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=ql+PZU/ocnIRueBMo2liBjkyootIXlEVW5npK12nr9E=;
	b=iuBXBuYR/dNKWQ1sOZ/C98fm/DzKPtR9iYfteXMh5nsdts2EK0yocWcHNjkM5mNImo
	hZvL6fnKYyp1HfEAWc9LrD8scAnldgzAi8F3reF+hwb5ryT0fkj1FfZXmVA7ZoasIfWm
	wLU/gHqOaBPU/WtduETwE4tskenclsU62KsET2MAfhPHtFSkGOunKUYosRxaRo+8ja3I
	04jJFywNsqaaeXOhq9KmUcMk7qaReiLuDUKq4L7CCaSdgmflEXGCiDEc4JT6bTrkUlkB
	JhBhdhtj1PVDLRpFma0vHC9LYHsGhEAcTL/6qlmkb0Cx/GGtDWb5IT97Pn+vVQMwd92l
	BOZA==
X-Gm-Message-State: AKGB3mIIpau064SLrh9NVGXf15mpSlW8DdIyOO7N9BGt3q9Ba9X993O8
	DVWqM/qszYGWaClFptuqvuAwHEe6fuj21AnIIg0=
X-Received: by 10.223.161.158 with SMTP id u30mr11496092wru.96.1513383123221; 
	Fri, 15 Dec 2017 16:12:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 15 Dec 2017 16:11:32 -0800 (PST)
In-Reply-To: <20171214020025.4004-5-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
	<20171214020025.4004-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 16:11:32 -0800
X-Google-Sender-Auth: c4BTvfLmdS6jtHhuZHWBVv-Ms-4
Message-ID: <CAKmqyKMcPagPWoe4kJB3deccHxxzcBpoyM13+PMO-mxTuj0mEQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/8] sdhci: fix CAPAB/MAXCURR
 registers, both are 64bit and read-only
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /k3WAW2XBw/T

On Wed, Dec 13, 2017 at 6:00 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> running qtests:
>
>   $ make check-qtest-arm
>     GTESTER check-qtest-arm
>   SDHC rd_4b @0x44 not implemented
>   SDHC wr_4b @0x40 <- 0x89abcdef not implemented
>   SDHC wr_4b @0x44 <- 0x01234567 not implemented
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/sd/sdhci.h |  4 ++--
>  hw/sd/sdhci.c         | 25 ++++++++++++++++++++-----
>  2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index f8e91ce903..d5093fe3fd 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -75,8 +75,8 @@ typedef struct SDHCIState {
>      uint16_t acmd12errsts; /* Auto CMD12 error status register */
>      uint64_t admasysaddr;  /* ADMA System Address Register */
>
> -    uint32_t capareg;      /* Capabilities Register */
> -    uint32_t maxcurr;      /* Maximum Current Capabilities Register */
> +    uint64_t capareg;      /* Capabilities Register */
> +    uint64_t maxcurr;      /* Maximum Current Capabilities Register */
>      uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
>      uint32_t buf_maxsz;
>      uint16_t data_count;   /* current element in FIFO buffer */
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index d6145342fb..4d269c7ac4 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -99,7 +99,7 @@
>
>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>  {
> -    if (s->capareg =3D=3D UINT32_MAX) {
> +    if (s->capareg =3D=3D UINT64_MAX) {
>          s->capareg =3D SDHC_CAPAB_REG_DEFAULT;
>      }
>  }
> @@ -893,10 +893,16 @@ static uint64_t sdhci_read(void *opaque, hwaddr off=
set, unsigned size)
>          ret =3D s->acmd12errsts;
>          break;
>      case SDHC_CAPAREG:
> -        ret =3D s->capareg;
> +        ret =3D (uint32_t)s->capareg;
> +        break;
> +    case SDHC_CAPAREG + 4:
> +        ret =3D (uint32_t)(s->capareg >> 32);
>          break;
>      case SDHC_MAXCURR:
> -        ret =3D s->maxcurr;
> +        ret =3D (uint32_t)s->maxcurr;
> +        break;
> +    case SDHC_MAXCURR + 4:
> +        ret =3D (uint32_t)(s->maxcurr >> 32);
>          break;
>      case SDHC_ADMAERR:
>          ret =3D  s->admaerr;
> @@ -1117,6 +1123,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
>          }
>          sdhci_update_irq(s);
>          break;
> +
> +    case SDHC_CAPAREG:
> +    case SDHC_CAPAREG + 4:
> +    case SDHC_MAXCURR:
> +    case SDHC_MAXCURR + 4:
> +        qemu_log_mask(LOG_GUEST_ERROR, "SDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08x read-only\n", size, offset, value >> s=
hift);
> +        break;
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "SDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0=
x%08x "
>                        "not implemented\n", size, offset, value >> shift)=
;
> @@ -1266,8 +1281,8 @@ const VMStateDescription sdhci_vmstate =3D {
>  static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState,
>                        capabilities.spec_version, SD_HOST_SPECv2_VERS),
> -    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg, UINT32_MAX),
> -    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
> +    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
> +    DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
>                       false),
>      DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
> --
> 2.15.1
>
>
