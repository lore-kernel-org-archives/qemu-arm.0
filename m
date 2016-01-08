Received: by 10.182.158.201 with SMTP id ww9csp218450obb;
        Thu, 7 Jan 2016 16:05:21 -0800 (PST)
X-Received: by 10.140.156.197 with SMTP id c188mr147140134qhc.85.1452211521705;
        Thu, 07 Jan 2016 16:05:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x13si16492829qka.33.2016.01.07.16.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 16:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:33403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHKYS-0006XA-TB
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 19:05:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aHKY8-0006Fn-7r
	for qemu-devel@nongnu.org; Thu, 07 Jan 2016 19:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aHKY7-0004NA-0I
	for qemu-devel@nongnu.org; Thu, 07 Jan 2016 19:05:00 -0500
Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230]:36279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aHKY6-0004Mn-SD; Thu, 07 Jan 2016 19:04:58 -0500
Received: by mail-ob0-x230.google.com with SMTP id ba1so341253323obb.3;
	Thu, 07 Jan 2016 16:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GVCwpr5FSP2gCNAz/MM+PQqCa4mpxRIo08IqXX3c2EA=;
	b=kkfEfFZ6RTkYSBoQQtw2TBLNz1W3g27K6HBcYO2dPMAcIFkc2d6kHY87jCjqslFk0N
	ZJnYRjBq4D0p+YBm8Bg3HF3ecnzekvpAgswKQomWjvcllmEsuqX0HZh1FDeJ0l68d/4I
	FObBfnaP7C22JIxuVGy1A1P+f2fxxcrGtt09z9k1VLyo4XkON0nN55Rm8uB0Oi7BEbHB
	ioKXQCTkR2/RdZEhNQIcVLGRCKJVOvksVMLzHl3cORZgzoboMu/bDLyndq+ndaE9MLrN
	FwR09+RWz6adjq8DhZgzatjCTU/8EZ1rzw4/6Tg3MAlLoHCjCHvASzaQlLvojDb3+H7f
	lp1w==
X-Received: by 10.60.128.195 with SMTP id nq3mr46520316oeb.52.1452211498123;
	Thu, 07 Jan 2016 16:04:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 7 Jan 2016 16:04:28 -0800 (PST)
In-Reply-To: <CAPokK=pmpbMeHRg6Y_0HUrNRuG2F9Npx8pjzRTyTAEAgLpGQmg@mail.gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
	<CAKmqyKNVMfqJvZ3=X58yB5j8g=wtCzbHe6OU=1L4D3ZunMs3aA@mail.gmail.com>
	<CAPokK=pmpbMeHRg6Y_0HUrNRuG2F9Npx8pjzRTyTAEAgLpGQmg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Jan 2016 16:04:28 -0800
X-Google-Sender-Auth: a4t5Knn8zk3oA8leDHISvm-ul_o
Message-ID: <CAKmqyKMRSggRXY1U_2vY65TXuKs4RxBe4Rs-Jud7=iiPV1t9oA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::230
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v6 1/6] qdev: get_child_bus(): Use QOM
 lookup if available
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
X-TUID: 3x6X2Rol7Ctw

On Wed, Jan 6, 2016 at 4:25 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Wed, Jan 6, 2016 at 4:18 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Sat, Dec 19, 2015 at 9:43 PM, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> qbus_realize() adds busses as a QOM child of the device in addition to
>>> adding it to the qdev bus list. Change get_child_bus() to use the QOM
>>> child if it is available. This takes priority over the bus-list, but
>>> the child object is checked for type correctness.
>>
>> This doesn't cause problems for anything else? Is there anything else
>> with the same name or something where this causes conflicts?
>>
>
> Not that I know of, I'm just being defensive as it is core code. I
> suspect that that ignored failure path on the child setter is
> incorrect but I can't prove it beyond all doubt.

I just re-read what I said and it doesn't really make sense. My only
concern was busses with the same name somehow having conflicts that
weren't previously there. I can't think of any case where this would
happen though.

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
> Regards,
> Peter
>
>> Thanks,
>>
>> Alistair
>>
>>>
>>> This prepares support for aliasing of buses. The use case is SoCs,
>>> where a SoC container needs to present buses to the board level, but
>>> the buses are implemented by controller IP we already model as self
>>> contained qbus-containing devices.
>>>
>>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>> ---
>>> Currently qbus_realize() ignores errors from object_property_add_child,
>>> so it is hard to guarantee that the QOM linkage is reliable. If it were
>>> the case that that object_property_add_child was supposed to be error
>>> asserting, we could remove the old bus-list strcmp iterator altogether.
>>>
>>>  hw/core/qdev.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>>> index b3ad467..c96c464 100644
>>> --- a/hw/core/qdev.c
>>> +++ b/hw/core/qdev.c
>>> @@ -581,6 +581,12 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>>>  BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
>>>  {
>>>      BusState *bus;
>>> +    Object *child = object_resolve_path_component(OBJECT(dev), name);
>>> +
>>> +    bus = (BusState *)object_dynamic_cast(child, TYPE_BUS);
>>> +    if (bus) {
>>> +        return bus;
>>> +    }
>>>
>>>      QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>>>          if (strcmp(name, bus->name) == 0) {
>>> --
>>> 1.9.1
>>>
>>>
>
