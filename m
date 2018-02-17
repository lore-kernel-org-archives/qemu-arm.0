Received: by 10.28.71.27 with SMTP id u27csp2105406wma;
        Sat, 17 Feb 2018 11:14:16 -0800 (PST)
X-Google-Smtp-Source: AH8x2257Wt1FDz+eDw8wI0C9PHNtTIq5KNCPSWiEL1lZyEeHayGoLLUYYKBy/1dUdwi+2BT3gC71
X-Received: by 10.37.90.193 with SMTP id o184mr7426697ybb.16.1518894855941;
        Sat, 17 Feb 2018 11:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894855; cv=none;
        d=google.com; s=arc-20160816;
        b=SPsGI+WtHzhSiV7emx3Shfc5cvn9Dzt4XXHziHkTmwTQ+l2xQLQuGBtTfCarX+ON/m
         Jje6u6mz5I8SUdanaesJFSm39AAli9B2VKqFoOs2ThdXcTFnq7GzUMaaKpCoA6ARjcqU
         Vz77Xmu5paO6WsDvalHvFM2ewuDO3CTKowzK067B5/ina/LPkd9TeRpCg2+cB8Nuot5/
         8ihXHao8PNjUakZXVbWGpYWDZSLxZVee2m9PJkgtU+VTgsVKo8mpUujRW7s5wGjt9km3
         cGnCkh/8fvCo4J6/xU1rZOC4qyd0UY0eLGBW8mNtQlamr3HuW9XAvp0QLC3n1ACQ6FNQ
         +DsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZX8EmXsQyeibVC4zspEuoGKRMdDzqlYdPD36wJrCDLA=;
        b=gBIbaj8/MVoqptSo/i97HSktb+wNu/6XtnNZRMas1Vn5GISTrTI2W2OXzrk12N+obr
         xrlv409tVuFz0ifCpDYwWrgohdqj3hctzSM755m5aRPBnKUs1IPfrwJng4RgFsvDmeHU
         QkUTm62TgKgAUHmaiV7T3ZOd6Ye/JqkQZX3Fo/dv8pw2SeQ0UqpqXTkX/sdqAq4WSuW5
         66WQQLlxEhRVrIYzQHPf0dFBHpHXfJYEo1Hj4fJhL0evfA+wsrHQM5M/yq/6WUdwGVvf
         iMuOJJ3p8DbrRHAMLn10tli5X23P8n2YeSXt/FEVYBwxBC0wOoNIh3mhl6RTDimRJTot
         81rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BtoKxxbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w84si857099ybg.551.2018.02.17.11.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BtoKxxbe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7w7-00012U-9p
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:14:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7E0-0004oQ-UE
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:28:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7Dz-0003Kv-SJ
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:28:40 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1en7Dv-0003I3-7i; Sat, 17 Feb 2018 13:28:35 -0500
Received: by mail-qk0-x242.google.com with SMTP id y137so1660372qka.4;
	Sat, 17 Feb 2018 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZX8EmXsQyeibVC4zspEuoGKRMdDzqlYdPD36wJrCDLA=;
	b=BtoKxxbe1sb670rgqVQDMbx9Z3fcFUP1AiStOGD9lzZ+bjMqfNpgPen8Zdx+77lnQN
	owJmHkhZN5QCfYaPXjUz902R/tyuepNrKnl0Fwx/XB0y+wS/mCcwouD+8rX6KuDvoyVG
	JqKCdMBwp1yyhqqHD1xE/OaiYFn94v4GUo/pUJ2JFE/HspzL/+Z4VTmUWaE4HitqZEPZ
	v5vh4acvjh5jFMXVIcPeRGHX2zRf5g8YMW7lgBdEzsyPsUi/eXanBLVtujcuRPZj9/YC
	VObCL3GBZoFwthZM0vAk7tTWmYa6Th7K8P7Eiyloc4crRFn5IvcgYFl35yT2LPf7HlaV
	Flpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZX8EmXsQyeibVC4zspEuoGKRMdDzqlYdPD36wJrCDLA=;
	b=PiwJtyfxQNpja5nUNEAiss0496TofusWXs4NKnFYE/x1JMW7FL397XHN0PRE758VQH
	DIDnIpPiLfoaNgp8MddEiZiCvJl+xtZDDdxCuABsImRKl4w3b0pdamf05+bNKOr+YiYK
	nVY34KYPMpyOzATRno92JeCNmE1ho3mG6JJpyorFZSYmcbK4UW9DUXkdhHXK4uy5E6eN
	SMq8X9x79DwurXl5TZAkur5cyxswxxDotlOEEG1g9NX9Ks5eAx2H1eTXnNLSMubqwGPn
	sRwrbsFU4mllL6eNUKfyyB4NzvE8bcFTo5CCslrP5bAAEO6WsMAPM5qvL9Patks6+7OK
	HJ/g==
X-Gm-Message-State: APf1xPBOitQZkEDo+0XQHbpZ3rsR72Qk8TEiLYfobTYMOnBU9oEn2bXO
	NFyOzjiolusIad+wNDWi3idoBqzZ
X-Received: by 10.55.42.132 with SMTP id q4mr15001134qkq.77.1518892114217;
	Sat, 17 Feb 2018 10:28:34 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	b184sm529840qkg.84.2018.02.17.10.28.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Feb 2018 10:28:33 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-3-linus.walleij@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3f009bb2-fb39-36ff-b3ed-a9b8c63db081@amsat.org>
Date: Sat, 17 Feb 2018 15:28:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180217140051.22731-3-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [PATCH 3/3] arm/vexpress: Add proper display
 connector emulation
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8UyELSvjVWu

Hi Linus,

On 02/17/2018 11:00 AM, Linus Walleij wrote:
> This adds the SiI9022 and EDID I2C devices to the ARM Versatile
> Express machine, and selects the two I2C devices necessary in the
> arm-softmmy.mak configuration so everything will build smoothly.
> 
> I am implementing proper handling of the graphics in the Linux
> kernel and adding proper emulation of SiI9022 and EDID makes the
> driver probe as nicely as before, retrieveing the resolutions
> supported by the "QEMU monitor" and overall just working nice.
> 
> The assignment of the SiI9022 at address 0x39 and the EDID
> DDC I2C at address 0x50 is not strictly correct: the DDC I2C
> is there all the time but in the actual component it only
> appears once activated inside the SiI9022, so ideally it should
> be added and removed to the bus by the SiI9022. However for this
> purpose it works fine to just have it around.

This seems easier to just do it now rather than postpone :)

In your patch #2:

static void sii9022_realize(DeviceState *dev, Error **errp)
{
    I2CBus *bus;

    bus = I2C_BUS(qdev_get_parent_bus(dev));
    i2c_create_slave(bus, TYPE_I2CDDC, 0x50);
}

static void sii9022_class_init(ObjectClass *klass, void *data)
{
    DeviceClass *dc = DEVICE_CLASS(klass);

...
    dc->realize = sii9022_realize;
}

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  default-configs/arm-softmmu.mak | 2 ++
>  hw/arm/vexpress.c               | 7 ++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index ca34cf446242..54f855d07206 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -21,6 +21,8 @@ CONFIG_STELLARIS_INPUT=y
>  CONFIG_STELLARIS_ENET=y
>  CONFIG_SSD0303=y
>  CONFIG_SSD0323=y
> +CONFIG_DDC=y
> +CONFIG_SII9022=y
>  CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
>  CONFIG_SSI=y
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index dc5928ae1ab5..d6c912c97684 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -29,6 +29,7 @@
>  #include "hw/arm/arm.h"
>  #include "hw/arm/primecell.h"
>  #include "hw/devices.h"
> +#include "hw/i2c/i2c.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -537,6 +538,7 @@ static void vexpress_common_init(MachineState *machine)
>      uint32_t sys_id;
>      DriveInfo *dinfo;
>      pflash_t *pflash0;
> +    I2CBus *i2c;
>      ram_addr_t vram_size, sram_size;
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *vram = g_new(MemoryRegion, 1);
> @@ -628,7 +630,10 @@ static void vexpress_common_init(MachineState *machine)
>      sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
>      sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
>  
> -    /* VE_SERIALDVI: not modelled */
> +    dev = sysbus_create_simple("versatile_i2c", map[VE_SERIALDVI], NULL);
> +    i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
> +    i2c_create_slave(i2c, "sii9022", 0x39);
> +    i2c_create_slave(i2c, "i2c-ddc", 0x50);
>  
>      sysbus_create_simple("pl031", map[VE_RTC], pic[4]); /* RTC */
>  
> 
