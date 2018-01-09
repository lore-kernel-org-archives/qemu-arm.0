Received: by 10.28.173.206 with SMTP id w197csp3509535wme;
        Tue, 9 Jan 2018 01:52:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBosQ9+vqbv7DN74mgqT1/Dq+BHUm+ayNYkgnCkt3OjY0vuSwFCvtF2en/sjqsH7J4bFbRpc8
X-Received: by 10.37.185.14 with SMTP id x14mr13465649ybj.343.1515491531205;
        Tue, 09 Jan 2018 01:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515491531; cv=none;
        d=google.com; s=arc-20160816;
        b=to78b+AAdQfy2PU8bEV3TPX18KdlqhgiPCvtN3mgwGb5SRRx80UlU58n9jHYrj0iqJ
         BhREFPrWS7JpZhueV18fcWBmYKQqVM3Kx3bPwkYf/SSDw6Nw8f4QJyZcMe8AiLYACUUL
         wZN4Zi6M2CT0koGhVUzSAyKzjYcTRyDxLFWau0DiUMUfSJMSA+D5POdBqk13ZRBfp10Z
         76tmd9HE3LfHzhPxRQrQXBQce78OVRB4zXcQLLPW94nCLcngEI46zonlpaQMCRfqpuL/
         F3pFG7b6S0fk+YZyj0LQhhN8QZFidbXIUDbdueZfIuL78rbctzjtP8XOsFl2o6V/1KQQ
         vMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=tpgY0R7jXVcZm72n72sfEDhWJFrG5xYv/dP8AkpZTzE=;
        b=J3/H2D/bRRRVxYA8+HmRvSZto+xIOm6migaMrnkaDRgwQA9B1uJqVv30JhViV96WWc
         JjFZCPDGFP/DmpH6iCeKwkPJheLSvV8+hCOSWaslzucUjUVy0xXb6KrbmUGsSP2+96HK
         GkOjjSxbjU8ufN1J45JxTM60qGkxGHFTCPQmby06eBkbkuCXSBlZIDpz6zXlcH0mwP8N
         p2agMIraj5iFixJo7I3HFrqGCET6+Vn9Y6pWu9LKY1E/MUovyBaE7xJ6rfPQeM6VCk5U
         /GEal8/lA3XavkRNsTRm1yrvBIOTR8V87vrkaKimHCODYBmpsRBsv/FxhfNLWzsIDG2X
         F21g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dNZ67c3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e198si159714yba.7.2018.01.09.01.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 01:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dNZ67c3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYqZm-00025r-Nd
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 04:52:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYqZW-00020i-MR
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 04:52:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYqZV-0002i7-ED
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 04:51:54 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:34945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYqZV-0002ga-8N
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 04:51:53 -0500
Received: by mail-ot0-x241.google.com with SMTP id q5so10860145oth.2
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 01:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tpgY0R7jXVcZm72n72sfEDhWJFrG5xYv/dP8AkpZTzE=;
	b=dNZ67c3k/z8RGWgkgeq5i+zreCNrrMx4j44Rj3Sfe3PPCItP7wRmEY/4G9QX0WfsX1
	lg8t8HJ7QSnZ/HwECGFLP9dO1pJOtcQKuM/g1vIdNrGTo++50Xv+ftBcBIv6Wdjbpp5X
	i0LQ1a2DHfP9Rb6OIrEJZMaV+ety5JvxMYiiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tpgY0R7jXVcZm72n72sfEDhWJFrG5xYv/dP8AkpZTzE=;
	b=QjOX0iBSXRg9x5tLrqbDEMzV42Jc+AHx99Jx/mdTBcUmCu13US89c4mkffYpLmiU/e
	xssPbnkuK/hMqX68KF5qYoorWS6eFMxavYaQ8AOciIXNErJoCc+My7qN8R6LyXQ184TW
	jCfLcfk+6JscXeRrGqxifmbRzNIfmxA9lL4fK1M8yM7mq9JYZDNtjh8vcCbsqqH3H/tz
	j+3sck2BlS9PskGYW5GSlhP1J7Doen5DpjQPeUsh9qmn1fGUx4Wd4LACBxUaNtZ5i902
	DVxMIX1LVdQfthuNJppLF2j1DmpDpyldACM4gExbUmqTNMMUHfmJ0lMjb8COM/5N5QiA
	hB+A==
X-Gm-Message-State: AKwxytdGRo5LgSLNz+8QRWvKiZ83rblQ/Uuwvl+iZ7Z3fUrPoYmrBLBb
	uKIYEDaQntfmPmO8zrnk+budShEStIznCka4VViKgQ==
X-Received: by 10.157.29.233 with SMTP id w38mr7390515otw.24.1515491512428;
	Tue, 09 Jan 2018 01:51:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 01:51:32 -0800 (PST)
In-Reply-To: <20180109020054.32553-10-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
	<20180109020054.32553-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 09:51:32 +0000
Message-ID: <CAFEAcA-v8ZgCLmd2NB=6P2r-ZwsozsDsuFDuAC7DrJxp=ADRCw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [RFC PATCH v2 9/9] hw/arm/xlnx-zynqmp: use Linux FDT
 names
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
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kh6XZ//vHdbu

On 9 January 2018 at 02:00, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/xlnx-zynqmp.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..fdcd6801b6 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -24,6 +24,7 @@
>  #include "exec/address-spaces.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> +#include "hw/sysbus-fdt.h"
>
>  #define GIC_NUM_SPI_INTR 160
>
> @@ -138,6 +139,7 @@ static void xlnx_zynqmp_init(Object *obj)
>      XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
>      int i;
>      int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> +    const char *type_name;
>
>      for (i =3D 0; i < num_apus; i++) {
>          object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
> @@ -150,12 +152,14 @@ static void xlnx_zynqmp_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
> -        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GE=
M);
> +        type_name =3D type_resolve_fdt_alias("cdns,zynqmp-gem");
> +        object_initialize(&s->gem[i], sizeof(s->gem[i]), type_name);
>          qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
>      }

I'm having difficulty seeing the benefits of this series. We spend
patches 1-8 adding code to devices to add alias names to them,
and this means that in patch 9 we can replace a single
object_initialize() with ... two lines of code including
a runtime lookup of an alias name. Can you explain why this
is better than what we have currently?

thanks
-- PMM
