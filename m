Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp792698wrd;
        Fri, 17 Aug 2018 18:09:52 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzB2pxqVkcy6t9EbU4kBJF3AzrNNplEY1g0Cwp9QEmd0p0rqBF6aZVIJZf7RFtnLjXJVfAy
X-Received: by 2002:ac8:67c8:: with SMTP id r8-v6mr5756417qtp.59.1534554592904;
        Fri, 17 Aug 2018 18:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534554592; cv=none;
        d=google.com; s=arc-20160816;
        b=sxYWaSeDpz9YOCddRkkxMUUNo+v76kL76o9u6FKW3wCEVuTyxcJxIjHwvhBJSwKH1k
         RjMzPlvfS3WwGaXb932Sc22CKn2P9bPp428KcXn/BmLwSw5q+DQgf0TBRUfm6nhYS0qq
         0VR5YMH4yg66cbKfW1gTBE/HjjgfKc4Z4KskpG9NVuzJfQp0TUthur14C/LaBHRMk/zy
         tUhDTCbaUkHuQJG+6F0LYE0ZjR79/dJWXyb2IskfGc6c6NBTn1A6AOV74oarktZQ0KmO
         raqVpFxOrN3xJQk2UHtAa9K+E6bX/6Ezcu3T0pnLi2gXJrbzRaW3+MzzMyJfKaxwYe74
         0MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=S/QMnR35yBvbhJzXzWmXPANTD+ZRSB0yL2ChA7Kz0ts=;
        b=Ebh3n3hwtYvhV6Sctmtm4WdQarHBVvTIku6rAvDaqO5GDTLX7YMUvn6OnVYxoZi6Vi
         kJlhSybt87STtV72x0/zxI10ExeTAywpLC7lBTnjRF9+pX5braDlUHkC88x4G9XGYHIu
         RHjsJeOMVDEaZtECbCdjjSbnQftC+T9kTxsYkBmmvQblceF5d5yMeT2PN1WpceExncdU
         QxQmzArF2qLxFLGbinX/+ETW9a+JRqfJa9e6gbQPgigybRDQvs6Bm2rHQF00gxXOZyPE
         7lIKqgiFU3kwKuw6/1v3y+CZiGUGIAJ8QMNrjA8QSXJqTXUrMvveeot3ZJp7TJvuZHbW
         Fn3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ajporuli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19-v6si2194585qta.244.2018.08.17.18.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 18:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ajporuli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqpkW-0005Br-Bv
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 21:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpkL-000594-L4
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 21:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpkK-0004zD-JY
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 21:09:41 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:45312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpkE-0004xc-EH; Fri, 17 Aug 2018 21:09:34 -0400
Received: by mail-vk0-x243.google.com with SMTP id b78-v6so4050618vka.12;
	Fri, 17 Aug 2018 18:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S/QMnR35yBvbhJzXzWmXPANTD+ZRSB0yL2ChA7Kz0ts=;
	b=ajporulivNVkEjLKrX077N2EVWTd9P8uKe0TIGpfOC+xxh9ZykXMFUp5d2CroF3Ocf
	YgZU47WsJt5qbqRZnlQiY4CPO5BLt2BvHw0WQsacy7ygfnMlwXNjFo9rXUrbu3C5vihM
	0ufEWBgCHxwYWCgE5N2pkmeH+PBWmy3SFaEvR8tuiNW4VIUkA87xDWP8vabkd1VuhVVD
	OEvP8NJfQq3A3wVANVj6EqqppI89EnU+X2Xu7PK4PeTsm/loygG9v8NNdpFnzyFQYPsN
	Wzn4r/Sykr2uo507ywSmO9FrhmqeEEYxk9rGhBDvde0JkZL7Rlci/OEExmXDbjDcX2xN
	pnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=S/QMnR35yBvbhJzXzWmXPANTD+ZRSB0yL2ChA7Kz0ts=;
	b=VvmJ5j/Rb996jeC3rWxmF84I66hqWCS5zn3OvXTT/a2A8hBZVnxuG0SxFQpbPc+SX5
	wRcQJC/I3Ko8b9k1/3BTWb8Q9bBwrWwtW41oc8zKzYyfJIay9Z845BF1V5AfK/H6v9wo
	yQKSNLCJOp4Ze3QvL/8MmeeLS2qE/n8ttYzqooQBY3DFkt4o5Di8mKyBONMzL+h1ij2S
	1/+4I80L58oNeD0alHFXcyJB/UmwdmosHCSN2DZnH7ferED7u9rZ5YGSLhyW2t/8RHgh
	x+Ay9PaWBuTItprdVdjENCqTWxqP+6kC+40Kq7kZtvkKQlBHGlUH4UgVoE0PylfMncJm
	TZVw==
X-Gm-Message-State: AOUpUlGkFa8hDpYLPH8zjFMR48wN1fGiJnfDJYlx9sTb+aCeOGQMbbxX
	jRgxzXOkfIVR9kdtBRGUI9k=
X-Received: by 2002:a1f:bd2:: with SMTP id
	201-v6mr24105232vkl.165.1534554573850; 
	Fri, 17 Aug 2018 18:09:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm577844uan.30.2018.08.17.18.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 18:09:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-17-peter.maydell@linaro.org>
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
Message-ID: <e65ebee0-33bf-3bb5-fc9a-2a60532af74e@amsat.org>
Date: Fri, 17 Aug 2018 22:09:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [PATCH 16/16] hw/arm/mps2-tz: Create PL081s and MSCs
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
X-TUID: 7TBV/Rvc+Viz

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The AN505 FPGA image includes four PL081 DMA controllers, each
> of which is gated by a Master Security Controller that allows
> the guest to prevent a non-secure DMA controller from accessing
> memory that is used by secure guest code. Create and wire
> up these devices.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 101 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 94 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 22180c56fb7..7d92bc5fe1c 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -45,7 +45,9 @@
>  #include "hw/misc/mps2-scc.h"
>  #include "hw/misc/mps2-fpgaio.h"
>  #include "hw/misc/tz-mpc.h"
> +#include "hw/misc/tz-msc.h"
>  #include "hw/arm/iotkit.h"
> +#include "hw/dma/pl080.h"
>  #include "hw/devices.h"
>  #include "net/net.h"
>  #include "hw/core/split-irq.h"
> @@ -75,8 +77,9 @@ typedef struct {
>      UnimplementedDeviceState i2c[4];
>      UnimplementedDeviceState i2s_audio;
>      UnimplementedDeviceState gpio[4];
> -    UnimplementedDeviceState dma[4];
>      UnimplementedDeviceState gfx;
> +    PL080State dma[4];
> +    TZMSC msc[4];
>      CMSDKAPBUART uart[5];
>      SplitIRQ sec_resp_splitter;
>      qemu_or_irq uart_irq_orgate;
> @@ -273,6 +276,65 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
>  }
>  
> +static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
> +                              const char *name, hwaddr size)
> +{
> +    PL080State *dma = opaque;
> +    int i = dma - &mms->dma[0];

This line is not trivial to read. I wondered "isn't this ptrdiff_t? why
not divide by sizeof(dma)...

> +    SysBusDevice *s;
> +    char *mscname = g_strdup_printf("%s-msc", name);
> +    TZMSC *msc = &mms->msc[i];
> +    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
> +    MemoryRegion *msc_upstream;
> +    MemoryRegion *msc_downstream;
> +
> +    /*
> +     * Each DMA device is a PL081 whose transaction master interface
> +     * is guarded by a Master Security Controller. The downstream end of
> +     * the MSC connects to the IoTKit AHB Slave Expansion port, so the
> +     * DMA devices can see all devices and memory that the CPU does.
> +     */
> +    init_sysbus_child(OBJECT(mms), mscname, msc, sizeof(mms->msc[0]),

sizeof(*msc) easier to read?

> +                      TYPE_TZ_MSC);
> +    msc_downstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(&mms->iotkit), 0);
> +    object_property_set_link(OBJECT(msc), OBJECT(msc_downstream),
> +                             "downstream", &error_fatal);
> +    object_property_set_link(OBJECT(msc), OBJECT(mms),
> +                             "idau", &error_fatal);
> +    object_property_set_bool(OBJECT(msc), true, "realized", &error_fatal);
> +
> +    qdev_connect_gpio_out_named(DEVICE(msc), "irq", 0,
> +                                qdev_get_gpio_in_named(iotkitdev,
> +                                                       "mscexp_status", i));
> +    qdev_connect_gpio_out_named(iotkitdev, "mscexp_clear", i,
> +                                qdev_get_gpio_in_named(DEVICE(msc),
> +                                                       "irq_clear", 0));
> +    qdev_connect_gpio_out_named(iotkitdev, "mscexp_ns", i,
> +                                qdev_get_gpio_in_named(DEVICE(msc),
> +                                                       "cfg_nonsec", 0));
> +    qdev_connect_gpio_out(DEVICE(&mms->sec_resp_splitter),
> +                          ARRAY_SIZE(mms->ppc) + i,
> +                          qdev_get_gpio_in_named(DEVICE(msc),
> +                                                 "cfg_sec_resp", 0));
> +    msc_upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(msc), 0);
> +
> +    init_sysbus_child(OBJECT(mms), name, dma, sizeof(mms->dma[0]), TYPE_PL081);
> +    object_property_set_link(OBJECT(dma), OBJECT(msc_upstream),
> +                             "downstream", &error_fatal);
> +    object_property_set_bool(OBJECT(dma), true, "realized", &error_fatal);
> +
> +    s = SYS_BUS_DEVICE(dma);
> +    /* Wire up DMACINTR, DMACINTERR, DMACINTTC */
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev,
> +                                                    "EXP_IRQ", 58 + i * 3));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in_named(iotkitdev,
> +                                                    "EXP_IRQ", 56 + i * 3));
> +    sysbus_connect_irq(s, 2, qdev_get_gpio_in_named(iotkitdev,
> +                                                    "EXP_IRQ", 57 + i * 3));
> +
> +    return sysbus_mmio_get_region(s, 0);
> +}
> +
>  static void mps2tz_common_init(MachineState *machine)
>  {
>      MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
> @@ -299,13 +361,14 @@ static void mps2tz_common_init(MachineState *machine)
>                               &error_fatal);
>  
>      /* The sec_resp_cfg output from the IoTKit must be split into multiple
> -     * lines, one for each of the PPCs we create here.
> +     * lines, one for each of the PPCs we create here, plus one per MSC.
>       */
>      object_initialize(&mms->sec_resp_splitter, sizeof(mms->sec_resp_splitter),
>                        TYPE_SPLIT_IRQ);
>      object_property_add_child(OBJECT(machine), "sec-resp-splitter",
>                                OBJECT(&mms->sec_resp_splitter), &error_abort);
> -    object_property_set_int(OBJECT(&mms->sec_resp_splitter), 5,
> +    object_property_set_int(OBJECT(&mms->sec_resp_splitter),
> +                            ARRAY_SIZE(mms->ppc) + ARRAY_SIZE(mms->msc),
>                              "num-lines", &error_fatal);
>      object_property_set_bool(OBJECT(&mms->sec_resp_splitter), true,
>                               "realized", &error_fatal);
> @@ -406,10 +469,10 @@ static void mps2tz_common_init(MachineState *machine)
>          }, {
>              .name = "ahb_ppcexp1",
>              .ports = {
> -                { "dma0", make_unimp_dev, &mms->dma[0], 0x40110000, 0x1000 },
> -                { "dma1", make_unimp_dev, &mms->dma[1], 0x40111000, 0x1000 },
> -                { "dma2", make_unimp_dev, &mms->dma[2], 0x40112000, 0x1000 },
> -                { "dma3", make_unimp_dev, &mms->dma[3], 0x40113000, 0x1000 },
> +                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000 },
> +                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000 },
> +                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000 },
> +                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000 },
>              },
>          },
>      };
> @@ -490,12 +553,32 @@ static void mps2tz_common_init(MachineState *machine)
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
>  }
>  
> +static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
> +                               int *iregion, bool *exempt, bool *ns, bool *nsc)
> +{
> +    /*
> +     * The MPS2 TZ FPGA images have IDAUs in them which are connected to
> +     * the Master Security Controllers. Thes have the same logic as
> +     * is used by the IoTKit for the IDAU connected to the CPU, except
> +     * that MSCs don't care about the NSC attribute.
> +     */
> +    int region = extract32(address, 28, 4);
> +
> +    *ns = !(region & 1);
> +    *nsc = false;
> +    /* 0xe0000000..0xe00fffff and 0xf0000000..0xf00fffff are exempt */
> +    *exempt = (address & 0xeff00000) == 0xe0000000;
> +    *iregion = region;
> +}
> +
>  static void mps2tz_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(oc);
>  
>      mc->init = mps2tz_common_init;
>      mc->max_cpus = 1;
> +    iic->check = mps2_tz_idau_check;
>  }
>  
>  static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
> @@ -516,6 +599,10 @@ static const TypeInfo mps2tz_info = {
>      .instance_size = sizeof(MPS2TZMachineState),
>      .class_size = sizeof(MPS2TZMachineClass),
>      .class_init = mps2tz_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_IDAU_INTERFACE },
> +        { }
> +    },
>  };
>  
>  static const TypeInfo mps2tz_an505_info = {
> 

mps2-tz is now a piece of art...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
