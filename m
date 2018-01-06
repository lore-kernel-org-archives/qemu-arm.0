Received: by 10.28.173.206 with SMTP id w197csp5881wme;
        Fri, 5 Jan 2018 18:28:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBosRgYVrLC2+ijO/raxtOU09H7ZSD9tQQ4RB+j12dliDxzX/VOblFnicRHoVmRPNurAXRMjh
X-Received: by 10.13.204.77 with SMTP id o74mr4552670ywd.311.1515205720791;
        Fri, 05 Jan 2018 18:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205720; cv=none;
        d=google.com; s=arc-20160816;
        b=c8FhPyhN/xahxhgt4qTsDXL4l/bUG4djYexGNVl44zKQwjdZg9U6vQPVaY5AK0P2cJ
         y6khy///AYXf7YZaXEVOYSNkMK7vyr6SMTfWaH0a9/KrIdWX1e33RPip1LAT8qJv4TmZ
         Xkgum/oLtMKmi9NgTnQI3kc05pJdb5ZoxsQco5NaBnposTgbtqIsF7YJgZzzzjHJ6v4P
         URDVth0j+jXinpBQNn/jIbo30gWy1hl+aE9O57PCgbmC9bRsil2K1BA0o/AfFrddTL2s
         XrIXYGWLFD21xf9q5kew1uvolawDjt8Wi0F24xzTrErh3x0y9eeSPkrjlZRXqQ2OWbxj
         /Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=zQeHxUBdNgT3JjJjKZ9QVkEhh+zGDem/jIUKRI5fcJQ=;
        b=Pv2KwvtEcI/VVZhQL26Ze+B4KjubIDrueCF7NVlY/14PCJQnpXe4ARoOzjIafVHbif
         Z8GENqvlP0iN6A3GZd+D1bLjjZfYhc+Lp5JjooB3NHX4gmpAxPYeuYLPDEwErJ+hgyQQ
         vVYhLS+wjGKPKm84kpGaUpL+LssKaFTyW+j5JNEQOaM2SpCTjqQqJI6gFwRhMrzhEYIi
         V6BAvrK50vRZr64/56PYiwIh9h/GMgAh/vLTPxcGFvDwqt8bvQ6V2J8F1vyXhbZ07Cm1
         N9cFXFMUqHaLVT/B5RwkI9+Y5a9OT6zUTdSTitH+QF/7ZbOHKrsmfftx6W02yUV8BVcw
         rmRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpA3Mpgp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si1438004ywc.145.2018.01.05.18.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:28:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpA3Mpgp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXeDw-0004N1-8I
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:28:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXeCf-0003VY-IV
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:27:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXeCe-0001yX-AJ
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:27:21 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:37912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXeCa-0001sM-Hv; Fri, 05 Jan 2018 21:27:16 -0500
Received: by mail-wr0-x243.google.com with SMTP id o24so364563wra.5;
	Fri, 05 Jan 2018 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=zQeHxUBdNgT3JjJjKZ9QVkEhh+zGDem/jIUKRI5fcJQ=;
	b=cpA3Mpgp7Hv0sJsQM7Ne4ATSPhN9u+YIkbtumteGRHYI0fEYUFFT8bfl3hWhNPxHUS
	UGb1iUT6yyOBnGQ4vPFpet38Plqh0/q92f/jKvRzXvNEH3I+Hyj046+tPt82BSyNRaSK
	QOdAnvGtEyOn5/IRCEi+/cUvcYBQu0li6AkqO8Wud1wuHKdtbLT5Ud3/iiwMRpvfO9FX
	nlmUQT/b47JLMBFW1IH/MiV0Pb4qc0aroWfB4ozAsEBfhiCNu5MZTzFw0L/qXElIbAS2
	ahRBbMKPeQPnf0nJJsHa0FOc4YoWVEsMV9BH+d+M6TCy/riO/HBRgTrLHtffTvGD/S9M
	T1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=zQeHxUBdNgT3JjJjKZ9QVkEhh+zGDem/jIUKRI5fcJQ=;
	b=uDUFV5uFzweMJoCdZjk//5wA1qeUFZt4yIMAnPOwsyMZd8SB9B2NYr8Du3b0qXQVBM
	7ZwYVlZccyYNW8Lmscnie+/r/wQ+R6NBokP/E4foR2A1EQqEfkSOi/SMNYYhtOKICNV5
	2u3Dkn6rwNt6OhHLw+3xIQXJZZlk4bt+2DuisS+FeNmXrIQE9Is1rWNDgiQoC+lQHge8
	cWiLq03rVLpOb72lujLbq6xcfXVYOEdKSXbABEo2f/qFdAIZtoM4wm6Ut6C24SDK4YP3
	isHZKZtYy/Zzz6m9oDcfbJSTX7TN7VCVaMTl41OACayNh1ctjLFvb/nvAyviLB/5Oa3E
	UMgA==
X-Gm-Message-State: AKGB3mLo6aS71gnrrdFac+6C8aZZFLvji7vBxR1Zm1HRckmd+sEF28Yc
	olqIN/D6Sga74VZmugHcfcX/ob7BqxgplG6qaIc=
X-Received: by 10.223.151.15 with SMTP id r15mr3929370wrb.219.1515205635334;
	Fri, 05 Jan 2018 18:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:26:44 -0800 (PST)
In-Reply-To: <20180103162400.10396-7-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-7-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:26:44 -0800
X-Google-Sender-Auth: tknOlZSG2C21774LK1S-HhQtQ5A
Message-ID: <CAKmqyKPkSe-F_Q0hC_L7LWgu9qmEFj+t8Pwix1+bSCRcLv-BPA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-devel] [PATCH 6/6] hw/sd: move sdcard legacy API to
 "hw/sd/sdcard_legacy.h"
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
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNOXtPjb03SA

On Wed, Jan 3, 2018 at 8:24 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> roughly 2 users left.

Exciting!

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair


>
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
> index 96caefe373..a342e7bc3e 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -114,23 +114,6 @@ typedef struct {
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
> index e934cd3656..9cfdc7a6ad 100644
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
> index 35347a5bbc..7755bedfa0 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -34,6 +34,7 @@
>  #include "hw/hw.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
> +#include "hw/sd/sdcard_legacy.h"
>  #include "qapi/error.h"
>  #include "qemu/bitmap.h"
>  #include "hw/qdev-properties.h"
> --
> 2.15.1
>
>
