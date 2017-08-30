Received: by 10.223.188.70 with SMTP id a6csp805401wrh;
        Wed, 30 Aug 2017 05:27:15 -0700 (PDT)
X-Received: by 10.55.77.132 with SMTP id a126mr10680242qkb.151.1504096035260;
        Wed, 30 Aug 2017 05:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504096035; cv=none;
        d=google.com; s=arc-20160816;
        b=K9zsPgResoYGZSPcucWvogCiKee/ijxRQoRUMhn4pSdOu1Yn3Kf90DpSbOL+Sjvy3W
         05m66qUza7e3dViKxO0Vz+h8nvtyxU//76TEdL7cU3Scb36YeIXQ5tBYc8sLIagUErtk
         Eum1SclLV4hoNidlhRGr+KwjM0xSvW0FM/cCl1wUNSr4vIxiATB/5ARN56DOl+k3boeL
         lpbrq7pFakkusQ4v22gOU2GnmSSpmPi4kpq2gVdWyvuy5mnRrv4N1w9LdkWJAzhEET4F
         YuOfa7jFm0cO3SoKHpiiD2b3PP+LgeGfwg/YGIf9rquwIxiCOsB5P5vsOdDIufpmQt2z
         w0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5RovGVyId5pIQqJN4eweZun+K3UI1LPx2BhNf7pjC9M=;
        b=Jjazs2z/T3Y+T/zaq21esA+5Dc6OLddx9jxROcubqyTgJMxyyZ8qaitsRlkEOulufj
         rzsShiyJKYokjyRgtWFxnIaptYBAmXCRXTMG9jsVxDpr+V92B09ytR5MJrIzgirF2M3p
         a+UIQdCQ3UXPMH4utrUzFxCULsDSuFshNSdkyzcd+tofKfwAHfgYKe76Mn3Vn2iJdGyb
         rEFmwviluNSgyq5VaZzSHhmjF2MROky+6YuakyR6guBoaP3GzlWfNCVHjXI+BCSTTznH
         Q8F9lSYXBkNBMnmF8S6UVobNHhlV/cnwvfibPDN+AkYK7ubTG/NOhGM60dn9keuTmocP
         TN5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=NJxfMyJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si5270549qtb.377.2017.08.30.05.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 05:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=NJxfMyJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dn25Q-00025n-Vt
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 08:27:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dn236-00009J-C5
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 08:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dn234-0002lh-HZ
	for qemu-devel@nongnu.org; Wed, 30 Aug 2017 08:24:48 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dn234-0002lS-AV; Wed, 30 Aug 2017 08:24:46 -0400
Received: by mail-vk0-x22b.google.com with SMTP id z187so17019617vkd.2;
	Wed, 30 Aug 2017 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nRPmrAoUz/kOGFdyV0l+r+3O1F7We0SgwqTq6eaJL5c=;
	b=NJxfMyJic+zV+aG2AISGmJSgMfBq2gsdQxOJBAuE3US9bx1ZuwPscv89Y63FgLSoGM
	A+ve7eREjjej058Q1MmnKM5KGIKFk3nj6zT6CE2458TT54aSHg4cmHep+LzH7MeacJJM
	40zqy+4ERbuy3BIo6IWWdHlWVrx3lJoYYC3xYDVA+FCdd5QYZJaWvIPAbsG+YdrnhB9+
	FDZ1cIKs2FohVddwQ3Bahn7S5vJaNM/M+QPylPyzH7NCmfwk6cSRYYoZY5RKhNcz9rr0
	LzhbKG3cLlNbQ4BksvcxEZT2VBNwP0WRFS9WCnuezQt/q1kxCORuzt6oue24EzFxuGTk
	gLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nRPmrAoUz/kOGFdyV0l+r+3O1F7We0SgwqTq6eaJL5c=;
	b=pocIhCT4OWlOzAyMU+JrgDkLsg241mjr+f6fsrwW82JBmeZfJlMnDTKvAsgheNa8UO
	zhRp2jCkGaWjo3vVKt2lvJBXUV7nX3Bvrbk7AA6xCAE5dizVjV9TNxFrMC4jxs12TAtN
	18jbRw06E3at6f1fnopoVtat/SUOtHuzNPHBl4X5UZRO6Gfbk02LGHjp4zzrDF07cu+D
	+NkckTzytY7XpebM8O9dAQ0/Cq4JJZmeV4EpWV+tJESaAJx/BP2e+M8DWPY1bgEh99AF
	LcytB3SjdZlsv0PvLIR0nrzf1Z4tJ3SbFvmYKL5mjuM3kAbWMq8gH6uNuAko7p49Fb6j
	/zpA==
X-Gm-Message-State: AHYfb5jZV8F86EOJnaKoZbwP7lmokRoIT1QaR4GLzjQ5bKt6Cg+ohWo0
	0u4XeuxskPT7vQ4Qsrvp5gNAMUO07A==
X-Google-Smtp-Source: ADKCNb42mrVpRtxoud6t6POxoa/TzdQf4IQfPFIL3kqxZAztdqRnuyZWhXGP6Iz+UT7DDkUMCUiN8xPS9bzItZJ8pUk=
X-Received: by 10.31.248.3 with SMTP id w3mr764782vkh.53.1504095885661; Wed,
	30 Aug 2017 05:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.75.196 with HTTP; Wed, 30 Aug 2017 05:24:45 -0700 (PDT)
In-Reply-To: <d57d4bab-51ec-901c-7474-20dc5156f795@amsat.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-6-git-send-email-sundeep.lkml@gmail.com>
	<d57d4bab-51ec-901c-7474-20dc5156f795@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 30 Aug 2017 17:54:45 +0530
Message-ID: <CALHRZupSDn-a4oHqcZCjppj8NX=sZJ6Uk+xXhLfSs_W3zbJCHw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v7 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HWFMdwsb3WRW

Hi Philippe,

On Wed, Aug 30, 2017 at 7:18 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
>
> On 08/28/2017 01:38 PM, Subbaraya Sundeep wrote:
>
>> Emulated Emcraft's Smartfusion2 System On Module starter
>> kit.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>   hw/arm/Makefile.objs |  2 +-
>>   hw/arm/msf2-som.c    | 94 ++++++++++++++++++++++++++++++
>> ++++++++++++++++++++++
>>   2 files changed, 95 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/arm/msf2-som.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index df36a03..e81a7dc 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>>   obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
>>   obj-$(CONFIG_MPS2) +=3D mps2.o
>> -obj-$(CONFIG_MSF2) +=3D msf2-soc.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-soc.o msf2-som.o
>> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
>> new file mode 100644
>> index 0000000..fd89ba9
>> --- /dev/null
>> +++ b/hw/arm/msf2-som.c
>> @@ -0,0 +1,94 @@
>> +/*
>> + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/boards.h"
>> +#include "hw/arm/arm.h"
>> +#include "exec/address-spaces.h"
>> +#include "qemu/cutils.h"
>> +#include "hw/arm/msf2-soc.h"
>> +
>> +#define DDR_BASE_ADDRESS      0xA0000000
>> +#define DDR_SIZE              (64 * M_BYTE)
>> +
>> +#define M2S010_ENVM_SIZE      (256 * K_BYTE)
>> +#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
>> +
>> +static void emcraft_sf2_init(MachineState *machine)
>>
>
> Since Emcraft can produce an upgraded SF2 SoC based on a different MCU, I
> prefer you rename it:
>
> static void emcraft_sf2_s2s010_init(MachineState *machine)


Ok will change.

>
>
> +{
>> +    DeviceState *dev;
>> +    DeviceState *spi_flash;
>> +    MSF2State *soc;
>> +    DriveInfo *dinfo =3D drive_get_next(IF_MTD);
>> +    qemu_irq cs_line;
>> +    SSIBus *spi_bus;
>> +    MemoryRegion *sysmem =3D get_system_memory();
>> +    MemoryRegion *ddr =3D g_new(MemoryRegion, 1);
>> +
>> +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
>> +                           &error_fatal);
>> +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
>> +
>> +    dev =3D qdev_create(NULL, TYPE_MSF2_SOC);
>> +    qdev_prop_set_string(dev, "part-name", "M2S010");
>> +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
>> +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
>> +
>> +    /*
>> +     * CPU clock and peripheral clocks(APB0, APB1)are configurable
>> +     * in Libero. CPU clock is divided by APB0 and APB1 divisors for
>> +     * peripherals. Emcraft's SoM kit comes with these settings by
>> default.
>> +     */
>> +    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
>> +    qdev_prop_set_uint32(dev, "apb0div", 2);
>> +    qdev_prop_set_uint32(dev, "apb1div", 2);
>> +
>> +    object_property_set_bool(OBJECT(dev), true, "realized",
>> &error_fatal);
>> +
>> +    soc =3D MSF2_SOC(dev);
>> +
>> +    /* Attach SPI flash to SPI0 controller */
>> +    spi_bus =3D (SSIBus *)qdev_get_child_bus(dev, "spi0");
>> +    spi_flash =3D ssi_create_slave_no_init(spi_bus, "s25sl12801");
>> +    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(spi_flash, "drive",
>> blk_by_legacy_dinfo(dinfo),
>> +                                    &error_fatal);
>> +    }
>> +    qdev_init_nofail(spi_flash);
>> +    cs_line =3D qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
>> +
>> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
>> +                       soc->envm_size);
>> +}
>> +
>> +static void emcraft_sf2_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc =3D "SmartFusion2 SOM kit from Emcraft";
>>
>
>     mc->desc =3D "SmartFusion2 SOM kit from Emcraft (M2S010)";
>
> +    mc->init =3D emcraft_sf2_init;
>>
>
>     mc->init =3D emcraft_sf2_s2s010_init;
>
> +}
>> +
>> +DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
>>
>
> Good work :)
>
With the changes:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Thank you :)
Sundeep
