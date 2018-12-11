Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp288872wrt;
        Mon, 10 Dec 2018 23:38:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XXZTuH1s6o8DQ2fLeD0jdNIEB5Empc8dCIDKbgK+Y3rpr8kTbfLrj2c2OP9Bm5I6Z3oTLX
X-Received: by 2002:ac8:164a:: with SMTP id x10mr15259941qtk.67.1544513899975;
        Mon, 10 Dec 2018 23:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544513899; cv=none;
        d=google.com; s=arc-20160816;
        b=eyjOGowgXhu5xRe8X5yVP8lzoTrK8uhcA1q3um3jZVFIyGSPUUKJ4rODBVZ0DAwIZR
         XwEKcZBt3hIAhMLFHbW11qxeRTLMNXeyYN63iRzFruC4P2sJhMTzy5mR7dpqFTT/updA
         P0/jJ40ZBSwJJaWxlvr1aoYxJlnl7FDkFmNs9hkowA0D/Hxmb6xk7BVePGtQBJkOLL8H
         pure6D8pLJFBWrMHFvZgRk5iCnrdwQcjmCVGsHHgK/+Qh0fzjq/Ook7BVCFaGWjiWQje
         iQ9FWOCEY1UdZj999x2iBZoYJktidBaHWQrAa9dSLZ8GQydGmfvySBOAJQgi3FZ9yQVI
         VS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WE+i/6rl7+OhROa7T2StBxzh0kvXPWsLe4MMGhanOO8=;
        b=W+vyU5YWrtxCB0qIsECg011bqn+5m+U8tXhw7qSDoHY54l7MZgdETEtHQCfZKhldaQ
         x+vVzR7rCND3pXtgz2ooK/bzupsLIxjPPxh8zM60VNGVIG4aresM4TbXGYwtQLYqzyLs
         E6W5x87CWcEmPWRM4LjMAAubU8LBmfRDgA6DSMkd9wHsh95ry8ZzDsgUDKZoULVNkW8+
         7lJWta11e4aUV+utiGEHWAmiWnJg+oRdPwSZ6Mid8cYQ8YwJbqilJUPiVEeKRw6X+BR/
         jNrywhlnmXb+mfg+cHNxolTd033KiVEKbly1wAdPRGQcZ5Bgiv3EkWEpeXUOEvVSHAW1
         Vn9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r15si504224qtj.56.2018.12.10.23.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 23:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWccV-0003Xk-GX
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 02:38:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gWccM-0003WO-Uc
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:38:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gWccJ-0005QW-Nw
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:38:10 -0500
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:49435)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gWccJ-0005Kd-66
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:38:07 -0500
Received: from player695.ha.ovh.net (unknown [10.109.160.232])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id D9EAD207A65
	for <qemu-arm@nongnu.org>; Tue, 11 Dec 2018 08:38:04 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id 55AE496E94D;
	Tue, 11 Dec 2018 07:38:00 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20181211031044.27628-1-joel@jms.id.au>
	<20181211031044.27628-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2c0685d1-f126-28cb-7d7b-28e140e735c7@kaod.org>
Date: Tue, 11 Dec 2018 08:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181211031044.27628-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7591943073897941824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrudegiedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: Re: [Qemu-arm] [PATCH 2/2] aspeed/scu: Implement power off register
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mpu1qJhuFuU2

On 12/11/18 4:10 AM, Joel Stanley wrote:
> This register does not exist in hardware. It is here to allow the guest
> code to cause Qemu to exit when required.
>=20
> The register address chosen is unused in the emulated machines
> datasheets.

yes. I checked also.=20

On the AST2600, 0x1A0 is now in the CPU scratch register range,
but I don't think this is problem.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.



>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_scu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c8217740efc1..aa17d032ba93 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "sysemu/sysemu.h"
>  #include "crypto/random.h"
>  #include "trace.h"
> =20
> @@ -84,6 +85,7 @@
>  #define SRAM_DECODE_BASE1    TO_REG(0x194)
>  #define SRAM_DECODE_BASE2    TO_REG(0x198)
>  #define BMC_REV              TO_REG(0x19C)
> +#define POWEROFF             TO_REG(0x1A0)
>  #define BMC_DEV_ID           TO_REG(0x1A4)
> =20
>  #define SCU_IO_REGION_SIZE 0x1000
> @@ -264,6 +266,9 @@ static void aspeed_scu_write(void *opaque, hwaddr o=
ffset, uint64_t data,
>          }
>          /* Avoid assignment below, we've handled everything */
>          return;
> +    case POWEROFF:
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        break;
>      case FREQ_CNTR_EVAL:
>      case VGA_SCRATCH1 ... VGA_SCRATCH8:
>      case RNG_DATA:
>=20

