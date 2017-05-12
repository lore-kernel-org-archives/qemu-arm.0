Received: by 10.25.0.6 with SMTP id 6csp50942lfa;
        Thu, 11 May 2017 20:49:33 -0700 (PDT)
X-Received: by 10.55.106.7 with SMTP id f7mr1883509qkc.189.1494560973111;
        Thu, 11 May 2017 20:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494560973; cv=none;
        d=google.com; s=arc-20160816;
        b=mxabF5XVVPNQyjvkciDIWqx52ggF/BM/nIyOvy+vf+4G0QkfCVlYrWctDzaBB5au9i
         zX1nuSPWKozYsNFoQ7TJja3n6fBkWkqc69boLl2+N3Y4WRcTfbugeiYjcCPkatufpy+/
         t2VYSqkm2zIpcmDc8lOh5jPxc3cHlsjVaPuSrkpjlzVRIYfT+ytMiXbSlzUYWr9GAxC6
         veshnI5h5KaGqEt1gkzfBmajQZapqZmVrmafj6CmVBURjFCLvUU+LFNegZXl7XdqxNra
         o9207w0EK8owI7JLYZ5HgaMish6vld92EH4frDDUpySb/i0RWITTa7kVa4fPFq5Y9X6T
         Xa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=hilu2VgYR28GMmB/+zWQhgodQy09Bz5wAnVNGOTLlB4=;
        b=j3N6mDXFfN+CswPEDEacLo2LoZrl6Dd5+0Hlohcow2+KdNSIkMDMV0Pe7KrBQEhiEq
         y91PeHEosccA69JiW1NRWzqNVnKWRKHq6mjEY1E8ZyK0EtN5jnIieq+ac4lNEqEUNJWA
         ViYm+NWazrSBqF/6BsB8kiY2u89gY/41yCyDU0MaGBt+P9N2lOfdB3yAvYrhqRdXcEAR
         k6xnpT1wCiODamCjtwvXzwnNxlXnI7lHhkBuHMQXBhSxbH4Aboafv41wy14sN3up1c35
         PoxFDd/EbcIMzhf2nL5CbE38y3UcmgBbhhXmJukIt6NVn0R1eHXcCTWqHr8/Dnq1yqxF
         v05w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m77si2129245qkl.223.2017.05.11.20.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 20:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d91a8-00042Y-IN
	for alex.bennee@linaro.org; Thu, 11 May 2017 23:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d91ZB-0003ka-GG
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d91Z9-0001i9-4e
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:48:33 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:32983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d91Z8-0001hX-Ta; Thu, 11 May 2017 23:48:31 -0400
Received: by mail-yb0-x244.google.com with SMTP id d72so1583694ybh.0;
	Thu, 11 May 2017 20:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ES19iFfrKpCabLhWgEHwi8CWa5Zd6jXXilm+M/DB75o=;
	b=Xn+o5NRkzXCvck03U6K+bl5Swr2/EYoDJEtwZCkjxAgCWXAO5uDq0fEFVbMIHK46Rl
	AbXG6ZShE2T54T+Bpv+9EeZKSWM1zxCJCl53UUmVF1BTa89HyQzUumIzq5+GxkOF6l0t
	MAC0VuCtBzmLJL9WCncN3ejhMD9Heb76UdoIhOo9qTPne8g257jExHgYtn6bQwqe07YH
	02XFMDBp9JvWmCWdFwvmj47pZBQpXKrlB860Y1wTAszwsf2vaVbzItapu/BZ/UBCgLyM
	42xMYzbiOs+jghw13odgdsN4eS5NwZB784YMjGidgi4AS5Bdbv1gdBfdNXoRzhnIGPWF
	26cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ES19iFfrKpCabLhWgEHwi8CWa5Zd6jXXilm+M/DB75o=;
	b=G430pIz6+Q37N7CMEVHjNHm/49iaKQM8V1ifAsZDv53Pi36p9fiwUu5hEe1rJlyUag
	VpmOeFJjacM28QsQlLyJHx0iHMAyFFD0lzcwCuRtspNZ4lv3isqV4Q4molvf4Kr56ubs
	dtgH77JYlad4RzrC7rQTzoLU30kxdvB1ZIwtiqUYWiaDtpTTQKNEv3ug4g6//fi1qST7
	7qpKBja+dEA1ee0MWyBExIb6QI5CeUWwK98ap6zRdc8t9jFv0c7UfjTPd8+dTG3c9nsk
	DbYohUHcsEXFLJiyxYj3wzZH1WYfFnymQcFJfWZpT1MWrv30NEPDDHHmhpm/oZ09UMCo
	Ee7w==
X-Gm-Message-State: AODbwcDITFcx+JY5TasceewsaFd/O+SLmwWk/aQUWNbUUUL8AlK87R1Z
	VvtPGa5mK2lOOhAXfI9sLP6EdvMkcA==
X-Received: by 10.37.206.141 with SMTP id x135mr1482185ybe.46.1494560910022;
	Thu, 11 May 2017 20:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Thu, 11 May 2017 20:48:29 -0700 (PDT)
In-Reply-To: <fffd61b7-bc45-f7da-aa91-5eed1b0d7519@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-3-git-send-email-sundeep.lkml@gmail.com>
	<fffd61b7-bc45-f7da-aa91-5eed1b0d7519@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 12 May 2017 09:18:29 +0530
Message-ID: <CALHRZuri9VK-CzrcupjdNiQL1gio5bepx=xsMQUreSzHfgJyJg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-devel PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yTFWgEymGbur

Hi Phiilippe,

On Wed, May 10, 2017 at 4:04 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
>
> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>
>> Added Sytem register block of Smartfusion2.
>> This block has PLL registers which are accessed by guest.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/misc/Makefile.objs         |   1 +
>>  hw/misc/msf2-sysreg.c         | 131 ++++++++++++++++++++++++++++++
>> ++++++++++++
>>  include/hw/misc/msf2-sysreg.h |  80 ++++++++++++++++++++++++++
>>  3 files changed, 212 insertions(+)
>>  create mode 100644 hw/misc/msf2-sysreg.c
>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index c8b4893..0f52354 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) +=3D edu.o
>>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>  obj-$(CONFIG_AUX) +=3D auxbus.o
>>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>> new file mode 100644
>> index 0000000..53e9cba
>> --- /dev/null
>> +++ b/hw/misc/msf2-sysreg.c
>> @@ -0,0 +1,131 @@
>> +/*
>> + * System Register block model of Microsemi SmartFusion2.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "hw/misc/msf2-sysreg.h"
>> +
>> +#ifndef MSF2_SYSREG_ERR_DEBUG
>> +#define MSF2_SYSREG_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSF2_SYSREG_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt, __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static void msf2_sysreg_reset(DeviceState *d)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>> +
>> +    DB_PRINT("RESET\n");
>> +
>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x02420041;
>> +    s->regs[MSSDDR_FACC1_CR] =3D 0x0A482124;
>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>> +}
>> +
>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> +    unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    offset /=3D 4;
>> +    uint32_t ret =3D 0;
>> +
>> +    if (offset < ARRAY_SIZE(s->regs)) {
>> +        ret =3D s->regs[offset];
>> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32 "\n",
>> +                    offset * 4, ret);
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>> +                    offset * 4);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>> +                          uint64_t val, unsigned size)
>> +{
>> +    MSF2SysregState *s =3D (MSF2SysregState *)opaque;
>> +    offset /=3D 4;
>> +
>> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64 "\n",
>> +            offset * 4, val);
>> +
>> +    switch (offset) {
>> +    case MSSDDR_PLL_STATUS:
>> +        break;
>> +
>> +    default:
>> +        if (offset < ARRAY_SIZE(s->regs)) {
>> +            s->regs[offset] =3D val;
>>
>
> I think this is pretty unsafe for the guest to continue if those register=
s
> are accessed in your current implementation.
>
> I'd at least somehow abort for few of them (RESET, REMAP*), what do you
> think?


Ok. We can abort for REMAP. All the peripherals need to be released from
reset by writing to Sysreg.
Can we handle that case where if guest writes to Sysreg to reset SPI(say)
then we can reset SPI
model from here? I am very new here and I did not come across this case in
the models I have referred.
Please let me know if that is possible. If not possible I would simply log
messages like released
from reset/put in reset.

Thanks,
Sundeep

>
>
> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>> __func__,
>> +                        offset * 4);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps sysreg_ops =3D {
>> +    .read =3D msf2_sysreg_read,
>> +    .write =3D msf2_sysreg_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void msf2_sysreg_init(Object *obj)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
>> TYPE_MSF2_SYSREG,
>> +                          MSF2_SYSREG_MMIO_SIZE);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>> +}
>> +
>> +static const VMStateDescription vmstate_msf2_sysreg =3D {
>> +    .name =3D TYPE_MSF2_SYSREG,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
>> MSF2_SYSREG_NUM_REGS),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd =3D &vmstate_msf2_sysreg;
>> +    dc->reset =3D msf2_sysreg_reset;
>> +}
>> +
>> +static const TypeInfo msf2_sysreg_info =3D {
>> +    .name  =3D TYPE_MSF2_SYSREG,
>> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>> +    .class_init =3D msf2_sysreg_class_init,
>> +    .instance_size  =3D sizeof(MSF2SysregState),
>> +    .instance_init =3D msf2_sysreg_init,
>> +};
>> +
>> +static void msf2_sysreg_register_types(void)
>> +{
>> +    type_register_static(&msf2_sysreg_info);
>> +}
>> +
>> +type_init(msf2_sysreg_register_types)
>> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg=
.
>> h
>> new file mode 100644
>> index 0000000..a485ed6
>> --- /dev/null
>> +++ b/include/hw/misc/msf2-sysreg.h
>> @@ -0,0 +1,80 @@
>> +/*
>> + * Microsemi SmartFusion2 SYSREG
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
>> +#ifndef HW_MSF2_SYSREG_H
>> +#define HW_MSF2_SYSREG_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/hw.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +
>> +enum {
>> +    ESRAM_CR        =3D 0x00 / 4,
>> +    ESRAM_MAX_LAT,
>> +    DDR_CR,
>> +    ENVM_CR,
>> +    ENVM_REMAP_BASE_CR,
>> +    ENVM_REMAP_FAB_CR,
>> +    CC_CR,
>> +    CC_REGION_CR,
>> +    CC_LOCK_BASE_ADDR_CR,
>> +    CC_FLUSH_INDX_CR,
>> +    DDRB_BUF_TIMER_CR,
>> +    DDRB_NB_ADDR_CR,
>> +    DDRB_NB_SIZE_CR,
>> +    DDRB_CR,
>> +
>> +    SOFT_RESET_CR  =3D 0x48 / 4,
>> +    M3_CR,
>> +
>> +    GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,
>> +
>> +    MDDR_CR =3D 0x60 / 4,
>> +
>> +    MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,
>> +    MSSDDR_PLL_STATUS_HIGH_CR,
>> +    MSSDDR_FACC1_CR,
>> +    MSSDDR_FACC2_CR,
>> +
>> +    MSSDDR_PLL_STATUS =3D 0x150 / 4,
>> +
>> +};
>> +
>> +#define MSF2_SYSREG_MMIO_SIZE     0x300
>> +#define MSF2_SYSREG_NUM_REGS      (MSF2_SYSREG_MMIO_SIZE / 4)
>> +
>> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
>> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
>> TYPE_MSF2_SYSREG)
>> +
>> +typedef struct MSF2SysregState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t regs[MSF2_SYSREG_NUM_REGS];
>> +} MSF2SysregState;
>> +
>> +#endif /* HW_MSF2_SYSREG_H */
>>
>>
