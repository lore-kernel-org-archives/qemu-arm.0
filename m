Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1559973wrd;
        Mon, 20 Aug 2018 23:44:14 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxWU8p9TGegvulzRsZ9dST7ps7RPokGRgkpTLSxBrV06ORkaP3NDPQ4Mj0H9wW2io/Kf+93
X-Received: by 2002:a37:72c4:: with SMTP id n187-v6mr44708739qkc.103.1534833854909;
        Mon, 20 Aug 2018 23:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534833854; cv=none;
        d=google.com; s=arc-20160816;
        b=YoKlXWsot6cPRawl3Uqdj6KcXg6XXaK9GXAhU/tZ6txI7Ad56IlDL4fY0I2DoyEIam
         BeV1J8x4DHQNYcbjgpgn2FEfMLQtHC3Qmj1kOWXPv7OyFZKSyc/SjhqgHRW0lPn6BKEs
         ZMGk5eDpCo/ZI3KjfBnQJoPvi69CkbWwHoKx5Q87LUzp+yRL2qv9IP5IayLRd6F1xSqx
         h167Yt1LCU9IuItZlciwIaJD0zgrl1ZXPrvCwVT4Y51+spC6/ZkMeLrvxvOwOs195S+H
         garYsIZrzAFS24KBwtfr1jxb8EdmU3w9fPYUmLF5MNhN5x8wXTRkOc3RCu+T3pyIXhoY
         57kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=GvzBWJ7aHjmpq9pxrTnQba3HoMNhtmp6EJciRwTTRzM=;
        b=LjfAtvvGPPvKjYO1QKr9Hgp/3UosBe16heW+YTrUzdBrdlVjhMjOLYDwW5MJD+h0Eu
         zpKpxhGjKrQh9jzRcsXNqF3b+CcGH+oNBJ8/ZdrnbwFAKiw1rwJT9geJHARbrJrlqrXr
         nErMvyuf5nhZwciiBr1rhi6iunDZWhgWj3CakWvmQJ/Sk8YOD4fm6IdRD5NXnIETx+jR
         xaJb9zxci2Ze0eNIcFWcHmpJJjUm4jSw8BO9IM+eZoItDvNUOe3nuR4anonlZhSwcbG6
         FsKrPedugZ9IRnZ1tSqW7lZC2JZsSSIJT/iccUag6SBtXeGeoiIWlTzUeMtKTz9+JDof
         97qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WydoK0fc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si5435843qtr.222.2018.08.20.23.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WydoK0fc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0Ok-0003kz-9s
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:44:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0OW-0003jU-99
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0OV-0002Sl-HY
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:44:00 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:40218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0OQ-0002QT-H5; Tue, 21 Aug 2018 02:43:54 -0400
Received: by mail-ua1-x941.google.com with SMTP id m13-v6so11214079uaq.7;
	Mon, 20 Aug 2018 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GvzBWJ7aHjmpq9pxrTnQba3HoMNhtmp6EJciRwTTRzM=;
	b=WydoK0fcpC+1313cS+z0bAP/tnVLLQF66JQMeFcNy9ED4D1yhjJPHtCeAeiFLJstnj
	mcjXqY5GQdKbh6/tJs4dkRuR7moQnc30p9kYHORnrw048gKz3iIsw5CX0l4RYdJKP07R
	h64sp0BfD8p/PuUpvqM0J3ybPf3TdgPKvqB3HiuXaTi26Ra0id+ur09oOybKjfwrvd3t
	NAYOWUQNCfJSpYAhOtGBcKPLE91NapJWGH+C0ZfBweyW1ZrGlOSm+IqTx+TAZdp4d2HH
	ijiOezkThycErfqlZiNoQ1hrBxq67YRoJvyNtr/sdu/LHBqKSPgqr9z5PZ33cnyWGWIK
	JvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=GvzBWJ7aHjmpq9pxrTnQba3HoMNhtmp6EJciRwTTRzM=;
	b=UEY8z4/qLxT35pUszq12z3gSMsLvd3Gus8E8HM3l7cfDCAaPKCoDXr3q4ksUD9BKID
	4ycplmD0KfeIIHFZKfy7LnmuOfE3NDaxZqLUa3gA90h6aZh36Ak+gGMPQDwHRTEE2MN2
	N0vUpPst0XM8O6url4UQ9wlYhSu57MrXeoo3UJGPHcPWo2K7764K8eOtNZ7mR3wyZeQ8
	sFPx1MOvv7nMhA0TSoLCss06SDxJvWcTvmV/3udhUUVgAbhQ09rOB8kLd94s9alpexyc
	vJdAoimnBbaRVFv797ztV/eVq8jWWkjgW8C1GJTYQejhQEL99kDY6J4dhdOWMm8TUmb0
	IGXw==
X-Gm-Message-State: AOUpUlE4bPxMvX3N9Nr7UOsxKRFXbiRGykYmoEKi8yf1NnFU5HwB7jb5
	HRZnoCerRsujzzg5nUtlOXw=
X-Received: by 2002:ab0:6150:: with SMTP id
	w16-v6mr16769287uan.113.1534833834037; 
	Mon, 20 Aug 2018 23:43:54 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm920639vkf.4.2018.08.20.23.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:43:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-6-peter.maydell@linaro.org>
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
Message-ID: <39537303-c634-b65e-ae60-fed755c82a87@amsat.org>
Date: Tue, 21 Aug 2018 03:43:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-arm] [PATCH 05/22] hw/arm/mps2: Wire up dual-timer in
 mps2-an385 and mps2-an511
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZyOkhg/vSE+

On 08/20/2018 11:10 AM, Peter Maydell wrote:
> The MPS2 FPGA images for the Cortex-M3 (mps2-an385 and mps2-511)
> both include a CMSDK dual-timer module. Wire this up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/mps2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 0a0ae867d9b..564624629d0 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -34,6 +34,7 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/char/cmsdk-apb-uart.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
> +#include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "hw/misc/mps2-scc.h"
>  #include "hw/devices.h"
>  #include "net/net.h"
> @@ -64,6 +65,7 @@ typedef struct {
>      MemoryRegion blockram_m3;
>      MemoryRegion sram;
>      MPS2SCC scc;
> +    CMSDKAPBDualTimer dualtimer;
>  } MPS2MachineState;
>  
>  #define TYPE_MPS2_MACHINE "mps2"
> @@ -297,6 +299,15 @@ static void mps2_common_init(MachineState *machine)
>      cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
>      cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
>  
> +    sysbus_init_child_obj(OBJECT(mms), "dualtimer", &mms->dualtimer,
> +                          sizeof(mms->dualtimer), TYPE_CMSDK_APB_DUALTIMER);
> +    qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
> +    object_property_set_bool(OBJECT(&mms->dualtimer), true, "realized",
> +                             &error_fatal);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
> +                       qdev_get_gpio_in(armv7m, 10));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
> +
>      object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
>      sccdev = DEVICE(&mms->scc);
>      qdev_set_parent_bus(sccdev, sysbus_get_default());
> 
