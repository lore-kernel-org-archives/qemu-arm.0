Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1565418wrd;
        Mon, 20 Aug 2018 23:51:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbbne7EmGLsUynC0DXXWO4UhlNaDCAcEP39m8z7EGBYoYF+oRdFvhsUoKL8QwGBpeDa+u8/
X-Received: by 2002:ae9:e414:: with SMTP id q20-v6mr7595100qkc.305.1534834319280;
        Mon, 20 Aug 2018 23:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534834319; cv=none;
        d=google.com; s=arc-20160816;
        b=rqYxByugFjVC6B7P7igWspn9YvCQGvOP7RXGFDmxbi4h+DKjlqK19XX9R9lg80JYb2
         kdaKXhfksPMvb/OHA3q4QlGAaix5SW6tffSYVlSWS9VpZdkeGkfcjCMbF5qDIZXvOZc1
         7PV+a+55FEXW/SzQMV5GtIPv28LGqGIabX0zAP8+A1hZtaFiGzdcITQZZmoaeZ0v5W5F
         MRW7+cPiTSfFwGAJzfoLIJLjKmPcx2fnAQ3ZDNQq/NKodUN2+QTz0Mxw5IWw3UbwPjlq
         KYzH00IDMJs7O/K/oFY8tu4ot9qdvYymxzh9jyuJSoxRayiCUiWf+N8dbFS/TzpWnTlj
         4n4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=F6fZQHgfROb02EZqbpC9nLsgyvwYOXLoqlot0twaLyw=;
        b=EhFHQ+sPnkLxOL0EedCujb2sBLNTH/Q1VnVhjUO+/Rue+e5g4yk5w2KzvBR8u2OjKs
         vWcF381zYLYIqKDw8u1C9i1Ennh9ZC9OQQkCZ4YfMno6ZHkkGRnPYnPDQDKeZmoPuklI
         A9FbnUq2Q1jLYlgFjO/kerMAVRm/RBDAuo67mOKxmxCTHMkacwT87BrPdwitPV6G4n40
         oTazTAJx72rsS84NqCHnCajd2XkXoglCMijY+zY5klTgVmqQvFePmeXyMB2HxjSfrxu3
         4QrqdcolFLMkre6YXm7Z3X8RShutgV2bZ1DlVwckg0Sh+S9rNAVugxdQ0pmkv1tgZXmB
         SWTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tmZOE4Tf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66-v6si4179197qki.261.2018.08.20.23.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tmZOE4Tf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0WE-0002rf-Oj
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:51:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0SE-0007MD-K2
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:47:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0S9-0004RE-Ha
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:47:50 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:34695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0S9-0004Pw-25; Tue, 21 Aug 2018 02:47:45 -0400
Received: by mail-vk0-x243.google.com with SMTP id l143-v6so7718047vke.1;
	Mon, 20 Aug 2018 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F6fZQHgfROb02EZqbpC9nLsgyvwYOXLoqlot0twaLyw=;
	b=tmZOE4Tf6n+ZW1iss6Ns10cD3DC0dDzff31SXWu4PALEfthk3y/xeJWojfPXUuDU7D
	NN5G2sZnz++o/GqmcrfOWUpM5x8MO/GZh28IWTiSkLRDU1IX3grExjIqZGHaQ9JDDKs6
	ew6lZQl3d8596gv2zywT3D9kY2/i3+n2DgARyGl5TNsoI40z/+zXPzShgi1IV9f14Z9y
	I0R7H7mtFzmDm1Nkmdhb+iWd1weAgTlRbLii+SkX0Bg+22qByZn3FC01cCM2uKtQUAKE
	bolq3B5Z9k0Fy7C/YfUZbIEgn5SEi6sG49StCZ0QqsIzi/5Nqqk0qCBrYL1awQxKDLRN
	T0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=F6fZQHgfROb02EZqbpC9nLsgyvwYOXLoqlot0twaLyw=;
	b=gcxMve9EloVCP3D0ttfucgb0yOZWygHw39WsADx/tcRv+UPitD+fIDKsKx8HIkDRdH
	mNkRy8P38+uDUOaCUyrZhTCuQfvPJRncvkGaGTUG+dbETuQNd3mImuZllHA7UHCFOkYm
	JDDUpd/gqgPl33Q0uE6UkE0yxjSYR79uJaYCFy9Fm9HZnsNRJ5HVlLRB9BRoPHZjrkKr
	hyVZCQHEoE91uV0LnB+0jseWpiERsfy7DSiLD5o/3wAME6I2lq4aP58uQKc4THUVhDKu
	sOm4rbFJyv6ChfZV6tkZiSsjBiWdNk3zRImTsumO/rmh/xaa3OKGGK7CrjsSLYTLxuaN
	HbfQ==
X-Gm-Message-State: AOUpUlGvU2EjNDYQuZBneimYohHAYjthyhitFaR776+QWxaPDXeoRwuV
	NSsIzKjNUbjeAzZmR3G8KUQ=
X-Received: by 2002:a1f:8948:: with SMTP id
	l69-v6mr32418435vkd.132.1534834064517; 
	Mon, 20 Aug 2018 23:47:44 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l134-v6sm2276206vke.30.2018.08.20.23.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:47:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-11-peter.maydell@linaro.org>
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
Message-ID: <c2e864a0-d4de-c238-b0ba-87b50e507b0f@amsat.org>
Date: Tue, 21 Aug 2018 03:47:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-devel] [PATCH 10/22] hw/misc/iotkit: Wire up the sysctl
 and sysinfo register blocks
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
X-TUID: 91xCV27eWYC5

On 08/20/2018 11:11 AM, Peter Maydell wrote:
> Wire up the system control element's register banks
> (sysctl and sysinfo).
> 
> This is the last of the previously completely unimplemented
> components in the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/iotkit.h |  6 +++++-
>  hw/arm/iotkit.c         | 26 ++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 0f5c5101708..426dc326a0d 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -58,7 +58,8 @@
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
> -#include "hw/misc/unimp.h"
> +#include "hw/misc/iotkit-sysctl.h"
> +#include "hw/misc/iotkit-sysinfo.h"
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
>  
> @@ -97,6 +98,9 @@ typedef struct IoTKit {
>      CMSDKAPBWatchdog nswatchdog;
>      CMSDKAPBWatchdog swatchdog;
>  
> +    IoTKitSysCtl sysctl;
> +    IoTKitSysCtl sysinfo;
> +
>      MemoryRegion container;
>      MemoryRegion alias1;
>      MemoryRegion alias2;
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index cb0ec456f39..f8276b5425c 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -16,7 +16,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/registerfields.h"
>  #include "hw/arm/iotkit.h"
> -#include "hw/misc/unimp.h"
>  #include "hw/arm/arm.h"
>  
>  /* Clock frequency in HZ of the 32KHz "slow clock" */
> @@ -151,6 +150,10 @@ static void iotkit_init(Object *obj)
>                            sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
>      sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
>                            sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
> +    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl,
> +                          sizeof(s->sysctl), TYPE_IOTKIT_SYSCTL);
> +    sysbus_init_child_obj(obj, "iotkit-sysinfo", &s->sysinfo,
> +                          sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
>      object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
>                              sizeof(s->nmi_orgate), TYPE_OR_IRQ,
>                              &error_abort, NULL);
> @@ -516,13 +519,20 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                            qdev_get_gpio_in_named(dev_apb_ppc1,
>                                                   "cfg_sec_resp", 0));
>  
> -    /* Using create_unimplemented_device() maps the stub into the
> -     * system address space rather than into our container, but the
> -     * overall effect to the guest is the same.
> -     */
> -    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
> -
> -    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
> +    object_property_set_bool(OBJECT(&s->sysinfo), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    /* System information registers */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
> +    /* System control registers */
> +    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50021000);
>  
>      /* This OR gate wires together outputs from the secure watchdogs to NMI */
>      object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
> 
