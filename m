Received: by 10.223.172.38 with SMTP id v35csp4858879wrc;
        Tue, 19 Sep 2017 05:13:21 -0700 (PDT)
X-Received: by 10.200.24.214 with SMTP id o22mr1680079qtk.123.1505823201745;
        Tue, 19 Sep 2017 05:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505823201; cv=none;
        d=google.com; s=arc-20160816;
        b=CbX2dBk6pZgI82aZV/D01KO8j/S/cIAsWPNx90WUr+V4Iw6GnuHT9DJ3Lr8GZRQzsl
         HDlOrk4nVWe5gO77X+ddbRRn310EVfXmrGQU+E+KMaySkXqQRFL7YJQWbylRLHSIHT6Q
         D8rsT3bs3A/c5VhZJK7B2FS8CoiQnJqdgkicePCzmXffbfokk+tR2ZqS+RNEItgyY1Gf
         94loqn6zd2Z+Uz208F7/71wFQOmpMy03D4LL7KP2xpfoTISKsd4MYNasfJ32BLC9vNIB
         1qzJY6KqRIk8oYBhDZ1PHmxQ4xCvxD86FEPN6pGlvqF2zs0pFNbfarPfHFB5nx+OeldD
         0i6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LIfrsyEkEY/+b7Cs9rchpqdmj9VrMy3goK+JiL3LDW8=;
        b=Ck1usGHgQ0MWrK3zFoBSXmMZPU7dk6lSslAAHUqdfpy6Q2vd13BPhg+cts/rDQwjqV
         TxukWvsxYdm+Fdcq9OddL7K/tSguIuSb/kArhW7INeBak2353gIOcuPaMhv/hIXUsJSO
         WClmDOmbzjHxrOfziwzbFzxgRICnQkm41W8lgKlbOkBJzp3pM8dJHv6bJ54EcVsnsWR1
         QpZEEzvWGZ8jPYfEVCsCInYSVeNwRgmaHAbf4stukndRa0LOyOR9ymJCbhqSNf7QjYih
         5oX+eHrIOozu45mTZgOy0Tu3Sua1wRwp4LF6dMe7GgoPssJfQorjIUNusBdbpI6T6k5g
         LiTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q3EjlWB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p64si8827461qkd.73.2017.09.19.05.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 05:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q3EjlWB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duHOx-0006ZM-JJ
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 08:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHOI-0006Bl-2T
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHOD-0003B6-9z
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:12:38 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHO4-0002xr-PZ; Tue, 19 Sep 2017 08:12:24 -0400
Received: by mail-qk0-x241.google.com with SMTP id i14so2113569qke.3;
	Tue, 19 Sep 2017 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LIfrsyEkEY/+b7Cs9rchpqdmj9VrMy3goK+JiL3LDW8=;
	b=Q3EjlWB4vWnkMDkRP8sqxDgZZ2ubcokBiAG8xpLVyqEG1mGnKoeaA8p5TA7Fkzig6K
	Ut5P7qk1ZWKFJ3zRK5e612+vmJvcqmTqdhMhOIotNZ/odotHkRcllMuwIFJHANDQqvnr
	EN0UIWULmHiOLRevUSE+jaUznS2F1kajEki0Z10QxKL6iRNLfx0cpDzWsoN1D3BlZNkS
	Xpu1fBUDQSyRKd8HELyubqq5FMT/+mKJ3K9elSR8CZCh9rYEvVSiX4WL0B6eeNAdhExf
	w4Z5+U3MaMvrOjtNipoF72jyRnLTJEXY8bzlqGTp7gGA0gOtSk1LTp/DBrHbsaytS3jo
	PRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LIfrsyEkEY/+b7Cs9rchpqdmj9VrMy3goK+JiL3LDW8=;
	b=slHXXDhSEIPNGJ65/1QuAfjpUwGDuDYkQefuyNl5z8tZIrjUog33SzeDMNQ/N9xRCx
	NRfzeV+PHhTQ3aGw9n53hWNWd4aMwVY1uQutLpPeSuc/tbegyAr7+nxgyXVd3/gDM1Cc
	07rqYm9rJciQkLPBGBbwiKIGK4Bmzd2Vy11xW/WJ4PxW5h0wJbpWpNtqhUykNEWbDlYR
	IS1UtUEGGjUwA+NYjELu3/8pXvgMSq8+QQheOee2gYK9aixRXdRdlurtbW+ADzUAhZKj
	xgS6P5tjuyNyfiR/2sTyLpHFSn6VKAjqdeqCybbVlVId7x9We6kWGksif4cke8j5DOR2
	gvRA==
X-Gm-Message-State: AHPjjUg9g9fOJtRHGSjkoljIX3je/+9LK/KInvl0yLcj6yI/eL75SA+g
	40Gee9WGr3Xv6WJfZxWZO4s=
X-Google-Smtp-Source: AOwi7QDeK8YXh7+k/+7G034GWbU3qIzz9k/AOpolC/KxMQKwCiuBydFb91BJtX0i89sVH8gmxx2xbQ==
X-Received: by 10.55.137.66 with SMTP id l63mr1528647qkd.249.1505823144092;
	Tue, 19 Sep 2017 05:12:24 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r1sm6895516qtc.90.2017.09.19.05.12.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 05:12:23 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20170919112645.8574-1-clg@kaod.org>
	<20170919112645.8574-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <472ff629-39bd-9fe2-c1f8-a08ba6997b53@amsat.org>
Date: Tue, 19 Sep 2017 09:12:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919112645.8574-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/5] aspeed: Add EEPROM I2C
 devices
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Njt3C8gNSkvR

Hi Cédric,

On 09/19/2017 08:26 AM, Cédric Le Goater wrote:
> The Aspeed boards have at least one EEPROM to hold the Vital Product
> Data (VPD).
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 362b683e9021..3e74970d7ad2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -251,6 +251,17 @@ static void aspeed_board_init(MachineState *machine,
>       arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
>   }
>   
> +static void aspeed_i2c_add_eeprom(I2CBus *bus, uint8_t address, size_t size)
> +{
> +    uint8_t *eeprom_buf = g_malloc0(size);
> +    DeviceState *dev;
> +
> +    dev = qdev_create((BusState *) bus, "smbus-eeprom");
> +    qdev_prop_set_uint8(dev, "address", address);
> +    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    qdev_init_nofail(dev);

Can you merge this with smbus_eeprom_init() ?
I think the cleaner way would be add "include/hw/i2c/eeprom.h" defining 
SMB_EEPROM_TYPE "smbus-eeprom" and declare smbus_eeprom_init() there or 
as inlined.

> +}
> +
>   static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -260,6 +271,9 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>        * enough to provide basic RTC features. Alarms will be missing */
>       i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338", 0x68);
>   
> +    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), 0x50,
> +                          256 * 1024);
> +
>       /* add a TMP423 temperature sensor */
>       dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
>                              "tmp423", 0x4c);
> @@ -298,6 +312,9 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
>   
> +    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), 0x50,
> +                          8 * 1024);
> +
>       /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
>       i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105", 0x4d);
>   
> @@ -377,6 +394,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>       /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
>        * good enough */
>       i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
> +
> +    aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
> +                          8 * 1024);
>   }
>   
>   static void witherspoon_bmc_init(MachineState *machine)
> 
