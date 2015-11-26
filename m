Received: by 10.182.158.201 with SMTP id ww9csp449233obb;
        Wed, 25 Nov 2015 23:14:49 -0800 (PST)
X-Received: by 10.140.201.13 with SMTP id w13mr36224039qha.15.1448522089756;
        Wed, 25 Nov 2015 23:14:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o38si25032912qge.111.2015.11.25.23.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 23:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1qlV-0002F1-Hk
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 02:14:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1ql8-0001x3-TS
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1ql7-0004bT-6I
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:14:26 -0500
Received: from zose-mta02.web4all.fr ([185.49.20.43]:51978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a1ql2-0004bB-4e; Thu, 26 Nov 2015 02:14:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id 830F64090B;
	Thu, 26 Nov 2015 08:14:18 +0100 (CET)
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id NOss_jhajowc; Thu, 26 Nov 2015 08:14:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta02.web4all.fr (Postfix) with ESMTP id F3C6242A96;
	Thu, 26 Nov 2015 08:14:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-02.w4a.fr
Received: from zose-mta02.web4all.fr ([127.0.0.1])
	by localhost (zose-mta02.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id PlEpV2VLoI-b; Thu, 26 Nov 2015 08:14:16 +0100 (CET)
Received: from [192.168.1.128] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta02.web4all.fr (Postfix) with ESMTPSA id 8F3A44090B;
	Thu, 26 Nov 2015 08:14:16 +0100 (CET)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1447964804.git.jcd@tribudubois.net>
	<469d346516e3bf701e5386abc43a845fa46d18cf.1447964804.git.jcd@tribudubois.net>
	<CAPokK=qvFbCPFH4x8=Zp+Kg0wvXVX2UVe2N0VFuBzDQSDiQF1w@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <5656B148.1020408@tribudubois.net>
Date: Thu, 26 Nov 2015 08:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=qvFbCPFH4x8=Zp+Kg0wvXVX2UVe2N0VFuBzDQSDiQF1w@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.43
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 3/3] i.MX: Add an i.MX25 specific CCM
	class/instance.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E68wV7ZCeSI1

Le 25/11/2015 06:51, Peter Crosthwaite a =E9crit :
> On Thu, Nov 19, 2015 at 12:40 PM, Jean-Christophe Dubois
> <jcd@tribudubois.net> wrote:
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>> ---
>>
>> Changes since v1:
>>   * rework loging to match other i.MX drivers
>>
>> Changes since v2:
>>   * We moved to an inheritance QOM scheme
>>
>>   hw/arm/fsl-imx25.c          |   2 +-
>>   hw/misc/Makefile.objs       |   1 +
>>   hw/misc/imx25_ccm.c         | 243 ++++++++++++++++++++++++++++++++++=
++++++++++
>>   include/hw/arm/fsl-imx25.h  |   4 +-
>>   include/hw/misc/imx25_ccm.h |  59 +++++++++++
>>   5 files changed, 306 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/misc/imx25_ccm.c
>>   create mode 100644 include/hw/misc/imx25_ccm.h
>>
>> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
>> index 5526c22..0aacc91 100644
>> --- a/hw/arm/fsl-imx25.c
>> +++ b/hw/arm/fsl-imx25.c
>> @@ -38,7 +38,7 @@ static void fsl_imx25_init(Object *obj)
>>       object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
>>       qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
>>
>> -    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
>> +    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
>>       qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
>>
>>       for (i =3D 0; i < FSL_IMX25_NUM_UARTS; i++) {
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index c77f3e3..8a235df 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -27,6 +27,7 @@ obj-$(CONFIG_ECCMEMCTL) +=3D eccmemctl.o
>>   obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pmu.o
>>   obj-$(CONFIG_IMX) +=3D imx_ccm.o
>>   obj-$(CONFIG_IMX) +=3D imx31_ccm.o
>> +obj-$(CONFIG_IMX) +=3D imx25_ccm.o
>>   obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>>   obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>>   obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
>> diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
>> new file mode 100644
>> index 0000000..a6c9bff
>> --- /dev/null
>> +++ b/hw/misc/imx25_ccm.c
>> @@ -0,0 +1,243 @@
>> +/*
>> + * IMX25 Clock Control Module
>> + *
>> + * Copyright (C) 2012 NICTA
>> + * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + * To get the timer frequencies right, we need to emulate at least pa=
rt of
>> + * the CCM.
>> + */
>> +
>> +#include "hw/misc/imx25_ccm.h"
>> +
>> +#ifndef DEBUG_IMX25_CCM
>> +#define DEBUG_IMX25_CCM 0
>> +#endif
>> +
>> +#define DPRINTF(fmt, args...) \
>> +    do { \
>> +        if (DEBUG_IMX25_CCM) { \
>> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX25_CCM, \
>> +                                             __func__, ##args); \
>> +        } \
>> +    } while (0)
>> +
>> +#define CKIH_FREQ 24000000 /* 24MHz crystal input */
>> +
>> +static const VMStateDescription vmstate_imx25_ccm =3D {
>> +    .name =3D TYPE_IMX25_CCM,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32(mpctl, IMX25CCMState),
>> +        VMSTATE_UINT32(upctl, IMX25CCMState),
>> +        VMSTATE_UINT32(cctl, IMX25CCMState),
>> +        VMSTATE_UINT32_ARRAY(cgcr, IMX25CCMState, 3),
>> +        VMSTATE_UINT32_ARRAY(pcdr, IMX25CCMState, 4),
>> +        VMSTATE_UINT32(rcsr, IMX25CCMState),
>> +        VMSTATE_UINT32(crdr, IMX25CCMState),
>> +        VMSTATE_UINT32_ARRAY(dcvr, IMX25CCMState, 4),
>> +        VMSTATE_UINT32_ARRAY(ltr, IMX25CCMState, 4),
>> +        VMSTATE_UINT32_ARRAY(ltbr, IMX25CCMState, 2),
>> +        VMSTATE_UINT32_ARRAY(pmcr, IMX25CCMState, 3),
>> +        VMSTATE_UINT32(mcr, IMX25CCMState),
>> +        VMSTATE_UINT32_ARRAY(lpimr, IMX25CCMState, 2),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>> +static uint32_t imx25_ccm_get_mpll_clk(DeviceState *dev)
>> +{
>> +    IMX25CCMState *s =3D IMX25_CCM(dev);
>> +
>> +    DPRINTF("()\n");
>> +
>> +    if (EXTRACT(s->cctl, MPLL_BYPASS)) {
>> +        return CKIH_FREQ;
>> +    } else {
>> +        return imx_ccm_calc_pll(s->mpctl, CKIH_FREQ);
>> +    }
>> +}
>> +
>> +static uint32_t imx25_ccm_get_upll_clk(DeviceState *dev)
>> +{
>> +    IMX25CCMState *s =3D IMX25_CCM(dev);
>> +
>> +    DPRINTF("()\n");
>> +
>> +    return imx_ccm_calc_pll(s->upctl, CKIH_FREQ);
>> +}
>> +
>> +static uint32_t imx25_ccm_get_mcu_clk(DeviceState *dev)
>> +{
>> +    IMX25CCMState *s =3D IMX25_CCM(dev);
>> +
>> +    DPRINTF("()\n");
>> +
>> +    if (EXTRACT(s->cctl, ARM_SRC)) {
>> +        return (imx25_ccm_get_mpll_clk(dev) * 3 / 4) /
>> +               (1 + EXTRACT(s->cctl, ARM_CLK_DIV));
>> +    } else {
>> +        return imx25_ccm_get_mpll_clk(dev) /
>> +               (1 + EXTRACT(s->cctl, ARM_CLK_DIV));
>> +    }
>> +}
>> +
>> +static uint32_t imx25_ccm_get_ahb_clk(DeviceState *dev)
>> +{
>> +    IMX25CCMState *s =3D IMX25_CCM(dev);
>> +
>> +    DPRINTF("()\n");
>> +
>> +    return imx25_ccm_get_mcu_clk(dev) / (1 + EXTRACT(s->cctl, AHB_CLK=
_DIV));
>> +}
>> +
>> +static uint32_t imx25_ccm_get_ipg_clk(DeviceState *dev)
>> +{
>> +    DPRINTF("()\n");
>> +
>> +    return imx25_ccm_get_ahb_clk(dev) / 2;
>> +}
>> +
>> +static uint32_t imx25_ccm_get_clock_frequency(DeviceState *dev, IMXCl=
k clock)
>> +{
>> +    DPRINTF("Clock =3D %d)\n", clock);
> This would be more useful if it was at the end and grabbed the return
> value too (similar to what's commonly done for an MMIO read function).
OK

>
>> +
>> +    switch (clock) {
>> +    case NOCLK:
>> +        return 0;
>> +    case CLK_MPLL:
>> +        return imx25_ccm_get_mpll_clk(dev);
>> +    case CLK_UPLL:
>> +        return imx25_ccm_get_upll_clk(dev);
>> +    case CLK_MCU:
>> +        return imx25_ccm_get_mcu_clk(dev);
>> +    case CLK_AHB:
>> +        return imx25_ccm_get_ahb_clk(dev);
>> +    case CLK_IPG:
>> +        return imx25_ccm_get_ipg_clk(dev);
>> +    case CLK_32k:
>> +        return CKIL_FREQ;
>> +    default:
>> +        return 0;
> Is this condition guest creatable? If so should it be LOG_GUEST_ERROR?
> If it is supposed to be unreachable even by guest error, then it
> should g_assert_not_reached().

OK

>
>> +    }
>> +}
>> +
>> +static void imx25_ccm_reset(DeviceState *dev)
>> +{
>> +    IMX25CCMState *s =3D IMX25_CCM(dev);
>> +
>> +    DPRINTF("\n");
>> +
>> +    s->mpctl =3D 0x800b2c01;
>> +    s->upctl =3D 0x84002800;
>> +    s->cctl =3D 0x40030000;
>> +    s->cgcr[0] =3D 0x028A0100;
>> +    s->cgcr[1] =3D 0x04008100;
>> +    s->cgcr[2] =3D 0x00000438;
>> +    s->pcdr[0] =3D 0x01010101;
>> +    s->pcdr[1] =3D 0x01010101;
>> +    s->pcdr[2] =3D 0x01010101;
>> +    s->pcdr[3] =3D 0x01010101;
>> +    s->rcsr =3D 0;
>> +    s->crdr =3D 0;
>> +    s->dcvr[0] =3D 0;
>> +    s->dcvr[1] =3D 0;
>> +    s->dcvr[2] =3D 0;
>> +    s->dcvr[3] =3D 0;
>> +    s->ltr[0] =3D 0;
>> +    s->ltr[1] =3D 0;
>> +    s->ltr[2] =3D 0;
>> +    s->ltr[3] =3D 0;
>> +    s->ltbr[0] =3D 0;
>> +    s->ltbr[1] =3D 0;
>
> With the union-struct approach (see below), you can memset 0 the whole
> thing then set the non-zeros after for a shorter result.
>
>> +    s->pmcr[0] =3D 0x00A00000;
>> +    s->pmcr[1] =3D 0x0000A030;
>> +    s->pmcr[2] =3D 0x0000A030;
>> +    s->mcr =3D 0x43000000;
>> +    s->lpimr[0] =3D 0;
>> +    s->lpimr[1] =3D 0;
>> +
>> +    /* default ROM boot will change the reset values */
>> +    s->cctl |=3D INSERT(1, ARM_SRC);
>> +    s->cctl |=3D INSERT(1, AHB_CLK_DIV);
>> +}
>> +
>> +static uint64_t imx25_ccm_read(void *opaque, hwaddr offset, unsigned =
size)
>> +{
>> +    IMX25CCMState *s =3D (IMX25CCMState *)opaque;
>> +    uint32_t *reg =3D &s->mpctl;
> If you want the best of both worlds for the register indexing scheme
> (e.g. array + set of names) an anonymous union-struct would work
> better. There are some in tree precedents. E.g. from hcd-ehci.h:
>
>      union {
>          uint32_t opreg[0x44/sizeof(uint32_t)];
>          struct {
>              uint32_t usbcmd;
>              uint32_t usbsts;
>              uint32_t usbintr;
>              uint32_t frindex;
>              uint32_t ctrldssegment;
>              uint32_t periodiclistbase;
>              uint32_t asynclistaddr;
>              uint32_t notused[9];
>              uint32_t configflag;
>          };
>      };

Well, I think I'll move later to an uint32_t array only with REG name=20
values as index.
But I'll do it for both i.MX25 and i.MX31 at the same time.

>
>
>> +
>> +    DPRINTF("(offset=3D0x%" HWADDR_PRIx ")\n", offset);
>> +
> Delay to give return value as well.
>
>> +    if (offset < 0x70) {
>> +        return reg[offset >> 2];
>> +    } else {
>> +        return 0;
>> +    }
>> +}
>> +
>> +static void imx25_ccm_write(void *opaque, hwaddr offset, uint64_t val=
ue,
>> +                            unsigned size)
>> +{
>> +    IMX25CCMState *s =3D (IMX25CCMState *)opaque;
>> +    uint32_t *reg =3D &s->mpctl;
>> +
>> +    DPRINTF("(offset=3D0x%" HWADDR_PRIx ", value =3D %x)\n",
>> +            offset, (unsigned int)value);
> The cast of value should be to an IP meaningful type. As reg's are 32
> bit, it should be a uint32_t with PRIx32.

OK

>
>> +
>> +    if (offset < 0x70) {
>> +        /*
>> +         * We will do a better implementation later. In particular so=
me bits
>> +         * cannot be writen to.
> "written"
>
>> +         */
>> +        reg[offset >> 2] =3D value;
>> +    }
>> +}
>> +
>> +static const struct MemoryRegionOps imx25_ccm_ops =3D {
>> +    .read =3D imx25_ccm_read,
>> +    .write =3D imx25_ccm_write,
> Your IP doesn't handle sub-word access, so should the size restrictions=
 be here?
>
> We have a new sub-mailing list for ARM related work.
> qemu-arm@nongnu.org. You can CC to that (as well as qemu-devel) for
> the i.MX stuff to get a wider ARM review community.

OK

>
> Thanks.
>
> Regards,
> Peter
>
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void imx25_ccm_init(Object *obj)
>> +{
>> +    DeviceState *dev =3D DEVICE(obj);
>> +    SysBusDevice *sd =3D SYS_BUS_DEVICE(obj);
>> +    IMX25CCMState *s =3D IMX25_CCM(obj);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(dev), &imx25_ccm_ops, s,
>> +                          TYPE_IMX25_CCM, 0x1000);
>> +    sysbus_init_mmio(sd, &s->iomem);
>> +}
>> +

