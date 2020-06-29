Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2804781lfm;
        Mon, 29 Jun 2020 02:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyidIX675IzsW3CoBAOpZsA8XjHn5aJLLFEkGV0HaO/8bkPTWrBVu9Z0jFDdBlGlRHi+GGS
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr1650381ybh.279.1593422012256;
        Mon, 29 Jun 2020 02:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593422012; cv=none;
        d=google.com; s=arc-20160816;
        b=RVDAQ6MPocfr3bVS+uFRrmmrkONidX4xpmiA7I7aI0z+SHY7LrzV11FzKFPawqCGf4
         mbObFUMB//9iBy/1IEO1CRIMMajar8qHJEHfruFH/Xjglm/VPkoGQjiwsldSkV7pqiZS
         YldnbG5zDo0VWSx7nQiNqpaYaUjjbNU/HGVZZqnxxxsIgFSaH5ZntjnWt0CytTuJJIrt
         tz0GaDOLnRHinK/UbAsMlBZH7uv3Td4//0LnO8dFBX1xbKoaavqkwV1hxUTfrkVkjL1e
         uj8v5A4bQDICdyjTA8vgWikXxnRCxDOOJ8Nm8/xD4W6blsgGGcxeI0x07ZzuSS5lxmqP
         /S9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ApZXEQ9IfNTdFDkZRhqnYOjG2XQP5mNGjswWoDZuxFM=;
        b=IbhlZONe/A2ZxwpRsJrzb5AZorhrZOks4MVb05c0qUYeqVCOlRhcx/YNtf4DMPncDj
         3uRlFm4Ox0toCsE5bhRUgntcykY3GvGAMug34Rt+BmVnsSSxBrgRDtHMS8YVvh6qCEJf
         mlvfQKmzTbqYDYV8lyq5iGls5khiJzDW48aG8YGe4A73NujgBPXMJdKtC+VRFaEdwBfd
         BVy/FqKDkVncc4d0Z/Z6IJyGJx8CD2e8ePdWm6LGQ8zh4v2BNzX2teLuflyqlpjrD+fm
         sNzeV9mz8NlRhcdzsaebj1ro9aM98T9Y6iCqf/Ud1DY36rGkAu+mIfgmfs6HQKHzxsT+
         QTGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n61m2Ito;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si6643054ybq.224.2020.06.29.02.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 02:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n61m2Ito;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jppr1-0001iE-JA
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 05:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppq7-0000lY-VT; Mon, 29 Jun 2020 05:12:35 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppq6-0004f7-3F; Mon, 29 Jun 2020 05:12:35 -0400
Received: by mail-wm1-x342.google.com with SMTP id o8so14639329wmh.4;
 Mon, 29 Jun 2020 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ApZXEQ9IfNTdFDkZRhqnYOjG2XQP5mNGjswWoDZuxFM=;
 b=n61m2ItoB5Pzbe54wa4r/mMx4KQIbSYJS0KJqL2SFahcBxaMigWVN32KymQJULRx2f
 Zkcq0d2atOrEHxbt+T/PSyUleammRwDFYsCpcz/tqliDTrwCE/1p6jO4EeasV0zkEabX
 sUodDTs4q7gTuoFj3fUMu9TIa+OwXmEfT/YPHBAjc1omGa4dHGrn9/FGicMJOYtJiNXH
 KPW3cUggkTtxwSzPMFb2KffW3bCnl6L7oM+H6zSPHuK7IDH+dqfwC1zBdRLf8/HbhMcW
 WPfRvtMxsUB+LLVqDlopWw7uHqX489zzVUBR493c4GvpcEUE2/bCsO6epbLMah+NDPi1
 mYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApZXEQ9IfNTdFDkZRhqnYOjG2XQP5mNGjswWoDZuxFM=;
 b=BMimckGyXa66cje+2KCioIlSg4IlN/4yKscQ6BxtMEjgdHZQ8wQ0dRr6kj2NvD5n7o
 RPiu+y7aCIZJN8hbI/Q7ADQReGQRk9pYk6qKYVs+8kxmjcKaCDhq/Pb0hzqJFvpdRFAH
 jh0adJZ5roYfNPCPxw0frnyLyNQZT21TWFQD65hRb+PtcaxiOcsY85zL358ZbDn2z6k4
 Z7MB31qKqEjlabMlNiFVfpJNaBOPJKugONJL2enxwnCbHz1+eSuuqPgncLpfsnhNPRE1
 oV0L9JTaUEm0DLMaiBUUhBs2w5ahfoudkHbhCL9amDGGw4SNnMMZTkMGwYfrc3huXN0g
 87DQ==
X-Gm-Message-State: AOAM533s5AbIBZdCvh6aqHR0yxQtEfyv4h0Ar9+E1dCbzwm6atj/AAcK
 jk+9KyPywMXSzbgp8IFGC4Q=
X-Received: by 2002:a1c:a4c6:: with SMTP id
 n189mr15354256wme.173.1593421951805; 
 Mon, 29 Jun 2020 02:12:31 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id d13sm32475764wrn.61.2020.06.29.02.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:12:31 -0700 (PDT)
Subject: Re: [PATCH 12/17] hw/arm/spitz: Encapsulate misc GPIO handling in a
 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75bf7670-2916-be90-0d48-c12d2277d863@amsat.org>
Date: Mon, 29 Jun 2020 11:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628142429.17111-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZxaH5LJDAawj

On 6/28/20 4:24 PM, Peter Maydell wrote:
> Currently we have a free-floating set of IRQs and a function
> spitz_out_switch() which handle some miscellaneous GPIO lines for the
> spitz board.  Encapsulate this behaviour in a simple QOM device.
> 
> At this point we can finally remove the 'max1111' global, because the
> ADC battery-temperature value is now handled by the misc-gpio device
> writing the value to its outbound "adc-temp" GPIO, which the board
> code wires up to the appropriate inbound GPIO line on the max1111.
> 
> This commit also fixes Coverity issue CID 1421913 (which pointed out
> that the 'outsignals' in spitz_scoop_gpio_setup() were leaked),
> because it removes the use of the qemu_allocate_irqs() API from this
> code entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/spitz.c | 129 +++++++++++++++++++++++++++++++++----------------
>  1 file changed, 87 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 1400a56729d..bab9968ccee 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -51,6 +51,7 @@ typedef struct {
>      DeviceState *max1111;
>      DeviceState *scp0;
>      DeviceState *scp1;
> +    DeviceState *misc_gpio;
>  } SpitzMachineState;
>  
>  #define TYPE_SPITZ_MACHINE "spitz-common"
> @@ -658,8 +659,6 @@ static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
>  #define SPITZ_GPIO_MAX1111_CS   20
>  #define SPITZ_GPIO_TP_INT       11
>  
> -static DeviceState *max1111;
> -
>  /* "Demux" the signal based on current chipselect */
>  typedef struct {
>      SSISlave ssidev;
> @@ -695,18 +694,6 @@ static void corgi_ssp_gpio_cs(void *opaque, int line, int level)
>  #define SPITZ_BATTERY_VOLT      0xd0    /* About 4.0V */
>  #define SPITZ_CHARGEON_ACIN     0x80    /* About 5.0V */
>  
> -static void spitz_adc_temp_on(void *opaque, int line, int level)
> -{
> -    int batt_temp;
> -
> -    if (!max1111)
> -        return;
> -
> -    batt_temp = level ? SPITZ_BATTERY_TEMP : 0;
> -
> -    qemu_set_irq(qdev_get_gpio_in(max1111, MAX1111_BATT_TEMP), batt_temp);
> -}
> -
>  static void corgi_ssp_realize(SSISlave *d, Error **errp)
>  {
>      DeviceState *dev = DEVICE(d);
> @@ -734,7 +721,6 @@ static void spitz_ssp_attach(SpitzMachineState *sms)
>  
>      bus = qdev_get_child_bus(sms->mux, "ssi2");
>      sms->max1111 = qdev_new(TYPE_MAX_1111);
> -    max1111 = sms->max1111;
>      qdev_prop_set_uint8(sms->max1111, "input1" /* BATT_VOLT */,
>                          SPITZ_BATTERY_VOLT);
>      qdev_prop_set_uint8(sms->max1111, "input2" /* BATT_TEMP */, 0);
> @@ -810,27 +796,66 @@ static void spitz_akita_i2c_setup(PXA2xxState *cpu)
>  
>  /* Other peripherals */
>  
> -static void spitz_out_switch(void *opaque, int line, int level)
> +/*
> + * Encapsulation of some miscellaneous GPIO line behaviour for the Spitz boards.
> + *
> + * QEMU interface:
> + *  + named GPIO inputs "green-led", "orange-led", "charging", "discharging":
> + *    these currently just print messages that the line has been signalled
> + *  + named GPIO input "adc-temp-on": set to cause the battery-temperature
> + *    value to be passed to the max111x ADC
> + *  + named GPIO output "adc-temp": the ADC value, to be wired up to the max111x
> + */
> +#define TYPE_SPITZ_MISC_GPIO "spitz-misc-gpio"
> +#define SPITZ_MISC_GPIO(obj) \
> +    OBJECT_CHECK(SpitzMiscGPIOState, (obj), TYPE_SPITZ_MISC_GPIO)
> +
> +typedef struct SpitzMiscGPIOState {
> +    SysBusDevice parent_obj;
> +
> +    qemu_irq adc_value;
> +} SpitzMiscGPIOState;
> +
> +static void spitz_misc_charging(void *opaque, int n, int level)
>  {
> -    switch (line) {
> -    case 0:
> -        zaurus_printf("Charging %s.\n", level ? "off" : "on");
> -        break;
> -    case 1:
> -        zaurus_printf("Discharging %s.\n", level ? "on" : "off");
> -        break;
> -    case 2:
> -        zaurus_printf("Green LED %s.\n", level ? "on" : "off");
> -        break;
> -    case 3:
> -        zaurus_printf("Orange LED %s.\n", level ? "on" : "off");
> -        break;
> -    case 6:
> -        spitz_adc_temp_on(opaque, line, level);
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> +    zaurus_printf("Charging %s.\n", level ? "off" : "on");
> +}
> +
> +static void spitz_misc_discharging(void *opaque, int n, int level)
> +{
> +    zaurus_printf("Discharging %s.\n", level ? "off" : "on");
> +}
> +
> +static void spitz_misc_green_led(void *opaque, int n, int level)
> +{
> +    zaurus_printf("Green LED %s.\n", level ? "off" : "on");
> +}
> +
> +static void spitz_misc_orange_led(void *opaque, int n, int level)
> +{
> +    zaurus_printf("Orange LED %s.\n", level ? "off" : "on");
> +}
> +
> +static void spitz_misc_adc_temp(void *opaque, int n, int level)
> +{
> +    SpitzMiscGPIOState *s = SPITZ_MISC_GPIO(opaque);
> +    int batt_temp = level ? SPITZ_BATTERY_TEMP : 0;
> +
> +    qemu_set_irq(s->adc_value, batt_temp);
> +}
> +
> +static void spitz_misc_gpio_init(Object *obj)
> +{
> +    SpitzMiscGPIOState *s = SPITZ_MISC_GPIO(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    qdev_init_gpio_in_named(dev, spitz_misc_charging, "charging", 1);
> +    qdev_init_gpio_in_named(dev, spitz_misc_discharging, "discharging", 1);
> +    qdev_init_gpio_in_named(dev, spitz_misc_green_led, "green-led", 1);
> +    qdev_init_gpio_in_named(dev, spitz_misc_orange_led, "orange-led", 1);
> +    qdev_init_gpio_in_named(dev, spitz_misc_adc_temp, "adc-temp-on", 1);
> +
> +    qdev_init_gpio_out_named(dev, &s->adc_value, "adc-temp", 1);
>  }
>  
>  #define SPITZ_SCP_LED_GREEN             1
> @@ -850,12 +875,22 @@ static void spitz_out_switch(void *opaque, int line, int level)
>  
>  static void spitz_scoop_gpio_setup(SpitzMachineState *sms)
>  {
> -    qemu_irq *outsignals = qemu_allocate_irqs(spitz_out_switch, sms->mpu, 8);
> +    DeviceState *miscdev = sysbus_create_simple(TYPE_SPITZ_MISC_GPIO, -1, NULL);
>  
> -    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_CHRG_ON, outsignals[0]);
> -    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_JK_B, outsignals[1]);
> -    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_LED_GREEN, outsignals[2]);
> -    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_LED_ORANGE, outsignals[3]);
> +    sms->misc_gpio = miscdev;
> +
> +    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_CHRG_ON,
> +                          qdev_get_gpio_in_named(miscdev, "charging", 0));
> +    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_JK_B,
> +                          qdev_get_gpio_in_named(miscdev, "discharging", 0));
> +    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_LED_GREEN,
> +                          qdev_get_gpio_in_named(miscdev, "green-led", 0));
> +    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_LED_ORANGE,
> +                          qdev_get_gpio_in_named(miscdev, "orange-led", 0));
> +    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_ADC_TEMP_ON,
> +                          qdev_get_gpio_in_named(miscdev, "adc-temp-on", 0));
> +    qdev_connect_gpio_out_named(miscdev, "adc-temp", 0,
> +                                qdev_get_gpio_in(sms->max1111, MAX1111_BATT_TEMP));
>  
>      if (sms->scp1) {
>          qdev_connect_gpio_out(sms->scp1, SPITZ_SCP2_BACKLIGHT_CONT,
> @@ -863,8 +898,6 @@ static void spitz_scoop_gpio_setup(SpitzMachineState *sms)
>          qdev_connect_gpio_out(sms->scp1, SPITZ_SCP2_BACKLIGHT_ON,
>                                qdev_get_gpio_in_named(sms->lcdtg, "bl_power", 0));
>      }
> -
> -    qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_ADC_TEMP_ON, outsignals[6]);
>  }
>  
>  #define SPITZ_GPIO_HSYNC                22
> @@ -1217,12 +1250,24 @@ static const TypeInfo spitz_lcdtg_info = {
>      .class_init    = spitz_lcdtg_class_init,
>  };
>  
> +static const TypeInfo spitz_misc_gpio_info = {
> +    .name = TYPE_SPITZ_MISC_GPIO,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SpitzMiscGPIOState),
> +    .instance_init = spitz_misc_gpio_init,
> +    /*
> +     * No class_init required: device has no internal state so does not
> +     * need to set up reset or vmstate, and does not have a realize method.
> +     */
> +};
> +
>  static void spitz_register_types(void)
>  {
>      type_register_static(&corgi_ssp_info);
>      type_register_static(&spitz_lcdtg_info);
>      type_register_static(&spitz_keyboard_info);
>      type_register_static(&sl_nand_info);
> +    type_register_static(&spitz_misc_gpio_info);
>  }
>  
>  type_init(spitz_register_types)
> 
