Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3155307wrt;
        Sun, 6 Jan 2019 23:10:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7AMuKLMvqGXPWF8Y+37t496S3umO8C1GJxwzw43fI9E1Fp2cEb/PCWAGosXx5N5QAbdlj9
X-Received: by 2002:adf:f052:: with SMTP id t18mr54148542wro.112.1546845030442;
        Sun, 06 Jan 2019 23:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546845030; cv=none;
        d=google.com; s=arc-20160816;
        b=q5I0gBNViiVgyXJh5QlT5fP0AWHKe1UCpTLn5maSfw6aNKulXuXoXT1tG9oT/KxS97
         +dz230uxL8+kt1GlAEm/H8aJoepYcY8LFl7Y1qQ3oMjWrrojKNk+oAQ1mQ4RLTOPz4Kz
         yNC+ubMQd21YWQYzajKyZ8ttc45AUM1LXJJeUf6jj7tXSfmkxTFEJybMPB6vD1QisGel
         pTLfd1hpQHT6EpMOWeBIdk6rvTo5ypzbxDPMjU9LVBrqY9qyqIV3Em5lH1dFMxwhy1y9
         p252Rg9HvXo91I3jkegYWU0gizcJxx2FYlZTvVBnveCXLpdX0n1mSytYuDVrhD8Uum4j
         ieIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=gfc8by3SJyj7aD8Dn9ooRdiSPPnWMfQiobKOp5TtGaI=;
        b=CFg/6h+GC8D/ySm8IdrlvEn5zldrlw9Xbcu5k6OKb+oPxF+1eH4oIt13S0uxpZgwD+
         BMFUrUX6aMk77WkDL8hZxHmrpaPmBQNmRW+OAeOSIf2OXBaw8J5rYftk6VSddF6IkSnm
         p7BvZ5sJyFZpdFaxaRcRM0Uhi0Kg/qqiLhrCBwfSdJAJqW3Cid9uRdO5IRdC8TTF/KVH
         XbixxqldvAGC4MBrRR/3BJi2oGf/uEwskIZt9RxFJgQtiLfqn3jbUDWLAbouDyqaOtvH
         kUKSY8VCEi5U1ykXek7zvl3Mlf9VascKhpQLmdD91wcw9OTvQMqLUxm8vvykf319W/sK
         n6SA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si5199365wrp.54.2019.01.06.23.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 23:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggP3N-0006TK-Eb
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 02:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggP3G-0006RH-9d
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggP34-0000qX-MX
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:10:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ggP34-0000ne-CV; Mon, 07 Jan 2019 02:10:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1654E8762D;
	Mon,  7 Jan 2019 07:10:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-133.ams2.redhat.com [10.36.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B08B60C44;
	Mon,  7 Jan 2019 07:00:24 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-7-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <9ac3a593-3053-ff83-0bb9-6089278774a5@redhat.com>
Date: Mon, 7 Jan 2019 08:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190104175847.6290-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 07 Jan 2019 07:10:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/16] hw/devices: Move CBus declarations
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
X-TUID: 0ZqOqHNefeeX

On 2019-01-04 18:58, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS            |  1 +
>  hw/arm/nseries.c       |  1 +
>  hw/misc/cbus.c         |  2 +-
>  include/hw/devices.h   | 14 --------------
>  include/hw/misc/cbus.h | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 34 insertions(+), 15 deletions(-)
>  create mode 100644 include/hw/misc/cbus.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 156ce9a698..63ed6636ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -641,6 +641,7 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/nseries.c
>  F: include/hw/display/blizzard.h
> +F: include/hw/misc/cbus.h

(note: I've added an entry for cbus.c here:
 https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00097.html
 you likely got to rebase this patch in case it hits master before
 your patch)

>  Palm
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 9521be1cef..ac876b5878 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -32,6 +32,7 @@
>  #include "hw/i2c/i2c.h"
>  #include "hw/devices.h"
>  #include "hw/display/blizzard.h"
> +#include "hw/misc/cbus.h"
>  #include "hw/block/flash.h"
>  #include "hw/hw.h"
>  #include "hw/bt.h"
> diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
> index 25e337ea77..16ee704bca 100644
> --- a/hw/misc/cbus.c
> +++ b/hw/misc/cbus.c
> @@ -23,7 +23,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
> -#include "hw/devices.h"
> +#include "hw/misc/cbus.h"
>  #include "sysemu/sysemu.h"
> =20
>  //#define DEBUG
> diff --git a/include/hw/devices.h b/include/hw/devices.h
> index 25f895b330..8b649541b1 100644
> --- a/include/hw/devices.h
> +++ b/include/hw/devices.h
> @@ -28,18 +28,4 @@ void tsc2005_set_transform(void *opaque, MouseTransf=
ormInfo *info);
>  /* stellaris_input.c */
>  void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
> =20
> -/* cbus.c */
> -typedef struct {
> -    qemu_irq clk;
> -    qemu_irq dat;
> -    qemu_irq sel;
> -} CBus;
> -CBus *cbus_init(qemu_irq dat_out);
> -void cbus_attach(CBus *bus, void *slave_opaque);
> -
> -void *retu_init(qemu_irq irq, int vilma);
> -void *tahvo_init(qemu_irq irq, int betty);
> -
> -void retu_key_event(void *retu, int state);
> -
>  #endif
> diff --git a/include/hw/misc/cbus.h b/include/hw/misc/cbus.h
> new file mode 100644
> index 0000000000..1ce1855ccf
> --- /dev/null
> +++ b/include/hw/misc/cbus.h
> @@ -0,0 +1,31 @@
> +/*
> + * CBUS three-pin bus and the Retu / Betty / Tahvo / Vilma / Avilma /
> + * Hinku / Vinku / Ahne / Pihi chips used in various Nokia platforms.
> + * Based on reverse-engineering of a linux driver.
> + *
> + * Copyright (C) 2008 Nokia Corporation
> + * Written by Andrzej Zaborowski <andrew@openedhand.com>

I'd drop the invalid e-mail address here, too, I think.

> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef HW_MISC_CBUS_H
> +#define HW_MISC_CBUS_H
> +
> +#include "hw/irq.h"
> +
> +typedef struct {
> +    qemu_irq clk;
> +    qemu_irq dat;
> +    qemu_irq sel;
> +} CBus;
> +
> +CBus *cbus_init(qemu_irq dat_out);
> +void cbus_attach(CBus *bus, void *slave_opaque);
> +
> +void *retu_init(qemu_irq irq, int vilma);
> +void *tahvo_init(qemu_irq irq, int betty);
> +
> +void retu_key_event(void *retu, int state);
> +
> +#endif
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>
