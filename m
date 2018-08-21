Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1561578wrd;
        Mon, 20 Aug 2018 23:46:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyvJlwi21tCQoP8hebwWs3aTtLC1u53CBjW7P9h1HowqS9OWt9mafktGJfpBsEmqfV0aE4O
X-Received: by 2002:aed:3baf:: with SMTP id r44-v6mr16263458qte.77.1534833997101;
        Mon, 20 Aug 2018 23:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534833997; cv=none;
        d=google.com; s=arc-20160816;
        b=nr/Oa2fjWAs8XWjBmzXNwE+yZU0mWzEyz0U+d4JjG1fFbBzGMwtijOGoEJlvI6hOs/
         ib70Qt3A4wTuMoMJ4j2fnCOnJOd+flyfIm+d5TvctLuVueF/IGEqO3Z7uT/Otjcehvp/
         S0P3NJrr4EsGmTtjffFYd92HEs8pz8iqjoopLWMTJBDY/UJnUASCnY2vSyTvS93heCzs
         EOmxcE4DCSAqMaI9m8UKRvXpp07+vynN7ZPRKFrWqqBtjNxK/Df4dXUNTOc58EH3o7bq
         WeUESLEzma3/iQsMjsy3tQZf5Zm0f8KsK9qmtR6DpvG30/nDhTk7Bn++XWKt9Ll5DRCM
         0Aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ypr4mKDU3/aN/yfANvBNmaYC0Hhs6UR+ZNzhlTLz90M=;
        b=kC/PJ+yLJpKoYrnChYDANpfkVxTX88QZcq+zXGJWVrKxfAxpW7N+IlWaSs+t9A4yVa
         yx2V65zQlsRCphrRu8VAR+adkJh6mbcAynlOJClo5y4SZfC+z12ejPbalkbljPl1fLfG
         /17WZI1tu6lsarZeOeuSoK4ypxbQmSba67LTK3PAZFYPFnzSl7TpmJlUCAamVFGi5+xr
         eIUHdgIJfjdilkVfnbSfCYudY8lXo8RqTPZ57C4D7OMUSXtkKhJYSWWtldHcp+3E4wqe
         aDHSiEtuajUwuQeO9RRplay6tCNzM37b7H7aqE/8uAfsYiOjhFldWztf4/lrhAh/xZ5v
         R/hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jEAuY/yI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d63-v6si10140198qva.170.2018.08.20.23.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jEAuY/yI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0R2-0005y1-F6
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0M1-0001sH-MT
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0Lx-0000yR-N6
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:41:25 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:44420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0Lx-0000y7-Fw; Tue, 21 Aug 2018 02:41:21 -0400
Received: by mail-vk0-x244.google.com with SMTP id 125-v6so7716694vke.11;
	Mon, 20 Aug 2018 23:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ypr4mKDU3/aN/yfANvBNmaYC0Hhs6UR+ZNzhlTLz90M=;
	b=jEAuY/yIm2rer2l7dkgkuZyhJM+C+dfMSidJY1fjV01L1GXT3zUGiin3kd5hXcN7Ho
	Lx1oM4lDcD0MpJDnvAPtNTJlTLzDj8xIIWCLdawK1BPmK+K+/N1aZ30E6BnSX9ixYidN
	uwlxAG5aR1NkhQmbmcOrgu1EqZ5rfJz7oh32+maZvcn795MHqqehvSygIF0xps4M4dq+
	oWEF/wpGqwU+NikBiHdtnxE+p6UTYkrn0U18KnKE51E9L2gAjy/76JdnDrS0EycKn1Q3
	DCU5V+NB94k83uFNTrgqwvZMG9g3aARr0c1z9MSkVLqmosDTRBIspMDHQ59zAX/GQoUf
	Vxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ypr4mKDU3/aN/yfANvBNmaYC0Hhs6UR+ZNzhlTLz90M=;
	b=qfLjtPKBUVzqYNprxRt5+5al4HpeasISk9OySZbyqghjqj+EIXg5Abb2KbJgIHzFuI
	0EaUptX41H/oMq69q2j2N424YoiHj4yeUjVIunPn0guJBb4FH5Abar602QcAaXElJujM
	LLa5UiOeKPZqoWkUuaZO2h6NPJDDBObcSE3qRGcLystNvaUIUUS+eZGfx8KQSg7mVwUL
	eEbwJThP9HE1JRhwZ7Q0577AEMPYBIzDT/Vi0w3smVp1xUsHl8yDL9+GImEd3vllV5bm
	YUm8YOTsflyYtyu1eT7d5spX0qEN1mpkrAcec8XbDqFvn/ViS8Z1nH9Gy/zB/5m7Xgfc
	yqDQ==
X-Gm-Message-State: AOUpUlHAuIiEt/uWDYkM84V/7WXXpt+KKml81VddS8mypNdVyaXcuq+4
	lKrIHiE8KnHZOW+CZ9XfHH8=
X-Received: by 2002:a1f:170d:: with SMTP id
	13-v6mr31229876vkx.90.1534833680862; 
	Mon, 20 Aug 2018 23:41:20 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w25-v6sm516979uac.44.2018.08.20.23.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:41:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <e518ca81-1453-b21f-808c-8ebae5ba76a4@amsat.org>
Date: Tue, 21 Aug 2018 03:41:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-devel] [PATCH 04/22] hw/arm/iotkit: Wire up the dualtimer
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBbknKTT2bb1

On 08/20/2018 11:10 AM, Peter Maydell wrote:
> Now we have a model of the CMSDK dual timer, we can wire it
> up in the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/iotkit.h | 3 ++-
>  hw/arm/iotkit.c         | 8 +++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 2cddde55dd1..3e6d806e352 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -56,6 +56,7 @@
>  #include "hw/misc/tz-ppc.h"
>  #include "hw/misc/tz-mpc.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
> +#include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
> @@ -87,7 +88,7 @@ typedef struct IoTKit {
>      SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
>      qemu_or_irq mpc_irq_orgate;
>  
> -    UnimplementedDeviceState dualtimer;
> +    CMSDKAPBDualTimer dualtimer;
>      UnimplementedDeviceState s32ktimer;
>  
>      MemoryRegion container;
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 8cadc8b1608..130d013909e 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -139,7 +139,7 @@ static void iotkit_init(Object *obj)
>      sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
>                            TYPE_CMSDK_APB_TIMER);
>      sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
> -                          TYPE_UNIMPLEMENTED_DEVICE);
> +                          TYPE_CMSDK_APB_DUALTIMER);
>      object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
>                              sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
>                              &error_abort, NULL);
> @@ -390,13 +390,15 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    qdev_prop_set_string(DEVICE(&s->dualtimer), "name", "Dual timer");
> -    qdev_prop_set_uint64(DEVICE(&s->dualtimer), "size", 0x1000);
> +
> +    qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
>      object_property_set_bool(OBJECT(&s->dualtimer), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->armv7m), 5));
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
>      object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[2]", &err);
>      if (err) {
> 
