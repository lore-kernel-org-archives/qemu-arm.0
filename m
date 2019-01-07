Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3135619wrt;
        Sun, 6 Jan 2019 22:39:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6jp7bID6tOJIBbSeNLi6MJS2kgk98mRtXfVWHvnawtqkpr+4S6InIdSXNX0xtynhgaP0sM
X-Received: by 2002:adf:e509:: with SMTP id j9mr54354636wrm.76.1546843181342;
        Sun, 06 Jan 2019 22:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546843181; cv=none;
        d=google.com; s=arc-20160816;
        b=oO/2pk18rr7DK5jT3M2qRN6rAIDD3WA2W/qU79aZLwZDepKZjjSAfKvEQiP3rnaV14
         0MEj2avWn75kZg7oYzsL9UbIYxqGz7bv0NlIsSo61ie9SJ7vYbnQOg2BN2DGWCQrkE41
         nA9QQmKVOHBUG+eT2rBucro3S1O3NZbBFHXEaCPrCWMqD3tSxuLzKYBamR482ZrZyk3l
         CGQ0fJ2uTbcZH0hZQozzUsQKafZb0a8utHXrvAjjpM7zS3tZa3nJEnH313mpOqASZlD2
         wnFJutsWN4GRR6slsnQb/ReEAaXK6gxrCho8+2uD4FIQmTvlOH7phPD8s/guH+XgbHY0
         GFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=wOpiNdhU8Ubv+Q3JVeNPHqmKTQOkXAxrSZKwJY50WXE=;
        b=GAgOESswqaW+aFJ5JdN8MVzCnCoqSTMOGGs1HL3gFP95blLqErb5d7/fsb180Lg9gN
         jlOLDstQ3tq9kJ2ht9Cf265n3+9O3twqgCOjat+2IOqVxKsa10o/HWLtKgd6jYz6keeq
         p4EpiLux1tdVDMoB++TRb7P7Jn6okTro8LzrfuZdKR5lXiboFvKpDQffWunlbjtCgo9V
         h9uzmyCMOumcYxWbonOHsm/zmSPSaF9hFK2bEvqhRRxC1L7GX5tUGQpB/RL/TOyNO5xB
         EgXKF6ilnLVLZSkC8Z3M6g2jyuhLI1SRzAj9bHQuquzLS3Q9cVbpsMktjpM0IQQkLrni
         fTyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si34785666wrx.293.2019.01.06.22.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 22:39:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggOZY-0000qo-Cv
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 01:39:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggOZQ-0000qc-HK
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 01:39:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggOZO-0006lR-EL
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 01:39:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ggOZM-0006H3-C1; Mon, 07 Jan 2019 01:39:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40E5537E85;
	Mon,  7 Jan 2019 06:39:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-133.ams2.redhat.com [10.36.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB477100194B;
	Mon,  7 Jan 2019 06:39:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <ddc16ba0-339e-2d6a-5771-f63f8f084b8c@redhat.com>
Date: Mon, 7 Jan 2019 07:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190104175847.6290-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 07 Jan 2019 06:39:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 05/16] hw/devices: Move Blizzard declarations
 into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KoOMOOILICwg

On 2019-01-04 18:58, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS                   |  1 +
>  hw/arm/nseries.c              |  1 +
>  hw/display/blizzard.c         |  2 +-
>  include/hw/devices.h          |  7 -------
>  include/hw/display/blizzard.h | 21 +++++++++++++++++++++
>  5 files changed, 24 insertions(+), 8 deletions(-)
>  create mode 100644 include/hw/display/blizzard.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dff4b98401..156ce9a698 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/nseries.c
> +F: include/hw/display/blizzard.h

While you're at it, also add an entry for hw/display/blizzard.c here?

>  Palm
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 906b7ca22d..9521be1cef 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -31,6 +31,7 @@
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/devices.h"
> +#include "hw/display/blizzard.h"
>  #include "hw/block/flash.h"
>  #include "hw/hw.h"
>  #include "hw/bt.h"
> diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
> index 291abe6fca..471bd0ed99 100644
> --- a/hw/display/blizzard.c
> +++ b/hw/display/blizzard.c
> @@ -21,7 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "ui/console.h"
> -#include "hw/devices.h"
> +#include "hw/display/blizzard.h"
>  #include "ui/pixel_ops.h"
> =20
>  typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int=
);
> diff --git a/include/hw/devices.h b/include/hw/devices.h
> index 5ad134232c..25f895b330 100644
> --- a/include/hw/devices.h
> +++ b/include/hw/devices.h
> @@ -28,13 +28,6 @@ void tsc2005_set_transform(void *opaque, MouseTransf=
ormInfo *info);
>  /* stellaris_input.c */
>  void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
> =20
> -/* blizzard.c */
> -void *s1d13745_init(qemu_irq gpio_int);
> -void s1d13745_write(void *opaque, int dc, uint16_t value);
> -void s1d13745_write_block(void *opaque, int dc,
> -                void *buf, size_t len, int pitch);
> -uint16_t s1d13745_read(void *opaque, int dc);
> -
>  /* cbus.c */
>  typedef struct {
>      qemu_irq clk;
> diff --git a/include/hw/display/blizzard.h b/include/hw/display/blizzar=
d.h
> new file mode 100644
> index 0000000000..8132557da1
> --- /dev/null
> +++ b/include/hw/display/blizzard.h
> @@ -0,0 +1,21 @@
> +/*
> + * Epson S1D13744/S1D13745 (Blizzard/Hailstorm/Tornado) LCD/TV control=
ler.
> + *
> + * Copyright (C) 2008 Nokia Corporation
> + * Written by Andrzej Zaborowski <andrew@openedhand.com>

I don't think that this e-mail address is still valid since that company
has been bought up > 10 years ago... so it likely does not make sense to
mention it in new files anymore. So just mention the name?

> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef HW_DISPLAY_BLIZZARD_H
> +#define HW_DISPLAY_BLIZZARD_H
> +
> +#include "hw/irq.h"
> +
> +void *s1d13745_init(qemu_irq gpio_int);
> +void s1d13745_write(void *opaque, int dc, uint16_t value);
> +void s1d13745_write_block(void *opaque, int dc,
> +                          void *buf, size_t len, int pitch);
> +uint16_t s1d13745_read(void *opaque, int dc);
> +
> +#endif
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>
