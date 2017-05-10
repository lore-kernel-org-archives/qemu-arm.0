Received: by 10.25.0.6 with SMTP id 6csp231158lfa;
        Wed, 10 May 2017 04:16:50 -0700 (PDT)
X-Received: by 10.237.36.219 with SMTP id u27mr5238207qtc.197.1494415009973;
        Wed, 10 May 2017 04:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494415009; cv=none;
        d=google.com; s=arc-20160816;
        b=NeyxCTSGZBDtlbhlTwnBm02eyUJb//DjsQTXhlypPpVBPRUjHVtvr0ggea7mg1QHxw
         uwBgmLINGzru2vrkp/bD4QtS1pNRBTjsmblxAwbpViWLYBQYrqBH5839aGLTIyhCGbpX
         cA7kXCHng9tX0sPBLW1L2MRKv28O2kJam4zmIiXwYljegOUKccWFRjFkuawkGYKExV5W
         jq9g7oRfqtG62vDqEdlu+FvvVLx8SJQTCLk741mzew6szNsBrnj5eEire4Zt49prc6Fg
         yL/wcX5zq8aO4qPUKgovhG0adW/fUKv5CHM98Ml6+qRxCKGVfZx0JSAoqDV4EyvzGsr6
         VGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=eNFG5dhAWNeCRQsERn5KL0r0aR79ZtbHo6Nmv4vMTXg=;
        b=CYY5CaeQCEbeLgfrZjQVi7k9obumGvg+868ESJJMYo7luSZko8ZX1Jq6ii0mElEyUq
         V09MFNMrfMQ0WRNhza+0gYYdTOs4WfUkebX3MnKOyrmEhJH8fNZybAAYLTlGUa+mFzBE
         Y+btruiUweX6LdphV93pW8f63AysQU+2RUI0BSfGi3ck96cxjHJOPGfdUAwRilsnYCdj
         Q46kCUCJtavikFwKP3lPtBBk2KxukQBYwrik0BGzZzpIL69oMQsuG86zSqgvuGUUwd8E
         R/xRoGC7pGXHKzc5aveprX5qm1zr2Pwat1bFfPJnU9grxwKD5Zq1w0N6BkqW0lvXYklS
         IUXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si2773783qtu.248.2017.05.10.04.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pbt-0004ox-El
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:16:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Pbl-0004nu-KW
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Pbg-0005lX-DY
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:16:41 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Pbg-0005lT-8X; Wed, 10 May 2017 07:16:36 -0400
Received: by mail-qk0-x244.google.com with SMTP id y128so4141471qka.3;
	Wed, 10 May 2017 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=eNFG5dhAWNeCRQsERn5KL0r0aR79ZtbHo6Nmv4vMTXg=;
	b=T9eW+xFll3ceGxW9J1y9gLqVnw4scU/E21ncsJ52vG3LbYpNS+E9tzRd/u+gevlFTG
	IX7V3bnEa0undeNct2l0+uxjsJSOqqI6WpX1KaxlZJuiXW/4q5ArWNzQqhcguJXqRarv
	bOsrYmZIGHqL4WDORIaU543wsn0QsRPKgNtaQGIRp+lsxzx37o4cYvdkJTvdRZEvsKw1
	kxlxUJt9JjmDH7Yo3bolKCXdsGFI6caCtTv07yMq/yUsDan1ccAF2cn+X3nGxdD4/9KP
	H9pPiiKrbmzd4hvYv3wrRR+7Zn8tchBRm0HLBVJmf35I4+VQfDskrNtXy843AdPDHfPB
	mYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eNFG5dhAWNeCRQsERn5KL0r0aR79ZtbHo6Nmv4vMTXg=;
	b=hnd0FHaThTCteUVSj2S62ZDztLTucWx0p+6/noYydII6yBL+Z3LgdXlQgeN2OKT5W7
	L0zYL9A17sfEnBabTnjQGB7qaup0HuCuouaHDYHSN+FHSRbnMGDAsIEgIg46k6PmzgD3
	alq8RGt4vuFvbu76gFEg9ZQx3suRR3uMFGWaSVPlxeOtkoquDESK93/YZKfGqSNpBgcC
	IGzArUs0wFLHWPT1NCghr60BizUEkUy3NedKd5z37VKtnSE38sLme0xkypOBOHKjol0V
	P0bVDKLFQj2tlJNYj2nbL45FbVwoQMQxcFxhGpU5RcFlK7B6n9HwoHSEDY3PcGi2IWte
	AK5Q==
X-Gm-Message-State: AODbwcDTLVuIkHyKkx6Mju/4KP26w3v3D7AWVEzZOgT6tI239Nf6NTFX
	i4yrs888MBTrEA==
X-Received: by 10.55.50.204 with SMTP id y195mr4614681qky.264.1494414995620;
	Wed, 10 May 2017 04:16:35 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	f203sm1990446qka.11.2017.05.10.04.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 04:16:35 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-6-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <640edc6d-0a7c-49c2-5bf1-e13468662e88@amsat.org>
Date: Wed, 10 May 2017 08:16:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494348286-10253-6-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel PATCH 5/5] msf2: Add
 Emcraft's Smartfusion2 SOM kit.
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +BeVNPMqqoba

Hi Subbaraya,

On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/arm/Makefile.objs |  1 +
>  hw/arm/msf2-som.c    | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 hw/arm/msf2-som.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index ae5e4a3..b626a43 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-soc.o
>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-y += netduino2.o
> +obj-y += msf2-som.o
>  obj-y += sysbus-fdt.o
>
>  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> new file mode 100644
> index 0000000..bc44169
> --- /dev/null
> +++ b/hw/arm/msf2-som.c
> @@ -0,0 +1,67 @@
> +/*
> + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/arm/msf2-soc.h"
> +#include "hw/arm/arm.h"
> +
> +static void msf2_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    DeviceState *spi_flash;
> +    MSF2State *soc;
> +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> +    qemu_irq cs_line;
> +    SSIBus *spi_bus;
> +
> +    dev = qdev_create(NULL, TYPE_MSF2_SOC);
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +
> +    soc = MSF2_SOC(dev);
> +
> +    /* Attach SPI flash to SPI0 controller */
> +    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
> +    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
> +    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
> +    if (dinfo) {
> +        qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
> +                                    &error_fatal);
> +    }
> +    qdev_init_nofail(spi_flash);
> +    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       ENVM_SIZE);
> +}
> +
> +static void msf2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
> +    mc->init = msf2_init;
> +}
> +
> +DEFINE_MACHINE("smartfusion2-som", msf2_machine_init)

This is not the only SoM existing using a SF2, what about beeing more 
specific, like "emcraft-sf2"?
Likewise I'd rename the functions with a pattern such 'emcraft_sf2_*()' 
although the filename is correct.

Regards,

Phil.
