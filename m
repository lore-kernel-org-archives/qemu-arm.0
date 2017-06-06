Received: by 10.25.0.23 with SMTP id 23csp1459067lfa;
        Tue, 6 Jun 2017 00:31:39 -0700 (PDT)
X-Received: by 10.200.39.93 with SMTP id h29mr29106792qth.76.1496734299089;
        Tue, 06 Jun 2017 00:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496734299; cv=none;
        d=google.com; s=arc-20160816;
        b=AxzQoLWwlLR647n8eN68ZgZUg958K+oOgi11SeXb07mgqAgU9DUh22K7KPzuM8xQtv
         yCiidNNFRhkx/fMzMfS88PUvvXDPfq0Gge9p/5uFcgzjzisyEptuWrejd1tI3Ndv/vVn
         6IfjrhGZzFwb4kyMLkRZlo6mR65QewkzEkbCdONaYKHUHmqRtrLG59orvpguNVYOrhLq
         ghlac77zZokqQu8V6E9YYP7Ji/YPk9Au3scK5OVdh0MNXBgm8ViETEdTyMsrBwzIIYaK
         pu44dFDaN7qM5o4NR46WabyzYytnpT3IHUA2+RkyJBqIesqGgorvCqG2BnEw755HzsbO
         BcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xR+WT+X0bWEoSHzjgh3Uf8zx2jdbwkav1mmG219OVSI=;
        b=IjJylLUMq9PsmT92TPSmr5in5HIY+G8CrX4d12xp0uaLUvus6BsoySaefyjRwCo2eV
         kK3Y8lI3jMl7HwwcXd9Yqhz62N0BoM2sYK1O6TxURLY5Pb0E824j3jlIalsO061rXui0
         eiJ1PueeYkq76P9ydrbx1qHOEnj77nsXUeLRFOTQ24EHJLjx0PXrkRZdlkuxKLJ4/3nq
         5iInj+zugVOeINO/laUfNISm/APoqcByylvaO4HjOFH+9Kr9pZlXsyRqviNkpOaI7Iat
         IHu3TTSUPdi1jSJrOa2bE/2hh4VrbimF9MBcgdKkl4rUz20CrsFRxA14+pmYioAF8v0R
         jiSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m49si2612327qtc.334.2017.06.06.00.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 00:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dI8xk-0006AQ-5b
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 03:31:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dI8xb-00067E-VW
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 03:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dI8xa-0000NM-BU
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 03:31:28 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:36636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dI8xW-0000MR-Er; Tue, 06 Jun 2017 03:31:22 -0400
Received: by mail-yb0-x244.google.com with SMTP id r66so5909493yba.3;
	Tue, 06 Jun 2017 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xR+WT+X0bWEoSHzjgh3Uf8zx2jdbwkav1mmG219OVSI=;
	b=kzZH7bp9bo8/f41OQELOkBqVfzQhgNrLHqW/jTW+j0KnFJkirpFQRgtxf/1NSrALCh
	nRyVkniqfKd7mOas7aSAnqKCqj68MqAJhkVffMZFwRU39u2V13G3vukS+Y9tRtxejUj1
	EPREMyf7p3skvNn7Mit9cqXN8DPmEQJ6mSpBLLLwZ5KSFjVGu8X5cIHtjB7TK3Pu47Je
	oqCJLHj+3ktUvFdnwhMPOQhKxsmfzrKXQUNruGI7DI8a5B9B1tnSILR0FcthnRWmUSCP
	ls19VGI7E4qebBMKlIskphal17HEp8jrpqZ1140N2jBBuKd2JuymQIMMdGnSqpeOomjl
	pXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xR+WT+X0bWEoSHzjgh3Uf8zx2jdbwkav1mmG219OVSI=;
	b=k120DSRingStdot/+pl8iPqYWsmRY80FqQQnQ6vgP0DIZ1FyOHaafTuUqqTDCA1zto
	UT7yLQW2LGImmLQ8zESE6UokYtmdmC2M3YwLE0AV2WY1zhrj8Zv3LbLvjPLDVMiJ8SCz
	p7XiDhwh56g+sA6lzLBFnHyMKEPifWXUGcN5BwNfonODy7U+5/IMy0GOy3Fd7/tmVDh1
	hJaHi0gpmpFXjfrxhf0YPcIfQRtKGFfVCN7oGJTmF5difkSInaGaqOWXne+1vbW0jzzq
	xsktRq1Z83F8U6Nja85wELDGma7Fv8/iqKck0+erUAXxcKr/sRgpWbdE2YO8MdM4dfu1
	MeSg==
X-Gm-Message-State: AODbwcDpkwig8rfbbzm0DiVvEybCirxXxLQ3ckEy7KlMbZ+iZBWAPLsj
	66KY7S03Re20rWBs40aiuYRf9YxCqw==
X-Received: by 10.37.190.77 with SMTP id d13mr1694551ybm.47.1496734280126;
	Tue, 06 Jun 2017 00:31:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.199 with HTTP; Tue, 6 Jun 2017 00:31:19 -0700 (PDT)
In-Reply-To: <6c077dcf-e8a8-aae9-9023-f197007a98dc@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<6c077dcf-e8a8-aae9-9023-f197007a98dc@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 6 Jun 2017 13:01:19 +0530
Message-ID: <CALHRZuqu-oP46EF7Y8AAtAr_orJaGNDZzba9NS833DNJQ-KVQg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="089e0822dda0171b580551459bef"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ryW8pd/9unnT

--089e0822dda0171b580551459bef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, May 31, 2017 at 11:34 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
wrote:

> Hi Subbaraya,
>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Emulated Emcraft's Smartfusion2 System On Module starter
>> kit.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/arm/Makefile.objs |  1 +
>>  hw/arm/msf2-som.c    | 89 ++++++++++++++++++++++++++++++
>> ++++++++++++++++++++++
>>  2 files changed, 90 insertions(+)
>>  create mode 100644 hw/arm/msf2-som.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index c828061..4b02093 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -5,6 +5,7 @@ obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellari=
s.o
>>  obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>  obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
>>  obj-y +=3D netduino2.o
>> +obj-y +=3D msf2-som.o
>>  obj-y +=3D sysbus-fdt.o
>>
>>  obj-y +=3D armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
>> new file mode 100644
>> index 0000000..cd2b759
>> --- /dev/null
>> +++ b/hw/arm/msf2-som.c
>> @@ -0,0 +1,89 @@
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
>> +#include "hw/arm/msf2-soc.h"
>> +#include "hw/arm/arm.h"
>> +#include "exec/address-spaces.h"
>> +
>> +#define DDR_BASE_ADDRESS      0xA0000000
>> +#define DDR_SIZE              (64 * M_BYTE)
>> +
>> +static void emcraft_sf2_init(MachineState *machine)
>> +{
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
>> +    vmstate_register_ram_global(ddr);
>> +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
>> +
>> +    dev =3D qdev_create(NULL, TYPE_MSF2_SOC);
>> +    qdev_prop_set_string(dev, "part-name", "M2S010");
>> +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
>> +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
>> +
>> +    /*
>> +     * pclk0 and pclk1 are configurable in Libero.
>> +     * Emcraft's SoM kit comes with these settings by default.
>> +     */
>> +    qdev_prop_set_uint32(dev, "pclk0", 71 * 1000000);
>> +    qdev_prop_set_uint32(dev, "pclk1", 71 * 1000000);
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
>> +    mc->init =3D emcraft_sf2_init;
>> +}
>> +
>> +DEFINE_MACHINE("smartfusion2-som", emcraft_sf2_machine_init)
>>
>
> Here I still disagree with the machine name, what do you think about
> "emcraft-sf2" or "emcraft-m2s[-fg484-som]" as described by Emcraft in the=
ir
> website (but shorter is easier to type)?
>

I missed this. I will use emcraft-sf2 for machine name.

Thanks,
Sundeep

--089e0822dda0171b580551459bef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, May 31, 2017 at 11:34 AM, Philippe Mathieu-Daud=C3=A9 <=
span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f=
4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi S=
ubbaraya,<div><div class=3D"h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Emulated Emcraft&#39;s Smartfusion2 System On Module starter<br>
kit.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Makefile.objs |=C2=A0 1 +<br>
=C2=A0hw/arm/msf2-som.c=C2=A0 =C2=A0 | 89 ++++++++++++++++++++++++++++++<wb=
r>++++++++++++++++++++++<br>
=C2=A02 files changed, 90 insertions(+)<br>
=C2=A0create mode 100644 hw/arm/msf2-som.c<br>
<br>
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
index c828061..4b02093 100644<br>
--- a/hw/arm/Makefile.objs<br>
+++ b/hw/arm/Makefile.objs<br>
@@ -5,6 +5,7 @@ obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o=
<br>
=C2=A0obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o<=
br>
=C2=A0obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
=C2=A0obj-y +=3D netduino2.o<br>
+obj-y +=3D msf2-som.o<br>
=C2=A0obj-y +=3D sysbus-fdt.o<br>
<br>
=C2=A0obj-y +=3D armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o<=
br>
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c<br>
new file mode 100644<br>
index 0000000..cd2b759<br>
--- /dev/null<br>
+++ b/hw/arm/msf2-som.c<br>
@@ -0,0 +1,89 @@<br>
+/*<br>
+ * SmartFusion2 SOM starter kit(from Emcraft) emulation.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/arm/msf2-soc.h&quot;<br>
+#include &quot;hw/arm/arm.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+<br>
+#define DDR_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 0xA0000000<br>
+#define DDR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (64 * M_B=
YTE)<br>
+<br>
+static void emcraft_sf2_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev;<br>
+=C2=A0 =C2=A0 DeviceState *spi_flash;<br>
+=C2=A0 =C2=A0 MSF2State *soc;<br>
+=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get_next(IF_MTD);<br>
+=C2=A0 =C2=A0 qemu_irq cs_line;<br>
+=C2=A0 =C2=A0 SSIBus *spi_bus;<br>
+=C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_memory();<br>
+=C2=A0 =C2=A0 MemoryRegion *ddr =3D g_new(MemoryRegion, 1);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_ram(ddr, NULL, &quot;ddr-ram&quot;, DDR_S=
IZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
+=C2=A0 =C2=A0 vmstate_register_ram_global(dd<wbr>r);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(sy<wbr>smem, DDR_BASE_ADDRESS, d=
dr);<br>
+<br>
+=C2=A0 =C2=A0 dev =3D qdev_create(NULL, TYPE_MSF2_SOC);<br>
+=C2=A0 =C2=A0 qdev_prop_set_string(dev, &quot;part-name&quot;, &quot;M2S01=
0&quot;);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;eNVM-size&quot;, M2S010_ENVM=
_SIZE);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;eSRAM-size&quot;, M2S010_ESR=
AM_SIZE);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* pclk0 and pclk1 are configurable in Libero.<br>
+=C2=A0 =C2=A0 =C2=A0* Emcraft&#39;s SoM kit comes with these settings by d=
efault.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;pclk0&quot;, 71 * 1000000);<=
br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;pclk1&quot;, 71 * 1000000);<=
br>
+<br>
+=C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(dev), true, &quot;reali=
zed&quot;, &amp;error_fatal);<br>
+<br>
+=C2=A0 =C2=A0 soc =3D MSF2_SOC(dev);<br>
+<br>
+=C2=A0 =C2=A0 /* Attach SPI flash to SPI0 controller */<br>
+=C2=A0 =C2=A0 spi_bus =3D (SSIBus *)qdev_get_child_bus(dev, &quot;spi0&quo=
t;);<br>
+=C2=A0 =C2=A0 spi_flash =3D ssi_create_slave_no_init(spi_b<wbr>us, &quot;s=
25sl12801&quot;);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint8(spi_flash, &quot;spansion-cr2nv&quot;, 1=
);<br>
+=C2=A0 =C2=A0 if (dinfo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(spi_flash, &quot;drive&quo=
t;, blk_by_legacy_dinfo(dinfo),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qdev_init_nofail(spi_flash);<br>
+=C2=A0 =C2=A0 cs_line =3D qdev_get_gpio_in_named(spi_fla<wbr>sh, SSI_GPIO_=
CS, 0);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEV<wbr>ICE(&amp;soc-&gt;spi[0]),=
 1, cs_line);<br>
+<br>
+=C2=A0 =C2=A0 armv7m_load_kernel(ARM_CPU(fir<wbr>st_cpu), machine-&gt;kern=
el_filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0soc-&gt;envm_size);<br>
+}<br>
+<br>
+static void emcraft_sf2_machine_init(Machi<wbr>neClass *mc)<br>
+{<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;SmartFusion2 SOM kit from Emcraft&quot=
;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D emcraft_sf2_init;<br>
+}<br>
+<br>
+DEFINE_MACHINE(&quot;smartfusion2-<wbr>som&quot;, emcraft_sf2_machine_init=
)<br>
</blockquote>
<br></div></div>
Here I still disagree with the machine name, what do you think about &quot;=
emcraft-sf2&quot; or &quot;emcraft-m2s[-fg484-som]&quot; as described by Em=
craft in their website (but shorter is easier to type)?<br></blockquote><di=
v><br></div><div>I missed this. I will use emcraft-sf2 for machine name.</d=
iv><div><br></div><div>Thanks,</div><div>Sundeep=C2=A0<br></div></div><br><=
/div></div>

--089e0822dda0171b580551459bef--
