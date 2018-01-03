Received: by 10.223.134.117 with SMTP id 50csp12416625wrw;
        Wed, 3 Jan 2018 13:58:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBou8RR+iWtX5Yj/tDe9BCqIx7nlrGFMajdR+NZ/EP+gkSVL7QlKo9v5hDA1QyY5WMDngfgDY
X-Received: by 10.37.45.3 with SMTP id t3mr2605495ybt.143.1515016732860;
        Wed, 03 Jan 2018 13:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515016732; cv=none;
        d=google.com; s=arc-20160816;
        b=XUcCm9h6KkdTnUKvNYZZuFmKkVRiIBXHRbenZnhLP8wViL8UbgDGYGigMcxpmBrqrw
         FQB5xfs+fh2sfcAI6cukjqKmcCnqAlFTCVPnNpz9G9SWeRgaiBFUKn+FJ5R+VPe9gJcS
         BALYDRTaFwwnWUV/2rl/KeKKG/RMzFuYSpK1B7t0Rk30ajMHrIz3sedDr21mqWRHDAFt
         Bt3flNo0Wzi3czAlCiJC8kRIjZJug4cHqNtGdu4I2cJL0xybFUEYUXt/66vObn5CCWsO
         amEF39qrAulvoHOCuX8xYjp/BIqHfUVYPQYMUz3LQ6izZLc5RMsvBM2IVfwe0kaqnhTb
         d91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=J2b2nxzTQhP2Ub3gtzZWBx7+jJgeCvJ/v2Nl82EaG7U=;
        b=B9XE4Lsmj5RQv+oFqQ8Lpp3eMUuY5Itvql4yWZGjdJxNm9ZWFk50gvF2hULXw+oojv
         4P1BC3gn2GjdAulv2JkdYxVHHvXlvmhYxG0HGvICzqIJ3MnnHCvKnysaLYxat9Skv+9/
         c4Sh6eCn6cLOQi3cbEyrCZc1h2r+EmdlKDRmyREozk2MofhWXSQuW9L/IHVGdY84Mbap
         lKrhxhs2QJGyinZRMT1Pzs+OWqonl3GHnBDbaGbcraMmvh7fG56KeERAOX1DPArurXF7
         ZadnRLFLnzzZlgdTEWNvmZZJqAGUAS3Xj6S6F3NLjnxKA+AbHFB5Z7vofREmWuaQZo6C
         AczA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LNC2cyLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si386844ywf.365.2018.01.03.13.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 13:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LNC2cyLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWr3k-0000xW-Bs
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 16:58:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWqyc-00042e-5w
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:53:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWqyb-00072Y-8C
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:53:34 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:37191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eWqyb-00071l-2b; Wed, 03 Jan 2018 16:53:33 -0500
Received: by mail-wr0-x243.google.com with SMTP id f8so3224653wre.4;
	Wed, 03 Jan 2018 13:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=J2b2nxzTQhP2Ub3gtzZWBx7+jJgeCvJ/v2Nl82EaG7U=;
	b=LNC2cyLKeWo+tMn/2RDq2MiSFAdZf5ZZOu8FsYVXncrkY1t2UOyH1pD/YXHrsRau0z
	VCL0/n1bPDvU9QXWejgjztrRiObqGEs5wIHjMqIps7N2wL9q+b6LIG92HLNEvjHyXelm
	2wKDkTMrsuKMq0TpPSvxbSUOZXP/k3Qv8Ihu9PvGfPTpYWnS3FoyB/HO8dbKIc1Lkf6h
	cOZPI4/U7KM8cqo80jZ/YhHhe9gPjUJnrHnj+Op7FGWbh/MjI+0YHF90btq/dXgLnaSf
	wsmD1tKU/ySWN7QSZuK30ZnDvPjrmfdp3/wqDHmPEe4d+61uAfudl+7QezX9D1HdBXdu
	Zfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=J2b2nxzTQhP2Ub3gtzZWBx7+jJgeCvJ/v2Nl82EaG7U=;
	b=OznCZFkTv2Nf9eQprf8fVah8IlIyw6EvifQeiiTBMqmM04vjzpX3QVS/5WdAwjSwn6
	Q5uVC/bRQue+RperFMjG1NeUD1WInxzvKbaZuIYquIkek+Y7oEWJ6PyV6Os9CIOvojr7
	tY6xGtkTsOUeNIQRE3rvlt562VjwmUfDk162DsbulLfn8tmHzHkMrVUXupRduDyLJKz+
	1PbUXApxrwVxLIm9Nrf8hKoU1yvIS4KK65FT2TXwFoETn9Wq54kAEOEhOK37WbLuEtd2
	rHnV6f16BBHvIk8h8e1bIqO5s2Emaa8l4lyFFT0prBvvBk040TcanHkJZZjOa7fHzanD
	GkIg==
X-Gm-Message-State: AKGB3mKlsZOLaAE1kQmNK7c7A8EEgZ+tZekCk9MO01xGh5QzxDiCyY3+
	ifQz8Y1ZdqcH8lC/JpBGxBxc2LEObOLddGtaDb8=
X-Received: by 10.223.160.77 with SMTP id l13mr2793740wrl.56.1515016412022;
	Wed, 03 Jan 2018 13:53:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Wed, 3 Jan 2018 13:53:01 -0800 (PST)
In-Reply-To: <20180103164117.11850-2-f4bug@amsat.org>
References: <20180103164117.11850-1-f4bug@amsat.org>
	<20180103164117.11850-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jan 2018 13:53:01 -0800
X-Google-Sender-Auth: RVrFu2yfVOeekrDLVmddUEG-Btg
Message-ID: <CAKmqyKM8mmx3g+6Qonr8NQTBi=YLk7KoGyAvzO_46j5VkZEBVA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/timer/pxa2xx_timer:
 replace hw_error() -> qemu_log_mask()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQlGKJv5m3lv

On Wed, Jan 3, 2018 at 8:41 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/pxa2xx_timer.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index 68ba5a70b3..cfea0a5e22 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -13,6 +13,7 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/arm/pxa.h"
>  #include "hw/sysbus.h"
> +#include "qemu/log.h"
>
>  #define OSMR0  0x00
>  #define OSMR1  0x04
> @@ -252,8 +253,12 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwad=
dr offset,
>      case OSNR:
>          return s->snapshot;
>      default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx
> +                      "\n", __func__, offset);
> +        break;
>      badreg:
> -        hw_error("pxa2xx_timer_read: Bad offset " REG_FMT "\n", offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_=
PRIx
> +                      "\n", __func__, offset);

It might just be my email display, but if these lines don't line up
can you fix them?

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>      }
>
>      return 0;
> @@ -377,8 +382,12 @@ static void pxa2xx_timer_write(void *opaque, hwaddr =
offset,
>          }
>          break;
>      default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx " "
> +                      "(value 0x%08" PRIx64 ")\n", __func__, offset, val=
ue);
> +        break;
>      badreg:
> -        hw_error("pxa2xx_timer_write: Bad offset " REG_FMT "\n", offset)=
;
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_=
PRIx " "
> +                      "(value 0x%08" PRIx64 ")\n", __func__, offset, val=
ue);
>      }
>  }
>
> --
> 2.15.1
>
>
