Received: by 10.28.71.27 with SMTP id u27csp2883223wma;
        Wed, 31 Jan 2018 08:46:02 -0800 (PST)
X-Google-Smtp-Source: AH8x2253pdEJerna/xjjO/3vVRcnrEOwtuXSE8d6RJRsslrTmizWEkkKpIzg3AbXXV6Sdy28sXEo
X-Received: by 10.13.251.6 with SMTP id l6mr22265796ywf.323.1517417162367;
        Wed, 31 Jan 2018 08:46:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517417162; cv=none;
        d=google.com; s=arc-20160816;
        b=DNgdb3RhdFl3HKc2OmD4PbDZVA28/8EuSSYF1wMuKxowGJkdFxaLeL1ClqV7BFRpdA
         Qf2eAeQOBPJj0IgRlCxR6zeZDjeZXimJEW6+yUIkrTCDV3dvoYEImFIg0xfSdHE8NTj8
         fvrBhcJKM/HgLXZXqYSTyp4AV1AsMjUHVtoYDSetpQkCLxpZWKjBPS6ieIBCeP6BVTfO
         4mnkoSh6jaSBTLBLOF5FWLBOK7jeP/VzBwlzlsNSgUszjPYLC8oVnhHXmyRmzDtAfUM/
         SRgWJd9GAthRfGf6emjKeJ7TRVqxTN0ZFjjaXLluWmS8UVU7zgoobTwrFRwYZm2vyZUc
         SfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OHJ236uUurlcNdFXS0gdyiALElvnQex98RoXsRd7pBA=;
        b=I6ySKTQPprxFcDUZdFqaGRJ8I95xT+x7kqFv6+okPHY5nL++oEuJSiuxcxd/ZemoZs
         VlXbPbXZEMMae/HaGDrZeZ3wDqbDAatrT+ymsbW1pkzvOMCP8BCKLb2fY6a5BIEKjq7v
         EWRXtqsk4Y9nDJY36jF3usha4mBc4NfMxzxTvKQMgnb5HIkl6WMgLHYSO2l1bxbPsEJ3
         ceolmU/IXD+Vjjca25YAscN4VQIUNcUK5nRwe8aKThAKy+rc4FQiXyKQvJL1uGMk4Nfs
         FPVICOsV5D9yVfuqlwBzoGKPJ/cwDIcJjWtpNZZR9F/8wSzN/F8FJm8/tKnVk7oGSHck
         dGCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PmRbCWLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w195si3182074ywa.110.2018.01.31.08.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 08:46:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PmRbCWLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvWL-0001cB-It
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 11:46:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvUo-0000Tk-RW
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 11:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvUn-00014x-HT
	for qemu-arm@nongnu.org; Wed, 31 Jan 2018 11:44:26 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1egvUg-00011z-ER; Wed, 31 Jan 2018 11:44:18 -0500
Received: by mail-lf0-x241.google.com with SMTP id t79so21725628lfe.3;
	Wed, 31 Jan 2018 08:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=OHJ236uUurlcNdFXS0gdyiALElvnQex98RoXsRd7pBA=;
	b=PmRbCWLauNgPsFDsxrKQ+cGkcZINf+Jf06WE81eadcyxNs4L19CxGmOu0gqygUzHoM
	L8Cwu9ibyMgXO4IsOtlervlb8eisvpB3q/ZSKPCL/yIlWORT1aCVFTa5r3YxOlmB0Dsm
	F2KfE5RBWT47KmOLphCuPvgTEJ89Fl+OCeMvzN9EzhfRmk6p4pq9vcUe6mEiw1ewEjlp
	qaosLuSSIcgbGvvJHe9KHwhrLSMrPhzKU2GC5pTpzKLjYrobUIXCgXMPqaXlvzEyS59K
	5kjWBNjTEv0CxqwK8g0eUVXgQHX+u7FcrFNky6f75FlgXQfOx591hnD1aCC2hFzIQJ5f
	qMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=OHJ236uUurlcNdFXS0gdyiALElvnQex98RoXsRd7pBA=;
	b=GI2dtDL1EfCuMFki6yuWM8Rl8QYw8LwT65FWZJwQA8N1xzYQh4PT2tOCGvjgrOnFXq
	itwkk5a/w1Hfx38SR5B+fnxeU2ZuHanR6Cvi2d2nP+w79xjiQ8Q4VVP6XY2zWLpczE4l
	Q7vkxFJtLK7BMXFbkgIy30r2/+dZs6VRUd/N34ca5GlI9gGWoAvUXMXAkt82OJ35U7eG
	TLESmdDWT3JdRe4LvRRMpGDS+0onUXLzhkjxzf/PccgLnim7stp83zaFHJwm11AOCAkq
	eGWz7y43+saPLIpsPw8MuN3iqtPH511k/tx02PYLlaFF+senj2rsrtFovtsojDv+kudB
	x2AA==
X-Gm-Message-State: AKwxyte9qe6AePOrqEehEpHChJzlfw6MU4333FT8AcBWCeQuSWebQF0n
	22m95UN76DaMFS+GN9Bq8h1qm+yTnYvyQmRCcc8=
X-Received: by 10.46.71.81 with SMTP id u78mr13251503lja.35.1517417057098;
	Wed, 31 Jan 2018 08:44:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Wed, 31 Jan 2018 08:43:46 -0800 (PST)
In-Reply-To: <20180123035837.16578-7-f4bug@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-7-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 31 Jan 2018 08:43:46 -0800
X-Google-Sender-Auth: AykTb_FC8EftFPa9cTxYgjFRe0o
Message-ID: <CAKmqyKNhLMwuHh=zMVH=hKT4S7CraiEVvoh4btKQuteGLhAwcA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/sd: move sdcard
 legacy API to "hw/sd/sdcard_legacy.h"
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
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Md8Q3TnGmxLo

On Mon, Jan 22, 2018 at 7:58 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> roughly 2 users left.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/sd/sd.h            | 17 ---------------
>  include/hw/sd/sdcard_legacy.h | 51 +++++++++++++++++++++++++++++++++++++=
++++++
>  hw/sd/omap_mmc.c              |  2 +-
>  hw/sd/pl181.c                 |  1 +
>  hw/sd/sd.c                    |  1 +
>  5 files changed, 54 insertions(+), 18 deletions(-)
>  create mode 100644 include/hw/sd/sdcard_legacy.h
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 9bdb3c9285..74bfab9386 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -130,23 +130,6 @@ typedef struct {
>      void (*set_readonly)(DeviceState *dev, bool readonly);
>  } SDBusClass;
>
> -/* Legacy functions to be used only by non-qdevified callers */
> -SDState *sd_init(BlockBackend *bs, bool is_spi);
> -int sd_do_command(SDState *sd, SDRequest *req,
> -                  uint8_t *response);
> -void sd_write_data(SDState *sd, uint8_t value);
> -uint8_t sd_read_data(SDState *sd);
> -void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
> -bool sd_data_ready(SDState *sd);
> -/* sd_enable should not be used -- it is only used on the nseries boards=
,
> - * where it is part of a broken implementation of the MMC card slot swit=
ch
> - * (there should be two card slots which are multiplexed to a single MMC
> - * controller, but instead we model it with one card and controller and
> - * disable the card when the second slot is selected, so it looks like t=
he
> - * second slot is always empty).
> - */
> -void sd_enable(SDState *sd, bool enable);
> -
>  /* Functions to be used by qdevified callers (working via
>   * an SDBus rather than directly with SDState)
>   */
> diff --git a/include/hw/sd/sdcard_legacy.h b/include/hw/sd/sdcard_legacy.=
h
> new file mode 100644
> index 0000000000..882e13a8f1
> --- /dev/null
> +++ b/include/hw/sd/sdcard_legacy.h
> @@ -0,0 +1,51 @@
> +/*
> + * SD Memory Card emulation (deprecated legacy API)
> + *
> + * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in
> + *    the documentation and/or other materials provided with the
> + *    distribution.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> + * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> + * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> + * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> + * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> + * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
> + * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +#ifndef HW_SDCARD_LEGACY_H
> +#define HW_SDCARD_LEGACY_H
> +
> +#include "hw/sd/sd.h"
> +
> +/* Legacy functions to be used only by non-qdevified callers */
> +SDState *sd_init(BlockBackend *blk, bool is_spi);
> +int sd_do_command(SDState *card, SDRequest *request, uint8_t *response);
> +void sd_write_data(SDState *card, uint8_t value);
> +uint8_t sd_read_data(SDState *card);
> +void sd_set_cb(SDState *card, qemu_irq readonly, qemu_irq insert);
> +bool sd_data_ready(SDState *card);
> +
> +/* sd_enable should not be used -- it is only used on the nseries boards=
,
> + * where it is part of a broken implementation of the MMC card slot swit=
ch
> + * (there should be two card slots which are multiplexed to a single MMC
> + * controller, but instead we model it with one card and controller and
> + * disable the card when the second slot is selected, so it looks like t=
he
> + * second slot is always empty).
> + */
> +void sd_enable(SDState *card, bool enable);
> +
> +#endif /* HW_SDCARD_LEGACY_H */
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index 5b47cadf11..be14ac4f40 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -19,7 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/arm/omap.h"
> -#include "hw/sd/sd.h"
> +#include "hw/sd/sdcard_legacy.h"
>
>  struct omap_mmc_s {
>      qemu_irq irq;
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index ce696c5d7d..7591d016cd 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -12,6 +12,7 @@
>  #include "sysemu/blockdev.h"
>  #include "hw/sysbus.h"
>  #include "hw/sd/sd.h"
> +#include "hw/sd/sdcard_legacy.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 9880a5d090..6942aa4df3 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -35,6 +35,7 @@
>  #include "hw/registerfields.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
> +#include "hw/sd/sdcard_legacy.h"
>  #include "qapi/error.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/cutils.h"
> --
> 2.15.1
>
>
