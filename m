Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3168204wrt;
        Sun, 6 Jan 2019 23:30:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5UT5jnLEIbqng0wovTfRSrWeu/qYkI74cyROBHCD/StdJmBJilg+7yVrsbGse874b6YdFR
X-Received: by 2002:a1c:d74a:: with SMTP id o71mr7880529wmg.73.1546846229106;
        Sun, 06 Jan 2019 23:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546846229; cv=none;
        d=google.com; s=arc-20160816;
        b=GLYJLqjh7VYZxjsBfK/41dw3vCKLYPM47cuzrsA8woBrzOMRM4pNr1JvBJT+gH/Ign
         TI2NyvpXEibM7kCP55X8OnGP+W9psZzp35GqZ8Jx/GJbUClNMa3WhTVZ5P3e9F+r/klj
         xPoxagve0+k/byMySpYbkQ+1HkVBPktTCZdd5bo//+PYtOHmY8mKKpcdVPHvye5PFpH1
         A+tnMkUm7JWie7KQqJfQ8hLb1ZD6uFlf4p1eYCx2uX5U1wc8ijGOYaJ+zBGhxqWyilAE
         rQ+Ie9Nw2SNV9egcpLBBC9oiihqgdGeyxHM/a0Ih3rSflCZZRmZ6Tjuab0nNec9jdpqa
         W1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=vc9rsHYG8QowqNsl6WXd+KxWKS8YL2/x4dPz50sRrGE=;
        b=jYkKoiAsJiqjF34Uhi0xolSnPlJz0MdB94AKP9m7UEKPrG/NUbExXI3dd4sZP9NLG4
         sebI8me0M5jAOpEsUIkLNqhuAq6MXsCbeQFBQsLQlTa1TK58EREFyvediFXzw+gnnSBY
         9I72KSA0Hbs4PabvAcBTbap0HVX2WDu17pP8CfLZO+mc40C+GqpMEIO+0hZhGyYakYBY
         hROr7Ox0kykOkPpehY2GDGqWYkcMX5JtfHxqZjFe2EDmftyvrti9BeV7an/6/Gi4pOwf
         wbhvet5FrR8usn+2KvYubJ5ynvo/c159bAmiKNVoS1fa9KWhqKxPWD5AVq8+Cot6/YQ7
         O2Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si35471267wrn.344.2019.01.06.23.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 23:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPMi-0003iZ-4B
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 02:30:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggPMZ-0003h8-QH
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:30:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ggPMY-0002Aa-Sx
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:30:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ggPMY-0002AG-L1; Mon, 07 Jan 2019 02:30:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 514D537EEA;
	Mon,  7 Jan 2019 07:30:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-133.ams2.redhat.com [10.36.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56ACD100164A;
	Mon,  7 Jan 2019 07:29:59 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-13-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <222c7009-e950-c27d-89a1-674ada91b1e2@redhat.com>
Date: Mon, 7 Jan 2019 08:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190104175847.6290-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 07 Jan 2019 07:30:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 12/16] hw/devices: Move LAN9118 declarations
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
X-TUID: Rw+/OIx1oPoz

On 2019-01-04 18:58, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/kzm.c             |  2 +-
>  hw/arm/mps2.c            |  2 +-
>  hw/arm/realview.c        |  1 +
>  hw/arm/vexpress.c        |  2 +-
>  hw/net/lan9118.c         |  2 +-
>  include/hw/devices.h     |  3 ---
>  include/hw/net/lan9118.h | 21 +++++++++++++++++++++
>  7 files changed, 26 insertions(+), 7 deletions(-)
>  create mode 100644 include/hw/net/lan9118.h
>=20
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index 864c7bd411..139934c4ec 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -22,7 +22,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
>  #include "net/net.h"
> -#include "hw/devices.h"
> +#include "hw/net/lan9118.h"
>  #include "hw/char/serial.h"
>  #include "sysemu/qtest.h"
> =20
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index e3d698ba6c..54b7395849 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -36,7 +36,7 @@
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "hw/misc/mps2-scc.h"
> -#include "hw/devices.h"
> +#include "hw/net/lan9118.h"
>  #include "net/net.h"
> =20
>  typedef enum MPS2FPGAType {
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 242f5a87b6..e9983c8763 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -15,6 +15,7 @@
>  #include "hw/arm/arm.h"
>  #include "hw/arm/primecell.h"
>  #include "hw/devices.h"
> +#include "hw/net/lan9118.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index c02d18ee61..12e2c3986f 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -28,7 +28,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
>  #include "hw/arm/primecell.h"
> -#include "hw/devices.h"
> +#include "hw/net/lan9118.h"
>  #include "hw/i2c/i2c.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index a6269d9463..a428b16eda 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -14,7 +14,7 @@
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "net/eth.h"
> -#include "hw/devices.h"
> +#include "hw/net/lan9118.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/ptimer.h"
>  #include "qemu/log.h"
> diff --git a/include/hw/devices.h b/include/hw/devices.h
> index ba9034050b..ebc45c8799 100644
> --- a/include/hw/devices.h
> +++ b/include/hw/devices.h
> @@ -8,7 +8,4 @@
>  /* smc91c111.c */
>  void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
> =20
> -/* lan9118.c */
> -void lan9118_init(NICInfo *, uint32_t, qemu_irq);
> -
>  #endif
> diff --git a/include/hw/net/lan9118.h b/include/hw/net/lan9118.h
> new file mode 100644
> index 0000000000..340d6681b7
> --- /dev/null
> +++ b/include/hw/net/lan9118.h
> @@ -0,0 +1,21 @@
> +/*
> + * SMSC LAN9118 Ethernet interface emulation
> + *
> + * Copyright (c) 2009 CodeSourcery, LLC.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GNU GPL v2
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

Since your contribution here is after 2012 and the file content is also
just a trivial one-line prototype, please change the license code to say
GPLv2+ only right from the start. We should avoid these v2 + v2+
statements in new files.

> + */
> +
> +#ifndef HW_NET_LAN9118_H
> +#define HW_NET_LAN9118_H
> +
> +#include "hw/irq.h"
> +#include "net/net.h"
> +
> +void lan9118_init(NICInfo *, uint32_t, qemu_irq);
> +
> +#endif
>=20

 Thomas
