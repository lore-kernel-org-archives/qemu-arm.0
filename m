Received: by 10.223.134.117 with SMTP id 50csp12416568wrw;
        Wed, 3 Jan 2018 13:58:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBovH2FnPkn0MFmVbgIuW+hF6KLWO0MJxfCvs2rdBg+eDsrV0j8l7RDeEMfXylszVKsVz0DPG
X-Received: by 10.13.202.21 with SMTP id m21mr2483842ywd.177.1515016728598;
        Wed, 03 Jan 2018 13:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515016728; cv=none;
        d=google.com; s=arc-20160816;
        b=qI35Lwn1ccZMZxF6FNNCWk17Razr2vWYsa3dJZDiCW1i5PwVJacyk/RRvv3cEvLGk+
         c6mBY0JhUBcnfO+2iTpB8vrbNS1xFbnESjnX89TQP4VYlpvAKBreOmwz+voEyc5l2l7U
         8yt5Q7wFsfX1yUOqEWX3fCKh8qkM5ctwuJ3rbQaHDAVUAAgzNT/6qFjDKA/kBsjB2i4n
         T78kxlBlbCUDChvIxjPJ8skvAsRfsEE09+tbIuZPEma8tNOXEpj8+mzuZZM9D9s4rn+M
         BplZqOA8f4tcdcStTMOErWoUk3K6DOtClCwcBj39sjbOTAynk61csv/Ag5Fh8cK4OId6
         3Nkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=IPyXA4/WV+2S2sAI4XpRNTbVSKQNZ+KwFBqwaWZz5g4=;
        b=g5YFGtzWjsLvjnljVJuIQig6okEs5iYcl+QC8lcC4QzaZfp2xz+jBZzWBkBVe+82Lu
         +4zOmhpJKrzF0/ah4tBH3VPdb++qRLdIOM+9O/CQn6tuNRCESVQBiPhazTBTRTKXR8+Z
         Vsu0GSRxreRjFtIC+Fuz4CXayolhb1M9MCGLqU2pPw9uT+Vt0cDcLCQtYmMkpUfq7HJi
         c80POrjkjBpaja4cJvtJHEhZy5BkK7/oyDwSIGsnIB7gdMSA+nnrqLzK76qM21N31AEZ
         zF+unZibPfgydhaVLw7C29DU/k2nFfP/NCUJa1J1+baURX1T8mVShnrX4QEo0PDG8DME
         zJ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bRfo+ZL/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l204si405477ywb.222.2018.01.03.13.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 13:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bRfo+ZL/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWr3g-0000sA-1P
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 16:58:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWr00-0005Lu-1S
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWqzz-0008Gf-18
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:55:00 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:39977)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eWqzy-0008Fe-NG; Wed, 03 Jan 2018 16:54:58 -0500
Received: by mail-wm0-x242.google.com with SMTP id f206so195363wmf.5;
	Wed, 03 Jan 2018 13:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=IPyXA4/WV+2S2sAI4XpRNTbVSKQNZ+KwFBqwaWZz5g4=;
	b=bRfo+ZL/l9LnxMrmIYCToUwRrfkaHw0id9ie55VRjgWOz8Gze/atzwXTFe+GNRwJPn
	Nmic2hYSqFT40mmN9BQ/sCxd/+7WXkWXq64lMWOVO47EFDLcdOF8qZZm+ufFqqGibkel
	uALSE4btKZUOrwJbWSeTdbFeXDWTUbmpxOXUqWz/mplGtgTpxlqLECtUTwxtnsqf2/n6
	GHDbgdANiCXPHKf2EL/a/xM5xd412Ol7iJ4rOLNtLOeuXDdaDABys6JRt6qsjNstXbOg
	MlvGYFcYgRe8y5McOWlRb5D/1pZGpBEcXkt/Yzu8dr8/3FNZGMMfkmihgg3/Zc/UeEJ0
	Drvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=IPyXA4/WV+2S2sAI4XpRNTbVSKQNZ+KwFBqwaWZz5g4=;
	b=SoalFyTSP4YcVjjEsEbkOj6NdpJ7oS40Y73Qfd1fhWiKOpkFvCInzJUp5Qq5Z6S0JU
	HrI2OlCkW0UezwXX185MNIJ/XRW4PmA1Z9e6ls7+ZMsbraErdy5Ji1Kh6Of7ovbcTc9A
	IwXANwQMo80eXamckpA/wvyOQ+yYiuAqFGML5/4zJYHNJT2csFSvoEyA0o5esJNa0eiJ
	OsTSoDhFjfLYxIaV9/QQfld7FjcnwxPzQQTq1E6ljA0E2IZL1l2ywban4ULEWj6/p//n
	nl3lNordyfJo2z0oy2tf8OEIt2m7YcBvx8ZQDvwzme0okPLqNiJHsifECizHb/swDru5
	8xcg==
X-Gm-Message-State: AKGB3mJytj/GzFdwzlXy6Yc4ZuoOddm95zLvf4qACJddrO731FjbqWwO
	LzeaFsoszIhH2Hjmn54tq3d2hVqiaR0sfZ8aRDk=
X-Received: by 10.28.136.66 with SMTP id k63mr2579030wmd.50.1515016497515;
	Wed, 03 Jan 2018 13:54:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Wed, 3 Jan 2018 13:54:26 -0800 (PST)
In-Reply-To: <20180103164117.11850-3-f4bug@amsat.org>
References: <20180103164117.11850-1-f4bug@amsat.org>
	<20180103164117.11850-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jan 2018 13:54:26 -0800
X-Google-Sender-Auth: 3CbcNe1XZkuCVNs5crAiKTGSPZA
Message-ID: <CAKmqyKOFBVv0n-+-3RgZ7_-Ve8GWoxE7H60gPGqdXwY+Wu2zog@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/sd/pxa2xx_mmci: add
 read/write() trace events
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W99fPJeJEI8r

On Wed, Jan 3, 2018 at 8:41 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/pxa2xx_mmci.c | 63 ++++++++++++++++++++++++++++++++++-------------=
------
>  hw/sd/trace-events  |  4 ++++
>  2 files changed, 44 insertions(+), 23 deletions(-)
>
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 3deccf02c9..0759a0d2eb 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -19,6 +19,7 @@
>  #include "hw/qdev.h"
>  #include "hw/qdev-properties.h"
>  #include "qemu/error-report.h"
> +#include "trace.h"
>
>  #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
>  #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2X=
X_MMCI)
> @@ -278,43 +279,55 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState =
*s)
>  static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned s=
ize)
>  {
>      PXA2xxMMCIState *s =3D (PXA2xxMMCIState *) opaque;
> -    uint32_t ret;
> +    uint32_t ret =3D 0;
>
>      switch (offset) {
>      case MMC_STRPCL:
> -        return 0;
> +        break;
>      case MMC_STAT:
> -        return s->status;
> +        ret =3D s->status;
> +        break;
>      case MMC_CLKRT:
> -        return s->clkrt;
> +        ret =3D s->clkrt;
> +        break;
>      case MMC_SPI:
> -        return s->spi;
> +        ret =3D s->spi;
> +        break;
>      case MMC_CMDAT:
> -        return s->cmdat;
> +        ret =3D s->cmdat;
> +        break;
>      case MMC_RESTO:
> -        return s->resp_tout;
> +        ret =3D s->resp_tout;
> +        break;
>      case MMC_RDTO:
> -        return s->read_tout;
> +        ret =3D s->read_tout;
> +        break;
>      case MMC_BLKLEN:
> -        return s->blklen;
> +        ret =3D s->blklen;
> +        break;
>      case MMC_NUMBLK:
> -        return s->numblk;
> +        ret =3D s->numblk;
> +        break;
>      case MMC_PRTBUF:
> -        return 0;
> +        break;
>      case MMC_I_MASK:
> -        return s->intmask;
> +        ret =3D s->intmask;
> +        break;
>      case MMC_I_REG:
> -        return s->intreq;
> +        ret =3D s->intreq;
> +        break;
>      case MMC_CMD:
> -        return s->cmd | 0x40;
> +        ret =3D s->cmd | 0x40;
> +        break;
>      case MMC_ARGH:
> -        return s->arg >> 16;
> +        ret =3D s->arg >> 16;
> +        break;
>      case MMC_ARGL:
> -        return s->arg & 0xffff;
> +        ret =3D s->arg & 0xffff;
> +        break;
>      case MMC_RES:
> -        if (s->resp_len < 9)
> -            return s->resp_fifo[s->resp_len ++];
> -        return 0;
> +        ret =3D (s->resp_len < 9) ? s->resp_fifo[s->resp_len++] : 0;
> +        break;
>      case MMC_RXFIFO:
>          ret =3D 0;
>          while (size-- && s->rx_len) {
> @@ -324,16 +337,19 @@ static uint64_t pxa2xx_mmci_read(void *opaque, hwad=
dr offset, unsigned size)
>          }
>          s->intreq &=3D ~INT_RXFIFO_REQ;
>          pxa2xx_mmci_fifo_update(s);
> -        return ret;
> +        break;
> +        ret =3D ret;
>      case MMC_RDWAIT:
> -        return 0;
> +        break;
>      case MMC_BLKS_REM:
> -        return s->numblk;
> +        ret =3D s->numblk;
> +        break;
>      default:
>          hw_error("%s: Bad offset " REG_FMT "\n", __FUNCTION__, offset);

Maybe worth removing this as well?

Either way:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>      }
> +    trace_pxa2xx_mmci_read(size, offset, ret);
>
> -    return 0;
> +    return ret;
>  }
>
>  static void pxa2xx_mmci_write(void *opaque,
> @@ -341,6 +357,7 @@ static void pxa2xx_mmci_write(void *opaque,
>  {
>      PXA2xxMMCIState *s =3D (PXA2xxMMCIState *) opaque;
>
> +    trace_pxa2xx_mmci_write(size, offset, value);
>      switch (offset) {
>      case MMC_STRPCL:
>          if (value & STRPCL_STRT_CLK) {
> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
> index 1fc0bcf44b..6eca3470e2 100644
> --- a/hw/sd/trace-events
> +++ b/hw/sd/trace-events
> @@ -3,3 +3,7 @@
>  # hw/sd/milkymist-memcard.c
>  milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08=
x value 0x%08x"
>  milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%0=
8x value 0x%08x"
> +
> +# hw/sd/pxa2xx_mmci.c
> +pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d a=
ddr 0x%02x value 0x%08x"
> +pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d =
addr 0x%02x value 0x%08x"
> --
> 2.15.1
>
>
