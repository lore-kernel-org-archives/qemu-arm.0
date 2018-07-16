Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1963878wru;
        Mon, 16 Jul 2018 14:59:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfl8I17I8FETsiTazte/h+hpWfZoEVhxgmbUFE60q7aa40EkoDHgy8UzfPy07i2tHVJEbfg
X-Received: by 2002:ac8:3415:: with SMTP id u21-v6mr16352881qtb.391.1531778391915;
        Mon, 16 Jul 2018 14:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778391; cv=none;
        d=google.com; s=arc-20160816;
        b=rLC6AaIp/Qnx1bnguHz3eSp0yW+s7IOCicXEfIUXO+UbHIBL03OZQjo9OxCjbX26tU
         qCCdtxg274cx8YfOdayjKT6ZZosOVu6jX1AC/C91dgRWoQdj+x/v9m81/3IOAgYbVvIF
         itTtx6mzY5DVEcKklwG28o3FkoyvC1aNzCzDjD7gRBiMqT7z0wMrQACPF4isD3fynYUt
         SMiHpIfO0AFURLkUag3OnDPLQwjobM2y0vrW/EuN2dpfM+n99UNQTowFThbft0z/RDeI
         sp15cE9DbW33ODv7qyobE2AWJ0iNP8vaONiTMDc+EXxWOlcj/nMeStd+bB543NKkwS1I
         ndug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VZGs8dcVEUABM0/jsA3FPZMwfraTX2xy9xj6DXWcf0s=;
        b=VYk5dwfYV8ZcFNIlP3j5q5a6CILlOrKAqCiFkGEshtUk5ZpG1bVe+h1vjOxOeyQQa8
         2f2HuqbGUnUGwzsc2JFLFE9u7CXIxrwdxNLplyKQ9hXfFK6t9VrI69hPtC8neTRlubGw
         21A3SDJY0Ktm9Zp51KbK5dphtjmL2dCHWDZfXg56C0WXnwrH5o46V3T2hHXZ8agTBTzD
         X7gcu+IxsLn688Klbhxw1GXZTnw3gYYR2nArjTUO+GGnPfP/KGwUw85NGjXIAl/M5RBx
         M0dRYvMS9JhQOocbJXQvlmWSoIFhflYrPe7d/ykWCUS+2kCNkkWQ+ms/vPseXPQZXl9L
         ukrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nS/Qs2sd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19-v6si6374707qte.348.2018.07.16.14.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="nS/Qs2sd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBX5-0003JK-GM
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:59:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBWw-0003Ht-12
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBWv-00018L-6i
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:59:42 -0400
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233]:35252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBWs-000137-Rd; Mon, 16 Jul 2018 17:59:39 -0400
Received: by mail-lf0-x233.google.com with SMTP id f18-v6so17247701lfc.2;
	Mon, 16 Jul 2018 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VZGs8dcVEUABM0/jsA3FPZMwfraTX2xy9xj6DXWcf0s=;
	b=nS/Qs2sdC5dyQ+oxKK8kCriH/8A9Ogg50fkuk50dOqZNJ+jbKP/i58MzCYvlvl7akK
	96lZ4VfHFAxBMLky6pqeqL9madFItqNMbXCjM0hX+vc6RjeY1KGJwoK2g4XmEkJv7Agt
	vqWm2W+3t93rJkhnV+WZdzuFQg9PFnXAeWi8GpIa947ThSszz2rN/C1+K8B7RPrLAmeL
	42C0MZ30TMzCrES2e6k+SDayvwFUWH2TCWLSQOBMFZNmbgQQME8qCWeuBR+SoxnY+h9P
	ILJdsSgTde5P+dbUgWySzpwYlBge9F7BDxOpQp8f/nxnveDnMXqsl2tYJB0A/tjrZswb
	mjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VZGs8dcVEUABM0/jsA3FPZMwfraTX2xy9xj6DXWcf0s=;
	b=fycHPCPRK7rpRsnTY/iS3gftFG5Z/Z6SG14gfC8rM5MbTScNAuGl6n8teNW82mDFvo
	SjqOlC4A45ssO2deuG5ZFsvrkc9+MpAaSEh3xyTn+oha76OJ9AS4d8IDvTpNMyw2jjC8
	E8TZX0tnemQMfrU8CclKkN06QEbASgw5HyHf27BkTwo935t01y0ksulp4wC81oX5Plcd
	n4Iy8llPErQHd0/R9FOLNwJZ3725TZRMG1m5JKegwyPzx280MoVh/D+DgiU4JkmcyzwI
	ME4UPc/skn0S/4kgHJrM2EGV3VQRgOCaXTjzJDO+TWAO5+0ulx+iJLPlQ3IwJoj3QWPB
	F1UQ==
X-Gm-Message-State: AOUpUlEokGHZzUilGB1/lLqxmwmQMxJ6YlBbc6wPzz5VYBOFo8X83Obm
	gVHkEf5gBQOIGES4BJZVY8HwxMhB3TZWMBSTqG0=
X-Received: by 2002:a19:de4e:: with SMTP id
	v75-v6mr11857798lfg.14.1531778377408; 
	Mon, 16 Jul 2018 14:59:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 14:59:06
	-0700 (PDT)
In-Reply-To: <1531745974-17187-16-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-16-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 14:59:06 -0700
Message-ID: <CAKmqyKM_DaL03W7UCtm0FyxSxOfwFQyRxVhyGQ-JkieBVBsb-A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 15/17] hw/arm/stm32f205_soc:
 Fix introspection problem with 'stm32f205-soc' device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xkqcfxadJo/b

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> Valgrind complains:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'stm32f205-soc'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==28531== Invalid read of size 8
> ==28531==    at 0x6185BA: qdev_print (qdev-monitor.c:686)
> ==28531==    by 0x6185BA: qbus_print (qdev-monitor.c:719)
> ==28531==    by 0x452B38: handle_hmp_command (monitor.c:3446)
> [...]
>
> Fix it with the new sysbus_init_child_obj() function.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stm32f205_soc.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 2b2135d..c486d06 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -49,36 +49,32 @@ static void stm32f205_soc_initfn(Object *obj)
>      STM32F205State *s = STM32F205_SOC(obj);
>      int i;
>
> -    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
> -    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> +                          TYPE_ARMV7M);
>
> -    object_initialize(&s->syscfg, sizeof(s->syscfg), TYPE_STM32F2XX_SYSCFG);
> -    qdev_set_parent_bus(DEVICE(&s->syscfg), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscfg),
> +                          TYPE_STM32F2XX_SYSCFG);
>
>      for (i = 0; i < STM_NUM_USARTS; i++) {
> -        object_initialize(&s->usart[i], sizeof(s->usart[i]),
> -                          TYPE_STM32F2XX_USART);
> -        qdev_set_parent_bus(DEVICE(&s->usart[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "usart[*]", &s->usart[i],
> +                              sizeof(s->usart[i]), TYPE_STM32F2XX_USART);
>      }
>
>      for (i = 0; i < STM_NUM_TIMERS; i++) {
> -        object_initialize(&s->timer[i], sizeof(s->timer[i]),
> -                          TYPE_STM32F2XX_TIMER);
> -        qdev_set_parent_bus(DEVICE(&s->timer[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
> +                              sizeof(s->timer[i]), TYPE_STM32F2XX_TIMER);
>      }
>
>      s->adc_irqs = OR_IRQ(object_new(TYPE_OR_IRQ));
>
>      for (i = 0; i < STM_NUM_ADCS; i++) {
> -        object_initialize(&s->adc[i], sizeof(s->adc[i]),
> -                          TYPE_STM32F2XX_ADC);
> -        qdev_set_parent_bus(DEVICE(&s->adc[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "adc[*]", &s->adc[i], sizeof(s->adc[i]),
> +                              TYPE_STM32F2XX_ADC);
>      }
>
>      for (i = 0; i < STM_NUM_SPIS; i++) {
> -        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> -                          TYPE_STM32F2XX_SPI);
> -        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
> +                              TYPE_STM32F2XX_SPI);
>      }
>  }
>
> --
> 1.8.3.1
>
>
