Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3611029wrx;
        Mon, 8 Apr 2019 07:59:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzH5Slw/r/LkVJbn7puTHeRd8L6X7L7l0rfgWaS1xSFdQ8fvjcUltx4wbHDiSq4XhqRWQV8
X-Received: by 2002:a1c:7008:: with SMTP id l8mr17713368wmc.49.1554735598367;
        Mon, 08 Apr 2019 07:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554735598; cv=none;
        d=google.com; s=arc-20160816;
        b=PgOGh2rxWUuZtgEJfFeP+6rgLHi5hbMice+OWr/MRKNoqeTqCnXDMTVcrpoGBwiUUx
         WaROQnsJ6/Lm/SSHEEQ0EGLRWfrjW6RNnd/JusuiGpcqfhGKoDsiH2rvjP1CYLcCn8I5
         bX/6t9Why4RFRIOOl6W7WxwWUxhYUMzwY+0Xdl+nmpVKONnSW/0xUPFXZxHi7+PEWjBo
         Qi52JJk/R2gc8zbnRjp3H4LjiH6fhRhcNTozym6/4yG/vzb88RVFwhlkvVoLFj/4v2+I
         wt9KUI/WGHf6+zUkgNQDlziR6oc3XQhwo4lpX9iM5YkPxlC/VpXwU45hYrTmF7h5fCH4
         pRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=WTgXzfaiMpmTKZEI4Maw09nrjPbX6BE0hCN7uGpYepI=;
        b=NSrJbYO9S6QDCk962CqdbSZjAs0zpE919gD/5287T6wDnqLIcIaWL0Ih/C9ESp8qwX
         7nlkWuSyd3o9fgImdpbZIEhp2MddVUQ0e1OYS4+hPvK8XUJ9W8gSgAPCIZXp2r3XL1qb
         WBDbybM3QYjwRuNrzvwOCYYemOxp5GiYcgt5jZLh0+babH/fGJyCgEDp2jLsMcqK0PoC
         iMWBFsyAziii46HuXeUI9SOsRq7yiFO3+sOJO9CPn7DEKCPXHc3eSTsyp2Rh67yAmHB1
         Lj9VMyO4KAbd5t0shygbH2Mb+Ca9zdbR8DqnXqRT0ZDwZIe8ytmsrlVlW0CUngjyfjQK
         hFMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si19637752wrv.55.2019.04.08.07.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 07:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDVkb-0000Dd-G5
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 10:59:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVij-0007D9-69
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:58:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVih-0006x7-6x
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:58:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDVif-0006uS-BK; Mon, 08 Apr 2019 10:57:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97996285A3;
	Mon,  8 Apr 2019 14:57:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 567305D71F;
	Mon,  8 Apr 2019 14:57:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B242C1138648; Mon,  8 Apr 2019 16:57:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-4-philmd@redhat.com>
Date: Mon, 08 Apr 2019 16:57:41 +0200
In-Reply-To: <20190204231815.29661-4-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:07
	+0100")
Message-ID: <87bm1go87u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 08 Apr 2019 14:57:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 03/11] hw/devices: Move
 TC6393XB declarations into a new header
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
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RREXJIxu+SOE

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The TC6393XB_RAM definition introduced in 64b40bc54a9 is no
> more used since a0b753dfd39. Remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
[...]
> diff --git a/include/hw/display/tc6393xb.h b/include/hw/display/tc6393xb.h
> new file mode 100644
> index 0000000000..387c143b44
> --- /dev/null
> +++ b/include/hw/display/tc6393xb.h
> @@ -0,0 +1,26 @@
> +/*
> + * Toshiba TC6393XB I/O Controller.
> + * Found in Sharp Zaurus SL-6000 (tosa) or some
> + * Toshiba e-Series PDAs.
> + *
> + * Copyright (c) 2007 Herv=C3=A9 Poussineau
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_DISPLAY_TC6393XB_H
> +#define HW_DISPLAY_TC6393XB_H
> +
> +#include "exec/memory.h"
> +#include "hw/irq.h"
> +
> +typedef struct TC6393xbState TC6393xbState;
> +
> +TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
> +                             uint32_t base, qemu_irq irq);
> +void tc6393xb_gpio_out_set(TC6393xbState *s, int line, qemu_irq handler);
> +qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);

These two are actually unused.  Just an observation; I don't think this
patch should do anything about it.

> +qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
> +
> +#endif
