Received: by 10.25.27.66 with SMTP id b63csp1463334lfb;
        Mon, 30 May 2016 04:35:21 -0700 (PDT)
X-Received: by 10.55.16.90 with SMTP id a87mr25246403qkh.111.1464608121208;
        Mon, 30 May 2016 04:35:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si1774330qta.130.2016.05.30.04.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 May 2016 04:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7LTc-0007BR-Kp
	for alex.bennee@linaro.org; Mon, 30 May 2016 07:35:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b7LTZ-0007Ab-0H
	for qemu-arm@nongnu.org; Mon, 30 May 2016 07:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b7LTU-0002c7-UB
	for qemu-arm@nongnu.org; Mon, 30 May 2016 07:35:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1b7LTU-0002c2-M3; Mon, 30 May 2016 07:35:12 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6A117DCD8;
	Mon, 30 May 2016 11:35:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4UBZ96s028933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 30 May 2016 07:35:10 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0E7781138645; Mon, 30 May 2016 13:35:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
Date: Mon, 30 May 2016 13:35:09 +0200
In-Reply-To: <CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	(Peter Maydell's message of "Wed, 25 May 2016 14:08:08 +0100")
Message-ID: <87fuszeq36.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 30 May 2016 11:35:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>, xiaoqiang zhao <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?utf-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+?= =?utf-8?B?0LI=?=
	<antonynpavlov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sEAuy4/lfYJC

Peter Maydell <peter.maydell@linaro.org> writes:

> On 25 May 2016 at 11:58, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> * drop qemu_char_get_next_serial and use chardev prop
>> * add pl011_create wrapper function to create pl011 uart device
>> * change affected board code to use the new way
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> ---
>>  hw/arm/bcm2835_peripherals.c | 16 +++-----------
>>  hw/arm/highbank.c            |  3 ++-
>>  hw/arm/integratorcp.c        |  5 +++--
>>  hw/arm/realview.c            |  9 ++++----
>>  hw/arm/stellaris.c           |  6 +++--
>>  hw/arm/versatilepb.c         |  9 ++++----
>>  hw/arm/vexpress.c            |  9 ++++----
>>  hw/arm/virt.c                |  1 +
>>  hw/char/pl011.c              | 11 +++++-----
>>  include/hw/char/pl011.h      | 52 ++++++++++++++++++++++++++++++++++++++++++++
>>  10 files changed, 86 insertions(+), 35 deletions(-)
>>  create mode 100644 include/hw/char/pl011.h
>>
>> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
>> index 234d518..46c320f 100644
>> --- a/hw/arm/bcm2835_peripherals.c
>> +++ b/hw/arm/bcm2835_peripherals.c
>> @@ -14,6 +14,7 @@
>>  #include "hw/misc/bcm2835_mbox_defs.h"
>>  #include "hw/arm/raspi_platform.h"
>>  #include "sysemu/char.h"
>> +#include "sysemu/sysemu.h"
>>
>>  /* Peripheral base address on the VC (GPU) system bus */
>>  #define BCM2835_VC_PERI_BASE 0x7e000000
>> @@ -106,7 +107,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>      MemoryRegion *ram;
>>      Error *err = NULL;
>>      uint32_t ram_size, vcram_size;
>> -    CharDriverState *chr;
>>      int n;
>>
>>      obj = object_property_get_link(OBJECT(dev), "ram", &err);
>> @@ -147,6 +147,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>>
>>      /* UART0 */
>> +    qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hds[0]);
>>      object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
>>      if (err) {
>>          error_propagate(errp, err);
>> @@ -158,17 +159,8 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>      sysbus_connect_irq(s->uart0, 0,
>>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>>                                 INTERRUPT_UART));
>> -
>>      /* AUX / UART1 */
>> -    /* TODO: don't call qemu_char_get_next_serial() here, instead set
>> -     * chardev properties for each uart at the board level, once pl011
>> -     * (uart0) has been updated to avoid qemu_char_get_next_serial()
>> -     */
>
> This comment says this should be fixed by having board-level
> properties; you've removed it but this patch isn't adding
> the properties to this (SoC-level) device. I think the board
> level should be looking at serial_hds[], not this code.

Device models should not fish backends out of global state.  Whether
they fish directly or via some helper like qemu_char_get_next_serial()
doesn't matter.  The ones that still do need to set
cannot_instantiate_with_device_add_yet with a suitable comment.

>> @@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc, void *data)
>>
>>      dc->realize = pl011_realize;
>>      dc->vmsd = &vmstate_pl011;
>> -    /* Reason: realize() method uses qemu_char_get_next_serial() */
>> -    dc->cannot_instantiate_with_device_add_yet = true;
>
> Why does instantiating with device_add work now? There's
> still no way to wire up interrupt lines or map mmio regions.
> (This has never made much sense to me -- Markus?)

Uh, which part does "this" refer to?

I systematically reviewed devices for my "Clean up and fix no_user"
series (commit f976b09..7ea5e78), and wrote down my findings in
"Reason:" comments next to cannot_instantiate_with_device_add_yet
assignments.  Any such assignment must have such a comment.

Testing can catch cases where we missed *all* reasons.  Example: my "Fix
device introspection regressions" series (commit b37686f..33fe968).  It
can't catch cases where we missed *some* reasons.

Note that cannot_instantiate_with_device_add_yet can get set by
(possibly abstract) parent devices as well.  If a parent device sets it,
its children should nevertheless set it *again* if they have additional
reasons.  I believe this is such a case.  I'm not 100% sure, because I
haven't been 100% sure about anything related to sysbus devices ever
since Alex's commit 33cd52b "sysbus: Make devices spawnable via -device"
dropped cannot_instantiate_with_device_add_yet from
sysbus_device_class_init(), quoted below.  As you see, that assignment
covered "no way to wire up interrupt lines or map mmio regions."


diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 19437e6..7bfe381 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -283,13 +283,6 @@ static void sysbus_device_class_init(ObjectClass *klass, vo
id *data)
     DeviceClass *k = DEVICE_CLASS(klass);
     k->init = sysbus_device_init;
     k->bus_type = TYPE_SYSTEM_BUS;
-    /*
-     * device_add plugs devices into suitable bus.  For "real" buses,
-     * that actually connects the device.  For sysbus, the connections
-     * need to be made separately, and device_add can't do that.  The
-     * device would be left unconnected, and could not possibly work.
-     */
-    k->cannot_instantiate_with_device_add_yet = true;
 }
 
