Received: by 10.28.153.193 with SMTP id b184csp49599wme;
        Thu, 18 Jan 2018 13:43:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBoteIdoc8d3hFykbZ7gLNb1GoJIoaiX8gpoYQy25SlQJcoGLEIt8On5sjpFI6LNt5m0+/mhG
X-Received: by 10.37.219.133 with SMTP id g127mr12703572ybf.425.1516311794168;
        Thu, 18 Jan 2018 13:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516311794; cv=none;
        d=google.com; s=arc-20160816;
        b=QV0UGoO4cZcHG05hvsdtQ7cBdpePLglU4n+K6NLU5yTnjkte9zvkCbLNjy1huDawmk
         eyiT0Lq6SYAqW83MNtlGdt3+dd0n4QzgRXIt7BDs31wwvGsgKk6XvoSy4NX+nAhOPajA
         APhb6u6p553VAckoKqbiC1/RbqBRGd0htCuQh61HcQa6FRYkDBpa/fWASYRkuUJuhU8J
         fmY26GFUbBHpcprEpnCybipD4k1WzsCc7TejvTMyvQum6SYe3RmHlWdMocC2E0TeHsGl
         cMZ28TIvbsA9NKrf2jIqTQQgnDEipsfBL5zLRwSv5U+06lg4Aedehj1sBENXS0CIwPkB
         QahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZoGwDaMTFEu2666ICVVOiU1VR253/2nUwZBcFnZ/FG4=;
        b=hV3jvha0s/62Tt3MmoI8cw2OP1I6UXVAv+0hCP77yiZIZG/54YMfEECkq79hU2sT6T
         GNKLxRpyC/5IDsvVItcjHgdwqcPDGY3rYrEzp52BhKLMIpBPjBP6RYcf+SMLmWSfbVOK
         uVU6QLUdHPeNsfj93jiP4CKPzuD3L18O87JSvwOa0c5mRnDpY+XFOdWFQ2Mo0N0Mxo/A
         tqIgD4yoXyyFcygCrDfhC394zgQ7eNbCi6CTBtGS4P5gY4obhQ6K9E4JIaAyuBis5rAQ
         yLcSb4/wGYW3gNWiPN8BK5S5MJlFH/Lj7xki8Pkwx+BVcgwc6JEwX5jEySYj3ut1EbeC
         zAUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eMEfdoaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si311230ybc.230.2018.01.18.13.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 13:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eMEfdoaJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecHxp-0006UN-LW
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 16:43:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHxi-0006Tk-EK
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:43:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHxd-0001Xp-9S
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 16:43:06 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecHxd-0001Xd-4R; Thu, 18 Jan 2018 16:43:01 -0500
Received: by mail-qt0-x244.google.com with SMTP id m59so34035060qte.11;
	Thu, 18 Jan 2018 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZoGwDaMTFEu2666ICVVOiU1VR253/2nUwZBcFnZ/FG4=;
	b=eMEfdoaJJPHaWI+/7P7yOYoHI3R658Bs7gOiyjttTriFsLdWNOHfJt2MHumROToPMJ
	VNXd2WFl9JcexxRYUW7XKWSi8prO0Hb6xW30NYLqSWp47JEyGzdBKgpFKXY5de4pdt7m
	RChFET4m+OQDBnR8Cr7gzT/FxXO2bfFT58I9Jnes+kkStqIXkrs0qhYD4MXcSInqNTHt
	KKKhw0gWif9ptYDG1BAxLYY6XveyXOBJNQnJ2jPvByp02AXeoCP2HHKoEm8xFYMWwJz/
	rcHwWreUyGbGFdShlpAWo9ZqA8WgkM0m8Myt7brW14HX6zbKAzvB+2JgMLMqE+BqIQ4e
	MFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZoGwDaMTFEu2666ICVVOiU1VR253/2nUwZBcFnZ/FG4=;
	b=ISB2mHELWTTqP+bN8KGY1mUFMJ++C73aLpietuRhAPS8F72SNIwCZjVMSLnXvNHrQX
	WZmfAiufMO4MNe2hsIjlxL+CYGeeJkQLMrKPQlXWVlDkTMMGTKz8kmNGJQQJMTO2V5KV
	wYU3FsQclHF7WCk+fnBLKexC8Io6cYbcWhYGQJCRlis/cn7EN6xDerfsRgC9OXm9XMCJ
	8dtOrTwat9iVyNFWEFVijZtrnxohkEC99alQ7Amuuz29MwphM6GeOeo6TmoztowpBBdG
	8QzQe8kGF1HkgGPEBcl/QsqPPVoeg57M/g/D9ub12yLlACmEOMVNMZpoEn+OqTkgfRwv
	8OFw==
X-Gm-Message-State: AKwxytcK0jqewuvGJF3Srym6zQENW0HNbIfwrEUxiYtiFrnbYaqz6oSB
	jAu6zNnq53CO8ouSpB3ji/WHB1+J
X-Received: by 10.200.37.13 with SMTP id 13mr19157120qtm.306.1516311780347;
	Thu, 18 Jan 2018 13:43:00 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	u17sm5053428qka.18.2018.01.18.13.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 13:42:59 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<f5426a36d6a0d997d5f6445201861445d8e857da.1516300623.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0f5a2011-7378-dcee-cf31-5bfb341b85f8@amsat.org>
Date: Thu, 18 Jan 2018 18:42:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <f5426a36d6a0d997d5f6445201861445d8e857da.1516300623.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v6 8/9] xlnx-zynqmp-pmu: Connect the IPI
 device to the PMU
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1IPhYMyd2Yb

On 01/18/2018 03:38 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
> V4:
>  - Move the IPI to the machine instead of the SoC
> 
>  hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 7312bfe23e..999a5657cf 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -24,6 +24,7 @@
>  #include "cpu.h"
>  #include "boot.h"
>  
> +#include "hw/intc/xlnx-zynqmp-ipi.h"
>  #include "hw/intc/xlnx-pmu-iomod-intc.h"
>  
>  /* Define the PMU device */
> @@ -38,6 +39,15 @@
>  
>  #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
>  
> +#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
> +
> +static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
> +    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
> +};
> +static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
> +    19, 20, 21, 22,
> +};
> +
>  typedef struct XlnxZynqMPPMUSoCState {
>      /*< private >*/
>      DeviceState parent_obj;
> @@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
>      MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
> +    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];

Why use pointers and g_new() here?

Isn't a plain array simpler?

   XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];

(same apply to pmu_rom/ram)

Or maybe do you plan to start implementing MachineClass::exit()?

(or go in this direction, which might make sens thinking about having a
multiarch single binary).

> +    qemu_irq irq[32];
> +    int i;
>  
>      /* Create the ROM */
>      memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
> @@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>                                &error_abort);
>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
>  
> +    for (i = 0; i < 32; i++) {
> +        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
> +    }
> +
> +    /* Create and connect the IPI device */
> +    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> +        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
> +        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
> +        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
> +    }
> +
> +    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> +        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
> +                                 &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
> +    }
> +
>      /* Load the kernel */
>      microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
>                             machine->ram_size,
> 
