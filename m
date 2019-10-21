Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5082860wrm;
        Mon, 21 Oct 2019 13:52:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytiimbTkSw8BYe1Dt8E7QKy5cE3qAG4Vpx8AzQ3mKmDg6W01LBDl4zSsWGslcZDZaG6j3u
X-Received: by 2002:aed:3b54:: with SMTP id q20mr26644173qte.151.1571691155446;
        Mon, 21 Oct 2019 13:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691155; cv=none;
        d=google.com; s=arc-20160816;
        b=AUvWyrYW6tKIIhm8cdHhOdEWZCDjumEp9AXxer1DksTBAY3vamyflTbD9ACepnu2wo
         PFQXSBNHB7lCcv0Y8vvZYpFzLk1g3qq/p0RxpLWVZ9ZKEZmpN+xeq2H2JpUkqAMl7jk7
         uQi4/h2N4TEKztgrVWk1RSNTFEfPogttXfIpFdQhMqSpHrQhBM1rD7MtRZVlI1hv5Re+
         OT8X7k7WuD9mVR6DTEH42MZGl3vZ7O7sMvKr87HbDXHL0QHB4NP70s5fL6LbG0C1IG4h
         5bNBSgL6X1Fw8Zc2FA/haNnZoLwRjiEkql4zsuwUFE4eNuAifcVjQTqdrPIq7TGckQCu
         o23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KrhRfwiS41Hw/oEUjcvgsIMHQ+z/35x3gIw8/+L5IFU=;
        b=ie5q9njYkzumSNTlDRJthSb5AsmqSc2bmj7s//sMqqKFAXzp0bwQ5wtafAV6EDFhi2
         uamp4gPuX47J9j5/FGLJNi1m1fXsZhLy4YV6xKZlLk+areB3oz5ioISp6wjdFPsUqsmU
         duP8VRmrDDKdbmOJ5Bfsh0cBwRq4EwR2GzVKszG/nS6nmaSXm9NUXE/zvTBb0stZ9inm
         kDAwvuPX9X3e3MJylN6CHwAaISecownCZWbHk+lzAq5TgUduRvA8gtNyqoJ3PT/Pj6uh
         8LOG6k3bJBA25arUf3eF35rdueEc7rNxi4lvlRPqs2KKXVeokMdUci2z4O5RliQeQVf0
         nwsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ENGoBSA5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si13719178qkf.367.2019.10.21.13.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 13:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ENGoBSA5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMefK-0006Is-JY
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 16:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMefB-0006Gn-NE
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMefA-00016O-NO
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:52:25 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMef7-00010X-Ak; Mon, 21 Oct 2019 16:52:21 -0400
Received: by mail-lj1-x242.google.com with SMTP id m13so14789962ljj.11;
 Mon, 21 Oct 2019 13:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KrhRfwiS41Hw/oEUjcvgsIMHQ+z/35x3gIw8/+L5IFU=;
 b=ENGoBSA5gZ4flA07YahWqS2CvhJN7bEkVitIWe+kzqqXWlAwuMr9IWBZubCnCOGwny
 /np8GcV2lOZq19Y8dUSxqAYTuuoDa1xPnST8yzUGMTRu7PGU+rRki007wB+6F0t7SSmb
 HzD+wq1o0W81G0RETCo9+0lNeoWPws10QROmL/qbWklgyl4aKFODCWhGoarmVIvDoU6I
 sRLhwbTXcC7ph46uqdLPLC4aoTofEIDDAjLcrSjTNsUB5VFKfEsBDp57cRlmtarwti6x
 IFR91p0ICv4BHfEpdfy/lOHbO0Lvlmb21JKMdFGASHe4LqtkZr5Gc/XA1vyo+LfeOl7S
 WUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KrhRfwiS41Hw/oEUjcvgsIMHQ+z/35x3gIw8/+L5IFU=;
 b=S5yJO1I0djJUkA4dU0AzCOX4AruBdrr/9j1OEtF3N/tInBeqwe/9WrxNVD8WLCcl10
 uQFpXCm+5rrpjKRB0xuUmhLkEOPh/142NVSEPfPCPL+O8dMvZH3JziFd/J/REEv5Oj6x
 cqwmGTJ5bZilNqPm7C93iG4kLv8wLzZdHBNixlTGbf20THW5HwVjqpQtFesatR6cOkWW
 DPFG0bp67Mp8mwQlzHU0QFGF3zRbBV+gdOwQSv8e+Jug5Vps+sGLEt+972fnC457xVQO
 6qe0vJSbBlPGuz8cbvNhN253m6dFTlns8+HQI2xYoG+lDR6UAGqQljJUgPTNa/mEYaNd
 woSg==
X-Gm-Message-State: APjAAAXroYfEO9gGCgev1kMMVLQn6HsC5mIPaeGuJUJYhBRrqj2GVSoW
 Xt10YMmPKgBRwZNnkTL1n+wzFZUJblpUmrAdYhM=
X-Received: by 2002:a2e:420a:: with SMTP id p10mr16782265lja.16.1571691138487; 
 Mon, 21 Oct 2019 13:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-2-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:47:02 -0700
Message-ID: <CAKmqyKN0AMExig+d-TFOA4J6iK+Kn9jcNvaayLBdcwdjbno6eg@mail.gmail.com>
Subject: Re: [PATCH 01/21] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Fabien Chouteau <chouteau@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMcctDTP/Uu1

On Sun, Oct 20, 2019 at 3:58 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index c14774e542..3a0fa5b23f 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -16,6 +16,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> @@ -194,7 +195,7 @@ static void zynq_init(MachineState *machine)
>      memory_region_add_subregion(address_space_mem, 0, ext_ram);
>
>      /* 256K of on-chip memory */
> -    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 << 10,
> +    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
>                             &error_fatal);
>      memory_region_add_subregion(address_space_mem, 0xFFFC0000, ocm_ram);
>
> --
> 2.21.0
>
>
