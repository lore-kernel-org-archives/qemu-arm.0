Received: by 10.223.159.82 with SMTP id f18csp562669wrg;
        Wed, 22 Nov 2017 11:26:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZcc84QauRb/b+Ney6U7bJOOPjxNpMgwmiwzfcmPQHPXKdaMs06dLfN+M8yLcM56zBm+RyP
X-Received: by 10.129.115.135 with SMTP id o129mr10009738ywc.109.1511378772191;
        Wed, 22 Nov 2017 11:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511378772; cv=none;
        d=google.com; s=arc-20160816;
        b=rJtg06daGH2jJdquwyVkRttVnxiIZFDBI9JZE7dMW6Sv68Z8keU2ynRsGKJBBEa3UI
         b8c/h1W2+kY5XEdHaGzWBCeOqx8zoexmv2YtM+vtcJEVDWaBw3Evc57P7VrTLV34VRgi
         09w6NN3EfzQKoHqWLl/K8gtuWuYPGvOQ1HB4jkTZKd76/10wbjobs8cn5Psg1KUiwbKo
         9oCPvnRC/8sH8CViJ0OqFX1uiBB9iK/yODgVaqP6L70yugweZlwVOJayhBZAKogq/VnT
         FRd+d1ZAIstZ+QbiCrwQ3zq4fBr9VrGEzzm+F7Qr7oRh1v8OIGcJTdEdg2KxzkPcJCZ+
         2KOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=i4gHE+omPSeTyLOFk1mtDq4SMwCarEIOhDeq/5yWMec=;
        b=e1E8v57jdPnhGCPdg4dWdTa7A7sHi4RtvL7GGjh5JE/cx47d5KlJfErMIYoKcVKjmq
         Gh50fGv0v7pdI9pSpCpkoAw0wyEsF9px8xUwZyweEL5OJtL54rZ0Yo1n0Zf/0mhySYJ4
         WZr4iJjViCB0xt4b0+C6XNLJJ+b+Tj+wZ4bmawdgW/etjFeE+1GSWYAYM8A9P2L7/uWP
         OnyIp3+zhHMHr/OISs47b9oHhcMs7UArT8XoTK/8u4/d/6xi2fcNNCmCW5A1VmceTnzp
         qmzwaSdghJ/hXHB5P6Q8uDyrQBX4vNLI0aoCe+7JxqpEPK/WD7w37aHT8MBhDqSsQQMP
         dkFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpwLmM4V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si3646153ywe.201.2017.11.22.11.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 11:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpwLmM4V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHaex-00034E-JI
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 14:26:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHadU-0002KY-7V
	for qemu-devel@nongnu.org; Wed, 22 Nov 2017 14:24:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHadS-0003m6-VZ
	for qemu-devel@nongnu.org; Wed, 22 Nov 2017 14:24:40 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHadP-0003l9-Rm; Wed, 22 Nov 2017 14:24:35 -0500
Received: by mail-qt0-x244.google.com with SMTP id q13so13743869qtb.5;
	Wed, 22 Nov 2017 11:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i4gHE+omPSeTyLOFk1mtDq4SMwCarEIOhDeq/5yWMec=;
	b=cpwLmM4Vu1vW8bq3Hs5QAPHD1iz1G4sxIEDmm0zrzQYHzWZqwO+jnplmqvPI/ihijZ
	rwuRIVlMcWpTY82CUsY0KxjWk0whvCXHqK0Lx8lJaG7mo1h1U3q24gURrQdFzO0Q9M3x
	8r6TAXLaFtWjpOVEx1m62ehQl0TjW80gzYi54tlGMMiJGaJFpX7sJ3/ux4coLDNIDuZp
	Kf7FB3RR+R41ibVjs2Hd1UpxoUoWhPAqoTpQcJskKcvFvIYNEyaqerfo3deDBErVw2hH
	+16+mgek4RVQ0jQIxczJt4DUAHz4XFn1ICjIQO46bz9RfZ/IRNJhdD6/vwQmRWtiHTnd
	etBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i4gHE+omPSeTyLOFk1mtDq4SMwCarEIOhDeq/5yWMec=;
	b=ACwHUdQoC9Md0QrUj843EaOOyVMiCgTWfxL8KlrISD8IUXHlolTLTVEJBm10i41EW6
	lyUDgivWTEswzlk9rJFQGzO8P++0FhnF3RsXUB6CRSfNHpKfIlX4bGQR3oq9PfKJq6Du
	xNu8fYqcDY2WaA2H608q3CqMrxdfHTyPkuWcBhxR9q9k9vSXCe0wL/Ot7iKmXgf2eWkx
	hOAgkfkTKoJ1SOdtpi0TvlrNkONtLEfhlXLeAbySDo3qu8S4f6en56TIuyrJv5a0ugKR
	6b04t99Kk+L6D15Y4wA8IHUDqQS1zVub2risrjD+OyPGeWiUOjfkOZmn7pE7FHyPRKX8
	RLvA==
X-Gm-Message-State: AJaThX5AzXGO1KZagWRGGq8Y4oLVnaf64vHHC/JLFXrIJayWLascf1Qg
	IGLUjIMY1ZpeLNSfwwq8hlAwBQ/PqS5Vz1PNc+Y=
X-Received: by 10.237.62.5 with SMTP id l5mr34420232qtf.299.1511378675009;
	Wed, 22 Nov 2017 11:24:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 11:24:34 -0800 (PST)
In-Reply-To: <CAFEAcA8WbQobHPT8jZy6bnR9_wtmZ0ogJmmWo13_-StuDxXUWw@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-31-andrew.smirnov@gmail.com>
	<CAFEAcA8WbQobHPT8jZy6bnR9_wtmZ0ogJmmWo13_-StuDxXUWw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 11:24:34 -0800
Message-ID: <CAHQ1cqFJ=qGaLtHAp4cDYW_XBqJC5BUwZtOZmrYR9NiVKuxKow@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH v3 30/30] Implement support for i.MX7 Sabre
 board
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5cK7DGd5pL9

On Tue, Nov 21, 2017 at 10:22 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:48, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Implement code needed to set up emulation of MCIMX7SABRE board from
>> NXP. For more info about the HW see:
>>
>> https://www.nxp.com/support/developer-resources/hardware-development-too=
ls/sabre-development-system/sabre-board-for-smart-devices-based-on-the-i.mx=
-7dual-applications-processors:MCIMX7SABRE
>
> You could put this URL in a comment in the code as well.
>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/arm/Makefile.objs   |   2 +-
>>  hw/arm/mcimx7d-sabre.c | 101 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 102 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/mcimx7d-sabre.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index f379ddc74b..eb6f6c5997 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -19,5 +19,5 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>>  obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>>  obj-$(CONFIG_MPS2) +=3D mps2.o
>> -obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o
>> +obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o mcimx7d-sabre.o
>>
>> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
>> new file mode 100644
>> index 0000000000..7ca8e668e8
>> --- /dev/null
>> +++ b/hw/arm/mcimx7d-sabre.c
>> @@ -0,0 +1,101 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * MCIMX7D_SABRE Board System emulation.
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This code is licensed under the GPL, version 2 or later.
>> + * See the file `COPYING' in the top level directory.
>> + *
>> + * It (partially) emulates a mcimx7d_sabre board, with a Freescale
>> + * i.MX7 SoC
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "hw/arm/fsl-imx7.h"
>> +#include "hw/boards.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/device_tree.h"
>> +#include "qemu/error-report.h"
>> +#include "sysemu/qtest.h"
>> +#include "net/net.h"
>> +
>> +typedef struct {
>> +    FslIMX7State soc;
>> +    MemoryRegion ram;
>> +} MCIMX7Sabre;
>> +
>> +static void mcimx7d_add_psci_node(const struct arm_boot_info *boot_info=
,
>> +                                  void *fdt)
>> +{
>> +    const char comp[] =3D "arm,psci-0.2\0arm,psci";
>> +
>> +    qemu_fdt_add_subnode(fdt, "/psci");
>> +    qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>> +    qemu_fdt_setprop_string(fdt, "/psci", "method", "smc");
>> +}
>
> I'm still unconvinced by this (none of the other i.mx boards we have
> have anything like it).

None of the other boards are both SMP capable and support SMP in
upstream Linux only through PSCI (as it the case for i.MX7), so
comparing against the precedent is not very helpful.

> How does the real hardware boot SMP ?
>

Real hardware executes a bootloader which is expected to implement
PSCI and do the DTB fixup as I implemented above.

Thanks,
Andrey Smirnov
