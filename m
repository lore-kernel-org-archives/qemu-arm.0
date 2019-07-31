Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5516390wrv;
        Wed, 31 Jul 2019 04:04:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUNPZr17dQoHdaDujprjKC1z0VFnYd8BWIub9ZMkH+IQ8vky3loPVTsPVSxbLeMN7Tbeqf
X-Received: by 2002:a17:906:7092:: with SMTP id b18mr94891206ejk.40.1564571070150;
        Wed, 31 Jul 2019 04:04:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c45si20943544eda.303.2019.07.31.04.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 04:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nrZ1RfgX;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsmPF-00076B-9N
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 07:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38951)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hsmP1-00072D-Li
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hsmP0-00079s-Dv
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:04:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:33058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hsmOz-00078i-Ti; Wed, 31 Jul 2019 07:04:14 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0B6BD96F50;
 Wed, 31 Jul 2019 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564571051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikT6SZrZG3n1LZKc3ZIc97g5lcB2v8DA7BPp9CMbDPs=;
 b=nrZ1RfgX6qrCoMJ1DSPiZdmNsBTpC1G+A2o7+kn7jv8hSuuTElW4kaL4TFiSD3LJnKA8Qn
 2rWjuTRRO4n1GMs9u/qDgKEHBOIHQA2Q90W2qunDOZrcJ0WfaDJn7wuGxUGHOCl46uCXeg
 0PsYunN7/gbXniT7IjB7V8KHsEUULh4=
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-7-damien.hedde@greensocs.com>
 <20190731060850.GE2032@umbus.fritz.box>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <89d90890-e5dc-d343-9c64-064a28b7b24e@greensocs.com>
Date: Wed, 31 Jul 2019 13:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190731060850.GE2032@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564571052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikT6SZrZG3n1LZKc3ZIc97g5lcB2v8DA7BPp9CMbDPs=;
 b=CXKg5NYT5rUcbdNf4V3ITeGToJPW0ZpaRj49ylhEEVEsPLoljoLrwKFL/bwohhwoJKoLvd
 Sb6CMP5XZEBjDY4szs2A01jjWDaZpql8095WUcwGmk4Ws3tQnFebBCAhCO9F5eM1cFwNkG
 Q/YT38kDaDbYspWsl7ZV8ssctpF9WUY=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564571052; a=rsa-sha256; cv=none;
 b=TMuHfoxEcXlK9kdBEl8VBheH/T0DDKgwkir4bZqMl0XutUY2UF3WHNv+2d2OSKRwenv2Ti
 i3/W4vZf38Cb0fFwqTw+JeLVub6TUu0hoZXu/ZveV3F0wGXRxzdTThc21He4VVVPsaQ+Ob
 nCqgpRV+yaMti3ZWJxw6JUaxsAEWV7E=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [PATCH v3 06/33] add the vmstate description for
 device reset state
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3pxiuqLfzGK8



On 7/31/19 8:08 AM, David Gibson wrote:
> On Mon, Jul 29, 2019 at 04:56:27PM +0200, Damien Hedde wrote:
>> It contains the resetting counter and cold flag status.
>>
>> At this point, migration of bus reset related state (counter and cold/warm
>> flag) is handled by parent device. This done using the post_load
>> function in the vmsd subsection.
>>
>> This is last point allow to add an initial support of migration with part of
>> qdev/qbus tree in reset state under the following condition:
>> + time-lasting reset are asserted on Device only
>>
>> Note that if this condition is not respected, migration will succeed and
>> no failure will occurs. The only impact is that the resetting counter
>> of a bus may lower afer a migration.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  hw/core/Makefile.objs  |  1 +
>>  hw/core/qdev-vmstate.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 hw/core/qdev-vmstate.c
>>
>> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
>> index d9234aa98a..49e9be0228 100644
>> --- a/hw/core/Makefile.objs
>> +++ b/hw/core/Makefile.objs
>> @@ -4,6 +4,7 @@ common-obj-y += bus.o reset.o
>>  common-obj-y += resettable.o
>>  common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
>>  common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
>> +common-obj-$(CONFIG_SOFTMMU) += qdev-vmstate.o
>>  # irq.o needed for qdev GPIO handling:
>>  common-obj-y += irq.o
>>  common-obj-y += hotplug.o
>> diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
>> new file mode 100644
>> index 0000000000..07b010811f
>> --- /dev/null
>> +++ b/hw/core/qdev-vmstate.c
>> @@ -0,0 +1,45 @@
>> +/*
>> + * Device vmstate
>> + *
>> + * Copyright (c) 2019 GreenSocs
>> + *
>> + * Authors:
>> + *   Damien Hedde
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/qdev.h"
>> +#include "migration/vmstate.h"
>> +
>> +static bool device_vmstate_reset_needed(void *opaque)
>> +{
>> +    DeviceState *dev = (DeviceState *) opaque;
>> +    return dev->resetting != 0;
>> +}
>> +
>> +static int device_vmstate_reset_post_load(void *opaque, int version_id)
>> +{
>> +    DeviceState *dev = (DeviceState *) opaque;
>> +    BusState *bus;
>> +    QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>> +        bus->resetting = dev->resetting;
> 
> Having redundant copies of the resetting bit in the bridge and every
> bus instance seems kind of bogus.

Currently we duplicate the resetting bit of parent into children when we
do the reset propagation into the tree. It means resetting count of an
device/bus contains the value of its parent plus any additional bit
local to the object (due to a reset from an gpio for example).

I'm not sure if we can avoid that. It would require the
"get_resetting_count" somehow to be recursive and fetch parent value and
so on. I need to work on it to know if it's really possible.

> 
>> +        bus->reset_is_cold = dev->reset_is_cold;
>> +    }
>> +    return 0;
>> +}
>> +
>> +const struct VMStateDescription device_vmstate_reset = {
>> +    .name = "device_reset",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .needed = device_vmstate_reset_needed,
>> +    .post_load = device_vmstate_reset_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(resetting, DeviceState),
>> +        VMSTATE_BOOL(reset_is_cold, DeviceState),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
> 
