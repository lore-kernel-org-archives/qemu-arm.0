Received: by 10.25.0.6 with SMTP id 6csp56883lfa;
        Thu, 11 May 2017 21:14:03 -0700 (PDT)
X-Received: by 10.237.59.204 with SMTP id s12mr1953721qte.274.1494562443151;
        Thu, 11 May 2017 21:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494562443; cv=none;
        d=google.com; s=arc-20160816;
        b=hCFSIxqcZ//keYzzNswNJaiQ9KJ6RYCRxkKcvGbnywpltt++v0QbKy3oDZQdTDYv9y
         Qe9Y/UCiOWM4vKgPEGHzakmbYUZK1KbQHVs4FMmg/XK7sDc1o7Bt92uYESpY7eQvUEGk
         8fWyWSmGmyn3Zof/VRSVxRSP7cbm4VRfxQSsQ8kzdLNsGmSKnHKutfckF+KmDKiydhj3
         2AWbBsxxvqZl1TGcBV5YO3j2vgf2UHXsfQCraCojwSn0qJKK0PT/gk7jV7gmBXgZ0foX
         QZe+7qB1MmLEemdPjWdaxmbHrxHDF/BNi2GZ2aDPgmj8Lhqjsl4Y695AUFqj54DuvkCM
         M28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=bQWXmNOh/FWkXmAXHXddduC53ZrfSCB7syPIUZC/4rM=;
        b=OxnlgLge8t9zDBcgjP1MPN4DMmQFpQUPseDTZRy9vIyiv2iqKED2JmUnRDJ5yyiaS9
         CqGfKixFtxbIx6eixZWVISF7sJhNhkYmhkgDHvlkel5zqk4mJlBAsHW/WXFks4PDC7w6
         yop6kOME5PVRdH/tX8zrZbLZwF+yG1SfKfrgU7a08kuW8Agf2/AKmHOnwePwpJ18qNcE
         2vV0ZSbPbvL5Te7nUKpkW8FDO+jv0uqmGVVVanBfqn21Ux1qwuaWYTgkOn1dc1xUvo9F
         QLc5mV50wQehDmo2l8Hn0cuX454zHuUbioX5E4AMz2einBxmURVOVwHm/RKHiU2KUia8
         uc9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124si2197109qkf.185.2017.05.11.21.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 21:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d91xq-0000yx-IP
	for alex.bennee@linaro.org; Fri, 12 May 2017 00:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91wS-00009G-W7
	for qemu-devel@nongnu.org; Fri, 12 May 2017 00:12:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91wO-0006Kx-6b
	for qemu-devel@nongnu.org; Fri, 12 May 2017 00:12:36 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:33517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91wO-0006KS-25; Fri, 12 May 2017 00:12:32 -0400
Received: by mail-qt0-x230.google.com with SMTP id t26so33037876qtg.0;
	Thu, 11 May 2017 21:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=bQWXmNOh/FWkXmAXHXddduC53ZrfSCB7syPIUZC/4rM=;
	b=TnZsgR2AS/oIjmCyDpRBeK6kiWiOwlchzwWvfppG4NrBxrTmdFuNG2Pmh9/aDq5tCn
	76dxFfhuBcJnzXRgn2/Y/+edheApNUm8Oy6jIBWl3U6E6h7vqvW6W6a+1yziB6aKXDsW
	MQKKob/mU42eOR2zLgiHpwH2Rgs9YCdLGHxYxn9+hI286+PrTJB1qqcjMvN35hFigTNj
	NkXy0ZjLq+vHrk114IYEEYF/mXkpWct/kcqNKEuKELS/77ikwQC0uwf4R+1cOytDLaJW
	q93+WXYkQ25Gc0P5YJTH0Eic6UHi3EGmxjfAEsSY+vNypdNaUsRh7+tKACjpJ7GLbnlo
	2EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=bQWXmNOh/FWkXmAXHXddduC53ZrfSCB7syPIUZC/4rM=;
	b=KYvRpdX6Bw3qBfI/Kf7Szvu7lj5YhOSp0HL8ywMm1j8WbMyJkOQ9c7Xgq1F8AjDX7u
	Zl2qC2YkHcI3/dSo7AkjizPtaGmtWBzA2rcXQFPN5KJpuD6LTaSenUa4IAZHtwmMHTaM
	Rh36PeZXBoGcJDhBz43fRiXu12ypzUnFIJKs0UfokiLSj866/8cM1h4Ldqc5pDqvCOO1
	ZYbvGyKA+UXWhFmGacfj2hWISsUNRe0SN/rSwEp1i5ucU7EI2DX1kpWN0HBmLxdWPZHR
	OCkTccKqiYLgU7ZWRJFpGNu6uHCj0gjaEgYW7fhZgB81z6xP1nHjaiT0lm27k1lp68ce
	NjYw==
X-Gm-Message-State: AODbwcB+gZbw6UvsNv9nQ+H7+cFJ8alZN1jCX6j0zlAKzhwkDzfZAjjZ
	4bluISXe/AcTZw==
X-Received: by 10.237.57.71 with SMTP id l65mr1749345qte.101.1494562351389;
	Thu, 11 May 2017 21:12:31 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id w14sm257521qkb.11.2017.05.11.21.12.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 21:12:30 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-3-git-send-email-sundeep.lkml@gmail.com>
	<fffd61b7-bc45-f7da-aa91-5eed1b0d7519@amsat.org>
	<CALHRZuri9VK-CzrcupjdNiQL1gio5bepx=xsMQUreSzHfgJyJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d563fb57-87c4-9484-6028-b1935caa599a@amsat.org>
Date: Fri, 12 May 2017 01:12:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALHRZuri9VK-CzrcupjdNiQL1gio5bepx=xsMQUreSzHfgJyJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWpu5Hoky5ua

On 05/12/2017 12:48 AM, sundeep subbaraya wrote:
> Hi Phiilippe,
>
> On Wed, May 10, 2017 at 4:04 PM, Philippe Mathieu-Daudé <f4bug@amsat.org>
> wrote:
>
>> Hi Subbaraya,
>>
>>
>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>
>>> Added Sytem register block of Smartfusion2.
>>> This block has PLL registers which are accessed by guest.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> ---
>>>  hw/misc/Makefile.objs         |   1 +
>>>  hw/misc/msf2-sysreg.c         | 131 ++++++++++++++++++++++++++++++
>>> ++++++++++++
>>>  include/hw/misc/msf2-sysreg.h |  80 ++++++++++++++++++++++++++
>>>  3 files changed, 212 insertions(+)
>>>  create mode 100644 hw/misc/msf2-sysreg.c
>>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>>
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index c8b4893..0f52354 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) += edu.o
>>>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>>>  obj-$(CONFIG_AUX) += auxbus.o
>>>  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>>> +obj-$(CONFIG_MSF2) += msf2-sysreg.o
>>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>>> new file mode 100644
>>> index 0000000..53e9cba
>>> --- /dev/null
>>> +++ b/hw/misc/msf2-sysreg.c
>>> @@ -0,0 +1,131 @@
>>> +/*
>>> + * System Register block model of Microsemi SmartFusion2.
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> along
>>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include "hw/misc/msf2-sysreg.h"
>>> +
>>> +#ifndef MSF2_SYSREG_ERR_DEBUG
>>> +#define MSF2_SYSREG_ERR_DEBUG  0
>>> +#endif
>>> +
>>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>>> +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
>>> +        qemu_log("%s: " fmt, __func__, ## args); \
>>> +    } \
>>> +} while (0);
>>> +
>>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>>> +
>>> +static void msf2_sysreg_reset(DeviceState *d)
>>> +{
>>> +    MSF2SysregState *s = MSF2_SYSREG(d);
>>> +
>>> +    DB_PRINT("RESET\n");
>>> +
>>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x02420041;
>>> +    s->regs[MSSDDR_FACC1_CR] = 0x0A482124;
>>> +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
>>> +}
>>> +
>>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>>> +    unsigned size)
>>> +{
>>> +    MSF2SysregState *s = opaque;
>>> +    offset /= 4;
>>> +    uint32_t ret = 0;
>>> +
>>> +    if (offset < ARRAY_SIZE(s->regs)) {
>>> +        ret = s->regs[offset];
>>> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32 "\n",
>>> +                    offset * 4, ret);
>>> +    } else {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>>> +                    offset * 4);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>> +                          uint64_t val, unsigned size)
>>> +{
>>> +    MSF2SysregState *s = (MSF2SysregState *)opaque;
>>> +    offset /= 4;
>>> +
>>> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64 "\n",
>>> +            offset * 4, val);
>>> +
>>> +    switch (offset) {
>>> +    case MSSDDR_PLL_STATUS:
>>> +        break;
>>> +
>>> +    default:
>>> +        if (offset < ARRAY_SIZE(s->regs)) {
>>> +            s->regs[offset] = val;
>>>
>>
>> I think this is pretty unsafe for the guest to continue if those registers
>> are accessed in your current implementation.
>>
>> I'd at least somehow abort for few of them (RESET, REMAP*), what do you
>> think?
>
>
> Ok. We can abort for REMAP. All the peripherals need to be released from
> reset by writing to Sysreg.
> Can we handle that case where if guest writes to Sysreg to reset SPI(say)
> then we can reset SPI
> model from here? I am very new here and I did not come across this case in
> the models I have referred.
> Please let me know if that is possible. If not possible I would simply log
> messages like released
> from reset/put in reset.

You are lucky if you didn't have to use the remap register :)
This can be implemented later if needed, don't get lost there now!

On Cold Reset the SF2 starts with the Cache Matrix mapping the CM3 code 
region (anything below 0x2000.0000) to the eNVM (which is physically 
mapped at 0x6000.0000). Now if you write to the REMAP reg you can 
instead map the eSRAM or the DDR space to the CM3 code, and the eNVM 
will only be accessible at 0x6000.0000. For the cpu the execution 
depends of the code stored at the mapped region.

If there is enough space to run your code in the eNVM, don't worry about 
modeling a remap. But now anyone can try your model, and if their 
firmware do a remap, the code flow will be completely wrong.
I think just reporting a GUEST_ERROR here is not enough since code flow 
continuing would be pretty hard to understand/debug. That's why I 
suggest to report an error and abort for now.

>
> Thanks,
> Sundeep
>
>>
>>
>> +        } else {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>>> __func__,
>>> +                        offset * 4);
>>> +        }
>>> +        break;
>>> +    }
>>> +}
>>> +
>>> +static const MemoryRegionOps sysreg_ops = {
>>> +    .read = msf2_sysreg_read,
>>> +    .write = msf2_sysreg_write,
>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>> +};
>>> +
>>> +static void msf2_sysreg_init(Object *obj)
>>> +{
>>> +    MSF2SysregState *s = MSF2_SYSREG(obj);
>>> +
>>> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
>>> TYPE_MSF2_SYSREG,
>>> +                          MSF2_SYSREG_MMIO_SIZE);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_msf2_sysreg = {
>>> +    .name = TYPE_MSF2_SYSREG,
>>> +    .version_id = 1,
>>> +    .minimum_version_id = 1,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
>>> MSF2_SYSREG_NUM_REGS),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +
>>> +    dc->vmsd = &vmstate_msf2_sysreg;
>>> +    dc->reset = msf2_sysreg_reset;
>>> +}
>>> +
>>> +static const TypeInfo msf2_sysreg_info = {
>>> +    .name  = TYPE_MSF2_SYSREG,
>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>> +    .class_init = msf2_sysreg_class_init,
>>> +    .instance_size  = sizeof(MSF2SysregState),
>>> +    .instance_init = msf2_sysreg_init,
>>> +};
>>> +
>>> +static void msf2_sysreg_register_types(void)
>>> +{
>>> +    type_register_static(&msf2_sysreg_info);
>>> +}
>>> +
>>> +type_init(msf2_sysreg_register_types)
>>> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.
>>> h
>>> new file mode 100644
>>> index 0000000..a485ed6
>>> --- /dev/null
>>> +++ b/include/hw/misc/msf2-sysreg.h
>>> @@ -0,0 +1,80 @@
>>> +/*
>>> + * Microsemi SmartFusion2 SYSREG
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining
>>> a copy
>>> + * of this software and associated documentation files (the "Software"),
>>> to deal
>>> + * in the Software without restriction, including without limitation the
>>> rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>> sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef HW_MSF2_SYSREG_H
>>> +#define HW_MSF2_SYSREG_H
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/sysbus.h"
>>> +#include "hw/hw.h"
>>> +#include "sysemu/sysemu.h"
>>> +#include "qemu/log.h"
>>> +
>>> +enum {
>>> +    ESRAM_CR        = 0x00 / 4,
>>> +    ESRAM_MAX_LAT,
>>> +    DDR_CR,
>>> +    ENVM_CR,
>>> +    ENVM_REMAP_BASE_CR,
>>> +    ENVM_REMAP_FAB_CR,
>>> +    CC_CR,
>>> +    CC_REGION_CR,
>>> +    CC_LOCK_BASE_ADDR_CR,
>>> +    CC_FLUSH_INDX_CR,
>>> +    DDRB_BUF_TIMER_CR,
>>> +    DDRB_NB_ADDR_CR,
>>> +    DDRB_NB_SIZE_CR,
>>> +    DDRB_CR,
>>> +
>>> +    SOFT_RESET_CR  = 0x48 / 4,
>>> +    M3_CR,
>>> +
>>> +    GPIO_SYSRESET_SEL_CR = 0x58 / 4,
>>> +
>>> +    MDDR_CR = 0x60 / 4,
>>> +
>>> +    MSSDDR_PLL_STATUS_LOW_CR = 0x90 / 4,
>>> +    MSSDDR_PLL_STATUS_HIGH_CR,
>>> +    MSSDDR_FACC1_CR,
>>> +    MSSDDR_FACC2_CR,
>>> +
>>> +    MSSDDR_PLL_STATUS = 0x150 / 4,
>>> +
>>> +};
>>> +
>>> +#define MSF2_SYSREG_MMIO_SIZE     0x300
>>> +#define MSF2_SYSREG_NUM_REGS      (MSF2_SYSREG_MMIO_SIZE / 4)
>>> +
>>> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
>>> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
>>> TYPE_MSF2_SYSREG)
>>> +
>>> +typedef struct MSF2SysregState {
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    MemoryRegion iomem;
>>> +
>>> +    uint32_t regs[MSF2_SYSREG_NUM_REGS];
>>> +} MSF2SysregState;
>>> +
>>> +#endif /* HW_MSF2_SYSREG_H */
>>>
>>>
