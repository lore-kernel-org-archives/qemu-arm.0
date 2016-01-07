Received: by 10.182.158.201 with SMTP id ww9csp271430obb;
        Wed, 6 Jan 2016 16:25:17 -0800 (PST)
X-Received: by 10.140.106.165 with SMTP id e34mr4938980qgf.23.1452126317647;
        Wed, 06 Jan 2016 16:25:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si115085936qhx.98.2016.01.06.16.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 16:25:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGyOD-0004RQ-BG
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 19:25:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGyOB-0004O8-65
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 19:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGyOA-0000Dm-2p
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 19:25:15 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:34261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGyO7-0000AS-La; Wed, 06 Jan 2016 19:25:11 -0500
Received: by mail-wm0-x230.google.com with SMTP id u188so79316346wmu.1;
	Wed, 06 Jan 2016 16:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VD+1TqE85ab2irubCjoV5Dt6b1k1vH6wGYmPrjG65nk=;
	b=lPPauNx/xlc1Npgx6XG/olVvaQt3jsZhKpye228S4cJLH5OPszdIdM7wki21VR/Jwi
	xNtM0ibrLSdi/bv0MK2RplOhccr3T/9XyRcLlf1CRjxvyzfc1sVOjqI73nflBiBoqfzS
	mDJRg1B4piToqHkii784AyfQ7TZHImmPyvF1Q9qPX7ZRYKhSY/sHyv/uhAu1y8abp/UY
	xaCAznm8CtyT+7f6hDcA+mix4952lVn5VfbMRYBeX6d9pacsiEsYfYzdv0Qjjg6s2ayd
	Q/B2j2gkShkeArHjzXouyOHB0Kjv85+NmPFcR8juXuI7XoJMP070eRivohpwPvNQHAmT
	E/Sw==
MIME-Version: 1.0
X-Received: by 10.28.63.22 with SMTP id m22mr12313471wma.59.1452126310858;
	Wed, 06 Jan 2016 16:25:10 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 6 Jan 2016 16:25:10 -0800 (PST)
In-Reply-To: <CAKmqyKNVMfqJvZ3=X58yB5j8g=wtCzbHe6OU=1L4D3ZunMs3aA@mail.gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
	<CAKmqyKNVMfqJvZ3=X58yB5j8g=wtCzbHe6OU=1L4D3ZunMs3aA@mail.gmail.com>
Date: Wed, 6 Jan 2016 16:25:10 -0800
Message-ID: <CAPokK=pmpbMeHRg6Y_0HUrNRuG2F9Npx8pjzRTyTAEAgLpGQmg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 1/6] qdev: get_child_bus():
 Use QOM lookup if available
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J0zoXA3xgUkR

On Wed, Jan 6, 2016 at 4:18 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Sat, Dec 19, 2015 at 9:43 PM, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> qbus_realize() adds busses as a QOM child of the device in addition to
>> adding it to the qdev bus list. Change get_child_bus() to use the QOM
>> child if it is available. This takes priority over the bus-list, but
>> the child object is checked for type correctness.
>
> This doesn't cause problems for anything else? Is there anything else
> with the same name or something where this causes conflicts?
>

Not that I know of, I'm just being defensive as it is core code. I
suspect that that ignored failure path on the child setter is
incorrect but I can't prove it beyond all doubt.

Regards,
Peter

> Thanks,
>
> Alistair
>
>>
>> This prepares support for aliasing of buses. The use case is SoCs,
>> where a SoC container needs to present buses to the board level, but
>> the buses are implemented by controller IP we already model as self
>> contained qbus-containing devices.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>> Currently qbus_realize() ignores errors from object_property_add_child,
>> so it is hard to guarantee that the QOM linkage is reliable. If it were
>> the case that that object_property_add_child was supposed to be error
>> asserting, we could remove the old bus-list strcmp iterator altogether.
>>
>>  hw/core/qdev.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index b3ad467..c96c464 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -581,6 +581,12 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>>  BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
>>  {
>>      BusState *bus;
>> +    Object *child = object_resolve_path_component(OBJECT(dev), name);
>> +
>> +    bus = (BusState *)object_dynamic_cast(child, TYPE_BUS);
>> +    if (bus) {
>> +        return bus;
>> +    }
>>
>>      QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>>          if (strcmp(name, bus->name) == 0) {
>> --
>> 1.9.1
>>
>>
