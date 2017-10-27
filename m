Received: by 10.223.161.27 with SMTP id o27csp824179wro;
        Fri, 27 Oct 2017 07:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RypVVN4hr76HQaglagWpBYD+0ph7ovtRe+hPi94DX1ERTEOGjGXwFE8TYjCnW8ZgXdOeVD
X-Received: by 10.37.35.195 with SMTP id j186mr484639ybj.517.1509116196496;
        Fri, 27 Oct 2017 07:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509116196; cv=none;
        d=google.com; s=arc-20160816;
        b=Qem5SjB1T6lk7dPOg2+ZNFPq35Gx/jHa8isOJSyW/2aheYf8ObGOqs0MQ2/6+ggzLR
         z3jprfMuyv0FKG4AHcmNUSL6+OnLAB/by6sOUc4cyJQEPoAra1+5zpBeAafoVm7qICp7
         jOHbaK/uLUdAqobQL1t6VK4Mq/HVjv747T+23ambFRroA5AbEqfk82OpMoc8VhtAWux1
         KQU6fICNLabl8QmK4zSdVsb8rpSA+HcGPc3afhJpKbP0S2LHZ6+WO3jkWjGtJJH5kE3G
         o3P5A43uWBUbJAaMbSLEMtq1834JVDd0c0uP+bCoHaQ/Qre98XdfUpnjBMVbHPX6mv2D
         L7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XMpvl/bPOOXrtGTWoVnlbL7cjjWjqYLUhKRwCxAB1fY=;
        b=X8F00m1UZy7J35N5PNHe3eb50v4YU6FwYNsNKXbqXFr0grkSENrq1pdM2MqcG9bdEJ
         mo7SuP6LWa3T9nJoHHMWUZc2uY516nZKxzA3oB7AUQh6/os2qktxZswsZw/4Fvrlztzi
         HpRgSk/FGLMXbkXlgjC1tW8CU5lYAdf629aHeATTkaSTqe1iai5fyQee6FKmswmXWmOE
         PwMsGw1SLsfluIm0f84BNidZkBnSaK2XmV/7FHuJB7mw7orL4uvgGzrD9fMI3c/IcJWF
         XmghLGWLl8F7E0DJn/NGId5Wdy9grqPeOd6dZ+DJKQGciDbc12QgGwd231mCNicfhuIq
         mUkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=MGwets2O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11si1193160ybc.705.2017.10.27.07.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 07:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=MGwets2O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e863n-0003Fy-VM
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 10:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e85n3-0007kk-PB
	for qemu-devel@nongnu.org; Fri, 27 Oct 2017 10:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e85n1-0004z0-7P
	for qemu-devel@nongnu.org; Fri, 27 Oct 2017 10:39:17 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:47854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e85n0-0004xK-QM; Fri, 27 Oct 2017 10:39:15 -0400
Received: by mail-pf0-x241.google.com with SMTP id z11so5107376pfk.4;
	Fri, 27 Oct 2017 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oWpGJDRAGadhAalvjvXGmWIDyxodyAJ1VyWp1reu7Rw=;
	b=MGwets2O3zQKgdNRNu2guCp+nTuG9rX5TSnNkEPZy4NT1WKXroZTJaXJiwroPpgffc
	RO9kBrQo+rRw7aeslOf3RsF2j8Kg4Y3673P74iZlLy0QWKhp4argj9iaq9H8QZ3a08hB
	shsZyIqsVYkyIbcK0qMD+eQzQ2jCIAPzcH2hsaGPXVlFjPJD+pzWdW9fSHQN0eELurtZ
	zCp+9119cvjX6Ocd49pnQI8VX0a4di6GDzx+5xg/vcXvNEA7O5DkSKsG7DG/hOhF0kzp
	NfDJvJA3Yfa6rRhIaEvbqEqLI9k75n4rrC2TyATs5xHgce0RjCllMa/CJnIu79O4Ja/+
	axBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oWpGJDRAGadhAalvjvXGmWIDyxodyAJ1VyWp1reu7Rw=;
	b=FFNkFfoJ/ye9RvmtWT24KFhqHEUFotrJiBNcDOIt4npd+CbTixUYbDCoWt34iROQfL
	7ncDZcgIGu1jMisJVxmSfSy9NZZYx1jLsokVp6WBwMD6LXwmU8OQimRi/WR3wU09pYBo
	o1mrqNcLd83xTGjYGkSPkBYMlAYIHDZRJRMm8EVNVMn6m5Iod7AoLO28Rge3STp52Q4h
	Mpdqq870NUDrBYtpHy9KqMKn3HwtFAi7w/twJ1573Rjp8egihG9tZIjbibRthuGGDU5K
	T14QFSK+MFUTKGIQhOqZ/FEiXmzc18zoka5UY2sXIBY79qxvWdWT8+i2bJqfzpt0FJnQ
	Wtpg==
X-Gm-Message-State: AMCzsaW9AwRlxuWgYcWUOWgmRb04EC+LChSzCQ76GqJ52OHjgMyWXKpo
	yS2gZnLCCGt8y2XG9+/y/+1e7zi8/XhW/V46bj8=
X-Received: by 10.99.123.83 with SMTP id k19mr484274pgn.338.1509115153502;
	Fri, 27 Oct 2017 07:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.104 with HTTP; Fri, 27 Oct 2017 07:39:12 -0700 (PDT)
In-Reply-To: <0fd6630d-3627-e195-534a-67fc40839062@adacore.com>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
	<1509014053-28134-4-git-send-email-costa@advantech.ca>
	<0fd6630d-3627-e195-534a-67fc40839062@adacore.com>
From: Gabriel Costa <gabriel291075@gmail.com>
Date: Fri, 27 Oct 2017 10:39:12 -0400
Message-ID: <CAG+oHk8-6OT6yXHDr_5pBuGEyQPbVmVCQ1SCdUwBAEyxE6DjAQ@mail.gmail.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v5 3/5]arm: kinetis_k64_system
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d6MgsFhSdt86

Hi Fred,

Here, I prefer keep the variables names to easy check the Reset default
values.

Gabriel


On Fri, Oct 27, 2017 at 9:20 AM, KONRAD Frederic <
frederic.konrad@adacore.com> wrote:

>
>
> On 10/26/2017 12:34 PM, Gabriel Costa wrote:
>
>> From: Gabriel Augusto Costa <gabriel291075@gmail.com>
>>
>> This Patch include kinetis_k64_system.c and .h
>> sim means System Integration Module (SIM)
>> More information about this peripheral can be found at:
>> pag 291, K64P144M120SF5RM.pdf.
>>
>> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
>> ---
>>   hw/misc/kinetis_k64_system.c         | 274
>> +++++++++++++++++++++++++++++++++++
>>   include/hw/misc/kinetis_k64_system.h |  52 +++++++
>>   2 files changed, 326 insertions(+)
>>   create mode 100644 hw/misc/kinetis_k64_system.c
>>   create mode 100644 include/hw/misc/kinetis_k64_system.h
>>
>> diff --git a/hw/misc/kinetis_k64_system.c b/hw/misc/kinetis_k64_system.c
>> new file mode 100644
>> index 0000000..6421153
>> --- /dev/null
>> +++ b/hw/misc/kinetis_k64_system.c
>> @@ -0,0 +1,274 @@
>> +/*
>> + * Kinetis K64 peripheral microcontroller emulation.
>> + *
>> + * Copyright (c) 2017 Advantech Wireless
>> + * Written by Gabriel Costa <gabriel291075@gmail.com>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "qemu/log.h"
>> +#include "hw/misc/kinetis_k64_system.h"
>> +
>> +static const VMStateDescription vmstate_kinetis_k64_sim = {
>> +    .name = TYPE_KINETIS_K64_SIM,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(SOPT1, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SOPT1CFG, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SOPT2, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SOPT4, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SOPT5, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SOPT7, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SDID, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC1, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC2, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC3, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC4, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC5, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC6, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(SCGC7, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(CLKDIV1, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(CLKDIV2, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(FCFG1, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(FCFG2, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(UIDH, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(UIDMH, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(UIDML, kinetis_k64_sim_state),
>> +        VMSTATE_UINT32(UIDL, kinetis_k64_sim_state),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void kinetis_k64_sim_reset(DeviceState *dev)
>> +{
>> +    kinetis_k64_sim_state *s = KINETIS_K64_SIM(dev);
>> +
>> +    s->SOPT1 = 0x00008000;
>> +    s->SOPT1CFG = 0x00000000;
>> +    s->SOPT2 = 0x00001000;
>> +    s->SOPT4 = 0x00000000;
>> +    s->SOPT5 = 0x00000000;
>> +    s->SOPT7 = 0x00000000;
>> +    s->SDID = 0x00000000;
>> +    s->SCGC1 = 0x00000000;
>> +    s->SCGC2 = 0x00000000;
>> +    s->SCGC3 = 0x00000000;
>> +    s->SCGC4 = 0xF0100030;
>> +    s->SCGC5 = 0x00040182;
>> +    s->SCGC6 = 0x40000001;
>> +    s->SCGC7 = 0x00000006;
>> +    s->CLKDIV1 = 0x00000000;
>> +    s->CLKDIV2 = 0x00000000;
>> +    s->FCFG1 = 0xFF000000;
>> +    s->FCFG2 = 0x00000000;
>> +    s->UIDH = 0x00000000;
>> +    s->UIDMH = 0x00000000;
>> +    s->UIDML = 0x00000000;
>> +    s->UIDL = 0x00000000;
>> +}
>> +
>> +static void kinetis_k64_sim_write(void *opaque, hwaddr offset, uint64_t
>> value,
>> +        unsigned size)
>> +{
>> +    kinetis_k64_sim_state *s = (kinetis_k64_sim_state *)opaque;
>> +
>> +    value &= 0xFFFFFFFF;
>> +
>> +    switch (offset) {
>> +    case 0x0000:
>> +        s->SOPT1 = value;
>> +        break;
>> +    case 0x0004:
>> +        s->SOPT1CFG = value;
>> +        break;
>> +    case 0x1004:
>> +        s->SOPT2 = value;
>> +        break;
>> +    case 0x100C:
>> +        s->SOPT4 = value;
>> +        break;
>> +    case 0x1010:
>> +        s->SOPT5 = value;
>> +        break;
>> +    case 0x1018:
>> +        s->SOPT7 = value;
>> +        break;
>> +    case 0x1024:
>> +        s->SDID = value;
>> +        break;
>> +    case 0x1028:
>> +        s->SCGC1 = value;
>> +        break;
>> +    case 0x102C:
>> +        s->SCGC2 = value;
>> +        break;
>> +    case 0x1030:
>> +        s->SCGC3 = value;
>> +        break;
>> +    case 0x1034:
>> +        s->SCGC4 = value;
>> +        break;
>> +    case 0x1013:
>> +        s->SCGC5 = value;
>> +        break;
>> +    case 0x103C:
>> +        s->SCGC6 = value;
>> +        break;
>> +    case 0x1040:
>> +        s->SCGC7 = value;
>> +        break;
>> +    case 0x1044:
>> +        s->CLKDIV1 = value;
>> +        break;
>> +    case 0x1048:
>> +        s->CLKDIV2 = value;
>> +        break;
>> +    case 0x104C:
>> +        s->FCFG1 = value;
>> +        break;
>> +    case 0x1050:
>> +        s->FCFG2 = value;
>> +        break;
>> +    case 0x1054:
>> +        s->UIDH = value;
>> +        break;
>> +    case 0x1058:
>> +        s->UIDMH = value;
>> +        break;
>> +    case 0x105C:
>> +        s->UIDML = value;
>> +        break;
>> +    case 0x1060:
>> +        s->UIDL = value;
>> +        break;
>>
>
> I suggest you do create one or two arrays here instead of all
> thoses single variables and then factor this big switch case in a
> default label:
>
> default:
>     s->reg[offset] = value;
>
> And on the top of this file eg:
>
> #define UIDH  (0x1054)
> #define UIDMH (0x1058)
> etc..
>
> The same in the previous patch BTW. I didn't spot it.
>
> Fred
>
>
> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                "kinetis_k64_sim: write at bad offset 0x%x\n",
>> (int)offset);
>> +    }
>> +}
>> +
>> +static uint64_t kinetis_k64_sim_read(void *opaque, hwaddr offset,
>> unsigned size)
>> +{
>> +    kinetis_k64_sim_state *s = (kinetis_k64_sim_state *)opaque;
>> +    uint32_t value;
>> +
>> +    switch (offset) {
>> +    case 0x0000:
>> +        value = s->SOPT1;
>> +        break;
>> +    case 0x0004:
>> +        value = s->SOPT1CFG;
>> +        break;
>> +    case 0x1004:
>> +        value = s->SOPT2;
>> +        break;
>> +    case 0x100C:
>> +        value = s->SOPT4;
>> +        break;
>> +    case 0x1010:
>> +        value = s->SOPT5;
>> +        break;
>> +    case 0x1018:
>> +        value = s->SOPT7;
>> +        break;
>> +    case 0x1024:
>> +        value = s->SDID;
>> +        break;
>> +    case 0x1028:
>> +        value = s->SCGC1;
>> +        break;
>> +    case 0x102C:
>> +        value = s->SCGC2;
>> +        break;
>> +    case 0x1030:
>> +        value = s->SCGC3;
>> +        break;
>> +    case 0x1034:
>> +        value = s->SCGC4;
>> +        break;
>> +    case 0x1013:
>> +        value = s->SCGC5;
>> +        break;
>> +    case 0x103C:
>> +        value = s->SCGC6;
>> +        break;
>> +    case 0x1040:
>> +        value = s->SCGC7;
>> +        break;
>> +    case 0x1044:
>> +        value = s->CLKDIV1;
>> +        break;
>> +    case 0x1048:
>> +        value = s->CLKDIV2;
>> +        break;
>> +    case 0x104C:
>> +        value = s->FCFG1;
>> +        break;
>> +    case 0x1050:
>> +        value = s->FCFG2;
>> +        break;
>> +    case 0x1054:
>> +        value = s->UIDH;
>> +        break;
>> +    case 0x1058:
>> +        value = s->UIDMH;
>> +        break;
>> +    case 0x105C:
>> +        value = s->UIDML;
>> +        break;
>> +    case 0x1060:
>> +        value = s->UIDL;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                "kinetis_k64_sim: read at bad offset 0x%x\n",
>> (int)offset);
>> +        return 0;
>> +    }
>> +    return value;
>> +}
>> +
>> +static const MemoryRegionOps kinetis_k64_sim_ops = {
>> +    .read = kinetis_k64_sim_read,
>> +    .write = kinetis_k64_sim_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void kinetis_k64_sim_init(Object *obj)
>> +{
>> +    kinetis_k64_sim_state *s = KINETIS_K64_SIM(obj);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &kinetis_k64_sim_ops, s,
>> +            TYPE_KINETIS_K64_SIM, 0x2000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +}
>> +
>> +static void kinetis_k64_sim_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd = &vmstate_kinetis_k64_sim;
>> +    dc->reset = kinetis_k64_sim_reset;
>> +    dc->desc = "Kinetis K64 series SIM";
>> +}
>> +
>> +static const TypeInfo kinetis_k64_sim_info = {
>> +    .name          = TYPE_KINETIS_K64_SIM,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(kinetis_k64_sim_state),
>> +    .instance_init = kinetis_k64_sim_init,
>> +    .class_init    = kinetis_k64_sim_class_init,
>> +};
>> +
>> +static void kinetis_k64_sim_register_types(void)
>> +{
>> +    type_register_static(&kinetis_k64_sim_info);
>> +}
>> +
>> +type_init(kinetis_k64_sim_register_types)
>> diff --git a/include/hw/misc/kinetis_k64_system.h
>> b/include/hw/misc/kinetis_k64_system.h
>> new file mode 100644
>> index 0000000..8774eaa
>> --- /dev/null
>> +++ b/include/hw/misc/kinetis_k64_system.h
>> @@ -0,0 +1,52 @@
>> +/*
>> + * Kinetis K64 peripheral microcontroller emulation.
>> + *
>> + * Copyright (c) 2017 Advantech Wireless
>> + * Written by Gabriel Costa <gabriel291075@gmail.com>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +#ifndef KINETIS_SYSTEM_H
>> +#define KINETIS_SYSTEM_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "hw/hw.h"
>> +
>> +#define TYPE_KINETIS_K64_SIM "kinetis_k64_sim"
>> +#define KINETIS_K64_SIM(obj) \
>> +    OBJECT_CHECK(kinetis_k64_sim_state, (obj), TYPE_KINETIS_K64_SIM)
>> +
>> +typedef struct {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t SOPT1;
>> +    uint32_t SOPT1CFG;
>> +    uint32_t SOPT2;
>> +    uint32_t SOPT4;
>> +    uint32_t SOPT5;
>> +    uint32_t SOPT7;
>> +    uint32_t SDID;
>> +    uint32_t SCGC1;
>> +    uint32_t SCGC2;
>> +    uint32_t SCGC3;
>> +    uint32_t SCGC4;
>> +    uint32_t SCGC5;
>> +    uint32_t SCGC6;
>> +    uint32_t SCGC7;
>> +    uint32_t CLKDIV1;
>> +    uint32_t CLKDIV2;
>> +    uint32_t FCFG1;
>> +    uint32_t FCFG2;
>> +    uint32_t UIDH;
>> +    uint32_t UIDMH;
>> +    uint32_t UIDML;
>> +    uint32_t UIDL; > +
>> +} kinetis_k64_sim_state;
>> +
>> +#endif
>>
>>
